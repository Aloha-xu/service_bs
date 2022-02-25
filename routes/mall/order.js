const express = require("express");
const router = express.Router();
const uuidv1 = require("uuid/v1");
// 数据库
let db = require("../../config/mysql");

/**
 *
 * 有必要的这个接口 ，还需要判断库里面商品还有没有货，因为可能你加入购物车的时候有货，但是过几天再买就没货，可能在一两面内就没货了。我的购物车那里也有判断有没有货，但是需要刷新 ，所以还是需要确认订单页面的商品数据冲数据库里面拿。
 *
 * @api {post} /api/order/checkout 获取"确认订单"页面的数据
 * @apiDescription 点击结算按钮之后传参至"确认订单"，此API返回"确认订单"页面需要的数据，此时订单需要用户确认商品价格、数量、支付金额，收货地址在此页面选择或者修改
 * @apiName SettleOrder
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number[]} goods 欲购买商品id，格式：[id1,id2,id3];
 *
 * @apiSampleRequest /api/order/settle
 */
router.post("/checkout", async (req, res) => {
  let { goods } = req.body;
  let { openid } = req.user;
  let orderTotalPrice = 0,
    freightPrice = 0,
    goodsCount = 0,
    goodsTotalPrice = 0,
    actualPrice = 0,
    checkedAddress = {},
    checkedGoodsList = [],
    outStock;
  //   let data = {};
  let sql = `SELECT * FROM address WHERE openid =? AND isDefault = 1 LIMIT 1`;
  checkedAddress = await db.query(sql, openid);
  sql = `SELECT * FROM goods JOIN cart ON goods.goodsId = cart.goodsId WHERE cart.openid = ? AND cart.goodsId IN (?)`;
  // sql = `SELECT g.goodsId,g.name,g.price,g.img,c.goodsNumber,g.inventory FROM goods g JOIN cart c ON g.goodsId = c.goodsId  WHERE c.openid = ? AND c.goodsId IN (?)`;
  checkedGoodsList = await db.query(sql, [openid, goods]);
  checkedGoodsList.forEach(function (v) {
    goodsCount += v.goodsNumber;
    goodsTotalPrice += v.goodsNumber * v.price;
  });
  //快递费 满200包邮
  if (goodsTotalPrice >= 200) {
    freightPrice = 0;
  } else {
    freightPrice = goodsCount * 10;
  }
  //订单总价 goodsTotalPrice +  freightPrice
  orderTotalPrice = goodsTotalPrice + freightPrice;
  //实际需要支付的总价 优惠券
  actualPrice = orderTotalPrice;

  //是否无货了
  outStock = checkedGoodsList.some((i) => {
    return i.inventory >= 0;
  });

  res.json({
    status: true,
    msg: "success!",
    data: {
      checkedGoodsList,
      checkedAddress: checkedAddress[0],
      actualPrice,
      freightPrice,
      goodsTotalPrice,
      orderTotalPrice,
      goodsCount,
      outStock: outStock ? 1 : 0,
      addressId: checkedAddress[0].id,
    },
    errno: 0,
  });
});

/**
 * @api {post} /api/order/submit 提交订单->生成订单
 * @apiDescription 在确认订单页面，提交订单按钮意味着将购物车中的商品转移到订单中，生成新的订单，称之为下单操作；
 * 查找对应的商品库存
 * uuidv1生成订单号
 * CURRENT_TIMESTAMP() 生成创建时间
 * 移除购物车对应的商品 [1,2]
 * @apiName CreateOrder
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number} actualPay 支付金额,小数点至2位;
 * @apiParam {Number} addressId 收货地址id;
 * @apiParam {Object[]} goodsList 商品数组,包含每一个商品的id,数量，例：[{id:15,num:1},{id:16,num:2}];
 * @apiParam {Number} goodsList.id 商品id;
 * @apiParam {Number} goodsList.num 商品数量;
 * @apiSampleRequest /api/order/submit
 *
 *    ···········这个接口生成的订单数据状态是0 都是0的 就是买家未付款·············
 *              等待后面接口修改状态吧
 *
 */
router.post("/submit", async (req, res) => {
  // 准备查询的商品id,方便使用IN
  let queryGid = [];
  let { addressId, actualPay, goodsList, note, freightPrice } = req.body;
  let { openid } = req.user;
  goodsList.forEach(function (item) {
    queryGid.push(item.goodsId);
  });
  // 检查库存是否充足 需要判断 哪一个商品没货了
  let sql = `SELECT inventory FROM goods WHERE goodsId IN (?)`;

  let results = await db.query(sql, queryGid);

  // every碰到第一个为false的，即终止执行
  let isAllPassed = results.every(function (item, index) {
    let isPassed = item.inventory >= goodsList[index].num;
    if (isPassed == false) {
      res.json({
        status: false,
        msg: `id为${goodsList[index].id}的商品，库存不足!`,
        data: {
          id: goodsList[index].id,
        },
      });
    }
    return isPassed;
  });

  // 库存不足,终止执行
  if (isAllPassed == false) {
    return;
  }

  // 库存充足,对应商品减库存,拼接SQL
  sql = `UPDATE goods SET inventory = CASE goodsId `;
  goodsList.forEach((item) => {
    sql += `WHEN ${item.goodsId} THEN inventory - ${item.num} `;
  });
  sql += `END WHERE goodsId IN (${queryGid});`;
  results = await db.query(sql);
  if (results.changedRows <= 0) {
    res.json({
      msg: `${results.changedRows} rows changed!`,
      errno: 1,
    });
    return;
  }

  //uuid生成随机的订单编号
  let orderId = uuidv1();

  // 订单表中生成新订单  还有一些数据没插进去
  sql = `INSERT INTO orders (orderId,openid,actualPay,createTime,note,freightPrice,addressId) VALUES (?,?,?,CURRENT_TIMESTAMP(),?,?,?)`;

  results = await db.query(sql, [
    orderId,
    openid,
    actualPay,
    note,
    freightPrice,
    addressId,
  ]);
  if (results.affectedRows <= 0) {
    res.json({
      msg: `${results.affectedRows} rows changed!`,
      errno: 1,
      errMsg: "插入失败",
    });
    return;
  }

  // 购物车对应商品复制到order_goods表中，carts表删除对应商品
  //多个商品的时候就需要循环
  goodsList.forEach(async (item) => {
    sql = `INSERT INTO order_goods (orderId, goodsId, goodsNumber) VALUES (?,?,?)`;
    results = await db.query(sql, [orderId, item.goodsId, item.num]);
    if (results.affectedRows <= 0) {
      res.json({
        msg: "fasle",
        errno: 1,
        errMsg: "插入失败",
      });
      return;
    }
  });

  sql = `DELETE FROM cart WHERE openid = ? AND goodsId IN (?)`;
  results = await db.query(sql, [openid, queryGid]);
  if (results.affectedRows <= 0) {
    res.json({
      msg: "fasle",
      errno: 1,
      errMsg: "删除失败",
    });
    return;
  }
  res.json({
    msg: "success",
    errno: 0,
    data: orderId,
  });

  //   // 购物车对应商品复制到order_goods表中，carts表删除对应商品
  //   sql = `INSERT INTO order_goods ( orderId, goodsId, goodsNumber, price )

  //         SELECT ( ? ), c.goodsId, c.goodsNumber, g.price
  //         FROM cart c JOIN goods g ON g.goodsId = c.goodsId
  //         WHERE c.openid = ? AND c.goodsId IN (?);

  //         DELETE FROM cart WHERE openid = ? AND goodsId IN (?)`;

  //         results = await db.query(sql, [openid, actualPay]);

  //   // 提取新订单id
  //   let { insertId } = results;
  //   // 存储收货地址快照
  //   let sql = `INSERT INTO order_address ( order_id, name, tel, province, city, county, street, code )
  //                    SELECT ( ? ), name, tel, province, city, county, street, code
  //                    FROM address WHERE id = ?`;
  //   connection.query(
  //     sql,
  //     [insertId, addressId],
  //     function (error, results, fields) {
  //       if (error || results.affectedRows <= 0) {
  //         return connection.rollback(function () {
  //           throw error || `${results.affectedRows} rows affected!`;
  //         });
  //       }

  //       connection.query(
  //         sql,
  //         [insertId, openid, queryGid, openid, queryGid],
  //         function (error, results, fields) {
  //           if (error || results.affectedRows <= 0) {
  //             return connection.rollback(function () {
  //               throw error || `${results.affectedRows} rows affected!`;
  //             });
  //           }
  //           connection.commit(function (err) {
  //             if (err) {
  //               return connection.rollback(function () {
  //                 throw err;
  //               });
  //             }
  //             res.json({
  //               status: true,
  //               msg: "success!",
  //               data: {
  //                 order_id: insertId,
  //               },
  //             });
  //           });
  //         }
  //       );
  //     }
  //   );
});

/**
 *
 *  改变订单状态接口
 *
 *
 */
router.post("/updataState", async (req, res) => {
  let { code, orderId } = req.body;
  let { openid } = req.user;

  let sql = `UPDATE orders SET orderState = ? WHERE orderId = ? AND openid = ?`;
  let results = await db.query(sql, [code, orderId, openid]);
  if (results.affectedRows <= 0) {
    res.json({
      msg: `更新失败!`,
      errno: 1,
    });
    return;
  }
  res.json({
    msg: `更新成功!`,
    errno: 0,
  });
});

/**
 * @api {get} /api/order/list 获取订单列表
 * @apiDescription 本账户uid中的订单列表，根据订单状态获取列表，具备分页功能
 * @apiName OrderList
 * @apiGroup Order
 * @apiPermission user
 *
 * @apiParam {Number} [pageSize] 一个页有多少个商品,默认4个;
 * @apiParam {Number} [pageIndex] 第几页,默认1;
 * @apiParam {Number=0,3,4,5,all} status 订单状态:0-待付款，3-待发货，4-待收货，5-待评价，all-所有状态;
 *
 * @apiSampleRequest /api/order/list
 */
router.get("/list", function (req, res) {
  let { pageSize = 4, pageIndex = 1, status = "all" } = req.query;
  let { openid } = req.user;
  let size = parseInt(pageSize);
  let count = size * (pageIndex - 1);
  // 查询所有订单
  let sql = `SELECT o.id, o.create_time, o.actualPay, os.text AS status
		 FROM orders o JOIN order_status os ON o.order_state = os.CODE
		 WHERE o.uid = ? ORDER BY o.create_time DESC LIMIT ? OFFSET ? `;
  // 根据订单状态查询
  if (status != "all") {
    sql = `SELECT o.id, o.create_time, o.actualPay, os.text AS status
			 FROM orders o JOIN order_status os ON o.order_state = os.CODE
			 WHERE o.uid = ? AND o.order_state = ${status} ORDER BY o.create_time DESC LIMIT ? OFFSET ?`;
  }
  db.query(sql, [openid, size, count], function (orders) {
    // 查询订单商品信息
    let sql = `SELECT g.id, o.id AS order_id, g.name, g.img_md, og.goods_num, og.goods_price
			 FROM orders o JOIN order_goods og ON o.id = og.order_id
			 JOIN goods g ON g.id = og.goods_id
			 WHERE o.uid = ?`;
    if (status != "all") {
      sql += ` AND o.order_state = ${status}`;
    }
    db.query(sql, [openid], (goods) => {
      orders.forEach((order) => {
        order.goodsList = goods.filter((item) => order.id == item.order_id);
      });
      //成功
      res.json({
        status: true,
        msg: "success!",
        orders,
      });
    });
  });
});

module.exports = router;

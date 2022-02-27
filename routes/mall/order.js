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
  let { addressId, goodsPrices, goodsList, note, freightPrice } = req.body;
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
  sql = `INSERT INTO orders (orderId,openid,goodsPrices,createTime,note,freightPrice,addressId) VALUES (?,?,?,unix_timestamp(CURRENT_TIMESTAMP()),?,?,?)`;

  results = await db.query(sql, [
    orderId,
    openid,
    goodsPrices,
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


});

/**
 *
 *  改变订单状态接口
 *  
 *  订单状态:0-待付款，1-待发货 买家付款成功，2-待收货 卖家已发货，7-所有状态;
 */
router.post("/updataState", async (req, res) => {
  let { orderState, orderId } = req.body;
  let { openid } = req.user;

  let sql = `UPDATE orders SET orderState = ? , updateTime = unix_timestamp(CURRENT_TIMESTAMP())`;

  // if(orderState == 0){
  //   //就是还没给钱 payTime 还是null
  //   sql += ``
  // }
  if (orderState == 1) {
    //给了钱了 那么paytime就应该更新
    sql += `,payTime = unix_timestamp(CURRENT_TIMESTAMP())`
  }
  // else if(orderState == 2){
  //   //这个发货时间应该是在后台更新的
  // }

  sql += ` WHERE orderId = ? AND openid = ?`

  console.log(sql);

  let results = await db.query(sql, [orderState, orderId, openid]);
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
 * @apiParam  status 订单状态:0-待付款，1-待发货 买家付款成功，2-待收货 卖家已发货，7-所有状态;
 *
 * @apiSampleRequest /api/order/list
 */
router.post("/list", async (req, res) => {
  let { status = 7 } = req.body;
  let { openid } = req.user;
  // 查询所有订单
  let sql = `SELECT o.orderId, o.createTime, o.goodsPrices, os.text AS status , o.freightPrice , os.orderState As code
		 FROM orders o JOIN order_status os ON o.orderState = os.orderState
		 WHERE o.openid = '${openid}' ORDER BY o.createTime DESC`;
  // 根据订单状态查询
  if (status != 7) {
    sql = `SELECT o.orderId, o.createTime, o.goodsPrices, os.text AS status , o.freightPrice , os.orderState As code
    FROM orders o JOIN order_status os ON o.orderState = os.orderState
    WHERE o.openid = '${openid}' AND o.orderState = ${status} ORDER BY o.createTime DESC`;
  }
  let orders = await db.query(sql)

  // 查询订单商品信息
  sql = `SELECT g.goodsId, o.orderId , g.name, g.img, og.goodsNumber, g.price
  FROM orders o JOIN order_goods og ON o.orderId = og.orderId
  JOIN goods g ON g.goodsId = og.goodsId
  WHERE o.openid = '${openid}'`;
  if (status != 7) {
    sql += ` AND o.orderState = ${status}`;
  }

  let goods = await db.query(sql)
  orders.forEach((order) => {
    let goodscount = 0
    order.goodsList = goods.filter((item) => {
      if (order.orderId == item.orderId) {
        goodscount = item.goodsNumber + goodscount
        return true
      }
    });
    order.goodsCount = goodscount
  });
  //成功
  res.json({
    status: true,
    msg: "success!",
    data: orders,
    errno: 0
  });

});

/**
 * @api {get} /api/order/detail 获取订单详情
 *  orderId
 */
router.post("/detail", async (req, res) => {
  let { orderId } = req.body;
  let { openid } = req.user;

  let sql = `SELECT o.createTime, o.goodsPrices, os.text AS status , o.freightPrice , os.orderState As code ,o.addressId, o.note ,o.orderId,o.finishTime,o.shipTime,o.payTime,o.receivedTime
    FROM orders o JOIN order_status os ON o.orderState = os.orderState
		 WHERE o.orderId = '${orderId}'`;

  let orderInfo = await db.query(sql)

  let { addressId } = orderInfo[0]

  sql = `SELECT * FROM address WHERE id = ${addressId} `;

  let addressInfo = await db.query(sql)

  // 查询订单商品信息
  sql = `SELECT g.goodsId, g.name, g.img, og.goodsNumber, g.price
  FROM orders o JOIN order_goods og ON o.orderId = og.orderId
  JOIN goods g ON g.goodsId = og.goodsId
  WHERE o.orderId = '${orderId}'`;

  let orderGoods = await db.query(sql)



  //成功
  res.json({
    status: true,
    msg: "success!",
    data: {
      orderGoods,
      orderInfo: orderInfo[0],
      addressInfo: addressInfo[0]
    },
    errno: 0
  });

});




module.exports = router;

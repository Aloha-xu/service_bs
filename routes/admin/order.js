const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");
/**
 * @api {get} /api/admin/order/list 获取所有账户订单列表
 * @apiDescription 获取系统中的订单列表，根据订单状态获取列表，具备分页功能
 *
 * @apiParam {Number} [pageSize] 一个页有多少个商品,默认4个;
 * @apiParam {Number} [pageIndex] 第几页,默认1;
 * @apiParam {Number=0,3,4,5,all} status 订单状态:0-待付款，3-待发货，4-待收货，5-待评价，all-所有状态;
 *
 * @apiSampleRequest /api/admin/order/list
 */
router.post("/list", async (req, res) => {
  let { pageSize = 4, pageIndex = 1, status = 7 } = req.body;
  let size = parseInt(pageSize);
  let count = size * (pageIndex - 1);
  // 查询所有订单
  let sql = `SELECT o.orderId, o.createTime, o.goodsPrices, os.text AS status , o.refundReason , o.freightPrice , os.orderState As code
		   FROM orders o JOIN order_status os ON o.orderState = os.orderState
		   WHERE 1 = 1 ORDER BY o.createTime DESC LIMIT ${size} OFFSET ${count}`;
  // 根据订单状态查询
  if (status != 7) {
    sql = `SELECT o.orderId, o.createTime, o.goodsPrices, os.text AS status , o.freightPrice , os.orderState As code
	  FROM orders o JOIN order_status os ON o.orderState = os.orderState
	  WHERE 1 = 1 AND o.orderState = ${status} ORDER BY o.createTime DESC LIMIT ${size} OFFSET ${count}`;
  }
  let orders = await db.query(sql);

  // 查询订单商品信息
  sql = `SELECT g.goodsId, o.orderId , g.name, g.img, og.goodsNumber, g.price
	FROM orders o JOIN order_goods og ON o.orderId = og.orderId
	JOIN goods g ON g.goodsId = og.goodsId
	WHERE 1 = 1`;
  if (status != 7) {
    sql += ` AND o.orderState = ${status}`;
  }

  let goods = await db.query(sql);
  orders.forEach((order) => {
    let goodscount = 0;
    order.goodsList = goods.filter((item) => {
      if (order.orderId == item.orderId) {
        goodscount = item.goodsNumber + goodscount;
        return true;
      }
    });
    order.goodsCount = goodscount;
  });
  //成功
  res.json({
    status: true,
    msg: "success!",
    data: orders,
    errno: 0,
  });
});

/**
 *
 * 	商品发货 /api/admin/order/ship
 *
 * 	orderState = 2  快递号码shipNumber    快递公司shipName   发货时间 shipTime   更新时间updateTime
 *
 * 	orderId
 *
 */

router.post("/ship", async (req, res) => {
  let { shipNumber, shipName, orderId } = req.body;
  let sql = `UPDATE orders SET shipNumber = '${shipNumber}' ,shipName = '${shipName}' , shipTime = unix_timestamp(CURRENT_TIMESTAMP()) , updateTime = unix_timestamp(CURRENT_TIMESTAMP()) , orderState = 2 WHERE orderId = '${orderId}'`;
  let results = await db.query(sql);
  if (results.affectedRows <= 0) {
    res.json({
      status: false,
      msg: "fail!",
    });
    return;
  }
  res.json({
    status: true,
    msg: "success!",
  });
});

/**
 *
 * 	管理员确认商品退货 /api/admin/order/refund
 *
 * 	orderState = 5 - s  8 - f
 *   更新时间updateTime
 * orderId
 *
 * 	拒绝退款之后是返回之前的状态？ 3已收货/2未收货  还是8 退货失败 ？？？？？  返回之前的状态你得存有之前的状态!!!
 */

router.post("/refund", async (req, res) => {
  let { orderState, orderId } = req.body;
  let sql = `UPDATE orders SET orderState = ${orderState} , updateTime = unix_timestamp(CURRENT_TIMESTAMP()) WHERE orderId='${orderId}'`;
  let results = await db.query(sql);
  if (results.affectedRows <= 0) {
    res.json({
      status: false,
      msg: "fail!",
    });
    return;
  }
  res.json({
    status: true,
    msg: "success!",
  });
});

/**
 *
 * 	取消订单 /api/admin/order/cancel
 *
 * 	orderState = 6     更新时间updateTime
 * 	orderId
 *
 *  客户只可以在没给钱前才可以取消订单
 *  管理员 可以在任意时候取消 已发货就退回来 收了钱就返回钱
 *
 */

router.post("/cancel", async (req, res) => {
  let { orderId } = req.body;
  let sql = `UPDATE orders SET orderState = 6 , updateTime = unix_timestamp(CURRENT_TIMESTAMP()) WHERE orderId='${orderId}'`;
  let results = await db.query(sql);
  if (results.affectedRows <= 0) {
    res.json({
      status: false,
      msg: "fail!",
    });
    return;
  }
  res.json({
    status: true,
    msg: "success!",
  });
});

/**
 *
 * 	订单详情  /api/admin/order/detail
 *
 * 	订单什么是可以编辑的？
 * 	 	备注
 * 		商品价格 邮费 需要是在没给钱之前才能修改
 * 		快递公司 快递单号 需要在还没发货之前才能修改
 *
 *	orderId
 */

router.post("/detail", async (req, res) => {
  let { orderId } = req.body;

  let sql = `SELECT o.createTime, o.goodsPrices, os.text AS status , o.freightPrice , os.orderState As code ,o.addressId, o.note ,o.orderId,o.finishTime,o.shipTime,o.payTime,o.receivedTime,o.closeTime,o.shipName,o.shipNumber
    FROM orders o JOIN order_status os ON o.orderState = os.orderState
		 WHERE o.orderId = '${orderId}'`;

  let orderInfo = await db.query(sql);

  let { addressId } = orderInfo[0];

  sql = `SELECT * FROM address WHERE id = ${addressId} `;

  let addressInfo = await db.query(sql);

  // 查询订单商品信息
  sql = `SELECT g.goodsId, g.name, g.img, og.goodsNumber, g.price
  FROM orders o JOIN order_goods og ON o.orderId = og.orderId
  JOIN goods g ON g.goodsId = og.goodsId
  WHERE o.orderId = '${orderId}'`;

  let orderGoods = await db.query(sql);

  //成功
  res.json({
    status: true,
    msg: "success!",
    data: {
      orderGoods,
      orderInfo: orderInfo[0],
      addressInfo: addressInfo[0],
    },
  });
});

/**
 *  修改订单的信息  /api/admin/order/update
 */

router.post("/update", async (req, res) => {
  let {
    shipNumber = "",
    shipName = "",
    orderId,
    note,
    freightPrice,
  } = req.body;
  let sql = `UPDATE orders SET shipNumber = '${shipNumber}' ,shipName = '${shipName}' , updateTime = unix_timestamp(CURRENT_TIMESTAMP()) , note = '${note}' , freightPrice = ${freightPrice} WHERE orderId = '${orderId}'`;

  let results = await db.query(sql);
  if (results.affectedRows <= 0) {
    res.json({
      status: false,
      msg: "fail!",
    });
    return;
  }
  res.json({
    status: true,
    msg: "success!",
  });
});

module.exports = router;

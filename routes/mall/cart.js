const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {post} /api/cart/add 添加商品至购物车
 * @apiName AddCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 商品id;
 * @apiParam {Number} num 商品数量,不能超过库存;
 *
 * @apiSampleRequest /api/cart
 */
router.post("/add", async (req, res) => {
  let { goodsId, number } = req.body;
  let { openid } = req.user;
  // 检查购物车是否已经有此商品
  let sql = `SELECT * FROM cart WHERE goodsId = ${goodsId} AND openid = '${openid}'`;
  let results = await db.query(sql);
  // 没有此商品,插入新纪录
  sql = `INSERT INTO cart ( openid , goodsId , goodsNumber , createTime ) VALUES ( '${openid}' , ${goodsId} , ${number} ,CURRENT_TIMESTAMP())`;
  // 已有此商品，增加数量
  if (results.length > 0) {
    sql = `UPDATE cart SET goodsNumber = goodsNumber + ${number} , updateTime = CURRENT_TIMESTAMP() WHERE goodsId = ${goodsId} AND openid = '${openid}'`;
  }
  results = await db.query(sql);
  if (results.affectedRows > 0) {
    res.json({
      msg: "success!",
      errno: 0,
    });
  } else {
    res.json({
      msg: "加入购物车失败!",
      errno: 1,
    });
  }
});
/**
 * @api {get} /api/cart/list 获取购物车列表
 * @apiName CartList
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiSampleRequest /api/cart/list
 */
router.post("/list", async (req, res) => {
  let { openid } = req.user;
  let data = {};
  let sql = `SELECT cart.cartId, cart.goodsId, goods.img, goods.name, goods.price, cart.goodsNumber, goods.state FROM cart JOIN goods WHERE cart.openid = '${openid}' AND cart.goodsId = goods.goodsId`;
  data.cartList = await db.query(sql);
  res.json({
    msg: "success!",
    data,
    errno: 0,
    status: true,
  });
});
/**
 * @api {delete} /api/cart/delete/:id 购物车删除商品
 * @apiName DeleteCart
 * @apiGroup Cart
 * @apiPermission user
 *
 * @apiParam {Number} id 购物车条目id;
 *
 * @apiSampleRequest /api/cart
 */
router.post("/delete", async (req, res) => {
  let { cartId } = req.body;
  let sql = `DELETE FROM cart WHERE cartId = ${cartId}`;
  results = await db.query(sql);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      msg: "success!",
      errno: 0,
    });
  }
});

/**
 * @api {put} /api/cart/update/:id
 * @apiDescription 更新商品数量
 */
router.post("/update", async (req, res) => {
  let data = {};
  let { goodsNumber, cartId, goodsId } = req.body;
  let { openid } = req.user;
  //判断库存够不够
  let sql = `SELECT inventory FROM goods WHERE goodsId = ${goodsId}`;
  let goodsnumber = await db.query(sql);
  console.log(goodsnumber);
  if (goodsnumber[0].inventory < goodsNumber) {
    //库存不住
    res.json({
      status: false,
      msg: "库存不足!",
      erron: 1,
    });
    return;
  }

  sql = `UPDATE cart SET goodsNumber = ${goodsNumber} WHERE cartId = ${cartId}`;
  results = await db.query(sql);

  sql = `SELECT cart.cartId, cart.goodsId, goods.img, goods.name, goods.price, cart.goodsNumber, goods.state FROM cart JOIN goods WHERE cart.openid = '${openid}' AND cart.goodsId = goods.goodsId`;
  data.cartList = await db.query(sql);

  if (results.affectedRows > 0) {
    res.json({
      data: data,
      msg: "success!",
      errno: 0,
    });
  }
});

/**
 * @api {put} /api/cart/goodsCartCount
 * @apiDescription 获取商品数量
 */
router.post("/goodsCartCount", async (req, res) => {
  let data = {
    cartTotal: {},
  };
  let { openid } = req.user;
  let sql = `SELECT count(*) as goodsCount FROM cart WHERE openid = '${openid}'`;
  let count = await db.query(sql);
  data.cartTotal.goodsCount = count[0].goodsCount;
  res.json({
    data: data,
    msg: "success!",
    errno: 0,
  });
});

// /**
//  * @api {put} /api/cart/checked
//  * @apiDescription 选择或取消选择商品
//  */
// router.post("/checked", async (req, res) => {
//   let { cartId, isChecked } = req.body;

//   sql = `UPDATE cart SET checked = ${isChecked} WHERE cartId = ${cartId}`;
//   let count = await db.query(sql);
//   if (results.affectedRows > 0) {
//     res.json({
//       data: data,
//       msg: "success!",
//       errno: 0,
//     });
//   }
// });

module.exports = router;

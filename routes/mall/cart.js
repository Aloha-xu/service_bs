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
    sql = `UPDATE cart SET goodsNumber = goodsNumber + ${number} WHERE goodsId = ${goodsId} AND openid = '${openid}'`;
  }
  results = await db.query(sql);
  if (results.length > 0) {
    res.json({
      status: true,
      msg: "success!",
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
  let sql = `SELECT cart.cartId, cart.goodsId, goods.img, goods.name, goods.price, cart.goodsNumber FROM cart JOIN goods WHERE cart.openid = '${openid}' AND cart.goodsId = goods.goodsId`;
  let cartList = await db.query(sql);
  res.json({
    status: true,
    msg: "success!",
    data: cartList,
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
router.post("/del", async (req, res) => {
  let { id } = req.body;
  let sql = `DELETE FROM cart WHERE cartId = ${id}`;
  results = await db.query(sql);
  if (results.length > 0) {
    res.json({
      status: true,
      msg: "success!",
    });
  }
});

/**
 * @api {put} /api/cart/update/:id
 * @apiDescription 更新商品数量
 */
router.post("/update", async (req, res) => {
  let { goodsNumber, cartId, goodsId } = req.body;
  //判断库存够不够
  let sql = `SELECT inventory FROM goods WHERE goodsId = ${goodsId}`;
  let goodsnumber = await db.query(sql, [goodsNumber, cartId]);
  if (goodsnumber < goodsNumber) {
    //库存不住
    res.json({
      status: false,
      msg: "库存不足!",
    });
    return;
  }
  sql = `UPDATE cart SET goodsNumber = goodsNumber ${goodsNumber} WHERE cartId = ${cartId}`;
  results = await db.query(sql);
  if (results.length > 0) {
    res.json({
      status: true,
      msg: "success!",
    });
  }
});

module.exports = router;

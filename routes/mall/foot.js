const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {post} /api/foot/add 添加商品至我的足迹
 */
router.post("/add", async (req, res) => {
  let { id } = req.body;
  let { openid } = req.user;
  console.log(id);
  //处理重复插入
  let sql = `SELECT goodsId from foot_print WHERE openid = '${openid}'`;
  let goodsIds = await db.query(sql);
  console.log(JSON.parse(JSON.stringify(goodsIds)));
  console.log(id);
  //找到一个重复就返回ture
  let flag = goodsIds.some((item) => {
    if (item.goodsId == id) {
      return true;
    } else {
      return false;
    }
  });
  console.log(flag);
  if (!flag) {
    sql = "insert into foot_print ( openid, goodsId ) VALUES (?,?)";
  } else {
    res.json({
      msg: "重复添加足迹",
      errno: 0,
    });
    return;
  }
  let results = await db.query(sql, [openid, id]);
  //成功
  if (results.affectedRows <= 0) {
    res.json({
      msg: "添加足迹失败",
      errno: 1,
    });
    return;
  }
  res.json({
    msg: "添加足迹成功",
    errno: 0,
  });
});

/**
 * @api {delete} /api/foot/del 取消足迹的商品
 */
router.post("/del", async (req, res) => {
  let { id } = req.body;
  let { openid } = req.user;
  let sql = "DELETE FROM foot_print WHERE goodsId = ? and openid = ?";

  let results = await db.query(sql, [id, openid]);
  //成功
  if (results.affectedRows <= 0) {
    res.json({
      msg: "删除足迹失败",
      errno: 1,
    });
    return;
  }
  res.json({
    msg: "删除足迹成功",
    errno: 0,
  });
});

/**
 * @api {get} /foot/list 获取所有收藏的商品
 */
router.post("/list", async (req, res) => {
  let { openid } = req.user;
  let sql =
    "SELECT f.id, f.goodsId, g.name, g.price , g.inventory, g.img FROM foot_print f JOIN goods g ON f.goodsId = g.goodsId WHERE openid = ?";
  let footPrientList = await db.query(sql, openid);
  if (footPrientList.length > 0) {
    res.json({
      msg: "success!",
      data: footPrientList,
      erron: 0,
    });
    return;
  }
  res.json({
    msg: "fail!",
    data: [],
    erron: 1,
  });
});

module.exports = router;

const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {get} api/home/appInfo 获取首页详情
 * @apiName
 * @apiGroup
 * @apiPermission
 *
 * @apiParam
 *
 * @apiSampleRequest
 */


router.get("/appInfo", async (req, res) => {
  // let {uId} = req.query
  let data = {
    banner: {},
    categoryList: [],
    cartCount: 0
  };
  //拿到banner数据
  let sql = `SELECT * FROM banner`;
  data.banner = await db.query(sql);
  //拿到分类列表数据
  sql = `select * from category`;
  let categoryList = await db.query(sql);
  //这里使用for而不是使用foreach/map这些是因为foreach/map里面是异步的
  for (let i = 0; i < categoryList.length; i++) {
    data.categoryList.push(categoryList[i]);
    sql = `select b.* from category a left join goods b on a.cateId=b.cateId where a.cateId=? limit 6 `;
    data.categoryList[i].goodsList = await db.query(sql, categoryList[i].cateId);
  }

  //判断登陆没有 无登录 返回0 有登陆才执行
  //判断未写

  // sql = `select * from cart where uId=?`
  // let cartcount = await db.query(sql, String(uId));
  // data.cartCount = cartcount.length

  res.json({
    msg: "success!",
    data,
    errno: 0
  });


});

module.exports = router;

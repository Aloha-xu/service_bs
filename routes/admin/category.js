const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");
const fs = require("fs");
const path = require("path");
/**
 * @api {get} /api/category/all 获取所有树形分类
 * @apiName allCategory
 * @apiGroup admin-Category
 * @apiPermission admin
 *
 * @apiSampleRequest /api/category/all
 */
router.post("/all", function (req, res) {
  let sql = `SELECT * FROM category `;
  db.query(sql, [], function (results, fields) {
    //成功
    res.json({
      status: true,
      msg: "success!",
      data: results,
    });
  });
});
/**
 * @api {post} /api/category/add 添加子分类
 * @apiName categoryAdd
 * @apiGroup admin-Category
 * @apiPermission admin
 *
 * @apiParam {String} name 分类名称.
 * @apiParam {Number} pId 父级id.
 * @apiParam {Number} [level] 分类所在层级.
 *
 */
router.post("/add", async (req, res) => {
  let { name, pId } = req.body;
  let sql = `INSERT INTO category (name,pId) VALUES (?,?) `;
  let results = await db.query(sql, [name, pId]);
  res.json({
    status: true,
    msg: "success!",
    data: {
      id: results.insertId,
    },
  });
});
/**
 * @api {delete} /api/category/del 删除分类
 * @apiName categoryDelete
 * @apiGroup admin-Category
 * @apiPermission admin
 *
 * @apiParam {Number} id 分类id.
 *
 * @apiExample {js} 参数示例:
 * /api/category/3
 *
 * @apiSampleRequest /api/category
 */
router.post("/del", async (req, res) => {
  let { cateId } = req.body;
  //传进来的cateid 判断有没有他的子cate和他关联 那么就得判断有没有父cateid = 子pid
  //有 则有关联
  let sql = "SELECT * FROM category WHERE pId = ?";
  let results = await db.query(sql, cateId);
  if (results.length > 0) {
    res.json({
      status: false,
      msg: "拥有子级分类，不允许删除！",
    });
    return;
  }
  sql = `DELETE FROM category WHERE cateId = ?`;
  results = await db.query(sql, cateId);
  if (results.affectedRows <= 0) {
    res.json({
      status: true,
      msg: "fail!",
      errno: 1,
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "success!",
    errno: 0,
  });
});
/**
 * @api {put} /api/category/updata 更新分类
 * @apiName updateCategory
 * @apiGroup admin-Category
 * @apiPermission admin
 *
 * @apiParam {Number} id 分类id.
 * @apiParam {String} name 分类名称.
 *
 * @apiExample {js} 参数示例:
 * /api/category/3
 *
 * @apiSampleRequest /api/category
 */
router.post("/updata", async (req, res) => {
  let { name, cateId } = req.body;
  console.log(cateId);
  let sql = `UPDATE category SET name = ?  WHERE cateId = ? `;
  let results = await db.query(sql, [name, cateId]);
  if (results.affectedRows <= 0) {
    res.json({
      status: true,
      msg: "fail!",
      errno: 1,
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "success!",
    errno: 0,
  });
});
/**
 * @api {get} /api/category/sub 获取子级分类
 * @apiName categorySub
 * @apiGroup Category
 * @apiPermission admin user
 *
 * @apiParam {Number} pId 父级分类id。注：获取一级分类pId = 1，获取根分类pId = 0;
 *
 * @apiSampleRequest /api/category/sub
 */
router.post("/sub", async (req, res) => {
  let { pId } = req.body;
  let sql = `SELECT * FROM category WHERE pId = ? `;
  console.log(sql);
  let results = await db.query(sql, pId);
  //成功
  res.json({
    status: true,
    msg: "success!",
    data: results,
  });
});

module.exports = router;

const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");
const fs = require("fs");
const path = require("path");
/**
 * @api  /api/banner/list
 */
router.post("/list", async (req, res) => {
  let sql = `SELECT * FROM banner ORDER BY createTime DESC`;
  let banner = await db.query(sql);
  if (banner.length > 0) {
    res.json({
      status: true,
      msg: "success!",
      data: banner,
      totle: banner.length,
    });
  } else {
    res.json({
      status: false,
      msg: "fail!",
    });
  }
});
/**
 * @api {post} /api/banner/add
 */
router.post("/add", async (req, res) => {
  let { url, state } = req.body;
  let sql = `INSERT INTO banner (url,createTime,state) VALUES (?,unix_timestamp(CURRENT_TIMESTAMP()),?) `;
  let results = await db.query(sql, [url, state]);
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
 * @api {delete} /api/banner/del
 *
 *  bannerId
 *
 */
router.post("/del", async (req, res) => {
  let { bannerId } = req.body;
  sql = `DELETE FROM banner WHERE bannerId = ?`;
  results = await db.query(sql, bannerId);
  if (results.affectedRows <= 0) {
    res.json({
      status: true,
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
 * @api {put} /api/banner/update 更新分类
 *
 */
router.post("/update", async (req, res) => {
  let { url, state, bannerId } = req.body;
  let sql = `UPDATE banner SET url = ? ,state = ? WHERE bannerId = ? `;
  let results = await db.query(sql, [url, state, bannerId]);
  if (results.affectedRows <= 0) {
    res.json({
      status: false,
      msg: "fail!",
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "success!",
  });
});

module.exports = router;

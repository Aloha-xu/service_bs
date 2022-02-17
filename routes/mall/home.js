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
router.get("/appInfo", function (req, res) {
  let sql = ``;
  db.query(sql, [], function (results) {
    //成功
    res.json({
      status: true,
      msg: "success!",
      data: {
        banner,
        categoryList,
        cartCount,
      },
    });
  });
});

module.exports = router;

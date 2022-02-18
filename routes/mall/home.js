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
  let sql = `SELECT * FROM banner`;
  // 多表查询
  // let isFinish = null;
  let data = {
    banner: {},
    categoryList: [],
  };
  db.query(sql, [], function (results) {
    // console.log(results);
    data.banner = results;
    // let sql = `select b.* from category a left join goods b on a.cateId=b.cateId where a.cateId=${} limit 6`;
    let sql = `select * from category`;
    db.query(sql, [], function (results) {
      let isFinish = results.length;
      // let categoryList = []
      results.forEach((item, index) => {
        isFinish--;
        data.categoryList.push(item);
        let sql = `select b.* from category a left join goods b on a.cateId=b.cateId where a.cateId=? limit 6 `;
        db.query(sql, [item.cateId], function (results) {
          data.categoryList[index].goodsList = results;
          //成功
        });
        res.json({
          status: true,
          msg: "success!",
          data,
        });
      });
    });
  });
});

module.exports = router;

const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {get} /api/goods/list 获取商品列表  这就是分类的接口 搜索的接口
 * @apiDescription 具备搜索、分页功能，1个分类id参数至多能传1个，默认按照商品创建时间升序排序,
 *
 * @apiParam {Number} [pageSize=8] 一个页有多少个商品; n
 * @apiParam {Number} [pageIndex=1] 第几页; n
 * @apiParam {Number} [cateId] 分类id; n
 * @apiParam {String} [keyword] 搜索关键词; n
 *
 *
 * @apiSampleRequest /api/goods/list
 */
router.get("/list", async (req, res) => {
  let { pageSize = 8, currentPage = 1, cateId, keyword } = req.query;
  let data = {
    currentPage: Number(currentPage),
    pageSize: Number(pageSize),
    count: 0,
    data: null,
    totalPages: 0,
  };
  // 如果没有传递参数的情况
  if (JSON.stringify(req.query) === "{}") {
    res.status(400).json({
      msg: "传递的参数不能为空,请检查",
    });
    return;
  }

  //拼接SQL
  let size = parseInt(pageSize);
  let count = size * (currentPage - 1);
  // 1 = 1 就是必定执行
  let sql = `SELECT * FROM goods WHERE 1 = 1`;

  if (cateId != 1 && cateId) {
    sql += ` AND cateId = ${cateId}`;
  }
  if (keyword) {
    sql += ` AND name LIKE '%${keyword}%'`;
  }
  //计算有多少条数据
  let totleCount = await db.query(sql);
  data.count = totleCount.length;
  data.totalPages = Math.ceil(data.count / pageSize);
  //limit参数，第一个参数：从哪儿开始查；第二个参数：查几条
  sql += ` ORDER BY createTime DESC LIMIT ${count},${size};`;
  data.data = await db.query(sql);
  res.json({
    errno: 0,
    msg: "success!",
    data,
  });
});
/**
 * @api {get} /api/goods/detail 获取商品详情
 * @apiParam {Number} goodsId
 */
router.get("/detail", async (req, res) => {
  let { goodsId } = req.query;
  // 如果没有传递参数的情况
  if (JSON.stringify(req.query) === "{}") {
    res.status(400).json({
      msg: "传递的参数不能为空,请检查",
    });
    return;
  }

  // 验证传递的参数是否正确,否则返回参数不对
  if (!req.query.hasOwnProperty("goodsId")) {
    res.status(400).json({
      msg: "传递的参数有误请检查",
    });
    return;
  }

  //商品信息
  let sql = `SELECT * FROM goods WHERE goodsId = ?;`;
  let info = await db.query(sql, Number(goodsId));
  res.json({
    errno: 0,
    msg: "success!",
    data: {
      info,
    },
  });
});

module.exports = router;

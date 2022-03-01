const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {post} /api/admin/goods/release 发布新商品
 * @apiName goodsRelease
 * @apiGroup admin Goods
 * @apiPermission admin
 *
 * @apiParam {Number} cateId 一级分类id;
 * @apiParam {String} name 商品名称;
 * @apiParam {String} [hotPoint] 商品热点描述;
 * @apiParam {Number} price 商品价格;
 * @apiParam {Number} inventory 商品库存;
 * @apiParam {String} img 商品主图-720;
 * @apiParam {String} slider 商品轮播图片，例：slider:'src1,src2,src3';
 * @apiParam {String} detail 商品详情,一般存储为HTML代码;
 * @apiParam {Number} freight 商品运费;
 *
 */
router.post("/release", async (req, res) => {
  let { cateId, name, price, inventory, img, slider, detail, freight } =
    req.body;
  let sql = `INSERT INTO goods (cateId, name, price, inventory, img, slider, detail, freight,state,createTime) VALUES (?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP()) `;
  let results = await db.query(sql, [
    cateId,
    name,
    price,
    inventory,
    img,
    slider,
    detail,
    freight,
    1,
  ]);
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
    data: {
      id: results.insertId,
    },
  });
});
/**
 * @api {put} /api/admin/goods/updata 编辑商品
 *
 * @apiParam {Number} id 商品id;
 * @apiParam {Number} cateId 一级分类id;
 * @apiParam {String} name 商品名称;
 * @apiParam {String} [hotPoint] 商品热点描述;
 * @apiParam {Number} price 商品价格;
 * @apiParam {Number} inventory 商品库存;
 * @apiParam {String} img 商品主图-720;
 * @apiParam {String} slider 商品轮播图片，例：slider:'src1,src2,src3';
 * @apiParam {String} detail 商品详情,一般存储为HTML代码;
 * @apiParam {Number} freight 商品运费;
 *
 *
 * @apiSampleRequest /api/admin/goods
 */
router.post("/updata", async (req, res) => {
  let {
    goodsId,
    cateId,
    name,
    // hotPoint,
    price,
    inventory,
    img,
    slider,
    detail,
    freight,
  } = req.body;
  let sql = `UPDATE goods SET cateId=?,name=?,price=?,inventory=?,img=?,slider=?,detail=?,freight=?,updateTime = CURRENT_TIMESTAMP() WHERE goodsId=?`;
  let results = db.query(sql, [cateId, name, price, inventory, img, slider, detail, freight, goodsId])
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
    data: results[0],
  });

});
/**
 * @api {get} /api/admin/goods/list 获取商品列表
 * @apiDescription 具备搜索、分页功能，3个分类id参数至多能传1个，默认按照商品创建时间升序排序
 *
 * @apiParam {Number} [pageSize=4] 一个页有多少个商品;
 * @apiParam {Number} [pageIndex=1] 第几页;
 * @apiParam {Number} [cateId] 一级分类id;
 * @apiParam {String} [keyword] 搜索关键词;
 * @apiParam {String="ASC","DESC"} [sortByPrice] 按照价格排序，从小到大-ASC,从大到小-DESC;
 *
 * @apiSuccess {Object[]} goods 商品数组.
 * @apiSuccess {Number} total 商品总数.
 *
 * @apiSampleRequest /api/admin/goods/list
 */
router.post("/list", async (req, res) => {
  let {
    pageSize = 4,
    pageIndex = 1,
    cateId,
    keyword,
    sortByPrice,
  } = req.body;
  //拼接SQL
  let size = parseInt(pageSize);
  let count = size * (pageIndex - 1);
  let sql = `SELECT SQL_CALC_FOUND_ROWS *, DATE_FORMAT(createTime,'%Y-%m-%d %H:%i:%s') AS createTime FROM goods WHERE 1 = 1`;
  if (cateId) {
    sql += ` AND cateId = ${cateId}`;
  }
  if (keyword) {
    sql += ` AND name LIKE '%${keyword}%'`;
  }
  if (sortByPrice) {
    sql += ` ORDER BY price ${sortByPrice}`;
  } else {
    sql += ` ORDER BY createTime DESC`;
  }
  sql += ` LIMIT ${count},${size};SELECT FOUND_ROWS() as total;`;

  let results = await db.query(sql)
  //成功
  res.json({
    status: true,
    msg: "success!",
    goods: results[0],
    ...results[1][0],
  });



});
/**
 * @api {get} /api/admin/goods/detail 获取商品详情
 *
 */
router.post("/detail", async (req, res) => {
  let { goodsId } = req.body;
  let sql = `SELECT * FROM goods WHERE goodsId = ?`;
  let results = await db.query(sql, goodsId)
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
    data: results[0],
  });
});
/**
 * @api {delete} /api/admin/goods/del 删除商品
 */
router.post("/del", async (req, res) => {
  let { goodsId } = req.body;
  let sql = `DELETE FROM goods WHERE goodsId=?`;
  let results = await db.query(sql, goodsId)
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

const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api /api/address/list 获取收货地址列表
 *
 * @apiSampleRequest /api/address/list
 */
router.get("/list", async (req, res) => {
  let { openid } = req.user;
  var sql = "SELECT * FROM address WHERE openid = ?";
  let results = await db.query(sql, openid);
  if (!results.length) {
    res.json({
      status: false,
      msg: "暂无收货地址！",
    });
    return false;
  }
  res.json({
    status: true,
    data: results,
    msg: "获取成功！",
    errno: 0,
  });
});

/**
 * @api  /api/address/addressDetail/:id 根据id获取收货地址详情
 *
 * @apiParam {Number} id 收货地址id.
 *
 */
router.get("/addressDetail", async (req, res) => {
  let sql = `SELECT * FROM address WHERE id = ? `;
  let { id } = req.query;
  let results = await db.query(sql, id);
  if (!results.length) {
    res.json({
      status: false,
      msg: "暂无收货地址信息！",
    });
    return false;
  }
  res.json({
    status: true,
    data: results[0],
    msg: "获取成功！",
    errno: 0,
  });
});

/**
 * @api {post} /api/address/addAddress 添加收货地址
 *
 * @apiParam {String} name 收货人姓名.
 * @apiParam {String} tel 电话.
 * @apiParam {String} province 省份.
 * @apiParam {String} city 市.
 * @apiParam {String} county 区县.
 * @apiParam {String} street 详细地址.
 * @apiParam {String} code 邮编.
 * @apiParam {Number=1,0} isDefault 是否默认 1-默认,0-否.
 *
 */
router.post("/addAddress", async (req, res) => {
  let sql;
  let { name, tel, province, city, county, street, isDefault } = req.body;
  let { openid } = req.user;
  //判断是不是设置了默认值
  if (isDefault == 1) {
    sql = `UPDATE address SET isDefault = 0 WHERE isDefault = 1`;
    await db.query(sql);
  }
  sql = `INSERT INTO address(openid, name, tel, province, city, county, street, isDefault) VALUES(?,?,?,?,?,?,?,?)`;
  let results = await db.query(sql, [
    openid,
    name,
    tel,
    province,
    city,
    county,
    street,
    isDefault,
  ]);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      msg: "添加成功！",
      errno: 0,
    });
  } else {
    res.json({
      status: false,
      msg: "失败",
      errno: 1,
    });
  }
});

/**
 * @api {put} /api/address/updataAdress/:id 修改收货地址

 * @apiParam {Number} id 收货地址id.
 * @apiParam {String} name 收货人姓名.
 * @apiParam {String} tel 电话.
 * @apiParam {String} province 省份.
 * @apiParam {String} city 市.
 * @apiParam {String} county 区县.
 * @apiParam {String} street 详细地址.
 * @apiParam {String} code 邮编.
 * @apiParam {Number=1,0} isDefault 是否默认.1-默认,0-否.
 *
 * @apiSampleRequest /api/address/
 */
router.post("/updataAdress", async (req, res) => {
  let sql;
  let { name, tel, province, city, county, street, isDefault, id } = req.body;
  //   let { openid } = req.user;
  //判断是不是设置了默认值
  if (isDefault == 1) {
    sql = `UPDATE address SET isDefault = 0 WHERE isDefault = 1`;
    await db.query(sql);
  }
  sql = `UPDATE address SET name = ?, tel = ?, province = ?, city = ?, county = ?, street = ?, isDefault = ? WHERE id = ?`;
  let results = await db.query(sql, [
    name,
    tel,
    province,
    city,
    county,
    street,
    isDefault,
    id,
  ]);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      msg: "修改成功！",
      errno: 0,
    });
  } else {
    res.json({
      status: false,
      msg: "失败",
      errno: 1,
    });
  }
});

/**
 * @api /api/address/delAdsress 删除收货地址
 *
 * @apiParam {Number} id 收货地址id.

 */
router.get("/delAdsress", async (req, res) => {
  let { id } = req.query;
  let sql = `DELETE FROM address WHERE id = ? `;
  let results = await db.query(sql, id);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      data: results,
      msg: "删除成功！",
      errno: 0,
    });
  } else {
    res.json({
      status: false,
      msg: "失败",
      errno: 1,
    });
  }
});

module.exports = router;

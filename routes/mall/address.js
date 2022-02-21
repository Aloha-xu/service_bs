const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {get} /api/address/list 获取收货地址列表
 * @apiName addressList
 * @apiGroup Address
 * @apiPermission user
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
 * @api {get} /api/address/addressDetail/:id 根据id获取收货地址详情
 * @apiName addressDetail
 * @apiGroup Address
 * @apiPermission user
 *
 * @apiParam {Number} id 收货地址id.
 *
 * @apiSampleRequest /api/address
 */
router.get("/addressDetail", async (req, res) => {
  var sql = `SELECT * FROM address WHERE id = ? `;
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
 * @apiName addressAdd
 * @apiGroup Address
 * @apiPermission user
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
 * @apiSampleRequest /api/address/
 */
router.post("/addAddress", async (req, res) => {
  let sql;
  let { name, tel, province, city, county, street, isDefault } = req.body;
  let { openid } = req.user;
  sql = `INSERT INTO address(openid, name, tel, province, city, county, street, isDefault) VALUES(?,?,?,?,?,?,?,?)`;
  let results = await db.query(sql, [
    openid,
    name,
    tel,
    province,
    city,
    county,
    street,
    code,
    isDefault,
    address,
  ]);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      msg: "添加成功！",
    });
  }
});

/**
 * @api {put} /api/address/updataAdress/:id 修改收货地址
 * @apiName addressUpdate
 * @apiGroup Address
 * @apiPermission user

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
  let { name, tel, province, city, county, street, isDefault } = req.body;
  let { id } = req.params;
  //   let { openid } = req.user;
  sql = `UPDATE address SET name = ?, tel = ?, province = ?, city = ?, county = ?, street = ?, isDefault = ? WHERE id = ?`;
  let results = await db.query(sql, [
    name,
    tel,
    province,
    city,
    county,
    street,
    code,
    isDefault,
    id,
  ]);
  if (results.affectedRows > 0) {
    res.json({
      status: true,
      msg: "修改成功！",
    });
  }
});

// /**
//  * @api {delete} /api/address/delAdsress/:id 删除收货地址
//  * @apiName addressDelete
//  * @apiGroup Address
//  * @apiPermission user
//  *
//  * @apiParam {Number} id 收货地址id.
//  *
//  * @apiSampleRequest /api/address
//  */
// router.get("/:id", function (req, res) {
//   let { id } = req.params;
//   var sql = `DELETE FROM address WHERE id = ? `;
//   db.query(sql, [id], function (results) {
//     res.json({
//       status: true,
//       data: results,
//       msg: "删除成功！",
//     });
//   });
// });

module.exports = router;

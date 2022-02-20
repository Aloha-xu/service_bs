const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api {get} api/common/categoryList 获取分类列表
 * @apiName
 * @apiGroup
 * @apiPermission
 *
 * @apiParam
 *
 * @apiSampleRequest
 */

router.get("/categoryList", async (req, res) => {
    let data = {
        categoryList: [],
    };
    //拿到分类列表数据
    sql = `select * from category`;
    data.categoryList = await db.query(sql);
    res.json({
        status: true,
        msg: "success!",
        data,
    });


});

module.exports = router;

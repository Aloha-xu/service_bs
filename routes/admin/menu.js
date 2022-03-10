const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");

/**
 * @api /api/menu/add 添加子菜单
 *
 * @apiParam {String} name 分类名称.
 * @apiParam {Number} pId 父级id.  这个pid就是你要添加子菜单的父级的menuid
 * @apiParam {String} path 菜单url地址.
 * @apiParam {String} menuOrder 菜单显示顺序，按照数字从小到大排序，如2001.
 *
 */
router.post("/add", async (req, res) => {
  let { name, pId, path, menuOrder } = req.body;
  let sql = `INSERT INTO MENU (name,pId,path,menuOrder) VALUES (?,?,?,?) `;
  let { insertId } = await db.query(sql, [name, pId, path, menuOrder]);
  //给超级管理员权限
  sql = `INSERT INTO role_menu (roleId,menuId) VALUES (1,?)`;
  let results = await db.query(sql, insertId);
  console.log(results.affectedRows);
  if (!results.affectedRows) {
    res.json({
      status: false,
      msg: "创建失败！",
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "创建成功!",
    data: {
      menuId: insertId,
    },
  });
});
/**
 * @api  /api/menu/del 删除子菜单
 *
 * @apiParam {Number} menuId 子菜单menuId.
 *
 */
router.post("/del", async (req, res) => {
  let { menuId } = req.body;
  //通过判断有没有pid等于你传进来的menuId  就是查一下你上面有没有父级
  let sql = "SELECT * FROM MENU WHERE pId = ?";
  let results = await db.query(sql, menuId);
  if (results.length > 0) {
    res.json({
      status: false,
      msg: "拥有子级分类，不允许删除！",
    });
    return;
  }
  //先删除菜单再删除role_menu的关联行
  sql = `DELETE FROM MENU WHERE menuId = ?;DELETE FROM role_menu WHERE menuId = ?`;
  results = await db.query(sql, [menuId, menuId]);
  if (!results[1].affectedRows) {
    res.json({
      status: false,
      msg: "删除失败！",
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "删除成功!",
  });
});
/**
 * @api  /api/menu/update 更新子菜单

 *
 * @apiParam {Number} id 子菜单id.
 * @apiParam {String} name 分类名称.
 * @apiParam {Number} pId 父级id.
 * @apiParam {String} path 菜单url地址.
 * @apiParam {String} menu_order 菜单显示顺序，按照数字从小到大排序，如2001.
 *
 */
router.post("/update", async (req, res) => {
  let { name, pId, path, menuOrder, menuId } = req.body;
  let sql = `UPDATE MENU SET name = ?,pId = ?, path = ?, menuOrder = ? WHERE menuId = ? `;
  let results = await db.query(sql, [name, pId, path, menuOrder, menuId]);

  if (!results.affectedRows) {
    res.json({
      status: false,
      msg: "fail！",
    });
    return;
  }
  //成功
  res.json({
    status: true,
    msg: "success!",
  });
});

/**
 * @api  /api/menu/sub 获取子菜单
 *
 * @apiParam { Number } pId 父级菜单id。 注： 获取一级菜单pId = 1;

 */
router.post("/sub", async (req, res) => {
  let { pId } = req.body;
  let sql = `SELECT * FROM menu WHERE pId = ? ORDER BY menuOrder`;
  let results = await db.query(sql, pId);
  res.json({
    status: true,
    msg: "success!",
    data: results,
  });
});

/**
 * @api  /api/menu/tree 根据角色id获取侧边栏树形菜单
 * @apiParam {Number} roleId roleId.
 */
router.post("/tree", async (req, res) => {
  let { roleId } = req.body;
  sql = `SELECT m.* FROM MENU m JOIN role_menu rm ON rm.menuId = m.menuId WHERE rm.roleId = ? ORDER BY menuOrder`;
  let results = await db.query(sql, roleId);
  //筛选出一级菜单
  let cate_1st = results.filter((item) => (item.pId === 1 ? item : null));
  //递归循环数据
  parseToTree(cate_1st);

  //递归函数
  function parseToTree(array) {
    array.forEach(function (parent) {
      parent.children = [];
      results.forEach(function (child) {
        if (child.pId === parent.menuId) {
          parent.children.push(child);
        }
      });
      // 设计就是两层 就不递归 这个递归还需要一个终止条件
      // parseToTree(parent.children);
    });
  }

  //成功
  res.json({
    status: true,
    msg: "success!",
    data: results,
  });
});
module.exports = router;

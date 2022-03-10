const express = require("express");
const router = express.Router();
// 数据库
let db = require("../../config/mysql");
/**
 * @api /api/role/list 获取角色列表
 */
router.post("/list", async (req, res) => {
  let sql = `SELECT roleId AS id, roleName AS name FROM role`;
  let results = await db.query(sql);
  res.json({
    status: true,
    msg: "获取成功！",
    data: results,
  });
});
/**
 * @api  /api/role/add 添加角色
  name   roleName 角色名称.
 */
router.post("/add", async (req, res) => {
  let { name } = req.body;
  let sql = `INSERT INTO role (roleName) VALUES (?)`;
  let results = await db.query(sql, name);
  res.json({
    status: true,
    msg: "success!",
    data: {
      roleId: results.insertId,
    },
  });
});
/**
 * @api  /api/role/del 删除角色
  id 角色roleId
 */
router.post("/del", async (req, res) => {
  let { id } = req.body;
  let sql = `DELETE FROM role WHERE roleId = ?;DELETE FROM admin_role WHERE roleId = ?;DELETE FROM role_menu WHERE roleId = ?`;
  let results = await db.query(sql, [id, id, id]);
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
 * @api /api/role/update 更新角色
 * 
    id 角色roleId
     name   roleName 角色名称.
 */
router.post("/update", async (req, res) => {
  let { name, id } = req.body;
  let sql = `UPDATE role SET roleName = ? WHERE roleId = ?`;
  let results = await db.query(sql, [name, id]);
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
 * @api  /api/role/getMenuByRoleId 根据角色id获取菜单配置
 *
 * @apiParam { Number } id 角色id。
 *
 */
router.post("/getMenuByRoleId", async (req, res) => {
  let { id } = req.body;
  //获取所有菜单
  let sql = `SELECT menuId, name, path, menuOrder AS 'order', pId FROM menu ORDER BY menuOrder;`;
  let results = await db.query(sql);
  //添加菜单选择状态  这是根据roleid选择出来的菜单
  sql = `SELECT m.* FROM MENU m JOIN role_menu rm ON rm.menuId = m.menuId WHERE rm.roleId = ?`;
  let menu = await db.query(sql, id);

  results.forEach((item) => {
    let flag = menu.find((element) => {
      return element.menuId === item.menuId;
    });
    item.checked = flag ? true : false;
  });
  //筛选出一级菜单
  let menu_1st = results.filter((item) => (item.pId === 1 ? item : null));
  //递归循环数据
  parseToTree(menu_1st);
  //成功
  res.json({
    status: true,
    msg: "success!",
    data: menu_1st,
  });

  //递归函数
  function parseToTree(array) {
    array.forEach(function (parent) {
      parent.children = [];
      results.forEach(function (child) {
        if (child.pId === parent.menuId) {
          parent.children.push(child);
        }
      });
      //   parseToTree(parent.children);
    });
  }
});

/**
 * @api  /api/role/addMenuByRole 为指定角色添加菜单
 *
 * @apiParam { Number } roleId 角色id。
 * @apiParam { Number } menuId 菜单id。
 */
router.post("/addMenuByRole", async (req, res) => {
  let { roleId, menuId } = req.body;
  //先查找是否存在
  let sql = `SELECT * FROM role_menu WHERE roleId=? AND menuId=?`;
  let results = await db.query(sql, [roleId, menuId]);
  if (results.length) {
    res.json({
      status: true,
      msg: "该角色已经存在该菜单了!",
    });
    return;
  }

  sql = `INSERT INTO role_menu (roleId,menuId) VALUES (?,?)`;
  results = await db.query(sql, [roleId, menuId]);
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
 * @api  /api/role/menu/del 为指定角色删除菜单
 *
 * @apiParam { Number } roleId 角色id。
 * @apiParam { Number } menuId 菜单id。
 *
 */
router.post("/delMenuByRole", async (req, res) => {
  let { roleId, menuId } = req.body;
  let sql = `DELETE FROM role_menu WHERE roleId = ? AND menuId = ?`;
  let results = await db.query(sql, [roleId, menuId]);
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

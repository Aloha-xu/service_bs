/*
 Navicat Premium Data Transfer

 Source Server         : xzd
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 06/03/2022 13:16:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id 唯一标识openid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `county` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '县区',
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `isDefault` int(11) NULL DEFAULT 1 COMMENT '是否默认',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (10, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xx', '13652489854', '吉林', '通化', '梅河口市', 'xxxxx', 0, 'aaaaaaa');
INSERT INTO `address` VALUES (4, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '罗志祥', '15863008280', '山东省', '济南市', '历下区', '宜昌路', 0, '五栋一座五栋一座五栋一座五栋一座');
INSERT INTO `address` VALUES (5, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '欧阳靖', '15194250468', '辽宁', '沈阳', '和平区', '崇景路', 0, '五五栋一座五栋一座一座');
INSERT INTO `address` VALUES (6, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '黄晓明', '15194250468', '广东省', '广州市', '荔湾区', '鞍山路', 1, '五栋一座630五栋一座五栋一座五栋一座');
INSERT INTO `address` VALUES (7, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '赵薇', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 0, '五五栋一座五栋一座五栋一座一座');
INSERT INTO `address` VALUES (8, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '林心如', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 0, '五五栋一座五栋一座一座602');
INSERT INTO `address` VALUES (9, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xxx', '13625042789', '北京', '北京', '东城区', NULL, 0, NULL);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` int(1) NULL DEFAULT 0 COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱 x',
  `createTime` datetime(0) NOT NULL COMMENT '创建时间',
  `loginTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `loginCount` bigint(20) NOT NULL DEFAULT 1 COMMENT '登录次数',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '超级管理员', 1, '/images/avatar/218b7fa0-9c80-11ec-9dd2-2bd0ff6e15da.jpeg', '13620427379', 'nn880328@126.com', '2019-05-14 20:39:31', '2022-03-06 12:58:33', 252);
INSERT INTO `admin` VALUES (2, 'moz', '123456', '黄小米', 1, 'http://localhost:3003/images/avatar/default.jpg', '13475829262', 'nn880328@126.com', '2019-05-11 18:21:37', '2022-03-05 20:13:26', 9);
INSERT INTO `admin` VALUES (4, 'xuuuu', '123456', '小徐啊啊', 0, '/images/avatar/8398eda0-9c7f-11ec-9dd2-2bd0ff6e15da.jpeg', '13620427379', NULL, '2022-03-04 10:34:23', '2022-03-05 20:26:48', 1);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1);
INSERT INTO `admin_role` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `bannerId` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT 1 COMMENT '0 - 下架  1 - 上架',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`bannerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (2, 'http://114.132.239.118:3003/getpic/1645340224079.JPG', 0, '1646013058');
INSERT INTO `banner` VALUES (3, 'http://114.132.239.118:3003/getpic/1645340237725.JPG', 0, '1646013058');
INSERT INTO `banner` VALUES (4, 'http://114.132.239.118:3003/getpic/1645340252782.jpg', 0, '1646013058');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `goodsNumber` int(11) NOT NULL COMMENT '商品数量',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `createTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cateId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pId` int(11) NOT NULL COMMENT '父级id',
  `level` int(11) NULL DEFAULT NULL COMMENT '层级 x  弃用',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弃用',
  PRIMARY KEY (`cateId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '全部', 0, 1, '');
INSERT INTO `category` VALUES (18, '漫步者', 1, 2, 'http://localhost:3003/images/common/707d6060-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (2, '专业音箱', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (3, 'JBL', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (4, '家用音箱', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (5, '智能音响', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (6, 'SONY', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `goodsId` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收藏商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for foot_print
-- ----------------------------
DROP TABLE IF EXISTS `foot_print`;
CREATE TABLE `foot_print`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsId` int(11) NOT NULL,
  PRIMARY KEY (`id`, `openid`, `goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foot_print
-- ----------------------------
INSERT INTO `foot_print` VALUES (16, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 35);
INSERT INTO `foot_print` VALUES (17, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 36);
INSERT INTO `foot_print` VALUES (19, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 37);
INSERT INTO `foot_print` VALUES (20, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 18);
INSERT INTO `foot_print` VALUES (21, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 38);
INSERT INTO `foot_print` VALUES (22, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 27);
INSERT INTO `foot_print` VALUES (23, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 15);
INSERT INTO `foot_print` VALUES (24, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 16);
INSERT INTO `foot_print` VALUES (25, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 33);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `cateId` int(11) NOT NULL COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `inventory` int(11) NOT NULL COMMENT '库存 ',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图-360 x',
  `slider` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品轮播图片',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌 x',
  `detail` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `freight` decimal(10, 0) NULL DEFAULT 0 COMMENT '商品运费 ',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `state` int(11) NULL DEFAULT 1 COMMENT '0下架 1上架',
  `sellVolume` int(11) NULL DEFAULT 0 COMMENT '已售数量',
  PRIMARY KEY (`goodsId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `goods_gallery`;
CREATE TABLE `goods_gallery`  (
  `galleryId` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `goodsId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`galleryId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_gallery
-- ----------------------------
INSERT INTO `goods_gallery` VALUES (1, 'http://114.132.239.118:3003/getpic/1645269068008.png', 1, 18);
INSERT INTO `goods_gallery` VALUES (2, 'http://114.132.239.118:3003/getpic/1645269068008.png', 1, 18);
INSERT INTO `goods_gallery` VALUES (3, 'http://114.132.239.118:3003/getpic/1645269068008.png', 1, 18);
INSERT INTO `goods_gallery` VALUES (4, 'http://114.132.239.118:3003/getpic/1645269068008.png', 1, 18);
INSERT INTO `goods_gallery` VALUES (5, 'http://114.132.239.118:3003/getpic/1645269068008.png', 1, 18);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pId` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接url',
  `menuOrder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '全部菜单', 0, NULL, NULL, '0');
INSERT INTO `menu` VALUES (2, '商品管理', 1, NULL, '', '2000');
INSERT INTO `menu` VALUES (3, '用户管理', 1, NULL, '', '5000');
INSERT INTO `menu` VALUES (4, '订单管理', 1, NULL, '', '3000');
INSERT INTO `menu` VALUES (5, '账户设置', 1, NULL, '', '4000');
INSERT INTO `menu` VALUES (6, '权限设置', 1, NULL, '', '6000');
INSERT INTO `menu` VALUES (7, '商品分类', 2, NULL, '/goods/category/', '2001');
INSERT INTO `menu` VALUES (8, '发布商品', 2, NULL, '/goods/release', '2002');
INSERT INTO `menu` VALUES (9, '商品列表', 2, NULL, '/goods/list', '2003');
INSERT INTO `menu` VALUES (10, '用户列表', 3, NULL, '/user/list', '5001');
INSERT INTO `menu` VALUES (11, '订单列表', 4, NULL, '/order/list', '3001');
INSERT INTO `menu` VALUES (12, '账户信息', 5, NULL, '/user/info', '4001');
INSERT INTO `menu` VALUES (13, '用户角色', 6, NULL, '/auth/role', '6001');
INSERT INTO `menu` VALUES (14, '菜单权限', 6, NULL, '/auth/menu', '6002');
INSERT INTO `menu` VALUES (15, '轮播图管理', 1, NULL, NULL, '7000');
INSERT INTO `menu` VALUES (16, '轮播图列表', 15, NULL, '/banner/list', '7001');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义 就是唯一标识',
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `goodsId` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `goodsNumber` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单-商品表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderState` tinyint(4) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单状态-字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_status
-- ----------------------------
INSERT INTO `order_status` VALUES (1, -1, 'CREAT_FAILED', '创建订单失败');
INSERT INTO `order_status` VALUES (2, 0, 'WAIT_BUYER_PAY', '待付款');
INSERT INTO `order_status` VALUES (3, 1, 'WAIT_DELIVERY', '待发货');
INSERT INTO `order_status` VALUES (4, 2, 'WAIT_TAKE_DELIVERY', '待收货');
INSERT INTO `order_status` VALUES (5, 3, 'BUYER_RECEIVED', '买家已收货');
INSERT INTO `order_status` VALUES (6, 4, 'GOODS_RETURNING', '退货中');
INSERT INTO `order_status` VALUES (7, 5, 'GOODS_RETURNED_SUCCESS', '退货成功');
INSERT INTO `order_status` VALUES (8, 6, 'ORDER_CLOSED', '订单关闭');
INSERT INTO `order_status` VALUES (9, 8, 'GOODS_RETURNED_FAIL', '退货失败');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义 唯一标识',
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid生成',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `createTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间 ',
  `payTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `shipTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间 后台填写',
  `receivedTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货时间  只可以是用户手动点击确认收货的那个时间',
  `finishTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易完成时间 就是你点击完确认收货的时间，你不点击确认收货就快递发货时间加15天',
  `closeTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易关闭时间 就是买家取消订单/卖家取消订单 / 整个流程结束了 / 买家超过3天未付款 这个情况先不写',
  `updateTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间  ',
  `addressId` int(11) NULL DEFAULT NULL COMMENT '快递地址id',
  `freightPrice` double(20, 2) NULL DEFAULT NULL COMMENT '邮费',
  `shipName` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `shipNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `orderState` int(11) NULL DEFAULT 0 COMMENT '状态字典 关联状态表',
  `state` int(11) NULL DEFAULT 1 COMMENT '1-正常，0-删除',
  `refundState` int(11) NULL DEFAULT 0 COMMENT '退款状态 0 否 1 退款',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsPrices` double(20, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `refundReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员');
INSERT INTO `role` VALUES (2, '管理员');
INSERT INTO `role` VALUES (3, '运营人员');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menuId` int(11) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 2);
INSERT INTO `role_menu` VALUES (2, 1, 7);
INSERT INTO `role_menu` VALUES (3, 1, 8);
INSERT INTO `role_menu` VALUES (4, 1, 9);
INSERT INTO `role_menu` VALUES (5, 1, 3);
INSERT INTO `role_menu` VALUES (6, 1, 10);
INSERT INTO `role_menu` VALUES (7, 1, 4);
INSERT INTO `role_menu` VALUES (8, 1, 11);
INSERT INTO `role_menu` VALUES (9, 1, 5);
INSERT INTO `role_menu` VALUES (10, 1, 12);
INSERT INTO `role_menu` VALUES (115, 1, 14);
INSERT INTO `role_menu` VALUES (15, 1, 13);
INSERT INTO `role_menu` VALUES (14, 1, 6);
INSERT INTO `role_menu` VALUES (27, 2, 2);
INSERT INTO `role_menu` VALUES (30, 2, 9);
INSERT INTO `role_menu` VALUES (29, 2, 8);
INSERT INTO `role_menu` VALUES (28, 2, 7);
INSERT INTO `role_menu` VALUES (21, 2, 3);
INSERT INTO `role_menu` VALUES (22, 2, 10);
INSERT INTO `role_menu` VALUES (23, 2, 4);
INSERT INTO `role_menu` VALUES (24, 2, 11);
INSERT INTO `role_menu` VALUES (25, 2, 5);
INSERT INTO `role_menu` VALUES (26, 2, 12);
INSERT INTO `role_menu` VALUES (43, 4, 2);
INSERT INTO `role_menu` VALUES (44, 4, 7);
INSERT INTO `role_menu` VALUES (45, 4, 8);
INSERT INTO `role_menu` VALUES (46, 4, 9);
INSERT INTO `role_menu` VALUES (47, 3, 2);
INSERT INTO `role_menu` VALUES (48, 3, 7);
INSERT INTO `role_menu` VALUES (51, 3, 8);
INSERT INTO `role_menu` VALUES (50, 3, 9);
INSERT INTO `role_menu` VALUES (52, 3, 4);
INSERT INTO `role_menu` VALUES (53, 3, 11);
INSERT INTO `role_menu` VALUES (54, 3, 5);
INSERT INTO `role_menu` VALUES (55, 3, 12);
INSERT INTO `role_menu` VALUES (56, 4, 5);
INSERT INTO `role_menu` VALUES (57, 4, 12);
INSERT INTO `role_menu` VALUES (99, 1, 60);
INSERT INTO `role_menu` VALUES (113, 1, 16);
INSERT INTO `role_menu` VALUES (114, 1, 15);
INSERT INTO `role_menu` VALUES (95, 1, 56);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '性别 0：未知、1：男、2：女',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT './images/avatar/default.jpg' COMMENT '头像',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序唯一标示id',
  `session_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会话密钥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'V.', '0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicSf2eL9ic6HELjK4lFdoETffEOZm6bGgJa7a7aMHuDXGxA5sKhMAWU3WbcZiaW6JS8tCCmQbLMOD2sbuRVuu1Ew/132', '', '', '', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'K2k2H8n1siqRHqrjTG1fpQ==');

SET FOREIGN_KEY_CHECKS = 1;

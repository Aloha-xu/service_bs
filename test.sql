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

 Date: 13/03/2022 00:41:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id 唯一标识openid',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名  四个字',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `county` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '县区  ',
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `isDefault` int(1) NOT NULL DEFAULT 1 COMMENT '是否默认',
  PRIMARY KEY (`addressId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (6, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '黄晓明', '15194250468', '广东省', '广州市', '荔湾区', '鞍山路', 0);
INSERT INTO `address` VALUES (7, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '赵薇', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 0);
INSERT INTO `address` VALUES (8, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '林心如', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 1);
INSERT INTO `address` VALUES (9, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xxx', '13625042789', '北京', '北京', '东城区', '1', 0);
INSERT INTO `address` VALUES (10, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xx', '13652489854', '吉林', '通化', '梅河口市', 'xxxxx', 0);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名 账户 12位 不允许修改',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码  md5加密后 32位 ',
  `fullname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名 5个汉字',
  `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别 男0 女1',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `loginTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `loginCount` int(11) NOT NULL DEFAULT 1 COMMENT '登录次数',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 0, '/images/avatar/218b7fa0-9c80-11ec-9dd2-2bd0ff6e15da.jpeg', '13620427379', '2021-09-14 20:39:31', '2022-03-12 17:50:08', 270);
INSERT INTO `admin` VALUES (2, 'moz', 'c33367701511b4f6020ec61ded352059', '黄小米好是', 1, 'http://localhost:3003/images/avatar/97632fa0-a015-11ec-a0b8-c7f0b643fc2f.png', '13475829232', '2021-09-11 18:21:37', '2022-03-10 14:47:07', 13);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminId` int(11) NOT NULL COMMENT '用户id 外键',
  `roleId` int(11) NOT NULL COMMENT '角色id 外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '0 - 下架  1 - 上架',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`bannerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (2, 'http://localhost:3003/images/goods/17fa8f90-9f8b-11ec-b6c3-05ae5cb5c700_360.jpeg', 1, '2022-03-09 09:30:57', '2022-03-10 15:28:40');
INSERT INTO `banner` VALUES (3, 'http://localhost:3003/images/goods/1ede2bf0-9f8b-11ec-b6c3-05ae5cb5c700_360.jpeg', 1, '2022-03-09 09:30:57', '2022-03-09 17:27:22');
INSERT INTO `banner` VALUES (4, 'http://localhost:3003/images/goods/24f8fa10-9f8b-11ec-b6c3-05ae5cb5c700_360.jpeg', 1, '2022-03-09 09:30:57', '2022-03-09 17:27:32');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id ',
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `goodsNumber` int(6) NOT NULL COMMENT '商品数量',
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cateId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称 5个字',
  `pId` int(11) NOT NULL COMMENT '父级id',
  PRIMARY KEY (`cateId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '全部', 0);
INSERT INTO `category` VALUES (2, '专业音箱', 1);
INSERT INTO `category` VALUES (3, 'JBL', 1);
INSERT INTO `category` VALUES (4, '家用音箱', 1);
INSERT INTO `category` VALUES (5, '智能音响', 1);
INSERT INTO `category` VALUES (6, 'SONY', 1);

-- ----------------------------
-- Table structure for foot_print
-- ----------------------------
DROP TABLE IF EXISTS `foot_print`;
CREATE TABLE `foot_print`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '外键',
  `goodsId` int(11) NOT NULL COMMENT '外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `foot_print` VALUES (26, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 43);
INSERT INTO `foot_print` VALUES (27, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 41);
INSERT INTO `foot_print` VALUES (28, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 42);
INSERT INTO `foot_print` VALUES (30, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 54);
INSERT INTO `foot_print` VALUES (31, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 53);
INSERT INTO `foot_print` VALUES (32, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 48);
INSERT INTO `foot_print` VALUES (33, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 52);
INSERT INTO `foot_print` VALUES (34, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 47);
INSERT INTO `foot_print` VALUES (35, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 46);
INSERT INTO `foot_print` VALUES (36, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 51);
INSERT INTO `foot_print` VALUES (37, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 50);
INSERT INTO `foot_print` VALUES (39, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 45);
INSERT INTO `foot_print` VALUES (40, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 49);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `cateId` int(11) NOT NULL COMMENT '分类id',
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(8, 2) NOT NULL COMMENT '商品价格 八位长度 包括小数点后面的两位',
  `inventory` int(6) NOT NULL COMMENT '库存 0-999999',
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图-一张',
  `slider` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品轮播图片-最多6张',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情-',
  `freight` decimal(6, 0) NOT NULL DEFAULT 0 COMMENT '商品运费 0-999999',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '0下架 1上架',
  `sellVolume` int(11) NOT NULL DEFAULT 0 COMMENT '已售数量',
  PRIMARY KEY (`goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (41, 5, 'SADA/赛达长条电脑音响台式家用多媒体超重低音炮迷你小型音箱有线笔记本usb影响带麦克风一体喇叭桌面高音质', 89.90, 1000, 'http://localhost:3003/images/goods/66f0b730-9d0d-11ec-a616-016da32fd14f_360.jpeg', 'http://localhost:3003/images/goods/cc8bf4f0-9d0e-11ec-9d3b-1728c8412c9d_720.png,http://localhost:3003/images/goods/cff97d60-9d0e-11ec-9d3b-1728c8412c9d_720.png,http://localhost:3003/images/goods/d31e8b20-9d0e-11ec-9d3b-1728c8412c9d_720.png,http://localhost:3003/images/goods/d5d26080-9d0e-11ec-9d3b-1728c8412c9d_720.png', '<p><img src=\"http://localhost:3003/images/details/5023da80-9d0f-11ec-9d3b-1728c8412c9d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/6a616200-9d0f-11ec-9d3b-1728c8412c9d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/7c7119e0-9d0f-11ec-9d3b-1728c8412c9d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/84e51a40-9d0f-11ec-9d3b-1728c8412c9d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/87e8bd50-9d0f-11ec-9d3b-1728c8412c9d.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 10, '2022-03-06 13:37:45', NULL, 1, 0);
INSERT INTO `goods` VALUES (42, 4, 'SADA/赛达 电脑音响台式机家用桌面有源音箱超重低音炮高音质笔记本喇叭蓝牙有线2.0连接外放扬声器小型影响', 69.00, 1000, 'http://localhost:3003/images/goods/4bd25a10-9d64-11ec-9981-277f5ffccb87_360.jpeg', 'http://localhost:3003/images/goods/55c53240-9d64-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/58da1360-9d64-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/5b5d89f0-9d64-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/5e484dd0-9d64-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/60a1ce30-9d64-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/637c3e60-9d64-11ec-9981-277f5ffccb87_720.png', '<p><img src=\"http://localhost:3003/images/details/767592f0-9d64-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/7a1d1720-9d64-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/7dc2c690-9d64-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/835af730-9d64-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/8d36c4f0-9d64-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 12, '2022-03-06 23:46:20', NULL, 1, 0);
INSERT INTO `goods` VALUES (43, 3, 'JBL Boombox2 音乐战神2代无线蓝牙音箱高功率便携户外音响低音炮', 3899.00, 999, 'http://localhost:3003/images/goods/1e73b540-9d65-11ec-9981-277f5ffccb87_360.png', 'http://localhost:3003/images/goods/21ac9920-9d65-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/240c3400-9d65-11ec-9981-277f5ffccb87_720.png,http://localhost:3003/images/goods/260e1e80-9d65-11ec-9981-277f5ffccb87_720.png', '<p><img src=\"http://localhost:3003/images/details/2bd30470-9d65-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/30662120-9d65-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"/images/details/351a8170-9d65-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/384645f0-9d65-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/3ba109b0-9d65-11ec-9981-277f5ffccb87.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 10, '2022-03-06 23:51:11', '2022-03-10 15:33:23', 1, 1);
INSERT INTO `goods` VALUES (44, 3, 'JBL GO3金砖3代无线蓝牙音箱重低音小音响便携式户外迷你低音炮', 399.00, 999, 'http://localhost:3003/images/goods/5f833960-9e15-11ec-8158-379cd5d38610_360.jpeg', 'http://localhost:3003/images/goods/6211d380-9e15-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/64090fa0-9e15-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/6734fb30-9e15-11ec-8158-379cd5d38610_720.png', '<p><img src=\"http://localhost:3003/images/details/6c233030-9e15-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/6e81b9a0-9e15-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/71011180-9e15-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/742052e0-9e15-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 10, '2022-03-07 20:52:36', '2022-03-10 15:33:34', 1, 1);
INSERT INTO `goods` VALUES (45, 2, '浮洛德 专业舞台音响套装单双18寸同轴户外大型演出婚庆线阵无源大功率全频防水远程HIFI酒吧音箱低音炮设备', 19999.00, 999, 'http://localhost:3003/images/goods/e413d6d0-9e15-11ec-8158-379cd5d38610_360.png', 'http://localhost:3003/images/goods/e7cee300-9e15-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/eb068e60-9e15-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/eca28b20-9e15-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/ef51a590-9e15-11ec-8158-379cd5d38610_720.png', '<p><img src=\"http://localhost:3003/images/details/0da68a10-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/10a746f0-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/133c70c0-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 20:57:03', '2022-03-09 22:57:45', 1, 1);
INSERT INTO `goods` VALUES (46, 2, '专业线阵音响 单双15寸舞台演出大功率音响套装 婚庆落地无源音箱', 19998.00, 100, 'http://localhost:3003/images/goods/73743ef0-9e16-11ec-8158-379cd5d38610_360.png', 'http://localhost:3003/images/goods/75954a30-9e16-11ec-8158-379cd5d38610_720.png,http://localhost:3003/images/goods/796787e0-9e16-11ec-8158-379cd5d38610_720.png', '<p><img src=\"http://localhost:3003/images/details/80c27720-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/82f1b330-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/8500e420-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/88204c90-9e16-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 21:00:17', '2022-03-11 10:07:06', 1, 0);
INSERT INTO `goods` VALUES (47, 4, '李佳埼推荐 蓝牙音箱小音响超重低音炮迷你无线家用小型高端户外大音量3d客厅环绕高音质手机便携式新款车载', 59.00, 999, 'http://localhost:3003/images/goods/16b79850-9e17-11ec-8158-379cd5d38610_360.png', 'http://localhost:3003/images/goods/19d68b90-9e17-11ec-8158-379cd5d38610_720.png', '<p><img src=\"http://localhost:3003/images/details/2390eea0-9e17-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/25e39130-9e17-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/291ee610-9e17-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/2b0950f0-9e17-11ec-8158-379cd5d38610.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 21:04:57', '2022-03-09 11:57:09', 1, 0);
INSERT INTO `goods` VALUES (48, 6, 'Sony/索尼 HT-A9 家庭影院 7.1.4声道 360空间声场杜比全景声家影', 1499.00, 999, 'http://localhost:3003/images/goods/02036170-9e24-11ec-a481-f99b1b5f7de6_360.png', 'http://localhost:3003/images/goods/04608b50-9e24-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/08fea480-9e24-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/0c69bbf0-9e24-11ec-a481-f99b1b5f7de6_720.png', '<p><img src=\"http://localhost:3003/images/details/13072790-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/15ac08d0-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/18ffeec0-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/1b9f2ab0-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 22:37:27', '2022-03-09 11:57:16', 1, 0);
INSERT INTO `goods` VALUES (49, 6, '日本直邮Sony索尼「S-Master」搭载音响CMT-SBT 收音蓝牙组合音响', 2619.00, 1000, 'http://localhost:3003/images/goods/e1a3ea70-9e24-11ec-a481-f99b1b5f7de6_360.png', 'http://localhost:3003/images/goods/e5ccfab0-9e24-11ec-a481-f99b1b5f7de6_720.png', '<p><img src=\"http://localhost:3003/images/details/e9f8f120-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/ed0fa700-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/ef7905e0-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/f2c8f430-9e24-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 22:43:29', NULL, 1, 0);
INSERT INTO `goods` VALUES (50, 6, 'Sony/索尼 SRS-RA5000 旗舰级高解析度蓝牙音箱 无线音箱', 4499.00, 990, 'http://localhost:3003/images/goods/29b59f70-9e25-11ec-a481-f99b1b5f7de6_360.png', 'http://localhost:3003/images/goods/4fdbdbb0-9e25-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/52af1ff0-9e25-11ec-a481-f99b1b5f7de6_720.png', '<p><img src=\"http://localhost:3003/images/details/5826d040-9e25-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/5b959130-9e25-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/5e53ede0-9e25-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/6064f390-9e25-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 22:46:32', '2022-03-12 19:23:25', 1, 9);
INSERT INTO `goods` VALUES (51, 5, '天猫精灵X5智能音箱音响蓝牙闹钟早教机语音声控ai机器人送礼', 299.00, 992, 'http://localhost:3003/images/goods/02403f30-9e2b-11ec-a481-f99b1b5f7de6_360.jpeg', 'http://localhost:3003/images/goods/046ae760-9e2b-11ec-a481-f99b1b5f7de6_720.jpeg', '<p><img src=\"http://localhost:3003/images/details/09305eb0-9e2b-11ec-a481-f99b1b5f7de6.jpeg\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/40cd6e30-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/46f75780-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/49303080-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 23:28:51', '2022-03-12 19:23:25', 1, 8);
INSERT INTO `goods` VALUES (52, 5, '华为蓝牙音箱智能音响家用高音质低音炮无线wifi蓝牙小型迷你ai2', 299.00, 995, 'http://localhost:3003/images/goods/863782d0-9e2b-11ec-a481-f99b1b5f7de6_360.jpeg', 'http://localhost:3003/images/goods/87a591c0-9e2b-11ec-a481-f99b1b5f7de6_720.jpeg,http://localhost:3003/images/goods/89728990-9e2b-11ec-a481-f99b1b5f7de6_720.png', '<p><img src=\"http://localhost:3003/images/details/8d8a82d0-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/905143f0-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/93e232e0-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/968ba800-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/983fc0a0-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 23:31:03', '2022-03-11 10:15:00', 1, 1);
INSERT INTO `goods` VALUES (53, 5, '小度智能屏Air蓝牙音箱百度官方音响5.45英寸向往的生活送礼包邮', 269.00, 999, 'http://localhost:3003/images/goods/b791c9d0-9e2b-11ec-a481-f99b1b5f7de6_360.png', 'http://localhost:3003/images/goods/bb235500-9e2b-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/bea4daa0-9e2b-11ec-a481-f99b1b5f7de6_720.png', '<p><img src=\"http://localhost:3003/images/details/c118e7e0-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/c4697270-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/c843c670-9e2b-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 0, '2022-03-07 23:32:29', '2022-03-09 22:57:45', 1, 1);
INSERT INTO `goods` VALUES (54, 4, '【陈小春推荐】索爱无线蓝牙音箱迷你小型音响家用3d环绕重低音炮便携式高音质插卡车载新款智能通用适用华为', 99.00, 100, 'http://localhost:3003/images/goods/3de41470-9e2c-11ec-a481-f99b1b5f7de6_360.png', 'http://localhost:3003/images/goods/402fb220-9e2c-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/41e5c690-9e2c-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/43aaa810-9e2c-11ec-a481-f99b1b5f7de6_720.png,http://localhost:3003/images/goods/53b7d160-9ea9-11ec-94ba-812cfdc15bd1_720.png', '<p><img src=\"http://localhost:3003/images/details/46b4b3c0-9e2c-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/48bcb8c0-9e2c-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/4a974520-9e2c-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><img src=\"http://localhost:3003/images/details/4e43ab50-9e2c-11ec-a481-f99b1b5f7de6.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 9, '2022-03-07 23:36:58', '2022-03-08 14:31:04', 0, 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称 10个汉族',
  `pId` int(11) NOT NULL COMMENT '父级id',
  `path` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接url 路由路径',
  `menuOrder` int(5) NOT NULL COMMENT '显示顺序 到万',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '全部菜单', 0, NULL, 0);
INSERT INTO `menu` VALUES (2, '商品管理', 1, '', 2000);
INSERT INTO `menu` VALUES (3, '用户管理', 1, '', 5000);
INSERT INTO `menu` VALUES (4, '订单管理', 1, '', 3000);
INSERT INTO `menu` VALUES (5, '账户设置', 1, '', 4000);
INSERT INTO `menu` VALUES (6, '权限管理', 1, '', 6000);
INSERT INTO `menu` VALUES (7, '商品分类', 2, '/goods/category/', 2001);
INSERT INTO `menu` VALUES (8, '发布商品', 2, '/goods/release', 2002);
INSERT INTO `menu` VALUES (9, '商品列表', 2, '/goods/list', 2003);
INSERT INTO `menu` VALUES (10, '用户列表', 3, '/user/list', 5001);
INSERT INTO `menu` VALUES (11, '订单列表', 4, '/order/list', 3001);
INSERT INTO `menu` VALUES (12, '账户信息', 5, '/user/info', 4001);
INSERT INTO `menu` VALUES (13, '角色权限', 6, '/auth/role', 6001);
INSERT INTO `menu` VALUES (15, '轮播图管理', 1, NULL, 1000);
INSERT INTO `menu` VALUES (16, '轮播图列表', 15, '/banner/list', 1001);
INSERT INTO `menu` VALUES (17, '菜单管理', 1, '', 7000);
INSERT INTO `menu` VALUES (18, '菜单分类', 17, '/auth/menu', 7001);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义 就是唯一标识',
  `orderId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `goodsId` int(11) NOT NULL COMMENT '商品id',
  `goodsNumber` int(11) NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单-商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (46, 'f2db15c0-9f5a-11ec-ad32-65dc077d7904', 52, 1);
INSERT INTO `order_goods` VALUES (47, 'fe9aacc0-9f5c-11ec-a563-838d9e0e85af', 47, 1);
INSERT INTO `order_goods` VALUES (48, 'fe9aacc0-9f5c-11ec-a563-838d9e0e85af', 52, 1);
INSERT INTO `order_goods` VALUES (49, '02c56ab0-9f5d-11ec-a563-838d9e0e85af', 48, 1);
INSERT INTO `order_goods` VALUES (50, '2d7c52a0-9f5d-11ec-a563-838d9e0e85af', 52, 1);
INSERT INTO `order_goods` VALUES (51, '3904e600-9f5d-11ec-a563-838d9e0e85af', 50, 1);
INSERT INTO `order_goods` VALUES (52, '6115c0f0-9f6d-11ec-9fdf-f15ea67a406b', 50, 3);
INSERT INTO `order_goods` VALUES (53, '4f032610-9f71-11ec-a081-1f362a4853b2', 50, 2);
INSERT INTO `order_goods` VALUES (54, '0c9ce620-9f72-11ec-8fb7-77418b702cbf', 43, 1);
INSERT INTO `order_goods` VALUES (55, '670b1370-9f72-11ec-8fb7-77418b702cbf', 53, 1);
INSERT INTO `order_goods` VALUES (56, 'b2a52be0-9f72-11ec-8fb7-77418b702cbf', 53, 1);
INSERT INTO `order_goods` VALUES (57, '478cf8f0-9fb9-11ec-8d3b-5f800b779ddd', 45, 1);
INSERT INTO `order_goods` VALUES (58, '478cf8f0-9fb9-11ec-8d3b-5f800b779ddd', 53, 1);
INSERT INTO `order_goods` VALUES (59, '736d0220-9fba-11ec-8d3b-5f800b779ddd', 46, 1);
INSERT INTO `order_goods` VALUES (60, '5de96580-a044-11ec-87d6-673f3e8d8689', 43, 1);
INSERT INTO `order_goods` VALUES (61, '64569960-a044-11ec-87d6-673f3e8d8689', 44, 1);
INSERT INTO `order_goods` VALUES (62, '0df10db0-a0e1-11ec-907d-fbbe06c18ce2', 52, 1);
INSERT INTO `order_goods` VALUES (63, 'd5a5ea90-a1f6-11ec-b6b7-99bad28222d5', 51, 3);
INSERT INTO `order_goods` VALUES (64, 'd5a5ea90-a1f6-11ec-b6b7-99bad28222d5', 50, 4);

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderState` int(1) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `orderState`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单状态-字典表' ROW_FORMAT = Dynamic;

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
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '无意义 唯一标识',
  `orderId` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid生成',
  `openid` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 ',
  `payTime` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `shipTime` timestamp(0) NULL DEFAULT NULL COMMENT '发货时间 后台填写',
  `receivedTime` timestamp(0) NULL DEFAULT NULL COMMENT '收货时间  只可以是用户手动点击确认收货的那个时间',
  `finishTime` timestamp(0) NULL DEFAULT NULL COMMENT '交易完成时间 就是你点击完确认收货的时间，你不点击确认收货就快递发货时间加15天',
  `closeTime` timestamp(0) NULL DEFAULT NULL COMMENT '交易关闭时间 就是买家取消订单/卖家取消订单 / 整个流程结束了 / 买家超过3天未付款 这个情况先不写',
  `updateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间  ',
  `addressId` int(11) NOT NULL COMMENT '快递地址id',
  `freightPrice` decimal(6, 0) NULL DEFAULT NULL COMMENT '邮费',
  `shipName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司 四个字的公司',
  `shipNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号 最长的是20位',
  `orderState` int(1) NOT NULL DEFAULT 0 COMMENT '状态字典 关联状态表',
  `state` int(1) NOT NULL DEFAULT 1 COMMENT '1-正常，0-删除',
  `refundState` int(1) NULL DEFAULT 0 COMMENT '退款状态 0 否 1 退款',
  `note` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsPrices` decimal(8, 2) NOT NULL COMMENT '商品价格',
  `refundReason` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (00000000043, 'f2db15c0-9f5a-11ec-ad32-65dc077d7904', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 11:42:31', '2022-03-09 11:42:32', NULL, NULL, NULL, NULL, '2022-03-09 11:42:32', 6, 0, NULL, NULL, 1, 1, 0, '', 299.00, NULL);
INSERT INTO `orders` VALUES (00000000044, 'fe9aacc0-9f5c-11ec-a563-838d9e0e85af', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 11:57:09', '2022-03-09 11:57:10', NULL, NULL, NULL, NULL, '2022-03-09 11:57:10', 6, 0, NULL, NULL, 1, 1, 0, '', 358.00, NULL);
INSERT INTO `orders` VALUES (00000000045, '02c56ab0-9f5d-11ec-a563-838d9e0e85af', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 11:57:16', '2022-03-09 23:05:28', NULL, NULL, NULL, NULL, '2022-03-09 23:05:28', 6, 0, NULL, NULL, 1, 1, 0, '', 1499.00, NULL);
INSERT INTO `orders` VALUES (00000000046, '2d7c52a0-9f5d-11ec-a563-838d9e0e85af', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 11:58:28', '2022-03-09 11:58:29', NULL, NULL, NULL, NULL, '2022-03-10 09:49:31', 6, 0, NULL, NULL, 6, 1, 0, '', 299.00, NULL);
INSERT INTO `orders` VALUES (00000000047, '3904e600-9f5d-11ec-a563-838d9e0e85af', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 11:58:47', '2022-03-09 11:58:49', '2022-03-10 09:43:27', NULL, NULL, NULL, '2022-03-10 09:54:34', 6, 0, '韵达快递', '123456789', 6, 1, 0, '', 4499.00, NULL);
INSERT INTO `orders` VALUES (00000000048, '6115c0f0-9f6d-11ec-9fdf-f15ea67a406b', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 13:54:27', '2022-03-09 13:54:28', NULL, NULL, NULL, NULL, '2022-03-09 14:13:03', 6, 0, NULL, NULL, 4, 1, 1, '', 13497.00, '1111');
INSERT INTO `orders` VALUES (00000000049, '4f032610-9f71-11ec-a081-1f362a4853b2', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 14:22:34', NULL, NULL, NULL, NULL, '2022-03-09 14:23:01', '2022-03-09 14:23:01', 6, 0, NULL, NULL, 6, 1, 0, '', 8998.00, NULL);
INSERT INTO `orders` VALUES (00000000050, '0c9ce620-9f72-11ec-8fb7-77418b702cbf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 14:27:52', NULL, NULL, NULL, NULL, '2022-03-09 14:28:02', '2022-03-10 09:55:18', 6, 0, 'null', 'null', 6, 1, 0, '111', 3899.00, NULL);
INSERT INTO `orders` VALUES (00000000051, '670b1370-9f72-11ec-8fb7-77418b702cbf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 14:30:24', NULL, NULL, NULL, NULL, '2022-03-09 14:31:35', '2022-03-12 17:57:35', 6, 0, 'null', 'null', 6, 1, 0, '13213', 269.00, NULL);
INSERT INTO `orders` VALUES (00000000052, 'b2a52be0-9f72-11ec-8fb7-77418b702cbf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 14:32:31', '2022-03-09 14:32:32', NULL, NULL, NULL, NULL, '2022-03-09 14:43:57', 6, 0, NULL, NULL, 5, 1, 1, '', 269.00, '1321321313');
INSERT INTO `orders` VALUES (00000000054, '736d0220-9fba-11ec-8d3b-5f800b779ddd', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-09 23:06:09', NULL, NULL, NULL, NULL, '2022-03-11 10:07:06', '2022-03-12 17:51:17', 6, 0, '', '', 6, 1, 0, 'test', 19998.00, NULL);
INSERT INTO `orders` VALUES (00000000056, '64569960-a044-11ec-87d6-673f3e8d8689', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-10 15:33:34', '2022-03-10 15:33:47', NULL, NULL, NULL, NULL, '2022-03-12 17:57:26', 6, 0, NULL, NULL, 6, 1, 0, '', 399.00, NULL);
INSERT INTO `orders` VALUES (00000000057, '0df10db0-a0e1-11ec-907d-fbbe06c18ce2', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-11 10:15:00', '2022-03-12 17:49:18', NULL, NULL, NULL, NULL, '2022-03-12 17:57:21', 6, 0, 'tes', '121212121212', 6, 1, 0, '2121212', 299.00, NULL);
INSERT INTO `orders` VALUES (00000000063, 'd5a5ea90-a1f6-11ec-b6b7-99bad28222d5', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '2022-03-12 19:23:26', '2022-03-12 19:23:29', NULL, NULL, NULL, NULL, '2022-03-12 19:23:29', 8, 0, NULL, NULL, 1, 1, 0, '', 18893.00, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称 5个汉字',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `roleId` int(11) NOT NULL COMMENT '角色id 外键',
  `menuId` int(11) NOT NULL COMMENT '权限id 外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 17);
INSERT INTO `role_menu` VALUES (2, 1, 18);
INSERT INTO `role_menu` VALUES (3, 2, 17);
INSERT INTO `role_menu` VALUES (4, 2, 18);
INSERT INTO `role_menu` VALUES (5, 1, 3);
INSERT INTO `role_menu` VALUES (6, 1, 10);
INSERT INTO `role_menu` VALUES (9, 1, 5);
INSERT INTO `role_menu` VALUES (10, 1, 12);
INSERT INTO `role_menu` VALUES (14, 1, 6);
INSERT INTO `role_menu` VALUES (15, 1, 13);
INSERT INTO `role_menu` VALUES (23, 2, 4);
INSERT INTO `role_menu` VALUES (24, 2, 11);
INSERT INTO `role_menu` VALUES (25, 2, 5);
INSERT INTO `role_menu` VALUES (26, 2, 12);
INSERT INTO `role_menu` VALUES (27, 2, 2);
INSERT INTO `role_menu` VALUES (28, 2, 7);
INSERT INTO `role_menu` VALUES (29, 2, 8);
INSERT INTO `role_menu` VALUES (30, 2, 9);
INSERT INTO `role_menu` VALUES (134, 2, 15);
INSERT INTO `role_menu` VALUES (135, 2, 16);
INSERT INTO `role_menu` VALUES (136, 1, 15);
INSERT INTO `role_menu` VALUES (137, 1, 16);
INSERT INTO `role_menu` VALUES (138, 1, 2);
INSERT INTO `role_menu` VALUES (139, 1, 7);
INSERT INTO `role_menu` VALUES (140, 1, 8);
INSERT INTO `role_menu` VALUES (141, 1, 9);
INSERT INTO `role_menu` VALUES (142, 1, 4);
INSERT INTO `role_menu` VALUES (143, 1, 11);
INSERT INTO `role_menu` VALUES (154, 3, 15);
INSERT INTO `role_menu` VALUES (155, 3, 16);
INSERT INTO `role_menu` VALUES (158, 3, 2);
INSERT INTO `role_menu` VALUES (159, 3, 7);
INSERT INTO `role_menu` VALUES (160, 3, 8);
INSERT INTO `role_menu` VALUES (161, 3, 9);
INSERT INTO `role_menu` VALUES (162, 3, 4);
INSERT INTO `role_menu` VALUES (163, 3, 11);
INSERT INTO `role_menu` VALUES (164, 3, 5);
INSERT INTO `role_menu` VALUES (165, 3, 12);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `gender` int(1) NOT NULL DEFAULT 0 COMMENT '性别 0：未知、1：男、2：女',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT './images/avatar/default.jpg' COMMENT '头像',
  `country` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `openid` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小程序唯一标示id',
  `session_key` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会话密钥',
  PRIMARY KEY (`id`, `openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'V.', 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicSf2eL9ic6HELjK4lFdoETffEOZm6bGgJa7a7aMHuDXGxA5sKhMAWU3WbcZiaW6JS8tCCmQbLMOD2sbuRVuu1Ew/132', '', '', '', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'WALVjxE14q9NUat87h+kEw==');

SET FOREIGN_KEY_CHECKS = 1;

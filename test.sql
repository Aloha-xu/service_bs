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

 Date: 28/02/2022 00:03:20
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
INSERT INTO `address` VALUES (10, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xx', '13652489854', '吉林', '通化', '梅河口市', 'xxxxx', 1, 'aaaaaaa');
INSERT INTO `address` VALUES (4, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '罗志祥', '15863008280', '山东省', '济南市', '历下区', '宜昌路', 0, '五栋一座五栋一座五栋一座五栋一座');
INSERT INTO `address` VALUES (5, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '欧阳靖', '15194250468', '辽宁', '沈阳', '和平区', '崇景路', 0, '五五栋一座五栋一座一座');
INSERT INTO `address` VALUES (6, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '黄晓明', '15194250468', '广东省', '广州市', '荔湾区', '鞍山路', 0, '五栋一座630五栋一座五栋一座五栋一座');
INSERT INTO `address` VALUES (7, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '赵薇', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 0, '五五栋一座五栋一座五栋一座一座');
INSERT INTO `address` VALUES (8, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '林心如', '15194250468', '广东省', '广州市', '海珠区', '重庆路', 0, '五五栋一座五栋一座一座602');
INSERT INTO `address` VALUES (9, 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'xxx', '13625042789', '北京', '北京', '东城区', NULL, 0, NULL);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `login_count` bigint(20) NOT NULL DEFAULT 1 COMMENT '登录次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '超级管理员', '男', 'http://localhost:3003/images/avatar/default.jpg', '15863008280', 'nn880328@126.com', '2019-05-14 20:39:31', '2020-10-14 14:44:16', 200);
INSERT INTO `admin` VALUES (2, 'moz', '123456', '黄小米', '女', 'http://localhost:3003/images/avatar/default.jpg', '13475829262', 'nn880328@126.com', '2019-05-11 18:21:37', '2020-10-10 10:48:38', 9);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `bannerId` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '0 - 下架  1 - 上架',
  PRIMARY KEY (`bannerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'http://114.132.239.118:3003/getpic/1645340176258.png', 1);
INSERT INTO `banner` VALUES (2, 'http://114.132.239.118:3003/getpic/1645340224079.JPG', 1);
INSERT INTO `banner` VALUES (3, 'http://114.132.239.118:3003/getpic/1645340237725.JPG', 1);
INSERT INTO `banner` VALUES (4, 'http://114.132.239.118:3003/getpic/1645340252782.jpg', 1);

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
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cateId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pId` int(11) NOT NULL COMMENT '父级id x',
  `level` int(11) NULL DEFAULT NULL COMMENT '层级 x',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cateId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '游戏', 0, 1, '');
INSERT INTO `category` VALUES (18, '女装', 1, NULL, 'http://localhost:3003/images/common/707d6060-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (2, '男装', 1, NULL, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');

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
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 'oShUg5dO2dJN7gjezrL3CvBOoHP0', 15);
INSERT INTO `collection` VALUES (2, 'oShUg5dO2dJN7gjezrL3CvBOoHP0', 38);

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
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图-360 x',
  `slider` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品轮播图片',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌 x',
  `detail` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `freight` decimal(10, 0) NULL DEFAULT 0 COMMENT '商品运费 ',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `state` int(11) NULL DEFAULT 1 COMMENT '0下架 1上架',
  `sellVolume` int(11) NULL DEFAULT 0 COMMENT '已售数量',
  PRIMARY KEY (`goodsId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (15, 18, '机械师F117荣耀版 游戏本七代i7-7700HQ/GTX1050Ti 4G独显游戏本笔记本电脑', 6999.00, 0, 'http://localhost:3003/images/goods/b5dcffe0-e7b0-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/b7604480-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/b8fc6850-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/ba1615b0-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/bb5a5580-e7b0-11e8-8eb5-2933d116d7fc_720.jpg', '机械师', '<p><img src=\"http://localhost:3003/images/details/c7c5f5e0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/c999a470-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cba81210-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ce3bdc50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ef071800-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f0bcde50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f2c44710-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f4ba98d0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 09:59:57', '2020-07-22 23:39:18', 1, 0);
INSERT INTO `goods` VALUES (16, 18, '【京东配送】AOC C2791VHE/WS 27英寸 1800R曲率 VA广视角 家用电竞双实力 不闪屏曲面显示器', 1249.00, 9, 'http://localhost:3003/images/goods/93016550-e7b1-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/948ebc10-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/95d9d9b0-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/96e3a890-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/98a6dc60-e7b1-11e8-8eb5-2933d116d7fc_720.jpg', 'AOC', '<p><img src=\"http://localhost:3003/images/details/a1e7c9b0-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/a3afdf80-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a55af770-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a7204e20-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a89fe940-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/aa1a0620-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:04:52', '2020-07-22 23:39:40', 1, 0);
INSERT INTO `goods` VALUES (17, 18, '京天（KOTIN）第八代i5 8400/GTX1050Ti 4GD独显吃鸡游戏组装机DIY台式组装电脑主机', 4599.00, 1000, 'http://localhost:3003/images/goods/0bda9730-e7b2-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/0f6d5ae0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/10eccef0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/11f628a0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg', '京天', '<p><img src=\"http://localhost:3003/images/details/201879b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/219a85d0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/232df710-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/24f326b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/266f8d80-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/28101e20-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/29d12f10-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2c030330-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:08:31', '2020-07-22 23:40:14', 1, 0);
INSERT INTO `goods` VALUES (18, 18, '惠普(HP) 幽灵Spectre x360 13.3英寸超轻薄翻转笔记本', 8499.00, 997, 'http://localhost:3003/images/goods/f56613b0-e7b3-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/f6df6d40-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f828b620-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f92083a0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/fa6d00d0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/fbd6a', 'HP', '<p><img src=\"http://localhost:3003/images/details/4a8f9220-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/4cda6c80-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/4f0a1dc0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/50ccb550-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/52886f10-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/554b86b0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/57857120-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/59596dd0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:31:26', '2020-07-22 23:40:37', 1, 0);
INSERT INTO `goods` VALUES (19, 2, '【5折抢购】CH新款潮流短袖T恤衫学生休闲假两件日系韩版潮修身纯色短T恤男', 49.00, 1000, 'http://localhost:3003/images/goods/a37041a0-e7b5-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/a4bdf750-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a66e1850-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a76b3d00-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a8b4fb10-e7b5-11e8-8eb5-2933d116d7fc_720.jpg', 'CH', '<p><img src=\"http://localhost:3003/images/details/b110df90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/b298b810-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b41fa630-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b59926d0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b7cca8a0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b90af500-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/baba2ba0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/bd659c90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:34:06', '2020-07-22 23:22:52', 1, 0);
INSERT INTO `goods` VALUES (24, 2, '幸福时光男装2017新款秋冬新款格子衬衫韩版休闲C35', 89.00, 1000, 'http://localhost:3003/images/goods/0b78fcf0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/0cd35cd0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/0e1b9440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/0f4c9a30-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/109f31e0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '幸福时光', '<p><img src=\"http://localhost:3003/images/details/1a3ff270-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/1b9dfbd0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1d630460-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1f1cc250-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2091d620-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2210adf0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/242758f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/25b30200-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/27f773c0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2a3a37d0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2c0bc380-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2dea6e90-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:44:30', '2020-07-22 23:21:46', 1, 0);
INSERT INTO `goods` VALUES (25, 2, '探路者Toread男装棉T恤-TAJF81937-C27X', 65.00, 992, 'http://localhost:3003/images/goods/9c360ee0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/9dd47ca0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/9f6f19d0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a0bea440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a1be39f0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '探路者', '<p><img src=\"http://localhost:3003/images/details/ac04fe80-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/ad9dee00-e7b7-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/af0f3140-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b07fd840-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b258b6f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b3c147a0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b52fcbc0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b719e880-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:48:13', '2020-07-22 23:22:23', 1, 0);
INSERT INTO `goods` VALUES (26, 2, 'AIRTEX亚特户外男女防晒衣轻薄透气弹力皮肤风衣夹克长款外套M2169&W2170', 259.00, 992, 'http://localhost:3003/images/goods/ef53fb50-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/f0a6e120-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f1f13b70-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f2e119b0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f41a0ee0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'AIRTEX', '<p><img src=\"http://localhost:3003/images/details/03eb2160-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/05a83ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/06e638f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/08607ce0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/0a104fc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/0bb43bc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1f121e80-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2121c4a0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/246e5790-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/26c0fa20-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/28c3cf00-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:51:24', '2020-07-22 23:20:45', 1, 0);
INSERT INTO `goods` VALUES (27, 2, '永久（FOREVER）自行车24速山地车26寸转把双碟刹男女式学生单车 猎狐T01-A', 599.00, 994, 'http://localhost:3003/images/goods/6de67a60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/6f328260-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/708a9850-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/7160d410-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/73521cc0-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '永久', '<p><img src=\"http://localhost:3003/images/details/7a82c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/7bd78240-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/7d807750-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/7eb1a450-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/80547ee0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/81b60ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/837ce800-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/85267950-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:53:56', '2020-07-22 23:31:53', 1, 0);
INSERT INTO `goods` VALUES (28, 2, '凤凰 高碳钢破风设计21速钳型刹越野学生车弯把公路车自行车', 768.00, 998, 'http://localhost:3003/images/goods/b63efc60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/b8042c00-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/b95d5360-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/ba73a560-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '凤凰', '<p><img src=\"http://localhost:3003/images/details/c11f8ff0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/c2d667b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c47857e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c5d1cd60-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c7597ed0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ca644dd0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cbf9e1f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cd84c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cef4d270-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d1a684f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d3d090e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d5f93d40-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d8684170-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/db0867c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/defc1020-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/e18b6d90-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/e47c24e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f472c0c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:57:06', '2020-07-22 23:31:37', 1, 0);
INSERT INTO `goods` VALUES (29, 2, '法式桔梗碎花连衣裙女夏小清新复古方领泡泡袖小个子2020夏装新款', 219.00, 1000, 'http://localhost:3003/images/goods/08a04fe0-cc2d-11ea-a0c3-4166efc6fb01_360.jpeg', 'http://localhost:3003/images/goods/0fc08010-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/12acca90-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/151d2e50-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/174ae3c0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/1a30c5a0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg', 'Hyliangpin', '<p><img src=\"http://localhost:3003/images/details/96e84320-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3003/images/details/d3f47770-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/19fd8b30-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/1ea34580-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-07-22 23:15:43', '2020-07-22 23:18:44', 1, 0);
INSERT INTO `goods` VALUES (30, 2, '大码女装2020夏装新款微胖妹妹mm仙女中长款雪纺显瘦遮肚子连衣裙', 299.00, 1000, 'http://localhost:3003/images/goods/172bd770-dbee-11ea-8858-c992a1c4bc0e_360.png', 'http://localhost:3003/images/goods/1c4e89f0-dbee-11ea-8858-c992a1c4bc0e_720.png,http://localhost:3003/images/goods/1fe12690-dbee-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/22fee150-dbee-11ea-8858-c992a1c4bc0e_720.jpeg', '韩风', '<p><img src=\"http://localhost:3003/images/details/27fc5890-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/2c0c6290-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:19:14', NULL, 1, 0);
INSERT INTO `goods` VALUES (31, 2, '2020夏季新款女装胖mm大码气质显瘦方领泡泡袖高腰雪纺波点连衣裙', 116.00, 1000, 'http://localhost:3003/images/goods/b4bef970-dbf0-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/bb98aac0-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/c017a330-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/ccdd2360-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg', '布拉格', '<p><img src=\"http://localhost:3003/images/details/d3e81de0-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3003/images/details/dae6bc50-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/ea52f280-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-08-12 00:37:38', NULL, 1, 0);
INSERT INTO `goods` VALUES (32, 2, '方领连衣裙2020夏新款职场ol气质系带收腰a字裙女', 287.00, 993, 'http://localhost:3003/images/goods/3021c6f0-dbf2-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/369d2ba0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/3c3dc0b0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/4070e310-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg', '粉领', '<p><img src=\"http://localhost:3003/images/details/46cd2700-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/4c2f7a90-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/532c4440-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:47:52', NULL, 1, 0);
INSERT INTO `goods` VALUES (33, 2, '夏季气质性感v领连衣裙纯色泡泡袖连衣裙中长款收腰显瘦连衣裙', 689.00, 996, 'http://localhost:3003/images/goods/f8d07b90-dbf3-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/02430030-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/09cffbf0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/10c6f940-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'UC', '<p><img src=\"http://localhost:3003/images/details/16dd81a0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/20eb34d0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:00:37', NULL, 1, 0);
INSERT INTO `goods` VALUES (34, 2, '复古温柔赫本风优雅方领丝绒连衣裙', 199.00, 792, 'http://localhost:3003/images/goods/6afe5f20-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/712cdc50-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/77662ef0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/7d0d0590-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'WEMEN', '<p><img src=\"http://localhost:3003/images/details/83dad000-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/8a9cdaa0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/90830430-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:03:45', NULL, 1, 0);
INSERT INTO `goods` VALUES (35, 2, '阔色小紫薯复古方领连衣裙2020夏新款韩版复古盘扣格纹裙子女', 99.00, 997, 'http://localhost:3003/images/goods/f9d65d60-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/fe583c00-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/0525b850-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/0a2fd9c0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'CC', '<p><img src=\"http://localhost:3003/images/details/10ffee20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/157b3d10-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/190eeb20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:07:25', NULL, 1, 0);
INSERT INTO `goods` VALUES (36, 2, '方领连衣裙2020夏新款韩版格纹裙子', 269.00, 992, 'http://localhost:3003/images/goods/c4867cc0-dbf5-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/c8047ff0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/caf202f0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/ce90d490-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'Lisa', '<p><img src=\"http://localhost:3003/images/details/d3bc1290-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/d7cd7c20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:13:01', NULL, 1, 0);
INSERT INTO `goods` VALUES (37, 2, '梵希2020夏季新款复古方领泡泡袖开叉短袖连衣裙收腰仙女裙小白裙', 389.00, 967, 'http://localhost:3003/images/goods/8025cc60-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/84e72500-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/8a653df0-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg', '梵希', '<p><img src=\"http://localhost:3003/images/details/9fbec9a0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/a446e9d0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a889eab0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:18:26', NULL, 1, 0);
INSERT INTO `goods` VALUES (38, 2, '蜜搭 新款复古收腰桔梗初恋裙 夏法式方领绿色泡泡袖中长款连衣裙 158', 98.00, 997, 'http://localhost:3003/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/00176640-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/04569690-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg', '蜜芽', '<p><img src=\"http://localhost:3003/images/details/0aabae90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/0f139c90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/13071de0-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:21:44', NULL, 1, 0);
INSERT INTO `goods` VALUES (39, 2, '蜜搭 新款复古收腰桔梗初恋裙 夏法式方领绿色泡泡袖中长款连衣裙 158', 98.00, 993, 'http://localhost:3003/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/00176640-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/04569690-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg', '蜜芽', '<p><img src=\"http://localhost:3003/images/details/0aabae90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/0f139c90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/13071de0-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:21:44', NULL, 1, 0);

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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pId` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接url',
  `menu_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  `icon_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '全部菜单', 0, NULL, NULL, '0', NULL);
INSERT INTO `menu` VALUES (2, '商品管理', 1, NULL, '', '2000', '16');
INSERT INTO `menu` VALUES (3, '用户管理', 1, NULL, '', '5000', '8');
INSERT INTO `menu` VALUES (4, '订单管理', 1, NULL, '', '3000', '147');
INSERT INTO `menu` VALUES (5, '账户设置', 1, NULL, '', '4000', '6');
INSERT INTO `menu` VALUES (6, '权限设置', 1, NULL, '', '6000', '182');
INSERT INTO `menu` VALUES (7, '商品分类', 2, NULL, '/goods/category/', '2001', '');
INSERT INTO `menu` VALUES (8, '发布商品', 2, NULL, '/goods/release', '2002', '');
INSERT INTO `menu` VALUES (9, '商品列表', 2, NULL, '/goods/list', '2003', '');
INSERT INTO `menu` VALUES (10, '用户列表', 3, NULL, '/user/list', '5001', NULL);
INSERT INTO `menu` VALUES (11, '订单列表', 4, NULL, '/order/list', '3001', '');
INSERT INTO `menu` VALUES (12, '账户信息', 5, NULL, '/user/info', '4001', NULL);
INSERT INTO `menu` VALUES (13, '用户角色', 6, NULL, '/auth/role', '6001', NULL);
INSERT INTO `menu` VALUES (14, '菜单权限', 6, NULL, '/auth/menu', '6002', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单-商品表' ROW_FORMAT = Fixed;

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
INSERT INTO `order_status` VALUES (5, 3, 'BUYER_RECEIVED', '买家已收货/交易完成');
INSERT INTO `order_status` VALUES (6, 4, 'GOODS_RETURNING', '退货中');
INSERT INTO `order_status` VALUES (7, 5, 'GOODS_RETURNED_SUCCESS', '退货成功');
INSERT INTO `order_status` VALUES (8, 6, 'ORDER_CLOSED', '订单关闭');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义 唯一标识',
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'uuid生成',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `addressId` int(11) NULL DEFAULT NULL COMMENT '快递地址id',
  `payTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `freightPrice` double(20, 2) NULL DEFAULT NULL COMMENT '邮费',
  `shipTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间X',
  `ship_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司X',
  `ship_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号X',
  `receivedTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货时间 x',
  `createTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间 ',
  `updateTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间  ',
  `finishTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易完成时间',
  `closeTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易关闭时间',
  `orderState` int(11) NULL DEFAULT 0 COMMENT '状态字典 关联状态表',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `refundState` int(11) NULL DEFAULT 0 COMMENT '退款状态 0 否 1 退款',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsPrices` double(20, 2) NULL DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

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
INSERT INTO `user` VALUES (10, 'V.', '0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/WicSf2eL9ic6HELjK4lFdoETffEOZm6bGgJa7a7aMHuDXGxA5sKhMAWU3WbcZiaW6JS8tCCmQbLMOD2sbuRVuu1Ew/132', '', '', '', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', 'ivLG017Aw4/anxjCt0va4A==');

SET FOREIGN_KEY_CHECKS = 1;

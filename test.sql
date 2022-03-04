/*
 Navicat Premium Data Transfer

 Source Server         : bysj
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 04/03/2022 18:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id 唯一标识openid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `county` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '县区',
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `isDefault` int(0) NULL DEFAULT 1 COMMENT '是否默认',
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
  `adminId` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册邮箱 x',
  `createTime` datetime(0) NOT NULL COMMENT '创建时间',
  `loginTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登录时间',
  `loginCount` bigint(0) NOT NULL DEFAULT 1 COMMENT '登录次数',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '超级管理员', '男', 'http://localhost:3003/images/avatar/default.jpg', '15863008280', 'nn880328@126.com', '2019-05-14 20:39:31', '2022-03-04 18:12:30', 237);
INSERT INTO `admin` VALUES (2, 'moz', '123456', '黄小米', '女', 'http://localhost:3003/images/avatar/default.jpg', '13475829262', 'nn880328@126.com', '2019-05-11 18:21:37', '2020-10-10 10:48:38', 9);
INSERT INTO `admin` VALUES (4, 'xuuuu', '123456', 'das', '男', '/images/avatar/default.jpg', '13620427379', NULL, '2022-03-04 10:34:23', '2022-03-04 10:34:23', 1);
INSERT INTO `admin` VALUES (5, 'xuuuuu', '123456', 'aaaa', '男', '/images/avatar/default.jpg', '13620427379', NULL, '2022-03-04 10:37:10', '2022-03-04 10:37:10', 1);
INSERT INTO `admin` VALUES (6, 'admin01', '123456', 'xx', '男', '/images/avatar/default.jpg', '13620427379', NULL, '2022-03-04 10:39:18', '2022-03-04 10:39:18', 1);

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `adminId` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` int(0) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1, 1);
INSERT INTO `admin_role` VALUES (2, 2, 2);
INSERT INTO `admin_role` VALUES (4, 4, 3);
INSERT INTO `admin_role` VALUES (5, 5, 3);
INSERT INTO `admin_role` VALUES (6, 6, 3);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `bannerId` int(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT 1 COMMENT '0 - 下架  1 - 上架',
  `createTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`bannerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (2, 'http://114.132.239.118:3003/getpic/1645340224079.JPG', 1, '1646013058');
INSERT INTO `banner` VALUES (3, 'http://114.132.239.118:3003/getpic/1645340237725.JPG', 1, '1646013058');
INSERT INTO `banner` VALUES (4, 'http://114.132.239.118:3003/getpic/1645340252782.jpg', 1, '1646013058');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartId` int(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `goodsId` int(0) NOT NULL COMMENT '商品id',
  `goodsNumber` int(0) NOT NULL COMMENT '商品数量',
  `state` tinyint(0) NULL DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `createTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cateId` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pId` int(0) NOT NULL COMMENT '父级id',
  `level` int(0) NULL DEFAULT NULL COMMENT '层级 x  弃用',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弃用',
  PRIMARY KEY (`cateId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '全部', 0, 1, '');
INSERT INTO `category` VALUES (18, '女装', 1, 2, 'http://localhost:3003/images/common/707d6060-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (2, '男装', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (3, 'JBL', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (4, '套装', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (5, '户外', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (6, '室内', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');
INSERT INTO `category` VALUES (7, '猫王', 1, 2, 'http://localhost:3003/images/common/a1306ae0-cbb7-11ea-8d4a-bf562cfb5ba9.jpeg');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `goodsId` int(0) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收藏商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 'oShUg5dO2dJN7gjezrL3CvBOoHP0', 15);
INSERT INTO `collection` VALUES (2, 'oShUg5dO2dJN7gjezrL3CvBOoHP0', 38);

-- ----------------------------
-- Table structure for foot_print
-- ----------------------------
DROP TABLE IF EXISTS `foot_print`;
CREATE TABLE `foot_print`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodsId` int(0) NOT NULL,
  PRIMARY KEY (`id`, `openid`, `goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `goodsId` int(0) NOT NULL AUTO_INCREMENT,
  `cateId` int(0) NOT NULL COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `inventory` int(0) NOT NULL COMMENT '库存 ',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图-360 x',
  `slider` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品轮播图片',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌 x',
  `detail` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `freight` decimal(10, 0) NULL DEFAULT 0 COMMENT '商品运费 ',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `state` int(0) NULL DEFAULT 1 COMMENT '0下架 1上架',
  `sellVolume` int(0) NULL DEFAULT 0 COMMENT '已售数量',
  PRIMARY KEY (`goodsId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (15, 18, '机械师F117荣耀版 游戏本七代i7-7700HQ/GTX1050Ti 4G独显游戏本笔记本电脑', 6999.00, 0, 'http://localhost:3003/images/goods/b5dcffe0-e7b0-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/b7604480-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/b8fc6850-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/ba1615b0-e7b0-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/bb5a5580-e7b0-11e8-8eb5-2933d116d7fc_720.jpg', '机械师', '<p><img src=\"http://localhost:3003/images/details/c7c5f5e0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/c999a470-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cba81210-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ce3bdc50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ef071800-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f0bcde50-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f2c44710-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f4ba98d0-e7b0-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 09:59:57', '2020-07-22 23:39:18', 1, 0);
INSERT INTO `goods` VALUES (16, 18, '【京东配送】AOC C2791VHE/WS 27英寸 1800R曲率 VA广视角 家用电竞双实力 不闪屏曲面显示器', 1249.00, 7, 'http://localhost:3003/images/goods/93016550-e7b1-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/948ebc10-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/95d9d9b0-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/96e3a890-e7b1-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/98a6dc60-e7b1-11e8-8eb5-2933d116d7fc_720.jpg', 'AOC', '<p><img src=\"http://localhost:3003/images/details/a1e7c9b0-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/a3afdf80-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a55af770-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a7204e20-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a89fe940-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/aa1a0620-e7b1-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:04:52', '2020-07-22 23:39:40', 1, 0);
INSERT INTO `goods` VALUES (17, 18, '京天（KOTIN）第八代i5 8400/GTX1050Ti 4GD独显吃鸡游戏组装机DIY台式组装电脑主机', 4599.00, 1000, 'http://localhost:3003/images/goods/0bda9730-e7b2-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/0f6d5ae0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/10eccef0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/11f628a0-e7b2-11e8-8eb5-2933d116d7fc_720.jpg', '京天', '<p><img src=\"http://localhost:3003/images/details/201879b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/219a85d0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/232df710-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/24f326b0-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/266f8d80-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/28101e20-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/29d12f10-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2c030330-e7b2-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:08:31', '2020-07-22 23:40:14', 1, 0);
INSERT INTO `goods` VALUES (18, 18, '惠普(HP) 幽灵Spectre x360 13.3英寸超轻薄翻转笔记本', 8499.00, 995, 'http://localhost:3003/images/goods/f56613b0-e7b3-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/f6df6d40-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f828b620-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f92083a0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/fa6d00d0-e7b3-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/fbd6a', 'HP', '<p><img src=\"http://localhost:3003/images/details/4a8f9220-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/4cda6c80-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/4f0a1dc0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/50ccb550-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/52886f10-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/554b86b0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/57857120-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/59596dd0-e7b5-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:31:26', '2020-07-22 23:40:37', 1, 0);
INSERT INTO `goods` VALUES (19, 2, '【5折抢购】CH新款潮流短袖T恤衫学生休闲假两件日系韩版潮修身纯色短T恤男', 49.00, 1000, 'http://localhost:3003/images/goods/a37041a0-e7b5-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/a4bdf750-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a66e1850-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a76b3d00-e7b5-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a8b4fb10-e7b5-11e8-8eb5-2933d116d7fc_720.jpg', 'CH', '<p><img src=\"http://localhost:3003/images/details/b110df90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/b298b810-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b41fa630-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b59926d0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b7cca8a0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b90af500-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/baba2ba0-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/bd659c90-e7b5-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:34:06', '2020-07-22 23:22:52', 1, 0);
INSERT INTO `goods` VALUES (24, 2, '幸福时光男装2017新款秋冬新款格子衬衫韩版休闲C35', 89.00, 1000, 'http://localhost:3003/images/goods/0b78fcf0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/0cd35cd0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/0e1b9440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/0f4c9a30-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/109f31e0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '幸福时光', '<p><img src=\"http://localhost:3003/images/details/1a3ff270-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/1b9dfbd0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1d630460-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1f1cc250-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2091d620-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2210adf0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/242758f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/25b30200-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/27f773c0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2a3a37d0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2c0bc380-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2dea6e90-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:44:30', '2020-07-22 23:21:46', 1, 0);
INSERT INTO `goods` VALUES (25, 2, '探路者Toread男装棉T恤-TAJF81937-C27X', 65.00, 992, 'http://localhost:3003/images/goods/9c360ee0-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/9dd47ca0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/9f6f19d0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a0bea440-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/a1be39f0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', '探路者', '<p><img src=\"http://localhost:3003/images/details/ac04fe80-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/ad9dee00-e7b7-11e8-8eb5-2933d116d7fc.png\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/af0f3140-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b07fd840-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b258b6f0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b3c147a0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b52fcbc0-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/b719e880-e7b7-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:48:13', '2020-07-22 23:22:23', 1, 0);
INSERT INTO `goods` VALUES (26, 2, 'AIRTEX亚特户外男女防晒衣轻薄透气弹力皮肤风衣夹克长款外套M2169&W2170', 259.00, 992, 'http://localhost:3003/images/goods/ef53fb50-e7b7-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/f0a6e120-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f1f13b70-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f2e119b0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/f41a0ee0-e7b7-11e8-8eb5-2933d116d7fc_720.jpg', 'AIRTEX', '<p><img src=\"http://localhost:3003/images/details/03eb2160-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/05a83ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/06e638f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/08607ce0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/0a104fc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/0bb43bc0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/1f121e80-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/2121c4a0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/246e5790-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/26c0fa20-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/28c3cf00-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:51:24', '2020-07-22 23:20:45', 1, 0);
INSERT INTO `goods` VALUES (27, 2, '永久（FOREVER）自行车24速山地车26寸转把双碟刹男女式学生单车 猎狐T01-A', 599.00, 994, 'http://localhost:3003/images/goods/6de67a60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/6f328260-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/708a9850-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/7160d410-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/73521cc0-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '永久', '<p><img src=\"http://localhost:3003/images/details/7a82c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/7bd78240-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/7d807750-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/7eb1a450-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/80547ee0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/81b60ab0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/837ce800-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/85267950-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:53:56', '2020-07-22 23:31:53', 1, 0);
INSERT INTO `goods` VALUES (28, 2, '凤凰 高碳钢破风设计21速钳型刹越野学生车弯把公路车自行车', 768.00, 998, 'http://localhost:3003/images/goods/b63efc60-e7b8-11e8-8eb5-2933d116d7fc_360.jpg', 'http://localhost:3003/images/goods/b8042c00-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/b95d5360-e7b8-11e8-8eb5-2933d116d7fc_720.jpg,http://localhost:3003/images/goods/ba73a560-e7b8-11e8-8eb5-2933d116d7fc_720.jpg', '凤凰', '<p><img src=\"http://localhost:3003/images/details/c11f8ff0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/c2d667b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c47857e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c5d1cd60-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/c7597ed0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/ca644dd0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cbf9e1f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cd84c7b0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/cef4d270-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d1a684f0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d3d090e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d5f93d40-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/d8684170-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/db0867c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/defc1020-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/e18b6d90-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/e47c24e0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/f472c0c0-e7b8-11e8-8eb5-2933d116d7fc.jpg\" style=\"max-width: 100%;\"><br></p>', 0, '2018-11-14 10:57:06', '2020-07-22 23:31:37', 1, 0);
INSERT INTO `goods` VALUES (29, 2, '法式桔梗碎花连衣裙女夏小清新复古方领泡泡袖小个子2020夏装新款', 219.00, 1000, 'http://localhost:3003/images/goods/08a04fe0-cc2d-11ea-a0c3-4166efc6fb01_360.jpeg', 'http://localhost:3003/images/goods/0fc08010-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/12acca90-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/151d2e50-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/174ae3c0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg,http://localhost:3003/images/goods/1a30c5a0-cc2d-11ea-a0c3-4166efc6fb01_720.jpeg', 'Hyliangpin', '<p><img src=\"http://localhost:3003/images/details/96e84320-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3003/images/details/d3f47770-cc2d-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/19fd8b30-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/1ea34580-cc2e-11ea-a0c3-4166efc6fb01.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-07-22 23:15:43', '2020-07-22 23:18:44', 1, 0);
INSERT INTO `goods` VALUES (30, 2, '大码女装2020夏装新款微胖妹妹mm仙女中长款雪纺显瘦遮肚子连衣裙', 299.00, 1000, 'http://localhost:3003/images/goods/172bd770-dbee-11ea-8858-c992a1c4bc0e_360.png', 'http://localhost:3003/images/goods/1c4e89f0-dbee-11ea-8858-c992a1c4bc0e_720.png,http://localhost:3003/images/goods/1fe12690-dbee-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/22fee150-dbee-11ea-8858-c992a1c4bc0e_720.jpeg', '韩风', '<p><img src=\"http://localhost:3003/images/details/27fc5890-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/2c0c6290-dbee-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:19:14', NULL, 1, 0);
INSERT INTO `goods` VALUES (31, 2, '2020夏季新款女装胖mm大码气质显瘦方领泡泡袖高腰雪纺波点连衣裙', 116.00, 1000, 'http://localhost:3003/images/goods/b4bef970-dbf0-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/bb98aac0-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/c017a330-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/ccdd2360-dbf0-11ea-8858-c992a1c4bc0e_720.jpeg', '布拉格', '<p><img src=\"http://localhost:3003/images/details/d3e81de0-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"></p><p><img src=\"http://localhost:3003/images/details/dae6bc50-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p><p><img src=\"http://localhost:3003/images/details/ea52f280-dbf0-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><br></p>', 0, '2020-08-12 00:37:38', NULL, 1, 0);
INSERT INTO `goods` VALUES (32, 2, '方领连衣裙2020夏新款职场ol气质系带收腰a字裙女', 287.00, 992, 'http://localhost:3003/images/goods/3021c6f0-dbf2-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/369d2ba0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/3c3dc0b0-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/4070e310-dbf2-11ea-8858-c992a1c4bc0e_720.jpeg', '粉领', '<p><img src=\"http://localhost:3003/images/details/46cd2700-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/4c2f7a90-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/532c4440-dbf2-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 00:47:52', NULL, 1, 0);
INSERT INTO `goods` VALUES (33, 2, '夏季气质性感v领连衣裙纯色泡泡袖连衣裙中长款收腰显瘦连衣裙', 689.00, 994, 'http://localhost:3003/images/goods/f8d07b90-dbf3-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/02430030-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/09cffbf0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/10c6f940-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'UC', '<p><img src=\"http://localhost:3003/images/details/16dd81a0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/20eb34d0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:00:37', NULL, 1, 0);
INSERT INTO `goods` VALUES (34, 2, '复古温柔赫本风优雅方领丝绒连衣裙', 199.00, 791, 'http://localhost:3003/images/goods/6afe5f20-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/712cdc50-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/77662ef0-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/7d0d0590-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg', 'WEMEN', '<p><img src=\"http://localhost:3003/images/details/83dad000-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/8a9cdaa0-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/90830430-dbf4-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:03:45', NULL, 1, 0);
INSERT INTO `goods` VALUES (35, 2, '阔色小紫薯复古方领连衣裙2020夏新款韩版复古盘扣格纹裙子女', 99.00, 995, 'http://localhost:3003/images/goods/f9d65d60-dbf4-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/fe583c00-dbf4-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/0525b850-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/0a2fd9c0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'CC', '<p><img src=\"http://localhost:3003/images/details/10ffee20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/157b3d10-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/190eeb20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:07:25', NULL, 1, 0);
INSERT INTO `goods` VALUES (36, 2, '方领连衣裙2020夏新款韩版格纹裙子', 269.00, 992, 'http://localhost:3003/images/goods/c4867cc0-dbf5-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/c8047ff0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/caf202f0-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/ce90d490-dbf5-11ea-8858-c992a1c4bc0e_720.jpeg', 'Lisa', '<p><img src=\"http://localhost:3003/images/details/d3bc1290-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/d7cd7c20-dbf5-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:13:01', NULL, 1, 0);
INSERT INTO `goods` VALUES (37, 2, '梵希2020夏季新款复古方领泡泡袖开叉短袖连衣裙收腰仙女裙小白裙', 389.00, 967, 'http://localhost:3003/images/goods/8025cc60-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/84e72500-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/8a653df0-dbf6-11ea-8858-c992a1c4bc0e_720.jpeg', '梵希', '<p><img src=\"http://localhost:3003/images/details/9fbec9a0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/a446e9d0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/a889eab0-dbf6-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:18:26', NULL, 1, 0);
INSERT INTO `goods` VALUES (38, 2, '蜜搭 新款复古收腰桔梗初恋裙 夏法式方领绿色泡泡袖中长款连衣裙 158', 98.00, 995, 'http://localhost:3003/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/00176640-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/04569690-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg', '蜜芽', '<p><img src=\"http://localhost:3003/images/details/0aabae90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"/><img src=\"http://localhost:3003/images/details/0f139c90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"/><img src=\"http://localhost:3003/images/details/13071de0-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"/><br/></p>', 111, '2020-08-12 01:21:44', '2022-03-02 10:30:54', 0, 0);
INSERT INTO `goods` VALUES (39, 2, '蜜搭 新款复古收腰桔梗初恋裙 夏法式方领绿色泡泡袖中长款连衣裙 158', 98.00, 993, 'http://localhost:3003/images/goods/fa05bfe0-dbf6-11ea-8858-c992a1c4bc0e_360.jpeg', 'http://localhost:3003/images/goods/00176640-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg,http://localhost:3003/images/goods/04569690-dbf7-11ea-8858-c992a1c4bc0e_720.jpeg', '蜜芽', '<p><img src=\"http://localhost:3003/images/details/0aabae90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width:100%;\"><img src=\"http://localhost:3003/images/details/0f139c90-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><img src=\"http://localhost:3003/images/details/13071de0-dbf7-11ea-8858-c992a1c4bc0e.jpeg\" style=\"max-width: 100%;\"><br></p>', 0, '2020-08-12 01:21:44', NULL, 1, 0);

-- ----------------------------
-- Table structure for goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `goods_gallery`;
CREATE TABLE `goods_gallery`  (
  `galleryId` int(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT NULL,
  `goodsId` int(0) NULL DEFAULT NULL,
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
  `menuId` int(0) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `pId` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接url',
  `menuOrder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `menu` VALUES (17, '奥德赛', NULL, '', '', NULL);
INSERT INTO `menu` VALUES (18, '特斯特', 1, '', '', '2000');
INSERT INTO `menu` VALUES (24, 'test001', 1, '', '/12456', '7000');
INSERT INTO `menu` VALUES (25, 'jisoo', NULL, '', '/12456', '7001');
INSERT INTO `menu` VALUES (26, 'jisoo', NULL, '', '/12456', '7001');
INSERT INTO `menu` VALUES (27, 'test002', 24, '', '', '7002');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '无意义 就是唯一标识',
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `goodsId` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `goodsNumber` int(0) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单-商品表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (34, 'df71a400-9838-11ec-a313-df5adf775abf', 16, 1);
INSERT INTO `order_goods` VALUES (35, 'e59d13f0-9838-11ec-a313-df5adf775abf', 35, 1);
INSERT INTO `order_goods` VALUES (36, 'efae4990-9838-11ec-a313-df5adf775abf', 32, 1);
INSERT INTO `order_goods` VALUES (37, 'f68b7d50-9838-11ec-a313-df5adf775abf', 33, 1);
INSERT INTO `order_goods` VALUES (38, '3b054810-9845-11ec-a24b-85a3dbb23108', 38, 1);
INSERT INTO `order_goods` VALUES (39, '5dc33690-9846-11ec-94e4-3d7b253ffda3', 34, 1);
INSERT INTO `order_goods` VALUES (40, '8a16b050-986e-11ec-9a91-57a7d5d6eaf3', 35, 1);
INSERT INTO `order_goods` VALUES (41, '7e24dc90-98aa-11ec-904d-8f301c1e18d7', 18, 1);
INSERT INTO `order_goods` VALUES (42, '7e24dc90-98aa-11ec-904d-8f301c1e18d7', 16, 1);
INSERT INTO `order_goods` VALUES (43, '7e24dc90-98aa-11ec-904d-8f301c1e18d7', 38, 1);
INSERT INTO `order_goods` VALUES (44, '219b05c0-98ab-11ec-904d-8f301c1e18d7', 33, 1);
INSERT INTO `order_goods` VALUES (45, '2d46d890-98ab-11ec-904d-8f301c1e18d7', 18, 1);

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `orderState` tinyint(0) NULL DEFAULT NULL,
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
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '无意义 唯一标识',
  `orderId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid生成',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `createTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间 ',
  `payTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `shipTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货时间 后台填写',
  `receivedTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货时间  只可以是用户手动点击确认收货的那个时间',
  `finishTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易完成时间 就是你点击完确认收货的时间，你不点击确认收货就快递发货时间加15天',
  `closeTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易关闭时间 就是买家取消订单/卖家取消订单 / 整个流程结束了 / 买家超过3天未付款 这个情况先不写',
  `updateTime` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间  ',
  `addressId` int(0) NULL DEFAULT NULL COMMENT '快递地址id',
  `freightPrice` double(20, 2) NULL DEFAULT NULL COMMENT '邮费',
  `shipName` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `shipNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `orderState` int(0) NULL DEFAULT 0 COMMENT '状态字典 关联状态表',
  `state` int(0) NULL DEFAULT 1 COMMENT '1-正常，0-删除',
  `refundState` int(0) NULL DEFAULT 0 COMMENT '退款状态 0 否 1 退款',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsPrices` double(20, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `refundReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (33, 'df71a400-9838-11ec-a313-df5adf775abf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646013057', '1646013058', '1646226277', NULL, NULL, NULL, '1646226277', 10, 0.00, '啊啊啊', 'aaa', 2, 1, 0, '待发货', 1249.00, NULL);
INSERT INTO `orders` VALUES (34, 'e59d13f0-9838-11ec-a313-df5adf775abf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646013067', NULL, NULL, NULL, NULL, '1646018229', '1646018229', 10, 10.00, NULL, NULL, 6, 1, 0, '未付款', 99.00, NULL);
INSERT INTO `orders` VALUES (35, 'efae4990-9838-11ec-a313-df5adf775abf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646013084', '1646013085', '1646014085', '1646018883', '1646018883', NULL, '1646018883', 10, 0.00, NULL, NULL, 3, 1, 0, '待收货', 287.00, NULL);
INSERT INTO `orders` VALUES (36, 'f68b7d50-9838-11ec-a313-df5adf775abf', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646013096', '1646013097', '1646019085', '1646079085', NULL, NULL, '1646013097', 10, 0.00, NULL, NULL, 3, 1, 0, '已收货', 689.00, NULL);
INSERT INTO `orders` VALUES (37, '3b054810-9845-11ec-a24b-85a3dbb23108', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646018365', NULL, NULL, NULL, NULL, NULL, '1646062042', 10, 10.00, NULL, NULL, 2, 1, 0, '', 98.00, NULL);
INSERT INTO `orders` VALUES (38, '5dc33690-9846-11ec-94e4-3d7b253ffda3', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646018852', '1646018853', NULL, NULL, NULL, NULL, '1646018853', 10, 10.00, NULL, NULL, 1, 1, 0, '', 199.00, NULL);
INSERT INTO `orders` VALUES (39, '8a16b050-986e-11ec-9a91-57a7d5d6eaf3', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646036107', '1646036108', NULL, NULL, NULL, NULL, '1646227276', 10, 10.00, NULL, NULL, 5, 1, 1, '', 99.00, '不想要了');
INSERT INTO `orders` VALUES (40, '7e24dc90-98aa-11ec-904d-8f301c1e18d7', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646061856', '1646061858', NULL, NULL, NULL, NULL, '1646286849', 4, 0.00, 'null', 'null', 8, 1, 1, '托尔斯泰1111', 9846.00, '132132');
INSERT INTO `orders` VALUES (41, '219b05c0-98ab-11ec-904d-8f301c1e18d7', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646062131', NULL, NULL, NULL, NULL, NULL, '1646286860', 6, 0.00, 'null', 'null', 3, 1, 0, '阿大声道', 689.00, NULL);
INSERT INTO `orders` VALUES (42, '2d46d890-98ab-11ec-904d-8f301c1e18d7', 'oGDr80q7hxWmQf5BSJg2yy_FwqpQ', '1646062150', NULL, NULL, NULL, NULL, NULL, '1646228000', 6, 0.00, NULL, NULL, 6, 1, 0, '', 8499.00, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员');
INSERT INTO `role` VALUES (2, '管理员');
INSERT INTO `role` VALUES (3, '运营人员');
INSERT INTO `role` VALUES (4, '设计人员');
INSERT INTO `role` VALUES (5, '财务人员');
INSERT INTO `role` VALUES (6, '仓库人员');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `roleId` int(0) NULL DEFAULT NULL COMMENT '角色id',
  `menuId` int(0) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

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
INSERT INTO `role_menu` VALUES (16, 1, 14);
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
INSERT INTO `role_menu` VALUES (63, 1, 24);
INSERT INTO `role_menu` VALUES (64, 1, 25);
INSERT INTO `role_menu` VALUES (65, 1, 26);
INSERT INTO `role_menu` VALUES (66, 1, 27);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
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

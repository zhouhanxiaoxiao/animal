/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-08-14 18:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_animal_drosophila
-- ----------------------------
DROP TABLE IF EXISTS `cibr_animal_drosophila`;
CREATE TABLE `cibr_animal_drosophila` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '果蝇名称',
  `stock_id` varchar(255) NOT NULL COMMENT '果蝇编号',
  `genotype` varchar(255) NOT NULL COMMENT '基因型',
  `resource` varchar(255) DEFAULT NULL COMMENT '来源',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '保留字段，指向父类型',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `createUser` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_animal_drosophila
-- ----------------------------
INSERT INTO `cibr_animal_drosophila` VALUES ('200603c2c8a14237b1751b780b52ee2a', 'asdfasdf', 'sadfa', 'sdfa', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-08-10 06:51:49', '5646848a54754bbe833eba1c681cbe02');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815dceas1b62fcd', '果蝇', 'bc4f93', 'Drosophila simulans (Dsim\\w[501])', '中科院上化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815dceba1b23cd', '果蝇', 'b2cf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815dceba1b3d', '果蝇', 'bcfasd93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815dceba1b62f2', '果蝇', 'bcf93asdf', 'Drosophila simulans (Dsim\\w[501])', '中科院上海学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815dceba1b62fcd', '果蝇', 'bcf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43b815ds1b62fcd', '果蝇', 'bcf593', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生物化学与细术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43bdsdceba1b62fcd', '果蝇', 'b453cf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43bsdceba1b62fcd', '果蝇', 'bc32f93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c43bsddceba1b62fcd', '果蝇', 'b8cf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15174c4adeba1b62fcd', '果蝇', 'bc3f93', 'Drosophila simulans (Dsim\\w[501])', '中科院生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('94faab0f15sdc43b815dceba1b62fcd', '果蝇', 'b0cf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-14 06:55:47', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('98e5388bbe034fb1bc05a72ab32d1e57', '士大夫', 'sadfa', 'as', 'asdfasdf', null, '2020-08-14 10:06:36', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f760db82b98', '果蝇', 'bcf2378', 'w1118', '中科院上海生物化学与细胞生物学研究所果源与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f760db8a6b3b98', '果蝇', 'bcsdf78', 'w1118', '中科院上海生物究所果蝇资源与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f760db8a6b8b98', '果蝇', 'bcf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f760db8fssb98', '果蝇', 'bc3f78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资源平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f76fd8a6b8b98', '果蝇', 'b53cf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f76xza6b8b98', '果蝇', 'bcf978', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296f7fds6b8b98', '果蝇', 'bc7f78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a0296fs0db8a6b8b98', '果蝇', '3bcf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684a02fdb8a6b8b98', '果蝇', 'b432cf78', 'w1118', '中科院上海生物化学与细胞生物学研究与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a901311684as6f760db8a6b8b98', '果蝇', 'bc2342f78', 'w1118', '中科院上海生物化学与细胞生物学研究所源与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a90131168f6f760db8a6b8b98', '果蝇', 'b33cf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');
INSERT INTO `cibr_animal_drosophila` VALUES ('c22a90sd1684a0296f760db8a6b8b98', '果蝇', 'bcf-78', 'w1118', '中科院上海生物化学与细胞生物学研究源与技术平台', null, '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450');

-- ----------------------------
-- Table structure for cibr_record_meterial
-- ----------------------------
DROP TABLE IF EXISTS `cibr_record_meterial`;
CREATE TABLE `cibr_record_meterial` (
  `id` varchar(32) NOT NULL,
  `detailid` varchar(32) DEFAULT NULL,
  `resourceid` varchar(32) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `endTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(32) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_record_meterial
-- ----------------------------
INSERT INTO `cibr_record_meterial` VALUES ('weeqe', 'asdf ', 'asdfasedf', '2020-08-28 17:27:54', '2020-08-29 17:27:54', '2020-08-14 17:39:16', 'sdf ', null, null);

-- ----------------------------
-- Table structure for cibr_stock_drosophila
-- ----------------------------
DROP TABLE IF EXISTS `cibr_stock_drosophila`;
CREATE TABLE `cibr_stock_drosophila` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `drosophila_id` varchar(255) NOT NULL COMMENT '果蝇ID',
  `contanerType` varchar(255) NOT NULL COMMENT '容器类型',
  `contanerNmuber` int(11) NOT NULL COMMENT '库存数量',
  `usageType` varchar(255) DEFAULT NULL COMMENT '用途',
  `birthday` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '羽化日期',
  `createUser` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(255) DEFAULT NULL COMMENT '保留字段_果蝇保存位置',
  `rawNumber` int(11) DEFAULT NULL,
  `rawType` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateUser` varchar(32) DEFAULT NULL,
  `environment` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_stock_drosophila
-- ----------------------------
INSERT INTO `cibr_stock_drosophila` VALUES ('3dab24b3c65c46f1b5e91310e7198be5', '200603c2c8a14237b1751b780b52ee2a', 'S', '3', 'sdfas', '2020-08-27 16:00:00', '5646848a54754bbe833eba1c681cbe02', '2020-08-10 06:51:49', 'asdfasdf', '3', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('57d7f925b6234664b99b311a2a5d5f3c', '98e5388bbe034fb1bc05a72ab32d1e57', '阿斯顿', '0', '阿斯顿', '2020-08-20 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-14 10:06:36', 'asdfasdf', '0', '阿斯顿', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225asdf32e2d882a38933d', 'c22a901311684a0296f76xza6b8b98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9f3a4b07afdsa38933d', 'c22a901311684a0296fs0db8a6b8b98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9f3a4b07b32e2d882a38933d', '94faab0f15174c43b815dceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9f3a4b07b3as2a38933d', 'c22a901311684as6f760db8a6b8b98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9f3afdswe2d882a38933d', '94faab0f15174c43b815dceba1b3d', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9f3aqweb32e2d882a38933d', '94faab0f15174c43b815dceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9feb32e2d882a38933d', '94faab0f15174c43bdsdceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1a9fwe882a38933d', 'c22a901311684a0296f760db8a6b3b98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1aasd882a38933d', 'c22a90sd1684a0296f760db8a6b8b98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1aqf2e2d882a38933d', '94faab0f15174c43b815dceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225c1fqfe38933d', 'c22a901311684a0296f760db8fssb98', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225cfsd882a38933d', '94faab0f15174c43b815dceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225cqefqfb32e2d882a38933d', '94faab0f15174c43bsddceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('84225fqwef07b32e2d882a38933d', '94faab0f15sdc43b815dceba1b62fcd', 'S', '0', '保种', '2020-07-14 15:16:41', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-14 15:16:41', null, '3', 'S', '2020-07-14 15:16:41', null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7adf672a3737cc5ea0d3727', 'c22a901311684a0296f7fds6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7asd4cba4672a3737cc5ea0d3727', 'c22a901311684a02fdb8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e54cba4672a3737cc5ea0d3727', 'c22a901311684a0296f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e54cba46asdf737cc5ea0d3727', 'c22a90131168f6f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5asdf7cc5ea0d3727', 'c22a901311684a0296f76fd8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5ds5ea0d3727', 'c22a901311684a0296f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5fq5ea0d3727', 'c22a901311684a0296f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5fscc5ea0d3727', 'c22a901311684a0296f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5qwef37cc5ea0d3727', '94faab0f15174c4adeba1b62fcd', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8e5weqf5ea0d3727', '94faab0f15174c43bsdceba1b62fcd', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8eewrea0d3727', 'c22a901311684a0296f760db8a6b8b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8eqf737cc5ea0d3727', '94faab0f15174c43b815ds1b62fcd', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7d8wqefcc5ea0d3727', '94faab0f15174c43b815dceba1b62f2', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9e7dqefq4672a3737cc5ea0d3727', 'c22a901311684a0296f760db82b98', 'S', '23', '保种', '2020-07-13 10:54:09', 'bf85f70d4a9e4d42b32bef5b3eb67450', '2020-07-13 10:54:09', null, '23', 'S', null, null, 'sdafsdfasdfasdf');

-- ----------------------------
-- Table structure for cibr_sys_email
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_email`;
CREATE TABLE `cibr_sys_email` (
  `email_id` varchar(32) NOT NULL COMMENT '邮件id',
  `email_from` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件发送人',
  `email_to` varchar(255) NOT NULL COMMENT '邮件接收人',
  `email_subject` varchar(255) DEFAULT NULL COMMENT '邮件主题',
  `email_text` varchar(10000) NOT NULL COMMENT '邮件内容',
  `email_sentDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `email_cc` varchar(255) DEFAULT '' COMMENT '抄送',
  `email_bcc` varchar(255) DEFAULT NULL COMMENT '密送',
  `email_status` varchar(255) DEFAULT NULL COMMENT '状态',
  `email_error` varchar(5000) DEFAULT NULL COMMENT '报错信息',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_email
-- ----------------------------
INSERT INTO `cibr_sys_email` VALUES ('03024856e79642038a61caa285a78296', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:52:50', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0a82e5099bea46d0a1bdfa64aab872fd', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:39:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0c4c96a57f0f4c9090be3f1e548a7a09', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：350263，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:51:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0d29e7d1343b445eadc798e01305e912', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:16:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f7d432fa75640dd921393813827e08e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【士大夫】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:47:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1031464eec7b4e1faee8b800406bfb14', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-08】,任务申请【！！！加急！！！】，请及时处理。\n\n\n\n\n感谢您使用资源管理平台！', '2020-07-24 03:29:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1688823d8fcc4645ac5a3d87970fe8d6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:58:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('18adea51c2b74250a8d9056ee880d6c4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【哎哎哎】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1924e8f2a63049b8800238a7fc28744d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：727477，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-10 08:22:41', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cc65e887be945768937608c2dd8741f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【asasd1121231231231313qwrfs312】，请及时处理！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:47:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1d009fc5a8b846ce8213fd1c010706e8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:52:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21d595960f7c44358d77d637237f48d3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:42:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21f5f475903e4472a779b15656b0f08b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:44:32', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('27493aab10e948a28722992a61a988c4', 'zhouhan@cibr.ac.cn', 'dsdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：548072，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:10:22', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('298d3bc7e1e4401b9f6051f0e62f985f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：810322，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2ceee3d0ca2742acbabc6ee287bbee13', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-10 07:28:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2d817e503d044e5f895955a82ec016ae', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:50', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('309fd362c2054df085f62cb52692f568', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：946185，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:05:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('312d9f23b2b941f4a38dadee616b81b9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:22:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('31c2e829b1714fdaaf5115c037b4a6d0', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：456579，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:10:58', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('3430c1376d9345c1ba8a5274a8ea8e06', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：954870，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:27:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3707067576fd45039c00aced3cdec8e9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3795503200c64337a949e7546c96b1e3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-05 09:30:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('37a62ad242d14ce09aa87e137d8bfd2f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:13:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('38cbbfbd2b804df9809e447b012813e7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:34:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3b31643bf7374e02ad9323ea4195fa54', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:59:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3bbdeaf1b68c4668be8129c7484cb12f', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：794297，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:20:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3c88ac009f234ad38822df01e2ba0190', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:55:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3d000395e0b540399a21a69f5a1f801b', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：145378，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:12:30', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3e659102cd2e408fbd0aa5885cb403c1', 'zhouhan@cibr.ac.cn', '981436939@qq.com', null, 'xxx', '2020-07-07 02:52:34', null, null, 'fail', '邮件主题不能为空');
INSERT INTO `cibr_sys_email` VALUES ('3e92e6afe57740a7936b6ca42a907409', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【2】条，拒绝【1】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-03 05:58:11', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('41ad8ef36d68421ba421a15c93e2334b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:08:51', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('42d7a9a299c643a8b9b30cd2941a6f49', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('44618b2d361845d28fb9ccaa8656f188', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 03:08:20', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4c7368d6739f4d21a6e056630b904b2f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:18:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('53ff3ec3a57c41b683c998fdca82bece', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('55f5247cb40a450494106d998240c5a2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：222568，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:42:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('586ac2874dce4b41b3f4ec61a3f50624', 'zhouhan@cibr.ac.cn', 'adsfa@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：640080，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:13:15', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('5a6d02cc51654bffabc8929542efcd75', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:37:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5a90b0e78e604276a3fd09ef318f4001', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:34:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5eedba7c251b4f08a4e2823b63c95801', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:16:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('60365785dc7247daa67cf29382fe876f', 'zhouhan@cibr.ac.cn', 'zhou@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：488425，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:06:38', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (zhou@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('61a3c987f36a4ad8831d3fecda61c47e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 02:53:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('63dbfd16d214476d94ef1430b9ef98cb', 'zhouhan@cibr.ac.cn', 'asdf', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 07:28:52', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('64056c419f394743aba9672b010e4858', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：265654，有效期为1小时。\n\n\n\n\n欢迎您使用资源管理平台！', '2020-07-24 01:27:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('651f28331ce14129a34e3ca06ce021cf', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-17 06:14:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('67bcfa1cf4cd4583b2a128cc12f9fbcf', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:07:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('68964fb5195e40b594d69566a77f505c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】被【拒绝】，原因【ASDFADSFAAFSDFASDFASDFASDF】，请及时处理！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-07-29 10:15:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6b237e740402408397b978fc9cb58ea8', 'zhouhan@cibr.ac.cn', '981436939@qq.com', 'test', 'xxx', '2020-07-07 02:55:47', null, null, 'fail', '邮件发送失败：Mail server connection failed; nested exception is com.sun.mail.util.MailConnectException: Couldn\'t connect to host, port: smtp.cibr.ac.cn, 25; timeout -1;\n  nested exception is:\n	java.net.UnknownHostException: smtp.cibr.ac.cn. Failed messages: com.sun.mail.util.MailConnectException: Couldn\'t connect to host, port: smtp.cibr.ac.cn, 25; timeout -1;\n  nested exception is:\n	java.net.UnknownHostException: smtp.cibr.ac.cn');
INSERT INTO `cibr_sys_email` VALUES ('6d7d995e45fb431f846d410f31ac5e49', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：435636，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:08:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6e3c3638c4a54ec38728c77e735f1111', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：242006，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:07:15', null, null, 'fail', 'Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (sdf@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('6ecd172221ad40668ec2b3b757f33dcb', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：950337，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:09:55', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('6fa8b281333c41679753f678d31021b3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:56:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('70d0ad41bd714cb7baff6bb2ef8f6159', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-12 02:57:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('71fea3ee192742a080408fc8abeef181', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-24 01:29:30', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7400f39384254510aa20c177fc13df69', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 10:02:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('76a0246e19384f1c993e6894c0b3c7c7', 'zhouhan@cibr.ac.cn', '981436939', '验证码', '【北京脑科学与类脑研究中心】验证码是：944943，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:03:31', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 500 Error: bad syntax');
INSERT INTO `cibr_sys_email` VALUES ('77913f5aeb8d413293e4f666d25b6bc0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '【北京脑科学与类脑研究中心】您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n\n\n欢迎您使用资源管理平台！', '2020-07-24 01:29:29', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('781663a636454eccac602841a83eb07f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【曲素素】，邮箱【qususu@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:28:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7a7920fda9dd4c59905282b84505e13d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】', '2020-07-17 06:43:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7aecd40ad5d0401a9a2ab21bea9faa2a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-13】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-29 03:23:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7db278c06fc94729a09cb2ec13c16b42', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 07:28:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('80779ab61b784c2bb9daf162ab29d0a5', 'zhouhan@cibr.ac.cn', 'sfda@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：633120，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:12:29', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('821f853b0f8d4c039416040df28b5be6', 'zhouhan@cibr.ac.cn', 'adf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：619632，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:12:41', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('82c7b03034d145c1bf3c584cd5823a84', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-13】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-29 03:29:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8472f0fe7cc04b9d946fcf65e706a5d5', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:59:37', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('89ec4f70294c4390984a01aef20259a6', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：461030，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-10 07:24:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8ac42d0d38d4445c9ce631b9ac80bdfc', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	非常抱歉！您有一个【用户注册任务】被【拒绝】，原因：【的说法是打发】\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:28:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8bb9aa1e21454d9ba0199352ce0af90f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：575503，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:47:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8e71577d10c240b39d9912649473479b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 03:32:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9455b2f1206c48b49ffc4bc257cd88d1', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-17 06:43:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9485662486df469eadbbc725b177c05b', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：862762，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:55:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('96d820a867734b208a3886840f15bf54', 'zhouhan@cibr.ac.cn', '981436939@qq.com', 'test', 'xxx', '2020-07-07 02:57:51', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('97bc36178310450389fc975910b07576', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:27:03', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('99247a5885944224b1293141bab29591', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 02:25:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9edc7bd2c8ab4f8d8b61ebcfc608f467', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-03 05:52:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a0afd13eb93f4300a1f40b3d34b6efb6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:12:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a1ed19eb09e54358ab30889a784acce4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:31:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a222c3d41e654de39b969f256e18f94d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:06:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4eadd3a6d1443baac03a12637b39a40', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 03:08:35', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ad8351c24f584153b723d3c1e2b68df4', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：655644，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:06:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b11d0f3cd4c14236ad583607a7ca6bbe', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：156654，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:53:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b231d434b8b340a6a38978c16846a4be', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b395bc774e5d4ecc9c691baff5c35156', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【4】条，拒绝【4】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:37:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5be9a4065c445e2961fc376f905446e', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：191350，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:49:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b66e04f58e2040598191e3a3f1d785bc', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:13:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b77e2f54326a464f86ff1e5accaf2eb1', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：673588，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:17:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bba4b909d85249b6a473699c00507012', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 08:22:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bca2903e29a64b8595f5039e8e739d88', 'zhouhan@cibr.ac.cn', 'fengshuangshaung@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：926972，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:43:40', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('be5a7689c109457ca9c7e67ef5892ba7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:06:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c07944e1e2b74c8aa9dc158026ddbb13', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：927711，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:35:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c09b2c2b82ce46a7abb9ac779386495c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 02:25:28', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c2badaf82a414ca19dc64e44a376cbef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：270839，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:13:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c375164a18194988b36d88dd7f0355dc', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【3】条，拒绝【3】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:36:27', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c695d8dbe1d944a28a1c66ada199b501', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：152486，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:15:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ce8bd05fc400456a99c1c292658b2fa7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：751835，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:18:54', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d11d9ed944e94d81a8a9ebedc4ffa93a', 'zhouhan@cibr.ac.cn', 'zhou@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：538332，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 05:56:29', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (zhou@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('d1547530d75a44aea13a083c4346aa33', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】', '2020-07-17 06:14:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d68cf04a0be54a30a4237e9ebc9c71c6', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：543530，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:58:59', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d8e84f9e83b84edbb6c07c273f989546', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:47:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dd380f781a37437aa2f29e28a208812b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：695869，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 02:24:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('df130c10d733429bbc84daf767fc6a49', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:27:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e13eaa96e05746fa978ac6bc689feffb', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：677585，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:01:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e4944b8dee824545b49a733cc394b4b6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:31:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e56086fad41d46929c053dbefd695706', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】被【确认】。\n是否需要扩繁：【否】\n 备注：【不要慌张】\n如有疑问，请联系【zhouhan@cibr.ac.cn】', '2020-07-30 01:58:43', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e6573b2bb47e413d96e741031dd8f42c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:07:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e69c223313664db59a1c144bbda01d05', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-15】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-31 08:16:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea667b6539e34fce9ac86718c6070b12', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：171693，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:51:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea9e04771367441c9fa11bf714f39deb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【xxxxxasdfasdfasdfasd】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:33:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eb523a6470814bda9b279521e3897a57', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:29:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eeaf6a92d5c14099b8674ec685fbb315', 'zhouhan@cibr.ac.cn', 'asdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：778940，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:11:46', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('f00729ad3a5e4118ac1e3f3ce628f535', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【0】条，拒绝【3】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-04 09:06:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f0489d246cf74c47a02f76ad15ea592e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:14:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f5ecdabae6ec44359fba2f45552ff1f6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-12 02:57:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fb0f3b88acbd4b1784c04631b670fc9c', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：636576，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:09:04', null, null, 'fail', 'Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (sdf@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('fccb0624c7c24a0d972d053f1f04b5b2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:52:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fd13e0cee4c64d87b557ac433d3d42e9', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：270010，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:00:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fda713bf221f4720ace4490c1e56a6a5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-10 08:22:47', null, null, 'ok', null);

-- ----------------------------
-- Table structure for cibr_sys_environment
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_environment`;
CREATE TABLE `cibr_sys_environment` (
  `id` varchar(32) NOT NULL,
  `culture_day` varchar(255) DEFAULT NULL,
  `culture_temp` varchar(255) DEFAULT NULL,
  `culture_hum` varchar(255) DEFAULT NULL,
  `culture_lig` varchar(255) DEFAULT NULL,
  `culture_1` varchar(255) DEFAULT NULL,
  `culture_2` varchar(255) DEFAULT NULL,
  `culture_3` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `displayName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_environment
-- ----------------------------
INSERT INTO `cibr_sys_environment` VALUES ('sdafsdfasdfasdf', '12h', '25°C', '50%', '70%', null, null, null, '2020-07-13 17:32:57', '12h-25°C-50%-70%');

-- ----------------------------
-- Table structure for cibr_sys_material
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_material`;
CREATE TABLE `cibr_sys_material` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resourceStatu` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_material
-- ----------------------------
INSERT INTO `cibr_sys_material` VALUES ('asdfasedf', 'dfasdf', '1', '2020-08-14 17:34:13', null);

-- ----------------------------
-- Table structure for cibr_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_role`;
CREATE TABLE `cibr_sys_role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `roleType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_role
-- ----------------------------
INSERT INTO `cibr_sys_role` VALUES ('3b708de437bf472e8ecc19b2dc909e97', '其他', '09');
INSERT INTO `cibr_sys_role` VALUES ('ae07ed379d3540e984d4e9392d9ff4ba', '管理员', '999999');
INSERT INTO `cibr_sys_role` VALUES ('c3a8f79ff69d48169f70f8776f42f29b', '实验员', '01');
INSERT INTO `cibr_sys_role` VALUES ('c6884a69548c4c3588b74ee85486818f', '饲养员', '02');

-- ----------------------------
-- Table structure for cibr_sys_task
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_task`;
CREATE TABLE `cibr_sys_task` (
  `id` varchar(32) NOT NULL,
  `tasktype` varchar(2) DEFAULT NULL COMMENT '任务类型\r\n01 ：用户创建申请\r\n02 ：使用申请任务',
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createuser` varchar(32) DEFAULT NULL,
  `taskstatu` varchar(2) DEFAULT NULL COMMENT '任务状态\r\n01 进行中\r\n02 成功\r\n03 失败',
  `currentuser` varchar(32) DEFAULT NULL,
  `handletime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `taskdesc` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_task
-- ----------------------------
INSERT INTO `cibr_sys_task` VALUES ('15890decaca84ffba1f39f6d5caa66fa', '03', '2020-08-13 06:07:06', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '组织');
INSERT INTO `cibr_sys_task` VALUES ('33ba3ad0e7f942c8aac38ab1dc952bd2', '02', '2020-08-11 03:13:56', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:13:56', null);
INSERT INTO `cibr_sys_task` VALUES ('453337438c9341929c4b6a8b73268411', '02', '2020-08-11 03:18:25', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-13 03:08:35', null);
INSERT INTO `cibr_sys_task` VALUES ('4ac66818c9b64194ae6e03ba8e177ac9', '03', '2020-08-13 05:27:02', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '');
INSERT INTO `cibr_sys_task` VALUES ('633f5f2e6a87404cbb698b7416199741', '03', '2020-08-12 02:57:47', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, null);
INSERT INTO `cibr_sys_task` VALUES ('ca9487f95e6f4e93ace9c9c33367d0d4', '02', '2020-08-11 03:16:21', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:16:21', null);
INSERT INTO `cibr_sys_task` VALUES ('cb27f3ce6bee425cb846168a4ecea58e', '02', '2020-08-11 03:14:12', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:14:12', null);
INSERT INTO `cibr_sys_task` VALUES ('e9bd57875d7140b7a6757f597a3ebd30', '03', '2020-08-13 06:06:33', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '核酸');
INSERT INTO `cibr_sys_task` VALUES ('ede893ae25844bc3b5fa999cf133552b', '03', '2020-08-13 05:45:16', '24f5851abc6444e79be718325025126f', '01', '24f5851abc6444e79be718325025126f', null, '细胞哦');
INSERT INTO `cibr_sys_task` VALUES ('f0e1b0bc922f467b8caf4fcc1dce4f64', '01', '2020-08-10 08:22:46', '53dc21f8cc214c11a13ca57fa27f3146', '02', '24f5851abc6444e79be718325025126f', '2020-08-11 03:08:51', null);
INSERT INTO `cibr_sys_task` VALUES ('fb4cecb953a44e9bb04fceebbe45de3e', '03', '2020-08-13 05:31:44', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '');

-- ----------------------------
-- Table structure for cibr_sys_task_business
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_task_business`;
CREATE TABLE `cibr_sys_task_business` (
  `id` varchar(32) NOT NULL,
  `taskid` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `prestatu` varchar(2) NOT NULL,
  `nextstatu` varchar(2) NOT NULL,
  `createtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `business` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_task_business
-- ----------------------------
INSERT INTO `cibr_sys_task_business` VALUES ('0df25317ab924792801cc878399937eb', 'febfaee1df3f424ca57f8969216a299c', '5646848a54754bbe833eba1c681cbe02', '01', '02', '2020-08-10 02:53:06', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('16d402d402174caeb7e3bacc4a9fdd6a', 'e9bd57875d7140b7a6757f597a3ebd30', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 06:06:33', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('19d2bc45447f4c9cae1b6924c6a865e3', '8ab46708113045a092e332a580c144bb', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:42:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('2a8fba4154f64feabdaf2928568b27e2', '43065aaabaa14bfaab2e027a4caecdfa', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:34:09', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('2c1a3300984f4ab9b5a975c2337d50ec', '6a7cd20670c446e28c0924b9b86353ea', '5646848a54754bbe833eba1c681cbe02', '01', '02', '2020-08-07 07:12:19', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('3071d6adcf184f008493d7d8939ff088', 'c98af5dba22542ec80a014f223506878', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-06 10:12:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('4378db7794d64d0badfc579520af437d', '25356e487001438f9d02d98c8e518397', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:56:46', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('472acaadeb3d4f3b8235830a1f08817a', '453337438c9341929c4b6a8b73268411', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:18:25', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('52234455ecff40bcae531854f81dfa32', '0bbfd8d1a5964aff9737a3a0b5f18b8d', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:55:46', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('576d8bb257374b268867860725fa7d02', '15890decaca84ffba1f39f6d5caa66fa', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 06:07:06', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('6e8facb78182452197e1e4e80387cccc', '33ba3ad0e7f942c8aac38ab1dc952bd2', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:13:56', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('7a38904a92e946c991d42cb2b6627b61', '3b0a1f1aa7704f3bb667e34c6c4d8eca', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:22:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('7b3bfac6b8be4cc68c653435e2492e16', 'cb27f3ce6bee425cb846168a4ecea58e', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:14:12', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('9bd5b996c89f4d1987ba34b95425dfa4', '633f5f2e6a87404cbb698b7416199741', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-12 02:57:47', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('b4afabdae49842e297f6b975aabcf458', 'f0e1b0bc922f467b8caf4fcc1dce4f64', '24f5851abc6444e79be718325025126f', '01', '02', '2020-08-11 03:08:51', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('b682b15300614d3ea157b8ba0aa43049', '05031e48adcb42a19966a59963f6ab81', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 10:02:49', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('b7a6d3eeecb34e2dbd6cf5fb86698ba1', '7f07103e0a9f49dfa1e5e8c4b89a7048', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-06 10:16:48', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('bf980a3291a240aab05b13966ddc9978', 'b60dc07081f340cb9ca5c8508b6139b8', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:13:52', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('d4eb8b2c88f246209ce446e0f9302c09', '4ac66818c9b64194ae6e03ba8e177ac9', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:27:02', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('e611c4feba344707a0569bbc2866bc12', 'fb4cecb953a44e9bb04fceebbe45de3e', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:31:44', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('ea1a25b6dc9c4d0f9ba8148857e55c14', 'a62f0979034e4bcca4bb28333b2a0a1b', '5646848a54754bbe833eba1c681cbe02', '01', '03', '2020-08-07 07:28:47', '拒绝注册申请');
INSERT INTO `cibr_sys_task_business` VALUES ('ec153762f4484ef29e985b069b0317ad', 'ede893ae25844bc3b5fa999cf133552b', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:45:16', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('ff526f8747c341bfa0ae7112de8e789d', 'ca9487f95e6f4e93ace9c9c33367d0d4', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:16:21', '创建');

-- ----------------------------
-- Table structure for cibr_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_user`;
CREATE TABLE `cibr_sys_user` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ROLEID` varchar(32) NOT NULL COMMENT '权限表ID',
  `USERDESC` varchar(1000) DEFAULT NULL,
  `USERSTATU` varchar(2) NOT NULL COMMENT '用户状态：0-待注册，1-待审核，2-注册完成可用，3-删除',
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_user
-- ----------------------------
INSERT INTO `cibr_sys_user` VALUES ('24f5851abc6444e79be718325025126f', '周晗', '91ffbe5d7a6e6889261fc2d932369311', 'zhouhan@cibr.ac.cn', '9', null, '2', '2020-08-10 15:29:19');
INSERT INTO `cibr_sys_user` VALUES ('53dc21f8cc214c11a13ca57fa27f3146', '冯总', '91ffbe5d7a6e6889261fc2d932369311', 'fengshuangshuang@cibr.ac.cn', '9', null, '2', '2020-08-10 08:22:46');

-- ----------------------------
-- Table structure for cibr_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_user_role`;
CREATE TABLE `cibr_sys_user_role` (
  `userid` varchar(32) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_user_role
-- ----------------------------
INSERT INTO `cibr_sys_user_role` VALUES ('24f5851abc6444e79be718325025126f', 'ae07ed379d3540e984d4e9392d9ff4ba');
INSERT INTO `cibr_sys_user_role` VALUES ('53dc21f8cc214c11a13ca57fa27f3146', 'c3a8f79ff69d48169f70f8776f42f29b');
INSERT INTO `cibr_sys_user_role` VALUES ('53dc21f8cc214c11a13ca57fa27f3146', 'c6884a69548c4c3588b74ee85486818f');
INSERT INTO `cibr_sys_user_role` VALUES ('asdfasdfasdf', 'ae07ed379d3540e984d4e9392d9ff4ba');

-- ----------------------------
-- Table structure for cibr_sys_verification
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_verification`;
CREATE TABLE `cibr_sys_verification` (
  `id` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_verification
-- ----------------------------
INSERT INTO `cibr_sys_verification` VALUES ('03abba3baea8404f824d20d457d91a1f', 'fengshuangshuang@cibr.ac.cn', '265654', '2020-07-24 01:27:56');
INSERT INTO `cibr_sys_verification` VALUES ('0c2908edefb74929832a1171b332154c', 'fengshuangshuang@cibr.ac.cn', '695869', '2020-08-07 02:24:07');
INSERT INTO `cibr_sys_verification` VALUES ('0d13f6ed41494b70b99280925084c312', 'zhouhan@cibr.ac.cn', '222568', '2020-07-17 06:42:46');
INSERT INTO `cibr_sys_verification` VALUES ('0e180023df734d59933f446e86625f38', 'qususu@cibr.ac.cn', '954870', '2020-08-07 07:27:47');
INSERT INTO `cibr_sys_verification` VALUES ('17127c4b4090449485a1217ebaf272ac', 'zhouhan@cibr.ac.cn', '461030', '2020-08-10 07:24:57');
INSERT INTO `cibr_sys_verification` VALUES ('59218617711245f2bb4c664f72266f76', 'zhouhan@cibr.ac.cn', '270839', '2020-07-17 06:13:47');
INSERT INTO `cibr_sys_verification` VALUES ('7f0074949a7241eeac1a7ed420ff9b9e', 'fengshuangshuang@cibr.ac.cn', '727477', '2020-08-10 08:22:41');
INSERT INTO `cibr_sys_verification` VALUES ('85730e61b4d246188b6195bea43021f9', 'sdf@cibr.ac.cn', '242006', '2020-07-17 06:07:15');
INSERT INTO `cibr_sys_verification` VALUES ('929ce5ee4f0440709c136c90a578bdb8', 'zhou@cibr.ac.cn', '488425', '2020-07-17 06:06:38');
INSERT INTO `cibr_sys_verification` VALUES ('92ede932756e4c639b2afb9f6ca21cfd', 'zhouhan@cibr.ac.cn', '152486', '2020-07-10 03:15:22');
INSERT INTO `cibr_sys_verification` VALUES ('aa2391922cd0488499128f83683f45f3', 'fengshuangshuang@cibr.ac.cn', '810322', '2020-08-07 08:44:21');
INSERT INTO `cibr_sys_verification` VALUES ('bf253f53557341f1861ace1249284959', 'zhou@cibr.ac.cn', '538332', '2020-07-17 05:56:30');
INSERT INTO `cibr_sys_verification` VALUES ('c31e5e9318e04e81bb843f68bcf5b6a2', 'fengshuangshuang@cibr.ac.cn', '575503', '2020-08-07 08:47:13');
INSERT INTO `cibr_sys_verification` VALUES ('d3402b3968d44fbc88f503daf5746e1e', 'zhouhan@cibr.ac.cn', '751835', '2020-07-10 03:18:55');
INSERT INTO `cibr_sys_verification` VALUES ('dbff726b89d746fcbd9d639e1c57e0c3', 'zhouhan@cibr.ac.cn', '927711', '2020-07-10 03:35:25');
INSERT INTO `cibr_sys_verification` VALUES ('e44d9625dcc642aabe3f8eb7a08feb40', 'sdf@cibr.ac.cn', '636576', '2020-07-17 06:09:43');

-- ----------------------------
-- Table structure for cibr_task_ask_confirm
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_ask_confirm`;
CREATE TABLE `cibr_task_ask_confirm` (
  `id` varchar(32) NOT NULL,
  `prepareid` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(32) DEFAULT NULL,
  `isComplete` varchar(1) DEFAULT NULL,
  `remarks` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_ask_confirm
-- ----------------------------
INSERT INTO `cibr_task_ask_confirm` VALUES ('3ef8dfb998204d8eb40f39f4b1a216a8', 'e3811eb3359b4b23a57d72d2f22476c4', '2020-08-06 09:53:22', '5646848a54754bbe833eba1c681cbe02', 'N', '是打发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('4519825b2d874698a901ad70a2f54265', 'e9486dbd50c8411cae24b161dd35451d', '2020-08-06 09:33:25', '5646848a54754bbe833eba1c681cbe02', 'Y', '阿斯顿发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('49e7de41f34d416897f813c9c3e1c474', '9aed4413d02c414580cb875226deb2d2', '2020-08-10 04:49:28', '5646848a54754bbe833eba1c681cbe02', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('544e448955a34f57b097195d180185f2', 'c15e67c0775b404cae0ffe7644c0bbc5', '2020-08-06 09:32:41', '5646848a54754bbe833eba1c681cbe02', 'Y', '阿斯顿发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('64706951983b4c67a73248ccfa0e62e5', '428161d6a95748feb2e7874362836198', '2020-08-07 08:37:48', '5646848a54754bbe833eba1c681cbe02', 'Y', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('6e587e42cc6045e6a6f15a47cc395549', 'a767c2aa84d0463096f8dfc9d9cf66ab', '2020-08-06 10:00:35', '5646848a54754bbe833eba1c681cbe02', 'N', '打撒所多');
INSERT INTO `cibr_task_ask_confirm` VALUES ('9f59950da61743efadf576647cfd31b1', 'efa3b5f8da9e4fa1adc796471c2a3afa', '2020-08-10 04:49:37', '5646848a54754bbe833eba1c681cbe02', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('c689eaea2c214ac8b4bca8eb0b31cc89', '731d8733a8904b21ac19bcde6e8fa8cf', '2020-08-06 10:13:00', '5646848a54754bbe833eba1c681cbe02', 'Y', '是打发斯蒂芬');

-- ----------------------------
-- Table structure for cibr_task_ask_director
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_ask_director`;
CREATE TABLE `cibr_task_ask_director` (
  `id` varchar(32) NOT NULL,
  `taskid` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `curstatu` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_ask_director
-- ----------------------------
INSERT INTO `cibr_task_ask_director` VALUES ('1142f3b76995457694ac985bf98e35c8', 'e3ec20e7d76848afbf5b33a5d28101ce', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-06 10:16:48', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('140102c537d5439ab47b000d1b7eb090', 'c46c8414424f4c09bb5dc7a0e3929906', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 10:02:49', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('150b6d2ce1934f44a8999df1f13fe7cb', '97d2daf442de4b05ba60c3aa38b4535f', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:16:21', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('463f94b319d14843b68bbe87460f9cb4', '05567077ecfd4db2b29c379487bd760a', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:55:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('551446827ee24bb080a7e2a7611b1962', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5791f82de7324914bffdeb3bb56839fa', '4ce07456d6104e85ae808fb955b25c13', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 09:56:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5bde1921e5794f499827d22a5e53d61a', '9aeea58cf85146959dccf540259c72d4', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:13:56', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('67e6cb9e167c4d548d06074454e2d29c', 'a4680b1e35b8419db01494dd1318d96e', 'bf85f70d4a9e4d42b32ba67450', '2020-08-02 07:42:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6b594046a02641ef98293da29eed9bda', '1bb4b0fea5ab4984a5f86b62926d3902', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:22:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6ffea4f86e9c4bf6bccf3f7e5e119d18', '7943476691744fed8ba40aa182be75eb', 'bf85f70d4a9e4d42b32ba67450', '2020-08-06 10:12:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('828976286d1e460cb4e159197add1755', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:18:25', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('8a1428f9e22c4576a9f15d377ced67a6', '6537f9ab4cc24fbda95ce1f4f8c9386b', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 07:13:52', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9341fdd199f7404a810281ea66f425d2', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf8ad4a9e4d42b32bef5b3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9d9365b5a30a41e3ad5ee6fb8763fbcd', '428580b8b28b414397f044e0d2e19ca4', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:14:12', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('b11e8db9002949dcae94374afe5b4350', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 07:34:09', '0');

-- ----------------------------
-- Table structure for cibr_task_ask_drosophila
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_ask_drosophila`;
CREATE TABLE `cibr_task_ask_drosophila` (
  `id` varchar(32) NOT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) DEFAULT NULL,
  `urgent` varchar(2) DEFAULT NULL,
  `taskid` varchar(32) DEFAULT NULL,
  `currentStatu` varchar(2) DEFAULT NULL,
  `currentHandler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_ask_drosophila
-- ----------------------------
INSERT INTO `cibr_task_ask_drosophila` VALUES ('05567077ecfd4db2b29c379487bd760a', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 09:55:46', '', '1', '0bbfd8d1a5964aff9737a3a0b5f18b8d', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('1bb4b0fea5ab4984a5f86b62926d3902', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 09:22:04', '', '', '3b0a1f1aa7704f3bb667e34c6c4d8eca', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('428580b8b28b414397f044e0d2e19ca4', '24f5851abc6444e79be718325025126f', '2020-08-11 03:14:12', '', '1', 'cb27f3ce6bee425cb846168a4ecea58e', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('4ce07456d6104e85ae808fb955b25c13', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 09:56:46', 'asdfa', '1', '25356e487001438f9d02d98c8e518397', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '24f5851abc6444e79be718325025126f', '2020-08-11 03:18:25', '', '1', '453337438c9341929c4b6a8b73268411', '04', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('6537f9ab4cc24fbda95ce1f4f8c9386b', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:13:52', '', '1', 'b60dc07081f340cb9ca5c8508b6139b8', '09', null);
INSERT INTO `cibr_task_ask_drosophila` VALUES ('7943476691744fed8ba40aa182be75eb', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:12:04', '等等撒多所多所', '', 'c98af5dba22542ec80a014f223506878', '05', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('97d2daf442de4b05ba60c3aa38b4535f', '24f5851abc6444e79be718325025126f', '2020-08-11 03:16:21', '', '1', 'ca9487f95e6f4e93ace9c9c33367d0d4', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('9aeea58cf85146959dccf540259c72d4', '24f5851abc6444e79be718325025126f', '2020-08-11 03:13:56', '', '1', '33ba3ad0e7f942c8aac38ab1dc952bd2', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a4680b1e35b8419db01494dd1318d96e', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:42:04', '', '1', '8ab46708113045a092e332a580c144bb', '08', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('c46c8414424f4c09bb5dc7a0e3929906', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 10:02:49', 'asdfsa', '1', '05031e48adcb42a19966a59963f6ab81', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('d90a131f0a8f4b5985d0692566b50ae3', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:34:09', 'asdfasdf', '1', '43065aaabaa14bfaab2e027a4caecdfa', '00', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('e3ec20e7d76848afbf5b33a5d28101ce', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:16:48', '从V型从V型从V型从V型', '1', '7f07103e0a9f49dfa1e5e8c4b89a7048', '06', '29a9c57a44b94b869b58893356a8444b');

-- ----------------------------
-- Table structure for cibr_task_ask_prepare
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_ask_prepare`;
CREATE TABLE `cibr_task_ask_prepare` (
  `id` varchar(32) NOT NULL,
  `handler` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `needmore` varchar(1) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `endTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks1` varchar(1000) DEFAULT NULL,
  `completeTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `realnumber` varchar(255) DEFAULT NULL,
  `realage` varchar(255) DEFAULT NULL,
  `realexpTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reamrks2` varchar(1000) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateUser` varchar(32) DEFAULT NULL,
  `askid` varchar(32) DEFAULT NULL,
  `detailId` varchar(32) DEFAULT NULL,
  `prestatu` varchar(2) DEFAULT NULL COMMENT '01 进行中 02 已完成 03已确认 04 实验员拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_ask_prepare
-- ----------------------------
INSERT INTO `cibr_task_ask_prepare` VALUES ('1e176d43ae5b44b49c07a1886fb7bd03', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:24', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '11', '2020-08-06 16:00:00', '1', '0', '2020-08-11 16:00:00', '111', '2020-08-06 08:37:53', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', '9b1d9d532a654f75a8bfc7d17f932db7', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('328f18fb380a4bf4aa8038e2dbd72221', '5646848a54754bbe833eba1c681cbe02', '2020-08-03 05:52:07', 'Y', '2020-08-03 16:00:00', '2020-08-06 16:00:00', 'sadfasdf', '2020-08-04 16:00:00', '3', '0', '2020-08-07 16:00:00', '', '2020-08-05 09:30:34', '29a9c57a44b94b869b58893356a8444b', 'c46c8414424f4c09bb5dc7a0e3929906', '6ef188e489c04ec4bde94ce830001aad', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('360afea1c1654f11805e9aed1f66f6b5', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:36', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '33', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '3333', '2020-08-06 08:38:38', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'e9505ddcc3884bbe9b85427f4f7244f8', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('428161d6a95748feb2e7874362836198', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:16', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:30', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', '8792766f9c2a4ba18cd7efaeba5790a4', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('731d8733a8904b21ac19bcde6e8fa8cf', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:12:40', 'Y', '2020-08-12 16:00:00', '2020-08-19 16:00:00', '萨达', '2020-08-26 16:00:00', '1', '0', '2020-08-30 16:00:00', '', '2020-08-06 10:12:50', '5646848a54754bbe833eba1c681cbe02', '7943476691744fed8ba40aa182be75eb', 'bd8cbb6fd90d461cb10e75669de38c49', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('86853143e2714d6f9840f30bb2f4e9f8', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:42', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '44', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '444', '2020-08-06 08:38:51', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'f11b0e199de04f9ab0ff27f534f92c58', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('9aed4413d02c414580cb875226deb2d2', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:27', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:36', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', 'c8498c747317477ebac49e3784df9a0c', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a767c2aa84d0463096f8dfc9d9cf66ab', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 09:59:26', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '从V型下次编程序', '2020-08-05 16:00:00', '1', '0', '2020-08-20 16:00:00', '', '2020-08-06 09:59:37', '5646848a54754bbe833eba1c681cbe02', 'a4680b1e35b8419db01494dd1318d96e', 'e3c5cc7ac0194f4980f76badeca3e3a9', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a8777b96cb6a47b69087292df18dcca6', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:31', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '22', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '222', '2020-08-06 08:39:00', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'b9690d93ae924c39b5435bcf217ec09a', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('c15e67c0775b404cae0ffe7644c0bbc5', '5646848a54754bbe833eba1c681cbe02', '2020-08-05 17:31:14', 'Y', '2020-08-05 17:31:14', '2020-08-05 17:31:14', '', '2020-08-19 16:00:00', '1', '0', '2020-08-05 16:00:00', '', '2020-08-06 08:01:16', '5646848a54754bbe833eba1c681cbe02', '4ce07456d6104e85ae808fb955b25c13', '128f2f7a93c24be5a8a25e6098ad8377', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('d29f6b0b58fa45cd80e62288e80213f9', '24f5851abc6444e79be718325025126f', '2020-08-13 03:08:20', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '', '2020-08-27 16:00:00', '1', '0', '2020-08-28 16:00:00', '', '2020-08-13 03:08:35', '24f5851abc6444e79be718325025126f', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '86d5c6722f8f4abaa1b89ec261075580', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('e3811eb3359b4b23a57d72d2f22476c4', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 09:52:39', 'Y', '2020-08-05 16:00:00', '2020-08-13 16:00:00', '', '2020-08-05 16:00:00', '1', '0', '2020-08-12 16:00:00', '', '2020-08-06 09:52:50', '5646848a54754bbe833eba1c681cbe02', '05567077ecfd4db2b29c379487bd760a', 'bbaea521ab0b4db2a4cc281a19513f42', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('e9486dbd50c8411cae24b161dd35451d', '5646848a54754bbe833eba1c681cbe02', '2020-08-05 17:31:17', 'Y', '2020-08-05 17:31:17', '2020-08-05 17:31:17', '', '2020-08-06 16:00:00', '1', '0', '2020-08-12 16:00:00', '', '2020-08-06 08:34:07', '5646848a54754bbe833eba1c681cbe02', '4ce07456d6104e85ae808fb955b25c13', '7aad4ddd43a6496fa3cf2bc59b161c8c', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('efa3b5f8da9e4fa1adc796471c2a3afa', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:35:24', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:40', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', '5f03c6434e6b4d15b98a019cad8adb95', '04');

-- ----------------------------
-- Table structure for cibr_task_detail_drosophila
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_detail_drosophila`;
CREATE TABLE `cibr_task_detail_drosophila` (
  `id` varchar(32) NOT NULL,
  `askid` varchar(32) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `expectedTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operationProcess` varchar(1000) DEFAULT NULL,
  `stockid` varchar(32) DEFAULT NULL,
  `studyDirector` varchar(1000) DEFAULT NULL,
  `purpose` varchar(1000) DEFAULT NULL,
  `virginFly` varchar(1) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `isHybridizationNecessary` varchar(1) DEFAULT NULL,
  `hybridStrain` varchar(32) DEFAULT NULL COMMENT 'animal_drosophila的id',
  `specialFeeding` varchar(1000) DEFAULT NULL,
  `specificFeeding` varchar(1000) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `confirmStatu` varchar(2) DEFAULT NULL COMMENT '是否确认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_detail_drosophila
-- ----------------------------
INSERT INTO `cibr_task_detail_drosophila` VALUES ('076745b8f26a4ee5aee5d59288966e68', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5weqf5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'N', '', 'N', '', '2', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('128f2f7a93c24be5a8a25e6098ad8377', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8eewrea0d3727', null, 'asdf', 'Y', 'male', 'Y', '94faab0f15174c43b815ds1b62fcd', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('16e6315d3a044e80b72ec5d7e82aa8d9', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5asdf7cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2ab13b67223144198711c1fb043700fe', '97d2daf442de4b05ba60c3aa38b4535f', '2020-08-11 03:16:21', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4d373970d8e54f0eaef8201ad5d87c70', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4e32733c6afd463ea7869a39960c93f4', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', 'c22a901311684a0296f760db82b98', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('54fb3ff0c3ce409db31a5e321a320384', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8e5fscc5ea0d3727', null, 's', 'Y', 'male', 'N', '', 'N', '', '2', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('5f03c6434e6b4d15b98a019cad8adb95', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8eewrea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6279629a9354445d9fb178446519f53f', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5fscc5ea0d3727', null, 'asdf', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6ef188e489c04ec4bde94ce830001aad', 'c46c8414424f4c09bb5dc7a0e3929906', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdfasdf', 'N', 'female', 'Y', '94faab0f15174c43bsdceba1b62fcd', 'Y', 'asdf', '1', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('73b8a4b252de46479709b9c09021fe45', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8eewrea0d3727', null, 'asdfaf', 'Y', 'male', 'N', '', 'N', '', '0', '123', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7aad4ddd43a6496fa3cf2bc59b161c8c', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', '94faab0f15174c43bdsdceba1b62fcd', 'Y', '特殊sss', '1', '3', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7beff4abb7ab4d6e95020fc29d025535', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:42', '2020-08-22 00:00:00', null, 'b9e7d8e5asdf7cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86a00acb524a4fa996d9e3805ce0bc29', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'N', '', 'N', '', '2', '2', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86d5c6722f8f4abaa1b89ec261075580', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '2020-08-11 03:18:25', '2020-08-25 16:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8792766f9c2a4ba18cd7efaeba5790a4', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e5fq5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '3', '32', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8b43983262ad4ec5abde02c8db98e744', '9aeea58cf85146959dccf540259c72d4', '2020-08-11 03:13:56', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('958df693b5df47f9a4ac1d214c08e732', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7adf672a3737cc5ea0d3727', null, 'sad', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('9b1d9d532a654f75a8bfc7d17f932db7', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5ds5ea0d3727', null, 'sadf', 'Y', 'male', 'N', '', 'N', '', '0', '23', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a08206be36634d61911c4ce8d063dae3', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a9b0bba5640e4de0aa2f1f67b67707b6', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '1', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b3e6cbc9850548e2bae593df41e9ec71', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '0', '3', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b9690d93ae924c39b5435bcf217ec09a', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sdaf', 'Y', 'male', 'N', '', 'N', '', '0', '132', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bbaea521ab0b4db2a4cc281a19513f42', '05567077ecfd4db2b29c379487bd760a', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdf', 'Y', 'female', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bd8cbb6fd90d461cb10e75669de38c49', '7943476691744fed8ba40aa182be75eb', '2020-08-07 16:34:46', '2020-08-22 00:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('c8498c747317477ebac49e3784df9a0c', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:44', '2020-08-22 00:00:00', null, 'b9e7d8e5ds5ea0d3727', null, '阿萨德饭是', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('dbedd59ab60a4d78b582ec6efe160a05', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7adf672a3737cc5ea0d3727', null, 's', 'Y', 'male', 'Y', '94faab0f15174c4adeba1b62fcd', 'Y', 'xcvzxcv', '3', '4', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ddf1cec7c4e64f8fab4ae6ae3d9d8c4f', '428580b8b28b414397f044e0d2e19ca4', '2020-08-11 03:14:12', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('e3c5cc7ac0194f4980f76badeca3e3a9', 'a4680b1e35b8419db01494dd1318d96e', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('e9505ddcc3884bbe9b85427f4f7244f8', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fq5ea0d3727', null, 'sdfva', 'Y', 'male', 'N', '', 'N', '', '0', '32', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('f11b0e199de04f9ab0ff27f534f92c58', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '23', '01');

-- ----------------------------
-- Table structure for cibr_task_fail
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_fail`;
CREATE TABLE `cibr_task_fail` (
  `id` varchar(32) NOT NULL,
  `detailId` varchar(32) DEFAULT NULL,
  `handler` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reason` varchar(5000) DEFAULT NULL,
  `remarks` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_fail
-- ----------------------------
INSERT INTO `cibr_task_fail` VALUES ('18c4b9efb0db4ec08e97752a68e0e830', '7beff4abb7ab4d6e95020fc29d025535', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:11', '是打发斯蒂芬', null);
INSERT INTO `cibr_task_fail` VALUES ('26dc939f45bc4693a6b7b63b9c9efed1', 'a9b0bba5640e4de0aa2f1f67b67707b6', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:23', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('2d5d52816d514ce88b23251f1300f927', 'b3e6cbc9850548e2bae593df41e9ec71', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:20', '是打发斯蒂芬', null);
INSERT INTO `cibr_task_fail` VALUES ('300b54d954e4411d92f666d1e5f58b70', '4e32733c6afd463ea7869a39960c93f4', '5646848a54754bbe833eba1c681cbe02', '2020-08-03 05:58:04', 'asdfsadfsdasdfafsda34', null);
INSERT INTO `cibr_task_fail` VALUES ('324a4477aeee4b1fbc65a5507da10f64', '6279629a9354445d9fb178446519f53f', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:13', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('429bda70c0044bbd8c407451932e50eb', '958df693b5df47f9a4ac1d214c08e732', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:17', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('4a1e5415ff3b4eabadbd05616c7822d4', 'a08206be36634d61911c4ce8d063dae3', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:19', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('61ee5c50d9794fbbab9773c6c2ee70e5', '4d373970d8e54f0eaef8201ad5d87c70', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:04', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('6a0372d571514392bee089f933901441', '73b8a4b252de46479709b9c09021fe45', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:09', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('9754980297c5492195b0aa7724839792', '86a00acb524a4fa996d9e3805ce0bc29', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:12', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('b4ab5336c6ff4cfb85536815082950c8', 'a62f0979034e4bcca4bb28333b2a0a1b', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 07:28:47', '的说法是打发', '撒的发生的啊');
INSERT INTO `cibr_task_fail` VALUES ('c52590d1526f4fd098dde555c2f493da', '54fb3ff0c3ce409db31a5e321a320384', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:17:06', '撒旦法师打发', null);

-- ----------------------------
-- Table structure for cibr_task_process
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process`;
CREATE TABLE `cibr_task_process` (
  `id` varchar(32) NOT NULL,
  `taskid` varchar(32) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `taskstatu` varchar(2) DEFAULT NULL,
  `projectName` varchar(1000) DEFAULT NULL,
  `dataType` varchar(255) DEFAULT NULL,
  `principal` varchar(32) DEFAULT NULL,
  `sampleType` varchar(2) DEFAULT NULL COMMENT '01 核酸  02 组织  03 细胞',
  `samplePreparation` varchar(32) DEFAULT NULL,
  `spupdateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `libraryPreparation` varchar(32) DEFAULT NULL,
  `lpupdateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dismountData` varchar(255) DEFAULT NULL,
  `ddupdateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `bioinformaticsAnalysis` varchar(255) DEFAULT NULL,
  `baupdateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process
-- ----------------------------
INSERT INTO `cibr_task_process` VALUES ('3c7de684cef140a4bae419ba0eb82dc1', 'fb4cecb953a44e9bb04fceebbe45de3e', '24f5851abc6444e79be718325025126f', '2020-08-13 05:31:44', '01', '核酸呀', '34', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '24f5851abc6444e79be718325025126f', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '');
INSERT INTO `cibr_task_process` VALUES ('563b8462219a48279a0c97256ed94a4e', '4ac66818c9b64194ae6e03ba8e177ac9', '24f5851abc6444e79be718325025126f', '2020-08-13 13:31:05', '01', '核酸', '阿斯顿发', '53dc21f8cc214c11a13ca57fa27f3146', '01', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-13 13:31:05', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-13 13:31:05', '24f5851abc6444e79be718325025126f', '2020-08-13 13:31:05', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-13 13:31:05', '');
INSERT INTO `cibr_task_process` VALUES ('8531d260f45e44ce9fd4b46e3081e1b0', '633f5f2e6a87404cbb698b7416199741', '24f5851abc6444e79be718325025126f', '2020-08-12 11:40:29', '01', '撒旦法师打发', '发', '53dc21f8cc214c11a13ca57fa27f3146', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-12 11:40:29', '24f5851abc6444e79be718325025126f', '2020-08-12 11:40:29', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-12 11:40:29', '24f5851abc6444e79be718325025126f', '2020-08-12 11:40:29', '阿萨德饭');
INSERT INTO `cibr_task_process` VALUES ('a5c874a970374966a798943cc731ea85', '15890decaca84ffba1f39f6d5caa66fa', '24f5851abc6444e79be718325025126f', '2020-08-13 06:07:06', '01', '阿斯顿发', '阿斯顿发', '53dc21f8cc214c11a13ca57fa27f3146', '02', '53dc21f8cc214c11a13ca57fa27f3146', null, '24f5851abc6444e79be718325025126f', null, '24f5851abc6444e79be718325025126f', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '组织');
INSERT INTO `cibr_task_process` VALUES ('ce598c12f521413fa5d644cfb2fad17f', 'ede893ae25844bc3b5fa999cf133552b', '24f5851abc6444e79be718325025126f', '2020-08-13 05:45:16', '01', '细胞哦', '撒旦法师打发', '24f5851abc6444e79be718325025126f', '03', '24f5851abc6444e79be718325025126f', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '24f5851abc6444e79be718325025126f', null, '细胞哦');
INSERT INTO `cibr_task_process` VALUES ('dd6411c7ae3c4b738090d439a21bcae5', 'e9bd57875d7140b7a6757f597a3ebd30', '24f5851abc6444e79be718325025126f', '2020-08-13 06:06:33', '01', '撒的发生的', '核酸', '24f5851abc6444e79be718325025126f', '01', '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '24f5851abc6444e79be718325025126f', null, '核酸');

-- ----------------------------
-- Table structure for cibr_task_process_email
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_email`;
CREATE TABLE `cibr_task_process_email` (
  `processId` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`processId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_email
-- ----------------------------
INSERT INTO `cibr_task_process_email` VALUES ('3c7de684cef140a4bae419ba0eb82dc1', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('563b8462219a48279a0c97256ed94a4e', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('8531d260f45e44ce9fd4b46e3081e1b0', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('8531d260f45e44ce9fd4b46e3081e1b0', 'zhouhan@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('a5c874a970374966a798943cc731ea85', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('ce598c12f521413fa5d644cfb2fad17f', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('dd6411c7ae3c4b738090d439a21bcae5', 'fengshuangshuang@cibr.ac.cn');

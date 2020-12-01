/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:20:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_sampleinput
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_sampleinput`;
CREATE TABLE `cibr_task_process_sampleinput` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  `arrIndex` varchar(255) DEFAULT NULL COMMENT '批次',
  `sampleName` varchar(1000) DEFAULT NULL,
  `initSample` varchar(255) DEFAULT NULL COMMENT '初始样本类型',
  `sampleIndex` varchar(255) DEFAULT NULL COMMENT '样本编号',
  `species` varchar(255) DEFAULT NULL COMMENT '物种',
  `tissue` varchar(255) DEFAULT NULL COMMENT '来源',
  `sampleMsg` varchar(255) DEFAULT NULL COMMENT '样本类型',
  `sampleStatu` varchar(255) DEFAULT NULL COMMENT '样本状态',
  `tissueNumber` varchar(255) DEFAULT NULL COMMENT '组织量',
  `bloodVolume` varchar(255) DEFAULT NULL COMMENT '血液量',
  `concentration` varchar(255) DEFAULT NULL COMMENT '浓度',
  `sampleVolume` varchar(255) DEFAULT NULL COMMENT '样本体积',
  `totalNumber` varchar(255) DEFAULT NULL,
  `cellLife` varchar(255) DEFAULT NULL COMMENT '细胞活性',
  `cellSort` varchar(255) DEFAULT NULL COMMENT '细胞分选法',
  `databaseType` varchar(255) DEFAULT NULL COMMENT '建库类型',
  `SequencingPlatform` varchar(255) DEFAULT NULL COMMENT '测序平台',
  `remarks` varchar(255) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `currentStatu` varchar(2) DEFAULT NULL,
  `rowIndex` int(11) DEFAULT NULL,
  `concentrationunit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:20:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_analysis
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_analysis`;
CREATE TABLE `cibr_task_process_analysis` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  `dismountId` varchar(32) DEFAULT NULL,
  `sampleName` varchar(255) DEFAULT NULL,
  `sampleIndex` varchar(255) DEFAULT NULL,
  `resultPath` varchar(255) DEFAULT NULL,
  `reportPath` varchar(255) DEFAULT NULL,
  `args` varchar(255) DEFAULT NULL,
  `analyst` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `currentStatu` varchar(2) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rowIndex` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateUser` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

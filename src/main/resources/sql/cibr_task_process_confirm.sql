/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:20:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_confirm
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_confirm`;
CREATE TABLE `cibr_task_process_confirm` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `libId` varchar(32) DEFAULT NULL,
  `sampleName` varchar(255) DEFAULT NULL,
  `initSample` varchar(255) DEFAULT NULL,
  `sampleIndex` varchar(255) DEFAULT NULL,
  `libIndex` varchar(255) DEFAULT NULL,
  `createDbTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `libType` varchar(255) DEFAULT NULL,
  `confirmIndex` varchar(255) DEFAULT NULL,
  `peaksize` varchar(255) DEFAULT NULL,
  `qpcr` varchar(255) DEFAULT NULL,
  `peakDesc` varchar(255) DEFAULT NULL,
  `libCheckResult` varchar(255) DEFAULT NULL,
  `seqMethod` varchar(255) DEFAULT NULL,
  `uploadSize` varchar(255) DEFAULT NULL,
  `uploadUnit` varchar(255) DEFAULT NULL,
  `uploadRemark` varchar(1000) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateuser` varchar(32) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rowIndex` int(11) DEFAULT NULL,
  `currentstatu` varchar(2) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

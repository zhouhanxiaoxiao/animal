/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:20:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_library
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_library`;
CREATE TABLE `cibr_task_process_library` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  `makeId` varchar(32) DEFAULT NULL,
  `createdbtime` datetime DEFAULT NULL,
  `selfnumber` varchar(255) DEFAULT NULL,
  `middleIndex` varchar(255) DEFAULT NULL,
  `samplename` varchar(255) DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `concentration` varchar(255) DEFAULT NULL,
  `totalNumber` varchar(255) DEFAULT NULL,
  `cellLife` varchar(255) DEFAULT NULL,
  `useNumber` varchar(255) DEFAULT NULL,
  `partSize` varchar(255) DEFAULT NULL,
  `libindex` varchar(255) DEFAULT NULL,
  `libbarcode` varchar(255) DEFAULT NULL,
  `cycleNumber` varchar(255) DEFAULT NULL,
  `databaseType` varchar(255) DEFAULT NULL,
  `databaseIndex` varchar(255) DEFAULT NULL,
  `createdbuser` varchar(255) DEFAULT NULL,
  `reviewer` varchar(32) DEFAULT NULL,
  `qbit` varchar(255) DEFAULT NULL,
  `libsize` varchar(255) DEFAULT NULL,
  `seqmethods` varchar(255) DEFAULT NULL,
  `uploadsize` varchar(255) DEFAULT NULL,
  `databaseUnit` varchar(255) DEFAULT NULL,
  `libRemark` varchar(255) DEFAULT NULL,
  `uploadRemark` varchar(255) DEFAULT NULL,
  `checkResult` varchar(255) DEFAULT NULL,
  `checkRemarks` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createUser` varchar(32) DEFAULT NULL,
  `rowIndex` int(11) DEFAULT NULL,
  `currentStatu` varchar(2) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateUser` varchar(32) DEFAULT NULL,
  `initSample` varchar(2) DEFAULT NULL,
  `concentrationunit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

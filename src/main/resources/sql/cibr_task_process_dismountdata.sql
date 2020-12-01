/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:20:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_dismountdata
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_dismountdata`;
CREATE TABLE `cibr_task_process_dismountdata` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  `makeId` varchar(32) DEFAULT NULL,
  `sampleIndex` varchar(255) DEFAULT NULL,
  `sampleName` varchar(255) DEFAULT NULL,
  `dateAccount` varchar(255) DEFAULT NULL,
  `datePassword` varchar(255) DEFAULT NULL,
  `datePath` varchar(255) DEFAULT NULL,
  `sequencingplatform` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `currentStatu` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `rowIndex` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateUser` varchar(32) DEFAULT NULL,
  `superAccount` varchar(255) DEFAULT NULL,
  `superPwd` varchar(255) DEFAULT NULL,
  `superPath` varchar(255) DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

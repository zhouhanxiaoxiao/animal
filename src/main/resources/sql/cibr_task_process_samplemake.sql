/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-11-23 14:19:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_task_process_samplemake
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_samplemake`;
CREATE TABLE `cibr_task_process_samplemake` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `subId` varchar(32) DEFAULT NULL,
  `inputId` varchar(32) DEFAULT NULL,
  `sampleName` varchar(255) DEFAULT NULL,
  `initSample` varchar(255) DEFAULT NULL,
  `derivativeIndex` varchar(255) DEFAULT NULL,
  `selfNumber` varchar(255) DEFAULT NULL,
  `species` varchar(255) DEFAULT NULL,
  `tissue` varchar(255) DEFAULT NULL,
  `testDate` datetime DEFAULT NULL,
  `concentration` varchar(255) DEFAULT NULL,
  `sampleVolume` varchar(255) DEFAULT NULL,
  `totalNumber` varchar(255) DEFAULT NULL,
  `cellLife` varchar(255) DEFAULT NULL,
  `cellSort` varchar(255) DEFAULT NULL,
  `extractMethod` varchar(255) DEFAULT NULL,
  `checkResult` varchar(255) DEFAULT NULL,
  `checkRemarks` varchar(255) DEFAULT NULL,
  `checkUser` varchar(255) DEFAULT NULL,
  `reviewer` varchar(32) DEFAULT NULL,
  `databaseType` varchar(255) DEFAULT NULL,
  `sequencingPlatform` varchar(255) DEFAULT NULL,
  `remaining` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `currentStatu` varchar(255) DEFAULT NULL,
  `rowIndex` int(11) DEFAULT NULL,
  `confirmTime` datetime DEFAULT NULL,
  `confirmer` varchar(32) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `updateUser` varchar(255) DEFAULT NULL,
  `transform` varchar(255) DEFAULT NULL,
  `m260280` varchar(255) DEFAULT NULL,
  `m260230` varchar(255) DEFAULT NULL,
  `rqn` varchar(255) DEFAULT NULL,
  `concentrationunit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

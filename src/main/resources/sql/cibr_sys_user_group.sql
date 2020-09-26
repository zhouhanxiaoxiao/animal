/*
Navicat MySQL Data Transfer

Source Server         : seqpro
Source Server Version : 100305
Source Host           : 119.90.33.35:3569
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 100305
File Encoding         : 65001

Date: 2020-09-22 17:45:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cibr_sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_user_group`;
CREATE TABLE `cibr_sys_user_group` (
  `id` varchar(32) NOT NULL,
  `groupname` varchar(1000) DEFAULT NULL,
  `groupdesc` varchar(1000) DEFAULT NULL,
  `groupadmin` varchar(32) DEFAULT NULL,
  `groupStatu` varchar(255) DEFAULT NULL,
  `grouptype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_user_group
-- ----------------------------
INSERT INTO `cibr_sys_user_group` VALUES ('9a16cfe0bc1346c39bfbf8dfb73e32ac', '计算中心', null, '24f5851abc6444e79be718325025126f', '01', '1');

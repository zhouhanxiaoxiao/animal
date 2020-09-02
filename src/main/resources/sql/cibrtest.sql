/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-09-02 17:20:48
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
INSERT INTO `cibr_animal_drosophila` VALUES ('06b6f3c18b7147119804cd278692fd62', '果蝇', 'D. yak', 'Drosophila yakuba (Dyak\\wild-type)', '', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('0e96aecf4efe439e973d8e8f8b8dbb94', '果蝇', 'VDRC101598', 'P{KK104097}VIE-260B', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('202ae298565f4d52993042b083f0b9b3', '果蝇', 'BC/cyo', 'BC/cyo', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('221311bb45bc43948c12ecbfd765ad36', '果蝇', '76709.0', 'y[1] w[*]; Mi{Trojan-GAL4.0}Haspin[MI09386-TG4.0]', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('230238e4d1824c38887161dab1c452b5', '果蝇', '8545.0', 'P{w[+mC]=UAS-RedStinger}3, w[1118]', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('276d03a6ed194e5d923f08a063ee7738', '果蝇', '野生型', 'Drosophila （BHS melanogaster 北京百花山 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('2a1d3d86cfb24c94bd13944db21237e5', '果蝇', '42218.0', 'w[1118]; P{w[+mC]=UAS-inaF-B.HA}3', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('2cebca68f6514df98a2203df44683cd9', '果蝇', 'willistoni', 'willistoni', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('33711847dd1a429eb7f9db146f740639', '果蝇', 'B # 4414', 'y[1] w[*]; P{w[+mC]=Act5C-GAL4}25FO1/CyO, y[+]', 'bloomington，张力老师要回来', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('344736cc999f486ab3e3ccb4f5b7cf0f', '果蝇', '野生型', 'Drosophila （CF melanogaster 内蒙古赤峰 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('34de1d10ef9a42d787a7d12b2af56f90', '果蝇', 'Bs7457', 'y[1] w[*]; P{w[+mC]=Rh3-GAL4}2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4228a38f104a4a9a9c138cbe9726ec46', '果蝇', 'WT0021', 'D.mauritiana', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4aeb1e0a19c24627aa672aa6e1f364a8', '果蝇', '32045.0', 'y[1] w[*] P{w[+mC]=His2Av[T:Avic\\GFP-S65T]}1 P{ry[+t7.2]=hsFLP}12 P{ry[+t7.2]=neoFRT}19A/FM7a', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4e120e42b15f406aa054900635a208a8', '果蝇', 'Bs47333', 'w[1118]; P{y[+t7.7] w[+mC]=GMR21B05-GAL4}attP2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4f2aaae9e0ea4158bac51c3a288afdc4', '果蝇', 'uas-gfp', 'uas-gfp', '', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('5de6d919431f48739612263772a68f7d', '果蝇', '野生型', 'Drosophila （CF simulans 内蒙古赤峰 拟果蝇）红眼', '北大陆剑实验室', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('643aff63bb224084b200321d17b0087f', '果蝇', 'VDRC106565', 'P{KK112805}VIE-260B', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('65bb5a2f215c4211b027aff6940c68e4', '果蝇', '野生型', 'Drosophila （BHS simulans 北京百花山 拟果蝇）红眼', '北大陆剑实验室', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('670fc354805243b3834069851ee7bade', '果蝇', 'tm2/tm6b', 'tm2/tm6b', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('674780b9f2f845ea9864edf43aef0736', '果蝇', '1104.0', 'w[*]; P{w[+mC]=GAL4-ninaE.GMR}12', 'bloomington，张力老师要回来', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('6c64e997474747fcb92ac969585d17d0', '果蝇', '48778.0', 'w[1118]; P{y[+t7.7] w[+mC]=GMR17F11-GAL4}attP2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('6d6d8c56f0304b7faf816229177d3696', '果蝇', 'w1118', 'w1118', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('8c5c033c00dd454784f306e41155243e', '果蝇', 'BL8860', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('90f6bba7871644f59d1afb04c7ea61bb', '果蝇', '71965.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT045774-GAL4.DBD}attP2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('99d5098e08a04305b8c4f9bd02b646cb', '果蝇', 'BL24647', 'P{w[+mC]=UAS-Dcr-2.D}1; wg[Sp-1], P{w[-]=hs-hid.v2}2/CyO', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('a8f269a3c54e4dbf97de41263b28a22c', '果蝇', '34499.0', 'w[1118]; P{w[+mC]=His2Av-mRFP1}III.1 P{ry[+t7.2]=neoFRT}80B/TM6B, Tb[1]', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('a9f85b5376864757a3da53f1953e46c9', '果蝇', 'bcf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('ab24cb5e797b45858d5d441b22418636', '果蝇', 'VDRC60000', 'w[1118]', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('aef8e452ffe34f3386719ea78dfe7d99', '果蝇', 'VDRC100319', 'P{KK105878}VIE-260B', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('b6272ef6e0534ea7a17ca0f7f99b5d9c', '果蝇', '65402.0', 'P{w[+mC]=UAS-Stinger}2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('c67301e127164240a8fa84877307f3c3', '果蝇', 'UAS-1361-RNAi-2', 'w* ；P｛UAS-1361-RNAi-2｝attP40/Cyo', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('ca20433091414ceea0986a6e3bf71c68', '果蝇', 'Bs8765', 'P{w[+mC]=GAL4-elav.L}2/CyO', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('d24543d1612b4a53be674217808ea733', '果蝇', 'B # 5138', 'y[1] w[*]; P{w[+mC]=tubP-GAL4}LL7/TM3, Sb[1] Ser[1]', 'bloomington，张力老师要回来', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('d4a5c29f703740aeb31e6c5e392cabe7', '果蝇', 'BL25706', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]; P{w[+mC]=UAS-Dcr-2.D}2', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('e4b6ec2cdf744dc1b0d04144e55f0b86', '果蝇', 'Bs51976', 'w[1118]; P{w[+mC]=Crz-GAL4.391}3M', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('e5c81f7df8cd4449a03d5353110936cc', '果蝇', '71814.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT044166-GAL4.DBD}attP2', 'bloomington', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('f22ed9fb96384536a1a5635fce0da308', '果蝇', 'VDRC103313', 'P{KK112859}VIE-260B', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('f80ef504431b4b118af2d7bd37639316', '果蝇', 'VDRC106728', 'P{KK106698}VIE-260B', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('fb99de908f3d4865bc8deaad16365fe9', '果蝇', 'Phic-31', 'Phic-31', '芳景生物', null, '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f');

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
  `usageMsg` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_record_meterial
-- ----------------------------
INSERT INTO `cibr_record_meterial` VALUES ('196bb0cee2d641e9bb8fe3b8d4dd709d', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-01 09:00:00', '2020-09-01 10:00:00', '2020-08-31 15:38:29', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('51e15917a83d4b09be53e833db8c7aae', null, 'asdfased3', '2020-09-02 10:00:00', '2020-09-02 11:00:00', '2020-09-02 14:43:16', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('5be74c03001742449723685276879422', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-01 13:00:00', '2020-09-01 14:00:00', '2020-08-31 15:38:29', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('6a596dba7f6f4db19456804714b09a2e', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 14:00:00', '2020-09-03 15:00:00', '2020-08-31 15:40:50', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('6e6269bf367a40888974526bc7511a22', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 10:00:00', '2020-09-03 11:00:00', '2020-08-31 15:40:50', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('a4c2fae05df94612a20c2bb15fb21854', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 14:00:00', '2020-09-02 15:00:00', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('df5702c1f7954a879ae24a5255d221c6', null, 'asdfased3', '2020-09-02 14:00:00', '2020-09-02 15:00:00', '2020-09-02 14:43:16', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('e0a979744a6049e4b60bfb64bc62d393', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 10:00:00', '2020-09-02 11:00:00', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', null, null);

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
INSERT INTO `cibr_stock_drosophila` VALUES ('01604d702f934686bf2444a21a59d5f5', 'a8f269a3c54e4dbf97de41263b28a22c', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('01bfed5436714e1ab0b5a2248d09b5c4', 'f80ef504431b4b118af2d7bd37639316', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('07ed0c558d78466286e2e58682b400c2', '276d03a6ed194e5d923f08a063ee7738', 'S', '7', 'stock', '2020-06-21 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('0d518b9565d0463ba21c320ddde97780', 'e5c81f7df8cd4449a03d5353110936cc', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('11615ed197f04efd830f800bdee5696a', '4e120e42b15f406aa054900635a208a8', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('11ad6933117848b59bd91b071851b491', '06b6f3c18b7147119804cd278692fd62', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('16a165b413e247a5975cb7531ed304e7', '06b6f3c18b7147119804cd278692fd62', 'S', '7', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('183e5cf18cbb4e859f658cfeced38bf2', '276d03a6ed194e5d923f08a063ee7738', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('191fee5d1c5a402481976e40ad8a3389', '4f2aaae9e0ea4158bac51c3a288afdc4', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('19765c292a3b4f5fab7e3725a932304c', '06b6f3c18b7147119804cd278692fd62', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('19e457ce88c345528d6f4352a97758f9', 'ab24cb5e797b45858d5d441b22418636', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('1ab255230e954449a3036adc4eb0a5ce', '99d5098e08a04305b8c4f9bd02b646cb', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('1e80d021c90b4382a2362fad9386b987', '6d6d8c56f0304b7faf816229177d3696', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('20dcb95c7e1141adaf095187a036bb49', 'a9f85b5376864757a3da53f1953e46c9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('25d94157865b49a5ae749d7e48a7142b', '4228a38f104a4a9a9c138cbe9726ec46', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('2a1280bfd67e4c9094b22a426376e577', '670fc354805243b3834069851ee7bade', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('2a3f55fb14a34159849825a87b3d4fb8', 'd24543d1612b4a53be674217808ea733', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('2dd6dc07649d4c06bcccb848cc313848', '674780b9f2f845ea9864edf43aef0736', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('2eadac9568e1477ebff2c12fae2f067e', '202ae298565f4d52993042b083f0b9b3', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('32b28dde3260417083f5c4b157c7ee8a', '4228a38f104a4a9a9c138cbe9726ec46', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('3be82e7b58de4096baf0679040b7ef8b', '4aeb1e0a19c24627aa672aa6e1f364a8', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('40a46fdf0ee941e399bf2050f5befbb1', 'b6272ef6e0534ea7a17ca0f7f99b5d9c', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('46152c1aa7a64a04922110e4ce296860', 'c67301e127164240a8fa84877307f3c3', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('4bc217d38b5e44999c42460781201ef9', 'f22ed9fb96384536a1a5635fce0da308', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('4d243fcf080e48239cb7350f7ee60f74', '33711847dd1a429eb7f9db146f740639', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('4de8da2ad0ce4af4a0cf450e0da4aee1', 'a8f269a3c54e4dbf97de41263b28a22c', 'S', '2', 'stock', '2020-06-27 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '2', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('5128ff8f102e49479aca0c7fcee63eb4', '221311bb45bc43948c12ecbfd765ad36', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('52f41b5b9af74193bc1bc7e9f59c954d', 'ca20433091414ceea0986a6e3bf71c68', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('55d8b7c4dad340a8bd241d31328cfff1', 'a9f85b5376864757a3da53f1953e46c9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('56c5f586763d44e68cbc9621de7746db', 'ca20433091414ceea0986a6e3bf71c68', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('5c691745efeb4ec48b71511fbb70f0be', 'aef8e452ffe34f3386719ea78dfe7d99', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('5c78e7d2bdef4ac99e4c8da6c0756d7c', '99d5098e08a04305b8c4f9bd02b646cb', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('5f6f0931b6de4053abbbf328fd838b18', '6c64e997474747fcb92ac969585d17d0', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('6549741451b1420095e66baaa25cfc28', '6d6d8c56f0304b7faf816229177d3696', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('67059582beaa4546af2bb71abbd30e28', '230238e4d1824c38887161dab1c452b5', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('67d6443c56d74290b9c21337d8fa0549', '90f6bba7871644f59d1afb04c7ea61bb', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('69bc9d9c0d5545308d394bfe36135b3f', '670fc354805243b3834069851ee7bade', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('6f43548b5c274ec8a7a579a8bc123bd2', '643aff63bb224084b200321d17b0087f', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('712446eba519439fa40e35b5d7c42589', 'f80ef504431b4b118af2d7bd37639316', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('7140e781570d405d9617945f380645e9', '33711847dd1a429eb7f9db146f740639', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('7287f5b1fa9546f9a91dba277c2c66f0', '202ae298565f4d52993042b083f0b9b3', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('72d5fcbf783f4f2a911f4d9dbac0c83c', '2cebca68f6514df98a2203df44683cd9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('772546acad234414a3cb5340e83aa584', '65bb5a2f215c4211b027aff6940c68e4', 'S', '7', 'stock', '2020-06-21 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('7a6f14bbf724401cb015f0342d07ce2b', '276d03a6ed194e5d923f08a063ee7738', 'S', '7', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('86aec35a3ec14cbd8acb4f2c1e416bcc', '65bb5a2f215c4211b027aff6940c68e4', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('87009692435940d6aa07396febb3eee1', '65bb5a2f215c4211b027aff6940c68e4', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('88891996dd29498582e3bdeffcf68af1', 'a8f269a3c54e4dbf97de41263b28a22c', 'S', '2', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '2', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('94991c1acd534c4a97f24a03d7e9d891', '6d6d8c56f0304b7faf816229177d3696', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('96ecfd9a5d094977b58609f41814e41b', '2a1d3d86cfb24c94bd13944db21237e5', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('9c6a47f517d540e7b330dc039fc37d7f', '2a1d3d86cfb24c94bd13944db21237e5', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('a1096d3e29084a7c840f110b25899a85', '0e96aecf4efe439e973d8e8f8b8dbb94', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('a2cae54ae36844ee81b1effffd87057a', 'fb99de908f3d4865bc8deaad16365fe9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('a406d5edab9247348dde83b9bbd96fbd', '4e120e42b15f406aa054900635a208a8', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('a7d49a6daf4a45108942bfad25363a6c', '8c5c033c00dd454784f306e41155243e', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('a8e3800b456d495e9f19b746f615b1fe', '6c64e997474747fcb92ac969585d17d0', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('a9484416891448049082739e7e9c23fd', 'd4a5c29f703740aeb31e6c5e392cabe7', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('a9701648bbc940c28607d7c7bb6cce09', 'ab24cb5e797b45858d5d441b22418636', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('aa26a2ea171c45fe810a6ec6eac12ce2', 'c67301e127164240a8fa84877307f3c3', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('b1de0e5c5b624bfda6a82758435d7d53', '5de6d919431f48739612263772a68f7d', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('b9181e9e246c4120b0851a320ec0ae13', '65bb5a2f215c4211b027aff6940c68e4', 'S', '7', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('bb4d3561dc87440abca7483334f6d78c', '34de1d10ef9a42d787a7d12b2af56f90', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('bb75eafc29604e95b1a0177f2178c969', '6d6d8c56f0304b7faf816229177d3696', 'S', '4', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '4', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('bf00a3aa15894cd1b6f7004577adaa74', '0e96aecf4efe439e973d8e8f8b8dbb94', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('bfb5b8aada0742eea20aac9a211fdc82', 'd4a5c29f703740aeb31e6c5e392cabe7', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c02df797132f4f2e97f4f9223caafba4', '6d6d8c56f0304b7faf816229177d3696', 'S', '4', 'stock', '2020-06-23 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '4', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('c0e0b792d87e48dcad83c196868d2a14', 'b6272ef6e0534ea7a17ca0f7f99b5d9c', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('c22cc4298f4c47ceb0a77ff20f13c554', '344736cc999f486ab3e3ccb4f5b7cf0f', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c2b52373e1774318998aec1198670ee8', 'f22ed9fb96384536a1a5635fce0da308', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c31c3086132143e588d08c7ef64f1b39', '6d6d8c56f0304b7faf816229177d3696', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('c5d88c1e98e4433baf147fa28e452473', 'e5c81f7df8cd4449a03d5353110936cc', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c935d11be5b144269cc8eab9e0e21454', '4aeb1e0a19c24627aa672aa6e1f364a8', 'S', '2', 'stock', '2020-06-27 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '2', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('c9b70bd74c6d49fcbcddaf8cb4d702f3', 'fb99de908f3d4865bc8deaad16365fe9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ce946d71e7a9461fa378fd0c69f74f74', 'a8f269a3c54e4dbf97de41263b28a22c', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('d35928f2cc4e480d91824070a71ea928', '34de1d10ef9a42d787a7d12b2af56f90', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('d45fb353287c44958aa2cb6b21b828ca', '4aeb1e0a19c24627aa672aa6e1f364a8', 'S', '2', 'stock', '2020-07-02 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '2', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('d9cfa33c8fb04c34a0ff75c46058dfdb', '674780b9f2f845ea9864edf43aef0736', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('dae97558fbae49c28b2eae889247d4e5', '276d03a6ed194e5d923f08a063ee7738', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('df2a6741ff234585a8f2eb25515bb0eb', '5de6d919431f48739612263772a68f7d', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e311b8ea8dd0470a8257d591748865d5', '221311bb45bc43948c12ecbfd765ad36', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('e4649b26cac74232932e7d1408368d87', 'e4b6ec2cdf744dc1b0d04144e55f0b86', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('e59729d3673c4c4399352fb0c6131ed6', 'e4b6ec2cdf744dc1b0d04144e55f0b86', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e7049e57634f4de7a4226209423a43de', '8c5c033c00dd454784f306e41155243e', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e8da7ecaaeac48348f80efe16b6be29d', '06b6f3c18b7147119804cd278692fd62', 'S', '7', 'stock', '2020-06-21 16:00:00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '7', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e9f5c09ce1ef42eda9184dc3fab3775c', '344736cc999f486ab3e3ccb4f5b7cf0f', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('eb36323155034f2ab7421cc4eaa15254', 'aef8e452ffe34f3386719ea78dfe7d99', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('eb436ea843ae4cad81bcc89d2bb65eb2', 'd24543d1612b4a53be674217808ea733', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('ec97c36cb3474b09916af7d867e2b668', '4aeb1e0a19c24627aa672aa6e1f364a8', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ed6d1b9d38e64d28847c44b4191cf016', '4f2aaae9e0ea4158bac51c3a288afdc4', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('f213795a7fae42588367ba084e6d39f7', '230238e4d1824c38887161dab1c452b5', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('f7b47b080d02404f9ba4b0b6fa835bba', '643aff63bb224084b200321d17b0087f', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('f92322bff2e24d96acac607bd7fc6491', '2cebca68f6514df98a2203df44683cd9', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('faa6f6d0721a484da6415af59b2f3296', '90f6bba7871644f59d1afb04c7ea61bb', 'S', '1', 'keep', '2020-08-24 08:49:11', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', null, '1', 'S', null, null, 'sdafsdfasdfasde');

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
INSERT INTO `cibr_sys_email` VALUES ('08fe17ae826b4797aaa2d63d9d8024de', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0a82e5099bea46d0a1bdfa64aab872fd', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:39:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0be3dca629d146ad87e1e1a9b4293b05', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-28 14:41:14', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('0c4c96a57f0f4c9090be3f1e548a7a09', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：350263，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:51:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0d29e7d1343b445eadc798e01305e912', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:16:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f7d432fa75640dd921393813827e08e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【士大夫】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:47:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1031464eec7b4e1faee8b800406bfb14', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-08】,任务申请【！！！加急！！！】，请及时处理。\n\n\n\n\n感谢您使用资源管理平台！', '2020-07-24 03:29:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1688823d8fcc4645ac5a3d87970fe8d6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:58:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1845b88521c54fe7abde458db7657531', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-31 15:52:37', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('18adea51c2b74250a8d9056ee880d6c4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【哎哎哎】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1924e8f2a63049b8800238a7fc28744d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：727477，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-10 08:22:41', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1ad4732da175415896866736b639d792', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:12:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cc65e887be945768937608c2dd8741f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【asasd1121231231231313qwrfs312】，请及时处理！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:47:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cc675b257ba4d8aa82dc35ed5d6bade', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:08:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1d009fc5a8b846ce8213fd1c010706e8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:52:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21d595960f7c44358d77d637237f48d3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:42:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21f5f475903e4472a779b15656b0f08b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:44:32', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2593c51b811647a389d857068bdc5eeb', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:02:10', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('27493aab10e948a28722992a61a988c4', 'zhouhan@cibr.ac.cn', 'dsdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：548072，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:10:22', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('298d3bc7e1e4401b9f6051f0e62f985f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：810322，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2b0a376f6f1a4dba9a77f9d01794212e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:16:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2c71842f1025484e86e7e6c5b39b8f50', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:07:01', null, null, 'ok', null);
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
INSERT INTO `cibr_sys_email` VALUES ('4f68462ecd02407483ea8c744be668e0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-31 15:52:37', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('53ff3ec3a57c41b683c998fdca82bece', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('55f5247cb40a450494106d998240c5a2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：222568，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:42:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('586ac2874dce4b41b3f4ec61a3f50624', 'zhouhan@cibr.ac.cn', 'adsfa@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：640080，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:13:15', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('5a6d02cc51654bffabc8929542efcd75', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:37:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5a90b0e78e604276a3fd09ef318f4001', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:34:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5ec9520d3be242e5a2784164f92bc4ef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-17 02:24:00', null, null, 'ok', null);
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
INSERT INTO `cibr_sys_email` VALUES ('711009686a1c4a76a29cc5aec01652a0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:14:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('71fea3ee192742a080408fc8abeef181', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-24 01:29:30', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7400f39384254510aa20c177fc13df69', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 10:02:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('76a0246e19384f1c993e6894c0b3c7c7', 'zhouhan@cibr.ac.cn', '981436939', '验证码', '【北京脑科学与类脑研究中心】验证码是：944943，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:03:31', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 500 Error: bad syntax');
INSERT INTO `cibr_sys_email` VALUES ('76aef08810dd44c68acc5372de6b2041', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-21 10:47:05', null, null, 'ok', null);
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
INSERT INTO `cibr_sys_email` VALUES ('a2f9b855c5b34070ab7005a1438d2ada', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-02 16:44:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4eadd3a6d1443baac03a12637b39a40', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 03:08:35', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ad8351c24f584153b723d3c1e2b68df4', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：655644，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:06:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('af81e0c7ef18422592a213eed16bf5e4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【0】条，拒绝【1】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:02:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b11d0f3cd4c14236ad583607a7ca6bbe', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：156654，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:53:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b231d434b8b340a6a38978c16846a4be', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b395bc774e5d4ecc9c691baff5c35156', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【4】条，拒绝【4】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:37:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5b63680240d415c85c084d46df328da', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5be9a4065c445e2961fc376f905446e', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：191350，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:49:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b66e04f58e2040598191e3a3f1d785bc', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:13:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b6c19a9092d24a99855d894b1797de92', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:28', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b727a99a259449da854f1cde78674ab2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-17 02:03:19', null, null, 'ok', null);
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
INSERT INTO `cibr_sys_email` VALUES ('d44d722cdfc8456b8e38059f72e30d93', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00    】【北京脑科学与类脑研究中心】', '2020-09-02 16:58:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d50a09721d694d09b467ff74cae9b3ef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:00:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d68cf04a0be54a30a4237e9ebc9c71c6', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：543530，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:58:59', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d7f541ce02e948a39458a2ea9576ed03', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-21 07:09:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d8e84f9e83b84edbb6c07c273f989546', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:47:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dd380f781a37437aa2f29e28a208812b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：695869，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 02:24:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dd49d387b06944e9aeb69402266c5c6b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:13:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('df130c10d733429bbc84daf767fc6a49', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:27:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e13eaa96e05746fa978ac6bc689feffb', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：677585，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:01:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e4944b8dee824545b49a733cc394b4b6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:31:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e56086fad41d46929c053dbefd695706', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】被【确认】。\n是否需要扩繁：【否】\n 备注：【不要慌张】\n如有疑问，请联系【zhouhan@cibr.ac.cn】', '2020-07-30 01:58:43', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e6573b2bb47e413d96e741031dd8f42c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:07:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e69c223313664db59a1c144bbda01d05', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-15】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-31 08:16:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea667b6539e34fce9ac86718c6070b12', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：171693，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:51:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea9e04771367441c9fa11bf714f39deb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【xxxxxasdfasdfasdfasd】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:33:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eb523a6470814bda9b279521e3897a57', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:29:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ed7b3258766641d79ab82356e244e8ff', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-28 14:41:15', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('eeaf6a92d5c14099b8674ec685fbb315', 'zhouhan@cibr.ac.cn', 'asdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：778940，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:11:46', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('f00729ad3a5e4118ac1e3f3ce628f535', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【0】条，拒绝【3】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-04 09:06:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f0489d246cf74c47a02f76ad15ea592e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:14:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f56f64f7198d4404818d95b25868ec53', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-02 15:26:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f5ecdabae6ec44359fba2f45552ff1f6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-12 02:57:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f8809310978a423a96cd26c901f6d22b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:23:25', null, null, 'ok', null);
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
INSERT INTO `cibr_sys_environment` VALUES ('sdafsdfasdfasde', '12h', '18°C', '50%', '70%', null, null, null, '2020-08-24 16:24:58', '12h-18°C-50%-70%');
INSERT INTO `cibr_sys_environment` VALUES ('sdafsdfasdfasdf', '12h', '25°C', '50%', '70%', null, null, null, '2020-07-13 17:32:57', '12h-25°C-50%-70%');

-- ----------------------------
-- Table structure for cibr_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_file`;
CREATE TABLE `cibr_sys_file` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `detailId` varchar(32) DEFAULT NULL,
  `fileStatu` varchar(2) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `md5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_file
-- ----------------------------
INSERT INTO `cibr_sys_file` VALUES ('006bb8a1d28942d9a0336f72694f0482', '9f402e07006d4680b6f50247d2f51ced果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\9f402e07006d4680b6f50247d2f51ced果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:23:32', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('0be28d4cc29045d8be0817dd619ed7ef', 'dd8659c37b9e4be3b8576ff05e54c6b4果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\dd8659c37b9e4be3b8576ff05e54c6b4果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:49:11', '8ecd2202bd7425d907d5935919b2f3b0');
INSERT INTO `cibr_sys_file` VALUES ('0edd8433f8034892b355dfd59b22ca09', 'fa9b14a135d0493595670d4c7d3fff6c样本录入-组织-xxx.xlsx', 'D:\\code\\fileUpload\\fa9b14a135d0493595670d4c7d3fff6c样本录入-组织-xxx.xlsx', 'a5c874a970374966a798943cc731ea85', '00', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:29', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('14514853fd5d421eb8df41f70ad66ed6', '12659873e53f4cfdaa13e1ade842c9d2果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\12659873e53f4cfdaa13e1ade842c9d2果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:25:34', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('340489cd5c7a4f68b48e28536aea66b4', 'c19a9137e9c24e7ba61c986c9e1c3d03果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\c19a9137e9c24e7ba61c986c9e1c3d03果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:13:56', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('4e25bfd13fe644ef877162e82757d717', 'd1b2baff853e408d8e9caa149df45ef8果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\d1b2baff853e408d8e9caa149df45ef8果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:22:41', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('529de4bd876643078677b7d3843d1cda', 'c4d847e2c78d4bce814c87bc8c0e0bff果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\c4d847e2c78d4bce814c87bc8c0e0bff果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:34:45', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('544a38f7b1f44ff998b6db38e8ec0588', 'e05b50be19a540d0be52fa75d0188b0b果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\e05b50be19a540d0be52fa75d0188b0b果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:17:32', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('62ff8c0ba381416ab090cecb6eeb398d', '776cc18ff8a54aabaf334a81f9c336cd果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\776cc18ff8a54aabaf334a81f9c336cd果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:13:23', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('8121d9a926694538b1c6205c579cc90b', '0ed43a03ab2749ab84b8e213d76fda26样本录入-核酸-xxx.xlsx', 'D:\\code\\fileUpload\\0ed43a03ab2749ab84b8e213d76fda26样本录入-核酸-xxx.xlsx', 'ce598c12f521413fa5d644cfb2fad17f', '00', '24f5851abc6444e79be718325025126f', '2020-08-19 06:56:32', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('8681973ff9ba49419f6e8510ea90710b', '7303497b08ad4291a2d103ea34bd0241果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\7303497b08ad4291a2d103ea34bd0241果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:22:00', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('87db42d8f98e4176bfe1a38ca0ca2872', '899d5d8477b54a1c80c57dfa0bd063e4样本录入-细胞-xxx.xlsx', 'D:\\code\\fileUpload\\899d5d8477b54a1c80c57dfa0bd063e4样本录入-细胞-xxx.xlsx', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('8939615c5d6f4a73ad1860e67dc0a7e7', '83d6c3f2b11546ca97cae724f6cf8100样本录入-核酸-xxx.xlsx', 'D:\\code\\fileUpload\\83d6c3f2b11546ca97cae724f6cf8100样本录入-核酸-xxx.xlsx', 'dd6411c7ae3c4b738090d439a21bcae5', '00', '24f5851abc6444e79be718325025126f', '2020-08-19 06:26:07', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('8cd8244003c142d4bdbae49e065f0693', '0767a9a44ede4261a3d56d2db04ff09f果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\0767a9a44ede4261a3d56d2db04ff09f果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:10:15', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('91d081d6a7f64fd88699ab2558951729', '7c292077f1694c05b4e21e703a457bbe果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\7c292077f1694c05b4e21e703a457bbe果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:13:45', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('9268f21af1a549b09e345ffcbbc2402c', 'ff7eec5295dc44a08e1474c0d53e8467果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\ff7eec5295dc44a08e1474c0d53e8467果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:20:45', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('9527ad020df547a29028f29a35a50712', '51375491d8c84378ac3628235e869ac0果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\51375491d8c84378ac3628235e869ac0果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:15:09', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('a0cbf351790741bb9a436b199acd40c5', 'a14cff0a8b0b4ad295c03e463cf2c995果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\a14cff0a8b0b4ad295c03e463cf2c995果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:29:14', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('a1d10695c30744eabc54a8699dc3e3a4', '9897dd0ed22c443da567bb60d5509ae8样本录入-核酸-xxx.xlsx', 'D:\\code\\fileUpload\\9897dd0ed22c443da567bb60d5509ae8样本录入-核酸-xxx.xlsx', 'dd6411c7ae3c4b738090d439a21bcae5', '00', '24f5851abc6444e79be718325025126f', '2020-08-19 06:24:54', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('a89d50d633274a5da318b5606871077c', 'c05d38aaa1dc41cab858d17a5805a315果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\c05d38aaa1dc41cab858d17a5805a315果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:20:02', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('aa4c3e00ccd9421b836925a856af0572', '73ac21b0251943e1aed04ac509063cec果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\73ac21b0251943e1aed04ac509063cec果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:16:22', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('b2007baa29d14fcd8f5a9b59279b1147', '71fe02695bd04123a400370aec79cdc2果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\71fe02695bd04123a400370aec79cdc2果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:06:42', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('b43d7a7ec6ed480d9487e16414f9a904', '59c707130d414ada8e4ea2546d2f3e3f果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\59c707130d414ada8e4ea2546d2f3e3f果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:18:15', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('b54a7489669b41b78f5255c14eede3a9', '2f3fe2020470416a9d7bd0af2cd422e3果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\2f3fe2020470416a9d7bd0af2cd422e3果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:07:26', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('b5df6562d1bd4e9b9af62965d5977e9e', 'cf990b88e6a0466f9d22248778513f3d果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\cf990b88e6a0466f9d22248778513f3d果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:20:32', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('bbe8484980e4492d9fbefc938c9a7aea', '41353e209c864e3394d743faa107a270样本录入-细胞-xxx.xlsx', 'D:\\code\\fileUpload\\41353e209c864e3394d743faa107a270样本录入-细胞-xxx.xlsx', 'ce598c12f521413fa5d644cfb2fad17f', '00', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '5866bded0e874c46f50a58729eedac4a');
INSERT INTO `cibr_sys_file` VALUES ('c00339c317394a4a820890dd0cc9063b', 'd2f38249ff6d4f58b13a389d35b937a2果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\d2f38249ff6d4f58b13a389d35b937a2果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:11:26', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('c9408d81b3254f2692220bcbbd49d024', '64c0751ef3294a0c92648911c4d786dd果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\64c0751ef3294a0c92648911c4d786dd果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:31:14', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('d25ce599d39545a785613add562222e3', 'e011079ef84a4402a4b7079ee2746327果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\e011079ef84a4402a4b7079ee2746327果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:43:36', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('d291b69041bd40d1a8c86749dc31929e', 'c1cc85cfcd214c2cbb38414e907118a2果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\c1cc85cfcd214c2cbb38414e907118a2果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:24:09', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('d4e1bfe0cd174199a8d55ee1adec9817', '7bac6caa861547d2bbdd262f7721fff5果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\7bac6caa861547d2bbdd262f7721fff5果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:41:16', '69232b2822fe6c518800a3608d18888c');
INSERT INTO `cibr_sys_file` VALUES ('f406222511a84157b028407c76c7c9d5', '25d83cf1f8e7418aa150d03318e27205果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\25d83cf1f8e7418aa150d03318e27205果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:06:01', '0051fd6176d0aa5b11a86bb638a524ed');
INSERT INTO `cibr_sys_file` VALUES ('fa7d14e3324343e6bc8a5b2e9b47715a', 'f9ca02ee95174d779a537c85a7cb67ce果蝇记录（07.03）.xlsx', 'D:\\code\\fileUpload\\f9ca02ee95174d779a537c85a7cb67ce果蝇记录（07.03）.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-08-24 08:27:23', '69232b2822fe6c518800a3608d18888c');

-- ----------------------------
-- Table structure for cibr_sys_material
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_material`;
CREATE TABLE `cibr_sys_material` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resourceStatu` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `metdesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_material
-- ----------------------------
INSERT INTO `cibr_sys_material` VALUES ('asdfased3', '拍照片', '1', '2020-08-17 11:01:23', null);

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
-- Table structure for cibr_sys_suggest
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_suggest`;
CREATE TABLE `cibr_sys_suggest` (
  `id` varchar(32) NOT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `comments` varchar(5000) DEFAULT NULL,
  `replyto` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_suggest
-- ----------------------------

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
INSERT INTO `cibr_sys_task` VALUES ('14f73010e70e49979ba42b1b0e99f730', '04', '2020-09-02 15:28:24', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 16:30:15', null);
INSERT INTO `cibr_sys_task` VALUES ('39196d90a6c5457b97c945895ffa0bb3', '02', '2020-09-02 17:13:56', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:16:38', '都是');
INSERT INTO `cibr_sys_task` VALUES ('547ac98d3a3e45b79a4ab04a47344e2a', '04', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:00:42', null);
INSERT INTO `cibr_sys_task` VALUES ('57ac977a959e4c27ac88287dfbc30771', '03', '2020-08-31 15:52:37', '24f5851abc6444e79be718325025126f', '01', '24f5851abc6444e79be718325025126f', null, '全都有');
INSERT INTO `cibr_sys_task` VALUES ('8b9b55ad840c4ab093b0400fce9e9642', '02', '2020-09-02 17:03:14', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:04:14', '发送到');
INSERT INTO `cibr_sys_task` VALUES ('c89d799622fc4f49a7bfc371b6d79407', '02', '2020-09-02 17:02:10', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:02:39', '啊是');

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
INSERT INTO `cibr_sys_task_business` VALUES ('018f34b85fab4c379acfdec3cb0d8b72', 'ed922143b51e4b3da793e59c5accae38', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-21 07:09:07', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('0434c684d8014eb39051043a2c6bd474', '1f8c28a63676417c9c2d3194a158feb8', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-17 03:12:52', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('0811d4e25dc54874ac363276a00ade4a', '8b9b55ad840c4ab093b0400fce9e9642', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-02 17:03:14', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('0df25317ab924792801cc878399937eb', 'febfaee1df3f424ca57f8969216a299c', '5646848a54754bbe833eba1c681cbe02', '01', '02', '2020-08-10 02:53:06', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('16d402d402174caeb7e3bacc4a9fdd6a', 'e9bd57875d7140b7a6757f597a3ebd30', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 06:06:33', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('19d2bc45447f4c9cae1b6924c6a865e3', '8ab46708113045a092e332a580c144bb', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:42:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('2a8fba4154f64feabdaf2928568b27e2', '43065aaabaa14bfaab2e027a4caecdfa', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:34:09', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('2c1a3300984f4ab9b5a975c2337d50ec', '6a7cd20670c446e28c0924b9b86353ea', '5646848a54754bbe833eba1c681cbe02', '01', '02', '2020-08-07 07:12:19', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('3071d6adcf184f008493d7d8939ff088', 'c98af5dba22542ec80a014f223506878', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-06 10:12:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('3406b33772d447cbac6aecac5f8de178', '57ac977a959e4c27ac88287dfbc30771', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-31 15:52:37', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('4378db7794d64d0badfc579520af437d', '25356e487001438f9d02d98c8e518397', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:56:46', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('472acaadeb3d4f3b8235830a1f08817a', '453337438c9341929c4b6a8b73268411', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:18:25', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('4b6d2c843e14472b91fa1e8a75f2456c', '061adf133dea4ea9876745aa53ac19a8', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-21 10:47:05', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('52234455ecff40bcae531854f81dfa32', '0bbfd8d1a5964aff9737a3a0b5f18b8d', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:55:46', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('576d8bb257374b268867860725fa7d02', '15890decaca84ffba1f39f6d5caa66fa', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 06:07:06', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('673848825e6a4fc18e5f8fdc07a4ffa4', 'c7a50e1f0b9640ae83d3f54d6fef06e4', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-17 03:07:01', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('6a7b73f7334e418c87c4b0fbf153a34e', '39196d90a6c5457b97c945895ffa0bb3', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-02 17:13:56', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('6e8facb78182452197e1e4e80387cccc', '33ba3ad0e7f942c8aac38ab1dc952bd2', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:13:56', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('7a38904a92e946c991d42cb2b6627b61', '3b0a1f1aa7704f3bb667e34c6c4d8eca', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 09:22:04', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('7b3bfac6b8be4cc68c653435e2492e16', 'cb27f3ce6bee425cb846168a4ecea58e', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-11 03:14:12', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('882fc8f3b5464d398e78898c141497ac', '9af537668d4c4d8c98abe58a9bc3705f', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-17 03:08:30', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('8c9b6aa81e14489aad3abe1ae4bed487', 'd1c5853e992f48d2a28aceb3fede26b4', '24f5851abc6444e79be718325025126f', '00', '01', '2020-08-17 03:23:25', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('8d74ca162da24b7ea2026666fb6b3c72', 'c89d799622fc4f49a7bfc371b6d79407', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-02 17:02:10', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('9bd5b996c89f4d1987ba34b95425dfa4', '633f5f2e6a87404cbb698b7416199741', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-12 02:57:47', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('b4afabdae49842e297f6b975aabcf458', 'f0e1b0bc922f467b8caf4fcc1dce4f64', '24f5851abc6444e79be718325025126f', '01', '02', '2020-08-11 03:08:51', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('b682b15300614d3ea157b8ba0aa43049', '05031e48adcb42a19966a59963f6ab81', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 10:02:49', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('b7a6d3eeecb34e2dbd6cf5fb86698ba1', '7f07103e0a9f49dfa1e5e8c4b89a7048', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-06 10:16:48', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('bf980a3291a240aab05b13966ddc9978', 'b60dc07081f340cb9ca5c8508b6139b8', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:13:52', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('c154a6f0e7a94aab8bbed1b4dda9471f', '7d25b0e4f6de45438149d391dc57130a', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-28 14:41:14', '创建流程管理任务');
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
INSERT INTO `cibr_task_ask_confirm` VALUES ('140dbf791f0048d6a12ce6d44280dd2f', 'c4e2efb915ba4eeb837e53a0e44eec9e', '2020-09-02 17:04:14', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('3ef8dfb998204d8eb40f39f4b1a216a8', 'e3811eb3359b4b23a57d72d2f22476c4', '2020-08-06 09:53:22', '5646848a54754bbe833eba1c681cbe02', 'N', '是打发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('44b3da7f96a4402481c2686362cd600e', 'c4e2efb915ba4eeb837e53a0e44eec9e', '2020-09-02 17:03:55', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('4519825b2d874698a901ad70a2f54265', 'e9486dbd50c8411cae24b161dd35451d', '2020-08-06 09:33:25', '5646848a54754bbe833eba1c681cbe02', 'Y', '阿斯顿发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('49e7de41f34d416897f813c9c3e1c474', '9aed4413d02c414580cb875226deb2d2', '2020-08-10 04:49:28', '5646848a54754bbe833eba1c681cbe02', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('544e448955a34f57b097195d180185f2', 'c15e67c0775b404cae0ffe7644c0bbc5', '2020-08-06 09:32:41', '5646848a54754bbe833eba1c681cbe02', 'Y', '阿斯顿发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('64706951983b4c67a73248ccfa0e62e5', '428161d6a95748feb2e7874362836198', '2020-08-07 08:37:48', '5646848a54754bbe833eba1c681cbe02', 'Y', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('6e587e42cc6045e6a6f15a47cc395549', 'a767c2aa84d0463096f8dfc9d9cf66ab', '2020-08-06 10:00:35', '5646848a54754bbe833eba1c681cbe02', 'N', '打撒所多');
INSERT INTO `cibr_task_ask_confirm` VALUES ('7e0227ab1e84487abb1b15d884704e18', 'c4e2efb915ba4eeb837e53a0e44eec9e', '2020-09-02 17:04:02', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('9f59950da61743efadf576647cfd31b1', 'efa3b5f8da9e4fa1adc796471c2a3afa', '2020-08-10 04:49:37', '5646848a54754bbe833eba1c681cbe02', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('aab41aeeb9804b4eb281d7191f35d76b', '276ff6636e814faf82b141c5c2e6f1e3', '2020-09-02 17:16:38', '24f5851abc6444e79be718325025126f', 'Y', '');
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
INSERT INTO `cibr_task_ask_director` VALUES ('2096016942cb4362a2611b323208447c', '9c781839091d4b30953fc6d25a77b5cc', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-17 03:07:01', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('26609d65ca97429484c71a52a8c1d372', '4f9633aaa4634981a496ff9a1be89562', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:02:10', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('463f94b319d14843b68bbe87460f9cb4', '05567077ecfd4db2b29c379487bd760a', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:55:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('4d0ff890b64547c18caef1d416560c49', '6b49d0cbfb994137b8cd6612d075c9b8', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:13:56', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('551446827ee24bb080a7e2a7611b1962', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5791f82de7324914bffdeb3bb56839fa', '4ce07456d6104e85ae808fb955b25c13', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 09:56:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5bde1921e5794f499827d22a5e53d61a', '9aeea58cf85146959dccf540259c72d4', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:13:56', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('67e6cb9e167c4d548d06074454e2d29c', 'a4680b1e35b8419db01494dd1318d96e', 'bf85f70d4a9e4d42b32ba67450', '2020-08-02 07:42:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6b594046a02641ef98293da29eed9bda', '1bb4b0fea5ab4984a5f86b62926d3902', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:22:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6ffea4f86e9c4bf6bccf3f7e5e119d18', '7943476691744fed8ba40aa182be75eb', 'bf85f70d4a9e4d42b32ba67450', '2020-08-06 10:12:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('828976286d1e460cb4e159197add1755', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:18:25', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('8a1428f9e22c4576a9f15d377ced67a6', '6537f9ab4cc24fbda95ce1f4f8c9386b', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 07:13:52', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9341fdd199f7404a810281ea66f425d2', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf8ad4a9e4d42b32bef5b3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9acf9d2df5d647f69c0212d864fbbfb1', '2e70ad94a5884116b3fd26aa3138a095', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-17 03:07:52', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9d9365b5a30a41e3ad5ee6fb8763fbcd', '428580b8b28b414397f044e0d2e19ca4', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:14:12', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9e9d0552cceb4585bba9928f2a2aa788', '4f1779e5cf2c4fb9959ce4670b7dc985', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:03:14', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('9ec4bcf1133f4f6e97fba2f74f5e0b94', '9725728474a64cb58f47ad4fd5a71341', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-21 07:09:07', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('b11e8db9002949dcae94374afe5b4350', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('b17f08d251944a93ac406ec3d6a4458b', 'ddd48327bf3942b7989ceae14f447bce', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-17 03:12:27', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('d9858e19e4ea47a7b7a9471407d9b108', 'a965c30a8db14018922ee7cd04d93713', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-17 03:23:25', '0');

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
INSERT INTO `cibr_task_ask_drosophila` VALUES ('2e70ad94a5884116b3fd26aa3138a095', '24f5851abc6444e79be718325025126f', '2020-08-17 03:07:52', '', '1', '9af537668d4c4d8c98abe58a9bc3705f', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('428580b8b28b414397f044e0d2e19ca4', '24f5851abc6444e79be718325025126f', '2020-08-11 03:14:12', '', '1', 'cb27f3ce6bee425cb846168a4ecea58e', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('4ce07456d6104e85ae808fb955b25c13', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 09:56:46', 'asdfa', '1', '25356e487001438f9d02d98c8e518397', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('4f1779e5cf2c4fb9959ce4670b7dc985', '24f5851abc6444e79be718325025126f', '2020-09-02 17:03:14', '发送到', '', '8b9b55ad840c4ab093b0400fce9e9642', '08', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('4f9633aaa4634981a496ff9a1be89562', '24f5851abc6444e79be718325025126f', '2020-09-02 17:02:10', '啊是', '1', 'c89d799622fc4f49a7bfc371b6d79407', '09', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '24f5851abc6444e79be718325025126f', '2020-08-11 03:18:25', '', '1', '453337438c9341929c4b6a8b73268411', '04', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('6537f9ab4cc24fbda95ce1f4f8c9386b', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:13:52', '', '1', 'b60dc07081f340cb9ca5c8508b6139b8', '09', null);
INSERT INTO `cibr_task_ask_drosophila` VALUES ('6b49d0cbfb994137b8cd6612d075c9b8', '24f5851abc6444e79be718325025126f', '2020-09-02 17:13:56', '都是', '', '39196d90a6c5457b97c945895ffa0bb3', '05', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('7943476691744fed8ba40aa182be75eb', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:12:04', '等等撒多所多所', '', 'c98af5dba22542ec80a014f223506878', '05', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('9725728474a64cb58f47ad4fd5a71341', '24f5851abc6444e79be718325025126f', '2020-08-21 07:09:07', 'asdfasdfsdf', '', 'ed922143b51e4b3da793e59c5accae38', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('97d2daf442de4b05ba60c3aa38b4535f', '24f5851abc6444e79be718325025126f', '2020-08-11 03:16:21', '', '1', 'ca9487f95e6f4e93ace9c9c33367d0d4', '04', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('9aeea58cf85146959dccf540259c72d4', '24f5851abc6444e79be718325025126f', '2020-08-11 03:13:56', '', '1', '33ba3ad0e7f942c8aac38ab1dc952bd2', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('9c781839091d4b30953fc6d25a77b5cc', '24f5851abc6444e79be718325025126f', '2020-08-17 03:07:01', '', '1', 'c7a50e1f0b9640ae83d3f54d6fef06e4', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a4680b1e35b8419db01494dd1318d96e', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:42:04', '', '1', '8ab46708113045a092e332a580c144bb', '08', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a965c30a8db14018922ee7cd04d93713', '24f5851abc6444e79be718325025126f', '2020-08-17 03:23:25', '', '1', 'd1c5853e992f48d2a28aceb3fede26b4', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('c46c8414424f4c09bb5dc7a0e3929906', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 10:02:49', 'asdfsa', '1', '05031e48adcb42a19966a59963f6ab81', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('d90a131f0a8f4b5985d0692566b50ae3', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:34:09', 'asdfasdf', '1', '43065aaabaa14bfaab2e027a4caecdfa', '00', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('ddd48327bf3942b7989ceae14f447bce', '24f5851abc6444e79be718325025126f', '2020-08-17 03:12:27', '', '1', '1f8c28a63676417c9c2d3194a158feb8', '00', '53dc21f8cc214c11a13ca57fa27f3146');
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
INSERT INTO `cibr_task_ask_prepare` VALUES ('276ff6636e814faf82b141c5c2e6f1e3', '24f5851abc6444e79be718325025126f', '2020-09-02 17:14:07', 'N', '2020-09-02 00:00:00', null, '', '2020-09-10 00:00:00', '1', '0', '2020-09-08 00:00:00', '', '2020-09-02 17:16:33', '24f5851abc6444e79be718325025126f', '6b49d0cbfb994137b8cd6612d075c9b8', 'e76f92403b8449d7bfc6d32d8ddee1e3', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('328f18fb380a4bf4aa8038e2dbd72221', '5646848a54754bbe833eba1c681cbe02', '2020-08-03 05:52:07', 'Y', '2020-08-03 16:00:00', '2020-08-06 16:00:00', 'sadfasdf', '2020-08-04 16:00:00', '3', '0', '2020-08-07 16:00:00', '', '2020-08-05 09:30:34', '29a9c57a44b94b869b58893356a8444b', 'c46c8414424f4c09bb5dc7a0e3929906', '6ef188e489c04ec4bde94ce830001aad', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('360afea1c1654f11805e9aed1f66f6b5', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:36', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '33', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '3333', '2020-08-06 08:38:38', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'e9505ddcc3884bbe9b85427f4f7244f8', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('428161d6a95748feb2e7874362836198', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:16', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:30', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', '8792766f9c2a4ba18cd7efaeba5790a4', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('731d8733a8904b21ac19bcde6e8fa8cf', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:12:40', 'Y', '2020-08-12 16:00:00', '2020-08-19 16:00:00', '萨达', '2020-08-26 16:00:00', '1', '0', '2020-08-30 16:00:00', '', '2020-08-06 10:12:50', '5646848a54754bbe833eba1c681cbe02', '7943476691744fed8ba40aa182be75eb', 'bd8cbb6fd90d461cb10e75669de38c49', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('86853143e2714d6f9840f30bb2f4e9f8', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:42', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '44', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '444', '2020-08-06 08:38:51', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'f11b0e199de04f9ab0ff27f534f92c58', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('9aed4413d02c414580cb875226deb2d2', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:27', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:36', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', 'c8498c747317477ebac49e3784df9a0c', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a767c2aa84d0463096f8dfc9d9cf66ab', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 09:59:26', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '从V型下次编程序', '2020-08-05 16:00:00', '1', '0', '2020-08-20 16:00:00', '', '2020-08-06 09:59:37', '5646848a54754bbe833eba1c681cbe02', 'a4680b1e35b8419db01494dd1318d96e', 'e3c5cc7ac0194f4980f76badeca3e3a9', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a8777b96cb6a47b69087292df18dcca6', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:31', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '22', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '222', '2020-08-06 08:39:00', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'b9690d93ae924c39b5435bcf217ec09a', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('b385cfb9832f4a09a65357076cdb7783', '24f5851abc6444e79be718325025126f', '2020-08-17 02:03:19', 'Y', '2020-08-16 16:00:00', '2020-08-17 16:00:00', '', '2020-08-16 16:00:00', '1', '0', '2020-08-17 16:00:00', '', '2020-08-17 02:24:00', '24f5851abc6444e79be718325025126f', '97d2daf442de4b05ba60c3aa38b4535f', '2ab13b67223144198711c1fb043700fe', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('c15e67c0775b404cae0ffe7644c0bbc5', '5646848a54754bbe833eba1c681cbe02', '2020-08-05 17:31:14', 'Y', '2020-08-05 17:31:14', '2020-08-05 17:31:14', '', '2020-08-19 16:00:00', '1', '0', '2020-08-05 16:00:00', '', '2020-08-06 08:01:16', '5646848a54754bbe833eba1c681cbe02', '4ce07456d6104e85ae808fb955b25c13', '128f2f7a93c24be5a8a25e6098ad8377', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('c4e2efb915ba4eeb837e53a0e44eec9e', '24f5851abc6444e79be718325025126f', '2020-09-02 17:03:28', 'Y', '2020-09-10 00:00:00', '2020-09-15 00:00:00', '', '2020-09-09 00:00:00', '1', '0', '2020-09-23 00:00:00', '', '2020-09-02 17:03:47', '24f5851abc6444e79be718325025126f', '4f1779e5cf2c4fb9959ce4670b7dc985', '2d2934fa96ef449297785ae4935b0919', '04');
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
INSERT INTO `cibr_task_detail_drosophila` VALUES ('0', 'a4680b1e35b8419db01494dd1318d96e', '2020-08-17 09:45:19', '2020-08-17 09:45:19', '', 'b9e7d8e5fscc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('03b99457017b41dda8569121ef4f4971', 'a965c30a8db14018922ee7cd04d93713', '2020-08-17 03:23:25', '2020-09-02 16:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 's', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('076745b8f26a4ee5aee5d59288966e68', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5weqf5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'N', '', 'N', '', '2', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('128f2f7a93c24be5a8a25e6098ad8377', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8eewrea0d3727', null, 'asdf', 'Y', 'male', 'Y', '94faab0f15174c43b815ds1b62fcd', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('16e6315d3a044e80b72ec5d7e82aa8d9', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5asdf7cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2ab13b67223144198711c1fb043700fe', '97d2daf442de4b05ba60c3aa38b4535f', '2020-08-11 03:16:21', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2d2934fa96ef449297785ae4935b0919', '4f1779e5cf2c4fb9959ce4670b7dc985', '2020-09-02 17:03:14', '2020-09-25 00:00:00', null, '2eadac9568e1477ebff2c12fae2f067e', null, '萨芬的', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4d373970d8e54f0eaef8201ad5d87c70', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4e32733c6afd463ea7869a39960c93f4', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', 'c22a901311684a0296f760db82b98', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('54d7d40ab9c547bcb362d3854a8d88c0', '2e70ad94a5884116b3fd26aa3138a095', '2020-08-17 03:07:52', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('54fb3ff0c3ce409db31a5e321a320384', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8e5fscc5ea0d3727', null, 's', 'Y', 'male', 'N', '', 'N', '', '2', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('5f03c6434e6b4d15b98a019cad8adb95', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8eewrea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('610977008802465d9cd922fe759be926', '9c781839091d4b30953fc6d25a77b5cc', '2020-08-17 03:07:01', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6279629a9354445d9fb178446519f53f', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5fscc5ea0d3727', null, 'asdf', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6ef188e489c04ec4bde94ce830001aad', 'c46c8414424f4c09bb5dc7a0e3929906', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdfasdf', 'N', 'female', 'Y', '94faab0f15174c43bsdceba1b62fcd', 'Y', 'asdf', '1', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('73b8a4b252de46479709b9c09021fe45', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8eewrea0d3727', null, 'asdfaf', 'Y', 'male', 'N', '', 'N', '', '0', '123', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7aad4ddd43a6496fa3cf2bc59b161c8c', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', '94faab0f15174c43bdsdceba1b62fcd', 'Y', '特殊sss', '1', '3', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7beff4abb7ab4d6e95020fc29d025535', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:42', '2020-08-22 00:00:00', null, 'b9e7d8e5asdf7cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86a00acb524a4fa996d9e3805ce0bc29', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'N', '', 'N', '', '2', '2', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86d5c6722f8f4abaa1b89ec261075580', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '2020-08-11 03:18:25', '2020-08-25 16:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8792766f9c2a4ba18cd7efaeba5790a4', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e5fq5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '3', '32', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('885f68678df6483285a85b69c3e95c43', '4f9633aaa4634981a496ff9a1be89562', '2020-09-02 17:02:10', '2020-09-18 00:00:00', null, '25d94157865b49a5ae749d7e48a7142b', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8b43983262ad4ec5abde02c8db98e744', '9aeea58cf85146959dccf540259c72d4', '2020-08-11 03:13:56', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('958df693b5df47f9a4ac1d214c08e732', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7adf672a3737cc5ea0d3727', null, 'sad', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('9b1d9d532a654f75a8bfc7d17f932db7', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5ds5ea0d3727', null, 'sadf', 'Y', 'male', 'N', '', 'N', '', '0', '23', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a08206be36634d61911c4ce8d063dae3', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a9b0bba5640e4de0aa2f1f67b67707b6', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '1', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b1f238edc4ae425793164f5392ccb93d', '9725728474a64cb58f47ad4fd5a71341', '2020-08-21 07:09:07', '2020-09-04 16:00:00', null, 'b9e7d8e5fq5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '1', '1', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b3e6cbc9850548e2bae593df41e9ec71', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '0', '3', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b9690d93ae924c39b5435bcf217ec09a', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sdaf', 'Y', 'male', 'N', '', 'N', '', '0', '132', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bbaea521ab0b4db2a4cc281a19513f42', '05567077ecfd4db2b29c379487bd760a', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdf', 'Y', 'female', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bc21068ffee24109a522f237ace4f8f9', 'ddd48327bf3942b7989ceae14f447bce', '2020-08-17 03:12:27', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bd8cbb6fd90d461cb10e75669de38c49', '7943476691744fed8ba40aa182be75eb', '2020-08-07 16:34:46', '2020-08-22 00:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('c8498c747317477ebac49e3784df9a0c', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:44', '2020-08-22 00:00:00', null, 'b9e7d8e5ds5ea0d3727', null, '阿萨德饭是', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('dbedd59ab60a4d78b582ec6efe160a05', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7adf672a3737cc5ea0d3727', null, 's', 'Y', 'male', 'Y', '94faab0f15174c4adeba1b62fcd', 'Y', 'xcvzxcv', '3', '4', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ddf1cec7c4e64f8fab4ae6ae3d9d8c4f', '428580b8b28b414397f044e0d2e19ca4', '2020-08-11 03:14:12', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('e76f92403b8449d7bfc6d32d8ddee1e3', '6b49d0cbfb994137b8cd6612d075c9b8', '2020-09-02 17:13:56', '2020-09-24 00:00:00', null, '25d94157865b49a5ae749d7e48a7142b', null, '暗室逢灯', 'Y', 'male', 'N', '', 'N', '', '0', '3', '01');
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
INSERT INTO `cibr_task_fail` VALUES ('d7d6ed35a8e24660bbf3cf1b6f861aec', '14f73010e70e49979ba42b1b0e99f730', '24f5851abc6444e79be718325025126f', '2020-09-02 16:30:15', '地方撒撒地方', '对对对');
INSERT INTO `cibr_task_fail` VALUES ('e62ed178501748a08bce69d85853f1ad', '885f68678df6483285a85b69c3e95c43', '24f5851abc6444e79be718325025126f', '2020-09-02 17:02:39', '阿斯顿发', null);

-- ----------------------------
-- Table structure for cibr_task_partner
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_partner`;
CREATE TABLE `cibr_task_partner` (
  `id` varchar(32) NOT NULL,
  `taskId` varchar(32) DEFAULT NULL,
  `recordId` varchar(1000) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(1000) DEFAULT NULL,
  `taskstatu` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_partner
-- ----------------------------
INSERT INTO `cibr_task_partner` VALUES ('14f73010e70e49979ba42b1b0e99f730', '14f73010e70e49979ba42b1b0e99f730', 'c9d08aa656c644e5ae8d53cc9b213cde##859b23674b724ec18563d801994817b9##', '24f5851abc6444e79be718325025126f', '2020-09-02 15:26:00', '对对对', '02');
INSERT INTO `cibr_task_partner` VALUES ('547ac98d3a3e45b79a4ab04a47344e2a', '547ac98d3a3e45b79a4ab04a47344e2a', 'e0a979744a6049e4b60bfb64bc62d393##a4c2fae05df94612a20c2bb15fb21854##', '24f5851abc6444e79be718325025126f', '2020-09-02 16:44:49', '自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00', '01');

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
  `sampleType` varchar(255) DEFAULT NULL COMMENT '01 核酸  02 组织  03 细胞',
  `sampleInput` varchar(32) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
INSERT INTO `cibr_task_process` VALUES ('f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', '24f5851abc6444e79be718325025126f', '2020-08-31 15:52:37', '20', 'asdf', 'asdf', '24f5851abc6444e79be718325025126f', '01##03##02', null, '2020-09-01 16:54:50', '24f5851abc6444e79be718325025126f', null, '24f5851abc6444e79be718325025126f', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '全都有');

-- ----------------------------
-- Table structure for cibr_task_process_analysis
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_analysis`;
CREATE TABLE `cibr_task_process_analysis` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_analysis
-- ----------------------------
INSERT INTO `cibr_task_process_analysis` VALUES ('19c7b376c6774415a9629e1a777e2cf8', 'dd6411c7ae3c4b738090d439a21bcae5', '9eac5d9394494a30afc0ee2e0fecd124', 'fa', 'sdfa', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('1a9d748ba8134a7d926e99a6354fe5d6', 'dd6411c7ae3c4b738090d439a21bcae5', '0d33c8c9d07c48b4ba97d077fc8354e7', 'fasdfas', 'sdfasd', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('1c8d91f27b934ba08cb54d94db7b228f', 'dd6411c7ae3c4b738090d439a21bcae5', 'fd4ab6c66cfd44ea842bea92b49251ca', 'asdf', 'asdf', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('1f06b8d3aea1447aaae34bfd08dcc6e6', 'dd6411c7ae3c4b738090d439a21bcae5', '7e7cbd61c7e74042bc0279b55842a649', 'asdf', 'sdf', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('2687814d7a214c2cacfae58909f80f5f', '76c1e3e58ad14ab491540ee0bfb20099', '8eb9e7ec929a42ce9051e9e33db01418', '水电费从', '阿斯顿', null, null, null, null, null, '00', '24f5851abc6444e79be718325025126f', '2020-08-28 14:43:55', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('9674e2879ae644fd9a5e6f068b2ff8f6', 'dd6411c7ae3c4b738090d439a21bcae5', 'b0e5d1f54b354cf1a759c6506d818040', 'sadfasdf', 'adsf', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('a0aa2e771926464989c6f5b54434b4bb', 'dd6411c7ae3c4b738090d439a21bcae5', '90fedd8a02e14f388ecc0eba7c966114', 'asdf', 'sdfa', null, null, null, null, null, '02', '24f5851abc6444e79be718325025126f', '2020-08-27 05:41:18', null);
INSERT INTO `cibr_task_process_analysis` VALUES ('fb5265123bd54cbf8b3307028821457c', '55f357c5a4094e968a78910eb7f74f32', 'c664eabcda9d4662bc6bef3735573954', 'asdfa', 'wesdfa', null, null, null, null, null, '00', '24f5851abc6444e79be718325025126f', '2020-08-28 14:39:47', null);

-- ----------------------------
-- Table structure for cibr_task_process_dismountdata
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_dismountdata`;
CREATE TABLE `cibr_task_process_dismountdata` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `makeId` varchar(32) DEFAULT NULL,
  `sampleIndex` varchar(255) DEFAULT NULL,
  `sampleName` varchar(255) DEFAULT NULL,
  `dateAccount` varchar(255) DEFAULT NULL,
  `datePassword` varchar(255) DEFAULT NULL,
  `datePath` varchar(255) DEFAULT NULL,
  `sequencingplatform` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `currentStatu` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` varchar(32) DEFAULT NULL,
  `rowIndex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_dismountdata
-- ----------------------------
INSERT INTO `cibr_task_process_dismountdata` VALUES ('0d33c8c9d07c48b4ba97d077fc8354e7', 'dd6411c7ae3c4b738090d439a21bcae5', 'd035ba34d2384c9cbb4250c58415e005', 'sdfasd', 'fasdfas', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '5');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('7e7cbd61c7e74042bc0279b55842a649', 'dd6411c7ae3c4b738090d439a21bcae5', '1c94930a260d43a0a5079153e0f1476a', 'sdf', 'asdf', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '7');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('8eb9e7ec929a42ce9051e9e33db01418', '76c1e3e58ad14ab491540ee0bfb20099', '3ccd74fc4d04430e93ecfa2395c1d562', '阿斯顿', '水电费从', '富士达', '地方', null, 'sdf', '多福多寿', '02', '2020-08-28 14:43:55', '24f5851abc6444e79be718325025126f', '0');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('90fedd8a02e14f388ecc0eba7c966114', 'dd6411c7ae3c4b738090d439a21bcae5', '44c247e00f84423cad909d699dc449f3', 'sdfa', 'asdf', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '3');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('9eac5d9394494a30afc0ee2e0fecd124', 'dd6411c7ae3c4b738090d439a21bcae5', 'e2759ac516a54fe4aef3b1b3c5ab9613', 'sdfa', 'fa', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '1');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('b0e5d1f54b354cf1a759c6506d818040', 'dd6411c7ae3c4b738090d439a21bcae5', '2503944e1b0a4662800ffba42c795107', 'adsf', 'sadfasdf', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '6');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('c664eabcda9d4662bc6bef3735573954', '55f357c5a4094e968a78910eb7f74f32', '015376c3684e44c6a34074f184e50fc8', 'wesdfa', 'asdfa', 'fds', 'fd', 'fd', 'fd', '实时', '02', '2020-08-28 14:39:47', '24f5851abc6444e79be718325025126f', '0');
INSERT INTO `cibr_task_process_dismountdata` VALUES ('fd4ab6c66cfd44ea842bea92b49251ca', 'dd6411c7ae3c4b738090d439a21bcae5', 'ab078b62e251409a9c2d48414d12e727', 'asdf', 'asdf', null, null, null, null, null, '02', '2020-08-27 04:57:18', '24f5851abc6444e79be718325025126f', '8');

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
INSERT INTO `cibr_task_process_email` VALUES ('55f357c5a4094e968a78910eb7f74f32', 'zhouhan@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('563b8462219a48279a0c97256ed94a4e', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('76c1e3e58ad14ab491540ee0bfb20099', 'zhouhan@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('8531d260f45e44ce9fd4b46e3081e1b0', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('8531d260f45e44ce9fd4b46e3081e1b0', 'zhouhan@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('a5c874a970374966a798943cc731ea85', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('ce598c12f521413fa5d644cfb2fad17f', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('dd6411c7ae3c4b738090d439a21bcae5', 'fengshuangshuang@cibr.ac.cn');
INSERT INTO `cibr_task_process_email` VALUES ('f140fa4241804d72adf0305d82479487', 'fengshuangshuang@cibr.ac.cn');

-- ----------------------------
-- Table structure for cibr_task_process_library
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_library`;
CREATE TABLE `cibr_task_process_library` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_library
-- ----------------------------
INSERT INTO `cibr_task_process_library` VALUES ('015376c3684e44c6a34074f184e50fc8', '55f357c5a4094e968a78910eb7f74f32', null, '2020-08-21 14:34:18', 'wesdfa', null, 'asdfa', 'fas', '0', '0', 'sdf', '1', '1', 'sd', 'dsf', '1', 'fd', 'as', '24f5851abc6444e79be718325025126f', '24f5851abc6444e79be718325025126f', 'afsd', '1', 'asdf', '1', '发送到', 'fsd', 'fasd', null, null, '2020-08-28 14:39:21', '24f5851abc6444e79be718325025126f', '0', '02');
INSERT INTO `cibr_task_process_library` VALUES ('1c94930a260d43a0a5079153e0f1476a', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-12 07:52:12', 'sdf', null, 'asdf', 'sadfasdf', '1', '1', 'asdf', '1', '132', 'sadfsd', 'fasdf', '123', '23rf', 'fff', '24f5851abc6444e79be718325025126f', '53dc21f8cc214c11a13ca57fa27f3146', 'fsd', '23', 'sdfafa', '1243', '23', '243', '234', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '7', '02');
INSERT INTO `cibr_task_process_library` VALUES ('2503944e1b0a4662800ffba42c795107', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-04 07:52:25', 'adsf', null, 'sadfasdf', 'asdfasd', '1', '1', 'dsfa', '132', '123', 'dvsv', 'svdv', '23', 'sdv', 'sd', '24f5851abc6444e79be718325025126f', '53dc21f8cc214c11a13ca57fa27f3146', '2f', '1', '2342', '433', '23424', '3234', '243', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '6', '02');
INSERT INTO `cibr_task_process_library` VALUES ('3ccd74fc4d04430e93ecfa2395c1d562', '76c1e3e58ad14ab491540ee0bfb20099', null, '2020-08-13 14:42:38', '阿斯顿', null, '水电费从', 'd', '0', '0', '士大夫', '2', '2', 'sdf', 'sfd', '1', 'fd', '大师傅', '53dc21f8cc214c11a13ca57fa27f3146', '24f5851abc6444e79be718325025126f', '阿斯顿发', '1', '地方a', '1', '阿斯顿发斯蒂芬', '发送', '阿斯顿发', null, null, '2020-08-28 14:43:27', '24f5851abc6444e79be718325025126f', '0', '02');
INSERT INTO `cibr_task_process_library` VALUES ('44c247e00f84423cad909d699dc449f3', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-19 07:52:51', 'sdfa', null, 'asdf', 'sdfa', '2', '2', 'sdfa', '2', '2342', '34243', '243', '235', '234234', '234', '24f5851abc6444e79be718325025126f', '53dc21f8cc214c11a13ca57fa27f3146', '234', '235', '24', '1', '42', '234', '243', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '3', '02');
INSERT INTO `cibr_task_process_library` VALUES ('ab078b62e251409a9c2d48414d12e727', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-05 07:50:34', 'asdf', null, 'asdf', 'sad', '2', '2', 'asdf', '5', '2', 'asd', 'sdfasd', '1', 'asd', 'asdfsa', '24f5851abc6444e79be718325025126f', '24f5851abc6444e79be718325025126f', 'asdfas', '2', 'asd', '1', 'sadf', 'asd', 'asd', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '8', '02');
INSERT INTO `cibr_task_process_library` VALUES ('d035ba34d2384c9cbb4250c58415e005', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-12 07:52:39', 'sdfasd', null, 'fasdfas', 'dfasdf', '2', '2', 'sdf', '1', '123', 'asdf', '2323', '435', '234', '234', '24f5851abc6444e79be718325025126f', '24f5851abc6444e79be718325025126f', '242', '342', '242', '424', '24', '24', '424', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '5', '02');
INSERT INTO `cibr_task_process_library` VALUES ('e2759ac516a54fe4aef3b1b3c5ab9613', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2020-08-19 07:53:04', 'sdfa', null, 'fa', 'sdf', '1', '2', 'dsfasdf', '1', '234', '234', '234', '243', '243', '34243', '24f5851abc6444e79be718325025126f', '53dc21f8cc214c11a13ca57fa27f3146', '234', '243', '234', '1', '342', '234', '243', null, null, '2020-08-26 03:33:37', '24f5851abc6444e79be718325025126f', '1', '02');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_sampleinput
-- ----------------------------
INSERT INTO `cibr_task_process_sampleinput` VALUES ('0485e9f61a3a490f9791af5b05662ce6', 'f140fa4241804d72adf0305d82479487', null, null, '8.0', null, null, '撒旦法', '30大大', '', '40', null, null, '10.0', '11.0', '12.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '7');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('15ec702f69dc42c886326d755ac8c9b1', 'a5c874a970374966a798943cc731ea85', null, null, '6.0', null, null, '撒旦法', '28大大', '25', '20', '6.0', '7.0', null, null, null, null, null, '32', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '5');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('2a0f0be8bc1e4aafb139d8c6d495e59c', 'f140fa4241804d72adf0305d82479487', null, null, '7.0', null, null, '撒旦法', '29大大', '', '40', null, null, '9.0', '10.0', '11.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '6');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('2c767d8ce12a491bb9b49e9295a7be41', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '9.0', null, null, '撒旦法', '31大大', '00', '00', null, null, '11.0', '12.0', '13.0', null, null, '07', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '8');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('31b613ced74a47aeb8f6ef830d900d08', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '1.0', null, null, '撒旦法', '23大大', '02', '03', null, null, '3.0', '4.0', '5.0', null, null, '01', '01', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '09', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('386b5ac45a0a4ca1925d2cfcf1884567', 'a5c874a970374966a798943cc731ea85', null, null, '1.0', null, null, '撒旦法', '23大大', '21', '22', '1.0', '2.0', null, null, null, null, null, '27', '01', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('41f94cd576004c9c809e9d49e06949be', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '7.0', null, null, '撒旦法', '29大大', '00', '00', null, null, '9.0', '10.0', '11.0', null, null, '07', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '6');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('44fdda79cca149b8ac73f892240e2873', 'a5c874a970374966a798943cc731ea85', null, null, '2.0', null, null, '撒旦法', '24大大', '22', '22', '2.0', '3.0', null, null, null, null, null, '28', '02', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '1');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('53927e0bf14d45d2a275817ebd25bb09', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '5.0', null, null, '撒旦法', '27大大', '05', '05', null, null, '7.0', '8.0', '9.0', null, null, '05', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '09', '4');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('53a363f1dd8541c7bc0abf0bf3dcb161', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '4.0', null, null, '撒旦法', '26大大', '', null, null, null, '6.0', '7.0', '8.0', 'dd', '04', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '3');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('59e136f6da884659a499b0ce20db11e4', 'a5c874a970374966a798943cc731ea85', null, null, '3.0', null, null, '撒旦法', '25大大', '22', '22', '3.0', '4.0', null, null, null, null, null, '29', '03', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '2');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('5b71f8125359498d9572ec258276427b', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '1.0', null, null, '撒旦法', '23大大', '', null, null, null, '3.0', '4.0', '5.0', 'dd', '01', null, '01', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('60c8a3faf61e4d95ba7c58e2effcd465', 'f140fa4241804d72adf0305d82479487', null, null, '4.0', null, null, '撒旦法', '26大大', '', null, null, null, '6.0', '7.0', '8.0', 'dd', '04', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '3');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('63277235543447098ae1f038c2efff38', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '5.0', null, null, '撒旦法', '27大大', '', null, null, null, '7.0', '8.0', '9.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '4');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('6a1d1d9d63164f0f923b58f6588f9f6f', 'a5c874a970374966a798943cc731ea85', null, null, '7.0', null, null, '撒旦法', '29大大', '20', '20', '7.0', '8.0', null, null, null, null, null, '33', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '6');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('6fdcd303d95741598a13e34557a24184', '55f357c5a4094e968a78910eb7f74f32', null, null, 'asdfa', null, null, 'fas', 'fas', '21', '22', '1', '1', '0', '0', '0', '', '', '22', '01', '', '24f5851abc6444e79be718325025126f', '2020-08-28 05:33:59', '02', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('707742cb914544d1929ae8dffd11aee5', 'f140fa4241804d72adf0305d82479487', null, null, '9.0', null, null, '撒旦法', '31大大', '', '40', null, null, '11.0', '12.0', '13.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '8');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('775a98067bb34a42848a731cd630a78f', 'a5c874a970374966a798943cc731ea85', null, null, '9.0', null, null, '撒旦法', '31大大', '20', '20', '9.0', '10.0', null, null, null, null, null, '33', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '8');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('78992746fd544342885994e01c9b83fa', 'a5c874a970374966a798943cc731ea85', null, null, '4.0', null, null, '撒旦法', '26大大', '22', '23', '4.0', '5.0', null, null, null, null, null, '30', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '3');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('7939e933015f4612bd64964c42cc6dad', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '2.0', null, null, '撒旦法', '24大大', '02', '02', null, null, '4.0', '5.0', '6.0', null, null, '02', '02', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '1');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('7c3ffcead0eb40df8ba67ff6e604702b', 'f140fa4241804d72adf0305d82479487', null, '阿斯顿', '3.0', '03', '阿斯顿', '撒旦法', '25大大', '', null, null, null, '5.0', '6.0', '7.0', 'dd', '03', null, '03', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '2');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('8463e73b1f214bd6bf9977c58eee6a1c', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '8.0', null, null, '撒旦法', '30大大', '00', '00', null, null, '10.0', '11.0', '12.0', null, null, '07', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '7');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('88a9cbdd92504f14b797158aa475f803', 'f140fa4241804d72adf0305d82479487', null, null, '6.0', null, null, '撒旦法', '28大大', '', '40', null, null, '8.0', '9.0', '10.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '5');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('896d3f63823b465c81a2e7fbafb09461', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '3.0', null, null, '撒旦法', '25大大', '03', '03', null, null, '5.0', '6.0', '7.0', null, null, '03', '03', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '09', '2');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('8fe4ecc134f34e6aabd3cd717964d572', 'a5c874a970374966a798943cc731ea85', null, null, '8.0', null, null, '撒旦法', '30大大', '20', '20', '8.0', '9.0', null, null, null, null, null, '33', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '7');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('943fc1bd3f1943ff9a9820434ea9ae1b', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '3.0', null, null, '撒旦法', '25大大', '', null, null, null, '5.0', '6.0', '7.0', 'dd', '03', null, '03', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '2');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('97963de7eae8426eb23ccc56d629b9aa', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '6.0', null, null, '撒旦法', '28大大', '', '40', null, null, '8.0', '9.0', '10.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '5');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('a5082924928043aa87f2acb04affb545', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '2.0', null, null, '撒旦法', '24大大', '', null, null, null, '4.0', '5.0', '6.0', 'dd', '02', null, '02', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '1');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('aa37203a741448e1a18c862b87e1965d', '76c1e3e58ad14ab491540ee0bfb20099', null, null, '水电费从', null, null, 'd', '是', '23', '22', '0', '0', '0', '0', '0', '', '', '22', '02', '士大夫', '24f5851abc6444e79be718325025126f', '2020-08-28 14:42:02', '02', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('ab80c5ef27d749ef8238e1321a7adf41', 'f140fa4241804d72adf0305d82479487', null, '阿斯顿发', '1.0', '01', '撒旦法', '撒旦法', '23大大', '22', '22', '2', '0', '3.0', '4.0', '5.0', 'dd', '01', '22', '01', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('b5131da9bfd94b138ff4e506e03b9bb2', 'f140fa4241804d72adf0305d82479487', null, '阿斯顿发', '2.0', '02', '撒旦法', '撒旦法', '24大大', '', null, null, null, '4.0', '5.0', '6.0', 'dd', '02', null, '02', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '1');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('c3e4b36d1344467e84e4bda9636c31ac', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '9.0', null, null, '撒旦法', '31大大', '', '40', null, null, '11.0', '12.0', '13.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '8');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('e109846c85354755a7fe5b4121c83bde', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '7.0', null, null, '撒旦法', '29大大', '', '40', null, null, '9.0', '10.0', '11.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '6');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('e6675b7161e743be929d1927f9f820fb', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '4.0', null, null, '撒旦法', '26大大', '04', '04', null, null, '6.0', '7.0', '8.0', null, null, '04', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '3');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('e7246159aca14d81b54e75e2daca5c4d', 'f140fa4241804d72adf0305d82479487', null, null, '5.0', null, null, '撒旦法', '27大大', '', null, null, null, '7.0', '8.0', '9.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-31 16:44:40', '01', '4');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('e7f68989f6014c46b592682b7deb5db8', 'a5c874a970374966a798943cc731ea85', null, null, '5.0', null, null, '撒旦法', '27大大', '23', '23', '5.0', '6.0', null, null, null, null, null, '31', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:08:30', '02', '4');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('ebc6caaa29014ba9a1cb8ec1e48c57d1', 'dd6411c7ae3c4b738090d439a21bcae5', null, null, '6.0', null, null, '撒旦法', '28大大', '06', '00', null, null, '8.0', '9.0', '10.0', null, null, '06', '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 13:38:36', '02', '5');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('f1c082a6364c4c4399ab30a213986db7', 'ce598c12f521413fa5d644cfb2fad17f', null, null, '8.0', null, null, '撒旦法', '30大大', '', '40', null, null, '10.0', '11.0', '12.0', 'dd', '05', null, '00', '', '24f5851abc6444e79be718325025126f', '2020-08-20 08:40:50', '02', '7');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_samplemake
-- ----------------------------
INSERT INTO `cibr_task_process_samplemake` VALUES ('04075f8c9f1a4a36bfb011d7fd2b2048', 'f140fa4241804d72adf0305d82479487', null, 'ab80c5ef27d749ef8238e1321a7adf41', '1.0', null, '', '撒旦法', '23大大', '2020-09-01 16:54:50', '3.0', '4.0', '5.0', 'dd', '01', null, '', '', '', '', '22', '01', '', '', null, null, '00', '0', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('0eb2d3a23b9342599bfd25ffd5869547', '76c1e3e58ad14ab491540ee0bfb20099', null, 'aa37203a741448e1a18c862b87e1965d', '水电费从', '放到', '阿斯顿', 'd', '是', '2020-08-28 14:42:02', '0', '0', '0', '', '', '02', '01', '', '24f5851abc6444e79be718325025126f', '53dc21f8cc214c11a13ca57fa27f3146', '22', '02', 'sdf', 'das', '2020-08-28 14:42:30', '24f5851abc6444e79be718325025126f', '02', '0', '2020-08-28 14:42:34', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('0f315314bcb540afb8e485e628c8a950', 'dd6411c7ae3c4b738090d439a21bcae5', null, '8463e73b1f214bd6bf9977c58eee6a1c', '8.0', null, '', '撒旦法', '30大大', '2020-08-21 06:47:33', '10.0', '11.0', '12.0', null, null, null, '', '', '', '', '07', '00', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '7', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('16cc977e2a1844babf5c4d923f70cd0e', 'f140fa4241804d72adf0305d82479487', null, '2a0f0be8bc1e4aafb139d8c6d495e59c', '7.0', null, '', '撒旦法', '29大大', '2020-09-01 16:54:50', '9.0', '10.0', '11.0', 'dd', '05', null, '', '', '', '', null, '00', '', '', null, null, '00', '6', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('251dc749cf414c57a53329fe1ed8ec5e', 'dd6411c7ae3c4b738090d439a21bcae5', null, '2c767d8ce12a491bb9b49e9295a7be41', '9.0', null, '', '撒旦法', '31大大', '2020-08-21 06:47:33', '11.0', '12.0', '13.0', null, null, null, '', '', '', '', '07', '00', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '8', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('3d4a71b07dd64045bd665abe22473a7e', 'f140fa4241804d72adf0305d82479487', null, '7c3ffcead0eb40df8ba67ff6e604702b', '3.0', null, '', '撒旦法', '25大大', '2020-09-01 16:54:50', '5.0', '6.0', '7.0', 'dd', '03', null, '', '', '', '', null, '03', '', '', null, null, '00', '2', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('4b0a727937bc4c85906f64ce549672b6', 'f140fa4241804d72adf0305d82479487', null, '707742cb914544d1929ae8dffd11aee5', '9.0', null, '', '撒旦法', '31大大', '2020-09-01 16:54:50', '11.0', '12.0', '13.0', 'dd', '05', null, '', '', '', '', null, '00', '', '', null, null, '00', '8', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('557a43f98e46451ab66c75cded42d777', 'dd6411c7ae3c4b738090d439a21bcae5', null, '41f94cd576004c9c809e9d49e06949be', '7.0', null, '', '撒旦法', '29大大', '2020-08-21 06:47:33', '9.0', '10.0', '11.0', null, null, null, '', '', '', '', '07', '00', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '6', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('60a699d956cd4ae385dbe1af4f7be23e', 'f140fa4241804d72adf0305d82479487', null, 'b5131da9bfd94b138ff4e506e03b9bb2', '2.0', null, '', '撒旦法', '24大大', '2020-09-01 16:54:50', '4.0', '5.0', '6.0', 'dd', '02', null, '', '', '', '', null, '02', '', '', null, null, '00', '1', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('63795e142e364789ae6fed92f30daa9b', 'dd6411c7ae3c4b738090d439a21bcae5', null, '7939e933015f4612bd64964c42cc6dad', '2.0', null, '', '撒旦法', '24大大', '2020-08-21 06:47:33', '4.0', '5.0', '6.0', null, null, null, '', '', '', '', '02', '02', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '1', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('64e4c96c45134cbaa181a6b4b8743a6b', 'dd6411c7ae3c4b738090d439a21bcae5', null, 'e6675b7161e743be929d1927f9f820fb', '4.0', null, '', '撒旦法', '26大大', '2020-08-21 06:47:33', '6.0', '7.0', '8.0', null, null, null, '', '', '', '', '04', '00', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '3', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('7576206cd1e34b4fa87497328766a5e1', 'f140fa4241804d72adf0305d82479487', null, '0485e9f61a3a490f9791af5b05662ce6', '8.0', null, '', '撒旦法', '30大大', '2020-09-01 16:54:50', '10.0', '11.0', '12.0', 'dd', '05', null, '', '', '', '', null, '00', '', '', null, null, '00', '7', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('9632fb14f94e4014a71517fc3cf09213', 'dd6411c7ae3c4b738090d439a21bcae5', null, 'ebc6caaa29014ba9a1cb8ec1e48c57d1', '6.0', null, '', '撒旦法', '28大大', '2020-08-21 06:47:33', '8.0', '9.0', '10.0', null, null, null, '', '', '', '', '06', '00', '', '', '2020-08-24 09:19:02', '24f5851abc6444e79be718325025126f', '01', '5', '2020-08-21 08:37:42', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_task_process_samplemake` VALUES ('a8ea8455f0a5448b958a88a3abd1e726', 'f140fa4241804d72adf0305d82479487', null, '88a9cbdd92504f14b797158aa475f803', '6.0', null, '', '撒旦法', '28大大', '2020-09-01 16:54:50', '8.0', '9.0', '10.0', 'dd', '05', null, '', '', '', '', null, '00', '', '', null, null, '00', '5', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('c50bc331161345b0a62151f4a69c6f50', 'f140fa4241804d72adf0305d82479487', null, '60c8a3faf61e4d95ba7c58e2effcd465', '4.0', null, '', '撒旦法', '26大大', '2020-09-01 16:54:50', '6.0', '7.0', '8.0', 'dd', '04', null, '', '', '', '', null, '00', '', '', null, null, '00', '3', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('c5573d032cce436497251957c2fe6227', 'f140fa4241804d72adf0305d82479487', null, 'e7246159aca14d81b54e75e2daca5c4d', '5.0', null, '', '撒旦法', '27大大', '2020-09-01 16:54:50', '7.0', '8.0', '9.0', 'dd', '05', null, '', '', '', '', null, '00', '', '', null, null, '00', '4', null, null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('f84035615cd643bcb83c68c77648cc50', '55f357c5a4094e968a78910eb7f74f32', null, '6fdcd303d95741598a13e34557a24184', 'asdfa', null, '', 'fas', 'fas', '2020-08-28 05:35:40', '0', '0', '0', '', '', null, '', '', '', '', '22', '01', '', '', '2020-08-28 14:32:06', '24f5851abc6444e79be718325025126f', '02', '0', '2020-08-28 14:32:09', '24f5851abc6444e79be718325025126f');

-- ----------------------------
-- Table structure for cibr_task_process_subtask
-- ----------------------------
DROP TABLE IF EXISTS `cibr_task_process_subtask`;
CREATE TABLE `cibr_task_process_subtask` (
  `id` varchar(32) NOT NULL,
  `processId` varchar(32) DEFAULT NULL,
  `taskId` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `currentStatu` varchar(255) DEFAULT NULL,
  `creater` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(1000) DEFAULT NULL,
  `preId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_subtask
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-09-15 21:46:53
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
  `selfIndex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_animal_drosophila
-- ----------------------------
INSERT INTO `cibr_animal_drosophila` VALUES ('0252cd06eb5243a68588838ebba0ef71', '果蝇', 'D.Yak', 'Drosophila yakuba (Dyak\\wild-type)', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00004');
INSERT INTO `cibr_animal_drosophila` VALUES ('0433c90e8c63498abcc84a13eb7da715', '果蝇', 'VDRC100319', 'CG13540', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00034');
INSERT INTO `cibr_animal_drosophila` VALUES ('0b2b7d1cd2154bdab146a5c7804b17f3', '果蝇', '31882-attp-rfp', 'w* ；CG31882-ATTP-RFP', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00045');
INSERT INTO `cibr_animal_drosophila` VALUES ('0c2942143d06420886d25c4eb2db02b5', '果蝇', '71814.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT044166-GAL4.DBD}attP2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00027');
INSERT INTO `cibr_animal_drosophila` VALUES ('15c0c9c15ce442cb9c78dbaff891cc5a', '果蝇', '野生型', 'Drosophila （CF melanogaster 内蒙古赤峰 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00015');
INSERT INTO `cibr_animal_drosophila` VALUES ('1a5bb151869d4f74bfd47e9576a921d0', '果蝇', 'tm2/tm6b', 'tm2/tm6b', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00018');
INSERT INTO `cibr_animal_drosophila` VALUES ('1b80b613b7a44d42a95c41ca397cc1aa', '果蝇', 'willistoni', 'willistoni', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00039');
INSERT INTO `cibr_animal_drosophila` VALUES ('244b57ea66944c36af5fcb1f9f6911bd', '果蝇', '65402.0', 'P{w[+mC]=UAS-Stinger}2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00008');
INSERT INTO `cibr_animal_drosophila` VALUES ('24d762359a974db3a5db10267f6c6c82', '果蝇', 'Phic-31', 'Phic-31', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00001');
INSERT INTO `cibr_animal_drosophila` VALUES ('29486b5bafad4d1980b92bd53f33c0dd', '果蝇', 'B # 5138', 'y[1] w[*]; P{w[+mC]=tubP-GAL4}LL7/TM3, Sb[1] Ser[1]', 'bloomington，张力老师要回来', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00011');
INSERT INTO `cibr_animal_drosophila` VALUES ('3bec691fe4e34cbf8d800feab8ed2ecf', '果蝇', '野生型', 'Drosophila （BHS melanogaster 北京百花山 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00013');
INSERT INTO `cibr_animal_drosophila` VALUES ('3c65751d10d6447bb78d6a51a4ddf764', '果蝇', 'Bs51976', 'w[1118]; P{w[+mC]=Crz-GAL4.391}3M', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00021');
INSERT INTO `cibr_animal_drosophila` VALUES ('44e104516bd5435d91bd818e47b681d8', '果蝇', '野生型', 'Drosophila （BHS simulans 北京百花山 拟果蝇）红眼', '北大陆剑实验室', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00014');
INSERT INTO `cibr_animal_drosophila` VALUES ('460f665bc18c43628e80074c7e9fe338', '果蝇', '42218.0', 'w[1118]; P{w[+mC]=UAS-inaF-B.HA}3', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00026');
INSERT INTO `cibr_animal_drosophila` VALUES ('48ded1d90435424b85bea0f52a264ebd', '果蝇', 'Bs7457', 'y[1] w[*]; P{w[+mC]=Rh3-GAL4}2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00020');
INSERT INTO `cibr_animal_drosophila` VALUES ('49833384474c43a6a4252bbfee649982', '果蝇', '野生型', 'Drosophila （CF simulans 内蒙古赤峰 拟果蝇）红眼', '北大陆剑实验室', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00016');
INSERT INTO `cibr_animal_drosophila` VALUES ('4d132015d03c4a9a93fa2a55cc64a9d5', '果蝇', 'uas-gfp', 'uas-gfp', '', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00010');
INSERT INTO `cibr_animal_drosophila` VALUES ('4da63a0b3b894bc6b424b7ab324f5ca1', '果蝇', 'VDRC101598', 'CG30447', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00035');
INSERT INTO `cibr_animal_drosophila` VALUES ('5002ba504b7b41a99ea7125d3738df93', '果蝇', '71965.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT045774-GAL4.DBD}attP2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00024');
INSERT INTO `cibr_animal_drosophila` VALUES ('523b80c0842e4446bfcdc4a2740b343d', '果蝇', 'VDRC103313', 'CG32368', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00033');
INSERT INTO `cibr_animal_drosophila` VALUES ('5629511973ac4faab573031f59a22b42', '果蝇', '1361-attb-rfp', 'w* ；CG1361-ATTP-RFP', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00044');
INSERT INTO `cibr_animal_drosophila` VALUES ('730b3ff246454f0aa998470ac600a0b5', '果蝇', 'B # 4414', 'y[1] w[*]; P{w[+mC]=Act5C-GAL4}25FO1/CyO, y[+]', 'bloomington，张力老师要回来', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00009');
INSERT INTO `cibr_animal_drosophila` VALUES ('775bf476bb0a4d6099784236571f49dc', '果蝇', '48778.0', 'w[1118]; P{y[+t7.7] w[+mC]=GMR17F11-GAL4}attP2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00025');
INSERT INTO `cibr_animal_drosophila` VALUES ('8c88e6df2e964af19b4758b82e8fc41a', '果蝇', '32045.0', 'y[1] w[*] P{w[+mC]=His2Av[T:Avic\\GFP-S65T]}1 P{ry[+t7.2]=hsFLP}12 P{ry[+t7.2]=neoFRT}19A/FM7a', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00006');
INSERT INTO `cibr_animal_drosophila` VALUES ('9829f33efb0b425faf3b16443ea3d8fd', '果蝇', 'VDRC60000', 'w[1118]', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00037');
INSERT INTO `cibr_animal_drosophila` VALUES ('9b76b34d7bcf4df7a11469708b5eac6d', '果蝇', 'BC/cyo', 'BC/cyo', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00017');
INSERT INTO `cibr_animal_drosophila` VALUES ('9c2dc78ca651485381d176126f63ae9d', '果蝇', 'UAS-1361-RNAi-2 T2-1', 'w* ；P｛UAS-1361-RNAi-2｝attP40/Cyo', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00040');
INSERT INTO `cibr_animal_drosophila` VALUES ('a77d046d56944115a865a8fa9abfecba', '果蝇', 'VDRC106565', 'CG10852', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00032');
INSERT INTO `cibr_animal_drosophila` VALUES ('a7b009df30b3467a8ec019fb53efb799', '果蝇', '76709.0', 'y[1] w[*]; Mi{Trojan-GAL4.0}Haspin[MI09386-TG4.0]', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00023');
INSERT INTO `cibr_animal_drosophila` VALUES ('ad1143aa17a0468baf1e8f21416929fa', '果蝇', 'BL8860', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00029');
INSERT INTO `cibr_animal_drosophila` VALUES ('c1d2cb99c7ee4f74bfc01592ea4dfa71', '果蝇', 'BL25706', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]; P{w[+mC]=UAS-Dcr-2.D}2', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00030');
INSERT INTO `cibr_animal_drosophila` VALUES ('c8a1ace89381459fafbba3378a4138d6', '果蝇', 'BL24647', 'P{w[+mC]=UAS-Dcr-2.D}1; wg[Sp-1], P{w[-]=hs-hid.v2}2/CyO', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00031');
INSERT INTO `cibr_animal_drosophila` VALUES ('d362f99a980e4643806f425de6ce1ded', '果蝇', 'Bs47333', 'w[1118]; P{y[+t7.7] w[+mC]=GMR21B05-GAL4}attP2', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00022');
INSERT INTO `cibr_animal_drosophila` VALUES ('d4a757f1957f42dd9ac92656ae93ccc1', '果蝇', 'VDRC106728', 'CG4986', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00036');
INSERT INTO `cibr_animal_drosophila` VALUES ('d9dc43551b3e42ce899df6880052d3b1', '果蝇', 'bcf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00003');
INSERT INTO `cibr_animal_drosophila` VALUES ('dbb57a5af7de4656af76d6d995a8d821', '果蝇', 'Bs8765', 'P{w[+mC]=GAL4-elav.L}2/CyO', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00019');
INSERT INTO `cibr_animal_drosophila` VALUES ('e4723c99c6684452947bc0af545ceae7', '果蝇', 'WT0021', 'D.mauritiana', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00038');
INSERT INTO `cibr_animal_drosophila` VALUES ('e5c9a7dda1774e368e806df108a70fa5', '果蝇', 'bcf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00002');
INSERT INTO `cibr_animal_drosophila` VALUES ('e7b4c3d2d423489fb18f1d147392940a', '果蝇', '1104.0', 'w[*]; P{w[+mC]=GAL4-ninaE.GMR}12', 'bloomington，张力老师要回来', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00012');
INSERT INTO `cibr_animal_drosophila` VALUES ('ed7eca5e067841b1ae7d80536fdcd3a9', '果蝇', '34499.0', 'w[1118]; P{w[+mC]=His2Av-mRFP1}III.1 P{ry[+t7.2]=neoFRT}80B/TM6B, Tb[1]', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00007');
INSERT INTO `cibr_animal_drosophila` VALUES ('f98cc856eddf457192735d6a321040fb', '果蝇', 'UAS-1361-RNAi-1   T1-1', 'w* ；P｛UAS-1361-RNAi-2｝attP40', '芳景生物', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00041');
INSERT INTO `cibr_animal_drosophila` VALUES ('ffb6784d2e1a4a80a5080149f6a7bc5b', '果蝇', '8545.0', 'P{w[+mC]=UAS-RedStinger}3, w[1118]', 'bloomington', null, '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', 'CG00005');

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
INSERT INTO `cibr_record_meterial` VALUES ('324b837cb4754c86b02d81bbe741e7fa', null, 'b42163179d7444ab804ecefb7706abee', '2020-09-13 14:00:00', '2020-09-13 15:00:00', '2020-09-13 16:19:46', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('469628bb9d854ac7a236222b129cd1b7', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-12 12:00:00', '2020-09-12 13:00:00', '2020-09-03 14:10:46', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('51049768afdc4ceb9729698c51e776ae', null, 'asdfased3', '2020-09-08 10:00:00', '2020-09-08 11:00:00', '2020-09-08 11:07:09', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('514a6a6594ce40b08671f29c416edc37', null, 'b42163179d7444ab804ecefb7706abee', '2020-09-13 10:00:00', '2020-09-13 11:00:00', '2020-09-13 16:19:46', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('51e15917a83d4b09be53e833db8c7aae', null, 'asdfased3', '2020-09-02 10:00:00', '2020-09-02 11:00:00', '2020-09-02 14:43:16', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('574ada0ccf9948f1961c9472cf898295', null, 'asdfased3', '2020-09-04 15:00:00', '2020-09-04 16:00:00', '2020-09-03 17:15:42', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('5be74c03001742449723685276879422', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-01 13:00:00', '2020-09-01 14:00:00', '2020-08-31 15:38:29', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('6a596dba7f6f4db19456804714b09a2e', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 14:00:00', '2020-09-03 15:00:00', '2020-08-31 15:40:50', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('6e6269bf367a40888974526bc7511a22', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 10:00:00', '2020-09-03 11:00:00', '2020-08-31 15:40:50', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('763a20b69d8f4e28a5dfb943291a8ae1', null, 'asdfased3', '2020-09-03 15:00:00', '2020-09-03 16:00:00', '2020-09-03 13:43:38', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('895f61028eb34148a30fcf5ce2bc122f', null, 'b42163179d7444ab804ecefb7706abee', '2020-09-13 09:00:00', '2020-09-13 10:00:00', '2020-09-13 17:55:46', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('a4c2fae05df94612a20c2bb15fb21854', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 14:00:00', '2020-09-02 15:00:00', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('aabe3201267c4c59a79a29d2584a045d', null, 'asdfased3', '2020-09-08 14:00:00', '2020-09-08 15:00:00', '2020-09-08 11:07:09', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('bb9140a947de4bec82c37863631be5bf', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-09 09:00:00', '2020-09-09 10:00:00', '2020-09-08 11:07:34', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('c7c88c8159984aaba9fe92fe14e8ba43', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-05 11:00:00', '2020-09-05 12:00:00', '2020-09-03 13:47:02', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('c9a3d5a4ff864679bead6a5f2f7ea956', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 14:00:00', '2020-09-08 15:00:00', '2020-09-03 14:10:12', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('d6681a26471e40ccbc0aff3e1f43bad6', null, 'b42163179d7444ab804ecefb7706abee', '2020-09-13 11:00:00', '2020-09-13 12:00:00', '2020-09-13 17:55:46', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('df5702c1f7954a879ae24a5255d221c6', null, 'asdfased3', '2020-09-02 14:00:00', '2020-09-02 15:00:00', '2020-09-02 14:43:16', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('e0a979744a6049e4b60bfb64bc62d393', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 10:00:00', '2020-09-02 11:00:00', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', null, null);
INSERT INTO `cibr_record_meterial` VALUES ('e381e6cef07c42a3a5dd1fd41871e70c', null, '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-09 13:00:00', '2020-09-09 14:00:00', '2020-09-08 11:07:34', '24f5851abc6444e79be718325025126f', null, null);

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
INSERT INTO `cibr_stock_drosophila` VALUES ('06b974185c5d40fb9b5da5f933f1da0b', '730b3ff246454f0aa998470ac600a0b5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('0a5d6ea51d014f8d8b169034aa857ec2', '8c88e6df2e964af19b4758b82e8fc41a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('0b860e6b1ff44080a400f92cce99f94a', 'e7b4c3d2d423489fb18f1d147392940a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('0c503542db8640dc8a7db5a87d069991', '775bf476bb0a4d6099784236571f49dc', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('0d61de8bad9e4c7481bbf98ad572165a', '48ded1d90435424b85bea0f52a264ebd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('14c69a299d354b288b293fc4ebe878e0', '0433c90e8c63498abcc84a13eb7da715', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('1511e9727e9947cf8609be29132f739e', '44e104516bd5435d91bd818e47b681d8', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('1675a6748f474a8e9c515a6d0e4ac446', 'e5c9a7dda1774e368e806df108a70fa5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('1cd127de839d4727b037083f9f20e1d5', '5002ba504b7b41a99ea7125d3738df93', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('1ead881817c64996af45de27e51bb836', '730b3ff246454f0aa998470ac600a0b5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('1eca5f536219424f9c1e14dd6b25ab21', '523b80c0842e4446bfcdc4a2740b343d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('1f87be6f0a5f4933b2094577fa344223', '9829f33efb0b425faf3b16443ea3d8fd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('26b87be7a4a242dea0651503b550953b', '244b57ea66944c36af5fcb1f9f6911bd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('2c43ae011e5a468da354a17666ebbe30', 'e4723c99c6684452947bc0af545ceae7', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('34889564d1e2418f863d0ef2ae91653a', '44e104516bd5435d91bd818e47b681d8', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('3764bb236e504143846d72b7858199d9', '0252cd06eb5243a68588838ebba0ef71', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('3ede272aa3544de1957cb7b00461c651', 'a77d046d56944115a865a8fa9abfecba', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('4af8bdff11e941cd949bd8731e9b08fb', 'a7b009df30b3467a8ec019fb53efb799', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('4b99fa2764394999b729773ec7633799', 'ad1143aa17a0468baf1e8f21416929fa', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('4ce7fb5edd3f436eb47c62f7b17bbd6a', 'e4723c99c6684452947bc0af545ceae7', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('4d16c6f8299b438a8ba75ee2a86587c0', '4d132015d03c4a9a93fa2a55cc64a9d5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('52ef40e2f5fd41d5b060af69a9728877', 'ffb6784d2e1a4a80a5080149f6a7bc5b', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('5738f1eaaced4af7a920512d19c8b02c', 'a7b009df30b3467a8ec019fb53efb799', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('5d381c30168d47d084dcc41e7d103ca8', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('5d7bf08af21e4479bea101737a6d9143', 'ed7eca5e067841b1ae7d80536fdcd3a9', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('5fa27ca7d1be42e9b483f3a124aa64e4', '49833384474c43a6a4252bbfee649982', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('61539e536af64197bdc6f6d6887681e3', '15c0c9c15ce442cb9c78dbaff891cc5a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('65f8294e99e2443bacf2dd56cc900835', '24d762359a974db3a5db10267f6c6c82', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('6762ce53e052406b8ecbdd22b6a27394', '3bec691fe4e34cbf8d800feab8ed2ecf', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('6c6420d57e794b208f58c5df5fbad6bf', '4da63a0b3b894bc6b424b7ab324f5ca1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('73024fbfdda34f94a76855b3c79b5c4f', '5002ba504b7b41a99ea7125d3738df93', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('785e6516d2c6434789be44e857c443b7', '3bec691fe4e34cbf8d800feab8ed2ecf', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('78fb4bb933264da0ad7e58bb47ad9a71', '5629511973ac4faab573031f59a22b42', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('79b6653a7b594391b75c94a78f3093f9', '1a5bb151869d4f74bfd47e9576a921d0', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('7b3c9d82a7444b1a95e958b054624d05', 'e5c9a7dda1774e368e806df108a70fa5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('7b9378eed3a04ed0b1e38a9b68e3e251', '460f665bc18c43628e80074c7e9fe338', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('7c0feee96e9047f48e592ec345b88839', '1b80b613b7a44d42a95c41ca397cc1aa', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('7f8b33c4db834e159ec669c54116ec38', 'ffb6784d2e1a4a80a5080149f6a7bc5b', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('88d8da00462e4fb89356d4402bec5680', '9b76b34d7bcf4df7a11469708b5eac6d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('8a1a23b553d840e59d4a983228aa76a0', '0b2b7d1cd2154bdab146a5c7804b17f3', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('8a58c717ef044b398010891ca258efbf', '523b80c0842e4446bfcdc4a2740b343d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('8d4991fc400f47afb16621949237e89f', '3c65751d10d6447bb78d6a51a4ddf764', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('8e219d844a024d7792f233a0414266a0', 'd4a757f1957f42dd9ac92656ae93ccc1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('8e3b99c032a74539924ffa0d97b462fd', '15c0c9c15ce442cb9c78dbaff891cc5a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('8f123faa305c4139a5ce12c339a41851', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('907bd7cc12f64adc9e5a547d57e8819e', '9c2dc78ca651485381d176126f63ae9d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('93473f7b76c446babfbb283cc2785680', 'c1d2cb99c7ee4f74bfc01592ea4dfa71', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('96726c512d4b4eb39533fbbee0ba2d2a', '29486b5bafad4d1980b92bd53f33c0dd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('980ecf7266144de4a2677626f7d27df0', 'd362f99a980e4643806f425de6ce1ded', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('9828995c3ab4409791e291121384d438', '9b76b34d7bcf4df7a11469708b5eac6d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('99b000f84746443688f1a4e989d30abd', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('a09008bc39874d86ae06c8adfc25d92f', '9c2dc78ca651485381d176126f63ae9d', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('a4d622adff294d208b724ce06c65d2b7', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('a6fd1418ed5343fbbbaf80e1d681e210', '460f665bc18c43628e80074c7e9fe338', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('aadc3d411d694daa801965d007f59a57', '8c88e6df2e964af19b4758b82e8fc41a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ab315d848b344d1eb51cc2b5021dbe72', '5629511973ac4faab573031f59a22b42', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('adac7206c132450fa9c9655bfd4224ac', 'dbb57a5af7de4656af76d6d995a8d821', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('b1487e0a26c940479f1e5980c7cf9cdf', 'c8a1ace89381459fafbba3378a4138d6', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b14ec9b23b724be480efb4423b29b5aa', '48ded1d90435424b85bea0f52a264ebd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('b38b49db4e3d4e44b8820301137b4760', 'c8a1ace89381459fafbba3378a4138d6', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('b709091ffc9d414e8b6580bf5d08597d', 'ed7eca5e067841b1ae7d80536fdcd3a9', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('b8f3fcc95b7d4e15814a3d4b754468f7', '1b80b613b7a44d42a95c41ca397cc1aa', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('bb7609af84774c50ad1727bbe9563942', 'e5c9a7dda1774e368e806df108a70fa5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('bb9fac6e4a614c77ada083a87fb5e59e', '0433c90e8c63498abcc84a13eb7da715', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c4372e75985141c1bf60736a8c444f6e', '9829f33efb0b425faf3b16443ea3d8fd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('c6fa68ddbc5e4da6bcca52559d655b71', '0252cd06eb5243a68588838ebba0ef71', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c81f7e6c2e8f432b8703babb7fa66166', 'd4a757f1957f42dd9ac92656ae93ccc1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c84e1b68aa76402baa34c1579ca6ac13', 'd362f99a980e4643806f425de6ce1ded', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('c8d23b38b0834366a1abbc0ce3b2f0db', '775bf476bb0a4d6099784236571f49dc', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ca92765e726f4988bb2ef4b05c60f893', '24d762359a974db3a5db10267f6c6c82', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('cc507d0c52d04c30b2b3318ed01ce39f', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('d37f1fbec36e43eb95e332d2aeb7107f', '29486b5bafad4d1980b92bd53f33c0dd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('d77c8d2720114cfdb70b5625cf3cc38a', 'c1d2cb99c7ee4f74bfc01592ea4dfa71', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('d959204f3af44c74b674c46bd0e0b18e', 'ad1143aa17a0468baf1e8f21416929fa', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('da53886c5438453aacf077b4c087bdb7', '0b2b7d1cd2154bdab146a5c7804b17f3', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('dae0d029f42a457a85270640e6b37946', '0c2942143d06420886d25c4eb2db02b5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('db09ae59b1e043308812f45f683d5513', '244b57ea66944c36af5fcb1f9f6911bd', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('dbf510b5b2834483b0a4bb7000d3c4d8', '1a5bb151869d4f74bfd47e9576a921d0', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e17bc54dcac24a7a9e59c21ed1777ab1', 'e5c9a7dda1774e368e806df108a70fa5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('e3ea654db22640878de5557fe08e5b89', 'e7b4c3d2d423489fb18f1d147392940a', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e80ada6f795d45bf81e4a10c1bb8c68d', '49833384474c43a6a4252bbfee649982', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('e998c40d0a624b378d60ed2a9b910f2c', 'dbb57a5af7de4656af76d6d995a8d821', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('eb9413c143d34be09af4b0b420efd8eb', 'a77d046d56944115a865a8fa9abfecba', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ebcfa0298f26423284f020d821d1b65c', 'd9dc43551b3e42ce899df6880052d3b1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('ee87ab17485a40a7af5acd1957c95060', 'd9dc43551b3e42ce899df6880052d3b1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('f588bbdba49049999633e58a98031b3a', '4da63a0b3b894bc6b424b7ab324f5ca1', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('f72f7f341491446f8f6202ca6b2d0fd9', '3c65751d10d6447bb78d6a51a4ddf764', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');
INSERT INTO `cibr_stock_drosophila` VALUES ('f761589f75aa4570b15469dd172ab131', '4d132015d03c4a9a93fa2a55cc64a9d5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('f7cb92f474ed4478b81568f9d36a8b26', '0c2942143d06420886d25c4eb2db02b5', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasde');
INSERT INTO `cibr_stock_drosophila` VALUES ('fa0134d87ead4a9da1c2163162510bb3', 'f98cc856eddf457192735d6a321040fb', 'S', '1', 'keep', '2020-09-08 17:39:56', '24f5851abc6444e79be718325025126f', '2020-09-08 17:39:56', null, '1', 'S', null, null, 'sdafsdfasdfasdf');

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
INSERT INTO `cibr_sys_email` VALUES ('02808087544041298e860a894e2570eb', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('02a5a7c9b0a04a76a33d1a714e5bb4b7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 12:58:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('03024856e79642038a61caa285a78296', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:52:50', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('048c03f4dec542c99fddafac3b47fd50', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 04:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0511a29c28cc4c6eabe6d5acd9ee0bc9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 04:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('05c48ea111654ae58d866d446a38912a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('05ffe637e8364a0ea86e10d49c5bb514', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-05 11:00 到 2020-09-05 12:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:01:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('07d881b46dc94e2e9555a8e54b1ea48d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-08 15:00 到 2020-09-08 16:00    自 2020-09-08 11:00 到 2020-09-08 12:00    】，原因【dsffds 】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:53:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('08fe17ae826b4797aaa2d63d9d8024de', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0a82e5099bea46d0a1bdfa64aab872fd', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:39:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0aeafdfebb4c4620b2297f9f6d3dc06c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-08 15:55:54', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0b01fc0a45924b44a218e186d15f6054', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0b02812866cd48a4b2fcf513277f0043', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 04:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0be3dca629d146ad87e1e1a9b4293b05', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-28 14:41:14', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('0c4c96a57f0f4c9090be3f1e548a7a09', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：350263，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:51:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0c64b06a64204e4c899b650f4f8d4031', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:20', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0cc515de6272438ea0101aca9f6971af', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 22:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0cc5def640b24e638f08942342a8b6a4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-09 09:00 到 2020-09-09 10:00    自 2020-09-09 13:00 到 2020-09-09 14:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:08:11', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0d29e7d1343b445eadc798e01305e912', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:16:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0d699444d82444ecbae1207c661ce913', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-09 16:00 到 2020-09-09 17:00    自 2020-09-09 14:00 到 2020-09-09 15:00    自 2020-09-09 12:00 到 2020-09-09 13:00    自 2020-09-09 10:00 到 2020-09-09 11:00    自 2020-09-09 11:00 到 2020-09-09 12:00    】，原因【sdf】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:53:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0ee3b797f6e74820a9857fdd1bd048f8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 05:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f1ab3f3f9c4423790fc6a821392cb01', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 09:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f4e28530677443d8dbf054f4091f82c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【冯爽爽】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:19:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f643945e9c64a4fb467d27fed6ac83d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:19:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0f7d432fa75640dd921393813827e08e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【士大夫】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:47:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('0fd52dd7ab8140b2a4fb916520079367', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 03:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('10226375f0f944579b2807259cf909d3', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:43:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1031464eec7b4e1faee8b800406bfb14', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-08】,任务申请【！！！加急！！！】，请及时处理。\n\n\n\n\n感谢您使用资源管理平台！', '2020-07-24 03:29:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('12c4fc50b70f4e9698226f77d9c80bae', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-12 12:00 到 2020-09-12 13:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1335b14c15004064a6bcfdb8567747a1', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 07:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('133b4167ac724369a0fc40abd8cfaee3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:52:08', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('13f66d79a91b4629920969bb78b15112', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 23:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('14d18559e76746d7b008de476a635c2c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 08:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('14f482e6336941fd848472561c283165', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 21:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1523facdc6714c37928d1c29c203398e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 03:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('15e9e9f034074103a16bd82be128e5b9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-08 14:00 到 2020-09-08 15:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:01:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1688823d8fcc4645ac5a3d87970fe8d6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:58:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('17832c43aaf14cc08c9d6f2a7b3a4b1c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 15:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1845b88521c54fe7abde458db7657531', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-31 15:52:37', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('18adea51c2b74250a8d9056ee880d6c4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【哎哎哎】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('18befc53bc4d4a288d61e5ea1f081e29', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 23:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1924e8f2a63049b8800238a7fc28744d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：727477，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-10 08:22:41', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1a52f2c2d7524872b63d7c59d17c9cad', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 09:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1ad4732da175415896866736b639d792', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:12:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1b356a74f1be46e5b1c7492859ab6860', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 15:56:22', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1b806c070999469baaac7add4c2c3b04', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 13:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1b9862328a554ca2ba021b3cc3da4f21', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:11:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1bcc005d06e546bfa2cdd4bc92d937aa', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：822841，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:42:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cc65e887be945768937608c2dd8741f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【asasd1121231231231313qwrfs312】，请及时处理！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:47:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cc675b257ba4d8aa82dc35ed5d6bade', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:08:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1cdd43f1c7694acf81753292824eb50a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 13:51:27', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1d009fc5a8b846ce8213fd1c010706e8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 01:52:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1db268a195a24dc0a232730267bc940d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：930327，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-11 14:23:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('1eb4f6f83b2e43db8d47ef1f3d038aaa', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 05:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('204bd19a95b842388f1fa6f7ec0fa90c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:10', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('219ee9da6df841d9851e08abf81d8490', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 06:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21d595960f7c44358d77d637237f48d3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:42:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('21f5f475903e4472a779b15656b0f08b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:44:32', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('227d9e45c4cb43dbbd4de2db4cc1bb6d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 20:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('22a2ffb7386e462f834a0c91b348d21c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:36:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('22f3244ea0104cb8bc73439d4401a86d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【曲素素】，邮箱【qususu@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:43:28', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('235b7313e8c34fdd904e209e0ca40094', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-13 17:04:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('253303bdf0d844b2871d2b6e51b08bd4', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:11', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('257be2e7d514420fbb00b969a81f15f5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:10:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2593c51b811647a389d857068bdc5eeb', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:02:10', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('25a39df40454431d9dcf4d763a3ce5c9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 18:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('27493aab10e948a28722992a61a988c4', 'zhouhan@cibr.ac.cn', 'dsdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：548072，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:10:22', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('2854822855b24649bdf9edd4301a6a93', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('294df9e33d8142dc845f206d80e24514', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:11:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('297b1f9f1c174959855cc3c2d00a1234', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 19:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('298d3bc7e1e4401b9f6051f0e62f985f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：810322，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:44:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('299d3572c4af4a9d91cd174532078692', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求任务已取消！请求协助时间【自 2020-09-13 14:00 到 2020-09-13 15:00    自 2020-09-13 10:00 到 2020-09-13 11:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:46:35', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2a017eb4a25f4c73b0a7b2a8f04d096c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 04:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2a8ddb026c944820ac53cb3928cb64c5', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-15 14:00 到 2020-09-15 15:00    自 2020-09-15 10:00 到 2020-09-15 11:00    】，原因【cvx】。\n\n\n感谢您使用资源管理平台！', '2020-09-13 17:55:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2affd37f1dc8444bb9bc8cb32acd0b43', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 17:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2b0a376f6f1a4dba9a77f9d01794212e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:16:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2bf683920f934f2c82510a19f4ed56ed', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 12:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2c71842f1025484e86e7e6c5b39b8f50', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:07:01', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2ccadbd7e6254984b944bac6b5a799d0', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 04:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2ceee3d0ca2742acbabc6ee287bbee13', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-10 07:28:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2d817e503d044e5f895955a82ec016ae', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:50', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2eed6b4b96094f6ba61c1f6cbd573d5f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 02:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2f4f2d0e317b4050ae6abe2173f2ca02', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 09:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('2ffcffd287d14ca1b32e3a35f88211db', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-14 09:00 到 2020-09-14 10:00    自 2020-09-14 13:00 到 2020-09-14 14:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:54:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('309fd362c2054df085f62cb52692f568', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：946185，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:05:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('312d9f23b2b941f4a38dadee616b81b9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:22:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('31c2e829b1714fdaaf5115c037b4a6d0', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：456579，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:10:58', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('32afe8dce42b4fbfaa4f3289364057f3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:52:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3341f4d501f949de9ba901c4646549e6', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:18:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3382ee08286f4cf3bee9e237200aa31f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 23:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3407b98992a14bc7831c898b07e6b60b', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 05:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3430c1376d9345c1ba8a5274a8ea8e06', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：954870，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:27:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('345e1ff13ecf40698c948ed2492151bb', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 00:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('351c76a3dd5d493aa281b9391412ed8f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 12:58:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('352c3d9daa974cbaa6e4ee56614c607b', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 20:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('359084788dd740bba98849e1d0929df1', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：858161，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:42:29', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('35f39018c1744679a5b2e47c8e90c026', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 00:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3602409ecaad437aad2a7f83700da887', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：262278，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:09:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('36c52a5c1c4b40f6a19b00f95ca5bc83', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 08:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3707067576fd45039c00aced3cdec8e9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('374f0e291b004cfea3c319d27047f98b', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 16:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('37766747ea834b0c82d7d07297c85f77', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 20:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3795503200c64337a949e7546c96b1e3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-05 09:30:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('37a62ad242d14ce09aa87e137d8bfd2f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:13:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('37b8a3551ed04c8db6368b97cd38c23c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:15:15', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('37dfe6e60fc441f7b959e8b7462968f5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 03:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('38cbbfbd2b804df9809e447b012813e7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:34:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3a71be5b9b8847e2aa79ce8f4ac1596a', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-04 10:00 到 2020-09-04 11:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:53:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3b31643bf7374e02ad9323ea4195fa54', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:59:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3ba58d033a0f49b6b0bf0f0b399c2242', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-03 17:14:20', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3bbdeaf1b68c4668be8129c7484cb12f', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：794297，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:20:31', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3c88ac009f234ad38822df01e2ba0190', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:55:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3c981874af7d43939d302a98444e2524', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:10:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3d000395e0b540399a21a69f5a1f801b', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：145378，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:12:30', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3d36e7feb0e84d1fb736207a31be71ec', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-09-03 14:43:29', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3e4b95459db947fa970fcd0db702401e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:46:36', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3e659102cd2e408fbd0aa5885cb403c1', 'zhouhan@cibr.ac.cn', '981436939@qq.com', null, 'xxx', '2020-07-07 02:52:34', null, null, 'fail', '邮件主题不能为空');
INSERT INTO `cibr_sys_email` VALUES ('3e92e6afe57740a7936b6ca42a907409', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【2】条，拒绝【1】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-03 05:58:11', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('3ee279ebb46a4dfcb7c13c20142cebf8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:52:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('41ad8ef36d68421ba421a15c93e2334b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:08:51', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('41bd2b06469c42e2849497c6467641ba', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 15:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('41ce8e5f034e45809c65ed45fff30951', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4217ec936e484ee8ab1a4fafce9c8388', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-10 16:00 到 2020-09-10 17:00    自 2020-09-10 12:00 到 2020-09-10 13:00    】，原因【谁发的发生大啊】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:01:13', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('427175b871fa4c82867b76f6084a00b8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：763212，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-11 14:21:01', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('42d7a9a299c643a8b9b30cd2941a6f49', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 10:12:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('43143f4ad7ce493fbf0685118db73db7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 02:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4360dae5aab74c7285a35304fed65751', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 05:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('43e1ff077cd84a93a7a1c38f4e02b151', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 09:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('44618b2d361845d28fb9ccaa8656f188', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 03:08:20', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('457b3b6249284763890fd2a96b6d4b58', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 09:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4628541dbdee43a0808b44181f0d7444', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 21:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('478cce2d6e35426b982cd40c74d4bf77', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:04:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('47ddb9873a594ccc9d9f40e001a55353', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 17:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('483b6565889c45f69ad71edebad873ce', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求任务已取消！请求协助时间【自 2020-09-14 09:00 到 2020-09-14 10:00    自 2020-09-14 13:00 到 2020-09-14 14:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:55:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('48414b1909524d97aa49cd389a1332d7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 04:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('492a898089b3443fba3a5843125aa6a9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('493a0204c8174090882e42bb928a3dd6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:48:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('49948c10e661497b864e1680f69d351c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 02:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('49d70d36431c423fbf7d0a0b29d83515', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 16:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4ac44e80b0f740909ab603f3c56c199a', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 21:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4bcb689fe75144e09c1640bb580177db', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4c7368d6739f4d21a6e056630b904b2f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:18:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4ec657a02018499d9da399ce243371ed', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 03:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4efab46c6d924f8391013c7ae9248711', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 06:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('4f68462ecd02407483ea8c744be668e0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-31 15:52:37', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('4fe6988e3a3d4b648bb22c861e42baf8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 03:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('500b94c0b3184ba58f263df06c579649', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('51885b8ec4f54afe84ea10c523c82fcb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 23:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('52d0245097b44eaea9871082d96424d7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 13:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5370d363c0974f43bb15400afdeb2251', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 19:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('53ff3ec3a57c41b683c998fdca82bece', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('54e81062bd204c53b65fea2bc663e44f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 01:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('55f5247cb40a450494106d998240c5a2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：222568，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:42:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('561dd84dd1844739bcb8040298d6438e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 18:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5790f1b3bafc443ebe197a604851a7d9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 05:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('57d2acc7ce0e4e149413f59bccda44ae', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 10:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('584d91ec0b324cd59efe2a74712a8671', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('586ac2874dce4b41b3f4ec61a3f50624', 'zhouhan@cibr.ac.cn', 'adsfa@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：640080，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:13:15', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('5a1de9d308b34c36850374e47c4b2b64', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 16:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5a6d02cc51654bffabc8929542efcd75', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:37:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5a90b0e78e604276a3fd09ef318f4001', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:34:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5ec9520d3be242e5a2784164f92bc4ef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-17 02:24:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5eedba7c251b4f08a4e2823b63c95801', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:16:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5fee14931fd04c2c86ad7923f70a4f40', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:58:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('5ffaf62f2aad4599a96b81e70fbac612', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：501281，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:43:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('60365785dc7247daa67cf29382fe876f', 'zhouhan@cibr.ac.cn', 'zhou@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：488425，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:06:38', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (zhou@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('603a3d2a6fbe434a91a459a596dafcc9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 14:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('60ac1ce35dc54af79895332d4ec1d964', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 10:52:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('610a96acbbd6453cb932ae27fdcd44de', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 04:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('61a127495cad4abc873dbf3528cf1c17', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:22:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('61a3c987f36a4ad8831d3fecda61c47e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 02:53:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6358a452f1894b5bb0ec7b75fd93981f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 12:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('638e39186874422e8257c1ff70f1f132', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 17:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('63dbfd16d214476d94ef1430b9ef98cb', 'zhouhan@cibr.ac.cn', 'asdf', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 07:28:52', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('64056c419f394743aba9672b010e4858', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：265654，有效期为1小时。\n\n\n\n\n欢迎您使用资源管理平台！', '2020-07-24 01:27:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('643f60b3bf9d44548373b651e978f59d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 03:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('651f28331ce14129a34e3ca06ce021cf', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-17 06:14:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('65a044c54e4c4645afa90712be68903e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:15:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('677e32924661415da4c6444e9c7ba474', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 01:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('67bcfa1cf4cd4583b2a128cc12f9fbcf', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:07:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('68964fb5195e40b594d69566a77f505c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】被【拒绝】，原因【ASDFADSFAAFSDFASDFASDFASDF】，请及时处理！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-07-29 10:15:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('696cc3626cc34c33a6fa7f1d727a2cda', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 07:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6ac217ae81cd4ef0a0f9d6d9ee0c13cd', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 23:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6b237e740402408397b978fc9cb58ea8', 'zhouhan@cibr.ac.cn', '981436939@qq.com', 'test', 'xxx', '2020-07-07 02:55:47', null, null, 'fail', '邮件发送失败：Mail server connection failed; nested exception is com.sun.mail.util.MailConnectException: Couldn\'t connect to host, port: smtp.cibr.ac.cn, 25; timeout -1;\n  nested exception is:\n	java.net.UnknownHostException: smtp.cibr.ac.cn. Failed messages: com.sun.mail.util.MailConnectException: Couldn\'t connect to host, port: smtp.cibr.ac.cn, 25; timeout -1;\n  nested exception is:\n	java.net.UnknownHostException: smtp.cibr.ac.cn');
INSERT INTO `cibr_sys_email` VALUES ('6ba4ac1f39f9460487e798bba97bb813', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 10:13:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6cb33caecbbb4d0db2d7512ffbfda2c8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6d7d995e45fb431f846d410f31ac5e49', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：435636，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:08:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6e3c3638c4a54ec38728c77e735f1111', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：242006，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:07:15', null, null, 'fail', 'Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (sdf@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('6e6b337df18a4ee295327e9f026abb9c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 17:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('6ecd172221ad40668ec2b3b757f33dcb', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：950337，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:09:55', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('6fa8b281333c41679753f678d31021b3', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 09:56:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('706d66740090454b8ad628cd3e9f639c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:21', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('706e0ab2369c4f8eb3c2f85e72d1d5d1', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 15:56:22', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('70d0ad41bd714cb7baff6bb2ef8f6159', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-12 02:57:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('711009686a1c4a76a29cc5aec01652a0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:14:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('71fea3ee192742a080408fc8abeef181', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-24 01:29:30', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('73481cc48818407184b2836932717fdc', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 07:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('73ce7c5e8d8344cc8d237eb0749ac7b4', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 00:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7400f39384254510aa20c177fc13df69', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 10:02:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('741b2c1cc2b9437c864f0f0b9c4374df', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 21:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('74d3c8ebb2d848169833905966645499', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 21:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7507c2908d7e4cd6b4c3d804699ebac3', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 00:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('751fd57bbf824a8e8708133c026f4909', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 14:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('758ac68215214e1ab1a73ea62518f060', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:50', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('76a0246e19384f1c993e6894c0b3c7c7', 'zhouhan@cibr.ac.cn', '981436939', '验证码', '【北京脑科学与类脑研究中心】验证码是：944943，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:03:31', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 500 Error: bad syntax');
INSERT INTO `cibr_sys_email` VALUES ('76aef08810dd44c68acc5372de6b2041', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-21 10:47:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('76caf4e73a2d415f9c7f66311b68174d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 05:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('770b5f7853f94110a4e2ed3dbc71b3ac', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 06:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7718cf52554945dea6671d83e33b41a7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-11 16:00 到 2020-09-11 17:00    】，原因【不服输的辅导报告是否都不舒服登不上】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('77913f5aeb8d413293e4f666d25b6bc0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '【北京脑科学与类脑研究中心】您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n\n\n欢迎您使用资源管理平台！', '2020-07-24 01:29:29', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('77ef5f8bef9d43ee9aec013825026d00', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 06:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('781663a636454eccac602841a83eb07f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【曲素素】，邮箱【qususu@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:28:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7846cc2ca23e4bb8976b028d70fcaa8c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-03 17:11:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('786eaf1fc97e418f90348e59b569994a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 01:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('796fc59fe4ad4227a42c628b285c425d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 12:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('797d462046a94dac923affb47add6487', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 15:00:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7a7920fda9dd4c59905282b84505e13d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】', '2020-07-17 06:43:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7aecd40ad5d0401a9a2ab21bea9faa2a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-13】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-29 03:23:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7af52c11c9034be1a73465055be642e9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 10:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('7db278c06fc94729a09cb2ec13c16b42', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 07:28:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('80779ab61b784c2bb9daf162ab29d0a5', 'zhouhan@cibr.ac.cn', 'sfda@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：633120，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:12:29', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('821f853b0f8d4c039416040df28b5be6', 'zhouhan@cibr.ac.cn', 'adf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：619632，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:12:41', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('82c7b03034d145c1bf3c584cd5823a84', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-13】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-29 03:29:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8323d3e60d664873ba68cb8a0d298deb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-09 15:00 到 2020-09-09 16:00    】，原因【撒地方法撒旦是打发】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:01:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8472f0fe7cc04b9d946fcf65e706a5d5', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:59:37', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8533dd7b879342f2b914d27503340708', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 13:47:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8769b8a3efc04e52a2228f28f85fd42b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 08:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8818513214344793b0f15e4a31c39467', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：253167，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:19:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8888b82ff2fb4214854ac98ec7db33bc', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 11:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('88d92f0bd2d64793b44d0157afec8765', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 10:52:43', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('89167dd9d1b34cdeb3b9e98147bb9b98', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:22', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('896177f2c45d4424a13bc718b0dca465', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:53:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('89ec4f70294c4390984a01aef20259a6', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：461030，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-10 07:24:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8ac42d0d38d4445c9ce631b9ac80bdfc', 'zhouhan@cibr.ac.cn', 'qususu@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	非常抱歉！您有一个【用户注册任务】被【拒绝】，原因：【的说法是打发】\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:28:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8bac5091ff61484c889517c0e177e449', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 07:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8bb9aa1e21454d9ba0199352ce0af90f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：575503，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:47:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8bd7a6dc67264804ad6fb3808a63ffb0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 01:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8e71577d10c240b39d9912649473479b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-11】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-27 03:32:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8ee39fadfbc14a1280a77a62573ff3c7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:09', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('8fa4b7063af1496da128413a59631b01', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 06:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('90f808443b0146f0ac1dcf58ce5c29bc', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 01:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('91597d11fdec45cdad45b82d7addf49d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 08:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('91c26b7906d44490a08bb7dd0a7fbff6', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 02:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('925e5c516ca044fb8860f83e153830f9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:58:10', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9262e89a8f1d4d8c9a2f24fefe31ff8d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：145232，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('928cd9b277ed40d7a9cfd75f1b00ed1b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 00:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('93cb3e95fd714cb3a2249af5e007aa6c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 22:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9455b2f1206c48b49ffc4bc257cd88d1', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-07-17 06:43:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9485662486df469eadbbc725b177c05b', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：862762，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:55:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('954e0362818641708402f6057a98f14f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 20:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('95e4d4526caf4c3fbbb04076bbd6f2c4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 21:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('96a889a3c50140899166ca11f6a569e6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 01:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('96d820a867734b208a3886840f15bf54', 'zhouhan@cibr.ac.cn', '981436939@qq.com', 'test', 'xxx', '2020-07-07 02:57:51', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('977d5f6df9f34f4bbf2dd88d4b8cbd3c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 14:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('97bc36178310450389fc975910b07576', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:27:03', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('97ce9eb3808a4644917fdd11c80775fe', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('983f87a35b2643289b801dc4c1b6a22e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('99247a5885944224b1293141bab29591', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 02:25:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('99e696943d1d47e788d7b03bd4a09894', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 18:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9b54e0f70d42461b83f6db74b95c288f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 15:00:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9c5b3d60d80a406289e00e5f90dfaf91', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 23:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9c8923e4d2544019b4869e06f74d005a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 09:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9e338da916e342a28fed997d3c54df84', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9edc7bd2c8ab4f8d8b61ebcfc608f467', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-03 05:52:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9f939136649d48339507c683d2685dde', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('9fe4294c0a754fdba131517bc94626a2', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:54', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a05f9b4138d84bce9933bac295687c6f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 19:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a0afd13eb93f4300a1f40b3d34b6efb6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 07:12:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a18be85f0b7a42e692bec9d158b0bca7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 10:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a1ed19eb09e54358ab30889a784acce4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:31:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a222c3d41e654de39b969f256e18f94d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:06:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a2628809ebec4d3997033eae6e0deac2', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:53:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a2f9b855c5b34070ab7005a1438d2ada', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-02 16:44:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a3282d21f5c44e4aaac31c24c94684e9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 18:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a38d3caffaee4f39bb47f9eaf7b31f04', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 06:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a438f5cefe804a6781ba42b11a1c55c2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 05:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4db93ee6be04dc396a9b8a4d3a51597', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4eadd3a6d1443baac03a12637b39a40', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 03:08:35', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4f170a059ff4e1ebbf1fad2b44a6d6f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 19:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a4f8e453e1cd42bd8d77cc7f63df80d1', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：352853，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:04:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a6c201e0c5734cf3936875f85467f9e8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【用户注册任务】已审批通过，欢迎使用。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-13 16:19:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a7e65b478a0b4ade9963dc4692d15131', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 22:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a854fd18aa654d65a52b2041301f80c0', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:10:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('a8c8b620e0014bec81b880cbcc57814e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 08:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('aa2f0eb524344de88f6e70a2ad4a4b83', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:53', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ac40a6914ca54c599a9e122ab9a56534', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 22:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ac4c06dda4254f8f925a6363485f8e53', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 19:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ad8351c24f584153b723d3c1e2b68df4', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：655644，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:06:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ae213fde048a4e3596c4d2a2ede3b15c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-09-13 16:19:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ae5094fc85094b598a2f9d8872d45613', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 04:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ae5708c568584d04abecb31ca3eba03f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：176002，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:07:37', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('aef2f72adefd4c11936f8bbf16df406d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('af60d7008216480a925eaa5f4e6afc0a', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:18', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('af81e0c7ef18422592a213eed16bf5e4', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【0】条，拒绝【1】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:02:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b0829db904814e9eaef70e84880eae82', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 08:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b11d0f3cd4c14236ad583607a7ca6bbe', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：156654，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:53:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b1592e66a60d4452a43021e06897c1ab', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b166c5393467476db928182f5df4cca5', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b231d434b8b340a6a38978c16846a4be', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:45:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b2e3dc082e4843e6b2402e0702eef998', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 02:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b395bc774e5d4ecc9c691baff5c35156', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【4】条，拒绝【4】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:37:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5b63680240d415c85c084d46df328da', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5be9a4065c445e2961fc376f905446e', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：191350，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:49:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b5dcdfef99774dbfab9c338120156cf3', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:48:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b66e04f58e2040598191e3a3f1d785bc', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-02 07:13:52', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b6c19a9092d24a99855d894b1797de92', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:03:28', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b727a99a259449da854f1cde78674ab2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-17 02:03:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b755103359fd42b89d646c95f6ee6536', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b77e2f54326a464f86ff1e5accaf2eb1', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：673588，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:17:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b79150e90ccb4f5f9d0c71d0b7e05f2c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:10:03', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b8081907793948bb88b0b9dfaa430d3e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 11:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b80b55a028d242e2af45b5005fb674cb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 13:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b88d34b717a04b76a6129feb77d776c9', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 01:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('b91006b48fda45768db79b8262c03565', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 19:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ba99382ec3674b8ebfc08d1b65df4a3b', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 16:11:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ba9c272fbc004d51bb4441f2f062659f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:04:32', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bac22d10e9ca4132b5701517f17485a9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 05:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bb20b9fcf95c4f27a2bdf9d176903de7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 13:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bb7d7aa0d82c4296adc0ed1704d28454', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 00:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bb8790cbf0834d09aca82f77b7d89939', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 06:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bb9b12089cd74fd9b3fee88f2e46a4e8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:13', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bba4b909d85249b6a473699c00507012', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '用户账号申请', '【北京脑科学与类脑研究中心】\n\n	您有一个用户注册审批任务，请及时处理。申请人【冯总】，邮箱【fengshuangshuang@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-10 08:22:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bbbf2487e6cc4503bf85f94d2470a6f9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:15', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bca2903e29a64b8595f5039e8e739d88', 'zhouhan@cibr.ac.cn', 'fengshuangshaung@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：926972，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:43:40', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('bce42d60511840fd9ca33cad3ff4e3a1', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 20:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('be1400b1208042bc8718c2d2c572c126', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 03:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('be5a7689c109457ca9c7e67ef5892ba7', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:06:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('be665677a32648fcacf7e020bf946b0f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 23:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('bf26f8df1cd543ec95f3e92f822bd0d8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-08 11:07:34', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c00bf06ee99c411ea14ebd332d908d9d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:56:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c07944e1e2b74c8aa9dc158026ddbb13', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：927711，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:35:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c09b2c2b82ce46a7abb9ac779386495c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 02:25:28', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c0d201fd387b405bb12966eef878917e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求被拒绝，请求协助时间【自 2020-09-04 14:00 到 2020-09-04 15:00    】，原因【撒旦法】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:01:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c171ca659a924037abe2204954733477', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 22:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c20aa5f8a7e24812a19977e7a1f5812d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 20:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c2badaf82a414ca19dc64e44a376cbef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：270839，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:13:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c375164a18194988b36d88dd7f0355dc', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【3】条，拒绝【3】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-07 08:36:27', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c3e11a1769714b2e894890fd8371570f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：242890，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:09:13', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c5008410d5704e928c74661795d51780', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 07:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c537be961d1a44258e3c945e89979c19', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 09:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c695d8dbe1d944a28a1c66ada199b501', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：152486，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:15:14', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c8c7d3b803d24b37bc0231c509008048', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 21:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('c9e1cec2d87d4a6d83e125dde8a26372', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ca195b23a8a9419daec552c1f1077c31', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 20:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ca9dbe22a28b43ff90456455ecbd8868', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 08:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('caf8995bb5a241c08aec3a90a1a7af7e', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 18:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('cbdfe175e878415bb2e9cc5ca622b567', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 03:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ce8bd05fc400456a99c1c292658b2fa7', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：751835，有效期为1小时，欢迎您使用辅助平台！', '2020-07-10 03:18:54', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('cee8549f563f45d788144e6a70a86940', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【7】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-08 15:53:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('cfbd197958eb4f40a627e58351bd586b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-04 18:36:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d11d9ed944e94d81a8a9ebedc4ffa93a', 'zhouhan@cibr.ac.cn', 'zhou@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：538332，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 05:56:29', null, null, 'fail', '邮件发送失败：Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (zhou@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('d1547530d75a44aea13a083c4346aa33', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn22', '用户账号申请', '您有一个用户注册审批任务，请及时处理。申请人【周晗】，邮箱【zhouhan@cibr.ac.cn】', '2020-07-17 06:14:45', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d1aee1bf59524f9cb6e63d6f8421f97d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:10:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d1cfd77662864c7f8a5eb217577e577f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 08:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d1f7b7bb1596459b94606ee925033707', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：351717，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-11 14:19:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d44d722cdfc8456b8e38059f72e30d93', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00    】【北京脑科学与类脑研究中心】', '2020-09-02 16:58:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d4eb641c73c74e1d874946f8272acdf4', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 14:10:15', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d50a09721d694d09b467ff74cae9b3ef', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您的协助请求已接受！请求协助时间【自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00    】\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:00:42', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d5cbd68193ec4c5fbbc2987c461e610d', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 09:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d5d83d269e194020bd1c33829d90978b', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 20:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d63f0e9f53874990a1444211a9257c79', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d68cf04a0be54a30a4237e9ebc9c71c6', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：543530，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 07:58:59', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d6d3514a27c144d6bf52453aaf269d9c', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:51', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d6fea3aef94943a2841c103436c89875', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:10:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d7f541ce02e948a39458a2ea9576ed03', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-21 07:09:07', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d897c3447dc34e2bbffbadbd759960ae', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-04 16:00:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d8a09f13981c4c41a50252d49f4a1692', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 16:11:40', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('d8e84f9e83b84edbb6c07c273f989546', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-07 08:47:19', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('da72cad1752d4dfa8241f0d4fce5444f', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 21:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dcffe2b202754e9e930dd467a894d60b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 02:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dd380f781a37437aa2f29e28a208812b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：695869，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-08-07 02:24:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('dd49d387b06944e9aeb69402266c5c6b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-02 17:13:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ddf3b7f391544cd0b67de30da2eb9821', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 00:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('df130c10d733429bbc84daf767fc6a49', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:27:02', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e0276b5b56504eedbd6b4c917ef6d264', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 10:13:04', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e06614ab456e471aaba0c3694e0deed0', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 11:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e12edf3d9b2145f09cdc60dfba60ee93', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 10:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e1375af91c8b41d59a882f5672361172', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】\n\n	验证码是：108624，有效期为1小时。\n\n\n感谢您使用资源管理平台！', '2020-09-11 16:03:03', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e13eaa96e05746fa978ac6bc689feffb', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：677585，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:01:26', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e1b578a3292d485c90658f7a63f54796', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 14:00:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e20b1f213e004a2cb11414f7b9930733', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:11:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e22cfd7b735f45b3abf9b9ad4fa5d4dd', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 07:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e44a802a652842f09632d18627895bf4', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 15:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e4944b8dee824545b49a733cc394b4b6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 05:31:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e4b093754ae14f9d9894a6cc38a7f395', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:52:20', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e4c9763f300e4b21b4f7c4e10bd20523', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 02:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e51901d8c94d40fe8dbb67d91e51ac00', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-13 17:55:46', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e56086fad41d46929c053dbefd695706', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】被【确认】。\n是否需要扩繁：【否】\n 备注：【不要慌张】\n如有疑问，请联系【zhouhan@cibr.ac.cn】', '2020-07-30 01:58:43', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e6573b2bb47e413d96e741031dd8f42c', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-13 06:07:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e65dba0d735d480faffc44245ba23c5b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 15:59:49', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e69c223313664db59a1c144bbda01d05', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【2020-08-15】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-07-31 08:16:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e8cb2ae8c2d04856acd8cf4782ec5cf0', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 11:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e9ac6d1621b742dda46e014b0e5c054a', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 22:26:57', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('e9de819e0705467d9b0e3db321a4388a', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-08 00:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea667b6539e34fce9ac86718c6070b12', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：171693，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:51:44', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ea9e04771367441c9fa11bf714f39deb', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个使用申请任务被【拒绝】，原因【xxxxxasdfasdfasdfasd】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-07-29 09:33:33', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eadd2a03a8fb41e4bfb7fb23d0046f73', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 22:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eb523a6470814bda9b279521e3897a57', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 08:29:24', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ed7b3258766641d79ab82356e244e8ff', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-28 14:41:15', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('eddcc65a50274e8eabde33cbec868226', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 22:52:16', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('eeaf6a92d5c14099b8674ec685fbb315', 'zhouhan@cibr.ac.cn', 'asdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：778940，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:11:46', null, null, 'fail', '邮箱地址不存在！');
INSERT INTO `cibr_sys_email` VALUES ('ef4ec945d03c41d296c1adb9a00be5c9', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 12:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f00729ad3a5e4118ac1e3f3ce628f535', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【0】条，拒绝【3】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-04 09:06:23', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f0489d246cf74c47a02f76ad15ea592e', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，预计实验时间【null】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-11 03:14:12', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f08a971503ec482aab0492601b2d0fd5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-03 13:44:15', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f153c6ca58c2490b9b69a7e1c1c33ce3', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-03 17:14:35', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f2585b82ede14560bcc15703dd72f3e2', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 14:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f272b986fc324c9098773d74387a8e38', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 06:26:58', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f2b9998e55574994962a055f7cc194e5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-05 01:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f30877a216434884be05607bd79f2aae', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 07:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f56f64f7198d4404818d95b25868ec53', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '请求协助', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务，发起人【周晗】，请及时处理！\n\n\n感谢您使用资源管理平台！', '2020-09-02 15:26:00', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f5ecdabae6ec44359fba2f45552ff1f6', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '流程管理任务', '【北京脑科学与类脑研究中心】\n\n	您有一个【流程管理任务】待处理，请及时查看！\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-12 02:57:48', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f69f9cf368354970ad20551ab2cfa029', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-09-07 17:18:05', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f6cb326d66704df9b145bb92739de30d', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-06 15:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f72a538217854004a1aba6c9532a2c61', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-04 23:26:55', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f732526065054b3bb473ee8a46c82db8', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 18:52:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f8809310978a423a96cd26c901f6d22b', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【申请使用任务】待处理，申请人【周晗】,任务申请【！！！加急！！！】，请及时处理。\n\n\n感谢您使用资源管理平台！', '2020-08-17 03:23:25', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('f8b6bc4fcd9b4c1cb42955ddd70a6d2f', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-06 07:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('faa373e1f57d4236a029a713667da639', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:46:37', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fb0f3b88acbd4b1784c04631b670fc9c', 'zhouhan@cibr.ac.cn', 'sdf@cibr.ac.cn', '验证码', '【北京脑科学与类脑研究中心】验证码是：636576，有效期为1小时，欢迎您使用资源管理平台！', '2020-07-17 06:09:04', null, null, 'fail', 'Failed messages: javax.mail.SendFailedException: Invalid Addresses;\n  nested exception is:\n	com.sun.mail.smtp.SMTPAddressFailedException: 554 RCPT (sdf@cibr.ac.cn) dosn\'t exist');
INSERT INTO `cibr_sys_email` VALUES ('fb81d4a11dde44d7b05218ba318b80c5', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已准备完毕，请及时查看。\n如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-09-08 12:54:08', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fc63de9dd24f428dbf5d59f4080cbecd', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-05 16:26:56', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fccb0624c7c24a0d972d053f1f04b5b2', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '使用申请', '【北京脑科学与类脑研究中心】\n\n	您有一个【果蝇使用申请任务】已处理，其中：\n成功【1】条，拒绝【0】条。\n请及时查看！如有疑问，请联系【zhouhan@cibr.ac.cn】\n\n\n感谢您使用资源管理平台！', '2020-08-06 09:52:39', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fd13e0cee4c64d87b557ac433d3d42e9', 'zhouhan@cibr.ac.cn', '981436939@qq.com', '验证码', '【北京脑科学与类脑研究中心】验证码是：270010，有效期为1小时，欢迎您使用辅助平台！', '2020-07-08 08:00:17', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fda713bf221f4720ace4490c1e56a6a5', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '用户账号申请', '非常感谢，您的注册申请已收到。请耐心等待管理员审核，稍后将给您发送审核结果邮件，请注意查收。', '2020-08-10 08:22:47', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fdd9f7d510c34321b5eea8139bf52076', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-07 14:00:06', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('fe554bbc0c784dcf8d9d231cb5a474b8', 'zhouhan@cibr.ac.cn', 'zhouhan@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认，请联系【fengshuangshuang@cibr.ac.cn】。\n\n\n感谢您使用资源管理平台！', '2020-09-07 11:36:22', null, null, 'ok', null);
INSERT INTO `cibr_sys_email` VALUES ('ff72cf44da8044aa801c8ddcc99828d2', 'zhouhan@cibr.ac.cn', 'fengshuangshuang@cibr.ac.cn', '超时提醒', '【北京脑科学与类脑研究中心】\n\n	您有一个【请求协助】任务超过1小时未确认!申请人【周晗】\n\n\n感谢您使用资源管理平台！', '2020-09-08 02:52:17', null, null, 'ok', null);

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
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_file
-- ----------------------------
INSERT INTO `cibr_sys_file` VALUES ('0336130552c3460f9e1e0fbbbe64849b', 'e42c920990cd484a97a5585e91e1670fquss.xlsx', 'D:\\code\\fileUpload\\e42c920990cd484a97a5585e91e1670fquss.xlsx', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:10', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('05341cd846e14081ae384f305d4b4c00', '9e7ef830bf054fa890b57e1894854b7d样品制备 (5).xls', 'D:\\code\\fileUpload\\9e7ef830bf054fa890b57e1894854b7d样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:53:17', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('072b2f498f79434fa8122e6e38106c0a', '9f4bd7637f3d422c993402bfb7809455excel (2).xls', 'D:\\code\\fileUpload\\9f4bd7637f3d422c993402bfb7809455excel (2).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:32', 'd79b25fa485584780b7a71c9691c8a7f', 'excel (2).xls');
INSERT INTO `cibr_sys_file` VALUES ('0c95eab794ea4ec38db23badc3cc66e7', 'c905c7ef8087439fa88817a1054e8fde东方故事-生信分析 (4).xls', 'D:\\code\\fileUpload\\c905c7ef8087439fa88817a1054e8fde东方故事-生信分析 (4).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:23:07', '80fb2246f368b30872b8aa6ebce6b5b0', '东方故事-生信分析 (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('0e5e8cef38d44edfbf6bc1ee99f2acb3', '463b6d0f5ee74f229d54740a7b0c6ab5样品制备 (3) (1).xls', 'D:\\code\\fileUpload\\463b6d0f5ee74f229d54740a7b0c6ab5样品制备 (3) (1).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:19', 'd40deff98272c508d1f8ea1799dd0fda', '样品制备 (3) (1).xls');
INSERT INTO `cibr_sys_file` VALUES ('0ebf4bb9e4cb40a9b7bbe4ab0f2f82f9', '71427330a1af493db7a5b4c3dc50fa2d东方故事-生信分析 (4).xls', 'D:\\code\\fileUpload\\71427330a1af493db7a5b4c3dc50fa2d东方故事-生信分析 (4).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:24:16', '80fb2246f368b30872b8aa6ebce6b5b0', '东方故事-生信分析 (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('12c8191dd7bc43a98ff793abbf25c94b', '196256b29bb64d6fb102dd8b5f395958样品制备 (5).xls', 'D:\\code\\fileUpload\\196256b29bb64d6fb102dd8b5f395958样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:54:08', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('181b556dca224a40a864598aca6d6563', 'a8983cb76675425aa78218de60948f65东方故事-生信分析 (4).xls', 'D:\\code\\fileUpload\\a8983cb76675425aa78218de60948f65东方故事-生信分析 (4).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:24:48', '80fb2246f368b30872b8aa6ebce6b5b0', '东方故事-生信分析 (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('1c364899733a480db81365194142baaa', '09b9becfd1a94223bd966f97ae5994ef样品制备 (5).xls', 'D:\\code\\fileUpload\\09b9becfd1a94223bd966f97ae5994ef样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:52:34', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('1ffac87a8d544237be84aa358dda42b0', '81ba95ed4e3345ed8776fde6587c2684excel (10).xls', 'D:\\code\\fileUpload\\81ba95ed4e3345ed8776fde6587c2684excel (10).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:54:40', 'd5299182101b695f91575ebba8b12ff4', 'excel (10).xls');
INSERT INTO `cibr_sys_file` VALUES ('2341f243c0b248d0a5ecda03466e2c94', '50825772178e4738846396e51f0b4508excel (6).xls', 'D:\\code\\fileUpload\\50825772178e4738846396e51f0b4508excel (6).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:52:30', 'e35329810af87b4fed6fd55de1b10b8c', 'excel (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('26af3a76f4f840879bfaf941c5ae3160', 'c4fdc3a0d7de4ac8bd0cfc94e0767d04东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\c4fdc3a0d7de4ac8bd0cfc94e0767d04东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:19:51', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('2788c860622f49beafd239ab63df0520', '69fbaae083a4403e93b13d538640bb79样品制备 (6).xls', 'D:\\code\\fileUpload\\69fbaae083a4403e93b13d538640bb79样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:55:04', '93e1d87d89b4a1302fb110a7e1583f1b', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('29b299904115454bba26e6d74d7c4d6e', '82688d797b7d44e18d10d47d32a9ee77ExtExport.exe', 'D:\\code\\fileUpload\\82688d797b7d44e18d10d47d32a9ee77ExtExport.exe', 'e5f722a1da7a4e8b8933a92f49e8e25e', '00', '24f5851abc6444e79be718325025126f', '2020-09-09 16:33:57', '12ce491e105415b3d3d7a3b9d4253b92', 'ExtExport.exe');
INSERT INTO `cibr_sys_file` VALUES ('2bd87fe1e8b24f539d4509c9e6691269', '728cded4a3d24380848c3823928cf2bd东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\728cded4a3d24380848c3823928cf2bd东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:15:24', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('2d31d8f474974716a764de8b8fffcfc2', 'aaa01c3e9b23401c9e9c1def48496613样品制备 (6).xls', 'D:\\code\\fileUpload\\aaa01c3e9b23401c9e9c1def48496613样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:49:00', '069dd65f50f97144e01df62bae8def4c', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('32cef84b29834dcfb8c1c753b3255d37', '8c2985752fe649fabcd57b0b1d3dab36样品制备 (3).xls', 'D:\\code\\fileUpload\\8c2985752fe649fabcd57b0b1d3dab36样品制备 (3).xls', '5419e823127b4f09ba7c06af30383cf5', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 17:41:19', '6c5e731989ae3a16e3630621a3fe50b7', '样品制备 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('346961caf4574f3eab5ed7b43fa83ac1', '3ef14e7d292149b19bab6f4c228cda30chrome.exe', 'D:\\code\\fileUpload\\3ef14e7d292149b19bab6f4c228cda30chrome.exe', '9abd2dfe90e14b5ab17f57e213426e52', '00', '24f5851abc6444e79be718325025126f', '2020-09-14 10:01:39', 'b2e5665591b2118ca13709f61b60d700', 'chrome.exe');
INSERT INTO `cibr_sys_file` VALUES ('3bc3141e25fc4eb2b86603ecd9fee2e8', '846f926b93f8410b8a707dc95e4a6d48excel (4).xls', 'D:\\code\\fileUpload\\846f926b93f8410b8a707dc95e4a6d48excel (4).xls', 'b4b98a9f239645e080d74accff097de0', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:57:11', '48bbc6ea665e4675ee3ded1dcdd0bcbb', 'excel (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('3c39b9570e914d09a9784ff80481a70a', 'ecd136ef6b584ddebb20a50500afb0d1样品制备 (6).xls', 'D:\\code\\fileUpload\\ecd136ef6b584ddebb20a50500afb0d1样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:51:04', '069dd65f50f97144e01df62bae8def4c', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('3ca2b29b0e7f4d298e7646813eddbd79', '5decdf8fb18348beb9d05ea21b4777ec样品制备 (5).xls', 'D:\\code\\fileUpload\\5decdf8fb18348beb9d05ea21b4777ec样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:59:22', '13fe5d1cc8e90a17189db35517977ff4', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('3d0fd80e6b1841c6af8157d32ef1242f', 'b2ad20e1d6594fd383c077c3971910eb实验动物准备和反馈管理系统.xlsx', 'D:\\code\\fileUpload\\b2ad20e1d6594fd383c077c3971910eb实验动物准备和反馈管理系统.xlsx', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:20:24', '69d0d2323ba9f1700cfa06799d8d7a8c', '实验动物准备和反馈管理系统.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('40331cd04dcf4d31a08a0fb388135ed4', '0a69f8f5edb949f7af982b053bb1406e东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\0a69f8f5edb949f7af982b053bb1406e东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:23:01', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('40927c5aff3f4e51a6cd2dc262abc926', 'eb4daffca1244715980cbd5dfed09133样品制备 (6).xls', 'D:\\code\\fileUpload\\eb4daffca1244715980cbd5dfed09133样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 15:39:02', '93e1d87d89b4a1302fb110a7e1583f1b', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('4446c249499743a2928cb60744bf28f7', 'd76ba569dbd04a19a0198c38c0cf45cf东方故事-测序分析 (2).xls', 'D:\\code\\fileUpload\\d76ba569dbd04a19a0198c38c0cf45cf东方故事-测序分析 (2).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 12:32:12', 'a29591e59ecd236396dbafd1a84e5ae5', '东方故事-测序分析 (2).xls');
INSERT INTO `cibr_sys_file` VALUES ('47fb35b42f4543f99541077c340adecb', '8ed657dc0fe9479e848ff578662c02ddHabib.SM.pdf', 'D:\\code\\fileUpload\\8ed657dc0fe9479e848ff578662c02ddHabib.SM.pdf', '9abd2dfe90e14b5ab17f57e213426e52', '00', '24f5851abc6444e79be718325025126f', '2020-09-14 10:01:39', '631e8711eb36fa71a72b5fa1904a376a', 'Habib.SM.pdf');
INSERT INTO `cibr_sys_file` VALUES ('48379186d6e644e9a37f1a62784eab2c', '5c6606864bf244d8b88b7a04437c677f样品制备 (6).xls', 'D:\\code\\fileUpload\\5c6606864bf244d8b88b7a04437c677f样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 15:38:47', '93e1d87d89b4a1302fb110a7e1583f1b', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('4839834cabab44de8247eede00a700eb', '60daf6332d22481f88581da7ce045e37样品制备 (5).xls', 'D:\\code\\fileUpload\\60daf6332d22481f88581da7ce045e37样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:51:42', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('4ad4d0c6d3c443d5a3c3f3300c03a8bf', '5ab348f8ff8240bf9a3e6aeb75ad0aeaexcel (9).xls', 'D:\\code\\fileUpload\\5ab348f8ff8240bf9a3e6aeb75ad0aeaexcel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 17:18:24', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('4ce8899f9b01454a8007ba9b04fe9ba1', 'fb16da5627f94b21ac6cd79ff770c805东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\fb16da5627f94b21ac6cd79ff770c805东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:19:55', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('4fb5e6abc7a74541b277344099f8a3df', 'dd70cef3352d49789054f0f66bfa668aquss.xlsx', 'D:\\code\\fileUpload\\dd70cef3352d49789054f0f66bfa668aquss.xlsx', 'e5f722a1da7a4e8b8933a92f49e8e25e', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 09:25:16', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('5bd89ab4e46e4cec8ee8ac7d48274ddc', 'e55fce99d1eb45ec90eabfc976c8a602样本录入-细胞-xxx.xlsx', 'D:\\code\\fileUpload\\e55fce99d1eb45ec90eabfc976c8a602样本录入-细胞-xxx.xlsx', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 09:26:55', '7adb7bfe63a30a2bef40e21f99437c2f', '样本录入-细胞-xxx.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('5cca5c6137d748d89b6a7db3e9c66ca2', 'debb4e332fe24cbfb535d57bc0fdb9dfexcel (6).xls', 'D:\\code\\fileUpload\\debb4e332fe24cbfb535d57bc0fdb9dfexcel (6).xls', 'b4b98a9f239645e080d74accff097de0', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:57:11', 'e35329810af87b4fed6fd55de1b10b8c', 'excel (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('669db67f5a90434db3789f12501f557d', '1e28aa4b8a9b43a38fcb2a7f8d03c6f3quss.xlsx', 'D:\\code\\fileUpload\\1e28aa4b8a9b43a38fcb2a7f8d03c6f3quss.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-09-10 17:36:48', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('67fab6745491410d955904528af875f3', 'ceb7fe7a751840f591e3db82d9113623样品制备 (5).xls', 'D:\\code\\fileUpload\\ceb7fe7a751840f591e3db82d9113623样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:50:29', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('695ebacadedb428b8d465b02dcaaaedf', '40f5a5cb89aa483ca29728e45c74c921样品制备 (5).xls', 'D:\\code\\fileUpload\\40f5a5cb89aa483ca29728e45c74c921样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:55:40', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('69649ef2dc6346f8b0c78d357a921261', '0b10e89e5f304908adb1695bfbba6df9样品制备 (5).xls', 'D:\\code\\fileUpload\\0b10e89e5f304908adb1695bfbba6df9样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:51:35', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('6be00b4d4e7c4a299d9072abab9c40cf', 'a3e818c22b2e4a7e813556b4444ca9b4样品制备 (5).xls', 'D:\\code\\fileUpload\\a3e818c22b2e4a7e813556b4444ca9b4样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:58:30', '13fe5d1cc8e90a17189db35517977ff4', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('6c9d6f7854ea481cbf5c67bc03dd84c7', '54a5bdc33f084cdeb8aef84f9cfefb5e东方故事-生信分析 (1).xls', 'D:\\code\\fileUpload\\54a5bdc33f084cdeb8aef84f9cfefb5e东方故事-生信分析 (1).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:11:14', '7098b51b1a30f8e98a7b8c32ac6a8650', '东方故事-生信分析 (1).xls');
INSERT INTO `cibr_sys_file` VALUES ('6ea79d8852c242f3874e6e597b0ee9d8', 'ed6c2e51bb874182acc1e140648589f1excel (10).xls', 'D:\\code\\fileUpload\\ed6c2e51bb874182acc1e140648589f1excel (10).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:54:02', 'c70c5117bbfd527b1c818767c7d73be2', 'excel (10).xls');
INSERT INTO `cibr_sys_file` VALUES ('767ecc6a945d42b79a8f0c1887fbfd4f', '467302e836e5456194d34bc9eda980e4excel (9).xls', 'D:\\code\\fileUpload\\467302e836e5456194d34bc9eda980e4excel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 16:01:29', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('7adbb7ca15ae4b4787fc237c439a0678', '72f33842badf44e6bbcf81b9fed8cf70样品制备 (5).xls', 'D:\\code\\fileUpload\\72f33842badf44e6bbcf81b9fed8cf70样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:53:47', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('81fc713fb84149149943a8834cfdd03f', '8906826b563141b18d005523c669f770东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\8906826b563141b18d005523c669f770东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:19:42', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('834937c47e304a96a6fe6c0fc0b7b633', '4e66fcf390cc41ed8d8c769fee2e0209quss.xlsx', 'D:\\code\\fileUpload\\4e66fcf390cc41ed8d8c769fee2e0209quss.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-09-10 17:38:40', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('870b346d9cca42ebb3eafe89df28f4d5', '849be12f79a2446d98b29b014efbfae5东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\849be12f79a2446d98b29b014efbfae5东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:20:05', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('8b64c3bd2afb4774b4ddc4fbf38b8fab', '0a704d509313413386fcbb922eae0da0JsonView.exe', 'D:\\code\\fileUpload\\0a704d509313413386fcbb922eae0da0JsonView.exe', '9abd2dfe90e14b5ab17f57e213426e52', '00', '24f5851abc6444e79be718325025126f', '2020-09-14 10:01:39', '3f0429876803219f3f74210eec6093c3', 'JsonView.exe');
INSERT INTO `cibr_sys_file` VALUES ('8e42c6ae5b57456a8d90a161b9ce53fb', '9325106fba364dd3b88dc52379d16fc5样品制备 (5).xls', 'D:\\code\\fileUpload\\9325106fba364dd3b88dc52379d16fc5样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:52:59', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('9d3bea4836a34d86a31aa17c5ddb2f95', '3f8fc6e896a44b4e839cb149f11093adexcel (12).xls', 'D:\\code\\fileUpload\\3f8fc6e896a44b4e839cb149f11093adexcel (12).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:58:36', 'e061aca1a8665fef0468856baf0d56b5', 'excel (12).xls');
INSERT INTO `cibr_sys_file` VALUES ('a392f6be239a4690abe9d4217d650e6a', 'ea3ad35776734e0db0e7a91cfab465e3东方故事-测序分析 (2).xls', 'D:\\code\\fileUpload\\ea3ad35776734e0db0e7a91cfab465e3东方故事-测序分析 (2).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 12:32:23', 'a29591e59ecd236396dbafd1a84e5ae5', '东方故事-测序分析 (2).xls');
INSERT INTO `cibr_sys_file` VALUES ('a40f133785964812a775980fc146f4d7', 'acccb540063b430abd864933f39cb0cdexcel (11).xls', 'D:\\code\\fileUpload\\acccb540063b430abd864933f39cb0cdexcel (11).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:53:46', 'e4780c9f2b32dce1d7d9f63d1c1ac0f5', 'excel (11).xls');
INSERT INTO `cibr_sys_file` VALUES ('a461f2d037a44dbcbf6e0825937a39a9', '18b25e8749684975b228e06e2fe4b8e0excel (8).xls', 'D:\\code\\fileUpload\\18b25e8749684975b228e06e2fe4b8e0excel (8).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:53:52', '754eb6f6532ceb85cdf64d1f444c8749', 'excel (8).xls');
INSERT INTO `cibr_sys_file` VALUES ('a4bce469814d44bc880ea45e31eb6f2e', 'd778fe3703c94cba87cae2edf1fb3bf2东方故事-生信分析 (4).xls', 'D:\\code\\fileUpload\\d778fe3703c94cba87cae2edf1fb3bf2东方故事-生信分析 (4).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:54', '3036c17272a03ca8a29279fe8bd54dc0', '东方故事-生信分析 (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('a8e5a51f487347dbad634dd68fb1c1d6', '21b7b247f2e14170b85ec5a2f040178aexcel (9).xls', 'D:\\code\\fileUpload\\21b7b247f2e14170b85ec5a2f040178aexcel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 15:59:37', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('aa45e26f01a342cb84b956eb5ab1f718', 'b7d345389f9c4d51861121170f9c7a5aexcel (9).xls', 'D:\\code\\fileUpload\\b7d345389f9c4d51861121170f9c7a5aexcel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 17:07:47', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('af4e48e83d924c1d8bda0a6ab67d3d32', 'bcb49d66aa5a4776a24e488009b24e79hmmapi.dll', 'D:\\code\\fileUpload\\bcb49d66aa5a4776a24e488009b24e79hmmapi.dll', 'e5f722a1da7a4e8b8933a92f49e8e25e', '00', '24f5851abc6444e79be718325025126f', '2020-09-09 16:34:35', 'd6a972142a39cf9e77faf2a91a84afe6', 'hmmapi.dll');
INSERT INTO `cibr_sys_file` VALUES ('af81e765ad504874b8df69dc0e712d5f', 'bc5b5b51d9c44e37a9d412d8de58ad36东方故事-测序分析 (2).xls', 'D:\\code\\fileUpload\\bc5b5b51d9c44e37a9d412d8de58ad36东方故事-测序分析 (2).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 12:22:26', 'a29591e59ecd236396dbafd1a84e5ae5', '东方故事-测序分析 (2).xls');
INSERT INTO `cibr_sys_file` VALUES ('b101c2af70fb4ad695d2f87d8dbb4076', '3d138ed320a84e138d9b56e64808b421样品制备 (5).xls', 'D:\\code\\fileUpload\\3d138ed320a84e138d9b56e64808b421样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:56:47', '4aa8877ba41e044c2ce8b39fb519a41a', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('b1cd21b07feb405e8a8caec496d316ba', '2056afeba5e246489300759b08ebb38f样品制备 (5).xls', 'D:\\code\\fileUpload\\2056afeba5e246489300759b08ebb38f样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:55:35', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('b238ebebc8c84a46bbb1693d98fcc14c', '6493ad825f48416bbf9cdc81f36f190a样品制备 (6).xls', 'D:\\code\\fileUpload\\6493ad825f48416bbf9cdc81f36f190a样品制备 (6).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 13:01:51', '9caf4fa5ac0c06a2b0443b54d9520861', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('b3ddb565105c48cc9c98fc740527cb1d', '624e887e0af84e0783210c5b05548a3a东方故事-生信分析 (4).xls', 'D:\\code\\fileUpload\\624e887e0af84e0783210c5b05548a3a东方故事-生信分析 (4).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:17:30', 'c5c9233655b1eb305c267b62cb3543b2', '东方故事-生信分析 (4).xls');
INSERT INTO `cibr_sys_file` VALUES ('ba024a465c364d98a3506e5a0e89f9f6', 'c2f6c42de91941ae9527d0a977cd21be东方故事文库制备.xls', 'D:\\code\\fileUpload\\c2f6c42de91941ae9527d0a977cd21be东方故事文库制备.xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:38', 'f21d9bdde73f412341927c06da4badc5', '东方故事文库制备.xls');
INSERT INTO `cibr_sys_file` VALUES ('c09d834acb224bba926a3ea324a4f74a', 'cc7025babfe84724a10b6d2dadfa3467东方故事文库制备 (1).xls', 'D:\\code\\fileUpload\\cc7025babfe84724a10b6d2dadfa3467东方故事文库制备 (1).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:40', '26f3fec9e02692862d524e91fd57406d', '东方故事文库制备 (1).xls');
INSERT INTO `cibr_sys_file` VALUES ('c176f22e82ac4e3aa231b5cac4af825b', 'a0f14fa8f2cc47b0a754c03d91e53b4bquss.xlsx', 'D:\\code\\fileUpload\\a0f14fa8f2cc47b0a754c03d91e53b4bquss.xlsx', '2268006eff0c4d04adcb7cf4eca362ef', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 17:41:04', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('c2fc4afb3cf94a63a65a5c174607ab36', 'b952c6dbd9b34dcf98e5a6376876a007quss (1).xlsx', 'D:\\code\\fileUpload\\b952c6dbd9b34dcf98e5a6376876a007quss (1).xlsx', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:20:20', '40c71b712079049b2b9a3583ce1993ab', 'quss (1).xlsx');
INSERT INTO `cibr_sys_file` VALUES ('c4d4e1e71a3c478fa46cfa181c1be2d8', '30aa54a2fbec44b39369739cdb68d8a3excel (6).xls', 'D:\\code\\fileUpload\\30aa54a2fbec44b39369739cdb68d8a3excel (6).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:49:10', 'e9c0769255142e335aff5c4ffdf120f6', 'excel (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('c78f0db1061e4f2aa5b14f78c1e5e930', '52c543bcd05b451a816847ed0a0196b0quss.xlsx', 'D:\\code\\fileUpload\\52c543bcd05b451a816847ed0a0196b0quss.xlsx', null, '00', '24f5851abc6444e79be718325025126f', '2020-09-10 17:38:25', '40c71b712079049b2b9a3583ce1993ab', 'quss.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('cd065325fe0546ec899aaddac6e948bb', '8589e6ba656240b9825f4602d7e63abfexcel (9).xls', 'D:\\code\\fileUpload\\8589e6ba656240b9825f4602d7e63abfexcel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('d1986a6869d44807b08189d28551d4e5', '58a78c8babb947bfbb453338f0e421e9东方故事-测序分析 (1).xls', 'D:\\code\\fileUpload\\58a78c8babb947bfbb453338f0e421e9东方故事-测序分析 (1).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:12', '5dd32b36ff97b2c992c75e01e5edbdbe', '东方故事-测序分析 (1).xls');
INSERT INTO `cibr_sys_file` VALUES ('d2db5a12f9fb4a409dc01cdacc91b7eb', 'f18252e975cb4b0aa2a3b709d9ec5ab1东方故事-测序分析.xls', 'D:\\code\\fileUpload\\f18252e975cb4b0aa2a3b709d9ec5ab1东方故事-测序分析.xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:22:35', '66043030e65e1e7d7cb1f28e8e117410', '东方故事-测序分析.xls');
INSERT INTO `cibr_sys_file` VALUES ('d3ecda82d55643e89f8caa5ee81a51e1', '3fd53eff072540029a8e1baaf4b17a66iexplore.exe', 'D:\\code\\fileUpload\\3fd53eff072540029a8e1baaf4b17a66iexplore.exe', '9abd2dfe90e14b5ab17f57e213426e52', '00', '24f5851abc6444e79be718325025126f', '2020-09-14 10:01:39', '2ee1c17ba0344e6e58c572f52660d1f3', 'iexplore.exe');
INSERT INTO `cibr_sys_file` VALUES ('d51c7491500148ef9fbf30f0c57c2c66', '1a0094b68c9648d5a7c317cc9e6ec257excel (7).xls', 'D:\\code\\fileUpload\\1a0094b68c9648d5a7c317cc9e6ec257excel (7).xls', 'b4b98a9f239645e080d74accff097de0', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:57:11', 'f1dc718060562ea6d761d36336be3820', 'excel (7).xls');
INSERT INTO `cibr_sys_file` VALUES ('dba86488306040619ab40da9ce431103', '0485798ec25444f1b08857c822256320样品制备 (6).xls', 'D:\\code\\fileUpload\\0485798ec25444f1b08857c822256320样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:49:34', '069dd65f50f97144e01df62bae8def4c', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('ddf4dd0bf5a848e4b4162172c533e518', '2d7f1e134ee44baf8a48221a9988e5efexcel (6).xls', 'D:\\code\\fileUpload\\2d7f1e134ee44baf8a48221a9988e5efexcel (6).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:49:39', 'e9c0769255142e335aff5c4ffdf120f6', 'excel (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('e09cf68539c24058987d6c978ac620df', '506027711b9c4918a3b11d23ac6c2201样品制备 (6).xls', 'D:\\code\\fileUpload\\506027711b9c4918a3b11d23ac6c2201样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:54:36', '93e1d87d89b4a1302fb110a7e1583f1b', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('e311a00ad07a4262ad219924458542d6', '78929124084d4e95816c42ec390e6ff5excel (5).xls', 'D:\\code\\fileUpload\\78929124084d4e95816c42ec390e6ff5excel (5).xls', 'b4b98a9f239645e080d74accff097de0', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:57:11', 'c2c76ca9d4207043891f6b10ceb9d075', 'excel (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('e5d03ba5478a4e39b374fe0e9cb4d126', '725e38f2892e4d09a3a5a8068305e0d9excel (8).xls', 'D:\\code\\fileUpload\\725e38f2892e4d09a3a5a8068305e0d9excel (8).xls', 'b4b98a9f239645e080d74accff097de0', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:57:11', '754eb6f6532ceb85cdf64d1f444c8749', 'excel (8).xls');
INSERT INTO `cibr_sys_file` VALUES ('e65d7ae78a24404da32af50138ec8542', '0b0c5a16c79a4ca9a737e1b1ee5307fc41587_2015_BFnbt3055_MOESM6_ESM.pdf', 'D:\\code\\fileUpload\\0b0c5a16c79a4ca9a737e1b1ee5307fc41587_2015_BFnbt3055_MOESM6_ESM.pdf', '9abd2dfe90e14b5ab17f57e213426e52', '00', '24f5851abc6444e79be718325025126f', '2020-09-14 10:01:39', 'ad6cc3dbe7f9f28f8c4f4e5f48250afd', '41587_2015_BFnbt3055_MOESM6_ESM.pdf');
INSERT INTO `cibr_sys_file` VALUES ('e7ad4268941246bcbfab2d22d0c51195', '084239a8a37b43eeb1db1005d70e3a1c样品制备 (6).xls', 'D:\\code\\fileUpload\\084239a8a37b43eeb1db1005d70e3a1c样品制备 (6).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 14:55:40', '93e1d87d89b4a1302fb110a7e1583f1b', '样品制备 (6).xls');
INSERT INTO `cibr_sys_file` VALUES ('e91dcd8fb29f400b881b9f977bcbc237', '9b8330b4c46f4a2faed724805fe4f8e6excel (9).xls', 'D:\\code\\fileUpload\\9b8330b4c46f4a2faed724805fe4f8e6excel (9).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-15 16:19:03', '2d3864b5617f54bf442132dad31f2226', 'excel (9).xls');
INSERT INTO `cibr_sys_file` VALUES ('ebb24a9be50041bb98cbac87ed77d9ae', 'af7ad9b6e1db4fbd8008672075d1fd0c东方故事-测序分析.xls', 'D:\\code\\fileUpload\\af7ad9b6e1db4fbd8008672075d1fd0c东方故事-测序分析.xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:20:16', '66043030e65e1e7d7cb1f28e8e117410', '东方故事-测序分析.xls');
INSERT INTO `cibr_sys_file` VALUES ('ecc30c0069484b58bd57b609a46b28ee', 'ee7fdb8bad964e83876ed86bce86ec9a东方故事-测序分析 (2).xls', 'D:\\code\\fileUpload\\ee7fdb8bad964e83876ed86bce86ec9a东方故事-测序分析 (2).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 12:32:42', 'f9dd025748579fd24f3fa724d19c6570', '东方故事-测序分析 (2).xls');
INSERT INTO `cibr_sys_file` VALUES ('f0183d9b27424336a985cfcc7cc52c40', '930a198b2d394cb1b0ef27f4dd099192样本录入-细胞-xxx.xlsx', 'D:\\code\\fileUpload\\930a198b2d394cb1b0ef27f4dd099192样本录入-细胞-xxx.xlsx', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 09:26:06', '7adb7bfe63a30a2bef40e21f99437c2f', '样本录入-细胞-xxx.xlsx');
INSERT INTO `cibr_sys_file` VALUES ('f4f0d3ad79f640969b9fa3b4bbde132a', '6f723a4bb352432d9347580ac9c207dd样品制备 (5).xls', 'D:\\code\\fileUpload\\6f723a4bb352432d9347580ac9c207dd样品制备 (5).xls', '5f26f248dfaa4cf19b32eb8ca93441cf', '00', '24f5851abc6444e79be718325025126f', '2020-09-10 12:55:27', '281f7c1c081f5400cae1049a46b3cfff', '样品制备 (5).xls');
INSERT INTO `cibr_sys_file` VALUES ('f5e10c2fa63d41d8a49efb8a941e0d29', '0cee1978824c4380a78dffb120424cdf东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\0cee1978824c4380a78dffb120424cdf东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:19:14', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('fa82e3d9c75f4fcb996f1175cd5a1909', 'c668eb645794453783613da656e5e67f东方故事-生信分析 (3).xls', 'D:\\code\\fileUpload\\c668eb645794453783613da656e5e67f东方故事-生信分析 (3).xls', 'c458ec1953ab4e028468287ff12e0085', '00', '24f5851abc6444e79be718325025126f', '2020-09-11 13:13:24', '08ba6fe4fedb2213322ba7a09ac69882', '东方故事-生信分析 (3).xls');
INSERT INTO `cibr_sys_file` VALUES ('fd5400f16dfc4a6a9ebd751a8ef303d6', 'c750f1fb3e5f42acb4c14461084a9a07excel (6).xls', 'D:\\code\\fileUpload\\c750f1fb3e5f42acb4c14461084a9a07excel (6).xls', 'f140fa4241804d72adf0305d82479487', '00', '24f5851abc6444e79be718325025126f', '2020-09-13 13:50:09', 'e35329810af87b4fed6fd55de1b10b8c', 'excel (6).xls');

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
-- Table structure for cibr_sys_sampleindex
-- ----------------------------
DROP TABLE IF EXISTS `cibr_sys_sampleindex`;
CREATE TABLE `cibr_sys_sampleindex` (
  `name` varchar(255) NOT NULL,
  `curTime` varchar(255) NOT NULL,
  `currentIndex` int(11) NOT NULL,
  PRIMARY KEY (`name`,`curTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_sys_sampleindex
-- ----------------------------
INSERT INTO `cibr_sys_sampleindex` VALUES ('NC', '2009', '56');
INSERT INTO `cibr_sys_sampleindex` VALUES ('ND', '2009', '28');
INSERT INTO `cibr_sys_sampleindex` VALUES ('NDO', '2009', '14');
INSERT INTO `cibr_sys_sampleindex` VALUES ('NR', '2009', '14');
INSERT INTO `cibr_sys_sampleindex` VALUES ('NRO', '2009', '14');
INSERT INTO `cibr_sys_sampleindex` VALUES ('ZNC', '2009', '3');
INSERT INTO `cibr_sys_sampleindex` VALUES ('ZND', '2009', '1');
INSERT INTO `cibr_sys_sampleindex` VALUES ('ZNR', '2009', '6');

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
INSERT INTO `cibr_sys_task` VALUES ('05902edfae274525afe117c9c18e7069', '04', '2020-09-03 13:44:15', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:01:25', '撒旦法');
INSERT INTO `cibr_sys_task` VALUES ('0fb5ea50582746d9918205060c841212', '01', '2020-09-13 16:19:14', 'b42163179d7444ab804ecefb7706abee', '02', '24f5851abc6444e79be718325025126f', '2020-09-13 16:19:33', null);
INSERT INTO `cibr_sys_task` VALUES ('124e04e8b3814e77b11c8afe62b02181', '04', '2020-09-03 13:51:27', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:01:13', '谁发的发生大啊');
INSERT INTO `cibr_sys_task` VALUES ('14f73010e70e49979ba42b1b0e99f730', '04', '2020-09-02 15:28:24', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 16:30:15', null);
INSERT INTO `cibr_sys_task` VALUES ('15b15722d303408b8818aa2857243c47', '02', '2020-09-07 17:18:05', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-07 17:22:36', '');
INSERT INTO `cibr_sys_task` VALUES ('26f8fab583f0460abe9d4817e38e5f64', '04', '2020-09-13 17:55:46', '24f5851abc6444e79be718325025126f', '03', 'b42163179d7444ab804ecefb7706abee', '2020-09-13 17:56:36', '已过期');
INSERT INTO `cibr_sys_task` VALUES ('39196d90a6c5457b97c945895ffa0bb3', '02', '2020-09-02 17:13:56', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:16:38', '都是');
INSERT INTO `cibr_sys_task` VALUES ('3bc1fa8305bf474aa62f1240c18043e6', '02', '2020-09-08 15:49:58', '24f5851abc6444e79be718325025126f', '03', 'f326dfd1f7504de9b1f624ba107fe7da', '2020-09-08 15:56:02', null);
INSERT INTO `cibr_sys_task` VALUES ('3fc959fc3ec243d0869fb1c05d148964', '04', '2020-09-03 14:10:15', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:01:02', '撒地方法撒旦是打发');
INSERT INTO `cibr_sys_task` VALUES ('44d9e48b5cb14730ba083eace1602519', '04', '2020-09-03 14:10:12', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:01:06', null);
INSERT INTO `cibr_sys_task` VALUES ('547ac98d3a3e45b79a4ab04a47344e2a', '04', '2020-09-02 16:44:49', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:00:42', null);
INSERT INTO `cibr_sys_task` VALUES ('57ac977a959e4c27ac88287dfbc30771', '03', '2020-08-31 15:52:37', '24f5851abc6444e79be718325025126f', '01', '24f5851abc6444e79be718325025126f', null, '全都有');
INSERT INTO `cibr_sys_task` VALUES ('5cab63a867324c72939f7ff3eeecbdff', '02', '2020-09-03 17:11:23', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 17:14:47', '');
INSERT INTO `cibr_sys_task` VALUES ('60e3db93d6fa4ec9b5810d611730f1b8', '04', '2020-09-08 11:11:33', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 12:53:34', 'dsffds');
INSERT INTO `cibr_sys_task` VALUES ('759d6c52eb0c420e9a54ea7542bbd445', '04', '2020-09-13 16:52:08', '24f5851abc6444e79be718325025126f', '03', 'b42163179d7444ab804ecefb7706abee', '2020-09-13 16:55:09', null);
INSERT INTO `cibr_sys_task` VALUES ('75a90dba16bc49afa9f21b059d18a192', '04', '2020-09-08 11:07:34', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 11:08:11', null);
INSERT INTO `cibr_sys_task` VALUES ('7ac3e3d607b94be498adb0ea696c9b74', '04', '2020-09-03 14:10:46', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:00:44', null);
INSERT INTO `cibr_sys_task` VALUES ('8b9b55ad840c4ab093b0400fce9e9642', '02', '2020-09-02 17:03:14', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:04:14', '发送到');
INSERT INTO `cibr_sys_task` VALUES ('8da76f76196e47c09ce83efa68a28a00', '02', '2020-09-08 11:15:15', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 12:54:12', '');
INSERT INTO `cibr_sys_task` VALUES ('8dec4e8b01434a21b32507a31ce7af36', '04', '2020-09-13 17:04:55', '24f5851abc6444e79be718325025126f', '03', 'b42163179d7444ab804ecefb7706abee', '2020-09-13 17:55:31', 'cvx');
INSERT INTO `cibr_sys_task` VALUES ('8edfa1d877b64fcf937be60b138a3521', '04', '2020-09-13 16:19:46', '24f5851abc6444e79be718325025126f', '03', 'b42163179d7444ab804ecefb7706abee', '2020-09-13 16:46:35', null);
INSERT INTO `cibr_sys_task` VALUES ('aa8f78a01de241fe8aeb0b47d8bb198a', '04', '2020-09-04 18:36:19', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-13 16:54:14', null);
INSERT INTO `cibr_sys_task` VALUES ('af355eb1e9194c329f2886f6c143f1f5', '04', '2020-09-03 14:10:42', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:00:53', '不服输的辅导报告是否都不舒服登不上');
INSERT INTO `cibr_sys_task` VALUES ('c89d799622fc4f49a7bfc371b6d79407', '02', '2020-09-02 17:02:10', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:02:39', '啊是');
INSERT INTO `cibr_sys_task` VALUES ('c8a1ba58903e46daa3c6c86547941399', '04', '2020-09-08 11:10:34', '24f5851abc6444e79be718325025126f', '03', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 12:53:44', 'sdf');
INSERT INTO `cibr_sys_task` VALUES ('e4ecd42d1ad8418c8851477b2c901f52', '01', '2020-09-03 14:43:28', '803b03de703047d788f10e47b6e8a649', '02', '24f5851abc6444e79be718325025126f', '2020-09-03 14:43:56', null);
INSERT INTO `cibr_sys_task` VALUES ('ff7cde9ac73644548f0722aefeb1bc55', '04', '2020-09-03 13:47:02', '24f5851abc6444e79be718325025126f', '02', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-04 16:01:18', null);

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
INSERT INTO `cibr_sys_task_business` VALUES ('4b5f5fa5901445e38c7f41475978b514', '5cab63a867324c72939f7ff3eeecbdff', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-03 17:11:23', '创建');
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
INSERT INTO `cibr_sys_task_business` VALUES ('a9b7149345dd4cb184bcbc2a2e3d9764', '8da76f76196e47c09ce83efa68a28a00', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-08 11:15:15', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('ac0b412b2f074fa0811fb8eae4ca92e6', 'e4ecd42d1ad8418c8851477b2c901f52', '24f5851abc6444e79be718325025126f', '01', '02', '2020-09-03 14:43:56', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('b4afabdae49842e297f6b975aabcf458', 'f0e1b0bc922f467b8caf4fcc1dce4f64', '24f5851abc6444e79be718325025126f', '01', '02', '2020-08-11 03:08:51', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('b682b15300614d3ea157b8ba0aa43049', '05031e48adcb42a19966a59963f6ab81', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 10:02:49', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('b7a6d3eeecb34e2dbd6cf5fb86698ba1', '7f07103e0a9f49dfa1e5e8c4b89a7048', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-06 10:16:48', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('bf980a3291a240aab05b13966ddc9978', 'b60dc07081f340cb9ca5c8508b6139b8', '5646848a54754bbe833eba1c681cbe02', '00', '01', '2020-08-02 07:13:52', '创建');
INSERT INTO `cibr_sys_task_business` VALUES ('c154a6f0e7a94aab8bbed1b4dda9471f', '7d25b0e4f6de45438149d391dc57130a', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-28 14:41:14', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('cbb54ef704c840e18ac1303c279b2cc6', '0fb5ea50582746d9918205060c841212', '24f5851abc6444e79be718325025126f', '01', '02', '2020-09-13 16:19:33', '同意注册');
INSERT INTO `cibr_sys_task_business` VALUES ('d4eb8b2c88f246209ce446e0f9302c09', '4ac66818c9b64194ae6e03ba8e177ac9', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:27:02', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('e611c4feba344707a0569bbc2866bc12', 'fb4cecb953a44e9bb04fceebbe45de3e', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:31:44', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('ea1a25b6dc9c4d0f9ba8148857e55c14', 'a62f0979034e4bcca4bb28333b2a0a1b', '5646848a54754bbe833eba1c681cbe02', '01', '03', '2020-08-07 07:28:47', '拒绝注册申请');
INSERT INTO `cibr_sys_task_business` VALUES ('ec153762f4484ef29e985b069b0317ad', 'ede893ae25844bc3b5fa999cf133552b', '24f5851abc6444e79be718325025126f', '01', '01', '2020-08-13 05:45:16', '创建流程管理任务');
INSERT INTO `cibr_sys_task_business` VALUES ('fb84233cd6b4409381867556c25b8ca3', '15b15722d303408b8818aa2857243c47', '24f5851abc6444e79be718325025126f', '00', '01', '2020-09-07 17:18:05', '创建');
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
INSERT INTO `cibr_sys_user` VALUES ('24f5851abc6444e79be718325025126f', '周晗', '91ffbe5d7a6e6889261fc2d932369311', 'zhouhan@cibr.ac.cn', '9', 'D:\\code\\fileUpload\\userhead\\24f5851abc6444e79be718325025126f.jpg', '2', '2020-08-10 15:29:19');
INSERT INTO `cibr_sys_user` VALUES ('803b03de703047d788f10e47b6e8a649', '曲素素', '0b7c1d73c15b36d9e5702fed0443a812', 'qususu@cibr.ac.cn', '9', null, '2', '2020-09-03 14:43:28');
INSERT INTO `cibr_sys_user` VALUES ('b42163179d7444ab804ecefb7706abee', '冯爽爽', '91ffbe5d7a6e6889261fc2d932369311', 'fengshuangshuang@cibr.ac.cn', '9', null, '2', '2020-09-13 16:19:14');
INSERT INTO `cibr_sys_user` VALUES ('dccfb59887c84e689aa7c62d3e42479d', '马原', 'fa944bc6646289268283e5219eba4fd1', 'mayuan@cibr.ac.cn', '9', null, '2', '2020-09-08 10:18:28');
INSERT INTO `cibr_sys_user` VALUES ('f326dfd1f7504de9b1f624ba107fe7da', '高园', 'fb8fc25ed21447846fb08bbe01adc3d0', 'gaoyuan@cibr.ac.cn', '9', null, '2', '2020-09-08 10:30:26');

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
INSERT INTO `cibr_sys_user_role` VALUES ('803b03de703047d788f10e47b6e8a649', 'c3a8f79ff69d48169f70f8776f42f29b');
INSERT INTO `cibr_sys_user_role` VALUES ('asdfasdfasdf', 'ae07ed379d3540e984d4e9392d9ff4ba');
INSERT INTO `cibr_sys_user_role` VALUES ('b42163179d7444ab804ecefb7706abee', 'c6884a69548c4c3588b74ee85486818f');
INSERT INTO `cibr_sys_user_role` VALUES ('dccfb59887c84e689aa7c62d3e42479d', 'c3a8f79ff69d48169f70f8776f42f29b');
INSERT INTO `cibr_sys_user_role` VALUES ('f326dfd1f7504de9b1f624ba107fe7da', 'c6884a69548c4c3588b74ee85486818f');

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
INSERT INTO `cibr_sys_verification` VALUES ('007ea0266fa04d7f9bd9a969abe9b3f3', 'zhouhan@cibr.ac.cn', '262278', '2020-09-04 18:09:34');
INSERT INTO `cibr_sys_verification` VALUES ('03abba3baea8404f824d20d457d91a1f', 'fengshuangshuang@cibr.ac.cn', '265654', '2020-07-24 01:27:56');
INSERT INTO `cibr_sys_verification` VALUES ('04e8f3ecf24b400689f8375712046100', 'zhouhan@cibr.ac.cn', '858161', '2020-09-04 18:42:30');
INSERT INTO `cibr_sys_verification` VALUES ('0c2908edefb74929832a1171b332154c', 'fengshuangshuang@cibr.ac.cn', '695869', '2020-08-07 02:24:07');
INSERT INTO `cibr_sys_verification` VALUES ('0d13f6ed41494b70b99280925084c312', 'zhouhan@cibr.ac.cn', '222568', '2020-07-17 06:42:46');
INSERT INTO `cibr_sys_verification` VALUES ('0e180023df734d59933f446e86625f38', 'qususu@cibr.ac.cn', '954870', '2020-08-07 07:27:47');
INSERT INTO `cibr_sys_verification` VALUES ('1392f29511694438bb9d045f0883e992', 'zhouhan@cibr.ac.cn', '930327', '2020-09-11 14:23:33');
INSERT INTO `cibr_sys_verification` VALUES ('17127c4b4090449485a1217ebaf272ac', 'zhouhan@cibr.ac.cn', '461030', '2020-08-10 07:24:57');
INSERT INTO `cibr_sys_verification` VALUES ('2e73f25c36414284ae256bb3722c80d6', 'zhouhan@cibr.ac.cn', '108624', '2020-09-11 16:03:04');
INSERT INTO `cibr_sys_verification` VALUES ('412961b9d53847378e8845408292ebbd', 'fengshuangshuang@cibr.ac.cn', '253167', '2020-09-13 16:19:03');
INSERT INTO `cibr_sys_verification` VALUES ('4bd0dca6d3ca4fc0802bf267af4af0cb', 'zhouhan@cibr.ac.cn', '763212', '2020-09-11 14:21:02');
INSERT INTO `cibr_sys_verification` VALUES ('4e05d97365c2435399c729831623075a', 'zhouhan@cibr.ac.cn', '242890', '2020-09-04 18:09:14');
INSERT INTO `cibr_sys_verification` VALUES ('59218617711245f2bb4c664f72266f76', 'zhouhan@cibr.ac.cn', '270839', '2020-07-17 06:13:47');
INSERT INTO `cibr_sys_verification` VALUES ('5e1fc2d495ef47419c5510f598e56e92', 'zhouhan@cibr.ac.cn', '145232', '2020-09-04 18:26:59');
INSERT INTO `cibr_sys_verification` VALUES ('79d0ec4679c74d4598756ec89c845df9', 'qususu@cibr.ac.cn', '501281', '2020-09-03 14:43:20');
INSERT INTO `cibr_sys_verification` VALUES ('7f0074949a7241eeac1a7ed420ff9b9e', 'fengshuangshuang@cibr.ac.cn', '727477', '2020-08-10 08:22:41');
INSERT INTO `cibr_sys_verification` VALUES ('7fc2353ce2924cb39a2639fadac25ee4', 'zhouhan@cibr.ac.cn', '351717', '2020-09-11 14:19:06');
INSERT INTO `cibr_sys_verification` VALUES ('85730e61b4d246188b6195bea43021f9', 'sdf@cibr.ac.cn', '242006', '2020-07-17 06:07:15');
INSERT INTO `cibr_sys_verification` VALUES ('929ce5ee4f0440709c136c90a578bdb8', 'zhou@cibr.ac.cn', '488425', '2020-07-17 06:06:38');
INSERT INTO `cibr_sys_verification` VALUES ('92ede932756e4c639b2afb9f6ca21cfd', 'zhouhan@cibr.ac.cn', '152486', '2020-07-10 03:15:22');
INSERT INTO `cibr_sys_verification` VALUES ('aa2391922cd0488499128f83683f45f3', 'fengshuangshuang@cibr.ac.cn', '810322', '2020-08-07 08:44:21');
INSERT INTO `cibr_sys_verification` VALUES ('b494c8db959f4ef581a2abdaac5a0cca', 'zhouhan@cibr.ac.cn', '822841', '2020-09-04 18:42:18');
INSERT INTO `cibr_sys_verification` VALUES ('bf253f53557341f1861ace1249284959', 'zhou@cibr.ac.cn', '538332', '2020-07-17 05:56:30');
INSERT INTO `cibr_sys_verification` VALUES ('c31e5e9318e04e81bb843f68bcf5b6a2', 'fengshuangshuang@cibr.ac.cn', '575503', '2020-08-07 08:47:13');
INSERT INTO `cibr_sys_verification` VALUES ('d3402b3968d44fbc88f503daf5746e1e', 'zhouhan@cibr.ac.cn', '751835', '2020-07-10 03:18:55');
INSERT INTO `cibr_sys_verification` VALUES ('dab65aba390d426e94e2b4843bb49f5c', 'zhouhan@cibr.ac.cn', '176002', '2020-09-04 18:07:38');
INSERT INTO `cibr_sys_verification` VALUES ('dbff726b89d746fcbd9d639e1c57e0c3', 'zhouhan@cibr.ac.cn', '927711', '2020-07-10 03:35:25');
INSERT INTO `cibr_sys_verification` VALUES ('e44d9625dcc642aabe3f8eb7a08feb40', 'sdf@cibr.ac.cn', '636576', '2020-07-17 06:09:43');
INSERT INTO `cibr_sys_verification` VALUES ('efba1d600c3d462a89933ebf18cb118a', 'zhouhan@cibr.ac.cn', '352853', '2020-09-04 18:04:50');

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
INSERT INTO `cibr_task_ask_confirm` VALUES ('6d4fe83bed6d44b4b6a8379c94b77c39', '713cf5fd026e4791b4a7214692b03162', '2020-09-03 17:14:47', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('6e587e42cc6045e6a6f15a47cc395549', 'a767c2aa84d0463096f8dfc9d9cf66ab', '2020-08-06 10:00:35', '5646848a54754bbe833eba1c681cbe02', 'N', '打撒所多');
INSERT INTO `cibr_task_ask_confirm` VALUES ('7e0227ab1e84487abb1b15d884704e18', 'c4e2efb915ba4eeb837e53a0e44eec9e', '2020-09-02 17:04:02', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('9c078deaa73c488f9698845076a4b1fd', 'ad1683e3a219443d8d2edb8aabb188a3', '2020-09-07 17:22:35', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('9f59950da61743efadf576647cfd31b1', 'efa3b5f8da9e4fa1adc796471c2a3afa', '2020-08-10 04:49:37', '5646848a54754bbe833eba1c681cbe02', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('a52dcaeca2a5477badd4fb2a3f09d4cd', 'd04a1e487459447bad148f34825cd90f', '2020-09-08 15:56:02', '24f5851abc6444e79be718325025126f', 'N', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('aab41aeeb9804b4eb281d7191f35d76b', '276ff6636e814faf82b141c5c2e6f1e3', '2020-09-02 17:16:38', '24f5851abc6444e79be718325025126f', 'Y', '');
INSERT INTO `cibr_task_ask_confirm` VALUES ('c689eaea2c214ac8b4bca8eb0b31cc89', '731d8733a8904b21ac19bcde6e8fa8cf', '2020-08-06 10:13:00', '5646848a54754bbe833eba1c681cbe02', 'Y', '是打发斯蒂芬');
INSERT INTO `cibr_task_ask_confirm` VALUES ('d6f4fd1e5ff8416e91f0be7796d6937f', '5372961d768e47c383987f5097f3bc41', '2020-09-08 12:54:12', '24f5851abc6444e79be718325025126f', 'Y', '');

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
INSERT INTO `cibr_task_ask_director` VALUES ('03e7f27ea91547ad8a18321b1a215db9', '3d692eebfac6436cb2ad2417d03f07b3', '803b03de703047d788f10e47b6e8a649', '2020-09-08 15:34:50', '00');
INSERT INTO `cibr_task_ask_director` VALUES ('0f2714a42c6e46af92833b1c683f3c9a', 'a13e1427b8e04399ad240166173c3644', '803b03de703047d788f10e47b6e8a649', '2020-09-03 17:11:23', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('1142f3b76995457694ac985bf98e35c8', 'e3ec20e7d76848afbf5b33a5d28101ce', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-06 10:16:48', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('140102c537d5439ab47b000d1b7eb090', 'c46c8414424f4c09bb5dc7a0e3929906', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 10:02:49', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('150b6d2ce1934f44a8999df1f13fe7cb', '97d2daf442de4b05ba60c3aa38b4535f', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:16:21', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('2096016942cb4362a2611b323208447c', '9c781839091d4b30953fc6d25a77b5cc', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-17 03:07:01', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('250b17e69b994675ab71bfebf01b735c', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', '803b03de703047d788f10e47b6e8a649', '2020-09-08 15:49:58', '00');
INSERT INTO `cibr_task_ask_director` VALUES ('26609d65ca97429484c71a52a8c1d372', '4f9633aaa4634981a496ff9a1be89562', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:02:10', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('463f94b319d14843b68bbe87460f9cb4', '05567077ecfd4db2b29c379487bd760a', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:55:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('4d0ff890b64547c18caef1d416560c49', '6b49d0cbfb994137b8cd6612d075c9b8', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-02 17:13:56', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('551446827ee24bb080a7e2a7611b1962', 'd90a131f0a8f4b5985d0692566b50ae3', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 07:34:09', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('557c94e381714095af2d08140e24307a', '09caab7200c14d5cba56ea7aa0ad43ca', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-08 11:15:15', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('55a7183dec714b1c89cb8b3882ef81a3', 'e567f2c2abf244f386e89cece32faa5b', '803b03de703047d788f10e47b6e8a649', '2020-09-08 15:36:37', '00');
INSERT INTO `cibr_task_ask_director` VALUES ('5791f82de7324914bffdeb3bb56839fa', '4ce07456d6104e85ae808fb955b25c13', 'bf85f70d4a9e4ew32bef5b3eb67450', '2020-08-02 09:56:46', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5bde1921e5794f499827d22a5e53d61a', '9aeea58cf85146959dccf540259c72d4', '53dc21f8cc214c11a13ca57fa27f3146', '2020-08-11 03:13:56', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('5df7684a9714430cbdfa3ee580e62664', 'd9ea42853c594a428c063541bfe97b2c', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-07 17:18:05', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('67e6cb9e167c4d548d06074454e2d29c', 'a4680b1e35b8419db01494dd1318d96e', 'bf85f70d4a9e4d42b32ba67450', '2020-08-02 07:42:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6b594046a02641ef98293da29eed9bda', '1bb4b0fea5ab4984a5f86b62926d3902', 'bf85f70d4a9e4d42beb3eb67450', '2020-08-02 09:22:04', '0');
INSERT INTO `cibr_task_ask_director` VALUES ('6ecd621177fe4e31b1cecbd2f09faa99', 'a13e1427b8e04399ad240166173c3644', '53dc21f8cc214c11a13ca57fa27f3146', '2020-09-03 17:11:23', '0');
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
INSERT INTO `cibr_task_ask_drosophila` VALUES ('09caab7200c14d5cba56ea7aa0ad43ca', '24f5851abc6444e79be718325025126f', '2020-09-08 11:15:15', '', '', '8da76f76196e47c09ce83efa68a28a00', '05', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('1bb4b0fea5ab4984a5f86b62926d3902', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 09:22:04', '', '', '3b0a1f1aa7704f3bb667e34c6c4d8eca', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('2e70ad94a5884116b3fd26aa3138a095', '24f5851abc6444e79be718325025126f', '2020-08-17 03:07:52', '', '1', '9af537668d4c4d8c98abe58a9bc3705f', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('3d692eebfac6436cb2ad2417d03f07b3', '24f5851abc6444e79be718325025126f', '2020-09-08 15:34:50', null, null, '20aca01ec2e146f28baf185e268b50d4', '00', 'f326dfd1f7504de9b1f624ba107fe7da');
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
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a13e1427b8e04399ad240166173c3644', '24f5851abc6444e79be718325025126f', '2020-09-03 17:11:23', '', '1', '5cab63a867324c72939f7ff3eeecbdff', '08', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a4680b1e35b8419db01494dd1318d96e', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:42:04', '', '1', '8ab46708113045a092e332a580c144bb', '08', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('a965c30a8db14018922ee7cd04d93713', '24f5851abc6444e79be718325025126f', '2020-08-17 03:23:25', '', '1', 'd1c5853e992f48d2a28aceb3fede26b4', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('c46c8414424f4c09bb5dc7a0e3929906', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 10:02:49', 'asdfsa', '1', '05031e48adcb42a19966a59963f6ab81', '04', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('c7ea35eb68fd4aef9fefd055fcb4ea7f', '24f5851abc6444e79be718325025126f', '2020-09-08 15:49:58', null, null, '3bc1fa8305bf474aa62f1240c18043e6', '08', 'f326dfd1f7504de9b1f624ba107fe7da');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('d90a131f0a8f4b5985d0692566b50ae3', '5646848a54754bbe833eba1c681cbe02', '2020-08-02 07:34:09', 'asdfasdf', '1', '43065aaabaa14bfaab2e027a4caecdfa', '00', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('d9ea42853c594a428c063541bfe97b2c', '24f5851abc6444e79be718325025126f', '2020-09-07 17:18:05', '', '', '15b15722d303408b8818aa2857243c47', '08', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('ddd48327bf3942b7989ceae14f447bce', '24f5851abc6444e79be718325025126f', '2020-08-17 03:12:27', '', '1', '1f8c28a63676417c9c2d3194a158feb8', '00', '53dc21f8cc214c11a13ca57fa27f3146');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('e3ec20e7d76848afbf5b33a5d28101ce', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:16:48', '从V型从V型从V型从V型', '1', '7f07103e0a9f49dfa1e5e8c4b89a7048', '06', '29a9c57a44b94b869b58893356a8444b');
INSERT INTO `cibr_task_ask_drosophila` VALUES ('e567f2c2abf244f386e89cece32faa5b', '24f5851abc6444e79be718325025126f', '2020-09-08 15:36:37', null, null, 'f854cd1dad7e4ee7a2df89ce968607fa', '00', 'f326dfd1f7504de9b1f624ba107fe7da');

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
INSERT INTO `cibr_task_ask_prepare` VALUES ('5372961d768e47c383987f5097f3bc41', '24f5851abc6444e79be718325025126f', '2020-09-08 11:15:40', 'Y', '2020-09-08 00:00:00', '2020-10-31 00:00:00', '', '2020-09-08 00:00:00', '2', '2', '2020-09-10 00:00:00', '', '2020-09-08 12:54:08', '24f5851abc6444e79be718325025126f', '09caab7200c14d5cba56ea7aa0ad43ca', 'b0bf580f711846ebaa3510f8edde050e', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('713cf5fd026e4791b4a7214692b03162', '24f5851abc6444e79be718325025126f', '2020-09-03 17:14:20', 'N', null, null, '', '2020-09-03 00:00:00', '1', '1', '2020-09-10 00:00:00', '', '2020-09-03 17:14:35', '24f5851abc6444e79be718325025126f', 'a13e1427b8e04399ad240166173c3644', '2d2f5f6a08e548b4a5cc4322dca9ed32', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('731d8733a8904b21ac19bcde6e8fa8cf', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:12:40', 'Y', '2020-08-12 16:00:00', '2020-08-19 16:00:00', '萨达', '2020-08-26 16:00:00', '1', '0', '2020-08-30 16:00:00', '', '2020-08-06 10:12:50', '5646848a54754bbe833eba1c681cbe02', '7943476691744fed8ba40aa182be75eb', 'bd8cbb6fd90d461cb10e75669de38c49', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('86853143e2714d6f9840f30bb2f4e9f8', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:42', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '44', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '444', '2020-08-06 08:38:51', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'f11b0e199de04f9ab0ff27f534f92c58', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('9aed4413d02c414580cb875226deb2d2', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:27', 'Y', '2020-08-12 16:00:00', '2020-08-13 16:00:00', '阿斯顿发', '2020-08-13 16:00:00', '1', '0', '2020-08-11 16:00:00', '', '2020-08-07 08:37:36', '5646848a54754bbe833eba1c681cbe02', 'e3ec20e7d76848afbf5b33a5d28101ce', 'c8498c747317477ebac49e3784df9a0c', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a767c2aa84d0463096f8dfc9d9cf66ab', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 09:59:26', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '从V型下次编程序', '2020-08-05 16:00:00', '1', '0', '2020-08-20 16:00:00', '', '2020-08-06 09:59:37', '5646848a54754bbe833eba1c681cbe02', 'a4680b1e35b8419db01494dd1318d96e', 'e3c5cc7ac0194f4980f76badeca3e3a9', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('a8777b96cb6a47b69087292df18dcca6', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:31', 'Y', '2020-08-06 16:00:00', '2020-08-12 16:00:00', '22', '2020-08-05 16:00:00', '1', '0', '2020-08-26 16:00:00', '222', '2020-08-06 08:39:00', '5646848a54754bbe833eba1c681cbe02', '1bb4b0fea5ab4984a5f86b62926d3902', 'b9690d93ae924c39b5435bcf217ec09a', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('ad1683e3a219443d8d2edb8aabb188a3', '24f5851abc6444e79be718325025126f', '2020-09-07 17:18:17', 'N', null, null, '', '2020-09-17 00:00:00', '1', '1', '2020-09-08 00:00:00', '', '2020-09-07 17:22:25', '24f5851abc6444e79be718325025126f', 'd9ea42853c594a428c063541bfe97b2c', '2752af42c31c43e4986984d8de9a9b5e', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('b385cfb9832f4a09a65357076cdb7783', '24f5851abc6444e79be718325025126f', '2020-08-17 02:03:19', 'Y', '2020-08-16 16:00:00', '2020-08-17 16:00:00', '', '2020-08-16 16:00:00', '1', '0', '2020-08-17 16:00:00', '', '2020-08-17 02:24:00', '24f5851abc6444e79be718325025126f', '97d2daf442de4b05ba60c3aa38b4535f', '2ab13b67223144198711c1fb043700fe', '02');
INSERT INTO `cibr_task_ask_prepare` VALUES ('c15e67c0775b404cae0ffe7644c0bbc5', '5646848a54754bbe833eba1c681cbe02', '2020-08-05 17:31:14', 'Y', '2020-08-05 17:31:14', '2020-08-05 17:31:14', '', '2020-08-19 16:00:00', '1', '0', '2020-08-05 16:00:00', '', '2020-08-06 08:01:16', '5646848a54754bbe833eba1c681cbe02', '4ce07456d6104e85ae808fb955b25c13', '128f2f7a93c24be5a8a25e6098ad8377', '03');
INSERT INTO `cibr_task_ask_prepare` VALUES ('c4e2efb915ba4eeb837e53a0e44eec9e', '24f5851abc6444e79be718325025126f', '2020-09-02 17:03:28', 'Y', '2020-09-10 00:00:00', '2020-09-15 00:00:00', '', '2020-09-09 00:00:00', '1', '0', '2020-09-23 00:00:00', '', '2020-09-02 17:03:47', '24f5851abc6444e79be718325025126f', '4f1779e5cf2c4fb9959ce4670b7dc985', '2d2934fa96ef449297785ae4935b0919', '04');
INSERT INTO `cibr_task_ask_prepare` VALUES ('d04a1e487459447bad148f34825cd90f', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:25', 'Y', '2020-09-08 00:00:00', '2020-09-16 00:00:00', '', '2020-09-16 00:00:00', '1', '1', '2020-09-23 00:00:00', '', '2020-09-08 15:55:54', '24f5851abc6444e79be718325025126f', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', '35b28eaaac424138b173333d8ea4fceb', '04');
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
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2752af42c31c43e4986984d8de9a9b5e', 'd9ea42853c594a428c063541bfe97b2c', '2020-09-07 17:18:05', '2020-09-23 00:00:00', null, '7287f5b1fa9546f9a91dba277c2c66f0', null, 'dsf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('279ce680b6cf4401870381f8de4816ec', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-13 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2ab13b67223144198711c1fb043700fe', '97d2daf442de4b05ba60c3aa38b4535f', '2020-08-11 03:16:21', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2d2934fa96ef449297785ae4935b0919', '4f1779e5cf2c4fb9959ce4670b7dc985', '2020-09-02 17:03:14', '2020-09-25 00:00:00', null, '2eadac9568e1477ebff2c12fae2f067e', null, '萨芬的', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('2d2f5f6a08e548b4a5cc4322dca9ed32', 'a13e1427b8e04399ad240166173c3644', '2020-09-03 17:11:23', '2020-09-18 00:00:00', null, '7287f5b1fa9546f9a91dba277c2c66f0', null, '个', 'Y', 'male', 'Y', '230238e4d1824c38887161dab1c452b5', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('35b28eaaac424138b173333d8ea4fceb', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-11 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4d373970d8e54f0eaef8201ad5d87c70', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4e32733c6afd463ea7869a39960c93f4', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', 'c22a901311684a0296f760db82b98', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('4eb668d9a5544b7bb6247c319290c6a6', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-10 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('54d7d40ab9c547bcb362d3854a8d88c0', '2e70ad94a5884116b3fd26aa3138a095', '2020-08-17 03:07:52', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('54fb3ff0c3ce409db31a5e321a320384', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8e5fscc5ea0d3727', null, 's', 'Y', 'male', 'N', '', 'N', '', '2', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('5f03c6434e6b4d15b98a019cad8adb95', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:41', '2020-08-22 00:00:00', null, 'b9e7d8eewrea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('610977008802465d9cd922fe759be926', '9c781839091d4b30953fc6d25a77b5cc', '2020-08-17 03:07:01', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('624f6fa9d353478882b3a286d68a63ee', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-09 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6279629a9354445d9fb178446519f53f', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e5fscc5ea0d3727', null, 'asdf', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('63f2996069eb4928930f4968bbb6ff65', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-09 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6ef188e489c04ec4bde94ce830001aad', 'c46c8414424f4c09bb5dc7a0e3929906', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdfasdf', 'N', 'female', 'Y', '94faab0f15174c43bsdceba1b62fcd', 'Y', 'asdf', '1', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('6f91f2ece86c49adb6dc8c9e9c8bf3ed', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-10 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('73b8a4b252de46479709b9c09021fe45', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8eewrea0d3727', null, 'asdfaf', 'Y', 'male', 'N', '', 'N', '', '0', '123', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7548611c0126490d8b2f6b51a14607ba', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-14 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7aad4ddd43a6496fa3cf2bc59b161c8c', '4ce07456d6104e85ae808fb955b25c13', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'Y', '94faab0f15174c43bdsdceba1b62fcd', 'Y', '特殊sss', '1', '3', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7beff4abb7ab4d6e95020fc29d025535', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:42', '2020-08-22 00:00:00', null, 'b9e7d8e5asdf7cc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('7f3bfaba24954ee4a2c2935a31acf697', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-13 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('843ba175c4d94e41b9261aeb1dfe9149', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-12 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86a00acb524a4fa996d9e3805ce0bc29', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'asdfasdf', 'Y', 'male', 'N', '', 'N', '', '2', '2', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('86d5c6722f8f4abaa1b89ec261075580', '5b59b0f8c73a48e3a1a0e5da3bcb9aa2', '2020-08-11 03:18:25', '2020-08-25 16:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8792766f9c2a4ba18cd7efaeba5790a4', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e5fq5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '3', '32', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('885f68678df6483285a85b69c3e95c43', '4f9633aaa4634981a496ff9a1be89562', '2020-09-02 17:02:10', '2020-09-18 00:00:00', null, '25d94157865b49a5ae749d7e48a7142b', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8999c1dd33b14b53be95096b1e240d2a', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-14 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8b43983262ad4ec5abde02c8db98e744', '9aeea58cf85146959dccf540259c72d4', '2020-08-11 03:13:56', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('8f9ee3210fdd43abb2089e46fc45a889', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-15 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('924c154d02e74ea3b98687b3f1442de1', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-14 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('958df693b5df47f9a4ac1d214c08e732', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7adf672a3737cc5ea0d3727', null, 'sad', 'Y', 'male', 'N', '', 'N', '', '0', '234', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('9b1d9d532a654f75a8bfc7d17f932db7', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5ds5ea0d3727', null, 'sadf', 'Y', 'male', 'N', '', 'N', '', '0', '23', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('9ea0ec2fb6c349e292dff4a495b2ab8b', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-15 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a08206be36634d61911c4ce8d063dae3', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '0', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('a9b0bba5640e4de0aa2f1f67b67707b6', '6537f9ab4cc24fbda95ce1f4f8c9386b', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sadfa', null, 'male', 'N', '', 'N', '', '1', '1', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b0bf580f711846ebaa3510f8edde050e', '09caab7200c14d5cba56ea7aa0ad43ca', '2020-09-08 11:15:15', '2020-09-23 00:00:00', null, '7287f5b1fa9546f9a91dba277c2c66f0', null, 'dgfad', 'Y', 'male', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b13b1d07d63449a081b898e51c7d97b0', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-10 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b17b40f58dcf44399ef353917daf4077', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-12 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b1f238edc4ae425793164f5392ccb93d', '9725728474a64cb58f47ad4fd5a71341', '2020-08-21 07:09:07', '2020-09-04 16:00:00', null, 'b9e7d8e5fq5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '1', '1', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b20e8726c2714da1ab01fe90782158f3', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-08 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b3e6cbc9850548e2bae593df41e9ec71', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:43', '2020-08-22 00:00:00', null, 'b9e7d8e54cba4672a3737cc5ea0d3727', null, 'sdfasdf', 'Y', 'male', 'N', '', 'N', '', '0', '3', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('b9690d93ae924c39b5435bcf217ec09a', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7dqefq4672a3737cc5ea0d3727', null, 'sdaf', 'Y', 'male', 'N', '', 'N', '', '0', '132', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bbaea521ab0b4db2a4cc281a19513f42', '05567077ecfd4db2b29c379487bd760a', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e54cba46asdf737cc5ea0d3727', null, 'asdf', 'Y', 'female', 'N', '', 'N', '', '0', '2', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bc21068ffee24109a522f237ace4f8f9', 'ddd48327bf3942b7989ceae14f447bce', '2020-08-17 03:12:27', '2020-09-01 16:00:00', null, 'b9e7asd4cba4672a3737cc5ea0d3727', null, '阿斯顿发', 'Y', 'male', 'N', '', 'N', '', '1', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bd8cbb6fd90d461cb10e75669de38c49', '7943476691744fed8ba40aa182be75eb', '2020-08-07 16:34:46', '2020-08-22 00:00:00', null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('bdd41e82177b495b935e41b468e1c55a', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-13 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('c8498c747317477ebac49e3784df9a0c', 'e3ec20e7d76848afbf5b33a5d28101ce', '2020-08-07 16:34:44', '2020-08-22 00:00:00', null, 'b9e7d8e5ds5ea0d3727', null, '阿萨德饭是', 'Y', 'male', 'N', '', 'N', '', '0', '1', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ca29868aaee8450eac4ebfd8d6fe82ec', 'e567f2c2abf244f386e89cece32faa5b', null, '2020-09-11 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ce263378fa18445e8d5c11b88bd26cb9', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-09 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('d573da7d68f8453d874f30b5c8ed53a3', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-11 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-002', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('dbedd59ab60a4d78b582ec6efe160a05', 'd90a131f0a8f4b5985d0692566b50ae3', '2020-08-03 11:12:09', '2020-08-03 11:12:09', null, 'b9e7adf672a3737cc5ea0d3727', null, 's', 'Y', 'male', 'Y', '94faab0f15174c4adeba1b62fcd', 'Y', 'xcvzxcv', '3', '4', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ddf1cec7c4e64f8fab4ae6ae3d9d8c4f', '428580b8b28b414397f044e0d2e19ca4', '2020-08-11 03:14:12', null, null, 'b9e7dqefq4672a3737cc5ea0d3727', null, 'asdf', 'Y', 'male', 'N', '', 'N', '', '0', '2', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('e76f92403b8449d7bfc6d32d8ddee1e3', '6b49d0cbfb994137b8cd6612d075c9b8', '2020-09-02 17:13:56', '2020-09-24 00:00:00', null, '25d94157865b49a5ae749d7e48a7142b', null, '暗室逢灯', 'Y', 'male', 'N', '', 'N', '', '0', '3', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('e9505ddcc3884bbe9b85427f4f7244f8', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fq5ea0d3727', null, 'sdfva', 'Y', 'male', 'N', '', 'N', '', '0', '32', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('eb26ac9223af4fc5b3c899edd412ce6d', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-08 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('eb561122a8e244908bbc8a82d3f28b8c', 'c7ea35eb68fd4aef9fefd055fcb4ea7f', null, '2020-09-12 00:00:00', null, 'c31c3086132143e588d08c7ef64f1b39', null, '药物实验-ATXcurve2-003', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '02');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('ed04310f58b44f4da10f424ddea656d1', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-08 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-001', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('f11b0e199de04f9ab0ff27f534f92c58', '1bb4b0fea5ab4984a5f86b62926d3902', '2020-08-03 11:12:09', '2020-08-03 11:12:09', '', 'b9e7d8e5fscc5ea0d3727', null, 'sadfa', 'Y', 'male', 'N', '', 'N', '', '0', '23', '01');
INSERT INTO `cibr_task_detail_drosophila` VALUES ('fdaa8661b9b14ee09723d81f337cc8e9', '3d692eebfac6436cb2ad2417d03f07b3', null, '2020-09-15 00:00:00', null, '6d6d8c56f0304b7faf816229177d3696', null, '药物实验-ATXcurve2-004', 'Y', 'male', 'N', '', 'N', '无', '3.0', '36.0', '00');

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
INSERT INTO `cibr_task_fail` VALUES ('0382694537ee4df7b5b5ec2721ca7406', '7548611c0126490d8b2f6b51a14607ba', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:45', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('066a8f9bf2ef4109b2683a0339c7a983', 'eb26ac9223af4fc5b3c899edd412ce6d', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:54', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('11cd3400cee54791ac3381f89bb21df8', '350a1fa9890a4d919fa6370bfc3e1a10', '24f5851abc6444e79be718325025126f', '2020-09-10 17:42:17', '二位', '');
INSERT INTO `cibr_task_fail` VALUES ('172350ee8c97403dae988f8320147797', '05902edfae274525afe117c9c18e7069', '24f5851abc6444e79be718325025126f', '2020-09-04 16:01:25', '撒旦法', '');
INSERT INTO `cibr_task_fail` VALUES ('18c4b9efb0db4ec08e97752a68e0e830', '7beff4abb7ab4d6e95020fc29d025535', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:11', '是打发斯蒂芬', null);
INSERT INTO `cibr_task_fail` VALUES ('193ad479fc544317a877230c066d7832', 'eb561122a8e244908bbc8a82d3f28b8c', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:57', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('216cae829abe49b7ad8ce793f5429480', 'af355eb1e9194c329f2886f6c143f1f5', '24f5851abc6444e79be718325025126f', '2020-09-04 16:00:53', '不服输的辅导报告是否都不舒服登不上', '');
INSERT INTO `cibr_task_fail` VALUES ('23e1a3654d8b43c886ad9c16c1fd424c', 'c8a1ba58903e46daa3c6c86547941399', '24f5851abc6444e79be718325025126f', '2020-09-08 12:53:44', 'sdf', '');
INSERT INTO `cibr_task_fail` VALUES ('26dc939f45bc4693a6b7b63b9c9efed1', 'a9b0bba5640e4de0aa2f1f67b67707b6', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:23', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('2d5d52816d514ce88b23251f1300f927', 'b3e6cbc9850548e2bae593df41e9ec71', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 08:36:20', '是打发斯蒂芬', null);
INSERT INTO `cibr_task_fail` VALUES ('300b54d954e4411d92f666d1e5f58b70', '4e32733c6afd463ea7869a39960c93f4', '5646848a54754bbe833eba1c681cbe02', '2020-08-03 05:58:04', 'asdfsadfsdasdfafsda34', null);
INSERT INTO `cibr_task_fail` VALUES ('324a4477aeee4b1fbc65a5507da10f64', '6279629a9354445d9fb178446519f53f', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:13', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('3352f52a46984df0af61a18e9999291b', '26f8fab583f0460abe9d4817e38e5f64', 'system', '2020-09-13 17:56:36', '已过期', null);
INSERT INTO `cibr_task_fail` VALUES ('425da8fea97f4b829306aa94668f259b', 'd0b71c9561534875b7dcceee8a43dd1a', '24f5851abc6444e79be718325025126f', '2020-09-09 17:32:46', 'dsfsd', '');
INSERT INTO `cibr_task_fail` VALUES ('429bda70c0044bbd8c407451932e50eb', '958df693b5df47f9a4ac1d214c08e732', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:17', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('4a1e5415ff3b4eabadbd05616c7822d4', 'a08206be36634d61911c4ce8d063dae3', '5646848a54754bbe833eba1c681cbe02', '2020-08-04 09:06:19', 'fhdsgshfgh', null);
INSERT INTO `cibr_task_fail` VALUES ('53a8b54a84b643f1b5c849494f4b7bef', '60e3db93d6fa4ec9b5810d611730f1b8', '24f5851abc6444e79be718325025126f', '2020-09-08 12:53:34', 'dsffds', '');
INSERT INTO `cibr_task_fail` VALUES ('600881ea47294aac8bf02822214561bb', '68b6c73a8d36477d891edfd81615d128', '24f5851abc6444e79be718325025126f', '2020-09-14 10:00:49', 'ffffs', '');
INSERT INTO `cibr_task_fail` VALUES ('61ee5c50d9794fbbab9773c6c2ee70e5', '4d373970d8e54f0eaef8201ad5d87c70', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:04', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('6a0372d571514392bee089f933901441', '73b8a4b252de46479709b9c09021fe45', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:09', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('72c187f252c94d129de324d6708e8ccb', '8dec4e8b01434a21b32507a31ce7af36', '24f5851abc6444e79be718325025126f', '2020-09-13 17:55:31', 'cvx', '');
INSERT INTO `cibr_task_fail` VALUES ('7dd4b3bfff494326a0e4f42e4451eac5', 'd0b71c9561534875b7dcceee8a43dd1a', '24f5851abc6444e79be718325025126f', '2020-09-09 15:30:27', 'SDASDF', '');
INSERT INTO `cibr_task_fail` VALUES ('845c37a000c94c7a9ae34339a1cd4127', '3fc959fc3ec243d0869fb1c05d148964', '24f5851abc6444e79be718325025126f', '2020-09-04 16:01:02', '撒地方法撒旦是打发', '威风威风');
INSERT INTO `cibr_task_fail` VALUES ('84ecdfc1ea7545b7b533cc1a65e1f50f', '78e30547065d40c2ad10417300913af8', '24f5851abc6444e79be718325025126f', '2020-09-09 15:22:33', 'dsasdf', '');
INSERT INTO `cibr_task_fail` VALUES ('9496fe8c801c487ab2c849381c83ec4e', '7f3bfaba24954ee4a2c2935a31acf697', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:48', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('9754980297c5492195b0aa7724839792', '86a00acb524a4fa996d9e3805ce0bc29', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 08:37:12', 'sadfasdfsadfsaedf', null);
INSERT INTO `cibr_task_fail` VALUES ('b4ab5336c6ff4cfb85536815082950c8', 'a62f0979034e4bcca4bb28333b2a0a1b', '5646848a54754bbe833eba1c681cbe02', '2020-08-07 07:28:47', '的说法是打发', '撒的发生的啊');
INSERT INTO `cibr_task_fail` VALUES ('c52590d1526f4fd098dde555c2f493da', '54fb3ff0c3ce409db31a5e321a320384', '5646848a54754bbe833eba1c681cbe02', '2020-08-06 10:17:06', '撒旦法师打发', null);
INSERT INTO `cibr_task_fail` VALUES ('c664c071ffce4f9aafac374c37cc109f', 'd0b71c9561534875b7dcceee8a43dd1a', '24f5851abc6444e79be718325025126f', '2020-09-09 17:32:53', 'ewdsdsd', '');
INSERT INTO `cibr_task_fail` VALUES ('cad0d7bbc3cb4b5aa80c8bd68322f54b', '8f9ee3210fdd43abb2089e46fc45a889', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:51', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('cedc52c0a8f042938ac0fce3b30160e1', '63f2996069eb4928930f4968bbb6ff65', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:41', 'dsfafsd', null);
INSERT INTO `cibr_task_fail` VALUES ('d3033007585b4c1383cf0a8390ce5c34', '124e04e8b3814e77b11c8afe62b02181', '24f5851abc6444e79be718325025126f', '2020-09-04 16:01:13', '谁发的发生大啊', '');
INSERT INTO `cibr_task_fail` VALUES ('d7d6ed35a8e24660bbf3cf1b6f861aec', '14f73010e70e49979ba42b1b0e99f730', '24f5851abc6444e79be718325025126f', '2020-09-02 16:30:15', '地方撒撒地方', '对对对');
INSERT INTO `cibr_task_fail` VALUES ('d89a1dc6b1b146eaa87b78077b4a4c4a', '4eb668d9a5544b7bb6247c319290c6a6', '24f5851abc6444e79be718325025126f', '2020-09-08 15:53:37', 'dsf', null);
INSERT INTO `cibr_task_fail` VALUES ('d996d86a3a12458ab0a79678a4da3094', '64ddc22d5c16440dbbcd48f0b049ac59', '24f5851abc6444e79be718325025126f', '2020-09-14 15:54:12', '发的', '');
INSERT INTO `cibr_task_fail` VALUES ('e138c307155c453e8584f18abaf5512d', '840f6dd3f22e42038cc771735abb0fbe', '24f5851abc6444e79be718325025126f', '2020-09-10 17:25:43', 'dddd', '');
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
INSERT INTO `cibr_task_partner` VALUES ('05902edfae274525afe117c9c18e7069', '05902edfae274525afe117c9c18e7069', '3e150634798b4d02911c090eafbd13fc##', '24f5851abc6444e79be718325025126f', '2020-09-03 13:44:15', '自 2020-09-04 14:00 到 2020-09-04 15:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('124e04e8b3814e77b11c8afe62b02181', '124e04e8b3814e77b11c8afe62b02181', 'cb9163bdf42940a89fc426c2117d2720##11ea166504424516b66ffd3ef5f729b2##', '24f5851abc6444e79be718325025126f', '2020-09-03 13:51:27', '自 2020-09-10 16:00 到 2020-09-10 17:00    自 2020-09-10 12:00 到 2020-09-10 13:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('14f73010e70e49979ba42b1b0e99f730', '14f73010e70e49979ba42b1b0e99f730', 'c9d08aa656c644e5ae8d53cc9b213cde##859b23674b724ec18563d801994817b9##', '24f5851abc6444e79be718325025126f', '2020-09-02 15:26:00', '对对对', '02');
INSERT INTO `cibr_task_partner` VALUES ('26f8fab583f0460abe9d4817e38e5f64', '26f8fab583f0460abe9d4817e38e5f64', '895f61028eb34148a30fcf5ce2bc122f##d6681a26471e40ccbc0aff3e1f43bad6##', '24f5851abc6444e79be718325025126f', '2020-09-13 17:58:55', '已过期', '04');
INSERT INTO `cibr_task_partner` VALUES ('3fc959fc3ec243d0869fb1c05d148964', '3fc959fc3ec243d0869fb1c05d148964', '096ee0d0fd7c4c9597b785784f7bd469##', '24f5851abc6444e79be718325025126f', '2020-09-03 14:10:15', '自 2020-09-09 15:00 到 2020-09-09 16:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('44d9e48b5cb14730ba083eace1602519', '44d9e48b5cb14730ba083eace1602519', 'c9a3d5a4ff864679bead6a5f2f7ea956##', '24f5851abc6444e79be718325025126f', '2020-09-03 14:10:12', '自 2020-09-08 14:00 到 2020-09-08 15:00', '01');
INSERT INTO `cibr_task_partner` VALUES ('547ac98d3a3e45b79a4ab04a47344e2a', '547ac98d3a3e45b79a4ab04a47344e2a', 'e0a979744a6049e4b60bfb64bc62d393##a4c2fae05df94612a20c2bb15fb21854##', '24f5851abc6444e79be718325025126f', '2020-09-02 16:44:49', '自 2020-09-02 14:00 到 2020-09-02 15:00    自 2020-09-02 10:00 到 2020-09-02 11:00', '01');
INSERT INTO `cibr_task_partner` VALUES ('60e3db93d6fa4ec9b5810d611730f1b8', '60e3db93d6fa4ec9b5810d611730f1b8', '97de0a3b8cf24bfcac52f70f9410eda1##17da6d1c843642f3a488b4d9441d59ed##', '24f5851abc6444e79be718325025126f', '2020-09-08 11:11:33', '自 2020-09-08 15:00 到 2020-09-08 16:00    自 2020-09-08 11:00 到 2020-09-08 12:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('759d6c52eb0c420e9a54ea7542bbd445', '759d6c52eb0c420e9a54ea7542bbd445', '3b38273c370a4658bc424865d539a318##64e688e3280a4550bd86b478f2b14805##', '24f5851abc6444e79be718325025126f', '2020-09-13 16:52:08', '自 2020-09-14 09:00 到 2020-09-14 10:00    自 2020-09-14 13:00 到 2020-09-14 14:00', '03');
INSERT INTO `cibr_task_partner` VALUES ('75a90dba16bc49afa9f21b059d18a192', '75a90dba16bc49afa9f21b059d18a192', 'bb9140a947de4bec82c37863631be5bf##e381e6cef07c42a3a5dd1fd41871e70c##', '24f5851abc6444e79be718325025126f', '2020-09-08 11:07:34', '自 2020-09-09 09:00 到 2020-09-09 10:00    自 2020-09-09 13:00 到 2020-09-09 14:00', '01');
INSERT INTO `cibr_task_partner` VALUES ('7ac3e3d607b94be498adb0ea696c9b74', '7ac3e3d607b94be498adb0ea696c9b74', '469628bb9d854ac7a236222b129cd1b7##', '24f5851abc6444e79be718325025126f', '2020-09-03 14:10:46', '自 2020-09-12 12:00 到 2020-09-12 13:00', '01');
INSERT INTO `cibr_task_partner` VALUES ('8dec4e8b01434a21b32507a31ce7af36', '8dec4e8b01434a21b32507a31ce7af36', '2a12a877bb1a4e2f8a103c794648f84a##c03db4edd4ef42abb5f3a327812343f4##', '24f5851abc6444e79be718325025126f', '2020-09-13 17:04:55', '自 2020-09-15 14:00 到 2020-09-15 15:00    自 2020-09-15 10:00 到 2020-09-15 11:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('8edfa1d877b64fcf937be60b138a3521', '8edfa1d877b64fcf937be60b138a3521', '514a6a6594ce40b08671f29c416edc37##324b837cb4754c86b02d81bbe741e7fa##', '24f5851abc6444e79be718325025126f', '2020-09-13 16:19:46', '自 2020-09-13 14:00 到 2020-09-13 15:00    自 2020-09-13 10:00 到 2020-09-13 11:00', '03');
INSERT INTO `cibr_task_partner` VALUES ('aa8f78a01de241fe8aeb0b47d8bb198a', 'aa8f78a01de241fe8aeb0b47d8bb198a', '169e8cc9100c4aa0a5e69254fc03344e##', '24f5851abc6444e79be718325025126f', '2020-09-04 18:36:19', '自 2020-09-04 10:00 到 2020-09-04 11:00', '03');
INSERT INTO `cibr_task_partner` VALUES ('af355eb1e9194c329f2886f6c143f1f5', 'af355eb1e9194c329f2886f6c143f1f5', '0372609b5b5a4bc3ab051285aa160688##', '24f5851abc6444e79be718325025126f', '2020-09-03 14:10:42', '自 2020-09-11 16:00 到 2020-09-11 17:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('c8a1ba58903e46daa3c6c86547941399', 'c8a1ba58903e46daa3c6c86547941399', 'd1541b07a19d46c4a2d4bf643f20d059##88f312be0cde4cc888f6bca24f804534##e0a1bb5a2c39450999fa9960a13c24e7##974bf6c822e54324a6570fa01a2c7f37##53286adcbdcf4eec996298b9cbd7e107##', '24f5851abc6444e79be718325025126f', '2020-09-08 11:10:34', '自 2020-09-09 16:00 到 2020-09-09 17:00    自 2020-09-09 14:00 到 2020-09-09 15:00    自 2020-09-09 12:00 到 2020-09-09 13:00    自 2020-09-09 10:00 到 2020-09-09 11:00    自 2020-09-09 11:00 到 2020-09-09 12:00', '02');
INSERT INTO `cibr_task_partner` VALUES ('ff7cde9ac73644548f0722aefeb1bc55', 'ff7cde9ac73644548f0722aefeb1bc55', 'c7c88c8159984aaba9fe92fe14e8ba43##', '24f5851abc6444e79be718325025126f', '2020-09-03 13:47:02', '自 2020-09-05 11:00 到 2020-09-05 12:00', '01');

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
INSERT INTO `cibr_task_process` VALUES ('f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', '24f5851abc6444e79be718325025126f', '2020-08-31 15:52:37', '30', 'asdf', 'asdf', '24f5851abc6444e79be718325025126f', '01##03##02', null, '2020-09-03 16:52:51', '24f5851abc6444e79be718325025126f', '2020-09-09 17:36:11', '24f5851abc6444e79be718325025126f', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '53dc21f8cc214c11a13ca57fa27f3146', null, '全都有');

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

-- ----------------------------
-- Records of cibr_task_process_analysis
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_dismountdata
-- ----------------------------
INSERT INTO `cibr_task_process_dismountdata` VALUES ('09c64bd4a15d4c67b606b69790268d40', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', 'ed92e8dbeb7144d2ac3c7f639d2abf08', 'ND200900027', '1.0', null, null, null, null, null, '00', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '0', null, null);
INSERT INTO `cibr_task_process_dismountdata` VALUES ('224afc484b644e4ebb2f1404b9658245', 'f140fa4241804d72adf0305d82479487', 'aa2ec24550a14c2a8f194226efc10148', 'cec6d94129704d9da3c038e9f82c07d8', 'NC200900054', '5.0', null, null, null, null, null, '00', '2020-09-15 18:38:30', '24f5851abc6444e79be718325025126f', '4', null, null);
INSERT INTO `cibr_task_process_dismountdata` VALUES ('40154c8a6864405e8b01d7f4a678f03c', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', 'addb3e77313b49f388d5554b46443c48', 'NR200900014', '2.0', null, null, null, null, null, '00', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '1', null, null);
INSERT INTO `cibr_task_process_dismountdata` VALUES ('50a5d93a78b340879516896c35647f77', 'f140fa4241804d72adf0305d82479487', '708fc946f5e04380a252ecdf24cf60d7', 'd1e3f4882289441781d7fb54952dd862', 'NR200900014', '2.0', null, null, null, null, null, '00', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '1', null, null);
INSERT INTO `cibr_task_process_dismountdata` VALUES ('b219575cb6974a728c3bbccee4eb9d1d', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '3fc6f63af2934f50bb9caf9e1191604e', 'NC200900053', '4.0', null, null, null, null, null, '00', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '3', null, null);
INSERT INTO `cibr_task_process_dismountdata` VALUES ('b6ed5fe6623343b9bab904c754f6fbcf', 'f140fa4241804d72adf0305d82479487', 'aa2ec24550a14c2a8f194226efc10148', 'd8d6a259312c43f79924d3b5332fbeb9', 'NC200900054', '5.0', null, null, null, null, null, '00', '2020-09-15 18:38:30', '24f5851abc6444e79be718325025126f', '4', null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_library
-- ----------------------------
INSERT INTO `cibr_task_process_library` VALUES ('23b796c38e944126857055979bfd057c', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', 'c9b3a10385264c51a8f99e6400277143', null, 'ZNR200900006', null, '8.0', '撒旦法', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '7', '00', null, null, '01');
INSERT INTO `cibr_task_process_library` VALUES ('3fc6f63af2934f50bb9caf9e1191604e', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '65c3b04954004ed1bb3d9f0e47dacc79', null, 'NC200900053', null, '4.0', '撒旦法', '6.0', '8.0', 'dd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '3', '02', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '03');
INSERT INTO `cibr_task_process_library` VALUES ('addb3e77313b49f388d5554b46443c48', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '01e346c168644000b962a6f4984fa2de', null, 'NR200900014', null, '2.0', '撒旦法', '4.0', '6.0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '1', '02', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '01');
INSERT INTO `cibr_task_process_library` VALUES ('cec6d94129704d9da3c038e9f82c07d8', 'f140fa4241804d72adf0305d82479487', 'aa2ec24550a14c2a8f194226efc10148', '7a2736743d1f417e9972bd869b7f2f0e', null, 'NC200900054', null, '5.0', '撒旦法', '7.0', '9.0', 'dd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:36:08', '24f5851abc6444e79be718325025126f', '4', '02', '2020-09-15 18:38:30', '24f5851abc6444e79be718325025126f', '03');
INSERT INTO `cibr_task_process_library` VALUES ('d1e3f4882289441781d7fb54952dd862', 'f140fa4241804d72adf0305d82479487', '708fc946f5e04380a252ecdf24cf60d7', '01e346c168644000b962a6f4984fa2de', null, 'NR200900014', null, '2.0', '撒旦法', '4.0', '6.0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:36:08', '24f5851abc6444e79be718325025126f', '1', '02', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '01');
INSERT INTO `cibr_task_process_library` VALUES ('d8d6a259312c43f79924d3b5332fbeb9', 'f140fa4241804d72adf0305d82479487', 'aa2ec24550a14c2a8f194226efc10148', '7a2736743d1f417e9972bd869b7f2f0e', null, 'NC200900054', null, '5.0', '撒旦法', '7.0', '9.0', 'dd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '4', '02', '2020-09-15 18:38:30', '24f5851abc6444e79be718325025126f', '03');
INSERT INTO `cibr_task_process_library` VALUES ('dce477b770454ec6a9767ced513df5cb', 'f140fa4241804d72adf0305d82479487', '708fc946f5e04380a252ecdf24cf60d7', 'c9b3a10385264c51a8f99e6400277143', null, 'ZNR200900006', null, '8.0', '撒旦法', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:36:08', '24f5851abc6444e79be718325025126f', '7', '00', null, null, '01');
INSERT INTO `cibr_task_process_library` VALUES ('ed92e8dbeb7144d2ac3c7f639d2abf08', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '6cde2c734e214915b9806d2d46b2677d', null, 'ND200900027', null, '1.0', '撒旦法112', '3.0', '5.0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '0', '02', '2020-09-15 18:14:59', '24f5851abc6444e79be718325025126f', '01');

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
INSERT INTO `cibr_task_process_sampleinput` VALUES ('0126d7741e64421483b837235f2286a3', 'f140fa4241804d72adf0305d82479487', '037e10355f334d20b363a6c2666a983b', '批次1', '2.0', '01', 'NR200900014', '撒旦法', '24大大', '02', '02', null, null, '4.0', '5.0', '6.0', null, null, '02', '02', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '09', '1');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('19b8e1e0b1c14d6498923120d75ee0fa', 'f140fa4241804d72adf0305d82479487', null, '批次1', '7.0', '03', 'NC200900056', '撒旦法', '29大大', '40', '40', null, null, '9.0', '10.0', '11.0', 'dd', '05', '44', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '01', '6');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('4ac91796a3f64f9cb288a5e57d91225d', 'f140fa4241804d72adf0305d82479487', null, '批次1', '6.0', '03', 'NC200900055', '撒旦法', '28大大', '40', '40', null, null, '8.0', '9.0', '10.0', 'dd', '05', '43', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '01', '5');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('4c7d5a3cc2de4a93b90ca828745ef836', 'f140fa4241804d72adf0305d82479487', '037e10355f334d20b363a6c2666a983b', '批次1', '5.0', '03', 'NC200900054', '撒旦法', '27大大', '41', '42', null, null, '7.0', '8.0', '9.0', 'dd', '05', '42', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '09', '4');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('5a599bc37f40419895073584caa6ea8a', 'f140fa4241804d72adf0305d82479487', '037e10355f334d20b363a6c2666a983b', '批次1', '4.0', '03', 'NC200900053', '撒旦法', '26大大', '41', '41', null, null, '6.0', '7.0', '8.0', 'dd', '04', '41', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '09', '3');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('c6711003542e4844895523eb03758d3f', 'f140fa4241804d72adf0305d82479487', null, '批次1', '3.0', '01', 'ND200900028', '撒旦法', '25大大', '03', '03', null, null, '5.0', '6.0', '7.0', null, null, '03', '03', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '01', '2');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('c7b441f8138b486f84044d218b8eb8ce', 'f140fa4241804d72adf0305d82479487', '037e10355f334d20b363a6c2666a983b', '批次1', '1.0', '01', 'ND200900027', '撒旦法112', '23大大', '01', '01', null, null, '3.0', '4.0', '5.0', null, null, '01', '01', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '09', '0');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('d23262d10c36437bb05e970b8deacab3', 'f140fa4241804d72adf0305d82479487', null, '批次1', '9.0', '02', 'NDO200900014', '撒旦法', '31大大', '23', '22', '9.0', '10.0', null, null, null, null, null, '27', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '01', '8');
INSERT INTO `cibr_task_process_sampleinput` VALUES ('eee7fadcb8ed43a3adb3d0231600a1d6', 'f140fa4241804d72adf0305d82479487', '037e10355f334d20b363a6c2666a983b', '批次1', '8.0', '02', 'NRO200900014', '撒旦法', '30大大', '22', '21', '8.0', '9.0', null, null, null, null, null, '22', '00', '', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:35', '09', '7');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_task_process_samplemake
-- ----------------------------
INSERT INTO `cibr_task_process_samplemake` VALUES ('01e346c168644000b962a6f4984fa2de', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '0126d7741e64421483b837235f2286a3', '2.0', '01', null, 'NR200900014', '撒旦法', '24大大', '2020-09-15 00:00:00', '4.0', '5.0', '6.0', null, null, null, '', '', '', '', '02', '02', '', '', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '02', '1', '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('65c3b04954004ed1bb3d9f0e47dacc79', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '5a599bc37f40419895073584caa6ea8a', '4.0', '03', null, 'NC200900053', '撒旦法', '26大大', '2020-09-15 00:00:00', '6.0', '7.0', '8.0', 'dd', '04', null, '', '', '', '', '41', '00', '', '', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '02', '3', '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('6cde2c734e214915b9806d2d46b2677d', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', 'c7b441f8138b486f84044d218b8eb8ce', '1.0', '01', null, 'ND200900027', '撒旦法112', '23大大', '2020-09-15 00:00:00', '3.0', '4.0', '5.0', null, null, null, '', '', '', '', '01', '01', '', '', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '02', '0', '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('7a2736743d1f417e9972bd869b7f2f0e', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', '4c7d5a3cc2de4a93b90ca828745ef836', '5.0', '03', null, 'NC200900054', '撒旦法', '27大大', '2020-09-15 00:00:00', '7.0', '8.0', '9.0', 'dd', '05', null, '', '', '', '', '42', '00', '', '', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '02', '4', '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', null);
INSERT INTO `cibr_task_process_samplemake` VALUES ('c9b3a10385264c51a8f99e6400277143', 'f140fa4241804d72adf0305d82479487', '6e5b7c3b813a4381ae080098e9a31a37', 'eee7fadcb8ed43a3adb3d0231600a1d6', '8.0', '02', 'ZNR200900006', 'NRO200900014', '撒旦法', '30大大', '2020-09-15 00:00:00', null, null, null, null, null, null, '', '', '', '', '22', '00', '', '', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '02', '7', '2020-09-15 17:46:53', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:59', '24f5851abc6444e79be718325025126f', '01');

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
INSERT INTO `cibr_task_process_subtask` VALUES ('037e10355f334d20b363a6c2666a983b', 'f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', '测试流程1', '10', '24f5851abc6444e79be718325025126f', '2020-09-15 17:35:45', '', null);
INSERT INTO `cibr_task_process_subtask` VALUES ('6e5b7c3b813a4381ae080098e9a31a37', 'f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', 'ce', '20', '24f5851abc6444e79be718325025126f', '2020-09-15 17:46:53', '', null);
INSERT INTO `cibr_task_process_subtask` VALUES ('708fc946f5e04380a252ecdf24cf60d7', 'f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', '东方故事', '20', '24f5851abc6444e79be718325025126f', '2020-09-15 17:36:08', '', null);
INSERT INTO `cibr_task_process_subtask` VALUES ('aa2ec24550a14c2a8f194226efc10148', 'f140fa4241804d72adf0305d82479487', '57ac977a959e4c27ac88287dfbc30771', '士大夫', '30', '24f5851abc6444e79be718325025126f', '2020-09-15 18:38:30', '', null);

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : cibrtest

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2020-10-27 18:57:18
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
  `curstatu` varchar(2) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateUser` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cibr_animal_drosophila
-- ----------------------------
INSERT INTO `cibr_animal_drosophila` VALUES ('0252cd06eb5243a68588838ebba0ef71', '果蝇', 'D.Yak', 'Drosophila yakuba (Dyak\\wild-type)', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00004', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('0433c90e8c63498abcc84a13eb7da715', '果蝇', 'VDRC100319', 'CG13540', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00034', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('0b2b7d1cd2154bdab146a5c7804b17f3', '果蝇', '31882-attp-rfp', 'w* ；CG31882-ATTP-RFP', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00045', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('0c2942143d06420886d25c4eb2db02b5', '果蝇', '71814.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT044166-GAL4.DBD}attP2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00027', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('15c0c9c15ce442cb9c78dbaff891cc5a', '果蝇', '野生型', 'Drosophila （CF melanogaster 内蒙古赤峰 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00015', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('1a5bb151869d4f74bfd47e9576a921d0', '果蝇', 'tm2/tm6b', 'tm2/tm6b', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00018', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('1b80b613b7a44d42a95c41ca397cc1aa', '果蝇', 'willistoni', 'willistoni', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00039', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('244b57ea66944c36af5fcb1f9f6911bd', '果蝇', '65402.0', 'P{w[+mC]=UAS-Stinger}2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00008', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('24d762359a974db3a5db10267f6c6c82', '果蝇', 'Phic-31', 'Phic-31', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00001', '09', '2020-09-28 13:52:57', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('29486b5bafad4d1980b92bd53f33c0dd', '果蝇', 'B # 5138', 'y[1] w[*]; P{w[+mC]=tubP-GAL4}LL7/TM3, Sb[1] Ser[1]', 'bloomington，张力老师要回来', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00011', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('3bec691fe4e34cbf8d800feab8ed2ecf', '果蝇', '野生型', 'Drosophila （BHS melanogaster 北京百花山 黑腹果蝇）红眼', '北大陆剑实验室', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00013', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('3c65751d10d6447bb78d6a51a4ddf764', '果蝇', 'Bs51976', 'w[1118]; P{w[+mC]=Crz-GAL4.391}3M', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00021', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('44e104516bd5435d91bd818e47b681d8', '果蝇', '野生型', 'Drosophila （BHS simulans 北京百花山 拟果蝇）红眼', '北大陆剑实验室', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00014', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('460f665bc18c43628e80074c7e9fe338', '果蝇', '42218.0', 'w[1118]; P{w[+mC]=UAS-inaF-B.HA}3', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00026', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('48ded1d90435424b85bea0f52a264ebd', '果蝇', 'Bs7457', 'y[1] w[*]; P{w[+mC]=Rh3-GAL4}2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00020', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('49833384474c43a6a4252bbfee649982', '果蝇', '野生型', 'Drosophila （CF simulans 内蒙古赤峰 拟果蝇）红眼', '北大陆剑实验室', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00016', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4d132015d03c4a9a93fa2a55cc64a9d5', '果蝇', 'uas-gfp', 'uas-gfp', '', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00010', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('4da63a0b3b894bc6b424b7ab324f5ca1', '果蝇', 'VDRC101598', 'CG30447', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00035', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('5002ba504b7b41a99ea7125d3738df93', '果蝇', '71965.0', 'w[1118]; P{y[+t7.7] w[+mC]=VT045774-GAL4.DBD}attP2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00024', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('523b80c0842e4446bfcdc4a2740b343d', '果蝇', 'VDRC103313', 'CG32368', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00033', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('5629511973ac4faab573031f59a22b42', '果蝇', '1361-attb-rfp', 'w* ；CG1361-ATTP-RFP', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00044', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('730b3ff246454f0aa998470ac600a0b5', '果蝇', 'B # 4414', 'y[1] w[*]; P{w[+mC]=Act5C-GAL4}25FO1/CyO, y[+]', 'bloomington，张力老师要回来', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00009', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('775bf476bb0a4d6099784236571f49dc', '果蝇', '48778.0', 'w[1118]; P{y[+t7.7] w[+mC]=GMR17F11-GAL4}attP2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00025', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('8c88e6df2e964af19b4758b82e8fc41a', '果蝇', '32045.0', 'y[1] w[*] P{w[+mC]=His2Av[T:Avic\\GFP-S65T]}1 P{ry[+t7.2]=hsFLP}12 P{ry[+t7.2]=neoFRT}19A/FM7a', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00006', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('9829f33efb0b425faf3b16443ea3d8fd', '果蝇', 'VDRC60000', 'w[1118]', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00037', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('9b76b34d7bcf4df7a11469708b5eac6d', '果蝇', 'BC/cyo', 'BC/cyo', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00017', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('9c2dc78ca651485381d176126f63ae9d', '果蝇', 'UAS-1361-RNAi-2 T2-1', 'w* ；P｛UAS-1361-RNAi-2｝attP40/Cyo', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00040', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('a77d046d56944115a865a8fa9abfecba', '果蝇', 'VDRC106565', 'CG10852', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00032', '09', '2020-09-28 13:59:45', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('a7b009df30b3467a8ec019fb53efb799', '果蝇', '76709.0', 'y[1] w[*]; Mi{Trojan-GAL4.0}Haspin[MI09386-TG4.0]', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00023', '01', '2020-10-10 13:59:09', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('ad1143aa17a0468baf1e8f21416929fa', '果蝇', 'BL8860', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00029', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('c1d2cb99c7ee4f74bfc01592ea4dfa71', '果蝇', 'BL25706', 'w[1118] P{w[+mW.hs]=GawB}Bx[MS1096]; P{w[+mC]=UAS-Dcr-2.D}2', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00030', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('c8a1ace89381459fafbba3378a4138d6', '果蝇', 'BL24647', 'P{w[+mC]=UAS-Dcr-2.D}1; wg[Sp-1], P{w[-]=hs-hid.v2}2/CyO', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00031', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('d362f99a980e4643806f425de6ce1ded', '果蝇', 'Bs47333', 'w[1118]; P{y[+t7.7] w[+mC]=GMR21B05-GAL4}attP2', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00022', '09', '2020-09-28 18:19:08', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('d4a757f1957f42dd9ac92656ae93ccc1', '果蝇', 'VDRC106728', 'CG4986', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00036', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('d9dc43551b3e42ce899df6880052d3b1', '果蝇', 'bcf93', 'Drosophila simulans (Dsim\\w[501])', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00003', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('dbb57a5af7de4656af76d6d995a8d821', '果蝇', 'Bs8765', 'P{w[+mC]=GAL4-elav.L}2/CyO', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00019', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('e4723c99c6684452947bc0af545ceae7', '果蝇', 'WT0021', 'D.mauritiana', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00038', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('e5c9a7dda1774e368e806df108a70fa5', '果蝇', 'bcf78', 'w1118', '中科院上海生物化学与细胞生物学研究所果蝇资源与技术平台', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00002', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('e7b4c3d2d423489fb18f1d147392940a', '果蝇', '1104.0', 'w[*]; P{w[+mC]=GAL4-ninaE.GMR}12', 'bloomington，张力老师要回来', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00012', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('ed7eca5e067841b1ae7d80536fdcd3a9', '果蝇', '34499.0', 'w[1118]; P{w[+mC]=His2Av-mRFP1}III.1 P{ry[+t7.2]=neoFRT}80B/TM6B, Tb[1]', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00007', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');
INSERT INTO `cibr_animal_drosophila` VALUES ('f98cc856eddf457192735d6a321040fb', '果蝇', 'UAS-1361-RNAi-1   T1-1', 'w* ；P｛UAS-1361-RNAi-2｝attP40', '芳景生物', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00041', '01', '2020-09-28 13:07:00', null);
INSERT INTO `cibr_animal_drosophila` VALUES ('ffb6784d2e1a4a80a5080149f6a7bc5b', '果蝇', '8545.0', 'P{w[+mC]=UAS-RedStinger}3, w[1118]', 'bloomington', null, '2020-09-28 13:07:00', '24f5851abc6444e79be718325025126f', 'CG00005', '09', '2020-09-28 13:53:50', '24f5851abc6444e79be718325025126f');

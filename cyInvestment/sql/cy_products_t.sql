/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : cyinvestment

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-09 15:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cy_products_t
-- ----------------------------
DROP TABLE IF EXISTS `cy_products_t`;
CREATE TABLE `cy_products_t` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `setdate` date DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  `depository` varchar(255) DEFAULT NULL,
  `adviser` varchar(255) DEFAULT NULL,
  `adviserphone` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `setamount` varchar(255) DEFAULT NULL,
  `limit` varchar(255) DEFAULT NULL,
  `minlimit` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `colsed` varchar(255) DEFAULT NULL,
  `openday` varchar(255) DEFAULT NULL,
  `managercost` varchar(255) DEFAULT NULL,
  `redemptioncost` varchar(255) DEFAULT NULL,
  `floatcost` varchar(255) DEFAULT NULL,
  `trust` varchar(255) DEFAULT NULL,
  `download` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_products_t
-- ----------------------------
INSERT INTO `cy_products_t` VALUES ('1', '重阳1期', '深国投•重阳1期证券投资集合资金信托计划', 'CHSZIT1 CH', '2008-09-05', '华润深国投信托有限公司', '中国建设银行股份有限公司深圳市分行', '上海重阳投资管理股份有限公司', '4006812989', '裘国根', '国泰君安证券股份有限公司', '成立时不低于人民币5,000万元', '不限定存续期限，如发生信托合同规定的信托计划终止情形时，本信托计划才予以终止', '首次认购不低于人民币1000万元，追加资金为10万元的整数倍', '信托认购资金的1%', '信托存续期间认购的信托单位在认购到该信托单位之开放日起至其之后的第6个开放日（含第6个开放日）', '每月最后一个工作日', '信托计划资产的1.5%（含信托管理费、托管费等）', '6个月内不可赎回，7个月-12个月（不含第12个月）赎回费率为3%，一年后无赎回费', '信托计划收益的20%', '受托人与投资顾问协商一致决定', '深国投•重阳1期证券投资集合资金信托计划说明书');

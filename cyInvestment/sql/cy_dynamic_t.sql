/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : cyinvestment

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-09 15:19:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cy_dynamic_t
-- ----------------------------
DROP TABLE IF EXISTS `cy_dynamic_t`;
CREATE TABLE `cy_dynamic_t` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `releasedate` date DEFAULT NULL,
  `releasetime` time DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `publicdate` date DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cy_dynamic_t
-- ----------------------------
INSERT INTO `cy_dynamic_t` VALUES ('1', '重阳系列产品2015年9月开放日温馨提示', '2015-08-31', '16:55:41', '上海重阳投资管理股份有限公司', '2015-09-01', '有意于本月对重阳1、2、6、7期进行赎回的客户，请于表格所列日期前将相应材料送至信托公司，申请材料可于信托公司网站下载或咨询其服务电话；重阳3期、重阳5期、重阳8期、投资精英之重阳、君享重阳一号、汇金重阳、重阳对冲1号、重阳对冲3号的客户可直接联系相应银行、信托或券商客户经理沟通申购、赎回事宜。如有疑问，欢迎致电4006812989咨询。');
INSERT INTO `cy_dynamic_t` VALUES ('2', '重阳系列产品2015年8月开放日温馨提示', '2015-08-27', '16:55:41', '上海重阳投资管理股份有限公司', '2015-09-01', null);
INSERT INTO `cy_dynamic_t` VALUES ('3', '重阳系列产品2015年7月开放日温馨提示', '2015-08-25', '16:55:41', '上海重阳投资管理股份有限公司', '2015-09-01', null);

/*
Navicat MySQL Data Transfer

Source Server         : neu
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : iblog3

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-21 07:28:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `blogID` int(10) NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `newstime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL,
  PRIMARY KEY (`blogID`),
  KEY `blog_ibfk_1` (`userID`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '111@qq.com', '2017-12-20 21:14:21', '哈啊哈哈哈哈哈哈', '2');
INSERT INTO `blog` VALUES ('2', '111@qq.com', '2017-11-10 12:50:59', '太棒了，成功了', '0');
INSERT INTO `blog` VALUES ('3', '111@qq.com', '2017-12-20 21:14:09', '666666', '1');
INSERT INTO `blog` VALUES ('4', '111@qq.com', '2016-12-24 13:06:47', '5656958', '0');
INSERT INTO `blog` VALUES ('5', '111@qq.com', '2017-09-20 15:05:07', '我不服', '0');
INSERT INTO `blog` VALUES ('6', '123@168.com', '2017-12-20 21:19:11', '可以', '2');
INSERT INTO `blog` VALUES ('7', '233@qq.com', '2017-12-20 21:19:17', '确实', '4');
INSERT INTO `blog` VALUES ('8', '233@qq.com', '2016-08-19 15:30:15', '确实', '0');
INSERT INTO `blog` VALUES ('9', '123@168.com', '2017-12-20 21:19:23', '确实', '1');
INSERT INTO `blog` VALUES ('10', '123@168.com', '2017-06-06 15:30:41', '确实', '0');
INSERT INTO `blog` VALUES ('12', '233@qq.com', '2017-02-16 15:31:12', '啪啪啪啪', '0');
INSERT INTO `blog` VALUES ('13', '999@qq.com', '2017-07-11 18:33:30', '啦啦啦', '0');
INSERT INTO `blog` VALUES ('14', '69@qq.com', '2016-11-18 18:33:53', '946481513256', '0');
INSERT INTO `blog` VALUES ('15', '69@qq.com', '2016-09-10 18:34:19', '可可可可可可可', '0');
INSERT INTO `blog` VALUES ('16', '999@qq.com', '2016-02-19 18:34:49', '1652', '0');
INSERT INTO `blog` VALUES ('17', '233@qq.com', '2015-12-19 18:35:13', '破破破破', '0');
INSERT INTO `blog` VALUES ('18', '233@qq.com', '2016-04-17 18:35:56', '5555555', '0');
INSERT INTO `blog` VALUES ('19', '233@qq.com', '2016-08-11 18:36:18', '333332223', '0');
INSERT INTO `blog` VALUES ('20', '233@qq.com', '2016-07-17 18:36:38', '848484', '0');
INSERT INTO `blog` VALUES ('22', '233@qq.com', '2016-02-19 18:37:21', '来吧！！！！', '0');
INSERT INTO `blog` VALUES ('23', '111@qq.com', '2017-06-19 19:40:40', '法法', '0');
INSERT INTO `blog` VALUES ('24', '111@qq.com', '2017-12-20 21:14:16', '合法及缴费', '1');
INSERT INTO `blog` VALUES ('25', '111@qq.com', '2016-02-19 19:41:22', '腐败烦恼', '0');
INSERT INTO `blog` VALUES ('26', '111@qq.com', '2016-09-19 19:41:39', '太嗲䦹', '0');
INSERT INTO `blog` VALUES ('27', '111@qq.com', '2017-05-13 19:42:00', '发罚', '0');
INSERT INTO `blog` VALUES ('28', '111@qq.com', '2017-08-23 19:42:22', '爱对方倨傲地附近', '0');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `userID` varchar(20) NOT NULL,
  `followID` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`,`followID`),
  KEY `followID` (`followID`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`followID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('123@168.com', '111@qq.com');
INSERT INTO `follow` VALUES ('233@qq.com', '111@qq.com');
INSERT INTO `follow` VALUES ('111@qq.com', '123@168.com');
INSERT INTO `follow` VALUES ('233@qq.com', '123@168.com');
INSERT INTO `follow` VALUES ('69@qq.com', '123@168.com');
INSERT INTO `follow` VALUES ('123@168.com', '233@qq.com');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `replyID` int(10) NOT NULL AUTO_INCREMENT,
  `blogID` int(10) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `replytime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`replyID`),
  KEY `reply_ibfk_1` (`blogID`),
  KEY `reply_ibfk_2` (`userID`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `blog` (`blogID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '1', '233@qq.com', '2017-12-20 11:11:14', '66666');
INSERT INTO `reply` VALUES ('2', '1', '69@qq.com', '2017-11-16 11:11:30', '999999');
INSERT INTO `reply` VALUES ('3', '1', '69@qq.com', '2017-12-17 11:11:58', '666666');
INSERT INTO `reply` VALUES ('4', '1', '233@qq.com', '2017-12-01 11:12:30', '777777');
INSERT INTO `reply` VALUES ('5', '1', '111@qq.com', '2017-11-14 11:12:48', '5555555');
INSERT INTO `reply` VALUES ('6', '1', '233@qq.com', '2017-12-08 11:13:08', '6666666');
INSERT INTO `reply` VALUES ('7', '1', '233@qq.com', '2017-12-10 11:13:28', '8888888');
INSERT INTO `reply` VALUES ('8', '1', '69@qq.com', '2017-12-02 11:13:45', '4444444');
INSERT INTO `reply` VALUES ('9', '1', '123@168.com', '2017-10-06 11:14:05', '7777777');
INSERT INTO `reply` VALUES ('10', '1', '123@168.com', '2017-12-11 11:15:26', '0000000');
INSERT INTO `reply` VALUES ('11', '1', '233@qq.com', '2017-12-20 11:16:03', '3333333');
INSERT INTO `reply` VALUES ('12', '1', '123@168.com', '2017-12-12 11:16:13', '444444');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `registertime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111@qq.com', 'FairyMagic', '123456', '2017-12-19 13:32:14');
INSERT INTO `user` VALUES ('123@168.com', 'echo', '123456', '2017-12-19 13:32:21');
INSERT INTO `user` VALUES ('233@qq.com', 'nick', '123456', '2017-12-19 13:32:25');
INSERT INTO `user` VALUES ('69@qq.com', 'huih', '123', '2017-12-19 16:39:34');
INSERT INTO `user` VALUES ('999@qq.com', 'buf', '123', '2017-12-19 16:40:56');

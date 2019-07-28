/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : music

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-07-27 16:20:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for clipe
-- ----------------------------
DROP TABLE IF EXISTS `clipe`;
CREATE TABLE `clipe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clipeName` varchar(50) DEFAULT NULL,
  `player` varchar(50) DEFAULT NULL,
  `pubYear` datetime DEFAULT NULL,
  `com` varchar(50) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clipe
-- ----------------------------
INSERT INTO `clipe` VALUES ('1', 'G.E.M', '邓紫棋', '2019-06-11 14:08:04', '蜂鸟音乐', 'img/G.E.M.jpg', '4.50');
INSERT INTO `clipe` VALUES ('2', '新的心跳', '邓紫棋', '2019-05-15 14:09:50', '蜂鸟音乐', 'img/新的心跳.jpg', '5.60');
INSERT INTO `clipe` VALUES ('3', '好安静', '汪苏泷', '2016-03-15 00:00:00', '海蝶音乐', 'img/好安静.jpg', '3.20');
INSERT INTO `clipe` VALUES ('4', '万有引力', '汪苏泷', '2014-09-14 00:00:00', '海蝶音乐', 'img/万有引力.jpg', '4.20');
INSERT INTO `clipe` VALUES ('5', '一半', '薛之谦', '2014-02-15 00:00:00', '海蝶音乐', 'img/一半.jpg', '2.50');
INSERT INTO `clipe` VALUES ('6', '绅士', '薛之谦', '2013-05-01 00:00:00', '海蝶音乐', 'img/绅士.jpg', '2.50');

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `musicName` varchar(50) DEFAULT NULL,
  `musicType` varchar(20) DEFAULT NULL,
  `pubYear` datetime DEFAULT NULL,
  `playNum` int(11) DEFAULT NULL,
  `clipeId` bigint(20) DEFAULT NULL,
  `musicLocale` varchar(50) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `storeAddress` varchar(50) DEFAULT NULL,
  `player` varchar(50) DEFAULT NULL,
  `diyclipeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`clipeId`),
  KEY `FK_Reference_6` (`diyclipeId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`clipeId`) REFERENCES `clipe` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`diyclipeId`) REFERENCES `playlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES ('1', '回忆的沙漏', '流行', '2011-06-15 14:22:02', '15', '1', '香港', '2011-12-03 14:22:48', 'mp3/G.E.M. 邓紫棋 - 回忆的沙漏.mp3', '邓紫棋', '6');
INSERT INTO `music` VALUES ('2', 'Where Did U Go', '流行', '2008-02-05 00:00:00', '56', '1', '香港', '2009-05-06 00:00:00', 'mp3/G.E.M. 邓紫棋 - Where Did U Go.mp3', '邓紫棋', '2');
INSERT INTO `music` VALUES ('3', '爱现在的我', '流行', '2008-03-09 00:00:00', '12', '1', '香港', '2008-05-09 00:00:00', 'mp3/G.E.M. 邓紫棋 - 爱现在的我.mp3', '邓紫棋', '3');
INSERT INTO `music` VALUES ('4', '查克靠近', '流行', '2003-06-08 00:00:00', '26', '2', '香港', '2003-06-08 00:00:00', 'mp3/G.E.M. 邓紫棋 - 查克靠近.mp3', '邓紫棋', '4');
INSERT INTO `music` VALUES ('5', '单行的轨道', '流行', '2011-05-06 00:00:00', '56', '2', '香港', '2011-05-06 00:00:00', 'mp3/G.E.M. 邓紫棋 - 单行的轨道.mp3', '邓紫棋', '5');
INSERT INTO `music` VALUES ('6', '等一个他', '流行', '2014-09-08 00:00:00', '103', '1', '香港', '2014-09-08 00:00:00', 'mp3/G.E.M. 邓紫棋 - 等一个他.mp3', '邓紫棋', '6');
INSERT INTO `music` VALUES ('7', '多远都要在一起', '流行', '2014-01-15 00:00:00', '33', '2', '香港', '2014-01-15 00:00:00', 'mp3/G.E.M. 邓紫棋 - 多远都要在一起.mp3', '邓紫棋', '7');
INSERT INTO `music` VALUES ('8', '来自天堂的魔鬼', '流行', '2016-06-08 00:00:00', '56', '2', '香港', '2016-06-08 00:00:00', 'mp3/G.E.M. 邓紫棋 - 来自天堂的魔鬼.mp3', '邓紫棋', '8');
INSERT INTO `music` VALUES ('9', '盲点', '流行', '2015-06-03 00:00:00', '89', '2', '香港', '2015-06-04 00:00:00', 'mp3/G.E.M. 邓紫棋 - 盲点.mp3', '邓紫棋', '1');
INSERT INTO `music` VALUES ('10', '睡公主', '流行', '2017-06-04 00:00:00', '37', '1', '香港', '2017-06-04 00:00:00', 'mp3/G.E.M. 邓紫棋 - 睡公主.mp3', '邓紫棋', '2');
INSERT INTO `music` VALUES ('11', '瞬间', '流行', '2013-05-09 00:00:00', '89', '2', '香港', '2013-05-09 00:00:00', 'mp3/G.E.M. 邓紫棋 - 瞬间.mp3', '邓紫棋', '3');
INSERT INTO `music` VALUES ('12', '新的心跳', '流行', '2015-02-17 00:00:00', '45', '2', '香港', '2015-02-17 00:00:00', 'mp3/G.E.M. 邓紫棋 - 新的心跳.mp3', '邓紫棋', '4');
INSERT INTO `music` VALUES ('13', '一路逆风', '流行', '2013-06-12 00:00:00', '102', '2', '香港', '2013-06-14 00:00:00', 'mp3/G.E.M. 邓紫棋 - 一路逆风.mp3', '邓紫棋', '5');
INSERT INTO `music` VALUES ('14', '于是', '流行', '2013-07-16 00:00:00', '98', '2', '香港', '2013-07-19 00:00:00', 'mp3/G.E.M. 邓紫棋 - 于是.mp3', '邓紫棋', '6');
INSERT INTO `music` VALUES ('15', '再见', '流行', '2016-03-03 00:00:00', '46', '2', '香港', '2016-03-05 00:00:00', 'mp3/G.E.M. 邓紫棋 - 再见.mp3', '邓紫棋', '7');
INSERT INTO `music` VALUES ('16', '不分手的恋爱', '流行', '2016-02-08 00:00:00', '134', '3', '大陆', '2016-02-10 00:00:00', 'mp3/汪苏泷 - 不分手的恋爱.mp3', '汪苏泷', '8');
INSERT INTO `music` VALUES ('17', '不过是想', '民谣', '2014-03-16 00:00:00', '46', '4', '大陆', '2014-03-18 00:00:00', 'mp3/汪苏泷 - 不过是想.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('18', '不可思议', '流行', '2016-06-23 00:00:00', '89', '4', '大陆', '2016-06-28 00:00:00', 'mp3/汪苏泷 - 不可思议.mp3', '汪苏泷', '2');
INSERT INTO `music` VALUES ('20', '分手季节', '流行', '2017-03-08 00:00:00', '14', '4', '大陆', '2017-03-09 00:00:00', 'mp3/汪苏泷 - 分手季节.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('21', '风度', '民谣', '2015-03-26 00:00:00', '105', '4', '大陆', '2015-03-29 00:00:00', 'mp3/汪苏泷 - 风度.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('22', '好安静', '流行', '2014-06-28 00:00:00', '23', '3', '大陆', '2014-06-30 00:00:00', 'mp3/汪苏泷 - 好安静.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('23', '苦笑', '流行', '2014-09-09 00:00:00', '56', '3', '大陆', '2014-09-15 00:00:00', 'mp3/汪苏泷 - 苦笑.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('24', '某人', '民谣', '2016-09-04 00:00:00', '99', '3', '大陆', '2016-09-10 00:00:00', 'mp3/汪苏泷 - 某人.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('25', '那一年', '流行', '2013-06-07 00:00:00', '89', '4', '大陆', '2013-06-08 00:00:00', 'mp3/汪苏泷 - 那一年.mp3', '汪苏泷', '1');
INSERT INTO `music` VALUES ('26', '三国杀', '流行', '2015-08-09 00:00:00', '78', '3', '大陆', '2015-08-10 00:00:00', 'mp3/汪苏泷 - 三国杀.mp3', '汪苏泷', '2');
INSERT INTO `music` VALUES ('27', '桃花扇', '民谣', '2016-09-07 00:00:00', '56', '4', '大陆', '2016-09-10 00:00:00', 'mp3/汪苏泷 - 桃花扇.mp3', '汪苏泷', '3');
INSERT INTO `music` VALUES ('28', '停止跳动', '流行', '2016-05-09 00:00:00', '40', '4', '大陆', '2016-05-12 00:00:00', 'mp3/汪苏泷 - 停止跳动.mp3', '汪苏泷', '4');
INSERT INTO `music` VALUES ('29', '万有引力', '流行', '2018-06-04 00:00:00', '33', '4', '大陆', '2018-06-05 00:00:00', 'mp3/汪苏泷 - 万有引力.mp3', '汪苏泷', '5');
INSERT INTO `music` VALUES ('30', '我也不知道', '民谣', '2016-09-04 00:00:00', '16', '3', '大陆', '2016-09-09 00:00:00', 'mp3/汪苏泷 - 我也不知道.mp3', '汪苏泷', '6');
INSERT INTO `music` VALUES ('31', 'Stay Here', '流行', '2016-09-05 00:00:00', '44', '5', '大陆', '2016-09-05 00:00:00', 'mp3/薛之谦 - Stay Here.mp3', '薛之谦', '7');
INSERT INTO `music` VALUES ('32', '绅士', '流行', '2014-05-08 00:00:00', '88', '6', '大陆', '2014-05-10 00:00:00', 'mp3/薛之谦 - 绅士.mp3', '薛之谦', '8');
INSERT INTO `music` VALUES ('33', '下雨了', '民谣', '2014-06-09 00:00:00', '50', '6', '大陆', '2014-06-10 00:00:00', 'mp3/薛之谦 - 下雨了.mp3', '薛之谦', '1');
INSERT INTO `music` VALUES ('34', '小孩', '流行', '2015-08-07 00:00:00', '42', '5', '大陆', '2015-08-12 00:00:00', 'mp3/薛之谦 - 小孩.mp3', '薛之谦', '2');
INSERT INTO `music` VALUES ('35', '演员', '流行', '2013-06-09 00:00:00', '10', '6', '大陆', '2013-06-09 00:00:00', 'mp3/薛之谦 - 演员.mp3', '薛之谦', '3');
INSERT INTO `music` VALUES ('36', '一半', '流行', '2014-09-07 00:00:00', '93', '5', '大陆', '2014-09-16 00:00:00', 'mp3/薛之谦 - 一半.mp', '薛之谦', '4');

-- ----------------------------
-- Table structure for observe
-- ----------------------------
DROP TABLE IF EXISTS `observe`;
CREATE TABLE `observe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `musicId` bigint(20) DEFAULT NULL,
  `observerId` bigint(20) DEFAULT NULL,
  `contents` varchar(200) DEFAULT NULL,
  `obtime` datetime DEFAULT NULL,
  `argue` int(11) DEFAULT NULL,
  `against` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`observerId`),
  KEY `FK_Reference_9` (`musicId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`observerId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`musicId`) REFERENCES `music` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of observe
-- ----------------------------

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createrId` bigint(20) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`createrId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`createrId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO `playlist` VALUES ('1', '我喜欢', '诉，心之所想；闻，耳之所铭', '1', '2019-06-12', 'img/G.E.M.jpg');
INSERT INTO `playlist` VALUES ('2', '深情告白', '何妨携手同归去', '1', '2019-07-09', 'img/新的心跳.jpg');
INSERT INTO `playlist` VALUES ('3', '都市空巢青年', '你有我也有的“病“，都在这张歌单里', '1', '2019-07-09', 'img/好安静.jpg');
INSERT INTO `playlist` VALUES ('4', '爱上你，是一次劫难', '原来，遇见你并非幸运。爱上你，是我的劫难。', '1', '2019-07-10', 'img/万有引力.jpg');
INSERT INTO `playlist` VALUES ('5', '无关风月', '歌曲里都是光阴的味道，里面所含的情与爱留在世间里，只有自己知道~', '2', '2019-07-17', 'img/一半.jpg');
INSERT INTO `playlist` VALUES ('6', '时光剪影', '微醺时有举杯的人，用适当的民谣勾起情绪……', '2', '2019-07-17', 'img/G.E.M.jpg');
INSERT INTO `playlist` VALUES ('7', '谁的青春不迷茫', '在欢声笑语中我们体验快乐，在学习之路中我们体会快乐。', '2', '2019-07-17', 'img/新的心跳.jpg');
INSERT INTO `playlist` VALUES ('8', '洛阳旧事', '洛阳旧事，唯戏腔百转千回', '2', '2019-07-17', 'img/好安静.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userLeave` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', null, '男', '2705402601@qq.com', '1');
INSERT INTO `user` VALUES ('2', '123', 'qdNMRSDoErA=', '1', '123@qq.com', null);

# Host: localhost  (Version 5.7.20)
# Date: 2020-05-03 22:12:14
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `visitor` varchar(32) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `pubtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#

INSERT INTO `comment` VALUES (25,1000000000,'lsx','lsx','我的雪纳瑞，呜呜','2020-04-29 15:28:40'),(26,2000000000,'lsx','lsx','这是我的小狗捏','2020-04-29 16:48:45'),(27,2000000001,'pwz','lsx','你捡到的是我的雪纳瑞','2020-04-29 17:07:37'),(28,2000000001,'pwz','pwz','我怎么知道你是不是骗我的呢','2020-04-29 17:23:40'),(29,2000000001,'pwz','lsx','这真的是我的，因为她是siri。不信你叫她名字，她会高兴的摇尾巴的','2020-04-29 17:26:45'),(30,2000000001,'pwz','pwz','真的诶，你怎么那么不小心，把这么可爱的小狗弄丢了呢','2020-04-29 17:28:02'),(31,2000000001,'pwz','lsx','额，我那时候我吃零食太专注了，忘了看她，我下次一定会看好她的','2020-04-30 15:21:34'),(32,2000000001,'pwz','pwz','好吧，那我们在门口见面，把小狗还给你','2020-04-30 15:22:37'),(33,2000000001,'pwz','lsx','真的是太好了，我该怎么感谢你呢？要不请你吃零食吧','2020-04-30 15:24:29'),(34,2000000003,'nash','pwz','里面的人想出来，外面的人想进去','2020-05-03 20:02:15'),(35,1000000005,'nash','pwz','我在路上捡到了，请联系qq784413885','2020-05-03 22:00:25');

#
# Structure for table "found"
#

DROP TABLE IF EXISTS `found`;
CREATE TABLE `found` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(5) NOT NULL,
  `pickday` datetime NOT NULL,
  `pubtime` datetime NOT NULL,
  `address` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT '归还中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000000005 DEFAULT CHARSET=utf8;

#
# Data for table "found"
#

INSERT INTO `found` VALUES (2000000001,'pwz','捡到很可爱的雪纳瑞','宠物','2020-04-28 16:05:00','2020-04-29 17:06:19','大兴新区小区门口','c83a91e3-d72a-4a95-b4cc-25847e9b4a88.jpg','很可爱的小狗','归还中'),(2000000002,'lsx','捡到钱包','钱包','2020-05-02 20:05:00','2020-05-02 20:07:15','大兴新区小区门口','27186aa0-4b4d-4136-99d9-8cd89661d645.jpg','黑色的钱包，里面有若干现金以及各种卡','已归还'),(2000000003,'nash','捡到一本书','书籍/文件','2020-05-01 20:08:00','2020-05-02 20:09:46','香怡社区停车场','1d7b78f4-dd8a-4b38-b1ef-0cccffe4d006.jpg','书名为围城，内有失主姓名','归还中'),(2000000004,'wb','捡到一双鞋子','衣服/鞋帽','2020-05-03 20:11:00','2020-05-02 20:13:02','香怡社区停车场','52b69c3b-ecc2-4a25-b236-7ffe84a33bf3.jpg','灰色的Nike高帮鞋','归还中');

#
# Structure for table "lost"
#

DROP TABLE IF EXISTS `lost`;
CREATE TABLE `lost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `sort` varchar(5) NOT NULL,
  `lostday` datetime NOT NULL,
  `pubtime` datetime NOT NULL,
  `address` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT '寻找中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000006 DEFAULT CHARSET=utf8;

#
# Data for table "lost"
#

INSERT INTO `lost` VALUES (1000000001,'lsx','我的雪纳瑞丢了','宠物','2020-04-28 15:04:00','2020-04-29 17:05:26','大兴新区小区门口','9df2bc95-c68c-4795-99f5-57013f4b201f.jpg','很可爱的雪纳瑞，叫siri','已找回'),(1000000002,'nash','手表丢了','首饰/挂饰','2020-05-01 19:30:00','2020-05-02 19:35:43','香怡社区','4aacd1b6-1602-428a-9552-40acb8615a11.jpg','金色的劳力士，很贵的','寻找中'),(1000000003,'wb','苹果手机掉了','数码产品','2020-05-01 19:50:00','2020-05-02 19:51:56','香怡社区','cae88e19-24c3-4121-acbd-533d47f8abf0.jpg','iPhone 11，黑色的','寻找中'),(1000000004,'lsx','耳机丢了','数码产品','2020-05-01 17:00:00','2020-05-02 20:05:13','大兴新区花园','62adda4c-7589-4745-a966-3f0c03123a2e.jpg','黑色的beats，呜呜，我的第一个无线耳机','寻找中'),(1000000005,'nash','日语n1语法','书籍/文件','2020-05-14 21:47:00','2020-05-03 21:48:41','合肥市','3768ff90-cbe9-4c1d-94da-eef5b531a63e.jpg','a~a','寻找中');

#
# Structure for table "record"
#

DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `objectid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `title` varchar(50) NOT NULL,
  `sort` varchar(5) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `state` varchar(10) NOT NULL,
  `pubtime` datetime NOT NULL,
  `applyname` varchar(32) NOT NULL,
  `applytel` varchar(11) NOT NULL,
  `applyaddress` varchar(50) NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "record"
#

INSERT INTO `record` VALUES (1000000001,'lsx','我的雪纳瑞丢了','宠物','9df2bc95-c68c-4795-99f5-57013f4b201f.jpg','已找回','2020-05-03 19:50:19','彭文志','18130504973','香怡社区4#104'),(2000000002,'lsx','捡到钱包','钱包','27186aa0-4b4d-4136-99d9-8cd89661d645.jpg','已归还','2020-05-03 19:56:28','彭文志','18130504973','香怡社区4#104');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `gender` varchar(4) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL,
  `qq` varchar(11) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `role` varchar(4) NOT NULL DEFAULT '',
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES ('lsx','李诗雪','lsx1121','女','854946031@qq.com','854946031','15255183799','大兴新区','普通用户'),('nash','陈跃','123456','男','943275205@qq.com','943275205','18726984763','香怡社区','普通用户'),('pwz','彭文志','0311','男','18130504973@163.com','784413885','18130504973','香怡社区','管理员'),('wb','王彪','123456','男','1439334364@qq.com','1439334364','17354000425','香怡社区','普通用户');

-- MySQL dump 10.13  Distrib 5.6.32-78.0, for Linux (x86_64)
--
-- Host: localhost    Database: reboot10
-- ------------------------------------------------------
-- Server version	5.6.32-78.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='06f4187e-2ad1-11e7-af63-000c295f07de:1-33077,
f9afc21b-29a7-11e7-a7d2-000c295f07de:1-8';

--
-- Table structure for table `cabinet`
--

DROP TABLE IF EXISTS `cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '机柜名称',
  `idc_id` int(11) DEFAULT NULL COMMENT '所在机房ID',
  `u_num` varchar(10) DEFAULT NULL COMMENT 'U位',
  `power` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='机柜表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbinformation`
--

DROP TABLE IF EXISTS `dbinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbinformation` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jq` varchar(8) NOT NULL COMMENT '第几套集群',
  `ip` varchar(20) NOT NULL COMMENT 'DBip地址',
  `fd_ip` varchar(20) DEFAULT NULL COMMENT '浮动IP',
  `yw` varchar(30) NOT NULL COMMENT '业务名称',
  `bz` varchar(30) DEFAULT NULL COMMENT '什么版本，什么集群模式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbjcxx`
--

DROP TABLE IF EXISTS `dbjcxx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbjcxx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(27) NOT NULL,
  `duankou` varchar(20) DEFAULT NULL,
  `dfsize` varchar(20) DEFAULT NULL,
  `dfused` varchar(8) DEFAULT NULL,
  `dfavail` varchar(8) DEFAULT NULL,
  `cpu` varchar(8) DEFAULT NULL,
  `cpufz` varchar(8) DEFAULT NULL,
  `ncsize` varchar(8) DEFAULT NULL,
  `ncfz` varchar(8) DEFAULT NULL,
  `slave` varchar(20) DEFAULT NULL,
  `bf` varchar(50) DEFAULT NULL COMMENT '本地备份+远程备份',
  `data` varchar(255) DEFAULT NULL,
  `wlj` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbuserpd`
--

DROP TABLE IF EXISTS `dbuserpd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbuserpd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(27) NOT NULL COMMENT 'IP地址',
  `root_sys_password` varchar(20) DEFAULT '' COMMENT '操作系统root密码',
  `root_db_password` varchar(50) DEFAULT '' COMMENT '数据库root密码',
  `jq_position` varchar(10) DEFAULT '' COMMENT '机器所在机房',
  `code_person_in_charge` varchar(10) DEFAULT NULL,
  `jq_person_in_charge` varchar(10) DEFAULT '' COMMENT '机器负责人',
  `bz` varchar(10) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idc`
--

DROP TABLE IF EXISTS `idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '机房英文简写',
  `name_cn` varchar(50) DEFAULT NULL COMMENT '机房中文名',
  `address` varchar(128) DEFAULT NULL COMMENT '机房地址',
  `adminer` varchar(32) DEFAULT NULL COMMENT '机房联系人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='机房表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idclist`
--

DROP TABLE IF EXISTS `idclist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idclist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '机房名',
  `cabinets` varchar(50) NOT NULL COMMENT '机柜数量',
  `hosts` varchar(50) NOT NULL COMMENT '主机数量',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(11) NOT NULL COMMENT '电话',
  `remarks` varchar(10) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='idc列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_map`
--

DROP TABLE IF EXISTS `log_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `province` varchar(200) DEFAULT NULL,
  `geox` varchar(200) DEFAULT NULL,
  `geoy` varchar(200) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ops_jobs`
--

DROP TABLE IF EXISTS `ops_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apply_date` datetime NOT NULL COMMENT '创建时间',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '工单申请类型',
  `apply_desc` text NOT NULL COMMENT '工单申请描述',
  `deal_persion` varchar(20) DEFAULT NULL COMMENT '工单处理人',
  `status` tinyint(3) NOT NULL COMMENT '工单处理过程的状态',
  `deal_desc` text COMMENT '处理描述',
  `deal_time` datetime DEFAULT NULL COMMENT '处理完成时间',
  `apply_persion` varchar(20) NOT NULL COMMENT '工单申请人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(24) NOT NULL COMMENT '主机名',
  `lan_ip` varchar(24) DEFAULT NULL COMMENT '内网IP',
  `wan_ip` varchar(24) DEFAULT NULL COMMENT '外网IP',
  `cabinet_id` int(11) DEFAULT NULL COMMENT '机柜ID',
  `op` varchar(24) DEFAULT NULL COMMENT '运维负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT 'ç”¨æˆ·å',
  `name_cn` varchar(50) NOT NULL COMMENT 'ä¸­æ–‡å',
  `password` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·å¯†ç ',
  `email` varchar(50) DEFAULT NULL COMMENT 'ç”µå­é‚®ä»¶',
  `mobile` varchar(11) NOT NULL COMMENT 'æ‰‹æœºå·ç ',
  `role` varchar(10) NOT NULL COMMENT '1:sa;2:php;3:ios;4:test',
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `last_time` datetime DEFAULT NULL COMMENT 'æœ€åŽç™»å½•æ—¶é—´',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COMMENT='ç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13  4:50:36

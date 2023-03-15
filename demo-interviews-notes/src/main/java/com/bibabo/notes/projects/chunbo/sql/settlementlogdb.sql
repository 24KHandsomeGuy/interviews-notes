/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - settlementlogdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`settlementlogdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `settle_operate_log` */

CREATE TABLE `settle_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_date` datetime DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `operate_desc` varchar(500) DEFAULT NULL,
  `operate_detail` text,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23360209 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

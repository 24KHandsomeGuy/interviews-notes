/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - financialeventdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`financialeventdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `financial_cash_refund_sync_handle` */

CREATE TABLE `financial_cash_refund_sync_handle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8;

/*Table structure for table `financial_refund_to_balance_handle` */

CREATE TABLE `financial_refund_to_balance_handle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

/*Table structure for table `prepay_recharge_handle` */

CREATE TABLE `prepay_recharge_handle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

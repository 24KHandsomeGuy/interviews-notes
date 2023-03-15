/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - settlementconfigdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`settlementconfigdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `coop_seller_config` */

CREATE TABLE `coop_seller_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '1' COMMENT '公司 1-春播 2-开磷',
  `coop_id` int(11) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL,
  `coop_type` int(11) DEFAULT NULL,
  `coop_param` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sale_man_id` varchar(50) DEFAULT NULL COMMENT '销售专员编号',
  `sale_man_name` varchar(200) DEFAULT NULL COMMENT '销售专员名称',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1897 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_bill_type_config` */

CREATE TABLE `settle_bill_type_config` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `bill_type_id` int(11) DEFAULT NULL,
  `bill_name` varchar(50) DEFAULT NULL,
  `bill_alias_name` varchar(50) DEFAULT NULL,
  `sequence_no` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_fund_bill_map` */

CREATE TABLE `settle_fund_bill_map` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fund_type_id` int(11) DEFAULT NULL,
  `bill_type_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_fund_type_config` */

CREATE TABLE `settle_fund_type_config` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fund_type_id` int(11) DEFAULT NULL,
  `fund_type` int(11) DEFAULT NULL,
  `fund_name` varchar(50) DEFAULT NULL,
  `fund_alias_name` varchar(50) DEFAULT NULL,
  `sequence_no` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - financialcoredb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`financialcoredb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `balance_adjust_apply` */

CREATE TABLE `balance_adjust_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(32) NOT NULL,
  `applicat` varchar(32) NOT NULL,
  `acct_type` int(11) DEFAULT NULL,
  `account_id` varchar(20) NOT NULL,
  `buyer_id` bigint(20) DEFAULT NULL,
  `acct_name` varchar(32) DEFAULT NULL,
  `adjust_type` int(11) DEFAULT NULL,
  `adjust_amount` decimal(12,2) DEFAULT NULL,
  `adjust_reason` int(11) DEFAULT NULL,
  `adjust_desc` varchar(120) DEFAULT NULL,
  `approver` varchar(32) DEFAULT NULL,
  `approver_date` datetime DEFAULT NULL,
  `desc` varchar(120) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6575 DEFAULT CHARSET=utf8;

/*Table structure for table `external_order_receive` */

CREATE TABLE `external_order_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(150) DEFAULT NULL,
  `coop_id` int(11) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL,
  `is_adjust` int(11) DEFAULT '0' COMMENT '是否来自调账',
  `source_type` int(11) DEFAULT NULL,
  `receive_channel` int(11) DEFAULT NULL,
  `receive_type` int(11) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT NULL,
  `checked_amount` decimal(14,2) DEFAULT NULL,
  `unchecked_amount` decimal(14,2) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `order_trade_id` varchar(150) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `adjust_desc` varchar(128) DEFAULT '' COMMENT '调账备注',
  `adjust_type` int(11) DEFAULT '-10' COMMENT '调账原因 1折扣折让 2手续费 3其他原因',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_receive_id` (`receive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2139 DEFAULT CHARSET=utf8;

/*Table structure for table `external_receive_check_flow` */

CREATE TABLE `external_receive_check_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(100) DEFAULT NULL,
  `coop_id` int(11) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL,
  `receive_id` varchar(150) DEFAULT NULL,
  `checked_amount` decimal(14,2) DEFAULT NULL,
  `check_type` int(11) NOT NULL DEFAULT '1' COMMENT '对账支付币类型 1-现金 2-积分 3-券',
  `source_type` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_coop_id` (`coop_id`) USING BTREE,
  KEY `idx_receive_id` (`receive_id`) USING BTREE,
  KEY `idx_source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1395 DEFAULT CHARSET=utf8;

/*Table structure for table `fin_receive_refund_sale` */

CREATE TABLE `fin_receive_refund_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_type` int(11) DEFAULT NULL,
  `apply_date` varchar(20) DEFAULT NULL,
  `apply_time` varchar(20) DEFAULT NULL,
  `finish_date` varchar(20) DEFAULT NULL,
  `finish_time` varchar(20) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `pay_no` varchar(128) DEFAULT NULL,
  `amount_detail` varchar(500) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `channel_name` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '对应分公司编码',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_type_date` (`trade_type`,`finish_date`),
  KEY `index_pay_no` (`pay_no`),
  KEY `index_channel_name` (`channel_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5818 DEFAULT CHARSET=utf8;

/*Table structure for table `financial_actual_receive_sale` */

CREATE TABLE `financial_actual_receive_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '交易流水所属分公司',
  `pay_no` varchar(128) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `trade_type` int(11) DEFAULT NULL,
  `trade_desc` varchar(500) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `card_code` varchar(500) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `rt_discount` decimal(12,2) DEFAULT NULL,
  `discount_amount` decimal(12,2) DEFAULT NULL,
  `extend_param` varchar(5000) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_pay_no` (`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13476786 DEFAULT CHARSET=utf8;

/*Table structure for table `financial_actual_refund_sale` */

CREATE TABLE `financial_actual_refund_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '交易流水所属分公司',
  `refund_apply_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(128) DEFAULT NULL,
  `org_order_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `actual_refund_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实际退款成功金额',
  `acct_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `trade_type` int(11) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `card_code` varchar(500) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_reason` int(11) DEFAULT NULL,
  `extend_param` varchar(5000) DEFAULT NULL,
  `refund_apply_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=810774 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_usage_daily` */

CREATE TABLE `invoice_usage_daily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_payer_code` varchar(50) DEFAULT NULL,
  `tax_payer_name` varchar(200) DEFAULT NULL,
  `print_date` datetime DEFAULT NULL,
  `normal_quantity` int(11) DEFAULT NULL,
  `refund_quantity` int(11) DEFAULT NULL,
  `invalid_quantity` int(11) DEFAULT NULL,
  `normal_total_amount` decimal(14,4) DEFAULT NULL,
  `refund_total_amount` decimal(14,4) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3454 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_usage_daily_item` */

CREATE TABLE `invoice_usage_daily_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_payer_code` varchar(50) DEFAULT NULL,
  `tax_payer_name` varchar(200) DEFAULT NULL,
  `invoice_code` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `print_date` datetime DEFAULT NULL,
  `invoice_title` varchar(200) DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(14,4) DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `usage_status` int(11) DEFAULT NULL,
  `invoice_amount` decimal(14,4) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=469862 DEFAULT CHARSET=utf8;

/* Function  structure for function  `SPLIT_STR` */

DELIMITER $$

/*!50003 CREATE DEFINER=`pay`@`%` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '') */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

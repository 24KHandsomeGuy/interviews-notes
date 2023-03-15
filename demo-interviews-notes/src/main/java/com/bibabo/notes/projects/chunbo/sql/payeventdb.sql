/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : payeventdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_actual_refund_sync_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_actual_refund_sync_handle`;
CREATE TABLE `pay_actual_refund_sync_handle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(8000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3360464 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_balance_deposit_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_balance_deposit_handle`;
CREATE TABLE `pay_balance_deposit_handle` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_apply_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_apply_handle`;
CREATE TABLE `pay_cash_auto_refund_apply_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=664838 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_check_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_check_handle`;
CREATE TABLE `pay_cash_auto_refund_check_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13974786 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_deal_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_deal_handle`;
CREATE TABLE `pay_cash_auto_refund_deal_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=664824 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_query_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_query_handle`;
CREATE TABLE `pay_cash_auto_refund_query_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=652850 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_status_sync_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_status_sync_handle`;
CREATE TABLE `pay_cash_auto_refund_status_sync_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3288844 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_refund_notify_sale_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_refund_notify_sale_handle`;
CREATE TABLE `pay_cash_refund_notify_sale_handle` (
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

-- ----------------------------
-- Table structure for pay_cash_refund_sync_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_refund_sync_handle`;
CREATE TABLE `pay_cash_refund_sync_handle` (
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
) ENGINE=InnoDB AUTO_INCREMENT=732408 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_email_sms_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_email_sms_handle`;
CREATE TABLE `pay_email_sms_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8016326 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_no_cash_refund_notify_sale_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_no_cash_refund_notify_sale_handle`;
CREATE TABLE `pay_no_cash_refund_notify_sale_handle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(8000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440856 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_receive_sync_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_receive_sync_handle`;
CREATE TABLE `pay_receive_sync_handle` (
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
  PRIMARY KEY (`id`),
  KEY `si_idx` (`source_id`),
  KEY `idx_createdate` (`creation_date`),
  KEY `idx_status_type` (`status`,`source_type`)
) ENGINE=InnoDB AUTO_INCREMENT=35756824 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_refund_result_check_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund_result_check_handle`;
CREATE TABLE `pay_refund_result_check_handle` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3594786 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_trade_cancel_repay_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_cancel_repay_handle`;
CREATE TABLE `pay_trade_cancel_repay_handle` (
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
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_trade_check_sale_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_check_sale_handle`;
CREATE TABLE `pay_trade_check_sale_handle` (
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
) ENGINE=InnoDB AUTO_INCREMENT=29011668 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_trade_notify_sale_handle
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_notify_sale_handle`;
CREATE TABLE `pay_trade_notify_sale_handle` (
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
  PRIMARY KEY (`id`),
  KEY `idx_createdate` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16821030 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

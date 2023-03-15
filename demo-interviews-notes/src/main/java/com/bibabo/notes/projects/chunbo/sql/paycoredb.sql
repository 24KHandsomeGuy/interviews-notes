/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : paycoredb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_actual_receive_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_actual_receive_sale`;
CREATE TABLE `pay_actual_receive_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '订单所属分公司',
  `pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
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
  `extend_param` varchar(8000) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `idx_pay_no` (`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=35760828 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_actual_refund_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_actual_refund_sale`;
CREATE TABLE `pay_actual_refund_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '交易流水所属分公司',
  `refund_apply_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `actual_refund_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实际退款成功金额',
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `card_code` varchar(500) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_reason` int(11) DEFAULT NULL,
  `extend_param` varchar(8000) DEFAULT NULL,
  `refund_apply_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4870428 DEFAULT CHARSET=utf8;

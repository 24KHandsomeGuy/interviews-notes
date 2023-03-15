/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : accountdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acct_buyer_account
-- ----------------------------
DROP TABLE IF EXISTS `acct_buyer_account`;
CREATE TABLE `acct_buyer_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acct_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_type` int(11) DEFAULT NULL,
  `acct_status` int(11) DEFAULT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `frozen_balance` decimal(12,2) DEFAULT NULL,
  `point` decimal(12,0) DEFAULT NULL,
  `frozen_point` decimal(12,0) DEFAULT NULL,
  `balance_status` int(11) DEFAULT NULL,
  `giftcard_status` int(11) DEFAULT NULL,
  `coupon_status` int(11) DEFAULT NULL,
  `point_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_acct_id` (`acct_id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3563342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_buyer_pay_password
-- ----------------------------
DROP TABLE IF EXISTS `acct_buyer_pay_password`;
CREATE TABLE `acct_buyer_pay_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acct_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88874 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_change_log
-- ----------------------------
DROP TABLE IF EXISTS `acct_change_log`;
CREATE TABLE `acct_change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acct_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `change_type` int(11) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `card_code` varchar(200) DEFAULT NULL,
  `change_amount` decimal(12,2) DEFAULT NULL,
  `from_amount` decimal(12,2) DEFAULT NULL,
  `to_amount` decimal(12,2) DEFAULT NULL,
  `trade_id` varchar(128) DEFAULT NULL,
  `change_desc` varchar(500) DEFAULT NULL,
  `change_reason` int(11) DEFAULT NULL,
  `extend_param` varchar(8000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22093140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_encash_flow
-- ----------------------------
DROP TABLE IF EXISTS `acct_encash_flow`;
CREATE TABLE `acct_encash_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `apply_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `acct_type` int(11) DEFAULT NULL,
  `encash_amount` decimal(12,2) DEFAULT NULL,
  `encash_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for acct_message
-- ----------------------------
DROP TABLE IF EXISTS `acct_message`;
CREATE TABLE `acct_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(128) DEFAULT NULL,
  `msg_body` text,
  `op_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card
-- ----------------------------
DROP TABLE IF EXISTS `gift_card`;
CREATE TABLE `gift_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `card_code` varchar(50) DEFAULT NULL,
  `card_pwd` varchar(50) DEFAULT NULL,
  `active_buyer_id` int(11) DEFAULT NULL,
  `active_date` datetime DEFAULT NULL,
  `active_source` int(11) DEFAULT NULL,
  `medium_type` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `discount` decimal(14,4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `sku_id` varchar(32) DEFAULT NULL,
  `card_name` varchar(100) DEFAULT NULL,
  `card_alias_name` varchar(100) DEFAULT NULL,
  `card_desc` varchar(200) DEFAULT NULL,
  `face_value` decimal(14,4) DEFAULT NULL,
  `remain_value` decimal(14,4) DEFAULT NULL,
  `buy_source` int(11) DEFAULT NULL,
  `send_status` int(11) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `receiver_email` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `delay_count` int(11) DEFAULT NULL,
  `freeze_status` int(11) DEFAULT NULL,
  `buy_order_id` varchar(50) DEFAULT NULL,
  `buy_buyer_id` int(11) DEFAULT NULL,
  `receive_flag` int(11) DEFAULT NULL,
  `receive_id` varchar(50) NOT NULL DEFAULT '19710101' COMMENT '领用申请号ID',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_serial_no` (`serial_no`),
  KEY `idx_card_code` (`card_code`),
  KEY `idx_active_buyer_id` (`active_buyer_id`),
  KEY `idx_buy_order_id` (`buy_order_id`),
  KEY `idx_apply_id` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4174588 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_apply
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_apply`;
CREATE TABLE `gift_card_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `card_name` varchar(100) DEFAULT NULL,
  `card_alias_name` varchar(100) DEFAULT NULL,
  `card_desc` varchar(200) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_amount` decimal(24,4) DEFAULT NULL,
  `usage_type` int(11) DEFAULT NULL,
  `customer_type` int(11) NOT NULL DEFAULT '0' COMMENT '是否定制卡,0-非定制,1-定制',
  `apply_department` int(11) DEFAULT NULL,
  `store_address` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `cancel_desc` varchar(200) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `apply_by` varchar(50) DEFAULT NULL,
  `down_date` datetime DEFAULT NULL,
  `category_flag` int(11) DEFAULT '0' COMMENT '1-多选 0-单选',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=7024 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_apply_item
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_apply_item`;
CREATE TABLE `gift_card_apply_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(50) DEFAULT NULL,
  `medium_type` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `face_value` decimal(14,4) DEFAULT NULL,
  `sku_id` varchar(32) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` decimal(14,4) DEFAULT NULL,
  `start_serial_no` varchar(50) DEFAULT NULL,
  `end_serial_no` varchar(50) DEFAULT NULL,
  `receive_flag` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=7032 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_category_map
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_category_map`;
CREATE TABLE `gift_card_category_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(50) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `category_level` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类等级',
  `category_name` varchar(200) DEFAULT NULL,
  `category_alias_name` varchar(100) DEFAULT NULL,
  `delivery_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '配送范围',
  `card_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26932 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_delay_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_delay_log`;
CREATE TABLE `gift_card_delay_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `org_start_date` datetime DEFAULT NULL,
  `org_end_date` datetime DEFAULT NULL,
  `new_start_date` datetime DEFAULT NULL,
  `new_end_date` datetime DEFAULT NULL,
  `remain_value` decimal(14,4) DEFAULT NULL,
  `delay_desc` varchar(500) DEFAULT NULL,
  `operate_source` int(11) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95576 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_freeze_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_freeze_log`;
CREATE TABLE `gift_card_freeze_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `remain_value` decimal(14,4) DEFAULT NULL,
  `freeze_desc` varchar(500) DEFAULT NULL,
  `operate_source` int(11) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_invalid_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_invalid_log`;
CREATE TABLE `gift_card_invalid_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `invalid_desc` varchar(500) DEFAULT NULL,
  `operate_source` int(11) DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3848398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_receive_apply
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_apply`;
CREATE TABLE `gift_card_receive_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(50) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_amount` decimal(24,4) DEFAULT NULL,
  `total_discount_amount` decimal(14,2) DEFAULT NULL,
  `coop_id` int(11) DEFAULT '0' COMMENT '客户编号',
  `coop_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `invoice_status` int(11) DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `account_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '余额卡充值客户端显示备注',
  `cancel_desc` varchar(200) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `apply_by` varchar(50) DEFAULT NULL,
  `sale_manager` varchar(50) NOT NULL DEFAULT 'SYSTEM' COMMENT '一审人',
  `approver` varchar(50) DEFAULT 'SYSTEM' COMMENT '审批人',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_receive_id` (`receive_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=22306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_receive_apply_item
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_apply_item`;
CREATE TABLE `gift_card_receive_apply_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(50) DEFAULT NULL,
  `receive_item_id` varchar(50) DEFAULT NULL,
  `apply_id` varchar(254) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `medium_type` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `face_value` decimal(14,4) DEFAULT NULL,
  `discount_price` decimal(14,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `receive_desc` varchar(200) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `receive_by` varchar(50) DEFAULT NULL,
  `receive_email` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_receive_id` (`receive_id`(10)),
  KEY `idx_receive_item_id` (`receive_item_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=34248 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_receive_invoice_map
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_invoice_map`;
CREATE TABLE `gift_card_receive_invoice_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(100) DEFAULT NULL COMMENT '发票号',
  `receive_id` varchar(100) DEFAULT NULL COMMENT '领用申请号',
  `invoice_title` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `tax_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司税号',
  `invoice_body` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `invoice_amount` decimal(14,2) DEFAULT NULL COMMENT '发票金额',
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12256 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_receive_invoice_sku
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_invoice_sku`;
CREATE TABLE `gift_card_receive_invoice_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` varchar(50) NOT NULL DEFAULT '' COMMENT '商品编码',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_class` varchar(100) NOT NULL DEFAULT '' COMMENT '分类描述',
  `tax_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总售价',
  `applyed_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '已申请数量',
  `applyed_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已经申请开票金额',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人',
  `last_changed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `changed_by` varchar(50) NOT NULL DEFAULT '' COMMENT '最后修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63336 DEFAULT CHARSET=utf8 COMMENT='春播卡可开票商品明细';

-- ----------------------------
-- Table structure for gift_card_receive_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_log`;
CREATE TABLE `gift_card_receive_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(50) DEFAULT NULL,
  `receive_item_id` varchar(50) DEFAULT NULL,
  `apply_id` varchar(50) DEFAULT NULL,
  `medium_type` int(11) DEFAULT NULL,
  `face_value` decimal(14,4) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `start_serial_no` varchar(50) DEFAULT NULL,
  `end_serial_no` varchar(50) DEFAULT NULL,
  `receive_desc` varchar(200) DEFAULT NULL,
  `receive_email` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_receive_item_id` (`receive_item_id`(10)),
  KEY `idx_receive_id` (`receive_id`(10)),
  KEY `idx_apply_id` (`apply_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=33732 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_receive_pay_map
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_receive_pay_map`;
CREATE TABLE `gift_card_receive_pay_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(50) DEFAULT NULL,
  `received_amount` decimal(14,2) DEFAULT NULL COMMENT '已收款金额',
  `handing_amount` decimal(14,2) DEFAULT NULL COMMENT '手续费',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账户',
  `pay_bill_no` varchar(50) DEFAULT NULL COMMENT '收款流水号',
  `receive_date` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '收款时间',
  `status` int(11) DEFAULT '1' COMMENT '收款状态 1-有效 -100-无效',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `last_changed_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22076 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gift_card_return_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_card_return_log`;
CREATE TABLE `gift_card_return_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_id` varchar(50) NOT NULL DEFAULT '20000101' COMMENT '申请批次ID',
  `receive_item_id` varchar(50) NOT NULL DEFAULT '20000101' COMMENT '卡明细ID',
  `receive_log_id` varchar(50) NOT NULL DEFAULT '20000101' COMMENT '领用日志ID',
  `apply_id` varchar(50) NOT NULL DEFAULT '20000101' COMMENT '制卡ID',
  `card_type` int(11) NOT NULL DEFAULT '0' COMMENT '卡类型',
  `medium_type` int(11) NOT NULL DEFAULT '0' COMMENT '卡介质',
  `face_value` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '卡面额',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `discount_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '卡售价',
  `start_serial_no` varchar(50) NOT NULL DEFAULT '0' COMMENT '起始序列号',
  `end_serial_no` varchar(50) NOT NULL DEFAULT '0' COMMENT '结束序列号',
  `creation_date` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间',
  `return_desc` varchar(128) NOT NULL DEFAULT 'SYSTEM' COMMENT '退卡描述',
  `created_by` varchar(50) NOT NULL DEFAULT 'SYSTEM' COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26842 DEFAULT CHARSET=utf8 COMMENT='退卡记录表';

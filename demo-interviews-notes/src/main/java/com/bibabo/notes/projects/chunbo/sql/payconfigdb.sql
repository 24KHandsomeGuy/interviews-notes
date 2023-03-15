/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : payconfigdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_channel_activity
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_activity`;
CREATE TABLE `pay_channel_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `platform_type` varchar(64) DEFAULT '' COMMENT '平台名',
  `activity_type` int(11) DEFAULT NULL,
  `activity_title` varchar(255) DEFAULT NULL,
  `activity_desc` varchar(100) DEFAULT NULL,
  `activity_url` varchar(255) DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT '0.0000' COMMENT '活动总金额',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `activity_detail` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_channel_authorize_map
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_authorize_map`;
CREATE TABLE `pay_channel_authorize_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `source_operator` varchar(50) DEFAULT NULL,
  `extend_params` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_channel_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_config`;
CREATE TABLE `pay_channel_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(50) DEFAULT NULL,
  `channel_alias_name` varchar(50) DEFAULT NULL,
  `channel_type_id` int(11) DEFAULT NULL,
  `display_seq` int(11) DEFAULT NULL,
  `support_pay_way` int(11) DEFAULT NULL,
  `channel_display_type` int(11) DEFAULT NULL,
  `display_plat` int(11) DEFAULT NULL,
  `logo_img_src` varchar(100) DEFAULT NULL,
  `logo_unionpay_img` varchar(100) DEFAULT NULL COMMENT '银联标识地址',
  `logo_quickpass_img` varchar(100) DEFAULT NULL COMMENT '闪付标识地址',
  `channel_status` int(11) DEFAULT NULL,
  `channel_memo` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_channel_gateway_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_gateway_config`;
CREATE TABLE `pay_channel_gateway_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '门店号',
  `merchant_id` varchar(100) DEFAULT NULL,
  `gateway_type` int(11) DEFAULT NULL,
  `gateway_url` varchar(100) DEFAULT NULL,
  `other_gateway_url` varchar(100) DEFAULT NULL,
  `notify_url` varchar(200) DEFAULT NULL,
  `return_url` varchar(200) DEFAULT NULL,
  `service_version` varchar(50) DEFAULT NULL,
  `sign_type` varchar(50) DEFAULT NULL,
  `input_charset` varchar(50) DEFAULT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `merchant_key` text,
  `merchant_login_key` varchar(500) DEFAULT NULL,
  `merchant_cert_dir` varchar(200) DEFAULT NULL,
  `merchant_cert_name` varchar(100) DEFAULT NULL,
  `merchant_acct_id` varchar(50) DEFAULT NULL,
  `merchant_email` varchar(100) DEFAULT NULL,
  `out_platform_key` varchar(2000) DEFAULT NULL,
  `out_platform_cert_dir` varchar(200) DEFAULT NULL,
  `out_platform_cert_name` varchar(100) DEFAULT NULL,
  `extend_param` varchar(8000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_company_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_company_config`;
CREATE TABLE `pay_company_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT '1' COMMENT '公司编号',
  `company_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `status` tinyint(3) DEFAULT NULL COMMENT '公司是否有效 1-有效 -100 无效',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_change_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `changed_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `created_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_method_type
-- ----------------------------
DROP TABLE IF EXISTS `pay_method_type`;
CREATE TABLE `pay_method_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `type_desc` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_notify_config`;
CREATE TABLE `pay_notify_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `notify_url` varchar(100) DEFAULT NULL,
  `return_url` varchar(100) DEFAULT NULL,
  `error_url` varchar(100) DEFAULT NULL,
  `extend_param` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_rel_channel_activity
-- ----------------------------
DROP TABLE IF EXISTS `pay_rel_channel_activity`;
CREATE TABLE `pay_rel_channel_activity` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL COMMENT '支付渠道id',
  `parent_channel_id` int(11) DEFAULT NULL COMMENT '父支付渠道编号',
  `channel_name` varchar(50) DEFAULT '' COMMENT '支付渠道名字',
  `channel_alias_name` varchar(50) DEFAULT NULL COMMENT '支付渠道别名',
  `platform_type` tinyint(11) DEFAULT NULL COMMENT '平台:1-ios,2-安卓,3-pc;4-H5,5-小程序',
  `platform_name` varchar(16) DEFAULT '' COMMENT '平台名',
  `status` tinyint(11) DEFAULT NULL COMMENT '状态:0-不可用,1-可用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changed_by` varchar(50) DEFAULT 'SYSTEM' COMMENT '更新人',
  `last_changed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='支付渠道与春播平台关系表';

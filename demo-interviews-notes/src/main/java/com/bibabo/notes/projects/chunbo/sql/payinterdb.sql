/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : payinterdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for channel_notify_discount_alipay
-- ----------------------------
DROP TABLE IF EXISTS `channel_notify_discount_alipay`;
CREATE TABLE `channel_notify_discount_alipay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_no` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `type` varchar(50) DEFAULT NULL COMMENT '优惠券形式，直接参考字符串值区分',
  `creation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for channel_notify_discount_icbc
-- ----------------------------
DROP TABLE IF EXISTS `channel_notify_discount_icbc`;
CREATE TABLE `channel_notify_discount_icbc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_no` varchar(128) NOT NULL COMMENT '系统支付渠道流水号',
  `point_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分抵扣金额',
  `ecoupon_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '电子抵扣券金额',
  `coupon_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `mer_disc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠立减金额（商户部分）',
  `bank_disc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '银行补贴金额',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='工行支付折扣信息记录表';

-- ----------------------------
-- Table structure for channel_notify_discount_normal
-- ----------------------------
DROP TABLE IF EXISTS `channel_notify_discount_normal`;
CREATE TABLE `channel_notify_discount_normal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_no` varchar(128) NOT NULL COMMENT '渠道支付流水号',
  `coupon_amount` decimal(10,2) NOT NULL COMMENT '优惠券金额，必需',
  `coupon_id` varchar(32) DEFAULT NULL COMMENT '券在三方平台的标识，不一定存在',
  `coupon_desc` varchar(100) DEFAULT NULL COMMENT '券说明信息，可以用来描述券的种类等信息',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22242 DEFAULT CHARSET=utf8 COMMENT='较通用的优惠券记录表，常规的简单优惠券信息可以记录到这个表中';

-- ----------------------------
-- Table structure for channel_notify_discount_wxcoupon
-- ----------------------------
DROP TABLE IF EXISTS `channel_notify_discount_wxcoupon`;
CREATE TABLE `channel_notify_discount_wxcoupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_no` varchar(128) NOT NULL COMMENT '关联的系统支付渠道流水号',
  `coupon_id` varchar(32) DEFAULT NULL COMMENT '优惠券id',
  `activity_id` varchar(32) DEFAULT NULL COMMENT '券的优惠活动批次号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券面值金额',
  `type` varchar(15) DEFAULT NULL COMMENT '优惠券类型:NULL(无特定描述的券)；NO_CASH(不需要预先充值型的代金券)；CASH(预先充值型代金券)',
  `scope` varchar(15) DEFAULT 'GLOBAL' COMMENT '优惠券或者代金券的使用范围：NULL（无特定范围说明的券）；GLOBAL（全场商品可用的券）；SINGLE（指定商品可用的券）',
  `channel_contribute` decimal(10,2) DEFAULT '0.00' COMMENT '支付平台出资',
  `cb_contribute` decimal(10,2) DEFAULT '0.00' COMMENT '春播出资',
  `other_contribute` decimal(10,2) DEFAULT '0.00' COMMENT '其他出资',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23546 DEFAULT CHARSET=utf8 COMMENT='微信支付渠道关联的代金券信息';

-- ----------------------------
-- Table structure for pay_auto_refund_notify_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_auto_refund_notify_flow_sale`;
CREATE TABLE `pay_auto_refund_notify_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `org_order_id` varchar(50) DEFAULT NULL COMMENT '订单号',
  `refund_amount` decimal(12,2) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL,
  `error_msg` varchar(200) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_refund_batch_id` (`refund_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197730 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_flow_sale`;
CREATE TABLE `pay_cash_auto_refund_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `actual_refund_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实际退款成功金额',
  `org_pay_amount` decimal(12,2) DEFAULT NULL,
  `org_pay_date` datetime DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL COMMENT '0-待申请\r\n1-待查询\r\n2-退款成功\r\n3-退款失败',
  `extend_param` varchar(5000) DEFAULT NULL,
  `refund_apply_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=664838 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_cash_refund_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_refund_flow_sale`;
CREATE TABLE `pay_cash_refund_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(128) DEFAULT NULL,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_parent_channel` int(11) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL,
  `sync_status` int(11) DEFAULT NULL,
  `extend_param` varchar(5000) DEFAULT NULL,
  `refund_send_date` datetime DEFAULT NULL,
  `refund_confirm_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `refund_error_code` varchar(50) DEFAULT NULL,
  `refund_error_desc` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=713980 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_channel_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_flow_sale`;
CREATE TABLE `pay_channel_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(128) DEFAULT NULL,
  `pay_no` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `trade_desc` varchar(500) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `rt_discount` decimal(12,2) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `trade_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `idx_pay_no` (`pay_no`),
  KEY `idx_createdate` (`trade_status`,`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=19453556 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_channel_notify_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_channel_notify_flow_sale`;
CREATE TABLE `pay_channel_notify_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(128) DEFAULT NULL,
  `pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `out_buyer_id` varchar(32) DEFAULT '' COMMENT '记录外部支付平台（支付宝，微信，银行等）的支付账号',
  `trade_desc` varchar(500) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `parent_channel_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `discount_amount` decimal(12,2) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `trade_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pay_no` (`pay_no`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `creation_date_idx` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16823362 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_exception_trade_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_exception_trade_flow_sale`;
CREATE TABLE `pay_exception_trade_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `exception_desc` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_no_cash_adjust_flow
-- ----------------------------
DROP TABLE IF EXISTS `pay_no_cash_adjust_flow`;
CREATE TABLE `pay_no_cash_adjust_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `partner_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `adjust_desc` varchar(500) DEFAULT NULL,
  `adjust_type` int(11) DEFAULT NULL,
  `adjust_reason` varchar(50) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `adjust_status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1767194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_no_cash_deduct_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_no_cash_deduct_flow_sale`;
CREATE TABLE `pay_no_cash_deduct_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `partner_id` bigint(20) DEFAULT NULL,
  `trade_id` varchar(128) DEFAULT NULL,
  `pay_no` varchar(128) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `trade_type` int(11) DEFAULT NULL,
  `trade_desc` varchar(500) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `card_code` varchar(500) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `trade_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `idx_card_code` (`card_code`(255)),
  KEY `idx_type_status` (`money_type`,`trade_status`),
  KEY `idx_creation_date` (`creation_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19042164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_no_cash_refund_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_no_cash_refund_flow_sale`;
CREATE TABLE `pay_no_cash_refund_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(128) DEFAULT NULL,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `acct_id` varchar(128) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `card_code` varchar(500) DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL,
  `sync_status` int(11) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `extend_param` text,
  `refund_finish_date` datetime DEFAULT NULL,
  `refund_error_code` varchar(50) DEFAULT NULL,
  `refund_error_desc` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_refund_id` (`refund_id`),
  KEY `idx_creation_date` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1622570 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_refund_flow_item_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund_flow_item_sale`;
CREATE TABLE `pay_refund_flow_item_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(128) DEFAULT NULL,
  `parent_refund_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(2000) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `actual_refund_amount` decimal(12,2) DEFAULT NULL,
  `able_refund_amount` decimal(12,2) DEFAULT NULL,
  `apply_refund_amount` decimal(12,2) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_parent_channel_id` int(11) DEFAULT NULL,
  `refund_channel_id` int(11) DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_id_idx` (`refund_id`),
  KEY `idx_parent_refund_id` (`parent_refund_id`),
  KEY `idx_creation_date` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2263184 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_refund_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund_flow_sale`;
CREATE TABLE `pay_refund_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) DEFAULT NULL,
  `refund_apply_id` varchar(128) DEFAULT NULL,
  `refund_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '订单所属分公司',
  `order_id` varchar(128) DEFAULT NULL,
  `refund_num` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_reason` int(11) DEFAULT NULL,
  `calc_status` int(11) DEFAULT NULL,
  `coupon_refund_flag` varchar(10) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `notify_url` varchar(200) DEFAULT NULL,
  `refund_apply_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_partner_refund_id` (`partner_id`,`refund_apply_id`),
  KEY `idx_refund_id` (`refund_id`),
  KEY `idx_refund_apply_id` (`refund_apply_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1745228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_trade_flow_item_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_flow_item_sale`;
CREATE TABLE `pay_trade_flow_item_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` varchar(128) DEFAULT NULL,
  `company_id` int(11) DEFAULT '1' COMMENT '订单所属分公司',
  `parent_trade_id` varchar(128) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺标识字段，字段值为0是默认的没有含义，如果交易产生于线下零售店，则此字段需要赋值',
  `amount` decimal(12,2) DEFAULT NULL,
  `trade_type` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_trade_id` (`trade_id`),
  KEY `idx_ptrade_id` (`parent_trade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19359732 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_trade_flow_sale
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_flow_sale`;
CREATE TABLE `pay_trade_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) DEFAULT NULL,
  `trade_id` varchar(128) DEFAULT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺标识字段，字段值为0是默认的没有含义，如果交易产生于线下零售店，则此字段需要赋值',
  `order_num` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `buyer_email` varchar(50) DEFAULT NULL,
  `buyer_name` varchar(50) DEFAULT NULL,
  `trade_desc` varchar(500) DEFAULT NULL,
  `exter_invoke_ip` varchar(100) DEFAULT NULL,
  `extra_common_param` varchar(1000) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `enable_pay_way` varchar(200) DEFAULT NULL,
  `unable_channel` varchar(200) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `channel_bank_name` varchar(50) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `return_url` varchar(200) DEFAULT NULL,
  `notify_url` varchar(200) DEFAULT NULL,
  `error_url` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_trade_id` (`trade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19352938 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_uid_sequence
-- ----------------------------
DROP TABLE IF EXISTS `pay_uid_sequence`;
CREATE TABLE `pay_uid_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169973566 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_deduction_contract
-- ----------------------------
DROP TABLE IF EXISTS `wx_deduction_contract`;
CREATE TABLE `wx_deduction_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` varchar(30) NOT NULL COMMENT '签约模板号',
  `openid` varchar(32) NOT NULL COMMENT '小程序用户openid',
  `buyer_id` int(11) NOT NULL COMMENT '春播用户ID',
  `contract_state` varchar(15) NOT NULL COMMENT '取值：send（初始值为发送签约状态），signed（已签约），termination（解约状态）',
  `contract_code` varchar(32) NOT NULL COMMENT '系统生成的签约协议号',
  `wx_contract_id` varchar(32) DEFAULT NULL COMMENT '微信签约协议号，签约成功后写入值',
  `contract_time` timestamp NULL DEFAULT NULL COMMENT '签约的时间，签约成功后写入值',
  `contract_expire_time` timestamp NULL DEFAULT NULL COMMENT '签约过期时间，签约成功后写入值',
  `termination_reason` tinyint(4) DEFAULT NULL COMMENT '解约原因，取值范围：1（有效期过自动解约），2（用户主动解约），3（商户API解约），4（商户平台解约），5（用户帐号注销），null（当用户没有解约时此字段设置为null即可）',
  `termination_time` timestamp NULL DEFAULT NULL COMMENT '解约时间，没有解约时此字段设置为null即可',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_openid_planid` (`openid`,`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='微信免密代扣签约状态记录';

/*
Navicat MySQL Data Transfer

Source Server         : pay-fukuixiang
Source Server Version : 50628
Source Host           : birdb-pay.prod.chunbo.com:3307
Source Database       : paylogdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pay_cash_auto_refund_flow_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_cash_auto_refund_flow_log`;
CREATE TABLE `pay_cash_auto_refund_flow_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL COMMENT '1-	退款审核\r\n2-	退款申请\r\n3-	退款查询\r\n4-	退款完成',
  `out_trade_id` varchar(128) DEFAULT NULL,
  `out_refund_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `succ_total_amount` decimal(12,2) DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `org_pay_amount` decimal(12,2) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `channel_type` int(11) DEFAULT NULL COMMENT '0-	银行1-	平台',
  `refund_status` int(11) DEFAULT NULL COMMENT '退款状态\r\n1-	检查完成\r\n2-	申请成功\r\n3-	申请失败\r\n4-	退款成功\r\n5-	退款失败\r\n6-	处理完成\r\n-100- 无效\r\n',
  `extend_param` varchar(500) DEFAULT NULL,
  `error_code` varchar(50) DEFAULT NULL,
  `error_msg` varchar(500) DEFAULT NULL,
  `refund_apply_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2646116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pay_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_operate_log`;
CREATE TABLE `pay_operate_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_date` datetime DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `operate_desc` varchar(500) DEFAULT NULL,
  `operate_detail` text,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464954790 DEFAULT CHARSET=utf8;

/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - financialinterdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`financialinterdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `acct_encash_apply` */

CREATE TABLE `acct_encash_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `buyer_email` varchar(50) DEFAULT NULL,
  `buyer_mobile` varchar(50) DEFAULT NULL,
  `apply_amount` decimal(12,2) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `bank_card_no` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `encash_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_apply_id` (`apply_id`) USING BTREE,
  KEY `idx_buyer_id` (`buyer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `acct_encash_trans_log` */

CREATE TABLE `acct_encash_trans_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` varchar(128) DEFAULT NULL,
  `encash_status` int(11) DEFAULT NULL,
  `operator_type` int(11) DEFAULT NULL,
  `operator_name` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `b2b_prepay` */

CREATE TABLE `b2b_prepay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `prepay_id` varchar(128) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `prepay_amount` decimal(14,4) DEFAULT NULL,
  `prepay_type` int(11) DEFAULT NULL,
  `pay_way` int(11) DEFAULT NULL,
  `payer` varchar(128) DEFAULT NULL,
  `payer_tel` varchar(128) DEFAULT NULL,
  `pay_flow_no` varchar(128) DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `invoice_apply_amount` decimal(14,4) DEFAULT NULL,
  `invoiced_amount` decimal(14,4) DEFAULT NULL,
  `invoice_details` varchar(5000) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `invoice_status` int(11) DEFAULT NULL,
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `buyer_receive_pay_flow_sale` */

CREATE TABLE `buyer_receive_pay_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL,
  `sku_num` int(11) NOT NULL DEFAULT '1',
  `sku_type` int(11) DEFAULT NULL,
  `sku_first_category_id` varchar(50) DEFAULT '' COMMENT '商品一级分类',
  `warehouse_id` varchar(50) DEFAULT NULL,
  `refund_apply_id` varchar(128) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `order_source` int(11) DEFAULT NULL,
  `order_shop` int(11) DEFAULT '1' COMMENT '1-春播 2-开磷',
  `money_type` int(11) DEFAULT NULL COMMENT '1-现金  2-余额   3-礼品卡   4-礼券  5-积分  6-商品卡  7-兜礼积分',
  `total_amount` decimal(12,2) DEFAULT NULL,
  `sale_tax_rate` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '销项税率',
  `shipping_fee` decimal(12,2) DEFAULT NULL,
  `parent_channel` varchar(50) DEFAULT NULL,
  `child_channel` varchar(50) DEFAULT NULL,
  `trade_date` datetime DEFAULT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '付款时间',
  `remark` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `skud_idx` (`sku_id`),
  KEY `refund_ai_idx` (`refund_apply_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_status_source` (`status`,`money_type`,`order_type`,`order_source`)
) ENGINE=InnoDB AUTO_INCREMENT=161498053 DEFAULT CHARSET=utf8;

/*Table structure for table `external_bill_check` */

CREATE TABLE `external_bill_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(150) DEFAULT NULL,
  `coop_id` int(11) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL,
  `settle_period` varchar(50) DEFAULT NULL,
  `should_amount` decimal(14,2) DEFAULT NULL,
  `commission_rate` decimal(14,4) DEFAULT NULL,
  `commission_amount` decimal(14,2) DEFAULT NULL,
  `real_amount` decimal(14,2) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `order_detail` text,
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `external_order_check` */

CREATE TABLE `external_order_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `coop_id` int(11) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL,
  `sale_plan_id` varchar(128) DEFAULT 'sp' COMMENT '?????',
  `order_id` varchar(128) DEFAULT NULL,
  `third_order_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'ä¸‰æ–¹ä¼é”€è®¢å•å·',
  `refund_apply_id` varchar(50) DEFAULT NULL COMMENT '退款申请单号',
  `order_type` int(11) DEFAULT NULL,
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源',
  `total_amount` decimal(14,2) DEFAULT NULL,
  `real_amount` decimal(14,2) DEFAULT NULL,
  `pay_amount` decimal(14,2) DEFAULT '0.00' COMMENT '实际支付现金',
  `point_amount` decimal(14,2) DEFAULT '0.00' COMMENT '三方订单积分',
  `coupon_amount` decimal(14,2) DEFAULT '0.00' COMMENT '三方券',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT '三方券号',
  `order_creation_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_status` int(11) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `voucher_status` int(11) NOT NULL DEFAULT '0' COMMENT '???? 0 ??? 10 ???',
  `saler_name` varchar(50) DEFAULT NULL,
  `saler_mobile` varchar(20) DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT '1' COMMENT '公司 1-春播 2-开磷',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`) USING BTREE,
  KEY `sale_plan_id_idx` (`sale_plan_id`) USING BTREE,
  KEY `idx_co_id` (`coop_id`),
  KEY `idx_unique_id` (`unique_id`),
  KEY `idx_createDate` (`order_creation_date`),
  KEY `idx_date` (`delivery_date`),
  KEY `idx_stat` (`delivery_status`,`voucher_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3770711 DEFAULT CHARSET=utf8;

/*Table structure for table `fin_receive_refund_sale` */

CREATE TABLE `fin_receive_refund_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_type` int(11) DEFAULT NULL COMMENT '交易类型 1-支付 2-退款',
  `apply_date` varchar(20) DEFAULT NULL COMMENT '退款申请日期',
  `apply_time` varchar(20) DEFAULT NULL COMMENT '退款申请时间',
  `finish_date` varchar(20) DEFAULT NULL COMMENT '支付/退款完成日期',
  `finish_time` varchar(20) DEFAULT NULL COMMENT '支付/退款完成时间',
  `order_id` varchar(128) DEFAULT NULL COMMENT '订单ID',
  `pay_no` varchar(128) DEFAULT NULL COMMENT '支付单ID',
  `amount_detail` varchar(500) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL COMMENT '平台类型 1-PC 2-无线 3-WAP',
  `channel_name` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312210 DEFAULT CHARSET=utf8;

/*Table structure for table `financial_cash_refund_flow_sale` */

CREATE TABLE `financial_cash_refund_flow_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_seq_id` bigint(20) DEFAULT NULL,
  `refund_id` varchar(128) DEFAULT NULL,
  `refund_batch_id` varchar(128) DEFAULT NULL,
  `org_trade_id` varchar(128) DEFAULT NULL,
  `org_order_id` varchar(128) DEFAULT NULL,
  `org_pay_no` varchar(128) DEFAULT NULL,
  `out_trade_id` varchar(128) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `refund_desc` varchar(500) DEFAULT NULL,
  `refund_parent_channel` int(11) DEFAULT NULL,
  `refund_channel` int(11) DEFAULT NULL,
  `platform_type` int(11) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `refund_status` int(11) DEFAULT NULL,
  `extend_param` text,
  `refund_send_date` datetime DEFAULT NULL,
  `refund_finish_date` datetime DEFAULT NULL,
  `refund_error_code` varchar(50) DEFAULT NULL,
  `refund_error_desc` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_refund_id` (`refund_id`),
  KEY `idx_createDate` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1394 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_bill_flow` */

CREATE TABLE `invoice_bill_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `out_invoice_id` varchar(128) DEFAULT NULL,
  `invoice_id` varchar(128) DEFAULT NULL,
  `bill_id` text,
  `bill_type` int(11) DEFAULT NULL COMMENT '流水单类型：1-销售订单2-销售订单（宅配）3-春播卡4-服务费5-其他6-预收款7-销售订单（企业）8-悦店团单',
  `bill_source` int(11) DEFAULT NULL COMMENT '订单来源来源：1-TMS2-春播卡系统3-发票系统4-客服系统5-企销系统 22-扫码开票（开璘）',
  `fill_flag` int(11) DEFAULT NULL COMMENT '补开标记：0 未补开  1 已补开',
  `medium_type` int(11) NOT NULL DEFAULT '2' COMMENT '发票介质 1.电子 2.纸质',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型：1-普通发票2-增值税发票3-电子发票4-专业发票',
  `invoice_drawer` varchar(100) DEFAULT NULL COMMENT '开票单位',
  `invoice_title` varchar(200) DEFAULT NULL,
  `invoice_content` varchar(128) NOT NULL DEFAULT '' COMMENT '发票内容',
  `tax_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司税号',
  `payment_no` varchar(255) DEFAULT '' COMMENT '支付流水号',
  `invoice_no` varchar(128) DEFAULT NULL COMMENT '发票号码',
  `invoice_dm` varchar(50) NOT NULL DEFAULT '0' COMMENT '发票代码',
  `tax_rate` decimal(14,4) DEFAULT NULL,
  `invoice_amount` decimal(14,4) DEFAULT NULL,
  `operate_time` datetime DEFAULT NULL COMMENT '悦店保利订单支付/取消时间',
  `invoice_amount_capital` varchar(100) DEFAULT NULL,
  `exclude_amount` decimal(14,4) DEFAULT NULL,
  `exclude_amount_detail` varchar(500) DEFAULT NULL,
  `print_date` datetime DEFAULT NULL,
  `print_by` varchar(50) DEFAULT NULL,
  `invoice_status` int(11) DEFAULT NULL COMMENT '发票状态：-100 已删除 ，0 待开具，1 成功  2 部分开具，10 开具出错 ',
  `buyer_phone_num` varchar(50) DEFAULT '' COMMENT '购货方电话',
  `buyer_add` varchar(200) DEFAULT '' COMMENT '购货方地址',
  `buyer_bank_acct` varchar(200) DEFAULT '' COMMENT '购货方开户行和账号',
  `extend_param` varchar(500) DEFAULT NULL,
  `post_receiver_name` varchar(50) DEFAULT NULL,
  `post_receiver_phone` varchar(50) DEFAULT NULL,
  `post_receiver_address` varchar(50) DEFAULT NULL,
  `invoice_email` varchar(200) DEFAULT '' COMMENT '接收电子发票的邮箱',
  `postcode` varchar(20) DEFAULT NULL,
  `buyer_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `coop_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`) USING BTREE,
  KEY `invoice_no_idx` (`invoice_no`),
  KEY `idx_status` (`invoice_status`),
  KEY `idx_invoeceid` (`invoice_id`,`medium_type`,`invoice_status`),
  KEY `idx_creation_date` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1077500 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_bill_flow_item` */

CREATE TABLE `invoice_bill_flow_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(128) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL COMMENT '商品skuId',
  `item_name` varchar(200) DEFAULT NULL,
  `price` decimal(14,4) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `tax_rate` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `tax_type_code` varchar(200) DEFAULT NULL COMMENT '商品编码',
  `sku_unit` varchar(20) DEFAULT '' COMMENT '商品单位',
  `sku_standerd` varchar(20) DEFAULT '' COMMENT '商品规格',
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id_idx` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28732765 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_bill_rel` */

CREATE TABLE `invoice_bill_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_invoice_id` varchar(200) NOT NULL COMMENT '原发票id',
  `separate_invoice_id` varchar(200) NOT NULL COMMENT '拆分后的发票id',
  `invoice_fpqqlsh` varchar(200) NOT NULL DEFAULT '-1' COMMENT '发票请求流水号(二维码开票用)',
  `invoice_no` int(11) DEFAULT '-1' COMMENT '发票号码',
  `invoice_dm` varchar(255) DEFAULT '' COMMENT '发票代码',
  `invoice_amount` decimal(14,4) NOT NULL COMMENT '发票金额',
  `invoice_status` int(11) NOT NULL COMMENT '发票状态 ：0-新建 ，10-接口返回错误 ，1-成功 ，-100  删除',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_oriinvoeceid` (`origin_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191022 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_push_log` */

CREATE TABLE `invoice_push_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(200) NOT NULL COMMENT '开具成功的invoiceId',
  `order_ids` text COMMENT '发票对应的订单号',
  `push_dest` smallint(6) NOT NULL COMMENT '推送目标 ：1-悦店 ',
  `push_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '发票推送状态 ：0-新建 ，1-成功 , 2失败',
  `error_msg` varchar(255) NOT NULL DEFAULT '',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_invoiceid` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8 COMMENT='发票推送表';

/*Table structure for table `invoice_usage_flow` */

CREATE TABLE `invoice_usage_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `out_invoice_id` varchar(128) DEFAULT NULL,
  `invoice_id` varchar(128) DEFAULT NULL,
  `bill_id` text,
  `invoice_no` varchar(128) DEFAULT NULL,
  `origin_invoice_no` varchar(128) DEFAULT NULL,
  `invoice_title` varchar(200) DEFAULT NULL,
  `tax_rate` decimal(14,4) DEFAULT NULL,
  `tax_code` varchar(50) NOT NULL DEFAULT '' COMMENT '公司税号',
  `invoice_amount` decimal(14,4) DEFAULT NULL,
  `print_date` datetime DEFAULT NULL,
  `print_by` varchar(50) DEFAULT NULL,
  `invalid_date` datetime DEFAULT NULL,
  `invalid_by` varchar(50) DEFAULT NULL,
  `invalid_reason` int(11) DEFAULT NULL,
  `invalid_desc` varchar(500) DEFAULT NULL,
  `usage_status` int(11) DEFAULT NULL,
  `medium_type` int(11) NOT NULL DEFAULT '2' COMMENT '发票介质 1.电子 2.纸质',
  `extend_param` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`) USING BTREE,
  KEY `in_idx` (`invoice_no`),
  KEY `invoice_id_idx` (`invoice_id`),
  KEY `invoice_no_idx` (`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1285 DEFAULT CHARSET=utf8;

/*Table structure for table `order_shipping_fee` */

CREATE TABLE `order_shipping_fee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(64) DEFAULT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `refund_apply_id` varchar(128) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `order_source` int(11) DEFAULT NULL,
  `transport_id` varchar(50) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL,
  `fee_type` int(11) DEFAULT '1' COMMENT '费用类型 1-运费 2-包装费',
  `shipping_fee` decimal(14,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3886687 DEFAULT CHARSET=utf8;

/*Table structure for table `transfer_order_in` */

CREATE TABLE `transfer_order_in` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调拨入单据编号',
  `op_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '唯一流水号，对比数据使用',
  `warehouse_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货仓库id',
  `from_warehouse_id` int(11) NOT NULL,
  `owner_id` int(1) NOT NULL DEFAULT '0' COMMENT '货主id',
  `owner_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '货主名称',
  `transfer_type` bigint(11) NOT NULL DEFAULT '0' COMMENT '2604-调拨入收货单据 2607-调拨入收货差异单据',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货完成时间',
  `purchase_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'sku对应采购单 -- 对比数据',
  `vendor_id` varchar(255) NOT NULL COMMENT 'sku所属公司',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_type` tinyint(2) DEFAULT NULL COMMENT 'sku类型 正品或者次品--无用',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否称重商品: 1称重, 2不称重',
  `receive_or_discrep_quantity` decimal(14,4) DEFAULT '0.0000' COMMENT '收货或者丢失数量',
  `include_tax_price` decimal(14,4) NOT NULL COMMENT '含税金额',
  `exclude_tax_price` decimal(14,4) NOT NULL COMMENT '商品未税价格',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(11,4) NOT NULL COMMENT '税率',
  `fin_status` tinyint(2) NOT NULL COMMENT '凭证生成 0-未 1-已生成',
  `create_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`unique_id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COMMENT='调拨入单表';

/*Table structure for table `transfer_order_in_copy` */

CREATE TABLE `transfer_order_in_copy` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调拨入单据编号',
  `op_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '唯一流水号，对比数据使用',
  `warehouse_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货仓库id',
  `from_warehouse_id` int(11) NOT NULL,
  `owner_id` int(1) NOT NULL DEFAULT '0' COMMENT '货主id',
  `owner_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '货主名称',
  `transfer_type` bigint(11) NOT NULL DEFAULT '0' COMMENT '2604-调拨入收货单据 2607-调拨入收货差异单据',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货完成时间',
  `purchase_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'sku对应采购单 -- 对比数据',
  `vendor_id` varchar(255) NOT NULL COMMENT 'sku所属公司',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_type` tinyint(2) DEFAULT NULL COMMENT 'sku类型 正品或者次品--无用',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否称重商品: 1称重, 2不称重',
  `receive_or_discrep_quantity` decimal(14,4) DEFAULT '0.0000' COMMENT '收货或者丢失数量',
  `include_tax_price` decimal(14,4) NOT NULL COMMENT '含税金额',
  `exclude_tax_price` decimal(14,4) NOT NULL COMMENT '商品未税价格',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(11,4) NOT NULL COMMENT '税率',
  `fin_status` tinyint(2) NOT NULL COMMENT '凭证生成 0-未 1-已生成',
  `create_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_by` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='调拨入单表';

/*Table structure for table `transfer_order_out` */

CREATE TABLE `transfer_order_out` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `unique_id` varchar(50) NOT NULL COMMENT '唯一标识',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `order_no` varchar(24) NOT NULL DEFAULT '' COMMENT '调拨出单据编号',
  `op_id` bigint(20) NOT NULL COMMENT '库存唯一流水号',
  `warehouse_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID',
  `to_warehouse_id` int(11) NOT NULL DEFAULT '1' COMMENT '收货仓库',
  `transfer_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '调入单 ',
  `vendor_id` varchar(11) NOT NULL COMMENT 'sku所属公司',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_type` tinyint(11) NOT NULL DEFAULT '0' COMMENT '商品正品次品 -- 无用',
  `purchase_id` varchar(50) NOT NULL DEFAULT '' COMMENT '采购单号',
  `ship_quantity` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发出数量或重量',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-02 00:00:00' COMMENT '出库时间',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '称重标识: 1称重, 0不称重',
  `include_tax_price` decimal(14,4) NOT NULL COMMENT '含税金额',
  `exclude_tax_price` decimal(14,4) NOT NULL COMMENT '未税采购价格',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) NOT NULL COMMENT '税率',
  `fin_status` tinyint(2) NOT NULL COMMENT '生成凭证 0-未 1-生成',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(24) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_by` varchar(24) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`unique_id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8 COMMENT='调拨出表';

/*Table structure for table `tt1` */

CREATE TABLE `tt1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fdate` datetime DEFAULT NULL,
  `fname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/* Procedure structure for procedure `sc` */

DELIMITER $$

/*!50003 CREATE DEFINER=`pay`@`%` PROCEDURE `sc`()
BEGIN
DECLARE i BIGINT;
SET i=18198423;
WHILE i>0 DO
UPDATE buyer_receive_pay_flow_sale SET sale_tax_rate=-1.00 WHERE id<=i AND id>=i-20000;
SET i=i-20000;
END WHILE;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

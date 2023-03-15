/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - settlementcoredb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`settlementcoredb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `external_sale_order_check_result` */

CREATE TABLE `external_sale_order_check_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `external_order_id` varchar(50) DEFAULT NULL,
  `coop_id` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `order_create_time` datetime DEFAULT NULL,
  `order_send_time` datetime DEFAULT NULL,
  `order_delivery_time` datetime DEFAULT NULL,
  `order_amount` decimal(14,2) DEFAULT NULL,
  `external_order_amount` decimal(14,2) DEFAULT NULL,
  `commission_fee` decimal(14,2) DEFAULT NULL,
  `commission_rate` varchar(10) DEFAULT NULL,
  `receivable_amount` decimal(14,2) DEFAULT NULL,
  `include_commission_amount` decimal(14,4) DEFAULT NULL,
  `settle_period` varchar(50) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `check_desc` varchar(255) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89536 DEFAULT CHARSET=utf8;

/*Table structure for table `purchase_sku_stock_daily` */

CREATE TABLE `purchase_sku_stock_daily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `stock_num` decimal(14,4) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL,
  `total_stock_amount` decimal(14,4) DEFAULT NULL,
  `turnover_period` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5877435 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_bill` */

CREATE TABLE `settle_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL,
  `settle_bill_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL,
  `vendor_name` varchar(200) DEFAULT NULL,
  `settle_period` varchar(50) DEFAULT NULL,
  `balance_status` int(11) DEFAULT NULL,
  `check_status` int(11) DEFAULT '0' COMMENT '审批状态',
  `first_checked_by` varchar(50) DEFAULT '' COMMENT '财务一审操作人',
  `second_checked_by` varchar(50) DEFAULT '' COMMENT '财务二审操作人',
  `payed_by` varchar(50) DEFAULT '' COMMENT '付款完成操作人',
  `invoice_no` varchar(8000) DEFAULT NULL,
  `bank_bill_no` varchar(8000) DEFAULT NULL,
  `settle_date` datetime DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13973 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_bill_invoice_map` */

CREATE TABLE `settle_bill_invoice_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_content_id` bigint(20) NOT NULL COMMENT '发票id',
  `invoice_no` varchar(50) DEFAULT NULL,
  `wait_invoice_item_id` bigint(20) NOT NULL COMMENT '待开发票明细id',
  `settle_bill_id` varchar(50) NOT NULL COMMENT '结算单号',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `matched_amount` decimal(14,4) NOT NULL COMMENT '匹配金额',
  `status` int(11) NOT NULL COMMENT '匹配关系状态:1-正常; -100-作废\r\n',
  `extend_param` varchar(500) DEFAULT NULL COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17586 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_bill_item` */

CREATE TABLE `settle_bill_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settle_bill_id` varchar(50) DEFAULT NULL,
  `fee_type` int(11) DEFAULT NULL,
  `fee_desc` varchar(50) DEFAULT NULL,
  `fee_receive_way` int(11) DEFAULT NULL,
  `fee_value` decimal(14,4) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68005 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_compensate_order` */

CREATE TABLE `settle_compensate_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) NOT NULL,
  `compensate_id` varchar(50) NOT NULL COMMENT '赔付申请号',
  `order_id` varchar(50) NOT NULL COMMENT '订单号',
  `trade_id` varchar(50) NOT NULL COMMENT '交易单号',
  `purchase_id` varchar(50) NOT NULL COMMENT '采购单号',
  `warehouse_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) NOT NULL COMMENT '供应商编号',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `account_group_type` int(11) NOT NULL COMMENT '供应商类型',
  `sku_id` varchar(50) NOT NULL COMMENT '商品编号',
  `sku_name` varchar(200) NOT NULL COMMENT '商品名称',
  `compensate_type` int(11) NOT NULL COMMENT '赔付的类型：现金 券  余额',
  `compensate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赔付时间',
  `compensate_money` decimal(14,4) NOT NULL COMMENT '赔付的金额',
  `reason` varchar(255) NOT NULL COMMENT '赔付原因详情',
  `order_source` int(11) NOT NULL COMMENT '创建赔付的来源系统',
  `balance_status` int(11) NOT NULL COMMENT '对账状态',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(80) NOT NULL COMMENT '申请赔付的客服',
  `last_changed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次的修改时间',
  `changed_by` varchar(50) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4575017 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_compensate_order2` */

CREATE TABLE `settle_compensate_order2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) NOT NULL DEFAULT '',
  `compensate_id` varchar(50) NOT NULL DEFAULT '' COMMENT '赔付申请号',
  `order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `trade_id` varchar(50) NOT NULL DEFAULT '' COMMENT '交易单号',
  `purchase_id` varchar(50) NOT NULL DEFAULT '' COMMENT '采购单号',
  `warehouse_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商编号',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `account_group_type` int(11) NOT NULL DEFAULT '0' COMMENT '供应商类型',
  `sku_id` varchar(50) NOT NULL DEFAULT '' COMMENT '商品编号',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `compensate_type` int(11) NOT NULL DEFAULT '0' COMMENT '赔付的类型：现金 券  余额',
  `compensate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赔付时间',
  `compensate_money` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '赔付的金额',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '赔付原因详情',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '创建赔付的来源系统',
  `balance_status` int(11) NOT NULL DEFAULT '0' COMMENT '对账状态',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(80) NOT NULL DEFAULT '' COMMENT '申请赔付的客服',
  `last_changed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次的修改时间',
  `changed_by` varchar(50) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_compensate_id` (`compensate_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `settle_enterprise_bank_flow` */

CREATE TABLE `settle_enterprise_bank_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_type` tinyint(1) unsigned NOT NULL COMMENT '交易类型 1-支付经办',
  `pay_no` varchar(50) NOT NULL COMMENT '交易流水号',
  `pay_acct` varchar(50) NOT NULL COMMENT '付款方的银行账号',
  `cust_acct` varchar(50) DEFAULT NULL COMMENT '收款方账号',
  `cust_name` varchar(100) NOT NULL COMMENT '收款方名称',
  `amount` decimal(12,2) NOT NULL COMMENT '订单总金额',
  `trade_desc` varchar(500) NOT NULL COMMENT '交易描述',
  `same_bank_flag` varchar(50) DEFAULT NULL COMMENT '招行同行标志',
  `cust_bank_name` varchar(255) DEFAULT NULL COMMENT '收款方开户行',
  `cust_province` varchar(500) DEFAULT NULL COMMENT '收款方省份',
  `cust_city` varchar(500) DEFAULT NULL COMMENT '收款方城市',
  `trade_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '交易状态。0-新建，1-待审核 ，3-支付中 ， 10-支付成功,  4- 支付失败 ,7-交易失败（银行校验参数出错） ',
  `pushed_status` tinyint(1) DEFAULT '0' COMMENT '推送页面的状态',
  `bank_flow_num` varchar(20) DEFAULT NULL COMMENT '银行交易流水号',
  `result_desc` varchar(255) DEFAULT NULL COMMENT '结果描述',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_changed_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_pay_no` (`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='银企直联支付流水表';

/*Table structure for table `settle_history` */

CREATE TABLE `settle_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(50) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL,
  `returned_quantity` int(11) DEFAULT NULL,
  `settled_quantity` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `settle_invoice_content` */

CREATE TABLE `settle_invoice_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_type` int(11) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL COMMENT '数据源类型\r\n1-采购单\r\n2-结算单',
  `source_id` varchar(128) DEFAULT NULL COMMENT '数据源ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `invoice_id` varchar(50) DEFAULT NULL COMMENT '发票号',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型\r\n1-增值税发票\r\n2-普通发票\r\n3-专业发票',
  `print_invoice_date` datetime DEFAULT NULL COMMENT '开票时间',
  `include_tax_amount` decimal(14,4) DEFAULT NULL COMMENT '含税金额',
  `exclude_tax_amount` decimal(14,4) DEFAULT NULL COMMENT '未税金额',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `tax_amount` decimal(14,4) DEFAULT NULL COMMENT '税额',
  `use_status` int(11) DEFAULT NULL COMMENT '使用状态\r\n0-未使用\r\n1-已使用',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `audit_status` int(11) DEFAULT NULL,
  `match_status` int(11) DEFAULT NULL,
  `confirmed_by` varchar(50) DEFAULT '' COMMENT '发票确认人',
  `invalid_by` varchar(50) DEFAULT '' COMMENT '发票作废操作人',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vId` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19580 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_invoice_file` */

CREATE TABLE `settle_invoice_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `invoice_no` varchar(50) NOT NULL COMMENT '发票id',
  `file_name` varchar(255) NOT NULL COMMENT '文件的名称',
  `path` varchar(255) DEFAULT NULL COMMENT '保存的路径',
  `status` int(11) NOT NULL COMMENT '状态',
  `bucket_name` varchar(255) NOT NULL COMMENT 'AWS S3 bucketname',
  `objkey` varchar(255) NOT NULL COMMENT 'S3 Object的key',
  `objEtag` varchar(255) NOT NULL COMMENT 'asw objetag 属性',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `created_by` varchar(50) NOT NULL COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `changed_by` varchar(50) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_invoice` (`invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='电子发票文件存储表';

/*Table structure for table `settle_ly_sale_order` */

CREATE TABLE `settle_ly_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算对账单ID',
  `sale_unique_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单id',
  `parent_order_id` varchar(50) DEFAULT NULL,
  `out_order_id` varchar(50) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '类型',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `order_source` int(11) DEFAULT NULL,
  `order_source_vendor_id` varchar(50) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型\r\n1001-经销\r\n1002-代销',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购订单ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '仓库ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU名称',
  `sku_type` int(11) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '含税采购单价',
  `sku_sale_price` decimal(10,2) DEFAULT NULL,
  `sale_quantity` int(11) DEFAULT NULL COMMENT '销售、退货数量',
  `actual_money` decimal(14,4) NOT NULL COMMENT '实际实付',
  `can_settle_quantity` int(11) DEFAULT NULL,
  `sale_total_amount` decimal(14,4) DEFAULT NULL COMMENT '售卖总价',
  `include_tax_total_amount` decimal(14,4) DEFAULT NULL,
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `tax_amount` decimal(14,4) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `sale_date` timestamp NULL DEFAULT NULL,
  `pay_date` timestamp NULL DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `commission_type` int(11) DEFAULT '-1' COMMENT '扣点类型 固定扣率 固定金额',
  `currency_type` int(11) NOT NULL DEFAULT '1' COMMENT '结算币种',
  `rebate_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '返利金额',
  `no_return_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '不退货补偿金额',
  `damaged_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '残损补偿金额',
  `freight_support_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '运费支持金额',
  `balance_status` int(11) DEFAULT NULL COMMENT '状态\r\n0-未确认\r\n1-已确认\r\n2-财务发起对账\r\n3-供应商确认对账\r\n4-财务确认\r\n5-已结算\r\n-100-无效',
  `creation_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` timestamp NULL DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `o_id_idx` (`order_id`) USING BTREE,
  KEY `p_id_idx` (`purchase_id`) USING BTREE,
  KEY `v_id_idx` (`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8099112 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_order_bill_map` */

CREATE TABLE `settle_order_bill_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `statement_id` varchar(50) DEFAULT NULL,
  `statement_date` datetime DEFAULT NULL,
  `bill_id` varchar(50) DEFAULT NULL,
  `bill_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_idx` (`bill_id`) USING BTREE,
  KEY `source_idx` (`source_id`) USING BTREE,
  KEY `statement_idx` (`statement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2811376 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_payment_flow` */

CREATE TABLE `settle_payment_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settle_pay_no` varchar(50) NOT NULL DEFAULT '' COMMENT '付款单号',
  `settle_bill_id` varchar(50) NOT NULL COMMENT '结算单号',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-新建，1-待审核，3-银行处理中 ，4-支付失败，10-付款成功，-100-作废',
  `remark_status` varchar(255) DEFAULT NULL COMMENT '银行处理状态备注-失败原因等',
  `pay_type` int(11) NOT NULL COMMENT '付款方式 1-转账',
  `pay_reason` int(11) NOT NULL COMMENT '付款事由 1-货款',
  `should_pay_amount` decimal(16,4) NOT NULL COMMENT '应付总金额',
  `pay_amount` decimal(16,4) NOT NULL COMMENT '付款金额',
  `bank_no` varchar(30) DEFAULT NULL COMMENT '银行返回流水号',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商id',
  `vendor_name` varchar(100) NOT NULL COMMENT '供应商名称',
  `v_account_no` varchar(100) NOT NULL DEFAULT '' COMMENT '收款账号',
  `v_account_holder` varchar(100) NOT NULL COMMENT '收款账户名',
  `v_bank_country` varchar(16) NOT NULL DEFAULT '' COMMENT '收款账号国家名称',
  `v_bank_province` varchar(50) NOT NULL DEFAULT '' COMMENT '收款账号省',
  `v_bank_city` varchar(50) NOT NULL DEFAULT '' COMMENT '收款账号市',
  `v_bank_name` varchar(100) NOT NULL COMMENT '收款银行名称',
  `pay_account_no` varchar(100) NOT NULL COMMENT '付款账号',
  `pay_account_holder` varchar(100) DEFAULT NULL COMMENT '付款账号名称',
  `pay_bank_name` varchar(100) NOT NULL COMMENT '付款银行名称',
  `pay_company_id` int(11) DEFAULT NULL COMMENT '付款公司id',
  `pay_company` varchar(100) DEFAULT NULL COMMENT '付款公司',
  `creation_date` datetime NOT NULL COMMENT '发起付款时间',
  `created_by` varchar(32) DEFAULT NULL COMMENT '发起人',
  `changed_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `changed_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  `pay_date` datetime DEFAULT NULL COMMENT '付款时间',
  `bill_remark` varchar(255) DEFAULT NULL COMMENT '转账备注',
  PRIMARY KEY (`id`),
  KEY `bill_idx` (`settle_bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_payno_receive_pay_map` */

CREATE TABLE `settle_payno_receive_pay_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receive_pay_content_id` bigint(20) NOT NULL,
  `settle_pay_no` varchar(50) NOT NULL COMMENT 'settle_pay_no',
  `this_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_promotion_detail` */

CREATE TABLE `settle_promotion_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单号',
  `source_id` varchar(50) DEFAULT NULL COMMENT '来源单据号',
  `source_type` int(11) DEFAULT NULL COMMENT '1-销售单2-采购单',
  `source_amount` decimal(12,2) DEFAULT NULL COMMENT '\r\n如果单据为销售单，则为销售单含税总金额\r\n如果单据为采购单，则为采购单收货含税金额',
  `promotion_id` bigint(20) DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sku_include_tax_price` decimal(12,2) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL,
  `vendor_type` int(11) DEFAULT NULL COMMENT '返利供应商类型\r\n1-普通供应商\r\n2-承运商\r\n3-网盟服务提供商',
  `account_group_type` int(11) DEFAULT NULL,
  `promotion_rate` decimal(12,2) DEFAULT NULL,
  `promotion_amount` decimal(12,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '明细状态 \r\n0-待审核\r\n1-已审核\r\n 2-已对账 ',
  `source_date` datetime DEFAULT NULL COMMENT '来源单据时间\r\n如果来源单据是采购单，这里是采购单关闭时间\r\n如果来源单据是销售单，这里是妥投时间',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_promotion_order_map` */

CREATE TABLE `settle_promotion_order_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL COMMENT '单据号',
  `source_type` int(11) DEFAULT NULL COMMENT '单据类型 1 采购单收货 2 订单',
  `purchase_id` varchar(200) DEFAULT NULL COMMENT '采购单号',
  `sku_id` varchar(50) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '活动编号',
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单号',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '结算单号',
  `status` int(11) DEFAULT NULL COMMENT '状态：1正常 -100',
  `extend_param` varchar(1000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5705 DEFAULT CHARSET=utf8 COMMENT='返利活动订单采购管理表';

/*Table structure for table `settle_promotion_serv_item` */

CREATE TABLE `settle_promotion_serv_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_type` int(11) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型\r\n1001-经销\r\n1002-代销',
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算单ID',
  `create_type` int(11) DEFAULT NULL,
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '促销ID',
  `promotion_type` int(11) DEFAULT NULL COMMENT '促销类型\r\n1-库存\r\n2-销售',
  `promotion_source_type` int(11) DEFAULT NULL,
  `promotion_total_amount` decimal(12,2) DEFAULT NULL,
  `promotion_desc` varchar(100) DEFAULT NULL COMMENT '促销描述',
  `serve_fee` decimal(14,4) DEFAULT NULL COMMENT '服务费',
  `fee_receive_way` int(11) DEFAULT NULL COMMENT '费用收款方式\r\n1-账扣\r\n2-电汇',
  `vin_purchase_id` varchar(50) DEFAULT NULL COMMENT '虚进采购单ID',
  `vout_purchase_id` varchar(50) DEFAULT NULL COMMENT '虚退采购单ID',
  `question_status` int(11) DEFAULT NULL COMMENT '质疑状态',
  `question_desc` varchar(200) DEFAULT NULL COMMENT '质疑原因描述',
  `balance_status` int(11) DEFAULT NULL COMMENT '状态\r\n0-未确认\r\n1-已确认\r\n2-财务发起对账\r\n3-供应商确认对账\r\n4-财务确认\r\n5-已结算\r\n-100-无效',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order` */

CREATE TABLE `settle_purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算单ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_name` varchar(200) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型\r\n1001-经销\r\n1002-代销',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购单号',
  `org_purchase_id` varchar(50) DEFAULT NULL COMMENT '原始采购单号',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '仓库ID',
  `purchase_type` int(11) DEFAULT NULL COMMENT '采购单类型\r\n1-采进\r\n2-采退\r\n3-虚进\r\n4-虚退',
  `close_date` datetime DEFAULT NULL COMMENT '采购单关闭时间',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `prepay_amount1` decimal(14,4) DEFAULT NULL COMMENT '预付款一金额',
  `prepay_amount2` decimal(14,4) DEFAULT NULL COMMENT '预付款二金额',
  `prepay_amount3` decimal(14,4) DEFAULT NULL COMMENT '预付款金额三',
  `balance_status` int(11) DEFAULT NULL COMMENT '状态\r\n0-未确认\r\n1-已确认\r\n2-财务发起对账\r\n3-供应商确认对账\r\n4-财务确认\r\n5-已结算\r\n-100-无效',
  `purchase_by` varchar(50) DEFAULT NULL,
  `purchaser_phone` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33636 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order_item` */

CREATE TABLE `settle_purchase_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购单ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU名称',
  `purchase_quantity` int(11) DEFAULT NULL COMMENT '采购数量',
  `receive_quantity` int(11) DEFAULT NULL COMMENT '收货数量',
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '含税采购单价',
  `exclude_tax_price` decimal(14,4) DEFAULT NULL COMMENT '未税采购单价',
  `include_tax_total_amount` decimal(14,4) DEFAULT NULL COMMENT '含税采购总额',
  `tax_amount` decimal(14,4) DEFAULT NULL COMMENT '税额',
  `question_status` int(11) DEFAULT NULL COMMENT '质疑状态\r\n0-未质疑\r\n1-已质疑',
  `question_desc` varchar(200) DEFAULT NULL COMMENT '质疑原因描述',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140286 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order_new` */

CREATE TABLE `settle_purchase_order_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_unique_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL,
  `vendor_name` varchar(200) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `org_purchase_id` varchar(50) DEFAULT NULL,
  `purchase_type` int(11) DEFAULT NULL,
  `warehouse_id` varchar(50) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `purchase_quantity` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `receive_quantity` decimal(14,4) DEFAULT '0.0000' COMMENT '收货数量',
  `include_tax_price` decimal(14,4) DEFAULT NULL,
  `exclude_tax_price` decimal(14,4) DEFAULT NULL,
  `include_tax_total_amount` decimal(14,4) DEFAULT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `tax_rate` decimal(14,4) DEFAULT NULL,
  `tax_amount` decimal(14,4) DEFAULT NULL,
  `rebate_amount` decimal(14,4) DEFAULT NULL COMMENT '返利金额',
  `no_return_amount` decimal(14,4) DEFAULT NULL COMMENT '不退货补偿金额',
  `damaged_amount` decimal(14,4) DEFAULT NULL COMMENT '残损补偿金额',
  `freight_support_amount` decimal(14,4) DEFAULT NULL COMMENT '运费支持金额',
  `question_status` int(11) DEFAULT NULL,
  `question_desc` varchar(200) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `purchase_by` varchar(50) DEFAULT NULL,
  `purchaser_phone` varchar(50) DEFAULT NULL,
  `balance_status` int(11) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_purchase_id` (`purchase_id`),
  KEY `purchase_uidx` (`purchase_unique_id`) USING BTREE,
  KEY `idx_ven_bala_type_date` (`vendor_id`,`balance_status`,`purchase_type`,`delivery_date`),
  KEY `idx_vendorid` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4762260 DEFAULT CHARSET=utf8 COMMENT='采购收货表';

/*Table structure for table `settle_purchase_order_statement` */

CREATE TABLE `settle_purchase_order_statement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_type` int(11) DEFAULT NULL,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `statement_type` int(11) DEFAULT NULL,
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算单ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_name` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型',
  `settle_period` varchar(50) DEFAULT NULL COMMENT '对账区间',
  `balance_status` int(11) DEFAULT NULL COMMENT '状态\r\n0-未确认\r\n1-已确认\r\n2-财务发起对账\r\n3-供应商确认对账\r\n4-财务确认\r\n5-已结算\r\n-100无效',
  `statement_send_date` datetime DEFAULT NULL COMMENT '对账发起时间',
  `statement_send_operator` varchar(50) DEFAULT '',
  `statement_confirm_date` datetime DEFAULT NULL COMMENT '对账确认时间',
  `statement_confirm_operator` varchar(50) DEFAULT '',
  `tax_detail` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112703 DEFAULT CHARSET=utf8 COMMENT='对账单汇总表';

/*Table structure for table `settle_purchase_order_statement_item` */

CREATE TABLE `settle_purchase_order_statement_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `fee_type` int(11) DEFAULT NULL COMMENT '费用收款类型\r\n1-不退货补偿\r\n2-残损补偿\r\n3-运费支持\r\n4-月返\r\n5-季返\r\n6-年返\r\n7-促销服务费\r\n8-其他扣收',
  `fee_desc` varchar(50) DEFAULT NULL COMMENT '费用描述',
  `fee_receive_way` int(11) DEFAULT NULL COMMENT '费用收款方式\r\n1-账扣\r\n2-电汇',
  `fee_value` decimal(14,4) DEFAULT NULL COMMENT '费用金额',
  `balance_status` int(11) DEFAULT NULL COMMENT '结算状态',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111171 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_receive_pay_content` */

CREATE TABLE `settle_receive_pay_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `fund_type` int(11) DEFAULT NULL COMMENT '款项类型',
  `fund_type_id` int(11) DEFAULT NULL COMMENT '款项类型ID',
  `bill_type_id` int(11) DEFAULT NULL COMMENT '单据类型ID',
  `bill_no` varchar(50) DEFAULT NULL COMMENT '单据号',
  `amount` decimal(14,4) DEFAULT NULL COMMENT '收付款金额',
  `fund_desc` varchar(500) DEFAULT NULL COMMENT '收付款描述',
  `tax_code` varchar(50) DEFAULT NULL,
  `tax_rate` decimal(14,4) DEFAULT NULL,
  `balance_date` datetime DEFAULT NULL COMMENT '结算时间',
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `balance_bill_id` varchar(128) DEFAULT NULL COMMENT '结算单ID',
  `balance_status` int(11) DEFAULT NULL COMMENT '结算状态\r\n0-未结算\r\n1-已结算',
  `fin_sync_status` int(11) DEFAULT NULL COMMENT '财务同步状态\r\n0-未同步\r\n1-已同步',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35532 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_sale_order` */

CREATE TABLE `settle_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算对账单ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型\r\n1001-经销\r\n1002-代销',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购订单ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '仓库ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU名称',
  `sku_type` int(11) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '含税采购单价',
  `sale_quantity` int(11) DEFAULT NULL COMMENT '销售、退货数量',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `receive_quantity` int(11) DEFAULT NULL COMMENT '收货数量',
  `before_return_quantity` int(11) DEFAULT NULL COMMENT '往期已退数量',
  `before_settle_quantity` int(11) DEFAULT NULL COMMENT '往期已结数量',
  `can_settle_quantity` int(11) DEFAULT NULL COMMENT '可结数量',
  `include_tax_total_amount` decimal(14,4) DEFAULT NULL COMMENT '含税总额',
  `tax_amount` decimal(14,4) DEFAULT NULL COMMENT '税额',
  `rebate_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '返利金额',
  `no_return_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '不退货补偿金额',
  `damaged_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '残损补偿金额',
  `freight_support_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '运费支持金额',
  `balance_status` int(11) DEFAULT NULL COMMENT '状态\r\n0-未确认\r\n1-已确认\r\n2-财务发起对账\r\n3-供应商确认对账\r\n4-财务确认\r\n5-已结算\r\n-100-无效',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7209303 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_sale_order_map` */

CREATE TABLE `settle_sale_order_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商编码',
  `source_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'id',
  `source_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `core_sale_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'core_sale 的id',
  `order_id` varchar(50) NOT NULL DEFAULT '' COMMENT '订单id',
  `purchase_id` varchar(50) NOT NULL DEFAULT '' COMMENT '采购单id',
  `sku_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'sku_id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(50) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次的修改时间',
  `changed_by` varchar(50) NOT NULL DEFAULT '' COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='inter和core代销关系表';

/*Table structure for table `settle_sale_order_map_beifen` */

CREATE TABLE `settle_sale_order_map_beifen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `source_id` varchar(50) DEFAULT NULL,
  `source_type` int(11) DEFAULT NULL,
  `core_sale_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'sku_id',
  `status` int(11) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_three_sale_order` */

CREATE TABLE `settle_three_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算单ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_name` varchar(200) DEFAULT NULL COMMENT '供应商的名称',
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户类型',
  `order_id` varchar(50) DEFAULT NULL COMMENT '单据编号：订单号',
  `trade_id` varchar(50) DEFAULT NULL COMMENT '交易单号',
  `order_type` int(11) DEFAULT NULL COMMENT '单据类型：1-销售 2-销退',
  `sku_id` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方入驻销售单表';

/*Table structure for table `settle_transport_order` */

CREATE TABLE `settle_transport_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statement_id` varchar(50) DEFAULT NULL COMMENT '对账单id',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '财务系统中的结算账单的账单号',
  `transport_unique_id` varchar(50) DEFAULT NULL,
  `transport_id` varchar(32) DEFAULT NULL,
  `org_order_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL COMMENT '结算单号',
  `transaction_no` varchar(50) DEFAULT NULL COMMENT '交易单号',
  `settle_way` int(11) DEFAULT NULL COMMENT '结算计算方式',
  `settle_type` int(11) DEFAULT NULL COMMENT '结算类型',
  `order_type` int(11) DEFAULT NULL COMMENT '运费类型 1：销售 2：销退  3：赔付',
  `transport_status` int(11) DEFAULT NULL COMMENT '1：妥投 2：拒收',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '承运商id',
  `vendor_name` varchar(200) DEFAULT NULL COMMENT '承运商名称',
  `delivery_date` datetime DEFAULT NULL COMMENT '妥投时间',
  `order_amount` decimal(12,2) DEFAULT NULL COMMENT '订单费用',
  `shipping_fee` decimal(12,2) DEFAULT NULL COMMENT '运费',
  `weight` decimal(12,2) DEFAULT NULL COMMENT '重量',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '仓库id',
  `balance_status` int(11) DEFAULT NULL COMMENT '对账状态 0：未对账  -100：删除',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_transport_id` (`transport_unique_id`),
  KEY `order_idx` (`order_id`),
  KEY `vid_bs_date_idx` (`vendor_id`,`balance_status`,`delivery_date`),
  KEY `sid` (`statement_id`),
  KEY `org_order_idx` (`org_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17521484 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_wait_print_invoice_item` */

CREATE TABLE `settle_wait_print_invoice_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `settle_bill_id` varchar(50) DEFAULT NULL COMMENT '结算单号',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `settle_total` decimal(14,4) DEFAULT NULL COMMENT '含税总金额',
  `has_print_amount` decimal(14,4) DEFAULT NULL COMMENT '已开票金额',
  `wait_print_amount` decimal(14,4) DEFAULT NULL COMMENT '待开票金额',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31005 DEFAULT CHARSET=utf8;

/*Table structure for table `temp_transport_order` */

CREATE TABLE `temp_transport_order` (
  `order_id` bigint(20) NOT NULL,
  UNIQUE KEY `temp_transport_orderI1` (`order_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `test` */

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `order_sku_unique_id` bigint(20) DEFAULT NULL,
  `order_sku_unique_id2` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Procedure structure for procedure `aa` */

DELIMITER $$

/*!50003 CREATE DEFINER=`pay`@`%` PROCEDURE `aa`()
begin
declare i int;
set i=1;
while  i<30  do
select  i ;
set  i=i+1;
end while ;
end */$$
DELIMITER ;

/* Procedure structure for procedure `wk` */

DELIMITER $$

/*!50003 CREATE DEFINER=`pay`@`%` PROCEDURE `wk`()
begin
declare i int;
set i=1;
while  i< 4194859 do
SELECT a.* from 
settle_purchase_order_new a 
INNER JOIN settle_purchase_order b on a.purchase_id = b.purchase_id
where a.id > i and a.id <i+1000;
set  i=i+1000;
end while ;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

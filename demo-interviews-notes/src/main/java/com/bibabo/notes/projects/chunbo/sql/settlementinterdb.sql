/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - settlementinterdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`settlementinterdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `external_sale_order` */

CREATE TABLE `external_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coop_id` int(11) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `settle_period` varchar(50) DEFAULT NULL,
  `order_amount` decimal(14,4) DEFAULT NULL,
  `agent_amount` decimal(14,4) DEFAULT NULL,
  `tax_amount` decimal(14,4) DEFAULT NULL,
  `service_charge` decimal(14,4) DEFAULT NULL,
  `commission_fee` decimal(14,4) DEFAULT NULL,
  `fixed_promotion_fee` decimal(14,4) DEFAULT NULL,
  `freight_fee` decimal(14,4) DEFAULT NULL,
  `refund_promotion_fee` decimal(14,4) DEFAULT NULL,
  `settleable_amount` decimal(14,4) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `include_commission_amount` decimal(14,4) DEFAULT NULL,
  `order_create_date` datetime DEFAULT NULL,
  `order_send_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82926 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_compensate_order` */

CREATE TABLE `settle_compensate_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `compensate_id` varchar(50) DEFAULT NULL COMMENT '赔付申请号',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单号',
  `trade_id` varchar(50) DEFAULT NULL COMMENT '交易单号',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购单号',
  `warehouse_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商编号',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商类型',
  `sku_id` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `compensate_type` int(11) DEFAULT NULL COMMENT '赔付的类型：现金 券  余额',
  `compensate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赔付时间',
  `compensate_money` decimal(14,4) DEFAULT NULL COMMENT '赔付的金额',
  `reason` varchar(255) DEFAULT NULL COMMENT '赔付原因详情',
  `order_source` int(11) DEFAULT NULL COMMENT '创建赔付的来源系统',
  `settle_status` int(11) DEFAULT NULL COMMENT '同步到core的状态',
  `fin_status` int(11) DEFAULT NULL COMMENT '凭证job标志',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(80) DEFAULT NULL COMMENT '申请赔付的客服',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次的修改时间',
  `changed_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_id` (`unique_id`) USING BTREE,
  KEY `idx_compensate_id` (`compensate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_promotion_category_map` */

CREATE TABLE `settle_promotion_category_map` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '活动id',
  `sku_id` varchar(120) DEFAULT NULL,
  `sku_name` varchar(120) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL COMMENT '品类id 或skuId',
  `category_name` varchar(100) DEFAULT NULL COMMENT '品类名称货skuName',
  `category_level` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 正常 -100弃用',
  `parent_category_id` varchar(50) DEFAULT NULL,
  `rebate_type` int(11) DEFAULT NULL COMMENT '返利类型 1品类信息 2商品信息',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='返利活动品类关联表';

/*Table structure for table `settle_promotion_rebate` */

CREATE TABLE `settle_promotion_rebate` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(60) DEFAULT NULL,
  `vendor_name` varchar(200) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商类别',
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '促销活动id',
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '促销活动名称',
  `promotion_amount` decimal(12,2) DEFAULT NULL COMMENT '（采购/订单）累计金额',
  `rebate_amount` decimal(12,2) DEFAULT NULL COMMENT '累计返利金额',
  `promotion_desc` varchar(255) DEFAULT NULL COMMENT '活动描述',
  `calc_base` int(11) DEFAULT NULL COMMENT '计算基准 1采购进价 2销售价',
  `calc_type` int(11) DEFAULT NULL COMMENT '返利算法类型',
  `money_types` varchar(120) DEFAULT NULL COMMENT '计算返利的支付币类型，如空或""则为全支付币类型。\r\n多支付币类型之间用英文半角逗号分隔。\r\n1:现金,2:余额,3:礼品卡,4:礼券,5:积分,6:商品卡,7:宝钢卡',
  `promotion_type` int(11) DEFAULT NULL COMMENT '1 普通供应商 2 网盟合作商 3宝钢类',
  `rebate_source_type` int(11) DEFAULT NULL COMMENT '返利依据：1采购单 2订单',
  `start_date` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '活动结束时间',
  `promotion_status` int(11) DEFAULT NULL COMMENT '活动运行状态 0 新建 10启用 20停用 -100',
  `balance_status` int(11) DEFAULT NULL COMMENT '结算状态:0 新建 10 已生成对账单 20 已结算',
  `calculated_date` datetime DEFAULT NULL COMMENT '活动当前统计时间',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='返利活动表';

/*Table structure for table `settle_promotion_rebate_calc` */

CREATE TABLE `settle_promotion_rebate_calc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `promotion_id` varchar(50) DEFAULT NULL,
  `rebate_source_type` int(11) DEFAULT NULL,
  `rebate_base` int(11) DEFAULT NULL COMMENT '返利基准: 1按比率返   2 按金额返',
  `calc_type` int(11) DEFAULT NULL COMMENT '算法类型：\r\n1 固定比率\r\n2 固定金额每单商品数\r\n3 阶梯全额比率\r\n4 阶梯超额比率 \r\n5 阶梯全额固定金额',
  `fixed_rate` decimal(12,2) DEFAULT NULL COMMENT '固定返利比率',
  `fixed_amount` decimal(12,2) DEFAULT NULL COMMENT '    固定返利金额',
  `ladder_no` int(11) DEFAULT NULL COMMENT '阶梯号',
  `ladder_target_amount` decimal(12,2) DEFAULT NULL COMMENT '阶梯目标金额',
  `ladder_rebate_rate` varchar(12) DEFAULT NULL COMMENT '阶梯返利比率',
  `ladder_rebate_amount` decimal(12,2) DEFAULT NULL COMMENT '阶梯返利金额',
  `status` int(11) DEFAULT NULL COMMENT '0 正常 -100弃用',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='返利活动算法表';

/*Table structure for table `settle_promotion_rebate_calc_copy` */

CREATE TABLE `settle_promotion_rebate_calc_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `promotion_id` varchar(50) DEFAULT NULL,
  `rebate_source_type` int(11) DEFAULT NULL,
  `rebate_base` int(11) DEFAULT NULL COMMENT '返利基准: 1按比率返   2 按金额返',
  `calc_type` int(11) DEFAULT NULL COMMENT '算法类型：\r\n1 固定比率\r\n2 固定金额每单商品数\r\n3 阶梯全额比率\r\n4 阶梯超额比率 \r\n5 阶梯全额固定金额',
  `fixed_rate` decimal(12,2) DEFAULT NULL COMMENT '固定返利比率',
  `fixed_amount` decimal(12,2) DEFAULT NULL COMMENT '    固定返利金额',
  `ladder_no` int(11) DEFAULT NULL COMMENT '阶梯号',
  `ladder_target_amount` decimal(12,2) DEFAULT NULL COMMENT '阶梯目标金额',
  `ladder_rebate_rate` varchar(12) DEFAULT NULL COMMENT '阶梯返利比率',
  `ladder_rebate_amount` decimal(12,2) DEFAULT NULL COMMENT '阶梯返利金额',
  `status` int(11) DEFAULT NULL COMMENT '0 正常 -100弃用',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='返利活动算法表';

/*Table structure for table `settle_promotion_serve` */

CREATE TABLE `settle_promotion_serve` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_type` int(11) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL COMMENT '促销类型\r\n1-库存补偿\r\n2-销量补偿',
  `category_id` varchar(100) DEFAULT NULL COMMENT '品类ID',
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '促销ID',
  `promotion_desc` varchar(100) DEFAULT NULL COMMENT '促销描述',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `promotion_rate` decimal(12,2) DEFAULT NULL,
  `promotion_price` decimal(14,4) DEFAULT NULL COMMENT '促销价',
  `start_date` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '活动结束时间',
  `status` int(11) DEFAULT NULL COMMENT '处理状态\r\n0-未处理\r\n1-已处理',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_promotion_serve_copy` */

CREATE TABLE `settle_promotion_serve_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_type` int(11) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL,
  `promotion_type` int(11) DEFAULT NULL COMMENT '促销类型\r\n1-库存补偿\r\n2-销量补偿',
  `category_id` varchar(100) DEFAULT NULL COMMENT '品类ID',
  `promotion_id` varchar(50) DEFAULT NULL COMMENT '促销ID',
  `promotion_desc` varchar(100) DEFAULT NULL COMMENT '促销描述',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `promotion_rate` decimal(12,2) DEFAULT NULL,
  `promotion_price` decimal(14,4) DEFAULT NULL COMMENT '促销价',
  `start_date` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '活动结束时间',
  `status` int(11) DEFAULT NULL COMMENT '处理状态\r\n0-未处理\r\n1-已处理',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order` */

CREATE TABLE `settle_purchase_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `purchase_unique_id` varchar(50) DEFAULT NULL COMMENT '采购唯一ID',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '供应商ID',
  `vendor_name` varchar(200) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '供应商账户组类型\r\n1001-经销\r\n1002-代销',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购单号',
  `org_purchase_id` varchar(50) DEFAULT NULL COMMENT '原始采购单ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '仓库ID',
  `purchase_type` int(11) DEFAULT NULL COMMENT '采购单类型\r\n1-采进\r\n2-采退\r\n3-虚进\r\n4-虚退',
  `delivery_date` datetime DEFAULT NULL COMMENT '采购单收货确认时间',
  `close_date` datetime DEFAULT NULL COMMENT '采购单关闭时间',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '税码',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '税率',
  `purchase_by` varchar(50) DEFAULT NULL,
  `purchaser_phone` varchar(50) DEFAULT NULL,
  `settle_status` int(11) DEFAULT NULL COMMENT '0未处理；1已关闭；2已处理；-100无效',
  `fin_status` int(11) DEFAULT NULL COMMENT '财务状态\r\n0-未处理\r\n1-已处理',
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151752 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order_item` */

CREATE TABLE `settle_purchase_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '采购单ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU名称',
  `purchase_quantity` int(11) DEFAULT NULL COMMENT '采购数量',
  `receive_quantity` int(11) DEFAULT NULL COMMENT '收货数量',
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '含税采购单价',
  `delivery_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258806 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_order_new` */

CREATE TABLE `settle_purchase_order_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
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
  `tax_code` varchar(50) DEFAULT NULL,
  `tax_rate` decimal(14,4) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `purchase_by` varchar(50) DEFAULT NULL,
  `purchaser_phone` varchar(50) DEFAULT NULL,
  `settle_status` int(11) DEFAULT NULL,
  `fin_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pIdx` (`purchase_id`),
  KEY `idx_purchase_unique_id` (`purchase_unique_id`),
  KEY `idx_creation_date` (`creation_date`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `idx_fin` (`fin_status`),
  KEY `idx_fin_purch` (`fin_status`,`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6671439 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_vendor_stock` */

CREATE TABLE `settle_purchase_vendor_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1有库存、2卖空   -100',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139077 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_purchase_vendor_stock_copy` */

CREATE TABLE `settle_purchase_vendor_stock_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) DEFAULT NULL,
  `purchase_id` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1有库存、2卖空   -100',
  `creation_date` datetime DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137189 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_sale_order` */

CREATE TABLE `settle_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `order_sku_unique_id` bigint(20) DEFAULT NULL COMMENT 'è®¢å•skuå”¯ä¸€æ ‡è¯†',
  `sale_unique_id` varchar(50) DEFAULT NULL COMMENT '????ID',
  `order_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `parent_order_id` varchar(50) DEFAULT NULL,
  `out_order_id` varchar(50) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '1-???2-??',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `order_source` int(11) DEFAULT NULL,
  `order_source_vendor_id` varchar(50) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '????????',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU??',
  `sku_type` int(11) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '??????',
  `sku_sale_price` decimal(12,2) DEFAULT NULL,
  `commission_type` int(11) DEFAULT '-1' COMMENT '扣点类型 固定扣率 固定金额',
  `actual_money` decimal(14,4) DEFAULT NULL COMMENT '实际支付金额',
  `commission_amount` decimal(14,4) DEFAULT NULL COMMENT '扣点信息',
  `company_id` int(11) DEFAULT '0' COMMENT '公司区分：1 非好日子 3 好日子',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `sku_batch_weight` decimal(14,4) DEFAULT '0.0000' COMMENT '批次重量',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '??',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '??',
  `delivery_date` datetime DEFAULT NULL COMMENT '???????',
  `sale_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `settle_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `fin_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `fin_payment_flag` int(11) DEFAULT '0' COMMENT '订单是否使用余额和礼品卡支付',
  `check_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`) USING BTREE,
  KEY `o_id_idx` (`order_id`) USING BTREE,
  KEY `idx_sale_uid` (`sale_unique_id`) USING BTREE,
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `out_oi_idx` (`out_order_id`) USING BTREE,
  KEY `idx_creation_date` (`creation_date`) USING BTREE,
  KEY `idx_purchase_sku` (`purchase_id`) USING BTREE,
  KEY `idx_fin_type` (`fin_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=406127951 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_sale_order_copy` */

CREATE TABLE `settle_sale_order_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `order_sku_unique_id` bigint(20) DEFAULT NULL COMMENT 'è®¢å•skuå”¯ä¸€æ ‡è¯†',
  `sale_unique_id` varchar(50) DEFAULT NULL COMMENT '????ID',
  `order_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `parent_order_id` varchar(50) DEFAULT NULL,
  `out_order_id` varchar(50) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '1-???2-??',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `order_source` int(11) DEFAULT NULL,
  `order_source_vendor_id` varchar(50) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '????????',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU??',
  `sku_type` int(11) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '??????',
  `sku_sale_price` decimal(12,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '???????',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '??',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '??',
  `delivery_date` datetime DEFAULT NULL COMMENT '???????',
  `sale_date` datetime DEFAULT NULL COMMENT '???????',
  `pay_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `settle_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `fin_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `fin_payment_flag` int(11) DEFAULT '0' COMMENT '订单是否使用余额和礼品卡支付',
  `check_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `o_id_idx` (`order_id`),
  KEY `idx_sale_uid` (`sale_unique_id`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `out_oi_idx` (`out_order_id`),
  KEY `idx_purchase_sku` (`purchase_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28479403 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_sale_order_copy1` */

CREATE TABLE `settle_sale_order_copy1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(50) DEFAULT NULL,
  `order_sku_unique_id` bigint(20) DEFAULT NULL COMMENT 'è®¢å•skuå”¯ä¸€æ ‡è¯†',
  `sale_unique_id` varchar(50) DEFAULT NULL COMMENT '????ID',
  `order_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `parent_order_id` varchar(50) DEFAULT NULL,
  `out_order_id` varchar(50) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '1-???2-??',
  `vendor_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `order_source` int(11) DEFAULT NULL,
  `order_source_vendor_id` varchar(50) DEFAULT NULL,
  `account_group_type` int(11) DEFAULT NULL COMMENT '????????',
  `purchase_id` varchar(50) DEFAULT NULL COMMENT '???ID',
  `warehouse_id` varchar(50) DEFAULT NULL COMMENT '??ID',
  `sku_id` varchar(50) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'SKU??',
  `sku_type` int(11) DEFAULT NULL,
  `include_tax_price` decimal(14,4) DEFAULT NULL COMMENT '??????',
  `sku_sale_price` decimal(12,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '???????',
  `tax_code` varchar(50) DEFAULT NULL COMMENT '??',
  `tax_rate` decimal(14,4) DEFAULT NULL COMMENT '??',
  `delivery_date` datetime DEFAULT NULL COMMENT '???????',
  `sale_date` datetime DEFAULT NULL COMMENT '???????',
  `pay_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `settle_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `fin_status` int(11) DEFAULT NULL COMMENT '????\r\n0-???\r\n1-???',
  `check_status` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u_unique_id` (`unique_id`),
  KEY `o_id_idx` (`order_id`),
  KEY `idx_sale_uid` (`sale_unique_id`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `out_oi_idx` (`out_order_id`),
  KEY `idx_purchase_sku` (`purchase_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28479403 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_uid_sequence` */

CREATE TABLE `settle_uid_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43672 DEFAULT CHARSET=utf8;

/*Table structure for table `settle_vendor_fin_info` */

CREATE TABLE `settle_vendor_fin_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) NOT NULL DEFAULT '',
  `vendor_name` varchar(100) NOT NULL DEFAULT '',
  `account_group_type` int(11) NOT NULL DEFAULT '-10' COMMENT '供应商类型',
  `is_internal` int(11) NOT NULL DEFAULT '-10' COMMENT '是否内部供应商',
  `settle_way` int(11) NOT NULL DEFAULT '-10' COMMENT '结算方式',
  `settle_period` int(10) NOT NULL DEFAULT '0' COMMENT '账期',
  `turn_period` int(10) NOT NULL DEFAULT '0' COMMENT '周转',
  `age_period` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '账龄',
  `stated_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '生成账单未结款',
  `unstated_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '未生成账单款',
  `total_unpay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总未付款',
  `stock_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '库存',
  `should_pay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '应付款',
  `total_pay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总已付款',
  `total_purchase_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总采购金额',
  `total_return_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总采退金额',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `last_changed_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `changed_by` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_name` (`vendor_id`,`creation_date`),
  KEY `index_name_1` (`vendor_id`),
  KEY `vid_date` (`vendor_id`(7),`creation_date`),
  KEY `v_date` (`creation_date`),
  KEY `dateIndx` (`creation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=166322 DEFAULT CHARSET=utf8 COMMENT='供应商财务信息表';

/*Table structure for table `settle_vendor_fin_info_0613bak` */

CREATE TABLE `settle_vendor_fin_info_0613bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(50) NOT NULL DEFAULT '',
  `vendor_name` varchar(100) NOT NULL DEFAULT '',
  `account_group_type` int(11) NOT NULL DEFAULT '-10' COMMENT '供应商类型',
  `is_internal` int(11) NOT NULL DEFAULT '-10' COMMENT '是否内部供应商',
  `settle_way` int(11) NOT NULL DEFAULT '-10' COMMENT '结算方式',
  `settle_period` int(10) NOT NULL DEFAULT '0' COMMENT '账期',
  `turn_period` int(10) NOT NULL DEFAULT '0' COMMENT '周转',
  `age_period` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '账龄',
  `stated_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '生成账单未结款',
  `unstated_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '未生成账单款',
  `total_unpay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总未付款',
  `stock_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '库存',
  `should_pay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '应付款',
  `total_pay_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总已付款',
  `total_purchase_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总采购金额',
  `total_return_amount` decimal(14,2) NOT NULL DEFAULT '0.00' COMMENT '总采退金额',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `last_changed_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `changed_by` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88784 DEFAULT CHARSET=utf8 COMMENT='供应商财务信息表';

/*Table structure for table `sku_site_status` */

CREATE TABLE `sku_site_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `sku_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `tmall_sale_order` */

CREATE TABLE `tmall_sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alipay_order_id` varchar(64) DEFAULT NULL,
  `tmall_order_id` varchar(64) DEFAULT NULL,
  `in_amount` decimal(12,2) DEFAULT NULL,
  `out_amount` decimal(12,2) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `memo` varchar(1024) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `business_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_changed_date` datetime DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tmallOrderId` (`tmall_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12334 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

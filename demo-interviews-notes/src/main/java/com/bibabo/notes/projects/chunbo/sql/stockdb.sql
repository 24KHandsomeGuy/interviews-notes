/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - stock_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stock_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `app_inv_shortage_monitor` */

CREATE TABLE `app_inv_shortage_monitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID，  仓库id,为0时可能是配送区域有问题',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品sku',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `sale_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '销售类型',
  `is_have_presell` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `sale_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预售发放形式 1:天量,0:总量',
  `stock_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '可卖数-前端传来的可卖数',
  `stock_num_list` varchar(128) NOT NULL DEFAULT '' COMMENT '备注信息',
  `now_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前端传过来的最近报缺时间',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始报缺时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `max_sold_out_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT 'ERP历史最近售罄时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id_ware_id` (`sku_id`,`ware_id`) USING BTREE,
  KEY `idx_create_date` (`now_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015466974 DEFAULT CHARSET=utf8 COMMENT='前台网站报缺统计报表';

/*Table structure for table `app_inv_shortage_monitor2` */

CREATE TABLE `app_inv_shortage_monitor2` (
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID，  仓库id,为0时可能是配送区域有问题',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品sku',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `sale_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '销售类型',
  `is_have_presell` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `sale_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预售发放形式 1:天量,0:总量',
  `stock_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '可卖数-前端传来的可卖数',
  `stock_num_list` varchar(128) NOT NULL DEFAULT '' COMMENT '备注信息',
  `now_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前端传过来的最近报缺时间',
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始报缺时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `max_sold_out_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT 'ERP历史最近售罄时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台网站报缺统计报表';

/*Table structure for table `app_inv_shortage_monitor_daily` */

CREATE TABLE `app_inv_shortage_monitor_daily` (
  `date_flag` date DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL COMMENT '库房ID，  仓库id,为0时可能是配送区域有问题',
  `sku_id` varchar(128) DEFAULT NULL COMMENT '商品sku',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型',
  `is_have_presell` int(11) DEFAULT NULL COMMENT '是否预售',
  `sale_way` int(11) DEFAULT NULL COMMENT '预售发放形式 1-天量 0-总量',
  `stock_num` decimal(11,2) DEFAULT NULL COMMENT ' 可卖数-前端传过来的可卖书',
  `stock_num_list` varchar(128) DEFAULT NULL COMMENT '备注信息',
  `start_date` datetime(6) DEFAULT NULL COMMENT '开始报缺时间',
  `now_date` varchar(128) DEFAULT NULL COMMENT '前端传过来的最近报缺时间',
  `create_date` datetime(6) DEFAULT NULL COMMENT '数据创建时间',
  `max_sold_out_date` datetime(6) DEFAULT NULL COMMENT 'ERP历史最近售罄时间',
  `update_date` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shelf_status` int(11) DEFAULT NULL,
  `sku_status` int(11) DEFAULT NULL,
  `sale_status` int(11) DEFAULT NULL COMMENT 'product.sale_status',
  `hour_flag` smallint(6) DEFAULT '0' COMMENT '9:早上9点记录, 21:晚上21记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8163 DEFAULT CHARSET=utf8 COMMENT='前台网站报缺统计报表';

/*Table structure for table `app_inv_shortage_total_skus` */

CREATE TABLE `app_inv_shortage_total_skus` (
  `first_class_id` int(11) DEFAULT NULL,
  `first_class_name` text,
  `second_class_id` int(11) DEFAULT NULL,
  `second_class_name` text,
  `total_sku_cnt` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `date_flag` date DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `delivery_notice` */

CREATE TABLE `delivery_notice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '领用单id',
  `operation` varchar(255) NOT NULL DEFAULT '' COMMENT '操作',
  `operator` varchar(65) NOT NULL DEFAULT '' COMMENT '操作人',
  `do_time` varchar(50) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `status` int(11) NOT NULL DEFAULT '0',
  `status_name` varchar(50) NOT NULL DEFAULT '',
  `note_status` int(11) NOT NULL DEFAULT '0',
  `note_status_name` varchar(50) NOT NULL DEFAULT '',
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8 COMMENT='配送通知';

/*Table structure for table `department` */

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `parent_dept_id` int(11) DEFAULT NULL COMMENT '父级部门id',
  `dept_code` varchar(32) DEFAULT NULL COMMENT '部门编号',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门名称',
  `dept_level` varchar(45) DEFAULT NULL COMMENT '部门级别',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `priority` int(11) DEFAULT NULL COMMENT '优先级 0为最低，依次增加为优先级更高',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息表';

/*Table structure for table `departmentb` */

CREATE TABLE `departmentb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_dept_id` int(11) DEFAULT NULL COMMENT '父级部门id',
  `dept_code` varchar(32) DEFAULT NULL COMMENT '部门编号',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门名称',
  `dept_level` varchar(45) DEFAULT NULL COMMENT '部门级别',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `priority` int(11) DEFAULT NULL COMMENT '优先级 0为最低，依次增加为优先级更高',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息表';

/*Table structure for table `dmall_box_tmp1` */

CREATE TABLE `dmall_box_tmp1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `sku_id` int(11) unsigned DEFAULT NULL COMMENT '商品sku',
  `sku_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `shop_id` int(11) DEFAULT NULL COMMENT '门店编号',
  `date_time` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`),
  KEY `box_header2` (`box_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='多点包裹表1';

/*Table structure for table `gift_card_return_log` */

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
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `return_desc` varchar(128) NOT NULL DEFAULT 'SYSTEM' COMMENT '退卡描述',
  `created_by` varchar(50) NOT NULL DEFAULT 'SYSTEM' COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退卡记录表';

/*Table structure for table `log_stock_erp_inventory` */

CREATE TABLE `log_stock_erp_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `sku_id` bigint(20) DEFAULT NULL,
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存类型 1:正品，2:次品',
  `on_hand_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '实物在库数',
  `moving_average_cost` decimal(16,4) DEFAULT '-1.0000' COMMENT '移动平均成本',
  `on_order_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途数',
  `alloc_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售or领用待出库占用',
  `trans_in_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `wip_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '在制品',
  `on_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售在途',
  `lock_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '锁定数',
  `pre_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存',
  `finish_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '妥投数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `frozen_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数量',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `op_num` decimal(11,4) DEFAULT '0.0000' COMMENT '操作数量',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY `idx_sku_ware_credate` (`sku_id`,`ware_id`,`create_date`),
  KEY `create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28928093 DEFAULT CHARSET=utf8 COMMENT='erp库存镜像记录表';

/*Table structure for table `log_stock_inventory` */

CREATE TABLE `log_stock_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `order_book_num` decimal(11,4) DEFAULT '0.0000' COMMENT '订单预占',
  `on_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '零售仓安全库存',
  `stock_num` decimal(11,4) DEFAULT '0.0000' COMMENT '在库数',
  `on_order_num` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途',
  `trans_in_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `pre_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存（废弃）',
  `groupon_num` decimal(11,4) DEFAULT '0.0000' COMMENT '团购量',
  `snap_up_num` decimal(11,4) DEFAULT '0.0000' COMMENT '抢购量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `sold_out_time` timestamp NULL DEFAULT NULL COMMENT '售罄时间',
  `frozen_num` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `op_num` decimal(11,4) DEFAULT '0.0000' COMMENT '操作数量',
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sku_ware_credate` (`sku_id`,`ware_id`,`create_date`),
  KEY `create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_ware` (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39971811 DEFAULT CHARSET=utf8 COMMENT='可卖库存镜像记录表';

/*Table structure for table `my_sku_rep_inventory` */

CREATE TABLE `my_sku_rep_inventory` (
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `is_valid` int(1) NOT NULL DEFAULT '0',
  `is_defaul_dist` int(1) NOT NULL DEFAULT '0',
  `is_del` int(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `on_hand_qty` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `order_ship_time_period` */

CREATE TABLE `order_ship_time_period` (
  `id` int(11) NOT NULL COMMENT '主键',
  `seq` int(11) DEFAULT '1' COMMENT '序号：排序方式',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间段',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间段',
  `shipment_type` smallint(6) DEFAULT '5' COMMENT '配送类型：5极速达，7当日达',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单配送时区字典表';

/*Table structure for table `qx_base_order_wip_component_cost` */

CREATE TABLE `qx_base_order_wip_component_cost` (
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `top_sku_id` int(11) DEFAULT NULL COMMENT '组套商品ID',
  `top_sku_name` varchar(255) DEFAULT NULL COMMENT '组套商品名称',
  `top_sku_num` decimal(14,4) DEFAULT NULL COMMENT '组套商品数量',
  `comp_level1_id` int(11) DEFAULT NULL COMMENT '子商品一级分类ID',
  `comp_level1_name` varchar(255) DEFAULT NULL COMMENT '子商品一级分类名称',
  `comp_level2_id` int(11) DEFAULT NULL COMMENT '子商品二级分类ID',
  `comp_level2_name` varchar(255) DEFAULT NULL COMMENT '子商品二级分类名称',
  `comp_sku_id` bigint(20) DEFAULT NULL COMMENT 'SKUID',
  `comp_sku_name` varchar(255) DEFAULT NULL COMMENT 'skuName',
  `comp_sku_num` decimal(10,2) DEFAULT NULL COMMENT '子商品数量',
  `comp_price` decimal(10,2) DEFAULT NULL COMMENT '商品售价',
  `comp_cost` decimal(10,2) DEFAULT NULL COMMENT '成本',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `date_flag` date DEFAULT NULL COMMENT '日期标识',
  `order_type` varchar(32) DEFAULT NULL COMMENT '订单类型：正向， 逆向',
  `biz_type` varchar(32) DEFAULT NULL COMMENT '操作类型： 卡领出，卡退回，集采正向，集采逆向，卡消费，卡销退',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_detail_id` bigint(20) DEFAULT '0' COMMENT '订单明细ID',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_top_sku_id` (`top_sku_id`),
  KEY `idx_date_flag` (`date_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企销妥投销售加工品拆分毛利表';

/*Table structure for table `qx_base_sales_cost_detail` */

CREATE TABLE `qx_base_sales_cost_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` varchar(200) DEFAULT NULL COMMENT '卡批次',
  `receive_id` varchar(200) DEFAULT NULL COMMENT '卡领出批次',
  `serial_no` varchar(200) DEFAULT NULL COMMENT '序列号',
  `card_code` varchar(200) DEFAULT NULL COMMENT '卡号',
  `account_id` varchar(32) DEFAULT NULL COMMENT '企销客户ID',
  `account_name` varchar(200) DEFAULT NULL COMMENT '企销客户名称',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '卡售价',
  `discount_rate` decimal(10,4) DEFAULT NULL COMMENT '折扣率',
  `face_value` decimal(10,2) DEFAULT NULL COMMENT '卡面额',
  `receive_date` datetime DEFAULT NULL COMMENT '领出时间',
  `biz_type` varchar(16) DEFAULT NULL COMMENT '操作类型： 卡领出，卡退回，集采正向，集采逆向，卡消费，卡销退',
  `sales_user_id` varchar(32) DEFAULT NULL COMMENT '销售账号',
  `sales_user_name` varchar(32) DEFAULT NULL COMMENT '销售名',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `order_type` varchar(16) DEFAULT NULL COMMENT '订单类型:正向，逆向',
  `order_date` datetime DEFAULT NULL COMMENT '下单时间',
  `finish_date` datetime DEFAULT NULL COMMENT '妥投时间',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `ware_name` varchar(32) DEFAULT NULL COMMENT '仓库名称',
  `level1_id` int(11) DEFAULT NULL COMMENT '商品一级分类ID',
  `level1_name` varchar(32) DEFAULT NULL COMMENT '商品一级分类名称',
  `level2_id` int(11) DEFAULT NULL COMMENT '商品二级分类ID',
  `level2_name` varchar(32) DEFAULT NULL COMMENT '商品二级分类名称',
  `sku_id` int(11) DEFAULT NULL COMMENT 'SKUID',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'skuName',
  `sku_num` decimal(10,2) DEFAULT NULL COMMENT '商品数量',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '商品售价',
  `sku_cost` decimal(10,2) DEFAULT NULL COMMENT '成本',
  `pay_money` decimal(10,2) DEFAULT NULL COMMENT '现金',
  `account_money` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `giftcard_price` decimal(10,2) DEFAULT NULL COMMENT '卡',
  `coupon_price_lxj` decimal(10,2) DEFAULT NULL COMMENT '券（礼享集）',
  `coupon_price` decimal(10,2) DEFAULT NULL COMMENT '优惠券',
  `member_point_price` decimal(10,2) DEFAULT NULL COMMENT '积分',
  `third_point_price` decimal(10,2) DEFAULT NULL COMMENT '三方积分',
  `order_direct_source` int(11) DEFAULT NULL COMMENT '订单来源',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细id',
  `card_type` int(11) DEFAULT NULL COMMENT '卡类型',
  `date_flag` date DEFAULT NULL COMMENT '业务日期',
  `sku_type` int(11) DEFAULT NULL COMMENT '订单skuType：1普通， 2虚拟组套， 3虚拟组套子商品',
  `cash_coupon` decimal(10,2) DEFAULT NULL COMMENT '三方承认的优惠券金额',
  `tax_code` varchar(16) DEFAULT NULL COMMENT '销项税码',
  `tax_code_value` decimal(10,2) DEFAULT NULL COMMENT '销项税率',
  `order_channel` int(11) DEFAULT NULL COMMENT '订单渠道',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8;

/*Table structure for table `replenish_omission` */

CREATE TABLE `replenish_omission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `replenish_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '补货申请单号',
  `prime_replenish_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '对应的原补货单号',
  `store_id` int(11) NOT NULL COMMENT '店id',
  `store_name` varchar(128) NOT NULL COMMENT '店名称',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `sku_name` varchar(255) NOT NULL,
  `replenish_num` decimal(14,4) NOT NULL COMMENT '补货数量',
  `expect_date` date NOT NULL COMMENT '期望收货时间',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_replenish_prime_id` (`replenish_id`,`prime_replenish_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='记录补货后不足的商品信息';

/*Table structure for table `replenishment` */

CREATE TABLE `replenishment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `replenish_receipt_id` bigint(20) NOT NULL COMMENT '补货申请单号，外部生成的单号',
  `store_id` int(11) NOT NULL COMMENT '店id',
  `store_name` varchar(128) NOT NULL COMMENT '店名称',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `replenish_num` decimal(14,4) NOT NULL COMMENT '补货数量',
  `expect_date` date NOT NULL COMMENT '期望收货时间',
  `replenish_status` tinyint(2) NOT NULL COMMENT '申请单状态，取值：0（新建），1（已确认），2（已完成），3（已取消）',
  `sell_order_id` bigint(20) DEFAULT '0' COMMENT '销货单id',
  `purchase_order_id` bigint(20) DEFAULT '0' COMMENT '采购单id',
  `business_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '补货业务分类，取值：1（零售店的补货），2（悦店的补货）',
  `application_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `application_person` varchar(16) NOT NULL COMMENT '申请人',
  `confirm_time` timestamp NULL DEFAULT NULL COMMENT '确认操作时间，如果操作的是取消，那么就表示取消时间',
  `confirm_person` varchar(16) DEFAULT NULL COMMENT '确认操作人，如果操作的是取消，那么就表示取消操作人',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `changed_by` varchar(16) NOT NULL COMMENT '修改者',
  `last_changed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `application_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标识提交补货单记录的业务组来源，取值：0（默认值无意义），1（标识商品中心提交的补货单），2（标识零售店提交的补货单），3（补货单来源于悦店系统自动补货形式）',
  `replenish_cat` int(11) NOT NULL COMMENT '商品一级分类，如果此商品所属的补货单中的所有商品分类相同，则记录一级分类id；如果所属补货单中的商品有多种分类，则记录-1',
  PRIMARY KEY (`id`),
  KEY `idx_replenish_receipt_id` (`replenish_receipt_id`),
  KEY `idx_skuid` (`sku_id`),
  KEY `idx_expect_date` (`expect_date`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='补货单记录，由replenishment_plan表记录经确认后转移过来，replenishReceiptId相同的所有记录表示是同一次申请的补货商品。';

/*Table structure for table `replenishment_exception_message` */

CREATE TABLE `replenishment_exception_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `replenish_receipt_id` bigint(20) NOT NULL COMMENT '补货申请单号',
  `exception_status` tinyint(2) NOT NULL COMMENT '申请单异常状态码 0：正常 1：异常',
  `exception_message` varchar(500) DEFAULT NULL COMMENT '补货单异常信息描述',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_changed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_replenish_receipt_id` (`replenish_receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录补货申请单异常信息数据，确认补货单发生异常时会将异常信息存入表中。';

/*Table structure for table `replenishment_plan` */

CREATE TABLE `replenishment_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` int(10) unsigned NOT NULL COMMENT '店id',
  `sku_id` bigint(20) unsigned NOT NULL COMMENT 'SKU ID',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'UPC No.',
  `replenish_num` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '补货数量',
  `delete_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识，0（未删除），1（已删除）',
  `application_user` varchar(50) NOT NULL COMMENT '录入人，如果有用户修改记录，值变为修改人',
  `application_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间，如果有用户修改记录，值变为修改时间',
  `application_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标识补货申请记录的业务组来源（1：标识来自商品中心的补货申请；2：标识来自零售店的补货申请；0：默认值无意义）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='补货申请计划单记录表，当补货操作人确认后，表里的记录转换成补货单记录（replenishment表），然后记录置为无效状态。';

/*Table structure for table `sku_use_cost` */

CREATE TABLE `sku_use_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `use_id` bigint(20) DEFAULT NULL COMMENT '领用单id',
  `use_code` varchar(32) DEFAULT NULL COMMENT '领用单编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `sku_lot` varchar(32) DEFAULT NULL COMMENT '商品批次',
  `sku_price` varchar(32) DEFAULT NULL COMMENT '商品含税采购价',
  `sku_num` decimal(14,4) DEFAULT '0.0000' COMMENT '本商品本批次数量',
  `total_price` varchar(32) DEFAULT NULL COMMENT '本商品本批商品总价',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `ware_name` varchar(64) DEFAULT NULL COMMENT '仓库名称',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `tax_code_name` varchar(32) DEFAULT NULL COMMENT '税码名称',
  `tax_code_value` decimal(32,0) DEFAULT NULL COMMENT '税码值',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位id',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5486 DEFAULT CHARSET=utf8 COMMENT='领用单商品成本表';

/*Table structure for table `sku_use_detail` */

CREATE TABLE `sku_use_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` varchar(32) DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品编码',
  `sku_name` varchar(128) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL COMMENT '商品upc码',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位id',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `box_std` varchar(32) DEFAULT NULL COMMENT '商品规格',
  `box_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'sku移动平均成品',
  `applications_num` decimal(14,4) DEFAULT '0.0000' COMMENT '申请数量',
  `comments` varchar(128) DEFAULT NULL,
  `use_id` bigint(20) DEFAULT NULL COMMENT '领用单主单id',
  `real_num` decimal(14,4) DEFAULT '0.0000' COMMENT '实际领用数量',
  `temp_area_id` int(11) NOT NULL DEFAULT '0' COMMENT '温区',
  `valid_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品毛重',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_use_id` (`use_id`)
) ENGINE=InnoDB AUTO_INCREMENT=640778 DEFAULT CHARSET=utf8mb4 COMMENT='领用商品明细';

/*Table structure for table `sku_use_job` */

CREATE TABLE `sku_use_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_flag` smallint(6) DEFAULT NULL COMMENT 'job进程状态 0新建/失败  1操作成功',
  `process_flag` smallint(6) DEFAULT NULL COMMENT '领用单操作标志  10推送领用单到库房   20计算领用单成本',
  `use_id` bigint(20) DEFAULT NULL COMMENT '领用单id',
  `comments` varchar(64) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_lock` int(4) DEFAULT '0' COMMENT '是否加锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82750 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_use_main` */

CREATE TABLE `sku_use_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `use_code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '领用单编号',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `ware_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '仓库名称',
  `owner_id` bigint(20) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '货主名称',
  `use_type` smallint(6) DEFAULT NULL COMMENT '领用类型 1正品  2残品',
  `shipment_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:随时送,1:定时达（上午送）,2:定时达（下午送）,3:定时达（晚上送）',
  `deliver_goods_require` varchar(32) NOT NULL DEFAULT '' COMMENT '送货要求',
  `shipment_spot_name` varchar(64) NOT NULL DEFAULT '' COMMENT '站点',
  `applications_num` decimal(14,4) DEFAULT '0.0000' COMMENT '申请数量',
  `erp_use_num` decimal(14,4) DEFAULT '0.0000' COMMENT 'ERP实际领用占用数量',
  `real_use_num` decimal(14,4) DEFAULT '0.0000' COMMENT '仓库实物领用占用数量',
  `application_class_num` int(11) DEFAULT NULL COMMENT '申请领用种类数',
  `erp_class_num` int(11) DEFAULT NULL COMMENT 'ERP实际领用占用中类数',
  `real_class_num` int(11) DEFAULT NULL COMMENT '仓库实物领用占用种类数',
  `total_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本总金额',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '领用部门id',
  `dept_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '领用部门名称',
  `user_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '领用人',
  `lot_type` smallint(6) DEFAULT NULL COMMENT '领用商品批次规则，0最新批次  1冻结批次  2随机批次',
  `use_id` bigint(20) DEFAULT NULL COMMENT '用途id',
  `use_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '用途名称',
  `sku_use_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '领用时间',
  `comments` varchar(128) DEFAULT NULL COMMENT '备注',
  `status` smallint(6) DEFAULT NULL COMMENT '状态 0 新建 1送审 2审核通过 3驳回 4领用取消 5领用完成',
  `route_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '路由状态',
  `shortage_use` smallint(6) DEFAULT NULL COMMENT '仓库实物缺货占用， 1占用   0不占用',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `audit_user_name` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '审核人',
  `audit_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '审核时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `consigned_order_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '委外订单号',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '加工商id',
  `supplier_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '加工商名称',
  `own_vehicle_use` tinyint(6) NOT NULL DEFAULT '0' COMMENT '配送方式， 0:快递配送、1:自有车辆送货、2:到仓库自提',
  `service_id` varchar(30) NOT NULL DEFAULT '' COMMENT '配送服务标示',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '承运商id',
  `carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `consignee` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货人',
  `receipt_tel` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货人联系电话',
  `receipt_address` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货地址',
  `receiving_province` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货省',
  `receiving_city` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货市',
  `receiving_area` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收货区',
  `map_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '坐标类型：1高德， 2,百度， 3 腾讯',
  `lng` varchar(26) NOT NULL DEFAULT '' COMMENT '经度坐标',
  `lat` varchar(26) NOT NULL DEFAULT '' COMMENT '纬度坐标',
  `six_rings` smallint(6) NOT NULL DEFAULT '2' COMMENT '六环内外：1、内，2、外',
  `other_params` varchar(600) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201271732803 DEFAULT CHARSET=utf8mb4 COMMENT='商品领用单主表';

/*Table structure for table `sku_use_purpose` */

CREATE TABLE `sku_use_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_code` varchar(32) DEFAULT NULL COMMENT '用途编号',
  `use_name` varchar(64) DEFAULT NULL COMMENT '用途名称',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27571 DEFAULT CHARSET=utf8 COMMENT='用途';

/*Table structure for table `sku_use_status` */

CREATE TABLE `sku_use_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `use_main_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '领用单主表id',
  `use_code` varchar(32) NOT NULL DEFAULT '' COMMENT '领用单编号',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0 新建 1送审 2审核通过 3驳回 4领用取消 5领用完成 6领用单已到达库房',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作员',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8 COMMENT='领用单状态';

/*Table structure for table `sku_ware_map` */

CREATE TABLE `sku_ware_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL COMMENT '商品编号',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房编号',
  `priority` int(11) DEFAULT NULL COMMENT '库房优先级;数越大优先级越高',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '1:有效 0:无效',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库房关系表';

/*Table structure for table `snapshot_stock_erp_inventory` */

CREATE TABLE `snapshot_stock_erp_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库编号',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `inventory_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '库存类型 1:正品，2:次品',
  `on_hand_qty` int(11) NOT NULL DEFAULT '0' COMMENT '实物库存',
  `on_order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '采购在途',
  `alloc_qty` int(11) NOT NULL DEFAULT '0' COMMENT '销售预占',
  `trans_in_qty` int(11) NOT NULL DEFAULT '0' COMMENT '调拨入',
  `trans_out_qty` int(11) NOT NULL DEFAULT '0' COMMENT '调拨出',
  `wip_qty` int(11) NOT NULL DEFAULT '0' COMMENT '在制品',
  `on_sale_qty` int(11) NOT NULL DEFAULT '0' COMMENT '销售在途',
  `lock_qty` int(11) NOT NULL DEFAULT '0' COMMENT '锁定数',
  `pre_sale_qty` int(11) NOT NULL DEFAULT '0' COMMENT '预售库存',
  `finish_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '妥投数',
  `frozen_qty` int(11) NOT NULL DEFAULT '0' COMMENT '冻结数量',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `snapshot_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '快照日期',
  `snapshot_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '快照时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1406528 DEFAULT CHARSET=utf8 COMMENT='erp库存表当日快照';

/*Table structure for table `snapshot_stock_inventory` */

CREATE TABLE `snapshot_stock_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房号',
  `order_book_num` decimal(11,4) DEFAULT '0.0000' COMMENT '订单预占',
  `on_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '销售在途',
  `stock_num` decimal(11,4) DEFAULT '0.0000' COMMENT '库存',
  `on_order_num` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途',
  `trans_in_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `pre_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存（废弃）',
  `groupon_num` decimal(11,4) DEFAULT '0.0000' COMMENT '团购量',
  `snap_up_num` decimal(11,4) DEFAULT '0.0000' COMMENT '抢购量',
  `frozen_num` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `snapshot_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '快照日期',
  `snapshot_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '快照时间',
  PRIMARY KEY (`id`),
  KEY `idx_inventory_stock` (`sku_id`,`ware_id`),
  KEY `idx_snapshot_date` (`snapshot_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2288094 DEFAULT CHARSET=utf8 COMMENT='可卖数表当日快照';

/*Table structure for table `snapshot_stock_lot_inventory` */

CREATE TABLE `snapshot_stock_lot_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT '0',
  `ware_id` int(11) DEFAULT '0',
  `purchase_id` bigint(20) DEFAULT '0' COMMENT '采购单id',
  `purchase_code` varchar(32) DEFAULT '' COMMENT '采购单编号',
  `sku_lot` varchar(64) DEFAULT '' COMMENT 'sku批次',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `inventory_type` smallint(6) DEFAULT '0' COMMENT '1:正品;2:次品',
  `shelf_life_days` int(11) DEFAULT '0' COMMENT '保质期天数',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `quantity` decimal(11,4) DEFAULT '0.0000' COMMENT '在库数量',
  `swap_in_num` decimal(11,4) DEFAULT '0.0000' COMMENT '转码入数量',
  `sale_alloc_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '订单or领用占用数',
  `swap_out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '转码出数量',
  `save_date` timestamp NULL DEFAULT NULL COMMENT '收货日期',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '系统日期',
  `wip_used_num` decimal(11,4) DEFAULT '0.0000' COMMENT '加工品使用数',
  `profit_num` decimal(11,4) DEFAULT '0.0000' COMMENT '报益数',
  `loss_num` decimal(11,4) DEFAULT '0.0000' COMMENT '报损数',
  `frozen_flag` int(11) DEFAULT '0' COMMENT '冻结标记: 1-冻结 0-非冻结',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `snapshot_date` timestamp NULL DEFAULT NULL COMMENT '快照日期',
  `snapshot_time` timestamp NULL DEFAULT NULL COMMENT '快照时间',
  PRIMARY KEY (`id`),
  KEY `idx_lot_inv_sku` (`sku_id`,`ware_id`,`purchase_id`,`sku_lot`,`inventory_type`),
  KEY `idx_snapdate_sub` (`snapshot_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4237232 DEFAULT CHARSET=utf8 COMMENT='批次表当日快照';

/*Table structure for table `stock_data_push` */

CREATE TABLE `stock_data_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `sku_id` int(11) NOT NULL COMMENT 'skuId',
  `ware_id` int(11) NOT NULL COMMENT '仓库ID',
  `push_type` smallint(6) NOT NULL DEFAULT '-1' COMMENT '任务类型',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0 新增，1成功， -1失败',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='库存系统数据推送表';

/*Table structure for table `stock_day_report` */

CREATE TABLE `stock_day_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) NOT NULL COMMENT '仓库名称',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `report_date` date NOT NULL COMMENT '时间',
  `start_price` decimal(14,4) DEFAULT '0.0000' COMMENT '期初库存',
  `purchase_price` decimal(14,4) DEFAULT '0.0000' COMMENT '累计进货',
  `sell_price` decimal(14,4) DEFAULT '0.0000' COMMENT '累计销售',
  `loss_price` decimal(14,4) DEFAULT '0.0000' COMMENT '盘亏',
  `profit_price` decimal(14,4) DEFAULT '0.0000' COMMENT '盘盈',
  `use_price` decimal(14,4) DEFAULT '0.0000' COMMENT '领用',
  `stock_price` decimal(14,4) DEFAULT '0.0000' COMMENT '系统库存',
  `occupy_price` decimal(14,4) DEFAULT '0.0000' COMMENT '原料占用',
  `process_price` decimal(14,4) DEFAULT '0.0000' COMMENT '成品加工',
  `return_price` decimal(14,4) DEFAULT '0.0000' COMMENT '销退',
  `allot_in` decimal(14,4) DEFAULT '0.0000' COMMENT '调拨入',
  `allot_out` decimal(14,4) DEFAULT '0.0000' COMMENT '调拨出',
  `purchase_return` decimal(14,4) DEFAULT '0.0000' COMMENT '采退',
  `delegated_purchase` decimal(14,4) DEFAULT '0.0000' COMMENT '委外采购',
  `delegated_process_occupy` decimal(14,4) DEFAULT '0.0000' COMMENT '委外加工占用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日报表结果导出表';

/*Table structure for table `stock_day_report_fixed` */

CREATE TABLE `stock_day_report_fixed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) NOT NULL COMMENT '仓库名称',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `report_date` date NOT NULL COMMENT '时间',
  `start_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '期初库存',
  `purchase_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计进货',
  `sell_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计销售',
  `loss_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘亏',
  `discard_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '报废',
  `profit_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘盈',
  `use_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '领用',
  `stock_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '系统库存',
  `occupy_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '原料占用',
  `process_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '成品加工',
  `return_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '销退',
  `allot_in` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨入',
  `allot_out` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨出',
  `purchase_return` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '采退',
  `delegated_purchase` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外采购',
  `delegated_process_occupy` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外加工占用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1550891 DEFAULT CHARSET=utf8 COMMENT='日报表结果导出表new';

/*Table structure for table `stock_dynamic_config` */

CREATE TABLE `stock_dynamic_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_pre_sale_id` int(20) DEFAULT NULL COMMENT '预售商品skuid',
  `type` int(11) DEFAULT '0' COMMENT '0:按总数 1:按每天数',
  `sale_days` int(11) DEFAULT NULL COMMENT '天数。可选送达天数',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `keep_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预售保留库存',
  `is_finish` int(6) DEFAULT '0' COMMENT '0:未结束 1:结束',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  `finish_type` int(6) DEFAULT NULL COMMENT '结束类型 0 正常结束 1 无效结束',
  `invalid_time` timestamp NULL DEFAULT NULL COMMENT '失效时间',
  `sale_begin_time` datetime DEFAULT NULL COMMENT '预售活动开始时间',
  `sale_end_time` datetime DEFAULT NULL COMMENT '预售活动结束时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku` (`sku_id`),
  KEY `idx_presaleid` (`sku_pre_sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255773 DEFAULT CHARSET=utf8 COMMENT='动态库存配置信息表';

/*Table structure for table `stock_dynamic_day` */

CREATE TABLE `stock_dynamic_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `op_date` date DEFAULT NULL COMMENT '时间',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku编号',
  `sku_pre_sale_id` int(20) DEFAULT NULL COMMENT '预售商品skuid',
  `type` int(11) DEFAULT NULL COMMENT '0:总数量 1:每天天数',
  `stock_num` decimal(11,4) DEFAULT '0.0000' COMMENT '库存数',
  `order_book_num` decimal(11,4) DEFAULT '0.0000' COMMENT '订单占用数',
  `keep_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预售保留库存',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_date` timestamp NULL DEFAULT NULL,
  `sale_begin_time` datetime DEFAULT NULL COMMENT '预售活动开始时间',
  `sale_end_time` datetime DEFAULT NULL COMMENT '预售活动结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_dynamic_sku` (`op_date`,`ware_id`,`sku_id`),
  KEY `idx_act_time` (`sale_begin_time`,`sale_end_time`),
  KEY `idx_sku` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23193131 DEFAULT CHARSET=utf8 COMMENT='动态库存表(极致新鲜业务)';

/*Table structure for table `stock_erp_inventory` */

CREATE TABLE `stock_erp_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `sku_id` bigint(20) DEFAULT NULL,
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存类型 1:正品，2:次品',
  `on_hand_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '实物在库数',
  `moving_average_cost` decimal(16,4) DEFAULT '-1.0000' COMMENT '移动平均成本',
  `on_order_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途数',
  `alloc_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售or领用待出库占用',
  `trans_in_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `wip_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '在制品',
  `on_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售在途',
  `lock_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '锁定数',
  `pre_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存',
  `finish_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '妥投数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `frozen_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unq_sku_erp_inv` (`ware_id`,`sku_id`,`inventory_type`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=513673 DEFAULT CHARSET=utf8 COMMENT='erp库存表';

/*Table structure for table `stock_erp_inventory_copy` */

CREATE TABLE `stock_erp_inventory_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `sku_id` bigint(20) DEFAULT NULL,
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存类型 1:正品，2:次品',
  `on_hand_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '实物在库数',
  `moving_average_cost` decimal(16,4) DEFAULT '-1.0000' COMMENT '移动平均成本',
  `on_order_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途数',
  `alloc_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售or领用待出库占用',
  `trans_in_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `wip_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '在制品',
  `on_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '销售在途',
  `lock_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '锁定数',
  `pre_sale_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存',
  `finish_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '妥投数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `frozen_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unq_sku_erp_inv` (`ware_id`,`sku_id`,`inventory_type`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48651 DEFAULT CHARSET=utf8 COMMENT='erp库存表';

/*Table structure for table `stock_erp_rule` */

CREATE TABLE `stock_erp_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_type` int(11) DEFAULT NULL COMMENT '单据类型',
  `receipt_type_name` varchar(32) DEFAULT NULL COMMENT '单据类型名称',
  `op_type` int(11) DEFAULT NULL COMMENT '库房操作类型',
  `op_type_name` varchar(32) DEFAULT NULL COMMENT '库房操作类型名',
  `column1` varchar(32) DEFAULT NULL COMMENT '列1,数据字段名',
  `column1_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column1_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `column2` varchar(32) DEFAULT NULL COMMENT '列2,数据字段名',
  `column2_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column2_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `column3` varchar(32) DEFAULT NULL COMMENT '列3,数据字段名',
  `column3_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column3_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='erp库存增减规则信息';

/*Table structure for table `stock_inventory` */

CREATE TABLE `stock_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `order_book_num` decimal(11,4) DEFAULT '0.0000' COMMENT '订单预占',
  `on_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '零售仓安全库存',
  `stock_num` decimal(11,4) DEFAULT '0.0000' COMMENT '库存',
  `on_order_num` decimal(11,4) DEFAULT '0.0000' COMMENT '采购在途',
  `trans_in_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨入',
  `trans_out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '调拨出',
  `pre_sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预售库存（废弃）',
  `groupon_num` decimal(11,4) DEFAULT '0.0000' COMMENT '团购量',
  `snap_up_num` decimal(11,4) DEFAULT '0.0000' COMMENT '抢购量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sold_out_time` timestamp NULL DEFAULT NULL COMMENT '售罄时间',
  `frozen_num` decimal(11,4) DEFAULT '0.0000' COMMENT '冻结数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_inventory_stock` (`sku_id`,`ware_id`) USING BTREE,
  KEY `idx_stock_num` (`stock_num`),
  KEY `idx_ware` (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1173839 DEFAULT CHARSET=utf8 COMMENT='可卖库存表(网站专用) 可卖数 = stock_num - order_book_num ';

/*Table structure for table `stock_inventroy_day` */

CREATE TABLE `stock_inventroy_day` (
  `op_date` datetime NOT NULL,
  `ware_id` int(11) NOT NULL COMMENT '库房编号',
  `sku_id` bigint(20) NOT NULL COMMENT '商品编号',
  `purchase_id` bigint(20) NOT NULL COMMENT '采购单',
  `sale_qty` int(11) DEFAULT '0' COMMENT '销售量',
  `finish_qty` int(11) DEFAULT '0' COMMENT '妥投量',
  `on_order_qty` int(11) DEFAULT '0' COMMENT '采购在途',
  `on_sale_qty` int(11) DEFAULT '0' COMMENT '销售在途',
  `on_hand_qty` int(11) DEFAULT '0' COMMENT '在库库存',
  `receive_qty` int(11) DEFAULT '0' COMMENT '收货量',
  `sale_return_qty` int(11) DEFAULT '0' COMMENT '销售退货',
  `purchase_return_qty` int(11) DEFAULT '0' COMMENT '采购退货',
  `loss_qty` int(11) DEFAULT '0' COMMENT '报损数',
  `profit_qty` int(11) DEFAULT '0' COMMENT '报益数',
  `short_qty` int(11) DEFAULT '0' COMMENT '报缺数',
  `defective_qty` int(11) DEFAULT '0' COMMENT '残次品数',
  PRIMARY KEY (`op_date`,`ware_id`,`sku_id`,`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存日报表';

/*Table structure for table `stock_job_config` */

CREATE TABLE `stock_job_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` int(11) DEFAULT NULL COMMENT '处理环节',
  `process_name` varchar(32) DEFAULT NULL COMMENT '环节名',
  `thread_num` int(11) DEFAULT NULL COMMENT '线程数',
  `process_num` int(11) DEFAULT NULL COMMENT '一次处理数',
  `thread_gap` int(11) DEFAULT NULL COMMENT '线程间隔时间毫秒级',
  `thread_sleep` int(11) DEFAULT NULL COMMENT '线程休眠时间毫秒级',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='库存配置信息';

/*Table structure for table `stock_lot_inventroy` */

CREATE TABLE `stock_lot_inventroy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `purchase_code` varchar(32) DEFAULT NULL COMMENT '采购单编号',
  `processor_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '委外加工商',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT 'sku批次',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税采购价',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '1:正品;2:次品',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `quantity` decimal(14,4) DEFAULT '0.0000' COMMENT '在库数量',
  `swap_in_num` decimal(14,4) DEFAULT '0.0000' COMMENT '转码入数量',
  `sale_alloc_qty` decimal(14,4) DEFAULT '0.0000' COMMENT '订单or领用占用数',
  `swap_out_num` decimal(14,4) DEFAULT '0.0000' COMMENT '转码出数量',
  `save_date` timestamp NULL DEFAULT NULL COMMENT '收货日期',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '系统日期',
  `wip_used_num` decimal(14,4) DEFAULT '0.0000' COMMENT '加工品使用数',
  `profit_num` decimal(14,4) DEFAULT '0.0000' COMMENT '报益数',
  `loss_num` decimal(14,4) DEFAULT '0.0000' COMMENT '报损数',
  `frozen_flag` int(11) DEFAULT '0' COMMENT '冻结标记: 1-冻结 0-非冻结',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT '0' COMMENT '修复状态',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  PRIMARY KEY (`id`),
  KEY `idx_lot_inv_sku` (`sku_id`,`ware_id`,`purchase_id`,`sku_lot`,`inventory_type`),
  KEY `index_processor_id` (`processor_id`),
  KEY `idx_lot_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=9837742 DEFAULT CHARSET=utf8 COMMENT='库存批次的表;库房报损quantity加，报益是quantity加，出库sale_alloc_qty 加 ，退货（库房收';

/*Table structure for table `stock_lot_operate_receipt` */

CREATE TABLE `stock_lot_operate_receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '库房编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `op_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存类型1:正品 2:残品',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '商品数量',
  `alloc_qty` decimal(11,4) DEFAULT '0.0000' COMMENT 'sku_num被分配数量',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税采购价',
  `from_ware_id` int(11) DEFAULT NULL COMMENT '来源仓库id',
  `unique_code` bigint(20) DEFAULT NULL COMMENT '唯一事务处理，防重用的',
  `to_ware_id` int(11) DEFAULT NULL COMMENT '目的仓库id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `src_receipt_id` varchar(64) DEFAULT NULL COMMENT '来源单据号',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '操作员姓名',
  `op_cause` varchar(128) DEFAULT NULL COMMENT '操作原因',
  `out_work_wip_num` int(11) NOT NULL DEFAULT '0' COMMENT '委外加工实际使用数',
  `purchase_code` varchar(32) NOT NULL DEFAULT '' COMMENT '委外加工单',
  `purchase_company` int(11) NOT NULL DEFAULT '0' COMMENT '委外加工商',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code_UNIQUE` (`unique_code`),
  KEY `idx_src_rece` (`src_receipt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2883420 DEFAULT CHARSET=utf8 COMMENT='库存采购批次变化流水表';

/*Table structure for table `stock_month_report` */

CREATE TABLE `stock_month_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) NOT NULL COMMENT '仓库名称',
  `report_date` varchar(16) NOT NULL COMMENT '时间',
  `start_price` decimal(14,4) DEFAULT '0.0000' COMMENT '期初库存',
  `purchase_price` decimal(14,4) DEFAULT '0.0000' COMMENT '累计进货',
  `sell_price` decimal(14,4) DEFAULT '0.0000' COMMENT '累计销售',
  `loss_price` decimal(14,4) DEFAULT '0.0000' COMMENT '盘亏',
  `profit_price` decimal(14,4) DEFAULT '0.0000' COMMENT '盘盈',
  `use_price` decimal(14,4) DEFAULT '0.0000' COMMENT '领用',
  `stock_price` decimal(14,4) DEFAULT '0.0000' COMMENT '系统库存',
  `occupy_price` decimal(14,4) DEFAULT '0.0000' COMMENT '原料占用',
  `process_price` decimal(14,4) DEFAULT '0.0000' COMMENT '成品加工',
  `return_price` decimal(14,4) DEFAULT '0.0000' COMMENT '累计进货',
  `allot_in` decimal(14,4) DEFAULT '0.0000' COMMENT '调拨入',
  `allot_out` decimal(14,4) DEFAULT '0.0000' COMMENT '调拨出',
  `purchase_return` decimal(14,4) DEFAULT '0.0000' COMMENT '采退',
  `delegated_purchase` decimal(14,4) DEFAULT '0.0000' COMMENT '委外采购',
  `delegated_process_occupy` decimal(14,4) DEFAULT '0.0000' COMMENT '委外加工占用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='月报表结果导出表';

/*Table structure for table `stock_month_report_fixed` */

CREATE TABLE `stock_month_report_fixed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) NOT NULL COMMENT '仓库名称',
  `report_month` varchar(128) NOT NULL COMMENT '报表时间',
  `start_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '期初库存',
  `purchase_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计进货',
  `sell_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计销售',
  `loss_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘亏',
  `discard_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '报废',
  `profit_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘盈',
  `use_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '领用',
  `stock_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '系统库存',
  `occupy_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '原料占用',
  `process_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '成品加工',
  `return_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '销退',
  `allot_in` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨入',
  `allot_out` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨出',
  `purchase_return` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '采退',
  `delegated_purchase` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外采购',
  `delegated_process_occupy` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外加工占用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8 COMMENT='月报表结果导出表New';

/*Table structure for table `stock_month_report_fixed_backup` */

CREATE TABLE `stock_month_report_fixed_backup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) NOT NULL COMMENT '仓库名称',
  `report_date` varchar(128) NOT NULL COMMENT '时间',
  `start_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '期初库存',
  `purchase_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计进货',
  `sell_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '累计销售',
  `loss_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘亏',
  `discard_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '报废',
  `profit_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '盘盈',
  `use_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '领用',
  `stock_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '系统库存',
  `occupy_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '原料占用',
  `process_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '成品加工',
  `return_price` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '销退',
  `allot_in` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨入',
  `allot_out` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '调拨出',
  `purchase_return` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '采退',
  `delegated_purchase` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外采购',
  `delegated_process_occupy` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '委外加工占用',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='月报表结果导出表New';

/*Table structure for table `stock_occupy_detail` */

CREATE TABLE `stock_occupy_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `sale_type` int(11) DEFAULT NULL,
  `op_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `sku_type` int(11) DEFAULT NULL COMMENT '1是普通品, 2是虚拟组套, 3是虚拟组套子商品，0是赠品',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_stock_order_alloc_skutype` (`order_id`,`sku_id`,`ware_id`,`sale_type`,`sku_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17865610 DEFAULT CHARSET=utf8 COMMENT='订单库存占用流水表';

/*Table structure for table `stock_order_short` */

CREATE TABLE `stock_order_short` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT 'sku批次',
  `inventory_type` int(11) DEFAULT NULL COMMENT '1正品, 2 残品 ',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `order_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '订单数量',
  `current_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '当前库存',
  `short_qty` decimal(11,4) DEFAULT '0.0000' COMMENT '报缺数量',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1762 DEFAULT CHARSET=utf8 COMMENT='库存订单缺货流水表';

/*Table structure for table `stock_order_sku_purchase` */

CREATE TABLE `stock_order_sku_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku编号',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税采购价',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `status` smallint(6) DEFAULT '0' COMMENT '抓取状态',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_purchase_id_sku` (`purchase_id`,`sku_id`),
  KEY `idx_purchaseId` (`purchase_id`),
  KEY `idx_createdate` (`create_date`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=221384389 DEFAULT CHARSET=utf8 COMMENT='订单采购单关联表';

/*Table structure for table `stock_order_sku_purchase_detail` */

CREATE TABLE `stock_order_sku_purchase_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_order_sku_purchase_id` bigint(20) DEFAULT NULL COMMENT 'stock_order_sku_purchase表id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `wip_sku_id` bigint(20) DEFAULT NULL COMMENT '产成品sku编号',
  `src_sku_id` bigint(20) DEFAULT NULL COMMENT '子商品sku编号',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `purchase_save_date` timestamp NULL DEFAULT NULL COMMENT '采购单创建时间',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '出库数量',
  `return_num` decimal(11,4) DEFAULT '0.0000' COMMENT '回退数量',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20085598 DEFAULT CHARSET=utf8 COMMENT='订单子商品采购单记录表';

/*Table structure for table `stock_presale_release` */

CREATE TABLE `stock_presale_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `sku_id` bigint(20) NOT NULL,
  `ware_id` int(11) NOT NULL,
  `book_date` date NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单提交时间',
  `sale_type` int(11) NOT NULL COMMENT '销售类型',
  `process_status` int(11) NOT NULL COMMENT '0:未处理;1:已处理',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '商品数量',
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_presale_rel` (`order_id`,`sku_id`,`ware_id`,`book_date`,`sale_type`)
) ENGINE=InnoDB AUTO_INCREMENT=247971 DEFAULT CHARSET=utf8 COMMENT='预售极致新鲜释放可卖数表';

/*Table structure for table `stock_price_deal` */

CREATE TABLE `stock_price_deal` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lot_id` bigint(20) NOT NULL COMMENT '批次id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_trans_id` bigint(20) NOT NULL COMMENT '库房操作单号，作为唯一标识',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `status` tinyint(1) DEFAULT '0' COMMENT '处理状态 0-未处理，1-已处理',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `retry_num` int(11) DEFAULT '0' COMMENT '重试次数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '系统日期',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sku_lot_id` (`lot_id`),
  KEY `idx_sku_ware` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1576 DEFAULT CHARSET=utf8 COMMENT='批次加权成本处理表';

/*Table structure for table `stock_receipt_occupy` */

CREATE TABLE `stock_receipt_occupy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_id` varchar(32) DEFAULT NULL COMMENT '单据id',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '商品数量',
  `op_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `inventory_type` int(11) DEFAULT NULL COMMENT '库存类型1:正品 2:残品',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_stock_receipt_occupy` (`receipt_id`,`ware_id`,`sku_id`,`op_type`,`inventory_type`)
) ENGINE=InnoDB AUTO_INCREMENT=328468 DEFAULT CHARSET=utf8 COMMENT='单据库存占用表(领用/借用等)';

/*Table structure for table `stock_release_receipt` */

CREATE TABLE `stock_release_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_id` varchar(32) DEFAULT NULL,
  `op_type` int(11) NOT NULL COMMENT '1301:订单未分配erp库存释放;1302:订单分配erp库存,未出库下架',
  `process_status` int(11) DEFAULT NULL COMMENT '0:未处理;1:处理',
  `receipt_content` text COMMENT '单据内容',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_release_receipt` (`receipt_id`,`op_type`),
  KEY `idx_sta_create_date` (`process_status`,`create_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3983266 DEFAULT CHARSET=utf8 COMMENT='库存释放流水表';

/*Table structure for table `stock_rule` */

CREATE TABLE `stock_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_type` int(11) DEFAULT NULL COMMENT '单据类型',
  `receipt_type_name` varchar(32) DEFAULT NULL COMMENT '单据类型名称',
  `op_type` int(11) DEFAULT NULL COMMENT '库房操作类型',
  `op_type_name` varchar(32) DEFAULT NULL COMMENT '库房操作类型名',
  `column1` varchar(32) DEFAULT NULL COMMENT '列1,数据字段名',
  `column1_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column1_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `column2` varchar(32) DEFAULT NULL COMMENT '列2,数据字段名',
  `column2_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column2_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `column3` varchar(32) DEFAULT NULL COMMENT '列3,数据字段名',
  `column3_op` int(11) DEFAULT NULL COMMENT '1:加 2:减',
  `column3_type` smallint(6) DEFAULT '1' COMMENT '取值类型 1:数量 2:原始单据值 3:剩余数量',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='网站库存增减规则信息';

/*Table structure for table `stock_sale_earlywarning_log` */

CREATE TABLE `stock_sale_earlywarning_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '销售日期当天销售数量',
  `lv1_class` bigint(20) NOT NULL COMMENT '商品一级分类',
  `lv2_class` bigint(20) NOT NULL COMMENT '商品二级分类',
  `lv3_class` bigint(20) NOT NULL COMMENT '商品三级分类',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建日期Yyyymmdd hhmmss',
  `sale_date` timestamp NULL DEFAULT NULL COMMENT '销售日期yyyymmdd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动销表';

/*Table structure for table `stock_sale_earlywarning_relation` */

CREATE TABLE `stock_sale_earlywarning_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` varchar(11) DEFAULT NULL COMMENT '仓库ID',
  `warning_rules` varchar(20) DEFAULT NULL COMMENT '预警规则 0：周转天数 1：可卖数量',
  `earlywarning_threshold` int(11) DEFAULT NULL COMMENT '配置预警阈值',
  `sale_average_num` int(11) DEFAULT NULL COMMENT '动销天数',
  `comment` varchar(128) DEFAULT NULL COMMENT '备注',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建时间Yyyymmdd hhmmss',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '记录更新时间Yyyymmdd hhmmss',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='商品分类与预警设置维护表';

/*Table structure for table `stock_sale_earlywarning_relation_bak` */

CREATE TABLE `stock_sale_earlywarning_relation_bak` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `lv1_class` bigint(20) NOT NULL COMMENT '商品一级分类',
  `lv2_class` bigint(20) NOT NULL COMMENT '商品二级分类',
  `lv3_class` bigint(20) NOT NULL COMMENT '商品三级分类',
  `earlywarning_threshold` int(11) DEFAULT NULL COMMENT '配置预警阈值',
  `sale_average_num` int(11) DEFAULT NULL COMMENT '配置动销均值',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建时间Yyyymmdd hhmmss',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '记录更新时间Yyyymmdd hhmmss',
  `comment` varchar(128) DEFAULT NULL COMMENT '备注',
  `email` varchar(512) DEFAULT NULL COMMENT '接收邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stock_sale_earlywarning_relation_copy` */

CREATE TABLE `stock_sale_earlywarning_relation_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` varchar(11) DEFAULT NULL COMMENT '仓库ID',
  `warning_rules` varchar(20) DEFAULT NULL COMMENT '预警规则 0：周转天数 1：可卖数量',
  `earlywarning_threshold` int(11) DEFAULT NULL COMMENT '配置预警阈值',
  `sale_average_num` int(11) DEFAULT NULL COMMENT '动销天数',
  `comment` varchar(128) DEFAULT NULL COMMENT '备注',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建时间Yyyymmdd hhmmss',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '记录更新时间Yyyymmdd hhmmss',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='商品分类与预警设置维护表';

/*Table structure for table `stock_sale_earlywarning_relation_sku` */

CREATE TABLE `stock_sale_earlywarning_relation_sku` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `relation_id` bigint(20) NOT NULL,
  `sku_id` int(20) DEFAULT NULL,
  `sku_name` varchar(120) DEFAULT NULL,
  `lv1_class` bigint(25) NOT NULL COMMENT '商品一级分类',
  `lv2_class` int(25) DEFAULT NULL COMMENT '商品二级分类',
  `lv3_class` int(25) DEFAULT NULL COMMENT '商品三级分类',
  `email` varchar(512) DEFAULT NULL COMMENT '接收邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='商品分类与预警设置(商品)维护表';

/*Table structure for table `stock_sale_earlywarning_relation_sku_copy` */

CREATE TABLE `stock_sale_earlywarning_relation_sku_copy` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `relation_id` bigint(20) NOT NULL,
  `sku_id` int(20) DEFAULT NULL,
  `sku_name` varchar(120) DEFAULT NULL,
  `lv1_class` bigint(25) NOT NULL COMMENT '商品一级分类',
  `lv2_class` int(25) DEFAULT NULL COMMENT '商品二级分类',
  `lv3_class` int(25) DEFAULT NULL COMMENT '商品三级分类',
  `email` varchar(512) DEFAULT NULL COMMENT '接收邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='商品分类与预警设置(商品)维护表';

/*Table structure for table `stock_sale_earlywarning_report` */

CREATE TABLE `stock_sale_earlywarning_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `sale_num` decimal(11,4) DEFAULT '0.0000' COMMENT '动销期内销售总量',
  `lv1_class` varchar(128) DEFAULT NULL COMMENT '商品一级分类',
  `lv2_class` varchar(128) DEFAULT NULL COMMENT '商品二级分类',
  `lv3_class` varchar(128) DEFAULT NULL COMMENT '商品三级分类',
  `earlywarning_threshold` int(11) DEFAULT NULL COMMENT '预警阈值',
  `sale_average_num` decimal(11,4) DEFAULT '0.0000' COMMENT '动销均值',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '当前可卖数量',
  `earlywarning_num` decimal(11,4) DEFAULT '0.0000' COMMENT '预警可卖数量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建Yyyymmdd hhmmss',
  `email` varchar(512) DEFAULT NULL COMMENT '接收邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297048 DEFAULT CHARSET=utf8 COMMENT='推送业务用预警报表';

/*Table structure for table `stock_sale_order_return` */

CREATE TABLE `stock_sale_order_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `inventory_type` int(11) DEFAULT NULL COMMENT '库存类型',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税采购价',
  `return_num` decimal(11,4) DEFAULT '0.0000' COMMENT '退货数量',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60558 DEFAULT CHARSET=utf8 COMMENT='订单取消记录表';

/*Table structure for table `stock_shelf_life_adjustment` */

CREATE TABLE `stock_shelf_life_adjustment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT '商品编号',
  `ware_id` int(11) NOT NULL COMMENT '库房编号',
  `inventory_type` smallint(6) NOT NULL COMMENT '库存类型',
  `quantity` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `product_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `new_product_date` date DEFAULT NULL COMMENT '新生产日期',
  `new_expire_date` date DEFAULT NULL COMMENT '新国期时间',
  `new_shelf_life_days` int(11) DEFAULT NULL COMMENT '新的保质期天数',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态 0:未处理 1:已处理',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `process_result` varchar(256) DEFAULT NULL COMMENT '处理结果',
  `operator` varchar(128) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1200009 DEFAULT CHARSET=utf8 COMMENT='保质期调整';

/*Table structure for table `stock_upload_voucher_que` */

CREATE TABLE `stock_upload_voucher_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '单据id',
  `order_no` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '单据号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `tr_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '调拨仓库id。出库业务则是到货仓库；入库业务则是发出仓库',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '正残属性 1正 2残',
  `op_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '操作日期。调拨出:出库时间;调拨入:收货时间',
  `op_type` int(11) NOT NULL DEFAULT '0' COMMENT '业务操作流水',
  `op_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '唯一流水号，就是ware_trans_id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuid',
  `purchase_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采购单id',
  `op_num` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '业务操作的sku数量',
  `que_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '处理状态 0-未处理，1-已处理',
  `create_date` timestamp NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `retry_num` int(11) DEFAULT '0' COMMENT '重试次数',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_op_id` (`op_id`,`purchase_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1318 DEFAULT CHARSET=utf8 COMMENT='上传凭证队列';

/*Table structure for table `stock_warehouse_flow` */

CREATE TABLE `stock_warehouse_flow` (
  `op_flow_id` bigint(20) NOT NULL,
  `op_id` bigint(20) DEFAULT NULL COMMENT '库房事务id',
  `op_type` smallint(6) DEFAULT NULL COMMENT '库房返回单据类型',
  `process_step` int(11) DEFAULT '0' COMMENT '推送标记 0:初始值 1 第一位表示推送财务，其他待定义',
  `is_finish` smallint(6) DEFAULT '0' COMMENT '是否推送结束',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否被锁',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `retry_num` int(11) DEFAULT '0' COMMENT '重试次数',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '版本号',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`op_flow_id`),
  KEY `op_tidx` (`op_type`),
  KEY `op_iidx` (`op_id`),
  KEY `is_finish_create_idx` (`is_finish`) USING BTREE,
  KEY `create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库房操作单据推送流程表';

/*Table structure for table `stock_warehouse_flow_rule` */

CREATE TABLE `stock_warehouse_flow_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_type` int(11) NOT NULL COMMENT '库房返回单据操作类型',
  `system_no` int(11) DEFAULT NULL COMMENT '0:库存 1:表示第一位 财务 2:第二位采销 3:待定  stock_warehouse_flow中的process_step',
  `send_order` int(11) DEFAULT NULL COMMENT '推送顺序',
  `op_process` varchar(32) DEFAULT NULL COMMENT '处理process',
  `send_system` varchar(32) DEFAULT NULL COMMENT '需要推送的系统名',
  `send_address` varchar(64) DEFAULT NULL COMMENT '系统推送地址',
  `send_type` smallint(6) DEFAULT NULL COMMENT '1:系统 2:表',
  `rule_desc` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8 COMMENT='业务推送规则(定义推送那些系统)';

/*Table structure for table `stock_warehouse_receipt` */

CREATE TABLE `stock_warehouse_receipt` (
  `op_receipt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_trans_id` bigint(20) NOT NULL COMMENT '库房操作单号，作为唯一标识',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房',
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存属性 1:正品，2:残品',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `origin_receipt` bigint(20) DEFAULT NULL COMMENT '来源单据(订单，采购单)',
  `origin_code` varchar(32) DEFAULT NULL COMMENT '来源单据编码(订单，采购单)',
  `origin_receipt_type` smallint(6) DEFAULT NULL COMMENT '来源单据类型: 10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `ower_id` int(11) DEFAULT NULL COMMENT '货主',
  `quantity` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `origin_num` decimal(11,4) DEFAULT '0.0000' COMMENT '原始单据数',
  `left_num` decimal(11,4) DEFAULT '0.0000' COMMENT '剩余数',
  `src_system` varchar(32) DEFAULT NULL COMMENT '来源系统',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '库房等操作日期',
  `bill_id` bigint(20) DEFAULT NULL COMMENT '库房操作单据号',
  `bill_code` varchar(32) DEFAULT NULL COMMENT '库房操作单据编码',
  `receipt_type` int(11) DEFAULT NULL COMMENT '业务单据类型:10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `product_date` date DEFAULT NULL COMMENT '商品生产日期',
  `operator` int(11) DEFAULT NULL COMMENT '库房操作人',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `from_receipt` bigint(20) DEFAULT NULL COMMENT '源单据的来源单据',
  `from_receipt_code` varchar(32) DEFAULT NULL COMMENT '源单据的来源单据编号',
  `frozen_flag` int(11) DEFAULT '0' COMMENT '冻结标示 1- 冻结商品 0-普通商品',
  `operator_name` varchar(64) DEFAULT NULL COMMENT ' 操作员姓名 ',
  `op_cause` varchar(128) DEFAULT NULL COMMENT ' 操作原因 ',
  `from_ware_id` int(11) DEFAULT NULL COMMENT '来源仓库id',
  `to_ware_id` int(11) DEFAULT NULL COMMENT '目的仓库id',
  PRIMARY KEY (`op_receipt_id`),
  UNIQUE KEY `unique_idx_stock_receipt_ware` (`ware_trans_id`,`inventory_type`,`sku_id`,`op_type`,`ware_id`),
  KEY `sku_idx` (`sku_id`),
  KEY `op_tidx` (`op_type`),
  KEY `origin_ridx` (`origin_receipt`),
  KEY `sku_lidx` (`sku_lot`),
  KEY `idx_createdate` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=178512726 DEFAULT CHARSET=utf8 COMMENT='库房单据回传流水信息';

/*Table structure for table `stock_warehouse_receipt_bak` */

CREATE TABLE `stock_warehouse_receipt_bak` (
  `op_receipt_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_trans_id` bigint(20) NOT NULL COMMENT '库房操作单号，作为唯一标识',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房',
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存属性 1:正品，2:残品',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `origin_receipt` bigint(20) DEFAULT NULL COMMENT '来源单据(订单，采购单)',
  `origin_code` varchar(32) DEFAULT NULL COMMENT '来源单据编码(订单，采购单)',
  `origin_receipt_type` smallint(6) DEFAULT NULL COMMENT '来源单据类型: 10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `ower_id` int(11) DEFAULT NULL COMMENT '货主',
  `quantity` int(11) DEFAULT '0' COMMENT '数量',
  `origin_num` int(11) DEFAULT '0' COMMENT '原始单据数',
  `left_num` int(11) DEFAULT '0' COMMENT '剩余数',
  `src_system` varchar(32) DEFAULT NULL COMMENT '来源系统',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '库房等操作日期',
  `bill_id` bigint(20) DEFAULT NULL COMMENT '库房操作单据号',
  `bill_code` varchar(32) DEFAULT NULL COMMENT '库房操作单据编码',
  `receipt_type` int(11) DEFAULT NULL COMMENT '业务单据类型:10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `product_date` date DEFAULT NULL COMMENT '商品生产日期',
  `operator` int(11) DEFAULT NULL COMMENT '库房操作人',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `from_receipt` bigint(20) DEFAULT NULL COMMENT '源单据的来源单据',
  `from_receipt_code` varchar(32) DEFAULT NULL COMMENT '源单据的来源单据编号',
  `frozen_flag` int(11) DEFAULT '0' COMMENT '冻结标示 1- 冻结商品 0-普通商品',
  `operator_name` varchar(64) DEFAULT NULL COMMENT ' 操作员姓名 ',
  `op_cause` varchar(128) DEFAULT NULL COMMENT ' 操作原因 ',
  `from_ware_id` int(11) DEFAULT NULL COMMENT '来源仓库id',
  `to_ware_id` int(11) DEFAULT NULL COMMENT '目的仓库id',
  UNIQUE KEY `unique_idx_stock_receipt` (`ware_trans_id`,`inventory_type`,`sku_id`,`op_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stock_warehouse_receipt_copy` */

CREATE TABLE `stock_warehouse_receipt_copy` (
  `op_receipt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_trans_id` bigint(20) NOT NULL COMMENT '库房操作单号，作为唯一标识',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房',
  `inventory_type` smallint(6) DEFAULT NULL COMMENT '库存属性 1:正品，2:残品',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `op_type` int(11) DEFAULT NULL COMMENT '业务操作类型',
  `origin_receipt` bigint(20) DEFAULT NULL COMMENT '来源单据(订单，采购单)',
  `origin_code` varchar(32) DEFAULT NULL COMMENT '来源单据编码(订单，采购单)',
  `origin_receipt_type` smallint(6) DEFAULT NULL COMMENT '来源单据类型: 10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `ower_id` int(11) DEFAULT NULL COMMENT '货主',
  `quantity` int(11) DEFAULT '0' COMMENT '数量',
  `origin_num` int(11) DEFAULT '0' COMMENT '原始单据数',
  `left_num` int(11) DEFAULT '0' COMMENT '剩余数',
  `src_system` varchar(32) DEFAULT NULL COMMENT '来源系统',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '过期时间',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '库房等操作日期',
  `bill_id` bigint(20) DEFAULT NULL COMMENT '库房操作单据号',
  `bill_code` varchar(32) DEFAULT NULL COMMENT '库房操作单据编码',
  `receipt_type` int(11) DEFAULT NULL COMMENT '业务单据类型:10	po单据\n11	采购退货单\n12	销售订单SO\n13	销售订单取消\n14	销售退货(拒收)\n15	加工单\n16	损益\n17	销售订单报缺\n18	移库\n19	补发订单\n20	妥投',
  `product_date` date DEFAULT NULL COMMENT '商品生产日期',
  `operator` int(11) DEFAULT NULL COMMENT '库房操作人',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `from_receipt` bigint(20) DEFAULT NULL COMMENT '源单据的来源单据',
  `from_receipt_code` varchar(32) DEFAULT NULL COMMENT '源单据的来源单据编号',
  `frozen_flag` int(11) DEFAULT '0' COMMENT '冻结标示 1- 冻结商品 0-普通商品',
  `operator_name` varchar(64) DEFAULT NULL COMMENT ' 操作员姓名 ',
  `op_cause` varchar(128) DEFAULT NULL COMMENT ' 操作原因 ',
  PRIMARY KEY (`op_receipt_id`),
  UNIQUE KEY `unique_idx_stock_receipt` (`ware_trans_id`,`op_type`,`inventory_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1156010 DEFAULT CHARSET=utf8 COMMENT='库房单据回传流水信息';

/*Table structure for table `stock_wip_purchase` */

CREATE TABLE `stock_wip_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wip_id` bigint(20) DEFAULT NULL COMMENT '加工单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '原表商品名',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '产成品数量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `wip_sku_id` bigint(20) DEFAULT NULL COMMENT '产成品sku',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `upc` varchar(45) DEFAULT NULL COMMENT 'upc码',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商(为空则为产成品)',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '采购单创建时间',
  `src_sku_id` bigint(20) DEFAULT NULL COMMENT '原料sku',
  `off_shelf_num` decimal(11,4) DEFAULT '0.0000' COMMENT '下架数量',
  `real_src_num` decimal(11,4) DEFAULT '0.0000' COMMENT '原料实际消耗数量',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `price` decimal(16,4) DEFAULT NULL COMMENT '含税采购价',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税采购价',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码',
  `wip_type` varchar(8) DEFAULT NULL COMMENT '加工类型',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '出库数',
  `version` int(11) DEFAULT NULL COMMENT '版本号控制',
  `wip_out_num` decimal(11,4) DEFAULT '0.0000' COMMENT '产成品出库数',
  `wip_split_num` decimal(11,4) DEFAULT '0.0000' COMMENT '产成品拆分数',
  `src_split_num` decimal(11,4) DEFAULT '0.0000' COMMENT '子商品拆分数',
  PRIMARY KEY (`id`),
  KEY `wip_id_idx` (`wip_id`),
  KEY `wip_skuid_idx` (`wip_sku_id`),
  KEY `idx_sku_purchase` (`sku_id`,`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=884961 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_user` */

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `test_stock_inventory` */

CREATE TABLE `test_stock_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `order_book_num` int(11) DEFAULT '0' COMMENT '订单预占',
  `on_sale_num` int(11) DEFAULT '0' COMMENT '销售在途',
  `stock_num` decimal(11,4) DEFAULT '0.0000' COMMENT '库存e',
  `on_order_num` int(11) DEFAULT '0' COMMENT '采购在途',
  `trans_in_num` int(11) DEFAULT '0' COMMENT '调拨入',
  `trans_out_num` int(11) DEFAULT '0' COMMENT '调拨出',
  `pre_sale_num` int(11) DEFAULT '0' COMMENT '预售库存（废弃）',
  `groupon_num` int(11) DEFAULT '0' COMMENT '团购量',
  `snap_up_num` int(11) DEFAULT '0' COMMENT '抢购量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `frozen_num` int(11) NOT NULL DEFAULT '0' COMMENT '冻结数',
  PRIMARY KEY (`id`),
  KEY `idx_inventory_stock` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='可卖库存表TEST';

/*Table structure for table `testaa` */

CREATE TABLE `testaa` (
  `id` int(11) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `own_vehicle_use` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否需要自有车辆送货， 1是   0否',
  `consignee` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人',
  `receipt_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人联系电话',
  `receipt_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收货地址',
  `receiving_province` varchar(20) NOT NULL DEFAULT '' COMMENT '收货省',
  `receiving_city` varchar(50) NOT NULL DEFAULT '' COMMENT '收货市',
  `receiving_area` varchar(50) NOT NULL DEFAULT '' COMMENT '收货区'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

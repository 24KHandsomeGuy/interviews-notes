/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : trcoredb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:53:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ID generator';

-- ----------------------------
-- Table structure for inv_tran
-- ----------------------------
DROP TABLE IF EXISTS `inv_tran`;
CREATE TABLE `inv_tran` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `trans_id` bigint(20) NOT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '主事务所在仓库',
  `loc_id_2nd` int(11) DEFAULT NULL COMMENT '发货事务：收货仓库， 收货事务：发货仓库',
  `owner_id` int(11) DEFAULT NULL,
  `inv_type` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `trans_qty` decimal(10,4) DEFAULT '0.0000',
  `origin_num` int(11) DEFAULT '0' COMMENT '原始单据数',
  `left_num` int(11) DEFAULT '0' COMMENT '剩余数',
  `dest_system` int(11) DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_type` int(11) DEFAULT NULL,
  `src_bill_id` bigint(20) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `return_code` int(11) DEFAULT NULL,
  `return_reason` varchar(128) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `return_datetime` datetime DEFAULT NULL,
  `from_receipt` bigint(20) DEFAULT NULL,
  `from_receipt_code` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_tranIunique` (`trans_id`) USING BTREE,
  KEY `inv_tranI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `inv_tranI3` (`entry_datetime`) USING BTREE,
  KEY `inv_tranI4` (`src_bill_id`) USING BTREE,
  KEY `inv_tranI1` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92536036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for odometer
-- ----------------------------
DROP TABLE IF EXISTS `odometer`;
CREATE TABLE `odometer` (
  `odo_type` varchar(10) NOT NULL COMMENT '前缀',
  `length` int(11) NOT NULL COMMENT '编号数字部分长度',
  `current_no` int(11) NOT NULL COMMENT '编号当前数字部分',
  `date_flag` date DEFAULT NULL COMMENT '日期， 如果为空表示编号不按照日期排列',
  `comments` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '简介',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `pre_fix` varchar(8) NOT NULL DEFAULT '' COMMENT '前缀',
  PRIMARY KEY (`odo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编号生成器';

-- ----------------------------
-- Table structure for suggest
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `narrative` varchar(500) NOT NULL DEFAULT '' COMMENT '叙述',
  `priority` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` varchar(1) NOT NULL DEFAULT 'N' COMMENT '删除标识',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'email',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `source_path` varchar(200) NOT NULL DEFAULT '' COMMENT '建议源路径',
  `type` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '建议分类',
  PRIMARY KEY (`id`),
  KEY `suggest_i_phone` (`phone`) USING BTREE,
  KEY `suggest_i_entryId` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集表';

-- ----------------------------
-- Table structure for suggest_image
-- ----------------------------
DROP TABLE IF EXISTS `suggest_image`;
CREATE TABLE `suggest_image` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(100) DEFAULT NULL COMMENT '详细描述',
  PRIMARY KEY (`id`),
  KEY `suggest_image_i_sid` (`suggest_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集图片表';

-- ----------------------------
-- Table structure for suggest_log
-- ----------------------------
DROP TABLE IF EXISTS `suggest_log`;
CREATE TABLE `suggest_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '操作编码',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志生成时间',
  `execute_time` int(11) NOT NULL DEFAULT '0' COMMENT '执行时间',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '详细描述',
  `request_param` varchar(500) NOT NULL DEFAULT '' COMMENT '请求参数',
  PRIMARY KEY (`id`),
  KEY `suggest_log_I_entryId` (`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日录资料表';

-- ----------------------------
-- Table structure for suggest_message_board
-- ----------------------------
DROP TABLE IF EXISTS `suggest_message_board`;
CREATE TABLE `suggest_message_board` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `message` varchar(200) NOT NULL DEFAULT '' COMMENT '叙述',
  `type` char(1) NOT NULL DEFAULT '0' COMMENT '消息类型',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `suggest_mb_i_sid` (`suggest_id`) USING BTREE,
  KEY `suggest_mb_i_entryName` (`entry_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息建议留言表';

-- ----------------------------
-- Table structure for suggest_state
-- ----------------------------
DROP TABLE IF EXISTS `suggest_state`;
CREATE TABLE `suggest_state` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `suggest_state_i_sid` (`suggest_id`) USING BTREE,
  KEY `suggest_state_i_entryName` (`entry_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集状态表';

-- ----------------------------
-- Table structure for tr_auto_audit_process
-- ----------------------------
DROP TABLE IF EXISTS `tr_auto_audit_process`;
CREATE TABLE `tr_auto_audit_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调拨申请单ID',
  `status` smallint(4) NOT NULL DEFAULT '0' COMMENT '状态: 0新增, -1失败, 1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COMMENT='调拨申请自动审核表';

-- ----------------------------
-- Table structure for tr_in_detail
-- ----------------------------
DROP TABLE IF EXISTS `tr_in_detail`;
CREATE TABLE `tr_in_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `plan_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '计划调入数量--调出单计划调出数量---创建时直接生成',
  `order_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '应该调入数量， 实际出库数量---创建时直接生成',
  `rec_qty1` decimal(10,4) DEFAULT '0.0000' COMMENT '实际收货数量正品-实际收货时反写',
  `rec_qty2` decimal(10,4) DEFAULT '0.0000' COMMENT '实际收货数量残品-实际收货时反写',
  `discrep_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '差异数量-实际收货时反写(plan_qty-rec_qty1-rec_qty2)',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `loss_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '丢失货数量',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  PRIMARY KEY (`id`),
  KEY `tr_in_detailI1` (`order_id`),
  KEY `tr_in_detaill2` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2544288 DEFAULT CHARSET=utf8 COMMENT='调拨ru明细表';

-- ----------------------------
-- Table structure for tr_in_lot_inv
-- ----------------------------
DROP TABLE IF EXISTS `tr_in_lot_inv`;
CREATE TABLE `tr_in_lot_inv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨ru单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型1：正品， 2：产品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `rec_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传汇总反写',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `loss_flag` smallint(2) DEFAULT '0' COMMENT '丢失标识：0，没有丢失；1，丢失',
  PRIMARY KEY (`id`),
  KEY `tr_in_lot_invI1` (`order_id`),
  KEY `tr_in_lot_invl2` (`sku_id`,`lot`,`mfg_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2799648 DEFAULT CHARSET=utf8 COMMENT='调拨入收货库存批次明细表';

-- ----------------------------
-- Table structure for tr_in_order
-- ----------------------------
DROP TABLE IF EXISTS `tr_in_order`;
CREATE TABLE `tr_in_order` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_code` varchar(32) NOT NULL COMMENT '调拨入单据编号',
  `request_id` bigint(20) NOT NULL COMMENT '来源调拨申请单ID',
  `request_no` varchar(32) NOT NULL COMMENT '来源调拨申请单编号',
  `from_loc_id` int(11) NOT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态 0:待入库 1：已入库',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `temp_group_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `temp_group_name` varchar(32) DEFAULT NULL COMMENT '配送温区名称',
  `cross_dock` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否中转调拨，1是，0否',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `p_order_id` bigint(20) DEFAULT NULL COMMENT '关联采购单ID',
  `sku_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '订单数量',
  `rec_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '正品收货数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '订单品种数量',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注--创建时带入',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间--创建时带入',
  `rec_datetime` datetime DEFAULT NULL COMMENT '实际收货时间--实际收货时反写',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间--创建时带入',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人--创建时带入',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间--创建时带入',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称--创建时直接生成',
  `ship_datetime` datetime DEFAULT NULL COMMENT '实际出库时间--创建时直接生成',
  `rec_qty2` decimal(10,4) DEFAULT '0.0000' COMMENT '残品收货数量',
  `loss_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '丢失货数量',
  `use_type` smallint(6) DEFAULT '48' COMMENT '调拨类型 48:正常调拨 49:委外调拨',
  UNIQUE KEY `tr_out_orderI1` (`order_id`) USING BTREE,
  KEY `tr_in_orderI2` (`order_code`),
  KEY `tr_in_orderI3` (`request_id`),
  KEY `tr_in_orderI4` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨入单据';

-- ----------------------------
-- Table structure for tr_in_status
-- ----------------------------
DROP TABLE IF EXISTS `tr_in_status`;
CREATE TABLE `tr_in_status` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `status` smallint(11) DEFAULT NULL COMMENT '状态 0:待入库 1：已入库',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  KEY `tr_out_statusI2` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入状态表';

-- ----------------------------
-- Table structure for tr_order_request
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_request`;
CREATE TABLE `tr_order_request` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请单ID',
  `request_no` varchar(32) DEFAULT NULL COMMENT '调拨出单据编号',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:新增 1:送审 2:审核通过 3:驳回 4:作废',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '申请数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `apply_name` varchar(32) DEFAULT NULL COMMENT '送审人名称',
  `apply_datetime` datetime DEFAULT NULL COMMENT '送审时间',
  `refuse_name` varchar(255) DEFAULT NULL COMMENT '驳回人',
  `refuse_datetime` datetime DEFAULT NULL COMMENT '驳回时间',
  `total_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '总成本',
  `src_request_id` varchar(32) DEFAULT '' COMMENT '来源单据ID, 判重使用-拼接来源系统和单据号',
  `use_type` smallint(5) unsigned DEFAULT '48' COMMENT '48:正常调拨 49:委外调拨 1015:悦店商品调拨',
  `total_out_qty` decimal(10,2) DEFAULT '0.00' COMMENT '实际出库数量',
  PRIMARY KEY (`request_id`),
  KEY `tr_order_requestI2` (`request_no`),
  KEY `tr_order_requesti3` (`entry_datetime`),
  KEY `tr_order_requesti4` (`approve_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=70282 DEFAULT CHARSET=utf8 COMMENT='调拨申请单';

-- ----------------------------
-- Table structure for tr_order_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_request_detail`;
CREATE TABLE `tr_order_request_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL COMMENT '申请单ID',
  `request_line_no` int(11) DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) DEFAULT '0' COMMENT '商品编号',
  `plan_qty` decimal(10,2) DEFAULT '0.00' COMMENT '计划调拨数量',
  `total_out_qty` decimal(10,2) DEFAULT '0.00' COMMENT '原始调拨出的数量',
  `available_qty` decimal(14,4) DEFAULT '0.0000' COMMENT '创建时：调出仓可卖数，只为support使用',
  `intran_in_qty` decimal(10,2) DEFAULT '0.00' COMMENT '创建时：采购在途数量，只为support使用',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `erp_qty` decimal(10,2) DEFAULT '0.00' COMMENT '创建时：残品库存数量，只为support使用',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `temp_area_id` int(11) NOT NULL COMMENT '温区id',
  `sku_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品成本',
  `first_class_name` varchar(24) NOT NULL DEFAULT '' COMMENT '商品一级分类',
  `store_temperature` varchar(24) NOT NULL DEFAULT '' COMMENT '商品存储温区',
  `shelf_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `purchase_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品采购价格',
  `sales_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品销售价格',
  `yesteryday_sales` int(11) NOT NULL DEFAULT '0' COMMENT '商品昨天销售',
  `seven_day_avg_sales` int(11) NOT NULL DEFAULT '0' COMMENT '商品过去7天均销',
  `dest_ware_available_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '门店库存:调入仓的可卖数',
  PRIMARY KEY (`id`),
  KEY `tr_order_request_detaili3` (`entry_datetime`),
  KEY `tr_order_request_detaili4` (`sku_id`),
  KEY `tr_order_request_detailI1` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5388470 DEFAULT CHARSET=utf8 COMMENT='调拨申请单表体';

-- ----------------------------
-- Table structure for tr_order_request_que
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_request_que`;
CREATE TABLE `tr_order_request_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `request_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请单ID',
  `task_type` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `que_status` int(11) NOT NULL DEFAULT '0' COMMENT '0失败1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_request_id` (`request_id`,`task_type`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43440 DEFAULT CHARSET=utf8 COMMENT='调拨申请单队列记录异步处理的任务';

-- ----------------------------
-- Table structure for tr_order_request_status
-- ----------------------------
DROP TABLE IF EXISTS `tr_order_request_status`;
CREATE TABLE `tr_order_request_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL COMMENT '申请单ID',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:新增 1:送审 2:审核通过 3:驳回 4:作废',
  `status_name` varchar(32) DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379664 DEFAULT CHARSET=utf8 COMMENT='调拨申请单状态流水';

-- ----------------------------
-- Table structure for tr_out_detail
-- ----------------------------
DROP TABLE IF EXISTS `tr_out_detail`;
CREATE TABLE `tr_out_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品数量（通知数量）',
  `available_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '创建时：调出仓可卖数，只为support/报表展示使用',
  `intran_in_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '创建时：采购在途数量，只为support/报表展示使用',
  `ship_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传反写',
  `discrep_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '差异数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `sku_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品成本',
  PRIMARY KEY (`id`),
  KEY `tr_out_detailI1` (`order_id`),
  KEY `tr_out_detaill2` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2559592 DEFAULT CHARSET=utf8 COMMENT='调拨出明细表';

-- ----------------------------
-- Table structure for tr_out_issue_que
-- ----------------------------
DROP TABLE IF EXISTS `tr_out_issue_que`;
CREATE TABLE `tr_out_issue_que` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID， 下发仓库ID',
  `order_id` bigint(20) NOT NULL COMMENT '调拨出orderID',
  `status` int(11) DEFAULT '0' COMMENT '0 已下发, 1 未下发',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `issue_datetime` datetime DEFAULT NULL COMMENT '下发日期',
  UNIQUE KEY `tr_out_issue_queI1` (`order_id`) USING BTREE,
  KEY `tr_out_issue_queI2` (`expect_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨系统-调拨订单下发WMS队列';

-- ----------------------------
-- Table structure for tr_out_lot_inv
-- ----------------------------
DROP TABLE IF EXISTS `tr_out_lot_inv`;
CREATE TABLE `tr_out_lot_inv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型1：正品， 2：产品',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `ship_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传汇总反写',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  PRIMARY KEY (`id`),
  KEY `tr_out_lot_invI1` (`order_id`),
  KEY `tr_out_lot_invl2` (`sku_id`,`lot`,`mfg_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2612448 DEFAULT CHARSET=utf8 COMMENT='调拨出出库库存批次明细表';

-- ----------------------------
-- Table structure for tr_out_order
-- ----------------------------
DROP TABLE IF EXISTS `tr_out_order`;
CREATE TABLE `tr_out_order` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_code` varchar(32) NOT NULL COMMENT '调拨出单据编号',
  `request_id` bigint(20) NOT NULL COMMENT '来源调拨申请单ID',
  `request_no` varchar(32) NOT NULL COMMENT '来源调拨申请单编号',
  `from_loc_id` int(11) NOT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:未下发 1：待出库2：已出库 8：已取消',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `temp_group_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `temp_group_name` varchar(32) DEFAULT NULL COMMENT '配送温区名称',
  `cross_dock` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否中转调拨，1是，0否',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `p_order_id` bigint(20) DEFAULT NULL COMMENT '关联采购单ID',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '申请数量',
  `ship_qty` decimal(10,2) DEFAULT '0.00' COMMENT '出库数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注--创建时带入',
  `in_wms_date` datetime DEFAULT NULL COMMENT '进入WMS时间-- 下发时反写',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间--创建时带入',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人--创建时带入',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间--创建时带入',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称--回传状态反写',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库时间--回传状态反写',
  `track_no` varchar(50) DEFAULT NULL COMMENT '物流运单号',
  `use_type` smallint(6) DEFAULT '48' COMMENT '调拨类型 48:正常调拨 49:委外调拨',
  UNIQUE KEY `tr_out_orderI1` (`order_id`) USING BTREE,
  KEY `tr_out_orderI2` (`order_code`),
  KEY `tr_out_orderI3` (`request_id`),
  KEY `tr_out_orderI4` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨出单据';

-- ----------------------------
-- Table structure for tr_out_status
-- ----------------------------
DROP TABLE IF EXISTS `tr_out_status`;
CREATE TABLE `tr_out_status` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `status` int(11) DEFAULT NULL COMMENT '调拨出单据状态：1',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  KEY `tr_out_statusI2` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

-- ----------------------------
-- Table structure for tr_relations
-- ----------------------------
DROP TABLE IF EXISTS `tr_relations`;
CREATE TABLE `tr_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_order_id` bigint(20) NOT NULL COMMENT '调拨出id',
  `to_order_id` bigint(20) NOT NULL COMMENT '调拨入id',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '制单人',
  PRIMARY KEY (`id`),
  KEY `tr_relationsI1` (`from_order_id`) USING BTREE,
  KEY `tr_relationsI2` (`to_order_id`) USING BTREE,
  KEY `tr_relationsI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=799516 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

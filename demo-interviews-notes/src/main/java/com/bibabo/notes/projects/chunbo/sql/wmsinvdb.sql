/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmsinvdb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:54:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for erp_trans_type
-- ----------------------------
DROP TABLE IF EXISTS `erp_trans_type`;
CREATE TABLE `erp_trans_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trans_type` smallint(6) NOT NULL,
  `on_hand_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:=; -1:-; 0: 没影响',
  `alloc_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '占用',
  `lock_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '锁定',
  `on_order_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订货量',
  `intran_in_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调拨入',
  `intran_out_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调拨出',
  `wip_factor` tinyint(4) NOT NULL DEFAULT '0' COMMENT '在加工',
  `trans_disc` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY ` idx_uniq_trans_type` (`trans_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='事务类型描述表';

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `id_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for purchase_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_box_detail`;
CREATE TABLE `purchase_box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '包裹ID',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'SKU',
  `sku_qty` int(11) NOT NULL DEFAULT '-1' COMMENT '包裹商品数量',
  `qc_qty` int(20) NOT NULL DEFAULT '-1' COMMENT '收货质检数量',
  `mfg_date` date NOT NULL DEFAULT '1970-01-02' COMMENT '生产日期',
  `shelf_life_days` int(20) NOT NULL DEFAULT '-1' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-02' COMMENT '保质期截止日期',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '生产批次',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_box_detailI1` (`box_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2264598 DEFAULT CHARSET=utf8 COMMENT='采购单包裹明细表';

-- ----------------------------
-- Table structure for purchase_box_header
-- ----------------------------
DROP TABLE IF EXISTS `purchase_box_header`;
CREATE TABLE `purchase_box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '采购单ID',
  `src_order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '交易单ID',
  `box_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '包裹ID:使用wms包裹id',
  `box_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-new, 1-working, 2-finished',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `from_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '调出仓库id',
  `worker` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人--一个包裹只能被一个人收货',
  `begin_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务领用时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货完成时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_box_id` (`box_id`),
  KEY `idx_box_no` (`box_no`)
) ENGINE=InnoDB AUTO_INCREMENT=737840 DEFAULT CHARSET=utf8 COMMENT='采购单包裹头表';

-- ----------------------------
-- Table structure for purchase_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_cancel`;
CREATE TABLE `purchase_order_cancel` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采购订单ID',
  `status` smallint(11) NOT NULL DEFAULT '0' COMMENT '0:新增,1,确定',
  `cancel_source` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '取消来源',
  `cancel_cause` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '取消原因',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32102 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购单取消表';

-- ----------------------------
-- Table structure for purchase_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_detail`;
CREATE TABLE `purchase_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '订单id--WMS订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `unit_name` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单位名称',
  `order_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单商品数量（通知数量）-或重量',
  `rec_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货数量-或重量',
  `discrep_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异数量-或重量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1称重, 0不称重',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_line_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4385068 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购单明细';

-- ----------------------------
-- Table structure for purchase_order_header
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_header`;
CREATE TABLE `purchase_order_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'OMS orderId',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `acct_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商 -采购单有',
  `acct_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '供应商名称 -采购单有',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '库房名称',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递编码',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT 'sku品种数',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT 'sku数量',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '称重商品总重',
  `inform_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '通知日期 -采购单',
  `qc_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '质检日期',
  `qc_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '质检人',
  `comments` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `close_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '关闭时间',
  `close_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '关闭人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS日期',
  `emp_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '采购员-采购单有',
  `is_pick_up` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否自提，0：不自提，1：自提-采购单',
  `arrival_temperature` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '到货温度 -采购单',
  `arrival_temperature2` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '到货温度2-采购单',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新日期',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货完成时间',
  `finish_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货完成人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=515434 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购单表头';

-- ----------------------------
-- Table structure for purchase_order_receive_upload
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_receive_upload`;
CREATE TABLE `purchase_order_receive_upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'WMS订单ID',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单当前状态： 0：新增:9收货中10（收货完成，不传）关闭',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku',
  `sku_lot` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品批次',
  `rec_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货数量-或重量',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '商品状态/正品1、残品2',
  `rec_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货日期',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `return_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '服务响应信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT ' 创建时间',
  `create_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3686376 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购收货信息上传';

-- ----------------------------
-- Table structure for purchase_order_status
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order_status`;
CREATE TABLE `purchase_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT 'OMS订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'OMS订单状态',
  `status_desc` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `return_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '响应信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `need_sync` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1需要, 0不需要',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`status`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1516514 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收货订单状态表';

-- ----------------------------
-- Table structure for purchase_recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_recv_detail`;
CREATE TABLE `purchase_recv_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '为表复制使用, 无意义',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `order_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品数量-或重量',
  `recv_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '质检数量-或重量',
  `lot` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生产批次号',
  `lot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑批次id',
  `unit_name` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单位名称',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '失效日期',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '正残属性:1正2残',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新日期',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `box_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '包裹ID',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`,`lot`,`expire_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3687580 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购收货明细';

-- ----------------------------
-- Table structure for purchase_return_cancel
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_cancel`;
CREATE TABLE `purchase_return_cancel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '采退单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT ' 创建时间',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`ware_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125422 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退单取消表';

-- ----------------------------
-- Table structure for purchase_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_detail`;
CREATE TABLE `purchase_return_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(11) NOT NULL COMMENT '订单id--WMS订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '库存类型',
  `order_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单商品数量（通知数量）-或重量',
  `qc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '质检数量-或重量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1称重, 0不称重',
  `discrep_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异数量-或重量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS时间',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `src_order_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '销售单号',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=175476 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退单明细';

-- ----------------------------
-- Table structure for purchase_return_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_order`;
CREATE TABLE `purchase_return_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采退单id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `order_status` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '状态: 和OMSteam确认',
  `acct_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商编码',
  `acct_name` varchar(48) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '供应商名称',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '通知商品品种数',
  `sku_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '通知商品数量-或重量',
  `ship_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '发出品种数',
  `ship_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '发出数量-或重量',
  `qc_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '质检日期',
  `qc_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '质检人',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '发货日期',
  `ship_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发货人名称',
  `close_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '采退单关闭日期',
  `close_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '采退单关闭人',
  `cancel_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '采退单取消时间',
  `cancel_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '采退单取消人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '采退单下发到wms时间',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '采退单制单日期',
  `order_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '采退单制单人',
  `ship_method` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '配送方式',
  `comments` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `sales_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '销售订单id',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125408 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退单表头';

-- ----------------------------
-- Table structure for purchase_return_ship_upload_que
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_ship_upload_que`;
CREATE TABLE `purchase_return_ship_upload_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'WMS订单ID',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku id',
  `sku_lot` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品批次',
  `rec_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货数量-或重量',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '商品状态/正品1、残品2',
  `rec_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货日期',
  `return_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `return_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '服务响应信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT ' 创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=166708 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退出库信息上传采销系统';

-- ----------------------------
-- Table structure for purchase_return_src_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_src_detail`;
CREATE TABLE `purchase_return_src_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '分录号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采退单id',
  `lot` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品批次, OMS会指定商品的批次',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sku id',
  `order_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单商品数量（通知数量）',
  `qc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '质检数量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1称重, 0不称重',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS时间',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '库存类型',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=176500 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退单原始明细';

-- ----------------------------
-- Table structure for purchase_return_status
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_status`;
CREATE TABLE `purchase_return_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采退单id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'OMS订单状态',
  `status_desc` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `return_status` smallint(2) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `return_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '响应信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `need_sync` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1需要, 0不需要',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=369234 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采退单状态信息';

-- ----------------------------
-- Table structure for rtr_hand_over_attribute
-- ----------------------------
DROP TABLE IF EXISTS `rtr_hand_over_attribute`;
CREATE TABLE `rtr_hand_over_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `field_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '属性名',
  `field_value` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '属性值',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `hand_over_attrI1` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨批次交接属性表-记录司机和车牌或其它用途';

-- ----------------------------
-- Table structure for rtr_in_auto_receive_que
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_auto_receive_que`;
CREATE TABLE `rtr_in_auto_receive_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `hand_over_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '由调拨出导入时生成',
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '批次交接单编号: 由调拨出导入时生成',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID',
  `que_status` tinyint(2) DEFAULT '0' COMMENT '上传状态：0 未上传, 1 已上传 , -1异常',
  `error_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '返回信息',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_hand_over_id` (`hand_over_id`) USING BTREE,
  KEY `idx_hand_over_no` (`hand_over_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122272 DEFAULT CHARSET=utf8 COMMENT='调入单自动收货队列';

-- ----------------------------
-- Table structure for rtr_in_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_box_detail`;
CREATE TABLE `rtr_in_box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单id',
  `box_seq_no` int(11) NOT NULL DEFAULT '0' COMMENT '包件单明细分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU id',
  `sku_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品数量',
  `loss_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '缺失数量',
  `zp_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '正品数量',
  `cp_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '残品数量',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '保质期截止日期',
  `lot` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生产批次',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_box_id` (`box_id`,`box_seq_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2435956 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入包件单明细表';

-- ----------------------------
-- Table structure for rtr_in_box_header
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_box_header`;
CREATE TABLE `rtr_in_box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调入单ID',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调拨入编号',
  `tr_out_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `tr_out_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调拨出单编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品品种数',
  `sku_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品数量',
  `total_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '包裹中称重商品总重量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人名称',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹数量',
  `hand_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0未确认-在途,1已确认 2 收货交接 ',
  `hand_over_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '交接批次日期',
  `hand_over_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '批次交接人',
  `print_flag` tinyint(2) NOT NULL COMMENT '打印标示: 0:未打印 1：已打印',
  `print_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '打印时间',
  `print_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '打印人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `courier` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递交接人',
  `carrier_car_license` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '交接车牌号',
  `box_facade_reason` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '包件单破损原因',
  `box_facade` tinyint(2) NOT NULL DEFAULT '0' COMMENT '包裹外观: 0:外观良好 1：外观破损 2丢失',
  `facade_cofirm_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '外观确认人',
  `facade_cofirm_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '外观确认时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_order_no` (`order_no`) USING BTREE,
  KEY `idx_tr_out_no` (`tr_out_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_box_no1` (`box_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1003478 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调拨入包件单表头';

-- ----------------------------
-- Table structure for rtr_in_check
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_check`;
CREATE TABLE `rtr_in_check` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `entry_name` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `qc_qty` int(11) DEFAULT '0' COMMENT '扫描商品数量',
  `hand_over_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交接批次',
  `hand_over_no` varchar(32) NOT NULL DEFAULT '' COMMENT '批次交接单编号: 由调拨出导入时生成',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `record_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '记录当前年月日',
  PRIMARY KEY (`id`),
  KEY `idx_rtr_in_checkI1` (`hand_over_id`) USING BTREE,
  KEY `idx_rtr_in_checkI2` (`create_date`) USING BTREE,
  KEY `idx_rtr_in_checkI3` (`record_date`) USING BTREE,
  KEY `idx_rtr_in_checkI5` (`loc_id`,`entry_id`,`sku_id`,`hand_over_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=418304 DEFAULT CHARSET=utf8 COMMENT='调拨扫码记录表';

-- ----------------------------
-- Table structure for rtr_in_detail
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_detail`;
CREATE TABLE `rtr_in_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否称重商品: 1称重, 2不称重',
  `sku_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '申请数量-或重量',
  `loss_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '丢失数量-或重量',
  `zp_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '正品数量-或重量',
  `cp_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '残品数量-或重量',
  `discrep_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异数量=订单数量-正数量-残数量-丢失数量 或重量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进更新时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`,`order_line_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2273832 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入单据明细表';

-- ----------------------------
-- Table structure for rtr_in_hand_over_detail
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_hand_over_detail`;
CREATE TABLE `rtr_in_hand_over_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hand_over_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '批次交接ID',
  `bill_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '扫描号',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包裹ID',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '调拨入订单ID',
  `actual_weight` decimal(32,8) NOT NULL DEFAULT '0.00000000' COMMENT '实际重量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_hand_over_id` (`hand_over_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_box_id` (`box_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1044594 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调拨入批次明细表';

-- ----------------------------
-- Table structure for rtr_in_hand_over_header
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_hand_over_header`;
CREATE TABLE `rtr_in_hand_over_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `hand_over_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '由调拨出导入时生成',
  `hand_over_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '批次交接单编号: 由调拨出导入时生成',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货仓库名称',
  `from_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '调出仓库id',
  `from_ware_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发货仓库名称',
  `waybill_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹总数量',
  `real_box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '实收包裹总数量',
  `total_weight` decimal(14,6) NOT NULL DEFAULT '0.000000' COMMENT '总重量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hand_over_id` (`hand_over_id`) USING BTREE,
  KEY `idx_hand_over_no` (`hand_over_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入批次交接表头';

-- ----------------------------
-- Table structure for rtr_in_order
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_order`;
CREATE TABLE `rtr_in_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调拨入单据编号',
  `tr_out_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `tr_out_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调拨出单编号',
  `ware_id` int(32) NOT NULL DEFAULT '0' COMMENT '收货仓库id',
  `ware_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货仓库名称',
  `from_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID',
  `from_ware_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发货仓库名称',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态0:新建 1收货中 6收货完成',
  `owner_id` int(1) NOT NULL DEFAULT '0' COMMENT '货主id',
  `owner_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货主名称',
  `use_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '调拨类型',
  `sku_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品数量',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '申请品种数量',
  `total_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单中称重商品总重量',
  `recv_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收货数量',
  `recv_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货数量',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '调拨类型1正品2残品',
  `comments` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `approve_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '审核人',
  `approve_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '审核时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '收货完成时间',
  `finish_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货完成人',
  `cross_dock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否转运：1转运， 0，正常PO',
  `purchase_id` int(11) NOT NULL DEFAULT '0' COMMENT '转运调拨采购单id',
  `purchase_no` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '转运调拨采购单no',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`ware_id`),
  KEY `idx_order_no` (`order_no`),
  KEY `idx_tr_out_id` (`tr_out_id`),
  KEY `idx_tr_out_no` (`tr_out_no`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=765878 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入单据头';

-- ----------------------------
-- Table structure for rtr_in_status
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_status`;
CREATE TABLE `rtr_in_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '调拨入单据ID',
  `ware_id` int(32) NOT NULL DEFAULT '0' COMMENT '收货仓库id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '调拨入单据状态：0新建 1入库 6收货完成',
  `status_desc` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人名称',
  `return_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '返回状态： 1 成功 -1失败',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后响应时间',
  `need_sync` tinyint(2) NOT NULL DEFAULT '0' COMMENT '需要上传： 0：不上传， 1：上传',
  PRIMARY KEY (`id`),
  KEY `tr_in_status_UNIQUE` (`order_id`) USING BTREE,
  KEY `tr_in_statusI2` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2287942 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入状态表';

-- ----------------------------
-- Table structure for rtr_in_up_inv
-- ----------------------------
DROP TABLE IF EXISTS `rtr_in_up_inv`;
CREATE TABLE `rtr_in_up_inv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调拨ru单id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '库存类型1：正品， 2：产品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `mfg_date` date NOT NULL DEFAULT '1970-10-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-10-01' COMMENT '保质期截止日期',
  `lot` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生产批次',
  `rec_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传汇总反写',
  `loss_flag` tinyint(2) DEFAULT '0' COMMENT '丢失状态 1:丢失;0:没有丢失',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '制单人',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '-1:上传失败;1:上传成功',
  `error_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '错误信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后响应时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2484614 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入上传到调拨系统的订单库存信息表';

-- ----------------------------
-- Table structure for rtr_out_auto_ship_que
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_auto_ship_que`;
CREATE TABLE `rtr_out_auto_ship_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID',
  `que_status` tinyint(2) DEFAULT '0' COMMENT '上传状态：0 未上传, 1 已上传',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=261652 DEFAULT CHARSET=utf8 COMMENT='调出单自动出库';

-- ----------------------------
-- Table structure for rtr_out_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_box_detail`;
CREATE TABLE `rtr_out_box_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `box_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '包件单id',
  `box_seq_no` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '包件单明细分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU id',
  `box_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '包裹数量或重量',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '保质期截止日期',
  `lot` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '生产批次',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_box_id` (`box_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=419708 DEFAULT CHARSET=utf8 COMMENT='调拨出包件单明细表';

-- ----------------------------
-- Table structure for rtr_out_box_header
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_box_header`;
CREATE TABLE `rtr_out_box_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `box_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `box_no` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_sequence` int(11) NOT NULL DEFAULT '0' COMMENT '包裹序号',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调出单ID',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '库存类型（商品属性）1.正品  2、残品',
  `box_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '包件单状态: 0:新增， 1： 质检确认2：交接出库',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '调出单对应包裹总数量',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品品种数',
  `sku_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品数量或重量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '发出时间',
  `ship_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发出人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '进更新时间',
  `update_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`) USING BTREE,
  UNIQUE KEY `idx_box_no` (`box_no`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_creaet_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128726 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调拨出包件单表头';

-- ----------------------------
-- Table structure for rtr_out_detail
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_detail`;
CREATE TABLE `rtr_out_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单商品数量（通知数量）或重量',
  `ship_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '发出数量或重量',
  `discrep_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异数量或重量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '称重标识: 1称重, 0不称重',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `version` smallint(6) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=377226 DEFAULT CHARSET=utf8 COMMENT='调拨出明细表';

-- ----------------------------
-- Table structure for rtr_out_order
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_order`;
CREATE TABLE `rtr_out_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_code` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '调拨出单据编号',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调拨出单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID',
  `ware_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发货仓库名称',
  `to_ware_id` int(11) DEFAULT '0' COMMENT '收货仓库id',
  `to_ware_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '收货仓库名称',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '调拨单状态 0新建 4出库 5取消调拨',
  `lot_type` tinyint(2) NOT NULL DEFAULT '2' COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '申请品种数量',
  `sku_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '申请商品数量或重量',
  `ship_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '出库品种数量',
  `ship_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出库数量或重量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间',
  `expect_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '期望出库时间',
  `order_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '制单人',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '制单时间',
  `update_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `approve_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `ship_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '出库操作人名称',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '出库时间',
  `inv_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '调拨类型1正品2残品',
  `tr_in_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调入单id',
  `tr_in_no` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '调入单编号',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '箱子数量',
  `upload_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '上传rwms收货仓时间',
  `request_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调拨申请单id',
  `cancel_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '取消操作人名称',
  `cancel_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '取消时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  UNIQUE KEY `idx_order_code` (`order_code`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265324 DEFAULT CHARSET=utf8 COMMENT='调出单表头信息';

-- ----------------------------
-- Table structure for rtr_out_status
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_status`;
CREATE TABLE `rtr_out_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '调拨出单据ID',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '调拨单状态',
  `status_desc` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态描述',
  `creat_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `response_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '响应时间',
  `return_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '返回状态',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后响应时间',
  `need_sync` tinyint(2) NOT NULL DEFAULT '0' COMMENT '需要上传： 0：不上传， 1：上传',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=394122 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

-- ----------------------------
-- Table structure for rtr_out_upload_rwms_que
-- ----------------------------
DROP TABLE IF EXISTS `rtr_out_upload_rwms_que`;
CREATE TABLE `rtr_out_upload_rwms_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT 'warehuse ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '调出单id',
  `upload_status` tinyint(2) DEFAULT '0' COMMENT '上传状态：0 未上传, 1 已上传',
  `error_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '返回信息',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `upload_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '上传日期',
  `hand_over_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交接批次id',
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '交接批次号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128726 DEFAULT CHARSET=utf8 COMMENT='RWMS调拨出库上传RWMS收货仓库';

-- ----------------------------
-- Table structure for rwms_cycle_count_detail
-- ----------------------------
DROP TABLE IF EXISTS `rwms_cycle_count_detail`;
CREATE TABLE `rwms_cycle_count_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '盘点单号',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '盘点分录序号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU id',
  `cc_1st_qty` decimal(10,2) DEFAULT NULL COMMENT '一盘数量',
  `cc_1st_oh_qty` decimal(10,2) DEFAULT NULL COMMENT '一盘时在库数量',
  `difference_1st_qty` decimal(10,2) DEFAULT NULL COMMENT '一盘点时差异数量',
  `cc_2st_qty` decimal(10,2) DEFAULT NULL COMMENT '二盘数量',
  `cc_2st_oh_qty` decimal(10,2) DEFAULT NULL COMMENT '二盘时在库数量',
  `difference_2st_qty` decimal(10,2) DEFAULT NULL COMMENT '二盘点时差异数量',
  `cc_3st_qty` decimal(10,2) DEFAULT NULL COMMENT '三盘数量',
  `cc_3st_oh_qty` decimal(10,2) DEFAULT NULL COMMENT '三盘时在库数量',
  `difference_3st_qty` decimal(10,2) DEFAULT NULL COMMENT '三盘点时差异数量',
  `to_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '后续处理：生成新盘点单，或者生成损益单',
  `to_bill_no` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生成新盘点单，或者生成损益单编号',
  `to_bill_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型：1盘点单 2损益单',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盘点人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '盘点时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=356436 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='RWMS库存盘点明细表';

-- ----------------------------
-- Table structure for rwms_cycle_count_header
-- ----------------------------
DROP TABLE IF EXISTS `rwms_cycle_count_header`;
CREATE TABLE `rwms_cycle_count_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '盘点单号',
  `order_no` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盘点单名称',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT 'warehouse 编号',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID， 写死就叫春播',
  `cc_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '盘点类型：1一盘 2二盘 3三盘',
  `cc_way` tinyint(2) NOT NULL DEFAULT '1' COMMENT '盘点方式：1RF、2纸质',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '盘点单状态：0新建 1进行中 2已完成',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '库存类型: 1 正品, 2残品',
  `total_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '总品种数',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源单据ID',
  `src_order_no` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '来源单据编号',
  `src_cc_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '盘点类型：1一盘 2二盘 3三盘',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `execute_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务执行人',
  `execute_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务执行时间',
  `finish_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '最后完成人',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后完成时间',
  `cc_class_content` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盘点商品的分类json',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_order_no` (`order_no`) USING BTREE,
  UNIQUE KEY `idx_uniq_order_id` (`order_id`) USING BTREE,
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3686 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='RWMS库存盘点表';

-- ----------------------------
-- Table structure for rwms_dept
-- ----------------------------
DROP TABLE IF EXISTS `rwms_dept`;
CREATE TABLE `rwms_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '领用部门ID',
  `dept_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '店ID（ware_id）',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态（0：可用、1：取消）',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8 COMMENT='领用部门';

-- ----------------------------
-- Table structure for rwms_erp_inv_tran
-- ----------------------------
DROP TABLE IF EXISTS `rwms_erp_inv_tran`;
CREATE TABLE `rwms_erp_inv_tran` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `trans_id` bigint(20) NOT NULL COMMENT '库存流水事务ID，库存系统校验重复使用',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '1.正品  2.残品  3.废品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `lot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑批次iD',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '生产批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '过期日期',
  `trans_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '事务类型Id',
  `trans_type` int(11) NOT NULL DEFAULT '0' COMMENT '事务类型',
  `trans_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '事务数量',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `origin_num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '原始单据数',
  `left_num` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '剩余数',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单id',
  `src_order_type` int(11) NOT NULL DEFAULT '0' COMMENT '来源订单类型',
  `src_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源带锯ID',
  `return_code` int(11) NOT NULL DEFAULT '0' COMMENT '调用ERP返回结果：1成功， -1失败， 0新增',
  `return_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '调用ERP失败返回原因',
  `return_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '调用ERP返回时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01',
  `update_name` varchar(32) NOT NULL DEFAULT '修改人',
  `from_receipt` bigint(20) NOT NULL DEFAULT '0' COMMENT '原始订单ID',
  `from_receipt_code` varchar(32) NOT NULL DEFAULT '' COMMENT '原始订单编号',
  `loc_id_2nd` int(11) NOT NULL DEFAULT '0' COMMENT '发货事务：收货仓库， 收货事务：发货仓库',
  `from_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货仓库ID，只有调拨使用',
  `to_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '收获仓库ID， 只有调拨使用',
  `freezing` smallint(6) NOT NULL DEFAULT '0' COMMENT '1:frozen, 0 no-frozen ',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trans_id` (`trans_id`) USING BTREE,
  KEY `idx_sku_id_lot` (`sku_id`,`lot`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42223234 DEFAULT CHARSET=utf8 COMMENT='库存流水事务表，通知ERP修改库存 ';

-- ----------------------------
-- Table structure for rwms_inv
-- ----------------------------
DROP TABLE IF EXISTS `rwms_inv`;
CREATE TABLE `rwms_inv` (
  `rwms_inv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存唯一标示符 Unique index',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID ',
  `inv_type` int(11) NOT NULL DEFAULT '1' COMMENT '库存类型: 1 正品, 2残品, 3废品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `in_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总入库数量',
  `alloc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总入库数量',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'WMS on hand qty,实物库存。',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `out_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总出库数量',
  `cc_1st_qty` decimal(10,4) DEFAULT NULL COMMENT '一盘数量',
  `cc_1st_oh_qty` decimal(10,4) DEFAULT NULL COMMENT '一盘时在库数量',
  `cc_1st_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '一盘时间',
  `owner_id` int(11) NOT NULL DEFAULT '1' COMMENT '货主',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rwms_inv_id`) USING BTREE,
  UNIQUE KEY `idx_sku_id_ware_id` (`sku_id`,`ware_id`,`inv_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58749616 DEFAULT CHARSET=utf8 COMMENT='零售仓库存表';

-- ----------------------------
-- Table structure for rwms_inv_swap
-- ----------------------------
DROP TABLE IF EXISTS `rwms_inv_swap`;
CREATE TABLE `rwms_inv_swap` (
  `swap_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `from_inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '1.正品  2.残品',
  `to_inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '1.正品  2.残品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `swap_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '转换数量',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '转换时在库数量',
  `STATUS` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0新增， 1成功， -1失败',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `cause` varchar(50) NOT NULL DEFAULT '' COMMENT '转残原因',
  PRIMARY KEY (`swap_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7904 DEFAULT CHARSET=utf8 COMMENT='库存类型转换表 ';

-- ----------------------------
-- Table structure for rwms_inv_trans
-- ----------------------------
DROP TABLE IF EXISTS `rwms_inv_trans`;
CREATE TABLE `rwms_inv_trans` (
  `rwms_inv_trans_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存流水唯一标示符 Unique index',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID ',
  `inv_type` int(11) NOT NULL DEFAULT '1' COMMENT '库存类型: 1 正品, 2残品',
  `trans_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '事务唯一主键',
  `trans_src` smallint(6) NOT NULL DEFAULT '-1' COMMENT '事务来源:1 rwms-order, 2 rwms-inv',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `trans_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '库存类型ID',
  `trans_type` int(11) NOT NULL DEFAULT '0' COMMENT '事务类型：见rwms_inv_trans_define表',
  `trans_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '事务数量',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '事务发生前实物库存数量。',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(16) NOT NULL DEFAULT '' COMMENT '创建人',
  `owner_id` int(11) NOT NULL DEFAULT '1' COMMENT '货主',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单id',
  `src_order_type` int(11) NOT NULL DEFAULT '0' COMMENT '来源订单类型',
  `src_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源带锯ID',
  `return_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否修改库存成功：0没有修改， 1修改成功， -1修改失败',
  `return_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改库存返回时间',
  PRIMARY KEY (`rwms_inv_trans_id`) USING BTREE,
  UNIQUE KEY `idx_trans_id` (`trans_id`,`trans_src`) USING BTREE,
  KEY `idx_sku_id_ware_id` (`sku_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96446948 DEFAULT CHARSET=utf8 COMMENT='零售仓库存流水表';

-- ----------------------------
-- Table structure for rwms_location
-- ----------------------------
DROP TABLE IF EXISTS `rwms_location`;
CREATE TABLE `rwms_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shelves_id` int(11) NOT NULL DEFAULT '0' COMMENT '货架id',
  `location_no` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '货位编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `levl` int(11) NOT NULL DEFAULT '0' COMMENT '货架的第几层',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_location_no` (`location_no`,`ware_id`) USING BTREE,
  KEY `idx_shelves_id` (`shelves_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31692 DEFAULT CHARSET=utf8 COMMENT='货位表';

-- ----------------------------
-- Table structure for rwms_lot
-- ----------------------------
DROP TABLE IF EXISTS `rwms_lot`;
CREATE TABLE `rwms_lot` (
  `lot_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '逻辑主键ID',
  `ware_id` int(11) NOT NULL COMMENT 'warehouse ID',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '批次编号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '失效日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '-1' COMMENT '保质期天数',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '入库单ID',
  `order_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '入库单类型：1：采购单，2：调拨入库单， 3：销退入库',
  `recv_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '收货单ID',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '导入历史库时间',
  PRIMARY KEY (`lot_id`),
  UNIQUE KEY `lot_logI1` (`sku_id`,`lot`,`ware_id`) USING BTREE,
  KEY `lot_logI2` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3747328 DEFAULT CHARSET=utf8 COMMENT='零售仓逻辑批次信息表';

-- ----------------------------
-- Table structure for rwms_lot_inv
-- ----------------------------
DROP TABLE IF EXISTS `rwms_lot_inv`;
CREATE TABLE `rwms_lot_inv` (
  `rwms_lot_inv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存唯一标示符 Unique index',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID ',
  `lot_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '逻辑主键ID',
  `inv_type` int(11) NOT NULL DEFAULT '1' COMMENT '库存类型: 1 正品, 2残品, 3废品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '生产批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '过期时间',
  `in_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总入库数量',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'WMS on hand qty,实物库存。',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `out_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '总出库数量',
  `owner_id` int(11) NOT NULL DEFAULT '1' COMMENT '货主',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(32) NOT NULL DEFAULT '',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01',
  `update_name` varchar(32) NOT NULL DEFAULT '',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '导入历史库时间',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`rwms_lot_inv_id`),
  UNIQUE KEY `idx_lot_id_ware_id` (`lot_id`,`ware_id`,`inv_type`) USING BTREE,
  KEY `idx_sku_id_lot` (`sku_id`,`lot`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3753140 DEFAULT CHARSET=utf8 COMMENT='零售仓批次库存表';

-- ----------------------------
-- Table structure for rwms_lot_inv_trans
-- ----------------------------
DROP TABLE IF EXISTS `rwms_lot_inv_trans`;
CREATE TABLE `rwms_lot_inv_trans` (
  `rwms_lot_inv_trans_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存唯一标示符 Unique index',
  `trans_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '事务唯一主键',
  `trans_src` smallint(6) NOT NULL DEFAULT '-1' COMMENT '事务来源:1 rwms-order, 2 rwms-inv',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID ',
  `lot_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '逻辑主键ID',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '生产批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '过期时间',
  `inv_type` int(11) NOT NULL DEFAULT '1' COMMENT '库存类型: 1 正品, 2残品, 3废品',
  `trans_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '库存类型ID',
  `trans_type` int(11) NOT NULL DEFAULT '0' COMMENT '事务类型：见rwms_inv_trans_define表',
  `trans_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '事务数量',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '事务发生前实物库存数量。',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `create_name` varchar(16) NOT NULL DEFAULT '' COMMENT '创建人',
  `owner_id` int(11) NOT NULL DEFAULT '1' COMMENT '货主',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单id',
  `src_order_type` int(11) NOT NULL DEFAULT '0' COMMENT '来源订单类型',
  `src_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源带锯ID',
  PRIMARY KEY (`rwms_lot_inv_trans_id`) USING BTREE,
  KEY `idx_sku_id_lot` (`sku_id`,`lot`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_trans_id_trans_src` (`trans_id`,`trans_src`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40172842 DEFAULT CHARSET=utf8 COMMENT='零售仓修改WMS批次库存事务记录表';

-- ----------------------------
-- Table structure for rwms_odometer
-- ----------------------------
DROP TABLE IF EXISTS `rwms_odometer`;
CREATE TABLE `rwms_odometer` (
  `odo_type` varchar(10) NOT NULL,
  `length` int(11) NOT NULL,
  `current_no` int(11) NOT NULL,
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`odo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rwms_order_ship_log
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_ship_log`;
CREATE TABLE `rwms_order_ship_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01',
  `create_name` varchar(32) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态：0新增， -1失败， 1成功',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '系统库存出库成功时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=668802 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rwms_order_ship_sku_que
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_ship_sku_que`;
CREATE TABLE `rwms_order_ship_sku_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细ID',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01',
  `create_name` varchar(32) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态：0新增， -1失败， 1成功',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '系统库存出库成功时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id_sku` (`order_id`,`order_detail_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=21960574 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rwms_pick_goods
-- ----------------------------
DROP TABLE IF EXISTS `rwms_pick_goods`;
CREATE TABLE `rwms_pick_goods` (
  `pick_goods_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '领料ID',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '店ID（ware_id）',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '领用部门ID',
  `pick_no` int(11) NOT NULL DEFAULT '0' COMMENT '领用编号',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态（0：可用、1：取消）',
  `pick_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '领用人',
  `pick_time` date NOT NULL DEFAULT '1970-01-01' COMMENT '领用时间',
  `create_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `cancel_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '取消人',
  `cancel_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '取消时间',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`pick_goods_id`) USING BTREE,
  KEY `idx_pick_time` (`pick_time`) USING BTREE,
  KEY `idx_pick_user` (`pick_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178768 DEFAULT CHARSET=utf8 COMMENT='领料';

-- ----------------------------
-- Table structure for rwms_pick_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `rwms_pick_goods_detail`;
CREATE TABLE `rwms_pick_goods_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '领料详情ID',
  `pick_goods_id` bigint(20) NOT NULL COMMENT '领料ID',
  `sku_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'sku编码',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `cost` decimal(16,4) DEFAULT NULL COMMENT '成本',
  `tax_code_value` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `pick_num` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '领用数量',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_sku_name` (`sku_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178678 DEFAULT CHARSET=utf8 COMMENT='领料详情';

-- ----------------------------
-- Table structure for rwms_printer_config
-- ----------------------------
DROP TABLE IF EXISTS `rwms_printer_config`;
CREATE TABLE `rwms_printer_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `pc_address` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '打印机所在电脑地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='打印机配置';

-- ----------------------------
-- Table structure for rwms_profit_loss
-- ----------------------------
DROP TABLE IF EXISTS `rwms_profit_loss`;
CREATE TABLE `rwms_profit_loss` (
  `pl_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '1.正品  2.残品  3.废品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `pl_type` int(11) NOT NULL DEFAULT '0' COMMENT '损益类型',
  `need_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否称重商品： 称重商品1， 非称重商品0',
  `pl_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '损益数量',
  `on_hand_qty` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '损益时在库数量',
  `pl_reason` varchar(32) NOT NULL DEFAULT '' COMMENT '损益原因',
  `pl_remark` varchar(64) NOT NULL DEFAULT '' COMMENT '损益备注',
  `STATUS` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0新增， 1成功， -1失败',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '报废图片路径',
  PRIMARY KEY (`pl_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1454076 DEFAULT CHARSET=utf8 COMMENT='损益表 ';

-- ----------------------------
-- Table structure for rwms_shelves
-- ----------------------------
DROP TABLE IF EXISTS `rwms_shelves`;
CREATE TABLE `rwms_shelves` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `zone_no` char(1) NOT NULL DEFAULT '' COMMENT '库区',
  `shelves_no` int(11) NOT NULL DEFAULT '0' COMMENT '货架编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `lenth` int(11) NOT NULL DEFAULT '0' COMMENT '长',
  `width` int(11) NOT NULL DEFAULT '0' COMMENT '宽',
  `height` int(11) NOT NULL DEFAULT '0' COMMENT '高',
  `levl` int(11) NOT NULL DEFAULT '0' COMMENT '层数',
  `each_level_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '每层货位的货位个数',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_shelves_no` (`shelves_no`,`ware_id`,`zone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8 COMMENT='货架表';

-- ----------------------------
-- Table structure for rwms_sku_location
-- ----------------------------
DROP TABLE IF EXISTS `rwms_sku_location`;
CREATE TABLE `rwms_sku_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `location_id` int(11) NOT NULL DEFAULT '0' COMMENT '货位编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_location_id` (`location_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`,`ware_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94302 DEFAULT CHARSET=utf8 COMMENT='商品货位表';

-- ----------------------------
-- Table structure for sales_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_detail`;
CREATE TABLE `sales_return_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '订单id--WMS订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '订单商品数量（通知数量）-或重量',
  `weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品总重',
  `rec_qty1` int(11) NOT NULL DEFAULT '0' COMMENT '正品收货数量',
  `weight1` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货正品重量',
  `rec_qty2` int(11) NOT NULL DEFAULT '0' COMMENT '残品收货数量',
  `weight2` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货残品重量',
  `discrep_qty` int(11) NOT NULL DEFAULT '0' COMMENT '差异数量',
  `discrep_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异商品重量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否称重商品: 1称重, 0不称重',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS时间',
  `is_gift` int(11) NOT NULL DEFAULT '0' COMMENT '是否赠品',
  `src_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '源商品编号',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_line_no`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115044 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购单明细';

-- ----------------------------
-- Table structure for sales_return_header
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_header`;
CREATE TABLE `sales_return_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'OMS orderId',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '原始订单id',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源 1006零售仓线下订单',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0:新建 1质检中-收货中 2质检完成-收货完成',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `src_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单原始仓库',
  `ware_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '库房名称',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT 'sku品种数',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT 'sku数量',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '称重商品总重',
  `order_name` varchar(16) NOT NULL DEFAULT '' COMMENT '制单人-退单创建人',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '退单下单时间-即创建时间',
  `qc_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '质检日期',
  `qc_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '质检人',
  `comments` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `close_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '关闭时间',
  `close_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '关闭人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入WMS日期',
  `track_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '销退单运单号-销退',
  `pick_up_flag` smallint(6) NOT NULL DEFAULT '2' COMMENT ' 1:上门取货 0:非上门取货 2:默认值,不区分上门还是非上门',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新日期',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67946 DEFAULT CHARSET=utf8 COMMENT='销退单表头';

-- ----------------------------
-- Table structure for sales_return_lot
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_lot`;
CREATE TABLE `sales_return_lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '原订单id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品skuid',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量-或重量',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品数量-或重量',
  `lot` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '商品生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '商品保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '商品过期日期',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`,`lot`,`mfg_date`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销退批次信息';

-- ----------------------------
-- Table structure for sales_return_recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_recv_detail`;
CREATE TABLE `sales_return_recv_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '原订单id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品skuid',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '销退单商品数量',
  `weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品重量',
  `recv_qty` int(11) NOT NULL DEFAULT '0' COMMENT '收货数量',
  `recv_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '收货重量',
  `qc_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人 ',
  `lot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑批次id',
  `inv_type` int(11) NOT NULL DEFAULT '0' COMMENT '正残属性:1正2残',
  `unit_name` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单位名称',
  `lot` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '商品生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '商品保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '商品过期日期',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`,`lot`,`mfg_date`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21764 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销退收货明细';

-- ----------------------------
-- Table structure for sales_return_retail_que
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_retail_que`;
CREATE TABLE `sales_return_retail_que` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51676 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='零售仓销退单自动处理任务队列';

-- ----------------------------
-- Table structure for sales_return_status
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_status`;
CREATE TABLE `sales_return_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT 'OMS订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'OMS订单状态',
  `status_desc` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `return_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '响应信息',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `need_sync` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1需要, 0不需要',
  `task_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '定时任务类型 1：销退到货登记回调ERP 2：销退质检实际收货数量回调ERP --销退',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79562 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销退状态表';

-- ----------------------------
-- Table structure for sku_import_pcr_que
-- ----------------------------
DROP TABLE IF EXISTS `sku_import_pcr_que`;
CREATE TABLE `sku_import_pcr_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '订单类型：1:采购单,2:销退单,28:加工单',
  `sku_id` int(11) DEFAULT '0' COMMENT 'sku_id',
  `sku_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '商品名称',
  `lot` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT 'sku批次',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导入状态：0:新增,1:导入成功,-1:导入失败',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `entry_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `import_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '导入日期',
  `ware_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '库房ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_id_lot` (`sku_id`,`lot`,`ware_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1452042 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单上传品控系统队列';

-- ----------------------------
-- Table structure for sku_label_print_que
-- ----------------------------
DROP TABLE IF EXISTS `sku_label_print_que`;
CREATE TABLE `sku_label_print_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0',
  `sku_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '打印状态：0新建 1已打印',
  `session_id` varchar(48) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '当前操作人sessionId',
  `que_no` int(11) NOT NULL DEFAULT '0' COMMENT '同一session下扫描商品顺序号',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `print_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '打印时间',
  `print_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '打印人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=235572 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='RF待打印商品扫描队列';

-- ----------------------------
-- Table structure for sku_main
-- ----------------------------
DROP TABLE IF EXISTS `sku_main`;
CREATE TABLE `sku_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `sku_code` varchar(32) DEFAULT NULL COMMENT 'sku编码',
  `sku_status` smallint(6) DEFAULT NULL COMMENT 'sku状态',
  `sku_type` smallint(6) DEFAULT NULL COMMENT 'sku类型',
  `sku_title` varchar(128) DEFAULT NULL COMMENT '商品副标题',
  `sku_short_name` varchar(32) DEFAULT NULL COMMENT '助记码',
  `is_raw_material` smallint(6) DEFAULT NULL COMMENT '是否原材料 1:是 0:否',
  `sku_attr` smallint(6) DEFAULT NULL COMMENT '商品属性 1:自营 2:虚拟 3:预售',
  `length` decimal(12,4) DEFAULT NULL COMMENT '长',
  `width` decimal(12,4) DEFAULT NULL COMMENT '宽',
  `height` decimal(16,4) DEFAULT NULL COMMENT '高',
  `weight` decimal(12,4) DEFAULT NULL COMMENT '毛重',
  `plu_no` varchar(6) NOT NULL DEFAULT '0' COMMENT '称码',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位',
  `is_expire_flag` smallint(6) DEFAULT NULL COMMENT '1:有效期标示 0:非有效期',
  `valid_days` int(11) DEFAULT NULL COMMENT '有效期天数',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `is_serial` smallint(6) DEFAULT NULL COMMENT '1:序列号管理 0:非序列号管理',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `country_code_id` int(11) DEFAULT NULL COMMENT '商品产地',
  `is_air_forbid` smallint(6) DEFAULT NULL COMMENT '1:航空禁运 0:航空不禁运',
  `is_precious` smallint(6) DEFAULT NULL COMMENT '1:贵重物品 0:普通品',
  `is_liquid` smallint(6) DEFAULT NULL COMMENT '液体标示 1:液体 0:非液体',
  `delivery_type` smallint(6) DEFAULT NULL COMMENT '配送类型 1:无限制 2:海运',
  `is_open_check` smallint(6) DEFAULT '0' COMMENT '1:开箱检查 0:不开箱',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '一般纳税税码',
  `is_seasonal` smallint(6) DEFAULT NULL COMMENT '1:季节性商品 2:非季节性商品',
  `is_virtual` smallint(6) DEFAULT '0' COMMENT '1:虚拟商品 0:非虚拟商品',
  `is_lot` smallint(6) DEFAULT '1' COMMENT '1:批次管理 0:非批次管理',
  `seasonal_start_date` datetime DEFAULT NULL COMMENT '季节开始时间',
  `seasonal_end_date` datetime DEFAULT NULL COMMENT '季节结束时间',
  `temp_area_id` int(11) DEFAULT '0' COMMENT '温区id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '促销价',
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `price` decimal(16,4) DEFAULT NULL COMMENT '标价',
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `is_import` smallint(11) DEFAULT NULL COMMENT '1:进口商品,2:非进口商品',
  `sale_tax_code_id` int(11) DEFAULT NULL COMMENT '销项税',
  `purchase_mode` smallint(6) DEFAULT NULL COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT NULL COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT NULL COMMENT '保质期年月日',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名',
  `sku_component` varchar(128) NOT NULL DEFAULT '' COMMENT 'sku主要成分',
  `is_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '称重标识 2-不称重，1-称重',
  `product_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品三级分类名称',
  `first_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `first_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `second_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  `second_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '二级分类名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_mainI1` (`sku_id`) USING BTREE,
  KEY `sku_mainI2` (`sku_name`) USING BTREE,
  KEY `sku_mainI3` (`upc_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `ware_code` varchar(32) DEFAULT NULL COMMENT '仓库编号',
  `region_id` int(11) DEFAULT NULL COMMENT '行政区域id',
  `ware_name` varchar(128) DEFAULT NULL COMMENT '仓库名称',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮政编号',
  `ware_address` varchar(128) DEFAULT NULL COMMENT '仓库地址',
  `ware_type` smallint(6) DEFAULT NULL COMMENT '仓库类型  0：自有仓库；1：供应商仓库',
  `contact_name` varchar(64) DEFAULT NULL,
  `contact_phone_no` varchar(16) DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `ware_addr1` varchar(128) DEFAULT NULL,
  `ware_addr2` varchar(128) DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL COMMENT '所属分公司id',
  `org_name` varchar(128) DEFAULT NULL COMMENT '所属分公司名称',
  `timing_arrival_flag` int(4) DEFAULT '0' COMMENT '定时达标志1是 0非',
  `offline_sales_account` varchar(50) DEFAULT '' COMMENT '线下销售账号',
  `parent_ware` varchar(50) DEFAULT '' COMMENT '父仓库',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weather_info
-- ----------------------------
DROP TABLE IF EXISTS `weather_info`;
CREATE TABLE `weather_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,主键自增',
  `province_name` varchar(25) NOT NULL DEFAULT '' COMMENT '省名称',
  `city_name` varchar(25) NOT NULL DEFAULT '' COMMENT '市名称',
  `county_name` varchar(25) NOT NULL DEFAULT '' COMMENT '县(区)名称',
  `ad_code` varchar(25) NOT NULL DEFAULT '' COMMENT '区域编码',
  `city_code` varchar(25) NOT NULL DEFAULT '' COMMENT '城市编码',
  `report_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '数据发布时间',
  `weather` varchar(20) NOT NULL DEFAULT '' COMMENT '天气现象',
  `temperature` int(11) NOT NULL DEFAULT '0' COMMENT '实时气温，单位：摄氏度',
  `wind_direction` varchar(10) NOT NULL DEFAULT '' COMMENT '风向描述',
  `wind_power` varchar(10) NOT NULL DEFAULT '' COMMENT '风力级别，单位:级',
  `humidity` varchar(10) NOT NULL DEFAULT '' COMMENT '空气湿度',
  `weather_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '日期',
  `day_weather` varchar(20) NOT NULL DEFAULT '' COMMENT '白天天气现象',
  `night_weather` varchar(20) NOT NULL DEFAULT '' COMMENT '晚上天气现象',
  `day_temp` int(11) NOT NULL DEFAULT '0' COMMENT '白天温度',
  `night_temp` int(11) NOT NULL DEFAULT '0' COMMENT '晚上温度',
  `day_wind` varchar(10) NOT NULL DEFAULT '' COMMENT '白天风向',
  `night_wind` varchar(10) NOT NULL DEFAULT '' COMMENT '晚上风向',
  `day_power` varchar(10) NOT NULL DEFAULT '' COMMENT '白天风力',
  `night_power` varchar(10) NOT NULL DEFAULT '' COMMENT '晚上风力',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `operator` varchar(30) NOT NULL DEFAULT '' COMMENT '操作人',
  `status` smallint(2) NOT NULL DEFAULT '-1' COMMENT '状态 0无效,1有效',
  PRIMARY KEY (`id`),
  KEY `index_name` (`ad_code`,`weather_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3208122 DEFAULT CHARSET=utf8 COMMENT='用来存储天气预报相关信息';

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '加工单id, ERP传入',
  `process_id` int(11) NOT NULL DEFAULT '0' COMMENT '加工单id, ERP传入',
  `process_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '加工单名称',
  `process_code` varchar(32) NOT NULL DEFAULT '' COMMENT '加工单编号',
  `process_top_sku` varchar(100) NOT NULL DEFAULT '' COMMENT '加工单成品一览（页面查询用）',
  `process_state` tinyint(6) NOT NULL DEFAULT '0' COMMENT '加工单状态，0:新建  1：加工中 2：加工完成 3:取消生产',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `is_lot` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否指定批次',
  `use_sku_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '加工单原料使用类型 0：按原料计划生产\r\n1：按成品计划生产，补料\r\n2：按成品计划生产，不补料',
  `process_type` tinyint(6) NOT NULL DEFAULT '0' COMMENT '加工单类型：0：组装；1：拆分',
  `product_number` int(11) NOT NULL DEFAULT '0' COMMENT '生产成品数量',
  `real_product_num` int(11) NOT NULL DEFAULT '0' COMMENT '实际生产成品数量，由仓库回传得到',
  `plan_top_sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '预计成品品种数',
  `plan_top_sku_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT ' 预计成品数量',
  `top_sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '实际成品品种数',
  `top_sku_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '实际成品数量',
  `comp_sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '原料品种数',
  `comp_sku_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '原料总数量',
  `plan_work_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '计划生产日期',
  `entry_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '加工完成时间',
  `finish_name` varchar(32) NOT NULL DEFAULT '' COMMENT '加工完成人',
  `cancel_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '取消时间',
  `cancel_name` varchar(32) NOT NULL DEFAULT '' COMMENT '取消人',
  `is_book_num` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0默认流程不变 １加工系统进行接口调用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=277930 DEFAULT CHARSET=utf8 COMMENT='加工单';

-- ----------------------------
-- Table structure for work_order_comp
-- ----------------------------
DROP TABLE IF EXISTS `work_order_comp`;
CREATE TABLE `work_order_comp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `process_sku_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL COMMENT 'OMS加工单ID',
  `bom_sku_id` int(11) DEFAULT NULL COMMENT '物料清单bom原料表id',
  `purchase_id` int(11) NOT NULL DEFAULT '0' COMMENT '原料采购订单号(拆分单可能使用)',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `upc_no` varchar(64) DEFAULT '' COMMENT 'UPC码',
  `unit_name` varchar(10) DEFAULT '' COMMENT '单位',
  `order_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '计划使用数量',
  `real_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '实际使用数量',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '截止日期',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`sku_id`,`lot`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=759886 DEFAULT CHARSET=utf8 COMMENT='加工单物料明细表';

-- ----------------------------
-- Table structure for work_order_comp_cost
-- ----------------------------
DROP TABLE IF EXISTS `work_order_comp_cost`;
CREATE TABLE `work_order_comp_cost` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单的sku_id',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '当前加工单的批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '当前原料sku加工日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单原料的保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '当前加工单原料失效日期',
  `order_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '当前加工单原料使用数量 wipSplitNum 拆分数量',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源组装加工单号 purchaseId',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COMMENT='保存拆分单原料和来源加工单的成品的关系';

-- ----------------------------
-- Table structure for work_order_status
-- ----------------------------
DROP TABLE IF EXISTS `work_order_status`;
CREATE TABLE `work_order_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '加工单ID',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '加工单状态',
  `status_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '状态说明',
  `create_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `return_status` int(11) NOT NULL DEFAULT '0' COMMENT '返回状态表示',
  `error_code` varchar(255) NOT NULL DEFAULT '' COMMENT '错误信息',
  `last_send_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后一次同步时间',
  `need_sync` tinyint(6) NOT NULL DEFAULT '0' COMMENT '1:需要上传, 0 不需要',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_order_top
-- ----------------------------
DROP TABLE IF EXISTS `work_order_top`;
CREATE TABLE `work_order_top` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'OMS加工单ID',
  `bom_id` int(11) NOT NULL DEFAULT '0' COMMENT '物料清单bom_id',
  `bom_no` varchar(32) NOT NULL DEFAULT '' COMMENT 'the number of bom',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `upc_no` varchar(32) NOT NULL DEFAULT '',
  `unit_name` varchar(10) NOT NULL DEFAULT '',
  `order_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `real_qty` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `lot` varchar(50) NOT NULL DEFAULT '',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0',
  `expire_date` date NOT NULL DEFAULT '1970-01-01',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_lot_sku_id` (`lot`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34836 DEFAULT CHARSET=utf8 COMMENT='加工单成品表';

-- ----------------------------
-- Table structure for work_order_top_cost
-- ----------------------------
DROP TABLE IF EXISTS `work_order_top_cost`;
CREATE TABLE `work_order_top_cost` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务无关的主键',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单的sku_id',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '当前加工单的批次',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '当前成品sku加工日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '当前加工单成品的保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '当前加工单成品失效日期',
  `order_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '当前加工单成品数量',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源组装加工单号',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间',
  `purchase_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采购单号',
  `receipt_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传erp的时候需要带着的业务id',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=684 DEFAULT CHARSET=utf8 COMMENT='保存拆分加工单的成品和来源组装加工单的原料的关系';

/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmsex1

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:53:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for distri_temp_map
-- ----------------------------
DROP TABLE IF EXISTS `distri_temp_map`;
CREATE TABLE `distri_temp_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` smallint(6) DEFAULT '0' COMMENT '仓库编号',
  `loc_name` varchar(64) DEFAULT '' COMMENT '仓库名称',
  `schema_name` varchar(64) DEFAULT '' COMMENT '模式名称',
  `is_valid` smallint(6) DEFAULT '0' COMMENT '启用标志: 0 不启用 1 启用',
  `start_name` varchar(32) DEFAULT '' COMMENT '启用人',
  `start_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `stop_name` varchar(32) DEFAULT '' COMMENT '停用人',
  `stop_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '添加人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '添加时间',
  `update_name` varchar(32) DEFAULT '' COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `distri_temp_mapI1` (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='配送温区模式设置表';

-- ----------------------------
-- Table structure for distri_temp_map_dtl
-- ----------------------------
DROP TABLE IF EXISTS `distri_temp_map_dtl`;
CREATE TABLE `distri_temp_map_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schema_id` int(11) DEFAULT '0' COMMENT '模式名称',
  `origin_temp_id` smallint(6) DEFAULT '0' COMMENT '原配送温区ID',
  `origin_temp_name` varchar(32) DEFAULT '' COMMENT '原配送温区名称',
  `mapping_temp_id` smallint(6) DEFAULT '0' COMMENT '映射配送温区ID',
  `mapping_temp_name` varchar(32) DEFAULT '' COMMENT '映射配送温区',
  `update_name` varchar(32) DEFAULT '' COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `distri_map_dtlI1` (`schema_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='配送温区模式设置表明细';

-- ----------------------------
-- Table structure for order_return_qc
-- ----------------------------
DROP TABLE IF EXISTS `order_return_qc`;
CREATE TABLE `order_return_qc` (
  `qc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `return_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '退单号',
  `order_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '退单状态',
  `sku_id` int(11) NOT NULL DEFAULT '0',
  `sku_name` varchar(128) NOT NULL DEFAULT '',
  `entry_datetime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '退单创建时间',
  `qc_datetime` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '签收日期',
  `qc_name` varchar(30) NOT NULL DEFAULT '' COMMENT '签收人',
  `qc_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT '确认收到标识(0、未确认收到  1、已确认收到)',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '退单收货仓',
  PRIMARY KEY (`qc_id`),
  UNIQUE KEY `order_return_qc_index` (`return_id`,`sku_id`) USING BTREE,
  KEY `sku_idindex` (`sku_id`) USING BTREE,
  KEY `qc_datetimeindex` (`qc_datetime`) USING BTREE,
  KEY `entry_datetimeindex` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='销退sku重新质检明细表';

-- ----------------------------
-- Table structure for sku_main
-- ----------------------------
DROP TABLE IF EXISTS `sku_main`;
CREATE TABLE `sku_main` (
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
  `temp_area_id` int(11) NOT NULL COMMENT '温区id',
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
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息表';

-- ----------------------------
-- Table structure for sku_qc
-- ----------------------------
DROP TABLE IF EXISTS `sku_qc`;
CREATE TABLE `sku_qc` (
  `qc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` int(11) DEFAULT '0' COMMENT 'sku_id',
  `sku_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `lot` varchar(30) DEFAULT '' COMMENT 'sku批次',
  `test_cyc` tinyint(4) DEFAULT '0' COMMENT '检测周期',
  `src_type` tinyint(4) DEFAULT '0' COMMENT '来源类型 1、采购 2、加工',
  `order_id` bigint(11) DEFAULT '0' COMMENT '采购单号\r\n',
  `acct_id` int(11) DEFAULT '0' COMMENT '供应商id',
  `acct_name` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `rec_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '仓库到货时间',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `operator_name` varchar(30) DEFAULT '' COMMENT '操作人姓名',
  `operator_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '操作时间',
  `free_qc_reason` tinyint(4) DEFAULT '0' COMMENT '免检原因',
  `comment` varchar(250) DEFAULT '' COMMENT '免检备注',
  `add_lab_id` int(11) DEFAULT '0' COMMENT '操作的实验室id',
  PRIMARY KEY (`qc_id`),
  KEY `sku_idindex` (`sku_id`),
  KEY `lot_index` (`lot`),
  KEY `operator_name_index` (`operator_name`),
  KEY `operator_datetime_index` (`operator_datetime`),
  KEY `add_lab_id_index` (`add_lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6750 DEFAULT CHARSET=utf8 COMMENT='品控信息表';

-- ----------------------------
-- Table structure for sku_qc_conf
-- ----------------------------
DROP TABLE IF EXISTS `sku_qc_conf`;
CREATE TABLE `sku_qc_conf` (
  `conf_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT '0' COMMENT '配置sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `sku_type` int(11) DEFAULT '0' COMMENT '商品类型',
  `upc_no` varchar(32) DEFAULT '' COMMENT 'upcno',
  `product_class_id` int(11) DEFAULT '0' COMMENT '商品三级分类',
  `need_test` tinyint(4) DEFAULT '0' COMMENT '是否需要检测：0、未知 1、是 2、否',
  `is_lab` char(1) DEFAULT 'N' COMMENT '是否指定实验室',
  `lab_id` int(11) DEFAULT '0' COMMENT '实验室id',
  `lab_name` varchar(50) DEFAULT '' COMMENT '实验室名称',
  `test_cyc` tinyint(4) DEFAULT '0' COMMENT '检测周期',
  `cyc_days` smallint(4) DEFAULT '0' COMMENT '周期天数',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '添加人姓名',
  `conf_name` varchar(32) DEFAULT '' COMMENT '设置人姓名',
  `conf_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '设置时间',
  PRIMARY KEY (`conf_id`),
  UNIQUE KEY `sku_idindex` (`sku_id`),
  KEY `upc_noindex` (`upc_no`) USING BTREE,
  KEY `sku_typeindexz` (`sku_type`),
  KEY `product_class_idindex` (`product_class_id`),
  KEY `need_testindex` (`need_test`),
  KEY `test_cycindex` (`test_cyc`)
) ENGINE=InnoDB AUTO_INCREMENT=157042 DEFAULT CHARSET=utf8 COMMENT='品控工作台sku配置表';

-- ----------------------------
-- Table structure for sku_qc_conf_bak
-- ----------------------------
DROP TABLE IF EXISTS `sku_qc_conf_bak`;
CREATE TABLE `sku_qc_conf_bak` (
  `conf_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_id` int(11) DEFAULT '0' COMMENT '配置sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `sku_type` int(11) DEFAULT '0' COMMENT '商品类型',
  `upc_no` varchar(32) DEFAULT '' COMMENT 'upcno',
  `product_class_id` int(11) DEFAULT '0' COMMENT '商品三级分类',
  `need_test` tinyint(4) DEFAULT '0' COMMENT '是否需要检测：0、未知 1、是 2、否',
  `is_lab` char(1) DEFAULT 'N' COMMENT '是否指定实验室',
  `lab_id` int(11) DEFAULT '0' COMMENT '实验室id',
  `lab_name` varchar(50) DEFAULT '' COMMENT '实验室名称',
  `test_cyc` tinyint(4) DEFAULT '0' COMMENT '检测周期',
  `cyc_days` smallint(4) DEFAULT '0' COMMENT '周期天数',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '添加人姓名',
  `conf_name` varchar(32) DEFAULT '' COMMENT '设置人姓名',
  `conf_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '设置时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sku_temperature_conf
-- ----------------------------
DROP TABLE IF EXISTS `sku_temperature_conf`;
CREATE TABLE `sku_temperature_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT '0',
  `sku_name` varchar(128) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区ID',
  `distri_temp_area_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `distri_temp_area_name` varchar(255) DEFAULT NULL COMMENT '配送温区名称',
  `is_check_arrival_temp` int(11) NOT NULL DEFAULT '-1' COMMENT '是否检查到货温度(-1：未设置，0：不检查，1：检查)',
  `before_arrival_temp_left` decimal(11,2) DEFAULT NULL COMMENT '前三次到货温度区间最小值',
  `before_arrival_temp_right` decimal(11,2) DEFAULT NULL COMMENT '前三次到货温度区间最大值',
  `after_arrival_temp_left` decimal(11,2) DEFAULT NULL COMMENT '前三次之后温度区间最小值',
  `after_arrival_temp_right` decimal(11,2) DEFAULT NULL COMMENT '前三次之后温度区间最大值',
  `dry_flag` char(1) DEFAULT NULL COMMENT 'N 否, Y 是',
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `sku_type` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `first_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品一级分类id',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '商品一级分类名称',
  `to_c` smallint(6) DEFAULT '0' COMMENT 'toC 销售渠道',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_id_idx` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=198550 DEFAULT CHARSET=utf8 COMMENT='商品存储设置设置商品温度属性，配送温区，干燥属性';

-- ----------------------------
-- Table structure for sku_temperature_conf_bak
-- ----------------------------
DROP TABLE IF EXISTS `sku_temperature_conf_bak`;
CREATE TABLE `sku_temperature_conf_bak` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) DEFAULT '0',
  `sku_name` varchar(128) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区ID',
  `distri_temp_area_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `distri_temp_area_name` varchar(255) DEFAULT NULL COMMENT '配送温区名称',
  `dry_flag` char(1) DEFAULT NULL COMMENT 'N 否, Y 是',
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sku_temperature_conf_bak_1
-- ----------------------------
DROP TABLE IF EXISTS `sku_temperature_conf_bak_1`;
CREATE TABLE `sku_temperature_conf_bak_1` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) DEFAULT '0',
  `sku_name` varchar(128) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区ID',
  `distri_temp_area_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `distri_temp_area_name` varchar(255) DEFAULT NULL COMMENT '配送温区名称',
  `dry_flag` char(1) DEFAULT NULL COMMENT 'N 否, Y 是',
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temperature_area
-- ----------------------------
DROP TABLE IF EXISTS `temperature_area`;
CREATE TABLE `temperature_area` (
  `temp_area_id` int(11) NOT NULL,
  `temp_area_name` varchar(64) DEFAULT NULL COMMENT '温区标示',
  `start_temp` float DEFAULT NULL COMMENT '起始温度',
  `end_temp` float DEFAULT NULL COMMENT '结束温度',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  PRIMARY KEY (`temp_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='温区维表';

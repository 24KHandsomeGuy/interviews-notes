/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmsex2

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:53:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rt_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `rt_order_detail`;
CREATE TABLE `rt_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单行号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `upc_no` varchar(32) DEFAULT '' COMMENT 'upc码',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `unit` varchar(10) DEFAULT '' COMMENT '单位',
  `sku_size` varchar(10) DEFAULT '' COMMENT '包装规格',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '购买受凉',
  `sku_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rt_order_detailI1` (`order_id`,`order_line_no`)
) ENGINE=InnoDB AUTO_INCREMENT=94458 DEFAULT CHARSET=utf8 COMMENT='零售订单明细';

-- ----------------------------
-- Table structure for rt_order_header
-- ----------------------------
DROP TABLE IF EXISTS `rt_order_header`;
CREATE TABLE `rt_order_header` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID， 主键',
  `order_code` bigint(20) NOT NULL COMMENT '库房ID+100000000+order_id',
  `loc_id` tinyint(4) NOT NULL COMMENT '仓库ID',
  `pos_no` varchar(10) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0新建， 1 确认, -1 取消',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式：1 cash, 2. 饭卡,10 混合',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `rt_order_headerI1` (`order_code`) USING BTREE,
  KEY `rt_order_headerI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32886 DEFAULT CHARSET=utf8 COMMENT='零售订单表';

-- ----------------------------
-- Table structure for rt_order_process
-- ----------------------------
DROP TABLE IF EXISTS `rt_order_process`;
CREATE TABLE `rt_order_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `process_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单处理类型:1 创建领用出库单',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `process_datetime` datetime DEFAULT NULL COMMENT '处理时间',
  `process_status` tinyint(4) DEFAULT '0' COMMENT '处理状态:0新增， 1 成功， -1 失败',
  `process_desc` varchar(100) DEFAULT '' COMMENT '处理备注',
  PRIMARY KEY (`id`),
  KEY `rt_order_processI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32880 DEFAULT CHARSET=utf8 COMMENT='订单处理流程表';

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
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区id',
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
  `if_material_pull` smallint(6) DEFAULT '0' COMMENT '是否参与原料拉动 0：否 1：是',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息表';

/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmsex3

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dps_auto_issue_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_auto_issue_conf`;
CREATE TABLE `dps_auto_issue_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(32) NOT NULL DEFAULT '' COMMENT '商品名称',
  `issue_po` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否自动采购',
  `issue_transfer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否自动调拨',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  `ware_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_first_class` (`first_class`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动采购设置';

-- ----------------------------
-- Table structure for dps_bp_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_bp_conf`;
CREATE TABLE `dps_bp_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ware_name` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `bp` int(11) NOT NULL DEFAULT '0' COMMENT '采购周期(天)',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_first_class` (`first_class`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='采购周期设置';

-- ----------------------------
-- Table structure for dps_inv_assurance_rate_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_inv_assurance_rate_conf`;
CREATE TABLE `dps_inv_assurance_rate_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `abc_class` varchar(10) NOT NULL DEFAULT '0.00' COMMENT '商品决策类型:ABC分类',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库存满足率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_first_class` (`first_class`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='库存满足率设置';

-- ----------------------------
-- Table structure for dps_order_sales_predict
-- ----------------------------
DROP TABLE IF EXISTS `dps_order_sales_predict`;
CREATE TABLE `dps_order_sales_predict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `predict_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量',
  `real_sale_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际销量',
  `discrep_percent` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异比率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`,`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单销售预测表';

-- ----------------------------
-- Table structure for dps_order_sales_smooth_indices
-- ----------------------------
DROP TABLE IF EXISTS `dps_order_sales_smooth_indices`;
CREATE TABLE `dps_order_sales_smooth_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `predict_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量',
  `real_sale_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际销量',
  `discrep_percent` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异比率',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `org_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组织ID',
  `org_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '组织名称',
  `one_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '一次平滑结果',
  `two_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '二次平滑结果',
  `three_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '三次平滑结果',
  `sum_squares` decimal(24,4) NOT NULL DEFAULT '0.0000' COMMENT '平方和',
  `variance` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '方差',
  `count_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记数(第几次计算)',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_date_flag` (`date_flag`,`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单销售平滑指数';

-- ----------------------------
-- Table structure for dps_parameters
-- ----------------------------
DROP TABLE IF EXISTS `dps_parameters`;
CREATE TABLE `dps_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(11) NOT NULL DEFAULT '-1' COMMENT '仓库ID',
  `prof_type` varchar(32) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_i` int(11) NOT NULL DEFAULT '-1' COMMENT '属性整型值',
  `prof_c` varchar(100) NOT NULL DEFAULT '' COMMENT '属性字符串值',
  `prof_n` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '属性小数值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '属性日期类型值',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `upate_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置表';

-- ----------------------------
-- Table structure for dps_purchase_advice
-- ----------------------------
DROP TABLE IF EXISTS `dps_purchase_advice`;
CREATE TABLE `dps_purchase_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `bill_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单据类型:1:采购建议,2:要货计划',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ware_name` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `parent_ware_id` int(11) NOT NULL DEFAULT '-1' COMMENT '上级仓库ID',
  `supplier_id` int(11) NOT NULL DEFAULT '-1' COMMENT '供应商ID',
  `supplier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称(冗余字段)',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:new,1:生成采购单/调拨单,-1:failed',
  `issue_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:自动生成采购单,1:自动生成调拨单,2:手工生成',
  `d_avg_lt_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平均8次LT销量（计算SS使用）',
  `avalible_qty` decimal(10,2) DEFAULT NULL,
  `condition_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '触发lop点时的库存数量:(stock_num - order_book_num - trans_out_num - on_sale_num - frozen_num + on_order_num+ trans_in_num)',
  `transit_in_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '在途库存',
  `bp` int(11) NOT NULL DEFAULT '0' COMMENT '采购周期(天)',
  `d_lt_bp_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量(接下来一个采购周期bp+lt(计算TI使用))',
  `ss` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '安全库存',
  `lop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补货点数量',
  `ti` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '目标库存',
  `rq_manual` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补货量(用户可调,初始=系统建议补货量)',
  `rq` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '系统建议补货量',
  `issue_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '下单时间(生成采购,调拨时间)',
  `order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '补货单据id（采购单,调拨单）',
  `order_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '补货单据类型:1:采购单,2:调拨单',
  `expect_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '期望到货日期',
  `predict_short_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '预计缺货时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2996 DEFAULT CHARSET=utf8 COMMENT='采购建议表';

-- ----------------------------
-- Table structure for dps_purchase_cycle_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_purchase_cycle_conf`;
CREATE TABLE `dps_purchase_cycle_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `purchase_cycle` int(11) NOT NULL DEFAULT '0' COMMENT '采购周期(天)',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_first_class` (`first_class`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购周期设置';

-- ----------------------------
-- Table structure for dps_sku_abc
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_abc`;
CREATE TABLE `dps_sku_abc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `sku_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'skuId',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上周销售额',
  `abc_class` varchar(10) NOT NULL DEFAULT '0.00' COMMENT '商品决策类型:ABC分类',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_id` (`sku_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品决策类型:ABC分类';

-- ----------------------------
-- Table structure for dps_sku_lop
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_lop`;
CREATE TABLE `dps_sku_lop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `supplier_id` int(11) NOT NULL DEFAULT '-1' COMMENT '供应商ID',
  `supplier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称(冗余字段)',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:不需要生成补货计划,1:生成补货计划',
  `k` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '安全系数',
  `lt` int(11) NOT NULL DEFAULT '0' COMMENT '采购前置期(天)',
  `lt_avg` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购提前期8次平均',
  `lt_var` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购提前期8次方差',
  `d_avg` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'LT时间范围内的销量平均数',
  `d_var` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'LT时间范围内的销量方差',
  `ss` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '安全库存',
  `d_lt_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量(接下来一个采购提前期lt)',
  `lop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补货点数量',
  `available_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可卖数',
  `on_order_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补货前订货量',
  `transit_in_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '在途库存',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4540 DEFAULT CHARSET=utf8 COMMENT='商品订货点';

-- ----------------------------
-- Table structure for dps_sku_lop_calc_que
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_lop_calc_que`;
CREATE TABLE `dps_sku_lop_calc_que` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ware_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '仓库类型:0:自有仓库,1:供应商仓库',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `replenish_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '补货类型:1:采购,2:调拨',
  `date_flag` date NOT NULL DEFAULT '1970-01-02' COMMENT '日期',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:新增,-1:失败,1:成功,2:无法计算',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=320450 DEFAULT CHARSET=utf8 COMMENT='商品补货量计算队列';

-- ----------------------------
-- Table structure for dps_sku_lop_log
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_lop_log`;
CREATE TABLE `dps_sku_lop_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `supplier_id` int(11) NOT NULL DEFAULT '-1' COMMENT '供应商ID',
  `supplier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称(冗余字段)',
  `sku_id` int(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:不需要生成补货计划,1:生成补货计划',
  `k` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '安全系数',
  `lt` int(11) NOT NULL DEFAULT '0' COMMENT '采购前置期(天)',
  `lt_avg` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购提前期8次平均',
  `lt_var` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购提前期8次方差',
  `d_avg` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'LT时间范围内的销量平均数',
  `d_var` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'LT时间范围内的销量方差',
  `ss` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '安全库存',
  `d_lt_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量--接下来一个采购提前期lt',
  `lop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补货点数量',
  `available_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实物库存',
  `on_order_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实物库存',
  `transit_in_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '在途库存',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4538 DEFAULT CHARSET=utf8 COMMENT='商品订货点计算日志';

-- ----------------------------
-- Table structure for dps_sku_rotation_rate_daily
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_rotation_rate_daily`;
CREATE TABLE `dps_sku_rotation_rate_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `sku_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sale_cost` decimal(10,2) NOT NULL DEFAULT '-1.00' COMMENT '当天销售成本',
  `inv_cost` decimal(10,2) NOT NULL DEFAULT '-1.00' COMMENT '当天库存成本',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_date_flag` (`date_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品周转率(每天统计)';

-- ----------------------------
-- Table structure for dps_sku_rotation_rate_monthly
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_rotation_rate_monthly`;
CREATE TABLE `dps_sku_rotation_rate_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rpt_year` smallint(6) NOT NULL DEFAULT '-1' COMMENT '报表月份',
  `rpt_month` smallint(6) NOT NULL DEFAULT '-1' COMMENT '报表月份',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `sku_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(32) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sale_cost` decimal(10,2) NOT NULL DEFAULT '-1.00' COMMENT '月度商品销售成本',
  `inv_cost_total` decimal(10,2) NOT NULL DEFAULT '-1.00' COMMENT '月度总库存成本',
  `inv_cost_avg` decimal(10,2) NOT NULL DEFAULT '-1.00' COMMENT '月度平均库存成本',
  `days` smallint(6) NOT NULL DEFAULT '-1' COMMENT '本月天数 ',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '月度周转率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品周转率(每月统计)';

-- ----------------------------
-- Table structure for dps_sku_sales_predict
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_sales_predict`;
CREATE TABLE `dps_sku_sales_predict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '计算日期(哪天计算的)',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选：-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `sku_id` bigint(11) NOT NULL DEFAULT '-1' COMMENT 'skuId',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `lt` int(11) NOT NULL DEFAULT '0' COMMENT '最近一次LT',
  `bp` int(11) NOT NULL DEFAULT '0' COMMENT '采购周期',
  `predict_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '被预测的日期',
  `predict_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量',
  `real_sale_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际销量',
  `discrep_percent` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异比率',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_date_flag` (`date_flag`,`ware_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71061542 DEFAULT CHARSET=utf8 COMMENT='商品销售预测表';

-- ----------------------------
-- Table structure for dps_sku_sales_smooth_indices
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_sales_smooth_indices`;
CREATE TABLE `dps_sku_sales_smooth_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '计算日期(哪天计算的)',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `sku_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品名称',
  `predict_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '被预测的日期',
  `predict_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预测数量',
  `real_sale_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际销量',
  `discrep_percent` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '差异比率',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `org_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组织ID',
  `org_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '组织名称',
  `one_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '一次平滑结果',
  `two_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '二次平滑结果',
  `three_smooth` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '三次平滑结果',
  `sum_squares` decimal(24,4) NOT NULL DEFAULT '0.0000' COMMENT '平方和',
  `variance` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '方差',
  `count_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记数(第几次计算)',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`,`ware_id`,`sku_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=951818 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品销售平滑指数';

-- ----------------------------
-- Table structure for dps_sku_shortage_rate0
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_shortage_rate0`;
CREATE TABLE `dps_sku_shortage_rate0` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `sku_cnt_0` int(11) NOT NULL DEFAULT '-1' COMMENT '可卖数为零商品种类',
  `sku_cnt_total` int(11) NOT NULL DEFAULT '-1' COMMENT '全部可售卖商品数量',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售缺率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货率统计表(库房统计)';

-- ----------------------------
-- Table structure for dps_sku_shortage_rate1
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_shortage_rate1`;
CREATE TABLE `dps_sku_shortage_rate1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `sku_cnt_0` int(11) NOT NULL DEFAULT '-1' COMMENT '可卖数为零商品种类',
  `sku_cnt_total` int(11) NOT NULL DEFAULT '-1' COMMENT '全部可售卖商品数量',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售缺率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE,
  KEY `idx_first_class` (`first_class`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货率统计表(一级分类)';

-- ----------------------------
-- Table structure for dps_sku_shortage_rate2
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_shortage_rate2`;
CREATE TABLE `dps_sku_shortage_rate2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称-可选',
  `sku_cnt_0` int(11) NOT NULL DEFAULT '-1' COMMENT '可卖数为零商品种类',
  `sku_cnt_total` int(11) NOT NULL DEFAULT '-1' COMMENT '全部可售卖商品数量',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售缺率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`date_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货率统计表(二级分类)';

-- ----------------------------
-- Table structure for dps_sku_shortage_rate3
-- ----------------------------
DROP TABLE IF EXISTS `dps_sku_shortage_rate3`;
CREATE TABLE `dps_sku_shortage_rate3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date_flag` date NOT NULL DEFAULT '1970-01-01' COMMENT '日期',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `first_class` int(11) NOT NULL COMMENT '商品一级分类必录字段',
  `first_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `second_class` int(11) NOT NULL DEFAULT '-1' COMMENT '二级分类ID:-1:表示null',
  `second_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '二级分类名称(可选)',
  `third_class` int(11) NOT NULL DEFAULT '-1' COMMENT '三级分类ID可选:-1:表示null',
  `third_class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `sku_cnt_0` int(11) NOT NULL DEFAULT '-1' COMMENT '可卖数为零商品种类',
  `sku_cnt_total` int(11) NOT NULL DEFAULT '-1' COMMENT '全部可售卖商品数量',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售缺率',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`) USING BTREE,
  KEY `idx_third_class` (`third_class`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货率统计表(三级分类)';

-- ----------------------------
-- Table structure for dps_supplier_buy_amount_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_supplier_buy_amount_conf`;
CREATE TABLE `dps_supplier_buy_amount_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `supplier_id` int(11) NOT NULL DEFAULT '-1' COMMENT '供应商ID',
  `supplier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称(冗余字段)',
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低采购金额',
  `min_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低采购数量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商最低采购金额/数量';

-- ----------------------------
-- Table structure for dps_supplier_fulfil_date_conf
-- ----------------------------
DROP TABLE IF EXISTS `dps_supplier_fulfil_date_conf`;
CREATE TABLE `dps_supplier_fulfil_date_conf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `supplier_id` int(11) NOT NULL DEFAULT '-1' COMMENT '供应商ID',
  `supplier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称(冗余字段)',
  `monday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周一:0:no,1:yes',
  `tuesday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周二',
  `wednesday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周三',
  `thursday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周四',
  `friday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周五',
  `saturday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周六',
  `sunday` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周日',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `org_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '组织ID',
  `org_name` varchar(32) NOT NULL DEFAULT '' COMMENT '组织名称',
  PRIMARY KEY (`id`),
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='供应商期望下单日期设置 ';

-- ----------------------------
-- Table structure for dps_ware_net_config
-- ----------------------------
DROP TABLE IF EXISTS `dps_ware_net_config`;
CREATE TABLE `dps_ware_net_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ware_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库房ID',
  `level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '物流网络层级',
  `parent_ware_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '上级仓库ID',
  `dc` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否配送中心(distribute center):1:是,0:否',
  `sales` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否履约中心:1:是,0:否',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='仓库物流网络设置表';

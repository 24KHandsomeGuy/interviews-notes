/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : tmsfreightdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:50:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for carrier_exp_temp_detail
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_temp_detail`;
CREATE TABLE `carrier_exp_temp_detail` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板明细id',
  `temp_addr_id` int(11) NOT NULL COMMENT '模版地址ID',
  `carrexptemp_id` int(11) NOT NULL COMMENT '运费模板id',
  `carrexptemp_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '快递运费模板名称',
  `settlement_dimension_type` int(1) DEFAULT '0' COMMENT '结算维度类型:1、订单 2、运单',
  `settlement_rule_type` int(1) DEFAULT '0' COMMENT '结算规则类型:1、重量阶梯 2、按单结算',
  `order_refused` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '普通订单拒收',
  `back_order_received` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '退货订单妥投',
  `back_order_refused` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '退货订单拒收',
  `create_user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `audit_user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_status` int(1) DEFAULT '0' COMMENT '审核状态(1-存盘、2–待审核、3-已审核、4-驳回)',
  `force_status` int(1) DEFAULT '0' COMMENT '生效状态（1:未生效、2：已生效）',
  `force_time` datetime DEFAULT NULL COMMENT '生效时间',
  `notes` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`exp_id`),
  KEY `carrexptemp_id_I2` (`carrexptemp_id`),
  KEY `audit_time_I5` (`audit_time`),
  KEY `temp_addr_idI1` (`temp_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3346 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运费模板明细';

-- ----------------------------
-- Table structure for carrier_exp_temp_header
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_temp_header`;
CREATE TABLE `carrier_exp_temp_header` (
  `carrexptemp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板id',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库名称',
  `carrier_id` bigint(30) NOT NULL,
  `carrier_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司名称',
  `carrexptemp_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '快递运费模板名称',
  `carrexptemp_note` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '快递模板描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `working_state` int(1) DEFAULT '0' COMMENT '工作状态0存盘 1停用 2启用 -1删除',
  `started_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '启动人',
  `started_date` datetime DEFAULT NULL COMMENT '启动时间',
  `stopped_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '停用人',
  `stopped_date` datetime DEFAULT NULL COMMENT '停用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `delete_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '删除人',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `order_dimension` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0：正逆向模板，1：正向模板，2：逆向模板',
  PRIMARY KEY (`carrexptemp_id`),
  KEY `create_date_I1` (`create_date`) USING HASH,
  KEY `started_date_I2` (`started_date`),
  KEY `carrier_id_I4` (`carrier_id`),
  KEY `ware_name_I5` (`ware_name`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运费模板';

-- ----------------------------
-- Table structure for fee_sync_message_que
-- ----------------------------
DROP TABLE IF EXISTS `fee_sync_message_que`;
CREATE TABLE `fee_sync_message_que` (
  `sync_que_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_flow_id` bigint(20) NOT NULL COMMENT '详情明细ID',
  `fee_type` tinyint(1) DEFAULT NULL COMMENT '推送金额类型：1--销售、2--销退、3--赔付',
  `shipping_fee` decimal(12,2) DEFAULT '0.00' COMMENT '推送金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sync_message_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '消息id',
  `sync_status` smallint(6) DEFAULT NULL COMMENT '同步状态：1–未同步、2–已同步、3--同步失败',
  `sync_datetime` datetime DEFAULT NULL COMMENT ' 同步时间',
  `migrate_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '迁移状态 1, 迁移, 0,未迁移',
  `migrate_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '迁移时间',
  PRIMARY KEY (`sync_que_id`),
  KEY `order_flow_id_I1` (`order_flow_id`) USING BTREE,
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=21790712 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='费用同步消息队列';

-- ----------------------------
-- Table structure for fee_sync_message_que_bak
-- ----------------------------
DROP TABLE IF EXISTS `fee_sync_message_que_bak`;
CREATE TABLE `fee_sync_message_que_bak` (
  `sync_que_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主键',
  `order_flow_id` bigint(20) NOT NULL COMMENT '详情明细ID',
  `fee_type` tinyint(1) DEFAULT NULL COMMENT '推送金额类型：1--销售、2--销退、3--赔付',
  `shipping_fee` decimal(12,2) DEFAULT '0.00' COMMENT '推送金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sync_message_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '消息id',
  `sync_status` smallint(6) DEFAULT NULL COMMENT '同步状态：1–未同步、2–已同步、3--同步失败',
  `sync_datetime` datetime DEFAULT NULL COMMENT ' 同步时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_arithmetic_result
-- ----------------------------
DROP TABLE IF EXISTS `order_arithmetic_result`;
CREATE TABLE `order_arithmetic_result` (
  `arithmetic_result_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_flow_id` bigint(20) DEFAULT NULL COMMENT '订单记录id',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `settlement_order_no` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '结算单号',
  `transport_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `order_amount` decimal(12,2) DEFAULT NULL COMMENT '订单金额',
  `shipping_fee` decimal(12,2) DEFAULT NULL COMMENT '配送费',
  `payment_fee` decimal(12,2) DEFAULT NULL COMMENT '赔付款',
  `calculation_results_type` int(11) NOT NULL DEFAULT '0' COMMENT '计算结果类型（计算结果类型:1--计算成功、2--计算失败、3--计算异常）',
  `calculation_datetime` datetime DEFAULT NULL COMMENT '计算时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `failure_cause` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '不成功原因',
  `calculation_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '运费计算方式。0：运费模板，1：手工录入',
  `manual_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单运费录入计算表id',
  `migrate_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '迁移状态 1, 迁移, 0,未迁移',
  `migrate_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '迁移时间',
  `settlement_dimension_type` int(1) NOT NULL DEFAULT '0' COMMENT '结算维度类型:1、订单 2、运单 3、物流订单 4、结算单',
  `settlement_rule_type` int(1) NOT NULL DEFAULT '0' COMMENT '结算规则类型:1、重量阶梯 2、按单结算',
  `weight` decimal(32,8) NOT NULL DEFAULT '0.00000000' COMMENT '计算维度重量',
  PRIMARY KEY (`arithmetic_result_id`),
  KEY `order_id_I1` (`order_id`),
  KEY `transport_id_I2` (`transport_id`),
  KEY `idx_order_flow_id` (`order_flow_id`),
  KEY `idx_calculation_datetime` (`calculation_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20594244 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单计算结果详情表';

-- ----------------------------
-- Table structure for order_arithmetic_result_bak
-- ----------------------------
DROP TABLE IF EXISTS `order_arithmetic_result_bak`;
CREATE TABLE `order_arithmetic_result_bak` (
  `arithmetic_result_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主键',
  `order_flow_id` bigint(20) DEFAULT NULL COMMENT '订单记录id',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `transport_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `order_amount` decimal(12,2) DEFAULT NULL COMMENT '订单金额',
  `shipping_fee` decimal(12,2) DEFAULT NULL COMMENT '配送费',
  `payment_fee` decimal(12,2) DEFAULT NULL COMMENT '赔付款',
  `calculation_results_type` int(11) NOT NULL DEFAULT '0' COMMENT '计算结果类型（计算结果类型:1--计算成功、2--计算失败、3--计算异常）',
  `calculation_datetime` datetime DEFAULT NULL COMMENT '计算时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_freight_manual
-- ----------------------------
DROP TABLE IF EXISTS `order_freight_manual`;
CREATE TABLE `order_freight_manual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `update_user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '录入人姓名',
  `freight` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '录入的运费',
  `remark` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `update_datetime` datetime DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=902 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='手工录入运费表';

-- ----------------------------
-- Table structure for order_freight_manual_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_freight_manual_detail`;
CREATE TABLE `order_freight_manual_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `manual_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单运费录入计算表id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `plan_order_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '企业销售计划号',
  `order_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `freight` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '分配的运费',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `manual_id_I1` (`manual_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='手工录入运费详情表';

-- ----------------------------
-- Table structure for order_header
-- ----------------------------
DROP TABLE IF EXISTS `order_header`;
CREATE TABLE `order_header` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `transport_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `logistics_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流订单ID',
  `src_order_id` bigint(20) NOT NULL COMMENT 'OMS: 来源订单ID',
  `settlement_order_no` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '结算单号',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `data_type` int(11) DEFAULT NULL COMMENT '数据类型：1：订单、2：运单',
  `status` smallint(6) DEFAULT NULL COMMENT '订单当前状态',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '来源仓库ID',
  `carrier_id` int(11) DEFAULT NULL COMMENT '配送公司id',
  `carrier_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '配送公司名称',
  `weight` decimal(32,6) DEFAULT NULL,
  `order_amount` decimal(12,2) DEFAULT NULL COMMENT '订单金额',
  `payment_fee` decimal(12,2) DEFAULT NULL COMMENT '赔付款',
  `province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `area` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '区',
  `fth_addr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '4级地址',
  `prof_value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '配送结算单位',
  `hand_over_date` datetime DEFAULT NULL COMMENT '交接出库时间',
  `in_tms_date` datetime DEFAULT NULL COMMENT '进入TMS时间:接单时间',
  `order_since_time` datetime DEFAULT NULL COMMENT '归班时间',
  `merchant_stock_time` datetime DEFAULT NULL COMMENT '商家入库时间',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `closed` smallint(6) DEFAULT NULL COMMENT '是否结束:1结束， 0没结束',
  `migrate_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '迁移状态 1, 迁移, 0,未迁移',
  `migrate_datetime` datetime NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '迁移时间',
  `coordinate_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1:火星、2:谷歌、3:百度、4:腾讯、5:高德',
  `lng` varchar(26) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '经度坐标',
  `lat` varchar(26) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '纬度坐标',
  PRIMARY KEY (`tid`),
  KEY `order_id_I2` (`order_id`),
  KEY `carrier_id_I4` (`carrier_id`),
  KEY `order_since_time_I6` (`order_since_time`),
  KEY `in_tms_date_I7` (`in_tms_date`) USING BTREE,
  KEY `idx_settlement_order_no` (`settlement_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74277800 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

-- ----------------------------
-- Table structure for order_recalculate_condition
-- ----------------------------
DROP TABLE IF EXISTS `order_recalculate_condition`;
CREATE TABLE `order_recalculate_condition` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `carrexptemp_id` int(11) NOT NULL COMMENT '运费模板id',
  `force_time` datetime NOT NULL COMMENT '生效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建人',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否更新状态：1 是，0 否',
  `temp_addr_id` int(11) NOT NULL COMMENT '模版地址ID',
  PRIMARY KEY (`condition_id`),
  KEY `carrexptemp_I1` (`carrexptemp_id`),
  KEY `force_time_I2` (`force_time`),
  KEY `create_time_I3` (`create_time`),
  KEY `temp_addr_id_I4` (`temp_addr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2550 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运费重新计算条件表';

-- ----------------------------
-- Table structure for pyt_log
-- ----------------------------
DROP TABLE IF EXISTS `pyt_log`;
CREATE TABLE `pyt_log` (
  `pyt_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pyt_manage_id` bigint(20) NOT NULL COMMENT '赔付管理ID',
  `operation_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `operator` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '操作人',
  `operation_type` tinyint(1) DEFAULT '1' COMMENT '操作类型:1--新增、2--编辑、3--确认、4--取消',
  PRIMARY KEY (`pyt_log_id`),
  KEY `pyt_manage_id_I1` (`pyt_manage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118654 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='赔付操作日志';

-- ----------------------------
-- Table structure for pyt_manage
-- ----------------------------
DROP TABLE IF EXISTS `pyt_manage`;
CREATE TABLE `pyt_manage` (
  `pyt_manage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `settlement_order_no` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '结算单号',
  `src_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS单号，原单号',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  `pyt_status` tinyint(1) DEFAULT '1' COMMENT '赔付状态:1–新增、2–确认、3--取消',
  `order_status` smallint(6) DEFAULT NULL COMMENT '订单状态 ',
  `order_type` tinyint(1) DEFAULT '0' COMMENT '订单类型：0--普通订单、1--上门换货、2--上门退货',
  `carrier_id` int(11) DEFAULT '0' COMMENT '配送公司id',
  `carrier_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '配送公司名称',
  `stores` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '网点',
  `pyt_type` tinyint(1) DEFAULT '0' COMMENT '赔付类型：1–全单赔付、2--部分赔付',
  `pyt_rule_type` tinyint(1) DEFAULT '0' COMMENT '赔付规则：1–比例赔款公式、2--固定金额',
  `pyt_amount` decimal(12,2) DEFAULT '0.00' COMMENT '赔付款',
  `pyt_cause` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '赔付原因',
  `from_sys` tinyint(1) DEFAULT '0' COMMENT '数据录入方式：1–客服系统、2--仓库系统、3--人工录入',
  `entry_port` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '录入口',
  `notes` varchar(260) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `in_tms_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '接单时间',
  `hand_over_datetime` datetime DEFAULT NULL COMMENT '出库时间',
  `order_since_datetime` datetime DEFAULT NULL COMMENT '归班时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT '0' COMMENT '创建人',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `ensure_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '确认人',
  `ensure_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `cancel_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '取消人',
  `cancel_datetime` datetime DEFAULT NULL COMMENT '取消时间',
  PRIMARY KEY (`pyt_manage_id`),
  KEY `order_id_I1` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89006 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='赔付管理';

-- ----------------------------
-- Table structure for pyt_rule
-- ----------------------------
DROP TABLE IF EXISTS `pyt_rule`;
CREATE TABLE `pyt_rule` (
  `carrier_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递公司ID',
  `carrier_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '快递公司名称',
  `payment_rule` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '赔付规则',
  `max_amount` decimal(12,2) DEFAULT NULL COMMENT '最高值',
  `working_state` int(1) DEFAULT '1' COMMENT '工作状态：1-启用、2-停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建人',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `enable_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '启用人',
  `enable_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `update_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `stopped_user` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '停用人',
  `stopped_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  PRIMARY KEY (`carrier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9004840 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='赔付规则';

-- ----------------------------
-- Table structure for pyt_sku_inventory
-- ----------------------------
DROP TABLE IF EXISTS `pyt_sku_inventory`;
CREATE TABLE `pyt_sku_inventory` (
  `sku_Inventory_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pyt_manage_id` bigint(20) NOT NULL COMMENT '赔付管理ID',
  `transport_id` bigint(20) DEFAULT NULL COMMENT '运单号',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT 'SKU在OMS等其他系统里的id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编码',
  `sku_name` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '商品名称',
  `sell_price` decimal(12,2) DEFAULT '0.00' COMMENT '售价',
  `cost_price` decimal(12,2) DEFAULT '0.00' COMMENT '成本价',
  `sell_sku_qty` int(3) DEFAULT '0' COMMENT '原始数量',
  `pyt_qty` int(3) DEFAULT '0' COMMENT '赔付数量',
  `gift` tinyint(1) DEFAULT '0' COMMENT '是否赠品:0--否、1–是',
  `src_sku_id` bigint(20) DEFAULT NULL COMMENT '来源商品编码',
  `create_user_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建人',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`sku_Inventory_id`),
  KEY `pyt_manage_id_sku_id_I2` (`pyt_manage_id`,`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270428 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单商品信息';

-- ----------------------------
-- Table structure for settlement_rule
-- ----------------------------
DROP TABLE IF EXISTS `settlement_rule`;
CREATE TABLE `settlement_rule` (
  `settlement_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算规则id',
  `exp_id` int(11) NOT NULL COMMENT '模版明细id',
  `min_weight` double(6,3) DEFAULT NULL COMMENT '小阶梯重量',
  `max_weight` double(6,3) DEFAULT NULL COMMENT '大阶梯重量',
  `min_borderline` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '小边界符',
  `max_borderline` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '大边界符',
  `distributed_price` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT ' 配送价格',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`settlement_rule_id`),
  KEY `exp_id_I1` (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7716 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算规则（价格公式）';

-- ----------------------------
-- Table structure for temp_addr
-- ----------------------------
DROP TABLE IF EXISTS `temp_addr`;
CREATE TABLE `temp_addr` (
  `settlement_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `carrexptemp_id` int(11) NOT NULL COMMENT '运费模板id',
  `weight_rule` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '重量规则',
  `region_level1_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '一级地址code',
  `region_level1_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '一级地址名称',
  `valid_1node` smallint(1) DEFAULT '0' COMMENT '是否有效:1 有效 0 失效',
  `region_level2_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '二级地址code',
  `region_level2_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '二级地址名称',
  `valid_2node` smallint(1) DEFAULT '0' COMMENT '是否有效:1 有效 0 失效',
  `region_level3_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '三级地址code',
  `region_level3_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '三级地址名称',
  `valid_3node` smallint(1) DEFAULT '0' COMMENT '是否有效:1 有效 0 失效',
  `region_level4_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址code',
  `region_level4_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址名称',
  `valid_4node` smallint(1) DEFAULT '0' COMMENT '是否有效:1 有效 0 失效',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`settlement_rule_id`),
  KEY `create_time_I1` (`create_time`),
  KEY `region_level1_name_I3` (`region_level1_name`),
  KEY `region_level1_code_I2` (`region_level1_code`) USING BTREE,
  KEY `region_level2_code_I4` (`region_level2_code`),
  KEY `region_level2_name_I5` (`region_level2_name`),
  KEY `region_level3_code_I6` (`region_level3_code`),
  KEY `region_level3_name_I7` (`region_level3_name`),
  KEY `region_level4_code_I8` (`region_level4_code`),
  KEY `region_level4_name_I9` (`region_level4_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12316 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='模版地址表';

/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmscoredb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:53:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill_type_define
-- ----------------------------
DROP TABLE IF EXISTS `bill_type_define`;
CREATE TABLE `bill_type_define` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_name` varchar(30) NOT NULL COMMENT '单据名称',
  `bill_type` int(11) NOT NULL COMMENT '单据数字类型',
  `table_name` varchar(30) NOT NULL COMMENT '被引用的表',
  `bill_comment` varchar(30) DEFAULT NULL COMMENT '注释',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bill_type_defineI2` (`bill_name`,`bill_type`,`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for box_detail
-- ----------------------------
DROP TABLE IF EXISTS `box_detail`;
CREATE TABLE `box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单id',
  `box_item_seq` int(11) DEFAULT NULL COMMENT '包件单明细分录号',
  `sku_id` int(11) DEFAULT NULL COMMENT 'SKU',
  `qc_qty` int(20) DEFAULT NULL COMMENT '质检数量',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `entry_date` datetime DEFAULT NULL COMMENT '创建日期',
  `order_line_no` int(11) DEFAULT NULL COMMENT '订单明细行号',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否为赠品',
  `unit_price` decimal(32,8) DEFAULT NULL COMMENT '价格',
  `gift_type` smallint(6) DEFAULT '0' COMMENT '赠品类型 赠品类型 0:普通品(非赠品) 1:促销赠品 2:市场赠品',
  `kit_line_no` int(11) DEFAULT NULL COMMENT '虚拟组套套装商品ID',
  `kit_sku_id` int(11) DEFAULT NULL COMMENT '虚拟组套套装商品ID',
  `sku_type` int(11) DEFAULT NULL,
  `order_qty` int(11) DEFAULT NULL COMMENT '订单sku数量',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`id`),
  KEY `box_detailI1` (`box_id`),
  KEY `box_detailI2` (`import_datetime`) USING BTREE,
  KEY `idx_entry_date` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93841356 DEFAULT CHARSET=utf8 COMMENT='订单包件单明细表';

-- ----------------------------
-- Table structure for box_header
-- ----------------------------
DROP TABLE IF EXISTS `box_header`;
CREATE TABLE `box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_cnt` int(11) DEFAULT NULL COMMENT '当前作业单包裹数量',
  `box_sequence` int(11) DEFAULT NULL COMMENT '当前包裹序号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '作业单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `track_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运单号',
  `status` int(11) DEFAULT NULL COMMENT '包件单状态: 0初始化, 1新增包裹, 5质检确认, 6订单称重, 7 批次交接出库 ',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '商品品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `weight_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `weight_id` int(11) DEFAULT NULL COMMENT '确认人ID',
  `weight_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认人名称',
  `ship_date` datetime DEFAULT NULL COMMENT '发出时间',
  `ship_id` int(11) DEFAULT NULL COMMENT '发出人ID',
  `ship_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发出人',
  `actual_weight` decimal(32,8) DEFAULT NULL,
  `print_status` int(11) DEFAULT '0',
  `price_hide_flag` smallint(6) DEFAULT NULL COMMENT '1、隐藏 2、显示',
  `sl_print_cnt` int(11) DEFAULT '0' COMMENT '运单打印次数',
  `pl_print_cnt` int(11) DEFAULT '0' COMMENT '清单打印次数',
  `box_type` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '包裹类型(2：保温箱、1：普通包裹)',
  `warm_box_id` bigint(20) DEFAULT NULL COMMENT '保温箱ID',
  `warm_box_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '资产编码-包裹编码',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `package_type` smallint(6) DEFAULT NULL COMMENT '包装类型:1.普通包装 2.环保包装',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0不合单 1：合单',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `warm_opt_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '保温箱操作时间',
  `warm_opt_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '保温箱操作人',
  `material` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '包裹耗材',
  PRIMARY KEY (`id`),
  UNIQUE KEY `box_headerI1` (`box_id`) USING BTREE,
  UNIQUE KEY `box_header2` (`box_no`) USING BTREE,
  KEY `box_headerI3` (`order_id`,`order_type`) USING BTREE,
  KEY `box_headerI7` (`entry_datetime`) USING BTREE,
  KEY `box_headerI4` (`parent_order_id`),
  KEY `box_headerI5` (`import_datetime`) USING BTREE,
  KEY `box_headerI8` (`warm_box_id`) USING BTREE,
  KEY `pick_li_idx` (`pick_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45700424 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单包件单表头';

-- ----------------------------
-- Table structure for card_ship_queue
-- ----------------------------
DROP TABLE IF EXISTS `card_ship_queue`;
CREATE TABLE `card_ship_queue` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` smallint(6) DEFAULT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS订单父单类型--useless now',
  `status` int(11) DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库日期',
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  KEY `card_ship_queueI1` (`order_id`,`order_type`),
  KEY `card_ship_queueI2` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='春播卡出库表';

-- ----------------------------
-- Table structure for carrier_consignor_conf
-- ----------------------------
DROP TABLE IF EXISTS `carrier_consignor_conf`;
CREATE TABLE `carrier_consignor_conf` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0：禁用，1：启用 ',
  `consignor_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '快递委托类型：1订单标识编号 2订单汇总 ',
  `consignee_carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '受托快递id',
  `consignor_carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '委托快递id',
  `consignor_carrier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '委托快递名称',
  `consignor_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '说明',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='快递委托配置表';

-- ----------------------------
-- Table structure for carrier_modify_box
-- ----------------------------
DROP TABLE IF EXISTS `carrier_modify_box`;
CREATE TABLE `carrier_modify_box` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `box_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `box_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `modify_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '1:包裹未进行改派操作;2包裹已进行改派操作',
  `entry_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `modify_boxI1` (`order_id`) USING BTREE,
  KEY `modify_boxI2` (`box_id`) USING BTREE,
  KEY `modify_boxI3` (`box_no`) USING BTREE,
  KEY `modify_boxI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8456 DEFAULT CHARSET=utf8 COMMENT='承运商改派，包裹改派操作表';

-- ----------------------------
-- Table structure for carrier_modify_log
-- ----------------------------
DROP TABLE IF EXISTS `carrier_modify_log`;
CREATE TABLE `carrier_modify_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `carrier_id` int(11) NOT NULL COMMENT '快递id',
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `carrier_name` varchar(64) NOT NULL COMMENT '快递名称',
  `original_carrier_id` int(11) NOT NULL COMMENT '原始快递id',
  `original_carrier_name` varchar(64) NOT NULL COMMENT '原始快递名称',
  `entry_datetime` timestamp NOT NULL COMMENT '创建时间',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `entry_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  PRIMARY KEY (`id`),
  KEY `modify_logI1` (`entry_datetime`) USING BTREE,
  KEY `modify_logI2` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76200 DEFAULT CHARSET=utf8 COMMENT='承运商改派日志表';

-- ----------------------------
-- Table structure for carrier_shipping_info
-- ----------------------------
DROP TABLE IF EXISTS `carrier_shipping_info`;
CREATE TABLE `carrier_shipping_info` (
  `carrier_id` int(11) NOT NULL COMMENT '快递公司ID',
  `service_id` varchar(32) NOT NULL COMMENT '使用配送服务ID（SF, HG, RFD）',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_spot_letter
-- ----------------------------
DROP TABLE IF EXISTS `carrier_spot_letter`;
CREATE TABLE `carrier_spot_letter` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '受托的快递id',
  `shipment_spot_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站点名称',
  `letter` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '字母序号',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='快递下站点标识序号表';

-- ----------------------------
-- Table structure for carton_detail
-- ----------------------------
DROP TABLE IF EXISTS `carton_detail`;
CREATE TABLE `carton_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carton_id` bigint(20) DEFAULT NULL COMMENT '包件单id',
  `carton_item_seq` int(11) DEFAULT NULL COMMENT '包件单明细分录号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU',
  `qc_qty` int(20) DEFAULT NULL COMMENT '质检数量',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型（商品属性）',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `entry_date` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19408 DEFAULT CHARSET=utf8 COMMENT='包件单明细表';

-- ----------------------------
-- Table structure for carton_header
-- ----------------------------
DROP TABLE IF EXISTS `carton_header`;
CREATE TABLE `carton_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carton_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `carton_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '包件单编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `status` int(11) DEFAULT NULL COMMENT '包件单状态',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '商品品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `confirm_id` int(11) DEFAULT NULL COMMENT '确认人ID',
  `confirm_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认人名称',
  `ship_date` datetime DEFAULT NULL COMMENT '发出时间',
  `ship_id` int(11) DEFAULT NULL COMMENT '发出人ID',
  `ship_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发出人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `carton_headerI1` (`carton_id`),
  UNIQUE KEY `carton_headerI2` (`carton_no`),
  KEY `carton_headerI3` (`order_id`,`order_type`),
  KEY `carton_headerI5` (`loc_id`),
  KEY `carton_headerI6` (`pick_list_id`),
  KEY `carton_headerI7` (`entry_datetime`),
  KEY `carton_headerI8` (`confirm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='包件单表头';

-- ----------------------------
-- Table structure for carton_temp_detail
-- ----------------------------
DROP TABLE IF EXISTS `carton_temp_detail`;
CREATE TABLE `carton_temp_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) DEFAULT NULL COMMENT '订单id',
  `pick_list_id` bigint(11) DEFAULT NULL COMMENT '下架单id',
  `carton_item_seq` int(11) DEFAULT NULL COMMENT '明细号',
  `upc_no` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku_id` bigint(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `qc_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次号',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_date` datetime DEFAULT NULL COMMENT '创建日期',
  `inv_type` int(11) DEFAULT NULL COMMENT '商品库存类型',
  `shelf_life_days` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15814 DEFAULT CHARSET=utf8 COMMENT='为组包明细表';

-- ----------------------------
-- Table structure for country_code
-- ----------------------------
DROP TABLE IF EXISTS `country_code`;
CREATE TABLE `country_code` (
  `country_code_id` int(11) NOT NULL,
  `country_code` varchar(16) DEFAULT NULL,
  `country_name` varchar(128) DEFAULT NULL COMMENT '国家名',
  PRIMARY KEY (`country_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国家编码';

-- ----------------------------
-- Table structure for cycle_count_detail
-- ----------------------------
DROP TABLE IF EXISTS `cycle_count_detail`;
CREATE TABLE `cycle_count_detail` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '盘点单号',
  `order_line_no` int(11) NOT NULL COMMENT '盘点分录序号',
  `loc_id` int(11) DEFAULT NULL,
  `bin_loc_id` int(11) NOT NULL,
  `wms_inv_id` int(11) DEFAULT NULL COMMENT 'WMS 库存项',
  `sku_id` int(11) NOT NULL,
  `lot` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `oh1_qty` int(11) DEFAULT NULL COMMENT '实物盘点时数据库库存',
  `cc1_qty` int(11) DEFAULT NULL COMMENT '一次盘点盘点数量',
  `cfm1_qty` int(11) DEFAULT NULL COMMENT '纸质一盘，复核数量',
  `damage_qty` int(11) DEFAULT NULL COMMENT '残损数量',
  `oh2_qty` int(11) DEFAULT NULL COMMENT '二次盘点时，实物数据库库存',
  `cc2_qty` int(11) DEFAULT NULL COMMENT '二次盘点时，盘点数量',
  `cfm2_qty` int(11) DEFAULT NULL COMMENT '纸质二盘，复核数量',
  `oh3_qty` int(11) DEFAULT NULL COMMENT '3次盘点实物数据库库存',
  `cc3_qty` int(11) DEFAULT NULL COMMENT '3次盘点，盘点数量',
  `cfm3_qty` int(11) DEFAULT NULL COMMENT '纸质三盘，复核数量',
  `to_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '后续处理：生成新盘点单，或者生成损益单',
  `to_bill_no` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生成新盘点单，或者生成损益单编号',
  `to_bill_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型：1盘点单 2损益单 3合并盘点单',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '盘点人、纸质盘点数量录入人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '盘点时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_item_id`),
  KEY `cycle_count_detailI1` (`order_id`) USING BTREE,
  KEY `cycle_count_detailI2` (`wms_inv_id`) USING BTREE,
  KEY `idx_sku_id_loc_id` (`sku_id`,`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=498366 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for cycle_count_header
-- ----------------------------
DROP TABLE IF EXISTS `cycle_count_header`;
CREATE TABLE `cycle_count_header` (
  `order_id` int(11) NOT NULL COMMENT '盘点单号',
  `order_no` varchar(30) NOT NULL COMMENT '订单编号',
  `loc_id` int(11) NOT NULL COMMENT 'warehouse 编号',
  `zone_id` int(11) NOT NULL COMMENT '库区ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID， 写死就叫春播',
  `source_order_id` bigint(20) DEFAULT NULL COMMENT '记录来源申请单ID',
  `source_order_no` varchar(32) DEFAULT NULL COMMENT '记录来源申请单编号',
  `source_order_type` int(11) DEFAULT NULL COMMENT '记录来源申请单类型',
  `cc_type` int(11) DEFAULT NULL COMMENT '1.流动盘点 3.订单报缺 7.静态盘点-纸质 8.静态盘点-RF',
  `cc_times` tinyint(2) NOT NULL DEFAULT '0' COMMENT '盘点次数：1一盘 2二盘 3三盘',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '盘点单状态：0新建 1进行中 2已完成',
  `total_on_hand` int(11) NOT NULL COMMENT '账面汇总数a',
  `total_cnt` int(11) NOT NULL COMMENT '总品种数',
  `total_1st_cc_qty` int(11) DEFAULT NULL COMMENT '一盘盘点数量',
  `total_1st_discrep_qty` int(11) DEFAULT NULL COMMENT ' 一盘残损数量',
  `entry_id` int(11) DEFAULT NULL COMMENT '盘点人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `cc1_entry_id` int(11) DEFAULT NULL COMMENT '一次盘点人',
  `cc1_entry_date` datetime DEFAULT NULL COMMENT '一次盘点时间',
  `cc1_confirm_id` int(11) DEFAULT NULL COMMENT '一次盘点确认人',
  `cc2_flag` char(1) DEFAULT NULL COMMENT '如果一次盘点没有差异，标示为N， 如果有差异为Y',
  `cc2_entry_date` datetime DEFAULT NULL COMMENT '二次盘点时间',
  `cc2_confirm_id` int(11) DEFAULT NULL COMMENT '二次盘点确认人',
  `cc3_flag` char(1) DEFAULT NULL COMMENT '三次盘点标示',
  `cc3_entry_date` datetime DEFAULT NULL COMMENT '三次盘点时间',
  `cc3_confirm_id` int(11) DEFAULT NULL COMMENT '三次盘点确认人',
  `bin_loc_cnt` int(11) DEFAULT NULL,
  `execute_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务执行人',
  `execute_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务执行时间',
  `finish_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '完成人',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '完成时间',
  `input_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '纸质盘点录入人',
  `input_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '纸质盘点录入时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `cycle_count_orderI1` (`order_no`) USING BTREE,
  KEY `cycle_count_orderI2` (`entry_datetime`) USING BTREE,
  KEY `cycle_count_headerI4` (`loc_id`,`zone_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cycle_count_request
-- ----------------------------
DROP TABLE IF EXISTS `cycle_count_request`;
CREATE TABLE `cycle_count_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'wareId+yyyy-MM-dd-hh-mm-ss+毫秒位',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT 'warehouse 编号',
  `cc_type` int(11) NOT NULL DEFAULT '0' COMMENT '7.静态盘点-纸质 8.静态盘点-RF',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=718 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='盘点任务申请表';

-- ----------------------------
-- Table structure for cycle_count_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `cycle_count_request_detail`;
CREATE TABLE `cycle_count_request_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '库区id',
  `zone_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '库区名称',
  `from_aisle` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '起始巷道',
  `from_bay` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '起始编号',
  `from_bin_loc_no` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '起始货位',
  `to_aisle` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '终止巷道',
  `to_bay` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '终止编号',
  `to_bin_loc_no` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '终止货位',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01',
  PRIMARY KEY (`id`),
  KEY `idx_request_id` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=776 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='盘点任务申请明细表';

-- ----------------------------
-- Table structure for dn_sorting_data
-- ----------------------------
DROP TABLE IF EXISTS `dn_sorting_data`;
CREATE TABLE `dn_sorting_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预分拣组件id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `site_short_code` varchar(24) NOT NULL COMMENT '站点简码',
  `site_name` varchar(32) NOT NULL DEFAULT '' COMMENT '站点名称',
  `site_area_code` varchar(24) NOT NULL DEFAULT '' COMMENT '小件员片区号',
  `first_rdc_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT '始发分拔简码',
  `end_rdc_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT '目的分拔简码',
  `first_chute_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT '始发分拨滑道号',
  `end_chute_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT '目的分拔滑道号',
  `cp_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT 'CP简码',
  `city_short_code` varchar(16) NOT NULL DEFAULT '' COMMENT '城市简码',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10230 DEFAULT CHARSET=utf8 COMMENT='丹鸟预分拣信息';

-- ----------------------------
-- Table structure for erp_trans_type
-- ----------------------------
DROP TABLE IF EXISTS `erp_trans_type`;
CREATE TABLE `erp_trans_type` (
  `trans_type` int(11) NOT NULL,
  `on_hand_factor` int(11) DEFAULT NULL COMMENT '1:=; -1:-; 0: 没影响',
  `alloc_factor` int(11) DEFAULT NULL,
  `lock_factor` int(11) DEFAULT NULL,
  `on_order_factor` int(11) DEFAULT NULL,
  `intran_in_factor` int(11) DEFAULT NULL,
  `intran_out_factor` int(11) DEFAULT NULL,
  `wip_factor` int(11) DEFAULT NULL,
  `trans_disc` varchar(100) DEFAULT NULL,
  UNIQUE KEY `erp_trans_typeI1` (`trans_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hotsku_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `hotsku_group_detail`;
CREATE TABLE `hotsku_group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '热销商品组合id',
  `sku_name` varchar(64) DEFAULT NULL,
  `sku_id` bigint(11) DEFAULT NULL COMMENT '商品skuid',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4936 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hotsku_group_header
-- ----------------------------
DROP TABLE IF EXISTS `hotsku_group_header`;
CREATE TABLE `hotsku_group_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(128) DEFAULT NULL COMMENT '热销商品组合名称',
  `qc_weight` int(11) DEFAULT NULL COMMENT '0质检不称重 1质检称重',
  `status` int(11) DEFAULT '0' COMMENT '0存盘 1启用 2停用',
  `weight` float DEFAULT NULL COMMENT '重量',
  `entry_name` varchar(24) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `start_name` varchar(24) DEFAULT NULL COMMENT '启用人',
  `start_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `stop_name` varchar(24) DEFAULT NULL COMMENT '停用人',
  `stop_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  `total_cnt` int(11) DEFAULT NULL COMMENT '组合总数量',
  `total_qty` int(11) DEFAULT NULL COMMENT '组合商品总数量',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hotsku_lot_detail
-- ----------------------------
DROP TABLE IF EXISTS `hotsku_lot_detail`;
CREATE TABLE `hotsku_lot_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '作业单',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '原订单',
  `box_id` bigint(11) DEFAULT NULL COMMENT '箱子编号',
  `status` int(11) DEFAULT NULL COMMENT '4拣货完成5质检完成6称重完成7批次交接',
  `order_cnt` int(11) DEFAULT NULL COMMENT '该批次订单数',
  `batch` varchar(20) DEFAULT NULL,
  `qc_datetime` timestamp NULL DEFAULT '1970-01-01 08:00:01',
  `hotsku_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotsku_lot_detailI1` (`order_id`),
  KEY `hotsku_lot_detailI2` (`parent_order_id`),
  KEY `hotsku_lot_detailI3` (`box_id`),
  KEY `hotsku_lot_detailI4` (`hotsku_id`),
  KEY `hotsku_lot_detailI` (`batch`)
) ENGINE=InnoDB AUTO_INCREMENT=687514 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hotsku_lot_header
-- ----------------------------
DROP TABLE IF EXISTS `hotsku_lot_header`;
CREATE TABLE `hotsku_lot_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(20) DEFAULT NULL COMMENT '批次4为流水',
  `order_cnt` int(11) DEFAULT NULL COMMENT '该批次订单数',
  `status` int(11) DEFAULT NULL COMMENT '批次状态3汇总完成5质检完成6称重完成7批次交接',
  `hotsku_group_id` int(11) DEFAULT NULL COMMENT '热销商品组合id',
  `pick_list_id` int(11) DEFAULT '0' COMMENT '拣货任务id',
  `hz_datetime` datetime DEFAULT NULL COMMENT '汇总时间',
  `hz_name` varchar(24) DEFAULT NULL COMMENT '汇总人',
  `qc_start_datetime` datetime DEFAULT NULL COMMENT '质检开始时间',
  `qc_end_datetime` datetime DEFAULT NULL COMMENT '质检结束时间',
  `qc_name` varchar(24) DEFAULT NULL COMMENT '质检人',
  `hotsku_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotsku_lot_headerI1` (`hotsku_id`) USING BTREE,
  KEY `hotsku_lot_headerI2` (`pick_list_id`),
  KEY `hotsku_lot_headerI3` (`hotsku_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32582 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for inbound_detail
-- ----------------------------
DROP TABLE IF EXISTS `inbound_detail`;
CREATE TABLE `inbound_detail` (
  `order_line_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(11) NOT NULL COMMENT '订单id--WMS订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品数量（通知数量）',
  `rec_qty` decimal(10,2) DEFAULT '0.00' COMMENT '收货数量',
  `discrep_qty` decimal(10,2) DEFAULT '0.00' COMMENT '差异数量',
  `unit_cost` decimal(32,8) DEFAULT NULL COMMENT '成本',
  `entry_datetime` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '制单人',
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `is_presale` smallint(6) DEFAULT '0' COMMENT '是否预售 0否 1是',
  `is_gift` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否赠品  1是0否',
  PRIMARY KEY (`order_line_id`),
  UNIQUE KEY `inbound_detailI1` (`order_id`,`order_line_no`) USING BTREE,
  KEY `inbound_detailI2` (`entry_datetime`) USING BTREE,
  KEY `inbound_detailI3` (`sku_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2166310 DEFAULT CHARSET=utf8 COMMENT='WMS 订单分录表';

-- ----------------------------
-- Table structure for inbound_order
-- ----------------------------
DROP TABLE IF EXISTS `inbound_order`;
CREATE TABLE `inbound_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS orderId',
  `order_no` bigint(20) NOT NULL,
  `oms_porder_sn` varchar(50) NOT NULL,
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `order_status` int(11) DEFAULT NULL COMMENT '状态: 到货登记:7, 品控质检8, 开始收货:9, 关闭:10',
  `acct_id` int(11) DEFAULT NULL COMMENT '供应商',
  `acct_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '库房名称',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递',
  `carrier_name` varchar(100) DEFAULT NULL,
  `total_sku_cnt` int(11) DEFAULT NULL COMMENT '通知品种数',
  `total_qty` decimal(10,2) DEFAULT '0.00' COMMENT '通知订单数',
  `inform_date` datetime DEFAULT NULL COMMENT '通知日期',
  `sign_date` datetime DEFAULT NULL,
  `sign_id` int(11) DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL COMMENT '质检日期',
  `qc_id` int(11) DEFAULT NULL COMMENT '品控质检人',
  `qc_name` varchar(32) DEFAULT NULL,
  `rec_date` datetime DEFAULT NULL COMMENT '收货日期',
  `rec_id` int(11) DEFAULT NULL COMMENT '收货人',
  `rec_name` varchar(32) DEFAULT NULL COMMENT '收货人名称',
  `putaway_date` datetime DEFAULT NULL,
  `putaway_id` int(11) DEFAULT NULL COMMENT '上架人',
  `comments` varchar(250) DEFAULT NULL,
  `qc_comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `close_date` datetime DEFAULT NULL,
  `close_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '进入WMS日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '制单人',
  `emp_name` varchar(20) DEFAULT NULL COMMENT '采购员',
  `cross_dock` int(11) DEFAULT '0' COMMENT '是否转运：1转运， 0，正常PO',
  `to_loc_id` int(11) DEFAULT NULL COMMENT '转运真实收货仓库ID',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '转运真实收货仓库名称',
  `from_province` varchar(20) DEFAULT NULL COMMENT '发货省',
  `to_province` varchar(20) DEFAULT NULL COMMENT '收货省',
  `is_pick_up` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否自提,0:不自提,1:自提',
  `emp_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '采购员ID',
  `emp_mail` varchar(32) NOT NULL DEFAULT '' COMMENT '采购员邮箱',
  `arrival_temperature` decimal(5,2) DEFAULT NULL COMMENT '到货温度',
  `arrival_temperature2` varchar(20) NOT NULL DEFAULT '' COMMENT '到货温度2',
  `contain_gift` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否包含赠品 0否1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fid_UNIQUE` (`order_id`) USING BTREE,
  KEY `Iinbound_orderI1` (`order_no`,`order_type`) USING BTREE,
  KEY `Iinbound_orderI2` (`rec_date`) USING BTREE,
  KEY `Iinbound_orderI3` (`loc_id`) USING BTREE,
  KEY `Iinbound_orderI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=487134 DEFAULT CHARSET=utf8 COMMENT='WMS 订单分录表';

-- ----------------------------
-- Table structure for inbound_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `inbound_order_cancel`;
CREATE TABLE `inbound_order_cancel` (
  `order_cancel_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `order_id` bigint(20) DEFAULT NULL COMMENT '采购订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `status` int(11) DEFAULT NULL COMMENT '0:新增,1,确定',
  `cancel_source` varchar(32) DEFAULT NULL COMMENT '取消来源',
  `cancel_cause` varchar(128) DEFAULT NULL COMMENT '取消原因',
  `entry_id` int(11) DEFAULT NULL COMMENT '操作人',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `loc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_cancel_id`),
  UNIQUE KEY `inbound_order_canelI1` (`order_id`,`order_type`) USING BTREE,
  KEY `inbound_order_cancelI2` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82552 DEFAULT CHARSET=utf8 COMMENT='WMS 采购单取消表';

-- ----------------------------
-- Table structure for inbound_report_record
-- ----------------------------
DROP TABLE IF EXISTS `inbound_report_record`;
CREATE TABLE `inbound_report_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `report_date` date NOT NULL COMMENT '统计的是哪天的报表',
  `order_id` bigint(11) NOT NULL COMMENT '采购单id',
  `loc_id` int(11) NOT NULL COMMENT '库房id',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '库房名称',
  `recv_id` bigint(20) NOT NULL COMMENT '质检批id',
  `used_time` decimal(4,2) NOT NULL COMMENT '质检确认到上架完成使用的时间 单位h',
  `entry_datetime` datetime NOT NULL COMMENT '生成记录的时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_iidx` (`order_id`,`recv_id`) USING BTREE,
  KEY `report_didx` (`report_date`) USING BTREE,
  KEY `userd_tidx` (`used_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=629298 DEFAULT CHARSET=utf8 COMMENT='采购单质检确认到上架完成报表记录';

-- ----------------------------
-- Table structure for inbound_status
-- ----------------------------
DROP TABLE IF EXISTS `inbound_status`;
CREATE TABLE `inbound_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '采购订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型, 为扩展使用',
  `order_status` int(11) DEFAULT NULL COMMENT '状态流水',
  `status_disc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '订单状态介绍',
  `entry_datetime` datetime DEFAULT NULL COMMENT '第一次新增时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要同步: 1需要, 0不需要',
  `return_status` int(11) DEFAULT NULL COMMENT 'ERP返回状态: 1成功, -1失败',
  `return_cause` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ERP返回错误信息',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后一次上传日期',
  `sku_qty` int(11) DEFAULT '0' COMMENT '收货数量',
  PRIMARY KEY (`id`),
  KEY `inbound_statusI1` (`order_id`,`order_type`) USING BTREE,
  KEY `Iinbound_statusI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=867888 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `invoice_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(11) NOT NULL COMMENT 'OMS invoiceID',
  `invoice_content` varchar(255) DEFAULT NULL COMMENT '发票内容 (发票项;单位;数量,单价;金额.以;分隔)',
  `unit` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit_price` decimal(16,4) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`invoice_item_id`),
  KEY `invoice_detailI1` (`invoice_id`) USING BTREE,
  KEY `invoice_detailI2` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=856306 DEFAULT CHARSET=utf8 COMMENT='WMS 订单系统发票表';

-- ----------------------------
-- Table structure for invoice_header
-- ----------------------------
DROP TABLE IF EXISTS `invoice_header`;
CREATE TABLE `invoice_header` (
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `wms_invoice_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID, 无意义, 为复制使用',
  `invoice_id` bigint(11) DEFAULT NULL,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS拆单之前订单ID',
  `invoice_real_order_id` bigint(11) DEFAULT NULL COMMENT '对于宅配业务, 发票上打印的真实发票号',
  `order_type` int(11) DEFAULT NULL COMMENT 'OMS订单类型',
  `invoice_type` smallint(6) DEFAULT NULL COMMENT '1:普通，2:增值，3:电子等',
  `invoice_maker` varchar(50) DEFAULT NULL COMMENT '开票单位',
  `invoice_title` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(255) DEFAULT NULL COMMENT '发票内容 (发票项;单位;数量,单价;金额.以;分隔)',
  `status` int(11) DEFAULT NULL,
  `status_discrep` varchar(20) DEFAULT NULL,
  `sys_invoice_no` varchar(50) DEFAULT NULL,
  `real_invoice_no` varchar(50) DEFAULT NULL,
  `invoice_amount` decimal(16,4) DEFAULT NULL,
  `invoice_amount_cap` varchar(102) DEFAULT NULL,
  `tax_rate` decimal(16,4) DEFAULT NULL,
  `promo_amount` decimal(16,4) DEFAULT NULL,
  `gift_card` decimal(16,4) DEFAULT NULL,
  `coupons_amount` decimal(16,4) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `entry_name` varchar(36) DEFAULT NULL COMMENT '打印人',
  `member_point_price` decimal(16,4) DEFAULT NULL COMMENT '积分卡金额',
  `account_money` decimal(16,4) DEFAULT NULL COMMENT '账户余额',
  `return_status` int(11) DEFAULT NULL COMMENT '系统上传状态:1成功, 0失败, null 新增',
  `return_msg` varchar(255) DEFAULT NULL COMMENT '上传返回错误信息',
  `return_date` datetime DEFAULT NULL COMMENT '返回日期',
  `print_date` datetime DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`wms_invoice_id`),
  UNIQUE KEY `invoice_headerI3` (`invoice_id`) USING BTREE,
  KEY `invoice_headerI1` (`real_invoice_no`) USING BTREE,
  KEY `invoice_headerI2` (`entry_date`) USING BTREE,
  KEY `invoice_headerI4` (`order_id`) USING BTREE,
  KEY `invoice_headerI5` (`invoice_real_order_id`) USING BTREE,
  KEY `invoice_headerI6` (`entry_name`) USING BTREE,
  KEY `invoice_headerI7` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=856304 DEFAULT CHARSET=utf8 COMMENT='WMS 订单系统发票表';

-- ----------------------------
-- Table structure for invoice_order_usage
-- ----------------------------
DROP TABLE IF EXISTS `invoice_order_usage`;
CREATE TABLE `invoice_order_usage` (
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `invoice_usage_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) DEFAULT NULL COMMENT 'OMS 发票ID',
  `order_id` bigint(11) DEFAULT NULL COMMENT 'OMS orderId',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单未拆单之前订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型, 来源于sales_order.order_type',
  `invoice_num` int(11) DEFAULT NULL COMMENT '发票流水号',
  `invoice_no` varchar(50) NOT NULL COMMENT '发票号',
  `status` smallint(6) NOT NULL COMMENT '1: 使用, 2作废',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改人ID',
  `update_user_name` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `last_send_date` datetime DEFAULT NULL,
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态:1成功',
  `error_code` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `response_date` datetime DEFAULT NULL COMMENT '作废信息',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单ID',
  `box_no` varchar(32) DEFAULT NULL COMMENT '包件单编号',
  PRIMARY KEY (`invoice_usage_id`),
  UNIQUE KEY `invoice_order_usageI2` (`invoice_id`) USING BTREE,
  KEY `invoice_order_usageI1` (`order_id`,`order_type`) USING BTREE,
  KEY `invoice_order_usageI3` (`invoice_no`) USING BTREE,
  KEY `invoice_order_usageI4` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=285668 DEFAULT CHARSET=utf8 COMMENT='WMS 发票订单使用表';

-- ----------------------------
-- Table structure for invoice_usage_log
-- ----------------------------
DROP TABLE IF EXISTS `invoice_usage_log`;
CREATE TABLE `invoice_usage_log` (
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `invoice_log_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoice_usage_id` bigint(20) NOT NULL COMMENT '订单使用情况ID',
  `invoice_id` bigint(20) DEFAULT NULL COMMENT 'OMS 发票ID',
  `order_id` bigint(11) DEFAULT NULL COMMENT 'OMS orderId',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单未拆单之前订单ID',
  `order_type` int(11) DEFAULT NULL,
  `invoice_num_old` int(11) DEFAULT NULL,
  `invoice_no_old` varchar(50) DEFAULT NULL,
  `status_old` smallint(6) DEFAULT NULL COMMENT '1: 使用, 2作废',
  `invoice_num_new` int(11) DEFAULT NULL,
  `invoice_no_new` varchar(50) DEFAULT NULL,
  `status_new` smallint(6) DEFAULT NULL COMMENT '1: 使用, 2作废',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_log_id`),
  KEY `invoice_usage_logI1` (`order_id`,`order_type`) USING BTREE,
  KEY `invoice_usage_logI2` (`invoice_usage_id`) USING BTREE,
  KEY `invoice_usage_logI3` (`invoice_no_old`) USING BTREE,
  KEY `invoice_usage_logI4` (`invoice_no_new`) USING BTREE,
  KEY `invoice_usage_logI5` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=288446 DEFAULT CHARSET=utf8 COMMENT='WMS 发票订单使用记录表';

-- ----------------------------
-- Table structure for invoice_useless
-- ----------------------------
DROP TABLE IF EXISTS `invoice_useless`;
CREATE TABLE `invoice_useless` (
  `invoice_useless_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `invoice_num` int(11) DEFAULT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `status` smallint(6) NOT NULL COMMENT '1: 使用, 2作废',
  `void_id` int(11) DEFAULT NULL COMMENT '作废人',
  `void_name` varchar(32) DEFAULT NULL COMMENT '作废人名称',
  `void_datetime` datetime DEFAULT NULL COMMENT '作废时间',
  `void_return_status` int(11) DEFAULT NULL COMMENT '作废返回状态',
  `void_error_code` varchar(255) DEFAULT NULL COMMENT '作废返回错误信息',
  `void_response_date` datetime DEFAULT NULL COMMENT '作废响应时间',
  `void_type` varchar(100) DEFAULT NULL COMMENT '作废类型',
  `void_comments` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`invoice_useless_id`),
  KEY `invoice_uselessI1` (`invoice_no`) USING BTREE,
  KEY `invoice_uselessI2` (`void_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14500 DEFAULT CHARSET=utf8 COMMENT='WMS 发票作废记录表';

-- ----------------------------
-- Table structure for inv_tran
-- ----------------------------
DROP TABLE IF EXISTS `inv_tran`;
CREATE TABLE `inv_tran` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `trans_id` bigint(20) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `inv_type` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `trans_qty` decimal(10,2) DEFAULT '0.00' COMMENT '数量',
  `origin_num` decimal(10,2) DEFAULT '0.00' COMMENT '原始单据数',
  `left_num` decimal(10,2) DEFAULT '0.00' COMMENT '剩余数',
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
  `loc_id_2nd` int(11) DEFAULT NULL COMMENT '发货事务：收货仓库， 收货事务：发货仓库',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '发货仓库ID，只有调拨使用',
  `to_loc_id` int(11) DEFAULT NULL COMMENT '收获仓库ID， 只有调拨使用',
  `freezing` smallint(6) DEFAULT NULL COMMENT '1:frozen, 0 no-frozen ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_tranIunique` (`trans_id`) USING BTREE,
  KEY `inv_tranI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `inv_tranI3` (`entry_datetime`) USING BTREE,
  KEY `inv_tranI4` (`src_bill_id`) USING BTREE,
  KEY `inv_tranI1` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129892346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label_print_logs
-- ----------------------------
DROP TABLE IF EXISTS `label_print_logs`;
CREATE TABLE `label_print_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `copies` int(11) DEFAULT NULL COMMENT '打印份数',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `label_print_logsI1` (`sku_id`),
  KEY `label_print_logsI2` (`entry_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1777502 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lot_invs
-- ----------------------------
DROP TABLE IF EXISTS `lot_invs`;
CREATE TABLE `lot_invs` (
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID    PK',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `inv_type` varchar(30) DEFAULT NULL COMMENT '货物属性',
  `lot` varchar(50) DEFAULT NULL COMMENT '批次     PK---同一批次，生产日期，保质期天数，失效日期应该是一样的，等待和用户确认',
  `expire_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `on_hand_qty` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lot_logs
-- ----------------------------
DROP TABLE IF EXISTS `lot_logs`;
CREATE TABLE `lot_logs` (
  `lot_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL,
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '批次编号',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `expire_date` datetime DEFAULT NULL COMMENT '失效日期',
  `shelf_life` int(11) DEFAULT NULL COMMENT '保质期天数',
  `shelf_life_unit` varchar(11) DEFAULT NULL COMMENT '保质期单位',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_date` datetime DEFAULT NULL COMMENT '创建日期',
  `order_id` int(11) DEFAULT NULL COMMENT '采购订单ID',
  `recv_id` int(11) DEFAULT NULL COMMENT '收货单ID',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`lot_log_id`),
  UNIQUE KEY `lot_logI1` (`sku_id`,`lot`,`loc_id`) USING BTREE,
  KEY `lot_logI2` (`entry_date`) USING BTREE,
  KEY `lot_logI3` (`expire_date`) USING BTREE,
  KEY `lot_logsI4` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1620448 DEFAULT CHARSET=utf8 COMMENT='批次记录信息表';

-- ----------------------------
-- Table structure for material_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `material_box_detail`;
CREATE TABLE `material_box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单id',
  `box_seq_no` int(11) DEFAULT NULL COMMENT '包件单明细分录号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `qc_qty` int(20) DEFAULT NULL COMMENT '质检数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=870286 DEFAULT CHARSET=utf8 COMMENT='领用包件单明细表';

-- ----------------------------
-- Table structure for material_box_header
-- ----------------------------
DROP TABLE IF EXISTS `material_box_header`;
CREATE TABLE `material_box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `box_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '包件单编号',
  `order_id` bigint(11) DEFAULT NULL COMMENT '领用单ID',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `pos_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POS 台号',
  `container_id` int(11) DEFAULT NULL COMMENT '货容器编号',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `status` int(11) DEFAULT NULL COMMENT '包件单状态: 0:新增， 1： 质检确认2：交接出库',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '商品品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `actual_weight` decimal(32,8) DEFAULT NULL COMMENT '实际重量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `confirm_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认人名称',
  `ship_datetime` datetime DEFAULT NULL COMMENT '发出时间',
  `ship_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发出人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `track_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_box_headerI1` (`box_id`),
  UNIQUE KEY `material_box_headerI2` (`box_no`),
  KEY `material_box_headerI3` (`order_id`),
  KEY `material_box_headerI6` (`pick_list_id`),
  KEY `material_box_headerI7` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=399904 DEFAULT CHARSET=utf8 COMMENT='领用包件单表头';

-- ----------------------------
-- Table structure for material_box_unpack_detail
-- ----------------------------
DROP TABLE IF EXISTS `material_box_unpack_detail`;
CREATE TABLE `material_box_unpack_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) DEFAULT NULL COMMENT '领用单ID',
  `pick_list_id` bigint(11) DEFAULT NULL COMMENT '下架单id',
  `upc_no` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku_id` bigint(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `qc_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `pick_qty` int(11) DEFAULT NULL COMMENT '拣货数量',
  `status` varchar(2) DEFAULT NULL COMMENT '状态 1:等待质检 2:质检完成',
  `inqc_qty` int(11) DEFAULT NULL COMMENT '当前质检数量',
  `rf_worker_name` varchar(30) DEFAULT NULL COMMENT '拣货人名称',
  `is_post` varchar(2) DEFAULT NULL COMMENT '是否属于质检未组包的 0没有质检 1:存在已质检的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=698746 DEFAULT CHARSET=utf8 COMMENT='领用未组包明细表';

-- ----------------------------
-- Table structure for material_import_tms_que
-- ----------------------------
DROP TABLE IF EXISTS `material_import_tms_que`;
CREATE TABLE `material_import_tms_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL COMMENT '领用单ID',
  `async_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_idx` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52050 DEFAULT CHARSET=utf8 COMMENT='WMS 订单同步到TMS队列表';

-- ----------------------------
-- Table structure for material_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `material_order_delivery`;
CREATE TABLE `material_order_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '领用单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `service_id` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '使用配送服务ID（SF, HG, RFD）',
  `ship_to_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人',
  `ship_to_account` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人账号',
  `ship_to_phone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人手机',
  `ship_to_addr` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '收货地址',
  `ship_to_province` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货省名称',
  `ship_to_city` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货市 名称',
  `ship_to_district` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货区名称',
  `ship_to_fourthaddr` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货4级地址名称',
  `shipment_spot_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送站id-助记码',
  `shipment_spot_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送站名称',
  `delivery_requirement` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '送货要求',
  `delivery_type` int(11) NOT NULL DEFAULT '3' COMMENT '配送方式：1：工作日3随时送（次日达） 4定时达 5极速达 ',
  `delivery_from_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送开始时间',
  `delivery_to_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送结束时间',
  `book_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '预约送货日期',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `track_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '获取运单号类型:1TMS 获取运单号;2WMS获取运单号;3快递系统获取运单号',
  `point_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1需要获取配送站点;0不需要获取配送站点',
  `ship_service` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送服务类型',
  `pay_method` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '付款方式 如:寄付月结',
  `destination_code` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目的地编码',
  `source_code` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '来源地编码',
  `month_account_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '月结账号',
  `sorting_code` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分拣码',
  `two_Dimension_Code` varchar(600) COLLATE utf8_bin DEFAULT NULL COMMENT 'sf中转分拣用二维码',
  `dest_Route_Label` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'sf路由信息：目的中转场代码+目的地网点代码',
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`) USING BTREE,
  KEY `create_date_idx` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59152 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='领用单配送信息';

-- ----------------------------
-- Table structure for material_order_profiles
-- ----------------------------
DROP TABLE IF EXISTS `material_order_profiles`;
CREATE TABLE `material_order_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) NOT NULL COMMENT '领用单id',
  `prof_cat` varchar(16) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(64) NOT NULL DEFAULT '' COMMENT '属性字段',
  `prof_i` bigint(20) NOT NULL DEFAULT '0' COMMENT '整型属性值',
  `prof_c` varchar(128) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55508 DEFAULT CHARSET=utf8 COMMENT='领用单属性表';

-- ----------------------------
-- Table structure for material_req_cancel
-- ----------------------------
DROP TABLE IF EXISTS `material_req_cancel`;
CREATE TABLE `material_req_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `cancel_cause` varchar(32) DEFAULT NULL COMMENT '取消原因',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(20) DEFAULT NULL COMMENT '创建人',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `material_req_cancelI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4284 DEFAULT CHARSET=utf8 COMMENT='领用单取消表';

-- ----------------------------
-- Table structure for material_req_detail
-- ----------------------------
DROP TABLE IF EXISTS `material_req_detail`;
CREATE TABLE `material_req_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '领用单id',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品SKU',
  `lot` varchar(255) DEFAULT NULL COMMENT '批次',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '保质期',
  `shelf_life_days` int(255) DEFAULT NULL COMMENT '保质期天数',
  `order_line_no` int(11) DEFAULT NULL,
  `sku_code` varchar(255) DEFAULT NULL,
  `sku_name` varchar(255) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL COMMENT '单位id',
  `unit_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `order_qty` int(11) DEFAULT NULL COMMENT '申请数量',
  `box_std` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `ship_qty` int(11) DEFAULT NULL COMMENT '出库数量',
  `comments` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `material_req_detailI1` (`order_id`),
  KEY `material_req_detailI2` (`sku_id`,`lot`)
) ENGINE=InnoDB AUTO_INCREMENT=723572 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for material_req_order
-- ----------------------------
DROP TABLE IF EXISTS `material_req_order`;
CREATE TABLE `material_req_order` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(32) DEFAULT NULL COMMENT '领用单编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '领用单id',
  `loc_id` int(32) DEFAULT NULL COMMENT '仓库id',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '仓库名称',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `use_type` smallint(11) DEFAULT NULL COMMENT '领用类型',
  `sku_qty` int(11) DEFAULT NULL COMMENT '申请数量',
  `ship_qty` int(11) DEFAULT NULL COMMENT '出库占用数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库占用品种数量',
  `dept_id` int(11) DEFAULT NULL COMMENT '领用部门id',
  `dept_name` varchar(255) DEFAULT NULL COMMENT '领用部门名称',
  `usage_id` int(11) DEFAULT NULL COMMENT '用途id',
  `apply_name` varchar(255) DEFAULT NULL COMMENT '领用人',
  `sku_use_time` datetime DEFAULT NULL COMMENT '领用时间',
  `usage_name` varchar(255) DEFAULT NULL COMMENT '用途名称',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '领用商品批次规则，0最新批次1冻结批次2随机批次',
  `status` varchar(255) DEFAULT NULL COMMENT '状态0:新建 1：下架 2：出库 3:取消领用，8：系统报缺，11：已生成下架任务',
  `comments` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `shortage_use` smallint(11) DEFAULT NULL COMMENT '仓库实物缺货占用，1占用0不占用',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `pick_id` int(11) DEFAULT NULL COMMENT '下架操作人id',
  `pick_name` varchar(255) DEFAULT NULL COMMENT '下架操作人名称',
  `pick_datetime` datetime DEFAULT NULL COMMENT '下架时间',
  `ship_id` int(11) DEFAULT NULL COMMENT '出库操作人id',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库时间',
  `inv_type` int(11) DEFAULT NULL COMMENT '领用类型1正品2残品',
  `order_type` varchar(10) NOT NULL DEFAULT '' COMMENT '单据类型（委外加工领用-.）',
  `origin_code` varchar(10) NOT NULL DEFAULT '' COMMENT '加工商编码',
  `to_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '委外加工单-虚拟仓ID',
  `use_purpose` smallint(6) DEFAULT '0' COMMENT ' 2表示委外加工的领用单 1表示其他的领用单',
  `cancel_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '取消操作人名称',
  `cancel_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '取消时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_material_req_orderI` (`order_id`),
  KEY `material_req_orderI2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=155202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for material_req_status
-- ----------------------------
DROP TABLE IF EXISTS `material_req_status`;
CREATE TABLE `material_req_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `entry_name` varchar(20) DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态',
  `error_code` varchar(32) DEFAULT NULL COMMENT '错误信息',
  `last_send_time` datetime DEFAULT NULL COMMENT '最后响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '需要上传',
  `status_desc` varchar(32) DEFAULT NULL COMMENT '状态说明',
  PRIMARY KEY (`id`),
  KEY `material_req_statusi1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=576706 DEFAULT CHARSET=utf8 COMMENT='领用单状态表';

-- ----------------------------
-- Table structure for merge_package_opt
-- ----------------------------
DROP TABLE IF EXISTS `merge_package_opt`;
CREATE TABLE `merge_package_opt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `warm_box_id` bigint(20) NOT NULL COMMENT '保温箱ID',
  `station_seq` int(11) NOT NULL DEFAULT '0' COMMENT '站点编号',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_update_date` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8 COMMENT='合并包裹操作';

-- ----------------------------
-- Table structure for odometer
-- ----------------------------
DROP TABLE IF EXISTS `odometer`;
CREATE TABLE `odometer` (
  `odo_type` varchar(10) NOT NULL,
  `length` int(11) NOT NULL,
  `current_no` int(11) NOT NULL,
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`odo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_alloc_inv_que
-- ----------------------------
DROP TABLE IF EXISTS `order_alloc_inv_que`;
CREATE TABLE `order_alloc_inv_que` (
  `loc_id` int(11) NOT NULL COMMENT '库房ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` int(11) NOT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单ID',
  `status` int(11) DEFAULT NULL COMMENT '状态: 0, 新增, 1 分配成功, -1 分配失败',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期',
  `alloc_datetime` datetime DEFAULT NULL COMMENT '库存分配日期',
  `order_source` int(11) DEFAULT '0' COMMENT '订单来源 1006:零售仓',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号，每次更新时plus1',
  `ware_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '仓库类型：按照类型拆分定时任务',
  PRIMARY KEY (`order_id`,`order_type`),
  KEY `order_alloc_inv_queI1` (`entry_datetime`),
  KEY `order_alloc_inv_queI2` (`alloc_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_async_tasks
-- ----------------------------
DROP TABLE IF EXISTS `order_async_tasks`;
CREATE TABLE `order_async_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '订单ID',
  `task_type` smallint(6) NOT NULL DEFAULT '-1' COMMENT '任务类型:1',
  `bill_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '业务单据1：内部交易订单存采购单号',
  `async_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '同步时间',
  `async_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '同步状态 0:new, -1:failed, 1:success',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id_task_type` (`order_id`,`task_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8914210 DEFAULT CHARSET=utf8 COMMENT='订单同步队列表';

-- ----------------------------
-- Table structure for order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `order_cancel`;
CREATE TABLE `order_cancel` (
  `order_cancel_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS拆单之前的订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `status` int(11) DEFAULT NULL COMMENT '0:新增,1,确定(OMS确认可以取消)',
  `cancel_type` int(11) DEFAULT NULL COMMENT '0: 系统报缺, 1 实物报缺, 3. OMS取消',
  `cancel_source` varchar(32) DEFAULT NULL COMMENT '取消来源',
  `cancel_cause` varchar(128) DEFAULT NULL COMMENT '取消原因',
  `entry_id` int(11) DEFAULT NULL COMMENT '操作人',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `putaway_bill_id` int(11) DEFAULT NULL COMMENT '上架单ID',
  `recall` char(1) DEFAULT NULL COMMENT '是否拉回',
  `loc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_cancel_id`),
  UNIQUE KEY `order_canelI1` (`order_id`,`order_type`) USING BTREE,
  KEY `order_cancelI2` (`parent_order_id`) USING BTREE,
  KEY `order_cancelI3` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2719900 DEFAULT CHARSET=utf8 COMMENT='WMS 订单取消表';

-- ----------------------------
-- Table structure for order_collect_task_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_collect_task_queue`;
CREATE TABLE `order_collect_task_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_loc_id` int(11) DEFAULT '0' COMMENT '仓库ID',
  `ware_name` varchar(128) DEFAULT '' COMMENT '仓库名称',
  `order_id` bigint(11) DEFAULT '0' COMMENT '作业单ID',
  `parent_order_id` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `owner_id` int(11) DEFAULT '1' COMMENT '货主ID',
  `carrier_Id` int(11) DEFAULT '0' COMMENT '快递ID',
  `carrier_name` varchar(128) DEFAULT '' COMMENT '快递名称',
  `package_type` smallint(6) DEFAULT '1' COMMENT '包装类型:1.普通包装 2.环保包装',
  `groupon_flag` char(1) DEFAULT '' COMMENT '团购属性',
  `order_type` smallint(6) DEFAULT '0' COMMENT '订单类型',
  `invoice_flag` char(1) DEFAULT 'N' COMMENT '发票标志',
  `cod_flag` char(1) DEFAULT 'N' COMMENT 'COD标志',
  `delivery_date` int(11) DEFAULT '0' COMMENT '送货时间',
  `presell_flag` char(1) DEFAULT '' COMMENT '预售条件',
  `single_part_flag` char(1) DEFAULT '',
  `temp_area_id` int(11) DEFAULT '0' COMMENT '配送温区',
  `temp_area_name` varchar(20) NOT NULL DEFAULT '' COMMENT '配送温区名称',
  `group_id` int(11) DEFAULT '0' COMMENT '热销商品组合id，为0时不是热销商品作业单',
  `shipment_spot_name` varchar(128) DEFAULT '' COMMENT '配送站点',
  `delivery_from_time` datetime DEFAULT NULL COMMENT '期望配送时间始',
  `delivery_to_time` datetime DEFAULT NULL COMMENT '期望配送时间止',
  `sale_type` smallint(6) DEFAULT '0' COMMENT '业务类型',
  `payment_date` datetime DEFAULT NULL COMMENT '支付时间',
  `in_wms_date` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `order_cnt` int(11) DEFAULT '0' COMMENT '订单数量',
  `ship_to_addr` varchar(128) DEFAULT '' COMMENT '收货人地址',
  `ship_to_zip` varchar(32) DEFAULT '' COMMENT '收货人邮编',
  `ship_to_province` varchar(32) DEFAULT '' COMMENT '收货省份',
  `ship_to_city` varchar(32) DEFAULT '' COMMENT '收货城市',
  `ship_to_district` varchar(32) DEFAULT '' COMMENT '收货地区',
  `trade_message` varchar(255) DEFAULT '' COMMENT '交易留言',
  `order_status` smallint(6) DEFAULT '0' COMMENT '任务状态： 2：销售订单库存占用  3：销售订单汇总拣选',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '创建人员',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT '' COMMENT '修改人员',
  `total_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '作业单商品品总数',
  `total_qty` int(11) NOT NULL DEFAULT '0' COMMENT '作业单商品总数',
  `order_channel` smallint(6) NOT NULL DEFAULT '1' COMMENT '订单来源渠道',
  `repackable_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '独立成箱标识 0:非独立成箱;1:独立成箱',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源 1013:悦店订单',
  `pick_zone` varchar(128) NOT NULL DEFAULT '' COMMENT '拣选库区',
  `big_order_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '大作业单标识 0:普通作业单;1:大作业单',
  `cargo_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '多点订单集货位编号',
  `pick_bin_loc_zone` varchar(32) NOT NULL DEFAULT '',
  `book_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '订单履约日期',
  `vegetable_package_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '蔬菜补货合包标识 0:非蔬菜补货合包 1:蔬菜补货合包',
  `single_product_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '单品作业单标识 0:普通作业单;1:单品作业单',
  `green_channel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '绿色通道订单：0：否， 1：是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `collect_task_queueI1` (`order_id`),
  KEY `collect_task_queueI2` (`parent_order_id`),
  KEY `collect_task_queueI3` (`in_wms_date`),
  KEY `collect_task_queueI4` (`carrier_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=41340110 DEFAULT CHARSET=utf8 COMMENT='订单汇总任务表';

-- ----------------------------
-- Table structure for order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `order_delivery`;
CREATE TABLE `order_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递id',
  `carrier_name` varchar(100) DEFAULT NULL COMMENT '快递名称',
  `track_no` varchar(50) DEFAULT NULL COMMENT '运单号',
  `ship_service` varchar(16) DEFAULT NULL COMMENT '配送服务类型',
  `freight` decimal(32,8) DEFAULT NULL COMMENT '运费',
  `insured_cost` decimal(32,8) DEFAULT NULL COMMENT '保价费',
  `packing_cost` decimal(32,8) DEFAULT NULL COMMENT '包装费',
  `carrier_account` varchar(50) DEFAULT NULL COMMENT '月结账号',
  `pay_method` varchar(50) DEFAULT NULL COMMENT '付款方式 如：寄付月结',
  `destination_code` varchar(50) DEFAULT NULL COMMENT '目的地编码',
  `source_code` varchar(50) DEFAULT NULL COMMENT '来源地编码',
  `service_id` varchar(32) DEFAULT NULL COMMENT '使用配送服务ID（SF, HG, RFD）',
  `month_account_no` varchar(50) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `package_type` smallint(6) DEFAULT NULL COMMENT '包装类型:1.普通包装 2.环保包装',
  `e_mark` varchar(80) NOT NULL DEFAULT '' COMMENT '中通电子大头笔',
  `c_mark` varchar(80) NOT NULL DEFAULT '' COMMENT '中通快递普通大头笔',
  `delivery_type` smallint(6) DEFAULT NULL COMMENT '暂时留空',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0不合单 1：合单',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `dest_Route_Label` varchar(200) DEFAULT NULL COMMENT 'sf路由信息：目的中转场代码+目的地网点代码',
  `two_Dimension_Code` varchar(600) DEFAULT NULL COMMENT 'sf中转分拣用二维码',
  `green_channel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '绿色通道订单：0：否， 1：是',
  PRIMARY KEY (`id`),
  KEY `order_deliveryI1` (`order_id`),
  KEY `order_deliveryI2` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21763272 DEFAULT CHARSET=utf8 COMMENT='订单配送信息';

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_line_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(11) NOT NULL COMMENT 'WMS 订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单ID',
  `order_line_no` int(11) NOT NULL,
  `kit_line_no` int(11) DEFAULT NULL,
  `sku_id` int(11) NOT NULL,
  `sku_name2` varchar(128) DEFAULT NULL,
  `unit_id2` int(11) DEFAULT NULL,
  `unit_name2` varchar(10) DEFAULT NULL,
  `kit_sku_id` int(11) DEFAULT NULL,
  `sku_type` int(11) DEFAULT NULL COMMENT '类似零元购，加价购商品类型：1正常品， 2虚拟商品，3虚拟子商品',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_qty` int(11) DEFAULT NULL COMMENT '订单数量-包含赠品数量',
  `gift_qty` int(11) DEFAULT NULL COMMENT '赠品数量',
  `customise` varchar(255) DEFAULT NULL,
  `unit_cost` decimal(32,8) DEFAULT NULL,
  `sku_price` decimal(16,4) DEFAULT NULL COMMENT 'sku价格',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销单价',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '销售价',
  `member_points` int(11) DEFAULT NULL COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '客户积分金额',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品  1是0否',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券价格',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开发票金额',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '实付金额',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `gift_type` smallint(6) DEFAULT '0' COMMENT '赠品类型 赠品类型 0:普通品(非赠品) 1:促销赠品 2:市场赠品',
  `temp_area_id` int(11) DEFAULT NULL,
  `temp_area_name` varchar(30) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`order_line_id`),
  UNIQUE KEY `order_detailI1` (`order_id`,`order_line_no`) USING BTREE,
  KEY `order_detailI2` (`sku_id`) USING BTREE,
  KEY `order_detailI3` (`entry_datetime`) USING BTREE,
  KEY `order_detailI4` (`parent_order_id`) USING BTREE,
  KEY `order_detailI5` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96214450 DEFAULT CHARSET=utf8 COMMENT='WMS 订单分录表';

-- ----------------------------
-- Table structure for order_exception
-- ----------------------------
DROP TABLE IF EXISTS `order_exception`;
CREATE TABLE `order_exception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS order ID',
  `order_type` int(11) DEFAULT NULL COMMENT 'order type',
  `exception_type` smallint(6) DEFAULT NULL COMMENT '异常类型:1:系统报缺2.实物报缺',
  `exception` varchar(1000) DEFAULT NULL COMMENT '异常信息',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建ID',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要上传异常信息',
  `return_status` int(11) DEFAULT NULL COMMENT '''返回状态: 1 成功, 0 失败'',',
  `return_datetime` datetime DEFAULT NULL COMMENT '返回时间',
  `error_code` varchar(1000) DEFAULT NULL COMMENT '返回:错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后一次发送时间',
  PRIMARY KEY (`id`),
  KEY `order_exceptionI1` (`order_id`,`order_type`),
  KEY `order_exceptionI2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=140148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `order_extend_info`;
CREATE TABLE `order_extend_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `third_order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '三方单号',
  `group_order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '团购单号',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入WMS时间,创建时间',
  `promise_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单承诺日期用于计算结算单号',
  `settlement_number` varchar(50) NOT NULL DEFAULT '' COMMENT '结算单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10161008 DEFAULT CHARSET=utf8 COMMENT='订单扩展信息-新加订单字段往这个表放';

-- ----------------------------
-- Table structure for order_hand_over_attribute
-- ----------------------------
DROP TABLE IF EXISTS `order_hand_over_attribute`;
CREATE TABLE `order_hand_over_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) DEFAULT NULL,
  `field_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `field_value` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_hand_over_attribI1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_hand_over_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_hand_over_detail`;
CREATE TABLE `order_hand_over_detail` (
  `detail_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `hand_over_id` bigint(11) NOT NULL COMMENT '批次交接ID',
  `line_id` int(11) NOT NULL COMMENT '扫描号',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包裹ID',
  `order_id` bigint(11) NOT NULL COMMENT 'wms 订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL,
  `order_type` int(11) NOT NULL COMMENT '订单类型',
  `order_weight` decimal(32,8) DEFAULT NULL COMMENT '订单理论重量',
  `actual_weight` decimal(32,8) DEFAULT NULL COMMENT '订单实际重量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT '0' COMMENT '0未确认,1已确认',
  `entry_name` varchar(32) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`detail_id`),
  KEY `order_hand_over_detailI1` (`hand_over_id`) USING BTREE,
  KEY `order_hand_over_detailI2` (`order_id`) USING BTREE,
  KEY `order_hand_over_detailI3` (`entry_datetime`) USING BTREE,
  KEY `order_hand_over_detailI4` (`box_id`),
  KEY `order_hand_over_detailI5` (`parent_order_id`),
  KEY `order_hand_over_detailI6` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16742440 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_hand_over_header
-- ----------------------------
DROP TABLE IF EXISTS `order_hand_over_header`;
CREATE TABLE `order_hand_over_header` (
  `hand_over_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次交接单编号: PCJJ+20141102+8位odometer',
  `STATUS` int(11) NOT NULL COMMENT '1:新增, 2(称重), 3:打印批次截单, 4.批次截单, 5:批次交接 ',
  `container_id` int(11) DEFAULT NULL COMMENT '批次容器ID',
  `order_cnt` int(11) DEFAULT NULL COMMENT '订单总数量',
  `box_cnt` int(11) DEFAULT NULL COMMENT '包裹总数量',
  `total_weight` decimal(32,8) DEFAULT NULL COMMENT '总重量',
  `print_id` int(11) DEFAULT NULL COMMENT '打印人',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间',
  `hand_over_date` datetime DEFAULT NULL COMMENT '交接批次日期',
  `cut_over_id` int(11) DEFAULT NULL COMMENT 'WMS交接人',
  `courier` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司交接人',
  `carrier_car_license` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递车牌号',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `carrier_name` varchar(100) DEFAULT NULL COMMENT '快递公司名称',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'pos台号',
  `entry_name` varchar(32) DEFAULT NULL,
  `print_name` varchar(32) DEFAULT NULL,
  `cut_over_name` varchar(32) DEFAULT NULL,
  `hand_cut_date` datetime DEFAULT NULL COMMENT '批次接单日期',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`hand_over_id`),
  KEY `order_hand_over_headerI1` (`hand_over_no`) USING BTREE,
  KEY `order_hand_over_headerI2` (`hand_over_date`) USING BTREE,
  KEY `order_hand_over_headerI3` (`entry_datetime`) USING BTREE,
  KEY `order_hand_over_headerI5` (`entry_name`) USING BTREE,
  KEY `order_hand_over_headerI6` (`hand_cut_date`) USING BTREE,
  KEY `order_hand_over_headerI7` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16742385 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_header
-- ----------------------------
DROP TABLE IF EXISTS `order_header`;
CREATE TABLE `order_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT 'OMS 订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS未拆单前订单ID',
  `oms_order_cnt` int(11) DEFAULT NULL COMMENT 'OMS订单拆单总数, 包括取消订单',
  `order_cnt` int(11) DEFAULT NULL COMMENT '父单对应订单数: 不包括取消订单',
  `box_cnt` int(4) DEFAULT '1' COMMENT '订单包裹数量',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_sequense` int(11) DEFAULT NULL,
  `order_channel` smallint(6) DEFAULT NULL COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `order_channel_desr` varchar(32) DEFAULT NULL,
  `order_source` int(11) DEFAULT NULL COMMENT '1:网站 2:手机 3:平板',
  `order_source_desc` varchar(32) DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '订单状态',
  `trade_no` bigint(20) DEFAULT NULL COMMENT '交易单号和parentID相同',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `owner_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `carrier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司name',
  `invoice_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '是否打印发票',
  `total_cnt` int(11) DEFAULT NULL COMMENT '订单商品总种类',
  `total_qty` int(11) DEFAULT NULL COMMENT '订单商品总数量',
  `cod_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N' COMMENT '货到付款',
  `freight_type` char(1) DEFAULT NULL COMMENT '是否有运费',
  `delivery_date` int(11) DEFAULT NULL COMMENT '1:undefined 2:undefined 3:任意时间送达 4:定时达 5:极速达',
  `book_date` datetime DEFAULT NULL COMMENT '预约送货日期',
  `presell_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `groupon_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `single_part_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trade_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_zip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_pobox` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  `ship_to_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL COMMENT '城市Id',
  `ship_to_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL COMMENT '地区Id',
  `ship_to_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fourthaddr_id` varchar(32) DEFAULT NULL COMMENT '4级地址ID',
  `ship_to_fourthaddr` varchar(100) DEFAULT NULL COMMENT '4级地址',
  `int_ref_no` int(11) DEFAULT NULL,
  `in_wms_date` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人名称',
  `entry_datetime` datetime DEFAULT NULL,
  `sumup_pick_date` datetime DEFAULT NULL,
  `sumup_id` int(11) DEFAULT NULL,
  `alloc_inv_date` datetime DEFAULT NULL,
  `sys_short_date` datetime DEFAULT NULL,
  `short_date` datetime DEFAULT NULL,
  `short_id` int(11) DEFAULT NULL COMMENT '物理报缺质检人ID',
  `short_name` varchar(32) DEFAULT NULL COMMENT '物理报缺人名称',
  `short_flag` int(11) DEFAULT NULL COMMENT '物理报缺标示',
  `box_qty` int(11) DEFAULT NULL,
  `print_pl_date` datetime DEFAULT NULL COMMENT '拣选单打印日期',
  `print_id` int(11) DEFAULT NULL COMMENT '打印人ID',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人名称',
  `picker_id` int(11) DEFAULT NULL,
  `assign_picker_date` datetime DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_name` varchar(32) DEFAULT NULL COMMENT '指定人',
  `qc_date` datetime DEFAULT NULL,
  `qc_id` int(11) DEFAULT NULL COMMENT '质检人',
  `qc_name` varchar(32) DEFAULT NULL,
  `weigh_date` datetime DEFAULT NULL,
  `weight_id` int(11) DEFAULT NULL,
  `weight_name` varchar(32) DEFAULT NULL,
  `hand_over_date` datetime DEFAULT NULL,
  `hand_over_id` int(11) DEFAULT NULL,
  `hand_over_name` varchar(32) DEFAULT '' COMMENT '批次交接人',
  `invoice_date` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `actual_weight` decimal(32,8) DEFAULT NULL,
  `total_weight` decimal(32,8) DEFAULT NULL,
  `total_order` decimal(32,8) DEFAULT NULL,
  `total_cost` decimal(32,8) DEFAULT NULL,
  `freight` decimal(32,8) DEFAULT NULL,
  `hold_date` datetime DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `shipment_spot_id` int(11) DEFAULT NULL,
  `shipment_spot_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `delivery_requirement` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qc_pos_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `print_label_date` datetime DEFAULT NULL,
  `delivery_from_time` datetime DEFAULT NULL,
  `delivery_to_time` datetime DEFAULT NULL,
  `delivery_bill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区属性',
  `payment_type` smallint(10) DEFAULT NULL COMMENT '支付方式',
  `payment_type_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式介绍',
  `zone_id` int(11) DEFAULT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `sumup_name` varchar(32) DEFAULT NULL COMMENT '汇总人',
  `picker_name` varchar(32) DEFAULT NULL COMMENT '拣选人',
  `container_id` int(11) DEFAULT NULL COMMENT '容器ID',
  `price_hide_flag` smallint(6) DEFAULT NULL COMMENT '1, 隐藏, 0, 显示',
  `payment_date` datetime DEFAULT NULL COMMENT '支付时间',
  `split_datetime` datetime DEFAULT NULL COMMENT '拆单时间',
  `ship_date` datetime DEFAULT NULL,
  `from_name` varchar(32) DEFAULT NULL COMMENT '发件人名字',
  `from_address` varchar(100) DEFAULT NULL COMMENT '发件地址',
  `from_province` varchar(32) DEFAULT NULL COMMENT '发件省',
  `from_city` varchar(32) DEFAULT NULL COMMENT '发件市',
  `from_area` varchar(32) DEFAULT NULL COMMENT '发件区',
  `from_post_code` varchar(32) DEFAULT NULL COMMENT '发件邮编',
  `from_mobile` varchar(32) DEFAULT NULL COMMENT '发件人手机号',
  `from_phone` varchar(32) DEFAULT NULL COMMENT '发件人电话',
  `track_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '获取运单号类型:1. TMS 获取运单号， 2 WMS获取运单号， 3. 快递系统获取运单号',
  `point_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 需要获取配送站点， 0 不需要获取配送站点',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `is_short_wait` smallint(6) DEFAULT NULL COMMENT '是否缺货等待 1是0否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_headerI1` (`order_id`,`order_type`) USING BTREE,
  KEY `order_headerI7` (`in_wms_date`) USING BTREE,
  KEY `order_headerI10` (`hand_over_date`) USING BTREE,
  KEY `order_headerI11` (`import_datetime`) USING BTREE,
  KEY `order_headerI12` (`parent_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21950486 DEFAULT CHARSET=utf8 COMMENT='WMS 订单表';

-- ----------------------------
-- Table structure for order_import_tms_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_import_tms_queue`;
CREATE TABLE `order_import_tms_queue` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` int(11) NOT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS订单父单类型--useless now',
  `status` int(11) DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入日期',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  UNIQUE KEY `order_import_tms_queueI1` (`order_id`,`order_type`) USING BTREE,
  KEY `order_split_queueI2` (`parent_order_id`) USING BTREE,
  KEY `order_split_queueI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 订单同步到TMS队列表';

-- ----------------------------
-- Table structure for order_original_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_original_detail`;
CREATE TABLE `order_original_detail` (
  `order_line_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(11) NOT NULL COMMENT 'WMS 订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单ID',
  `order_line_no` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_qty` int(11) DEFAULT NULL,
  `customise` varchar(255) DEFAULT NULL,
  `unit_cost` decimal(32,8) DEFAULT NULL,
  `sku_price` decimal(16,4) DEFAULT NULL COMMENT 'sku价格',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销单价',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '销售价',
  `member_points` int(11) DEFAULT NULL COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '客户积分金额',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品  1是0否',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费金额',
  `sku_type` int(11) DEFAULT NULL COMMENT '类似零元购，加价购',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券价格',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开发票金额',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '实付金额',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `src_sku_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_line_id`),
  KEY `order_original_detailI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96175182 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_profile
-- ----------------------------
DROP TABLE IF EXISTS `order_profile`;
CREATE TABLE `order_profile` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS订单',
  `profile_attr_name` varchar(80) NOT NULL DEFAULT '' COMMENT '订单特殊属性名称',
  `profile_attr_value` varchar(200) DEFAULT NULL COMMENT '订单特殊属性值',
  `profile_business_type` varchar(20) DEFAULT NULL COMMENT '业务环节（业务环节中重点属性）',
  `profile_attr_type` varchar(10) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `profile_ext1` varchar(30) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`order_id`,`profile_attr_name`),
  KEY `order_profileI2` (`import_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_profiles
-- ----------------------------
DROP TABLE IF EXISTS `order_profiles`;
CREATE TABLE `order_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `prof_cat` varchar(10) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(64) NOT NULL DEFAULT '' COMMENT '属性字段',
  `prof_i` bigint(20) NOT NULL DEFAULT '0' COMMENT '整型属性值',
  `prof_c` varchar(255) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44438350 DEFAULT CHARSET=utf8 COMMENT='订单属性表';

-- ----------------------------
-- Table structure for order_serial_no
-- ----------------------------
DROP TABLE IF EXISTS `order_serial_no`;
CREATE TABLE `order_serial_no` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loc_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `sku_name` varchar(50) DEFAULT NULL,
  `sku_type` smallint(6) DEFAULT NULL,
  `order_id` bigint(11) DEFAULT NULL COMMENT '订单编号',
  `order_type` smallint(6) DEFAULT NULL COMMENT '订单类型',
  `serial_no` varchar(32) DEFAULT NULL,
  `ship_to_account` varchar(32) DEFAULT NULL COMMENT '购买用户',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_msg` varchar(200) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `box_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '包件单ID',
  PRIMARY KEY (`id`),
  KEY `order_serial_noI1` (`order_id`,`order_type`),
  KEY `serial_noidx` (`serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=62598 DEFAULT CHARSET=utf8 COMMENT='订单序列号表';

-- ----------------------------
-- Table structure for order_ship_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_ship_queue`;
CREATE TABLE `order_ship_queue` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS订单父单类型--useless now',
  `status` int(11) DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库日期',
  UNIQUE KEY `order_split_queueI1` (`order_id`,`order_type`) USING BTREE,
  KEY `order_split_queueI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 订单出库表';

-- ----------------------------
-- Table structure for order_short_report_record
-- ----------------------------
DROP TABLE IF EXISTS `order_short_report_record`;
CREATE TABLE `order_short_report_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `report_date` date NOT NULL COMMENT '统计的是哪天的报表',
  `loc_id` int(11) NOT NULL COMMENT '库房id',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '库房名称',
  `sum_order_num` int(11) NOT NULL COMMENT '统计当天的订单总数',
  `real_short_num` int(11) DEFAULT NULL COMMENT '实物报缺订单数',
  `sys_short_num` int(11) DEFAULT NULL COMMENT '系统报缺订单数',
  `sum_short_num` int(11) NOT NULL COMMENT '缺货订单总数量 ',
  `short_rate` decimal(16,6) DEFAULT NULL COMMENT '商品缺货率',
  `entry_datetime` datetime NOT NULL COMMENT '生成记录的时间',
  PRIMARY KEY (`id`),
  KEY `report_didx` (`report_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4098 DEFAULT CHARSET=utf8 COMMENT='订单缺货报表记录';

-- ----------------------------
-- Table structure for order_split_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_split_queue`;
CREATE TABLE `order_split_queue` (
  `loc_id` int(11) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` int(11) NOT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单类型',
  `status` int(11) DEFAULT '0' COMMENT '0 未拆单, 1 已拆单',
  `entry_datetime` datetime DEFAULT NULL,
  `split_datetime` datetime DEFAULT NULL,
  `order_source` int(11) DEFAULT '0' COMMENT '订单来源 1006:零售仓',
  `ware_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '仓库类型',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '拆单次数',
  UNIQUE KEY `order_split_queueI1` (`order_id`,`order_type`),
  KEY `order_split_queueI2` (`parent_order_id`),
  KEY `order_split_queueI3` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 拆单流水表';

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT 'OMS订单类型',
  `status` smallint(6) DEFAULT NULL COMMENT 'OMS订单状态',
  `status_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_code` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要上传: 1需要, 0不需要',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `upload_data_datetime` timestamp NULL DEFAULT NULL,
  `upload_data_id` int(11) DEFAULT NULL,
  `upload_data_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`id`),
  KEY `order_status_UNIQUE` (`order_id`,`order_type`) USING BTREE,
  KEY `order_statusI1` (`entry_datetime`) USING BTREE,
  KEY `order_statusI2` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=187914680 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单状态表';

-- ----------------------------
-- Table structure for order_sum_up_control
-- ----------------------------
DROP TABLE IF EXISTS `order_sum_up_control`;
CREATE TABLE `order_sum_up_control` (
  `loc_id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_type` int(11) NOT NULL,
  `entry_datetime` datetime NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_tracks
-- ----------------------------
DROP TABLE IF EXISTS `order_tracks`;
CREATE TABLE `order_tracks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `track_no` varchar(32) COLLATE utf8_bin NOT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0:新建 1：使用',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包裹ID',
  `print_datetime` datetime DEFAULT NULL COMMENT '运单打印时间',
  `print_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '运单打印人',
  `logistics_order_id` bigint(20) DEFAULT '0' COMMENT '逻辑订单号',
  `extend_order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '快递扩展单号',
  `dest_Route_Label` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'sf路由信息：目的中转场代码+目的地网点代码',
  `two_Dimension_Code` varchar(600) COLLATE utf8_bin DEFAULT NULL COMMENT 'sf中转分拣用二维码',
  PRIMARY KEY (`id`),
  KEY `order_trackI1` (`entry_datetime`) USING BTREE,
  KEY `order_trackI2` (`box_id`),
  KEY `order_trackI3` (`track_no`),
  KEY `order_trackI4` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44210962 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运单Number信息';

-- ----------------------------
-- Table structure for order_track_apply
-- ----------------------------
DROP TABLE IF EXISTS `order_track_apply`;
CREATE TABLE `order_track_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `logistics_order_id` bigint(20) NOT NULL COMMENT '逻辑订单id',
  `track_no` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主运单号',
  `track_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '运单数量',
  `apply_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:新建 1：已使用',
  `entry_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `track_applyI1` (`entry_datetime`) USING BTREE,
  KEY `track_applyI2` (`track_no`) USING BTREE,
  KEY `track_applyI3` (`order_id`) USING BTREE,
  KEY `track_applyI4` (`logistics_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3670 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单运单申请表';

-- ----------------------------
-- Table structure for order_track_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_track_queue`;
CREATE TABLE `order_track_queue` (
  `loc_id` int(11) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `status` smallint(6) DEFAULT NULL COMMENT '0:新建 1：成功 -1：失败',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `error_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  KEY `order_track_UNIQUE` (`order_id`) USING BTREE,
  KEY `order_trackI1` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='需要上传oms的运单信息';

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `order_type` int(11) NOT NULL COMMENT '订单类型',
  `type_disc` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单类型简介',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `order_typeI1` (`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for outbound_lot_infor
-- ----------------------------
DROP TABLE IF EXISTS `outbound_lot_infor`;
CREATE TABLE `outbound_lot_infor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品编码',
  `order_line_no` int(11) DEFAULT NULL COMMENT '订单流水号',
  `lot_id` bigint(20) DEFAULT NULL COMMENT '批次ID',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `ship_qty` int(11) DEFAULT NULL COMMENT '数量',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skui_idx` (`sku_id`),
  KEY `order_idt_idx` (`order_id`,`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=92172014 DEFAULT CHARSET=utf8 COMMENT='出库批次信息';

-- ----------------------------
-- Table structure for pick_list_header
-- ----------------------------
DROP TABLE IF EXISTS `pick_list_header`;
CREATE TABLE `pick_list_header` (
  `pick_list_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pick_list_number` varchar(32) NOT NULL,
  `loc_id` int(11) NOT NULL DEFAULT '1',
  `pick_list_type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT '1',
  `carrier_name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `order_cnt` int(11) DEFAULT NULL,
  `sku_cnt` int(11) DEFAULT NULL,
  `sku_qty` int(11) DEFAULT NULL,
  `invoice_flag` char(1) DEFAULT NULL,
  `invoice_cnt` int(11) DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `print_id` int(11) DEFAULT NULL,
  `print_datetime` datetime DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `assign_datetime` datetime DEFAULT NULL,
  `picker_id` int(11) DEFAULT NULL,
  `pick_datetime` date DEFAULT NULL,
  `print_cnt` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `qc_container_id` int(11) DEFAULT NULL COMMENT '质检容器ID',
  `entry_name` varchar(32) DEFAULT NULL,
  `release_qc_container` int(11) DEFAULT '0' COMMENT '0:未释放',
  `print_name` varchar(32) DEFAULT NULL,
  `picker_name` varchar(32) DEFAULT NULL,
  `assign_name` varchar(32) DEFAULT NULL,
  `qc_id` int(11) DEFAULT NULL COMMENT '质检人',
  `qc_name` varchar(32) DEFAULT NULL COMMENT '质检人名称',
  `qc_date` datetime DEFAULT NULL COMMENT '质检时间',
  `pos_id` varchar(20) DEFAULT NULL,
  `hot_sku` int(11) DEFAULT NULL COMMENT '热销商品ID',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区属性(只用报表统计使用)',
  `qc_start_date` datetime DEFAULT NULL COMMENT '质检开始时间',
  `src_bill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '来源单号',
  `pick_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '不同的下架类型中所关心的下架描述(快递名称/供应商名称/领用部门/成品名称-多个名称)',
  `skip_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '1:不需要称重， 0：表示需要称重',
  `warm_box_enabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '汇单时使用保温箱 0:未汇单或历史数据 1:不使用 2:使用',
  `repackable_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '独立成箱标识 0:非独立成箱;1:独立成箱',
  `vegetable_package_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '蔬菜补货合包标识 0:非蔬菜补货合包 1:蔬菜补货合包',
  PRIMARY KEY (`pick_list_id`),
  KEY `pick_list_headerI1` (`pick_list_number`) USING BTREE,
  KEY `pick_list_headerI2` (`loc_id`) USING BTREE,
  KEY `pick_list_headerI3` (`entry_datetime`) USING BTREE,
  KEY `pick_list_headerI4` (`picker_id`),
  KEY `pick_list_headerI5` (`picker_name`),
  KEY `pick_list_headerI6` (`import_datetime`) USING BTREE,
  KEY `qc_sdidx` (`qc_start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4092788 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pick_list_item
-- ----------------------------
DROP TABLE IF EXISTS `pick_list_item`;
CREATE TABLE `pick_list_item` (
  `pick_list_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pick_list_id` bigint(11) DEFAULT NULL,
  `pick_list_item_seq_no` int(11) NOT NULL,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS父单ID',
  `order_line_no` int(11) NOT NULL,
  `wms_inv_id` int(11) DEFAULT NULL,
  `order_qty` int(11) DEFAULT NULL,
  `alloc_qty` int(11) DEFAULT '0',
  `pick_qty` int(11) DEFAULT '0',
  `qc_qty` int(11) DEFAULT '0',
  `wms_on_hand_qty` int(11) DEFAULT NULL,
  `slot_no` int(11) DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `qc_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型:1 销售订单, 28加工单',
  `delete_name` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `qc_name` varchar(32) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT NULL COMMENT 'if migrate to his db',
  `shipped` smallint(6) DEFAULT NULL COMMENT '是否已出库',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库时间',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`pick_list_item_id`),
  KEY `pick_list_itemI2` (`pick_list_id`) USING BTREE,
  KEY `pick_list_itemI3` (`wms_inv_id`) USING BTREE,
  KEY `pick_list_itemI1` (`order_id`,`order_type`) USING BTREE,
  KEY `pick_list_itemI4` (`entry_datetime`) USING BTREE,
  KEY `pick_list_itemI5` (`parent_order_id`),
  KEY `pick_list_itemI6` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100939272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pick_list_plan
-- ----------------------------
DROP TABLE IF EXISTS `pick_list_plan`;
CREATE TABLE `pick_list_plan` (
  `pick_list_plan_id` bigint(11) NOT NULL DEFAULT '0',
  `pick_list_id` bigint(11) DEFAULT NULL,
  `pick_seq` int(11) DEFAULT '0',
  `wms_inv_id` int(11) DEFAULT NULL,
  `pick_plan_qty` int(11) DEFAULT '0',
  `pick_content` varchar(5000) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `pick_qty` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型:1 销售订单, 28加工单',
  `entry_name` varchar(32) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`pick_list_plan_id`),
  KEY `pick_list_planI1` (`pick_list_id`) USING BTREE,
  KEY `pick_list_planI2` (`wms_inv_id`) USING BTREE,
  KEY `pick_list_planI3` (`entry_datetime`) USING BTREE,
  KEY `pick_list_planI4` (`entry_name`) USING BTREE,
  KEY `pick_list_planI5` (`import_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for po_receive_communication
-- ----------------------------
DROP TABLE IF EXISTS `po_receive_communication`;
CREATE TABLE `po_receive_communication` (
  `trans_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'WMS订单ID',
  `oms_order_id` bigint(20) DEFAULT NULL COMMENT ' OMS 订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `order_no` varchar(32) DEFAULT NULL COMMENT ' OMS 订单编号',
  `wms_bill_id` int(11) DEFAULT NULL COMMENT ' WMS 单据ID',
  `wms_bill_no` varchar(32) DEFAULT NULL COMMENT ' WMS 单据编号 ',
  `wms_bill_type` smallint(6) DEFAULT NULL COMMENT ' WMS 单据类型: ',
  `order_status` int(11) DEFAULT NULL COMMENT '订单当前状态： 到货登记/收货中/（收货完成，不传）关闭',
  `bill_status` int(11) DEFAULT NULL COMMENT '见单据状态定义.',
  `sku_id` int(11) DEFAULT NULL COMMENT 'sku',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `rec_qty` decimal(10,2) DEFAULT '0.00' COMMENT '收货数量',
  `rec_datetime` datetime DEFAULT NULL COMMENT '收货日期',
  `status_code` int(11) DEFAULT NULL COMMENT ' 0, OMS返回成功， 1, OMS返回失败。',
  `error_code` int(11) DEFAULT NULL COMMENT ' 错误编号:见上面注释。 ',
  `error_msg` varchar(128) DEFAULT NULL COMMENT ' 错误结果',
  `entry_datetime` datetime DEFAULT NULL COMMENT ' 创建时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `return_datetime` datetime DEFAULT NULL COMMENT '返回日期',
  `entry_name` varchar(32) DEFAULT NULL,
  `inv_type` int(11) DEFAULT '0' COMMENT '商品状态/正品1、残品2',
  PRIMARY KEY (`trans_id`),
  KEY `po_receive_communicationI1` (`order_id`) USING BTREE,
  KEY `po_receive_communicationI2` (`oms_order_id`) USING BTREE,
  KEY `po_receive_communicationI3` (`order_no`) USING BTREE,
  KEY `po_receive_communicationI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1838218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_return
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return`;
CREATE TABLE `purchase_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS orderId',
  `order_no` bigint(20) DEFAULT NULL,
  `oms_porder_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '类型',
  `return_type` int(11) DEFAULT NULL COMMENT '退货类型',
  `order_status` int(11) DEFAULT NULL COMMENT '状态: 和OMSteam确认',
  `acct_id` int(11) DEFAULT '0' COMMENT '供应商',
  `acct_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主',
  `loc_id` int(11) DEFAULT '0' COMMENT '仓库',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '库房名称',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递',
  `carrier_name` varchar(100) DEFAULT NULL COMMENT '快递名称',
  `total_sku_cnt` int(11) DEFAULT NULL COMMENT '通知品种数',
  `total_qty` int(11) DEFAULT NULL COMMENT '通知订单数',
  `in_ware_date` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `plan_pick_date` datetime DEFAULT NULL COMMENT '计划下架时间',
  `plan_pick_id` int(11) DEFAULT NULL COMMENT '计划人',
  `plan_pick_name` varchar(32) DEFAULT NULL COMMENT '下架人名称',
  `qc_date` datetime DEFAULT NULL COMMENT '质检日期',
  `qc_id` int(11) DEFAULT NULL COMMENT '质检确认人',
  `qc_name` varchar(32) DEFAULT NULL COMMENT '质检人',
  `ship_date` datetime DEFAULT NULL COMMENT '发货日期',
  `ship_id` int(11) DEFAULT NULL COMMENT '发货人',
  `ship_name` varchar(32) DEFAULT NULL COMMENT '发货人名称',
  `close_date` datetime DEFAULT NULL COMMENT '了解日期',
  `close_id` int(11) DEFAULT NULL COMMENT '了解人',
  `close_name` varchar(32) DEFAULT NULL COMMENT '了结人名称',
  `comments` varchar(250) DEFAULT NULL COMMENT '备注',
  `entry_datetime` datetime DEFAULT NULL COMMENT '制单日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '制单人',
  `entry_name` varchar(32) DEFAULT NULL,
  `ship_to_addr` varchar(255) DEFAULT NULL COMMENT '退货地址',
  `ship_to_account` varchar(32) DEFAULT NULL COMMENT '发货人账号',
  `ship_to_phone` varchar(16) DEFAULT NULL COMMENT '发货人手机',
  `ship_to_tel` varchar(16) DEFAULT NULL COMMENT '发货人电话',
  `ship_to_zip` varchar(10) DEFAULT NULL COMMENT '发货人邮编',
  `ship_to_pobox` varchar(60) DEFAULT NULL COMMENT '发货人邮箱',
  `ship_to_province` varchar(20) DEFAULT NULL COMMENT '发货人省份',
  `ship_to_city` varchar(50) DEFAULT NULL COMMENT '发货人城市',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `ship_to_district` varchar(20) DEFAULT '' COMMENT '发货人地区',
  `district_id` int(11) DEFAULT NULL COMMENT '区域id',
  `send_cnt` int(11) DEFAULT NULL COMMENT '发出品种数',
  `send_qty` int(11) DEFAULT NULL COMMENT '发出数量',
  `ship_method` varchar(100) DEFAULT NULL COMMENT '配送方式',
  `expected_return_time` date NOT NULL DEFAULT '1970-01-01' COMMENT '预计退货时间',
  PRIMARY KEY (`id`),
  KEY `purchase_returnI1` (`order_id`,`order_type`) USING BTREE,
  KEY `purchase_returnI2` (`in_ware_date`) USING BTREE,
  KEY `purchase_returnI3` (`oms_porder_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19216 DEFAULT CHARSET=utf8 COMMENT='WMS 订单分录表';

-- ----------------------------
-- Table structure for purchase_return_cancel
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_cancel`;
CREATE TABLE `purchase_return_cancel` (
  `order_cancel_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `order_id` bigint(20) DEFAULT NULL COMMENT '采购订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_cancel_id`),
  UNIQUE KEY `purchase_return_cancelI1` (`order_id`,`order_type`) USING BTREE,
  KEY `purchase_return_cancelI2` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18414 DEFAULT CHARSET=utf8 COMMENT='WMS 采退单取消表';

-- ----------------------------
-- Table structure for purchase_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return_detail`;
CREATE TABLE `purchase_return_detail` (
  `order_line_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(11) NOT NULL COMMENT '订单id--WMS订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `lot` varchar(50) DEFAULT NULL COMMENT '商品批次, OMS会指定商品的批次',
  `order_qty` int(11) DEFAULT NULL COMMENT '订单商品数量（通知数量）',
  `qc_qty` int(11) DEFAULT NULL COMMENT '发出数量',
  `discrep_qty` int(11) DEFAULT NULL COMMENT '差异数量',
  `unit_cost` decimal(32,8) DEFAULT NULL COMMENT '成本',
  `in_ware_date` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期',
  PRIMARY KEY (`order_line_id`),
  UNIQUE KEY `purchase_return_detailI1` (`order_id`,`order_line_no`) USING BTREE,
  KEY `purchase_return_detailI2` (`in_ware_date`) USING BTREE,
  KEY `purchase_return_detailI3` (`sku_no`,`lot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24780 DEFAULT CHARSET=utf8 COMMENT='WMS 采购退货单明细表';

-- ----------------------------
-- Table structure for receiving_qulity_guarantee_policy
-- ----------------------------
DROP TABLE IF EXISTS `receiving_qulity_guarantee_policy`;
CREATE TABLE `receiving_qulity_guarantee_policy` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID, 唯一标示',
  `policy_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '保质期政策名称',
  `policy_min` int(11) DEFAULT NULL COMMENT '保质期起始日期',
  `policy_max` int(11) DEFAULT NULL COMMENT '保质期截止日期',
  `domestic` smallint(255) DEFAULT NULL COMMENT '是否国产:1 进口, 2 非进口',
  `fixed_perid` double(11,0) DEFAULT NULL COMMENT '固定天数, 注意这里是天数',
  `receive_period` double DEFAULT NULL COMMENT '收货标准, 收货截止日期',
  `comments` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编码',
  `sku_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `receiving_qulity_guarantee_policyI1` (`policy_min`,`policy_max`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `recv_detail`;
CREATE TABLE `recv_detail` (
  `recv_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `recv_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '质检单号',
  `recv_item_seq` int(11) DEFAULT NULL COMMENT '质检单明细号',
  `order_item_seq` int(11) DEFAULT NULL COMMENT '订单分录行',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life` int(11) DEFAULT NULL COMMENT '保质期数量',
  `dest_zone_id` int(11) DEFAULT NULL COMMENT '目标货区',
  `dest_bin_loc_id` int(11) DEFAULT NULL COMMENT '目标货位',
  `shelf_life_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保质期单位',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '失效日期',
  `lot` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生产批次号',
  `recv_qty` int(255) DEFAULT NULL COMMENT '质检数量',
  `slot_no` int(11) DEFAULT NULL COMMENT '箱号',
  PRIMARY KEY (`recv_item_id`),
  KEY `recv_detailI1` (`recv_id`) USING BTREE,
  KEY `recv_detailI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `recv_detailI3` (`dest_bin_loc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1817658 DEFAULT CHARSET=utf8 COMMENT='质检单分录信息';

-- ----------------------------
-- Table structure for recv_header
-- ----------------------------
DROP TABLE IF EXISTS `recv_header`;
CREATE TABLE `recv_header` (
  `recv_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `recv_lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '质检批次号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'POS台号',
  `container_id` int(11) DEFAULT NULL COMMENT '容器编号',
  `recv_status` int(11) DEFAULT NULL COMMENT '质检单状态（0存盘or质检确认1,质检审核2）',
  `product_status` int(11) DEFAULT NULL COMMENT '商品状态/正品1、残品2',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '质检品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `confirm_id` int(11) DEFAULT NULL COMMENT '确认人',
  `confirm_name` varchar(32) DEFAULT NULL COMMENT '确认人名称',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认时间',
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_name` varchar(32) DEFAULT NULL COMMENT '审核人名称',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  PRIMARY KEY (`recv_id`),
  UNIQUE KEY `recv_headerI5` (`recv_lot_no`) USING BTREE,
  KEY `recv_headerI2` (`order_id`) USING BTREE,
  KEY `recv_headerI3` (`entry_date`) USING BTREE,
  KEY `recv_headerI4` (`loc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=719646 DEFAULT CHARSET=utf8 COMMENT='收货单';

-- ----------------------------
-- Table structure for recycle_box
-- ----------------------------
DROP TABLE IF EXISTS `recycle_box`;
CREATE TABLE `recycle_box` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_cnt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当前站点包裹数量',
  `daily_shop_seq` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '每天的商店序列号 日期+商店id 计算当天商店的box_sequence',
  `box_sequence` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当前包裹序列号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `pick_list_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '拣货单ID',
  `slot_no` int(11) NOT NULL DEFAULT '0' COMMENT '拣选槽',
  `box_status` int(11) NOT NULL DEFAULT '0' COMMENT '包件单状态: 0初始化, 1新增包裹, 5质检确认 ',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品品种数',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '包裹创建时间',
  `create_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包裹创建人',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商店编号',
  `shop_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商店名称',
  `cargo_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '集货位编号',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `delivery_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '配送日期',
  `pack_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '打包类型：1多点周转箱 2纸箱 3泡沫箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`) USING BTREE,
  UNIQUE KEY `idx_box_no` (`box_no`) USING BTREE,
  KEY `idx_pick_list_id` (`pick_list_id`,`slot_no`) USING BTREE,
  KEY `idx_daily_shop_seq` (`daily_shop_seq`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146624 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='周转箱包裹头信息';

-- ----------------------------
-- Table structure for recycle_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `recycle_box_detail`;
CREATE TABLE `recycle_box_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `box_item_seq` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '包件单明细分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU',
  `qc_qty` int(11) NOT NULL DEFAULT '0' COMMENT '质检数量',
  `slot_qty` int(11) NOT NULL DEFAULT '0' COMMENT '当前拣选槽中的此商品数量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '包裹创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `box_detailI1` (`box_id`,`box_item_seq`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202878 DEFAULT CHARSET=utf8 COMMENT='周转箱明细列表';

-- ----------------------------
-- Table structure for recycle_box_sync_third_que
-- ----------------------------
DROP TABLE IF EXISTS `recycle_box_sync_third_que`;
CREATE TABLE `recycle_box_sync_third_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `box_id` bigint(20) unsigned NOT NULL COMMENT '周转箱id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `sync_status` tinyint(2) DEFAULT '0' COMMENT '上传状态：0 未上传, 1 已上传 -1失败',
  `error_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '返回信息',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `last_sync_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后同步时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`,`sku_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202872 DEFAULT CHARSET=utf8 COMMENT='周转箱同步三方系统队列';

-- ----------------------------
-- Table structure for report_operator
-- ----------------------------
DROP TABLE IF EXISTS `report_operator`;
CREATE TABLE `report_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `report_date` date NOT NULL COMMENT '日期',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ware_name` varchar(128) DEFAULT NULL COMMENT '仓库名称',
  `temp_area_id` int(11) NOT NULL COMMENT '温区',
  `temp_area_name` varchar(64) DEFAULT NULL COMMENT '温区标示',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹数量',
  `order_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '作业单数量',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品品种',
  `elapsed_time` int(11) NOT NULL DEFAULT '0' COMMENT '总耗时（分钟）',
  `elapsed_time_avg` int(11) NOT NULL DEFAULT '0' COMMENT '平均耗时（分钟）',
  `entry_datetime` datetime NOT NULL DEFAULT '1970-01-01 00:00:01' COMMENT '创建时间',
  `statistics_type` int(2) NOT NULL DEFAULT '0' COMMENT '统计类型：1：拣货 2：打包',
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_operatorU1` (`report_date`,`loc_id`,`temp_area_id`,`statistics_type`) USING BTREE,
  KEY `loc_iidx` (`loc_id`) USING BTREE,
  KEY `temp_aiidx` (`temp_area_id`) USING BTREE,
  KEY `statistics_tidx` (`statistics_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59746 DEFAULT CHARSET=utf8 COMMENT='作业单统计报表';

-- ----------------------------
-- Table structure for rf_move_detail
-- ----------------------------
DROP TABLE IF EXISTS `rf_move_detail`;
CREATE TABLE `rf_move_detail` (
  `move_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `move_id` int(11) NOT NULL COMMENT 'moveID',
  `owner_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL COMMENT '库区ID',
  `inv_type` int(11) NOT NULL COMMENT '库存类型',
  `bin_loc_id` int(11) NOT NULL COMMENT '库位ID',
  `wms_inv_id` int(11) NOT NULL COMMENT '库存ID',
  `oh_hand_qty` int(11) NOT NULL COMMENT '移库当时实物库存数量',
  `move_qty` int(11) NOT NULL COMMENT '移库数量',
  `entry_id` int(11) NOT NULL COMMENT '创建人ID',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `si_qty` int(11) DEFAULT '0' COMMENT '抽检(sampling inspection)数量',
  `si_defective_qty` int(11) DEFAULT '0' COMMENT '抽检(sampling inspection)次品数量',
  PRIMARY KEY (`move_detail_id`),
  KEY `rf_move_detailI1` (`move_id`) USING BTREE,
  KEY `rf_move_detailI2` (`wms_inv_id`) USING BTREE,
  KEY `rf_move_detailI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1708368 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rf_move_header
-- ----------------------------
DROP TABLE IF EXISTS `rf_move_header`;
CREATE TABLE `rf_move_header` (
  `move_id` int(11) NOT NULL AUTO_INCREMENT,
  `move_no` varchar(20) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `src_bill_type` int(11) DEFAULT NULL,
  `src_bill_id` int(11) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `sku_cnt` int(11) DEFAULT NULL,
  `sku_qty` int(11) DEFAULT NULL,
  `entry_id` int(11) NOT NULL,
  `entry_datetime` datetime NOT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `move_type` int(2) DEFAULT '0' COMMENT '单据类型 移库null 0 1, -抽检-2',
  PRIMARY KEY (`move_id`),
  KEY `rf_move_headerI1` (`move_no`) USING BTREE,
  KEY `rf_move_headerI2` (`entry_datetime`) USING BTREE,
  KEY `rf_move_headerI3` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1381112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rf_move_progress
-- ----------------------------
DROP TABLE IF EXISTS `rf_move_progress`;
CREATE TABLE `rf_move_progress` (
  `move_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `move_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `inv_type` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `move_qty` int(11) NOT NULL,
  `putaway_qty` int(11) DEFAULT NULL,
  `entry_datetime` datetime NOT NULL,
  `entry_id` int(11) NOT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `frozen_send_erp` datetime DEFAULT NULL COMMENT '冻结库存, 上传到ERP时间',
  PRIMARY KEY (`move_progress_id`),
  KEY `rf_move_progressI1` (`move_id`) USING BTREE,
  KEY `rf_move_progressI2` (`sku_id`) USING BTREE,
  KEY `rf_move_progressI3` (`entry_datetime`) USING BTREE,
  KEY `rf_move_progressI4` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1912188 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rf_move_putaway
-- ----------------------------
DROP TABLE IF EXISTS `rf_move_putaway`;
CREATE TABLE `rf_move_putaway` (
  `move_putaway_id` int(11) NOT NULL AUTO_INCREMENT,
  `move_id` int(11) NOT NULL,
  `move_progress_id` int(11) NOT NULL,
  `from_inv_type` int(11) NOT NULL,
  `to_inv_type` int(11) NOT NULL,
  `bin_loc_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `putaway_qty` int(11) NOT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`move_putaway_id`),
  KEY `rf_move_putawayI1` (`move_id`) USING BTREE,
  KEY `rf_move_putawayI2` (`move_progress_id`) USING BTREE,
  KEY `rf_move_putawayI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1766086 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rf_pick_progress
-- ----------------------------
DROP TABLE IF EXISTS `rf_pick_progress`;
CREATE TABLE `rf_pick_progress` (
  `pick_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `rf_task_id` int(11) NOT NULL,
  `pick_list_plan_id` int(11) DEFAULT NULL,
  `wms_inv_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `bin_loc_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `plan_qty` int(11) DEFAULT NULL,
  `pick_qty` int(11) DEFAULT NULL,
  `qc_qty` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pick_progress_id`),
  KEY `rf_pick_progressI1` (`pick_list_plan_id`) USING BTREE,
  KEY `rf_pick_progressI2` (`wms_inv_id`) USING BTREE,
  KEY `rf_pick_progressI3` (`loc_id`) USING BTREE,
  KEY `rf_pick_progressI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65367728 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rf_tasks
-- ----------------------------
DROP TABLE IF EXISTS `rf_tasks`;
CREATE TABLE `rf_tasks` (
  `task_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `task_no` varchar(32) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `task_type` int(11) NOT NULL,
  `src_bill_type` int(11) NOT NULL,
  `src_bill_id` bigint(11) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime NOT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `worker_name` varchar(32) DEFAULT NULL,
  `work_datetime` datetime DEFAULT NULL,
  `finash_datetime` datetime DEFAULT NULL COMMENT '任务完成时间',
  `priority` char(1) NOT NULL DEFAULT '0' COMMENT 'rf任务优先级 高:3  中:2（订单汇总默认） 低:1',
  UNIQUE KEY `FID_UNIQUEUE` (`task_id`) USING BTREE,
  KEY `IRfTasksI1` (`task_no`) USING BTREE,
  KEY `IRfTasksI2` (`src_bill_id`) USING BTREE,
  KEY `IRfTasksI3` (`entry_datetime`) USING BTREE,
  KEY `IRfTasksI4` (`work_datetime`) USING BTREE,
  KEY `IRfTasksI5` (`worker_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7234350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sales_detail
-- ----------------------------
DROP TABLE IF EXISTS `sales_detail`;
CREATE TABLE `sales_detail` (
  `order_line_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kit_line_no` int(11) DEFAULT NULL COMMENT '虚拟组套套装商品ID',
  `order_id` bigint(11) NOT NULL COMMENT 'WMS 订单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS 订单ID',
  `order_line_no` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `sku_name2` varchar(50) DEFAULT NULL,
  `unit_id2` int(11) DEFAULT NULL,
  `unit_name2` varchar(10) DEFAULT NULL,
  `kit_sku_id` int(11) DEFAULT NULL COMMENT '虚拟组套套装商品ID',
  `sku_type` int(11) DEFAULT NULL,
  `order_qty` int(11) DEFAULT NULL COMMENT '订单数量,包含赠品',
  `qc_qty` int(11) DEFAULT '0',
  `gift_qty` int(11) DEFAULT NULL COMMENT '赠品数量',
  `ship_qty` int(11) DEFAULT NULL,
  `customise` varchar(255) DEFAULT NULL,
  `unit_cost` decimal(32,8) DEFAULT NULL,
  `unit_price` decimal(32,8) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `is_gift` smallint(6) DEFAULT NULL,
  `sale_type` int(11) DEFAULT NULL,
  `gift_type` smallint(6) DEFAULT '0' COMMENT '赠品类型 赠品类型 0:普通品(非赠品) 1:促销赠品 2:市场赠品',
  `temp_area_id2` int(11) DEFAULT NULL,
  `temp_area_name2` varchar(30) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`order_line_id`),
  KEY `sales_detailI1` (`order_id`) USING BTREE,
  KEY `sales_detailI2` (`sku_id`) USING BTREE,
  KEY `sales_detailI3` (`entry_datetime`) USING BTREE,
  KEY `sales_detailI4` (`import_datetime`) USING BTREE,
  KEY `parent_oi_idx` (`parent_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94520300 DEFAULT CHARSET=utf8 COMMENT='WMS 订单分录表';

-- ----------------------------
-- Table structure for sales_guarantee_period_policy
-- ----------------------------
DROP TABLE IF EXISTS `sales_guarantee_period_policy`;
CREATE TABLE `sales_guarantee_period_policy` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的过期时间达到预警的配置表id',
  `policy_name` varchar(32) DEFAULT NULL COMMENT '商品的过期时间达到预警的名称',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `policy_min` int(11) DEFAULT NULL COMMENT '保质期天数的最小天数',
  `policy_max` int(11) DEFAULT NULL COMMENT '保质期天数的最大天数',
  `policy_type` varchar(32) DEFAULT NULL COMMENT '保质期政策类型: sales/risk/freezing/end',
  `fixed_value` int(11) DEFAULT NULL COMMENT '固定值. -1标示不生效, 固定值优先级大于变化量',
  `var_value` double DEFAULT NULL COMMENT '变化值: -1标示不生效',
  `entry_datetime` datetime DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `sales_guarantee_period_policyI1` (`policy_min`) USING BTREE,
  KEY `sales_guarantee_period_policyI2` (`policy_max`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1868 DEFAULT CHARSET=utf8 COMMENT='商品的过期时间达到预警的配置表';

-- ----------------------------
-- Table structure for sales_hold_queue
-- ----------------------------
DROP TABLE IF EXISTS `sales_hold_queue`;
CREATE TABLE `sales_hold_queue` (
  `order_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 等待订单队列';

-- ----------------------------
-- Table structure for sales_order
-- ----------------------------
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS未拆单前订单ID',
  `status` int(2) DEFAULT '0' COMMENT '订单状态',
  `order_no` bigint(20) NOT NULL,
  `oms_order_cnt` int(11) DEFAULT NULL COMMENT 'OMS订单拆单总数, 包括取消订单',
  `order_cnt` int(11) DEFAULT NULL COMMENT '父单对应订单数: 不包括取消订单',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_sequense` int(11) DEFAULT NULL,
  `in_wms_date` datetime DEFAULT NULL,
  `order_channel` smallint(6) DEFAULT NULL COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `order_channel_desr` varchar(32) DEFAULT NULL,
  `invoice_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  `order_source` int(11) DEFAULT NULL COMMENT '1:网站 2:手机 3:平板',
  `order_source_desc` varchar(32) DEFAULT NULL,
  `trade_no` bigint(20) DEFAULT NULL COMMENT '交易单号和parentID相同',
  `order_type` smallint(20) DEFAULT NULL,
  `from_loc_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL,
  `carrier_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_cnt` int(11) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `cod_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  `freight_type` char(1) DEFAULT NULL,
  `delivery_date` int(11) DEFAULT NULL,
  `book_date` datetime DEFAULT NULL COMMENT '预约送货日期',
  `presell_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `groupon_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `single_part_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trade_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_tel` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_pobox` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ship_to_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  `ship_to_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL COMMENT '城市Id',
  `ship_to_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL COMMENT '地区Id',
  `ship_to_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `int_ref_no` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人名称',
  `entry_datetime` datetime DEFAULT NULL,
  `sumup_pick_date` datetime DEFAULT NULL,
  `sumup_id` int(11) DEFAULT NULL,
  `alloc_inv_date` datetime DEFAULT NULL,
  `sys_short_date` datetime DEFAULT NULL,
  `short_date` datetime DEFAULT NULL,
  `short_id` int(11) DEFAULT NULL COMMENT '物理报缺质检人ID',
  `short_name` varchar(32) DEFAULT NULL COMMENT '物理报缺人名称',
  `short_flag` int(11) DEFAULT NULL COMMENT '物理报缺标示',
  `box_qty` int(11) DEFAULT NULL,
  `print_pl_date` datetime DEFAULT NULL COMMENT '拣选单打印日期',
  `print_id` int(11) DEFAULT NULL COMMENT '打印人ID',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人名称',
  `picker_id` int(11) DEFAULT NULL,
  `assign_picker_date` datetime DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `assignee_name` varchar(32) DEFAULT NULL COMMENT '指定人',
  `qc_date` datetime DEFAULT NULL,
  `qc_id` int(11) DEFAULT NULL COMMENT '质检人',
  `qc_name` varchar(32) DEFAULT NULL,
  `weigh_date` datetime DEFAULT NULL,
  `weight_id` int(11) DEFAULT NULL,
  `weight_name` varchar(32) DEFAULT NULL,
  `hand_over_date` datetime DEFAULT NULL,
  `hand_over_id` int(11) DEFAULT NULL,
  `hand_over_name` varchar(32) DEFAULT '' COMMENT '批次交接人',
  `invoice_date` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `actual_weight` double DEFAULT NULL,
  `total_weight` double DEFAULT NULL,
  `total_order` decimal(32,8) DEFAULT NULL,
  `total_cost` decimal(32,8) DEFAULT NULL,
  `freight` decimal(32,8) DEFAULT NULL,
  `hold_date` datetime DEFAULT NULL,
  `closed_date` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `shipment_spot_id` int(11) DEFAULT NULL,
  `shipment_spot_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `delivery_requirement` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qc_pos_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `print_label_date` datetime DEFAULT NULL,
  `delivery_from_time` datetime DEFAULT NULL,
  `delivery_to_time` datetime DEFAULT NULL,
  `delivery_bill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pick_list_id` bigint(20) DEFAULT '-1' COMMENT '拣货单ID',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区属性',
  `temp_area_name` varchar(32) DEFAULT NULL,
  `payment_type` smallint(10) DEFAULT NULL COMMENT '支付方式',
  `payment_type_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式介绍',
  `zone_id` int(11) DEFAULT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `sumup_name` varchar(32) DEFAULT NULL COMMENT '汇总人',
  `picker_name` varchar(32) DEFAULT NULL COMMENT '拣选人',
  `container_id` int(11) DEFAULT NULL COMMENT '容器ID',
  `fourthaddr_id` varchar(32) DEFAULT NULL,
  `ship_to_fourthaddr` varchar(100) DEFAULT NULL COMMENT '四级地址',
  `price_hide_flag` smallint(6) DEFAULT NULL COMMENT '1, 隐藏, 0, 显示',
  `payment_date` datetime DEFAULT NULL COMMENT '支付时间',
  `box_cnt` int(4) DEFAULT '1' COMMENT ' 包裹数量',
  `from_name` varchar(32) DEFAULT NULL COMMENT '发件人名字',
  `from_address` varchar(32) DEFAULT NULL COMMENT '发件地址',
  `from_province` varchar(32) DEFAULT NULL COMMENT '发件省',
  `from_city` varchar(32) DEFAULT NULL COMMENT '发件市',
  `from_area` varchar(32) DEFAULT NULL COMMENT '发件区',
  `from_post_code` varchar(32) DEFAULT NULL COMMENT '发件邮编''',
  `from_mobile` varchar(32) DEFAULT NULL COMMENT '发件手机号',
  `from_phone` varchar(32) DEFAULT NULL COMMENT '发件电话',
  `picker_date` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT '0' COMMENT '热销商品组合id，为0时不是热销商品作业单',
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `is_short_wait` smallint(6) DEFAULT NULL COMMENT '是否缺货等待 1是0否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_orderI1` (`order_id`,`order_type`) USING BTREE,
  KEY `sales_orderI2` (`parent_order_id`) USING BTREE,
  KEY `sales_orderI7` (`in_wms_date`) USING BTREE,
  KEY `sales_orderI10` (`hand_over_date`) USING BTREE,
  KEY `sales_orderI11` (`import_datetime`) USING BTREE,
  KEY `pick_iid_idx` (`pick_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44125758 DEFAULT CHARSET=utf8 COMMENT='WMS 订单表';

-- ----------------------------
-- Table structure for sales_return
-- ----------------------------
DROP TABLE IF EXISTS `sales_return`;
CREATE TABLE `sales_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '没有实际意义, 仅作为表关联使用',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS: 订单ID',
  `order_type` smallint(6) NOT NULL COMMENT 'OMS:销售退货类型',
  `status` int(11) DEFAULT NULL COMMENT '当前状态:和OMS team确认具体值',
  `src_order_id` bigint(20) DEFAULT NULL COMMENT 'OMS:原始销售订单ID',
  `src_order_type` smallint(6) DEFAULT NULL COMMENT 'OMS:原始销售订单类型',
  `src_parent_id` bigint(20) DEFAULT NULL COMMENT 'OMS:拆单前订单Id',
  `loc_id` int(11) DEFAULT NULL COMMENT '收货仓库Id',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司Id',
  `carrier_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司名称',
  `track_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '销退单运单号',
  `src_track_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '原销售订单运单号',
  `ship_to_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家名称',
  `ship_to_addr` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家收货地址',
  `ship_to_phone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `ship_to_tel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `ship_to_province_code` int(11) DEFAULT NULL COMMENT '省份编码',
  `ship_to_province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `ship_to_city_code` int(11) DEFAULT NULL COMMENT '城市编码',
  `ship_to_city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `ship_to_dist_code` int(11) DEFAULT NULL COMMENT '地区编码',
  `ship_to_dist` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '地区',
  `return_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '退货原因',
  `entry_datetime` datetime DEFAULT NULL COMMENT 'OMS创建时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `in_ware_date` datetime DEFAULT NULL COMMENT '进入仓库时间',
  `comments` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `qc_date` datetime DEFAULT NULL COMMENT '质检审核日期',
  `qc_id` int(11) DEFAULT NULL COMMENT '质检审核人',
  `putaway_date` datetime DEFAULT NULL COMMENT '上架时间',
  `putaway_id` int(11) DEFAULT NULL COMMENT '上架人',
  `owner` int(11) DEFAULT NULL,
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区',
  `sku_qty` int(11) DEFAULT '0',
  `recv_qty` int(11) DEFAULT '0',
  `putaway_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `qc_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `src_loc_id` int(11) DEFAULT NULL,
  `damaged_qty` int(11) DEFAULT NULL COMMENT '包装破损数量',
  `register_id` int(11) DEFAULT NULL COMMENT '到货登记人',
  `register_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '到货登记人',
  `register_date` datetime DEFAULT NULL COMMENT '到货登记时间',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `pick_up_flag` smallint(6) DEFAULT '2' COMMENT ' 1:上门取货 0:非上门取货 2:默认值,不区分上门还是非上门',
  `purchase_return_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '采退单id',
  `whole_chargeback_flag` smallint(6) DEFAULT '0' COMMENT '0:非整单退单 1:整单退单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_returnI1` (`order_id`) USING BTREE,
  KEY `sales_returnI2` (`src_order_id`) USING BTREE,
  KEY `sales_returnI3` (`entry_datetime`) USING BTREE,
  KEY `sales_returnI4` (`in_ware_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1375738 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sales_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_detail`;
CREATE TABLE `sales_return_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id, 无意义, 表复制使用',
  `order_id` bigint(20) NOT NULL COMMENT '销退单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` int(11) DEFAULT NULL COMMENT '订单商品数量（通知数量）',
  `rec_qty` int(11) DEFAULT NULL COMMENT '收货数量',
  `discrep_qty` int(11) DEFAULT NULL COMMENT '差异数量',
  `unit_cost` decimal(32,8) DEFAULT NULL COMMENT '成本',
  `entry_datetime` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '制单人',
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `is_gift` int(11) DEFAULT NULL,
  `src_sku_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `damaged_qty` int(11) DEFAULT NULL COMMENT '包装破损数量',
  `need_retest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sku是否需要重新到实验室检测 0不需要 1需要',
  PRIMARY KEY (`id`),
  KEY `sales_return_detailI1` (`order_id`) USING BTREE,
  KEY `sales_return_detailI2` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1682598 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sales_return_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_detail_info`;
CREATE TABLE `sales_return_detail_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `src_order_id` bigint(20) NOT NULL,
  `sku_id` int(32) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  PRIMARY KEY (`id`),
  KEY `sales_return_detail_infoI1` (`order_id`),
  KEY `sales_return_detail_infoI2` (`sku_id`,`lot`,`mfg_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5674 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sales_return_status
-- ----------------------------
DROP TABLE IF EXISTS `sales_return_status`;
CREATE TABLE `sales_return_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `order_type` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT 'OMS订单类型',
  `status` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'OMS订单状态',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `return_status` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_message` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `error_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  `need_sync` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要上传: 1需要, 0不需要',
  `user_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `task_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '定时任务类型 1：销退到货登记回调ERP 2：销退质检实际收货数量回调ERP',
  PRIMARY KEY (`id`),
  KEY `order_id_UNIQUE` (`order_id`) USING BTREE,
  KEY `sales_return_statusI1` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=645506 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单销退状态表';

-- ----------------------------
-- Table structure for sales_status
-- ----------------------------
DROP TABLE IF EXISTS `sales_status`;
CREATE TABLE `sales_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT 'OMS订单类型',
  `status` smallint(6) DEFAULT NULL COMMENT 'OMS订单状态',
  `status_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要上传: 1需要, 0不需要',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `loc_id` int(11) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  PRIMARY KEY (`id`),
  KEY `order_id_UNIQUE` (`order_id`,`order_type`) USING BTREE,
  KEY `sales_statusI1` (`create_date`) USING BTREE,
  KEY `sales_statusI2` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=238307674 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单状态表';

-- ----------------------------
-- Table structure for sku
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku` (
  `﻿sku_code` varchar(255) DEFAULT NULL,
  `cookbook` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sku_convert_damage_img
-- ----------------------------
DROP TABLE IF EXISTS `sku_convert_damage_img`;
CREATE TABLE `sku_convert_damage_img` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `damage_info_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_convert_damage_img ID',
  `origin_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '原图地址',
  `tbn_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '缩略图地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`damage_info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1516 DEFAULT CHARSET=utf8 COMMENT='商品转残图片';

-- ----------------------------
-- Table structure for sku_convert_damage_info
-- ----------------------------
DROP TABLE IF EXISTS `sku_convert_damage_info`;
CREATE TABLE `sku_convert_damage_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `move_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '移库单id',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `lot` varchar(32) NOT NULL DEFAULT '' COMMENT '批次编号',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '-1' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '失效日期',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `from_bin_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源货位id',
  `to_bin_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '上架货位id',
  `damage_reason` tinyint(2) NOT NULL DEFAULT '0' COMMENT '转残原因',
  `remarks` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `from_bin_loc_no` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '来源货位编号',
  `from_zone_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '来源库区名称',
  `to_bin_loc_no` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '目标货位编号',
  `to_zone_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '目标货位名称',
  `first_class_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品一级分类名称',
  `second_class_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品二级分类名称',
  `third_class_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品三级分类名称',
  `wms_inv_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源库存id',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=198910 DEFAULT CHARSET=utf8 COMMENT='商品转残信息';

-- ----------------------------
-- Table structure for sku_extends_info
-- ----------------------------
DROP TABLE IF EXISTS `sku_extends_info`;
CREATE TABLE `sku_extends_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '同步GP用主键，无业务意义',
  `sku_id` int(11) NOT NULL,
  `from_sys` int(11) NOT NULL COMMENT '1: 前台, 2: OMS, 3: WMS',
  `prof_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品属性',
  `content` varchar(500) DEFAULT NULL COMMENT '扩展信息内容',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '更新时间',
  `read_only` smallint(6) DEFAULT '1' COMMENT '是否系统修改',
  PRIMARY KEY (`id`),
  KEY `sku_extends_infoI1` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109962 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sku_extends_info_conf
-- ----------------------------
DROP TABLE IF EXISTS `sku_extends_info_conf`;
CREATE TABLE `sku_extends_info_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `sku_id` int(11) NOT NULL,
  `prof_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `enable_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:启用 2：停用',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `apply_express` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '适用快递，ALL:所有快递',
  PRIMARY KEY (`id`),
  KEY `sku_extends_infoI1` (`sku_id`,`prof_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22064 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品扩展信息配置';

-- ----------------------------
-- Table structure for sku_import_pcr_que
-- ----------------------------
DROP TABLE IF EXISTS `sku_import_pcr_que`;
CREATE TABLE `sku_import_pcr_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '订单类型：1:采购单,2:销退单,28:加工单',
  `sku_id` int(11) DEFAULT '0' COMMENT 'sku_id',
  `sku_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '商品名称',
  `lot` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT 'sku批次',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导入状态：0:新增,1:导入成功,-1:导入失败',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `entry_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `import_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '导入日期',
  `ware_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '库房ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_id_lot` (`sku_id`,`lot`,`ware_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1483016 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单上传品控系统队列';

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
  `plu_no` int(8) NOT NULL DEFAULT '0' COMMENT 'plu码',
  `product_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品三级分类名称',
  `first_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `first_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '一级分类名称',
  `is_eating` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0非生食1生食商品',
  `to_c` smallint(6) NOT NULL DEFAULT '0' COMMENT 'toC',
  `second_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '二级分类名称',
  `second_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  UNIQUE KEY `sku_mainI1` (`sku_id`),
  KEY `sku_mainI2` (`sku_name`),
  KEY `sku_mainI3` (`upc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sku_pic
-- ----------------------------
DROP TABLE IF EXISTS `sku_pic`;
CREATE TABLE `sku_pic` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `sku_name` varchar(255) NOT NULL DEFAULT '',
  `sku_code` varchar(32) NOT NULL DEFAULT '',
  `burden_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '配料图片',
  `exterior_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '外观图片',
  `created_time` timestamp NOT NULL DEFAULT '1970-10-10 00:00:00',
  `created_by` varchar(128) NOT NULL DEFAULT '',
  `updated_time` timestamp NOT NULL DEFAULT '1970-10-10 00:00:00',
  `updated_by` varchar(128) NOT NULL DEFAULT '',
  `is_upload_pic` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否上传图片0否1是',
  PRIMARY KEY (`id`),
  KEY `sku_idindex` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5306 DEFAULT CHARSET=utf8 COMMENT='采购外观质检图';

-- ----------------------------
-- Table structure for sku_transcode_task
-- ----------------------------
DROP TABLE IF EXISTS `sku_transcode_task`;
CREATE TABLE `sku_transcode_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `task_no` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `task_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '任务状态 1新建 2任务操作中 3任务完成',
  `from_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '转出skuId',
  `to_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '转入skuId',
  `apply_num` int(11) NOT NULL DEFAULT '0' COMMENT '申请数量',
  `transcode_num` int(11) NOT NULL DEFAULT '0' COMMENT '转码数量',
  `apply_name` varchar(32) NOT NULL DEFAULT '' COMMENT '申请人',
  `accept_name` varchar(32) NOT NULL DEFAULT '' COMMENT '受理人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `opt_name` varchar(32) NOT NULL DEFAULT '' COMMENT '任务操作人',
  `opt_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务操作时间',
  `finish_name` varchar(32) NOT NULL DEFAULT '' COMMENT '任务完成人',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务完成时间',
  `comments` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_task_no` (`task_no`) USING BTREE,
  KEY `idx_from_sku_id` (`from_sku_id`,`ware_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku转码任务表';

-- ----------------------------
-- Table structure for sku_transcode_task_status
-- ----------------------------
DROP TABLE IF EXISTS `sku_transcode_task_status`;
CREATE TABLE `sku_transcode_task_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `task_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务id',
  `task_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '任务状态 1新建 2任务操作中 3任务完成',
  `need_sync` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否需要同步 0不需要 1需要',
  `sync_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '同步状态 0新建1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_task_id` (`task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku转码任务状态表';

-- ----------------------------
-- Table structure for sr_recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `sr_recv_detail`;
CREATE TABLE `sr_recv_detail` (
  `recv_item_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '为表复制使用, 无意义',
  `recv_id` bigint(11) NOT NULL COMMENT '父表ID',
  `recv_item_seq` int(11) DEFAULT NULL COMMENT '质检单明细号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `order_item_seq` int(11) DEFAULT NULL COMMENT '订单分录行',
  `src_order_id` bigint(20) NOT NULL COMMENT '原销售订单ID, 和pick_list_item关联获得商品批次',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_qty` int(11) DEFAULT NULL COMMENT '销退单商品数量',
  `recv_qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '质检数量',
  `lot` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '生产批次号',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '失效日期',
  `dest_zone_id` int(11) DEFAULT NULL COMMENT '目标货区',
  `dest_bin_loc_id` int(11) DEFAULT NULL COMMENT '目标货位',
  `inv_type` int(11) DEFAULT NULL,
  `damage_reason` smallint(11) DEFAULT NULL,
  PRIMARY KEY (`recv_item_id`),
  KEY `sr_recv_detailI1` (`recv_id`) USING BTREE,
  KEY `sr_recv_detailI2` (`order_id`) USING BTREE,
  KEY `sr_recv_detailI3` (`src_order_id`) USING BTREE,
  KEY `sr_recv_detailI4` (`sku_id`,`lot`,`expire_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=446564 DEFAULT CHARSET=utf8 COMMENT='销退收货单明细表';

-- ----------------------------
-- Table structure for sr_recv_discrep
-- ----------------------------
DROP TABLE IF EXISTS `sr_recv_discrep`;
CREATE TABLE `sr_recv_discrep` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `recv_id` bigint(20) DEFAULT NULL,
  `recv_lot_no` varchar(32) DEFAULT NULL,
  `status` smallint(6) NOT NULL COMMENT '差异确认状态',
  `order_id` bigint(20) NOT NULL COMMENT '销退单号',
  `src_order_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `order_qty` int(11) NOT NULL COMMENT '应收数量',
  `recv_qty` int(11) NOT NULL COMMENT '实收数量',
  `discrep_qty` int(11) NOT NULL COMMENT '差异数量',
  `discrep_reason` smallint(6) DEFAULT NULL COMMENT '差异原因',
  `entry_id` int(11) DEFAULT NULL COMMENT '差异录入id',
  `entry_name` varchar(50) DEFAULT NULL COMMENT '差异录入人名',
  `entry_date` datetime DEFAULT NULL COMMENT '差异录入时间',
  `audit_id` int(11) DEFAULT NULL COMMENT '差异确认人id',
  `audit_name` varchar(50) DEFAULT NULL COMMENT '差异确认人名',
  `audit_date` datetime DEFAULT NULL COMMENT '差异确认时间',
  `pos_id` varchar(20) DEFAULT NULL,
  `loc_id` int(11) NOT NULL,
  `is_compensation` char(2) DEFAULT NULL COMMENT '是否补偿 ',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人',
  `comments` varchar(250) DEFAULT NULL COMMENT '备注',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  `need_sync` smallint(6) DEFAULT '0' COMMENT '是否需要上传tms做物流赔付用: 1需要, 0不需要',
  PRIMARY KEY (`id`),
  KEY `sr_recv_discrepI1` (`recv_id`),
  KEY `sr_recv_discrepI2` (`recv_lot_no`),
  KEY `sr_recv_discrepI3` (`order_id`),
  KEY `sr_recv_discrepI4` (`src_order_id`),
  KEY `sr_recv_discrepI5` (`entry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sr_recv_header
-- ----------------------------
DROP TABLE IF EXISTS `sr_recv_header`;
CREATE TABLE `sr_recv_header` (
  `recv_id` bigint(11) NOT NULL COMMENT '根据ID生成器生成',
  `recv_lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '质检批次号',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'POS台号',
  `container_id` int(11) DEFAULT NULL COMMENT '容器编号',
  `recv_status` int(11) DEFAULT NULL COMMENT '质检单状态（0存盘or质检确认1,质检审核(暂存入库)2）',
  `inv_type` int(11) DEFAULT NULL COMMENT '商品状态/正品1、残品2默认为正品',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区ID, 第一个退货单的温区ID, 以后增加的质检单要和该字段一致',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sku_cnt` int(11) DEFAULT '0' COMMENT '质检品种数',
  `sku_qty` int(11) DEFAULT '0' COMMENT '质检数量',
  `confirm_id` int(11) DEFAULT NULL COMMENT '确认人',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认时间',
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `temp_zone_name` varchar(160) DEFAULT NULL,
  `temp_zone_id` int(11) DEFAULT NULL,
  `temp_bin_loc_id` int(11) DEFAULT NULL,
  `temp_bin_loc_no` varchar(80) DEFAULT NULL,
  `audit_name` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `confirm_name` varchar(32) DEFAULT NULL,
  `damage_container_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司Id',
  PRIMARY KEY (`recv_id`),
  KEY `sr_recv_headerI2` (`recv_lot_no`) USING BTREE,
  KEY `sr_recv_headerI3` (`loc_id`) USING BTREE,
  KEY `sr_recv_headerI4` (`pos_id`) USING BTREE,
  KEY `sr_recv_headerI5` (`entry_date`) USING BTREE,
  KEY `sr_recv_headerI6` (`entry_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销退收货单';

-- ----------------------------
-- Table structure for station_info
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `prefix` varchar(2) NOT NULL DEFAULT '' COMMENT '站点编号前缀',
  `station_seq` int(11) NOT NULL DEFAULT '0' COMMENT '站点编号',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '站点名称',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='快递站点信息';

-- ----------------------------
-- Table structure for status_defines
-- ----------------------------
DROP TABLE IF EXISTS `status_defines`;
CREATE TABLE `status_defines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(32) NOT NULL COMMENT '状态名称',
  `status` int(11) NOT NULL COMMENT '状态值',
  `table_name` varchar(32) DEFAULT NULL COMMENT '表名',
  `comments` varchar(32) DEFAULT NULL COMMENT 'comments',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_definesI2` (`status_name`,`status`,`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temperature_area
-- ----------------------------
DROP TABLE IF EXISTS `temperature_area`;
CREATE TABLE `temperature_area` (
  `temp_area_id` int(11) NOT NULL,
  `temp_area_name` varchar(64) DEFAULT NULL COMMENT '温区标示',
  `start_temp` float DEFAULT NULL COMMENT '起始温度',
  `end_temp` float DEFAULT NULL COMMENT '结束温度',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temperature_area_group
-- ----------------------------
DROP TABLE IF EXISTS `temperature_area_group`;
CREATE TABLE `temperature_area_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehouse ID',
  `group_id` int(11) DEFAULT NULL,
  `group_name` varchar(32) DEFAULT NULL,
  `temp_area_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temperature_area_groupI1` (`group_id`,`temp_area_id`),
  KEY `temperature_area_groupI2` (`temp_area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for track_odometer
-- ----------------------------
DROP TABLE IF EXISTS `track_odometer`;
CREATE TABLE `track_odometer` (
  `carrier_id` int(11) NOT NULL COMMENT '物流快递id',
  `prefix` varchar(10) DEFAULT NULL COMMENT '运单号前缀。',
  `length` int(11) NOT NULL COMMENT '运单号数字部分的长度',
  `current_no` int(11) NOT NULL COMMENT '运单号数字',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `comment` varchar(32) DEFAULT NULL COMMENT '注释',
  `update_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`carrier_id`),
  UNIQUE KEY `track_odometerI1` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_box_detail`;
CREATE TABLE `transfer_box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单id',
  `box_seq_no` int(11) DEFAULT NULL COMMENT '包件单明细分录号',
  `cross_dock` smallint(6) DEFAULT NULL COMMENT '是否转运： 0：否， 1：是',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU',
  `qc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '质检数量',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型（商品属性）1.正品  2、残品',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `idx_entry_datetime` (`entry_datetime`),
  KEY `idx_box_id` (`box_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2433038 DEFAULT CHARSET=utf8 COMMENT='调拨出包件单明细表';

-- ----------------------------
-- Table structure for transfer_box_header
-- ----------------------------
DROP TABLE IF EXISTS `transfer_box_header`;
CREATE TABLE `transfer_box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `box_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '包件单编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '调出单ID: 对于cross dock转运单， 需要在生成调出单后反写该字段， 以完成后续调出交接业务',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `cross_dock` smallint(6) DEFAULT NULL COMMENT '是否转运： 0：否， 1：是',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型（商品属性）1.正品  2、残品',
  `track_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运单号  交接的时候反写',
  `pos_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'POS 台号',
  `container_id` int(11) DEFAULT NULL COMMENT '收货容器编号， 转运方式有容器， 正常调出没有容器',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `status` int(11) DEFAULT NULL COMMENT '包件单状态: 0:新增， 1： 质检确认2：交接出库',
  `box_cnt` int(11) DEFAULT NULL COMMENT '调出单对应包裹总数量， 质检确认时候反写该数量， 在RF批次交接录入时， 计算批次理论包裹数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '商品品种数',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '商品数量',
  `actual_weight` decimal(32,8) DEFAULT NULL COMMENT '实际重量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `confirm_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认人名称',
  `ship_datetime` datetime DEFAULT NULL COMMENT '发出时间',
  `ship_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发出人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `box_sequence` int(11) DEFAULT NULL COMMENT '包裹序号',
  `receive_order_id` bigint(20) DEFAULT NULL COMMENT '采购单order_id',
  `upload_datetime` datetime DEFAULT NULL COMMENT 'upload WMS receive warehouse datetime',
  `warm_box_id` bigint(20) DEFAULT NULL COMMENT '保温箱ID',
  `warm_box_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '资产编码-包裹编码',
  `warm_opt_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '保温箱操作时间',
  `warm_opt_name` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '保温箱操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfer_box_headerI1` (`box_id`) USING BTREE,
  KEY `transfer_box_headerI3` (`order_id`) USING BTREE,
  KEY `transfer_box_headerI5` (`loc_id`) USING BTREE,
  KEY `transfer_box_headerI6` (`pick_list_id`) USING BTREE,
  KEY `transfer_box_headerI7` (`entry_datetime`) USING BTREE,
  KEY `idx_transfer_box_headerI2` (`box_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1041054 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='包件单表头';

-- ----------------------------
-- Table structure for transfer_box_unpack_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_box_unpack_detail`;
CREATE TABLE `transfer_box_unpack_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) DEFAULT NULL COMMENT '调出单ID: 对于cross dock转运单， 需要在生成调出单后反写该字段， 以完成后续调出交接业务',
  `cross_dock` smallint(6) DEFAULT NULL COMMENT '是否转运： 0：否， 1：是',
  `receive_order_id` bigint(20) DEFAULT NULL COMMENT '收货单ID， 如果是cross dock转运单， 为来源采购订单ID， 否则为空',
  `pick_list_id` bigint(11) DEFAULT NULL COMMENT '下架单id',
  `box_seq_no` int(11) DEFAULT NULL COMMENT '明细号',
  `upc_no` varchar(32) DEFAULT NULL COMMENT '商品条码',
  `sku_id` bigint(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `qc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '质检数量',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次号',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `inv_type` int(11) DEFAULT NULL COMMENT '商品库存类型',
  `shelf_life_days` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=703246 DEFAULT CHARSET=utf8 COMMENT='未组包明细表';

-- ----------------------------
-- Table structure for transfer_hand_over_attribute
-- ----------------------------
DROP TABLE IF EXISTS `transfer_hand_over_attribute`;
CREATE TABLE `transfer_hand_over_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) DEFAULT NULL,
  `field_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `field_value` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_hand_over_attributeI1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for transfer_hand_over_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_hand_over_detail`;
CREATE TABLE `transfer_hand_over_detail` (
  `detail_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `hand_over_id` bigint(11) NOT NULL COMMENT '批次交接ID',
  `bill_line_no` int(11) NOT NULL COMMENT '扫描号',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包裹ID',
  `order_id` bigint(11) NOT NULL COMMENT '挑拨出ID',
  `actual_weight` decimal(32,8) DEFAULT NULL COMMENT '实际重量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT '0' COMMENT '0未确认,1已确认',
  PRIMARY KEY (`detail_id`),
  KEY `transfer_hand_over_detailI1` (`hand_over_id`) USING BTREE,
  KEY `transfer_hand_over_detailI2` (`order_id`) USING BTREE,
  KEY `transfer_hand_over_detailI3` (`entry_datetime`) USING BTREE,
  KEY `transfer_hand_over_detailI4` (`box_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1173334 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer_hand_over_header
-- ----------------------------
DROP TABLE IF EXISTS `transfer_hand_over_header`;
CREATE TABLE `transfer_hand_over_header` (
  `hand_over_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '配置ig_generator:THOH',
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次交接单编号: PCJJ+20141102+8位odometer',
  `status` int(11) NOT NULL COMMENT '0, 新增， 1， 批次交接',
  `container_id` int(11) DEFAULT NULL COMMENT '批次容器ID',
  `order_cnt` int(11) DEFAULT NULL COMMENT '调拨出总数量',
  `box_cnt` int(11) DEFAULT NULL COMMENT '包裹总数量',
  `total_weight` decimal(32,8) DEFAULT NULL COMMENT '总重量',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间',
  `hand_over_date` datetime DEFAULT NULL COMMENT '交接批次日期',
  `carrier_id` int(11) DEFAULT NULL COMMENT '快递公司ID',
  `carrier_name` varchar(64) DEFAULT NULL COMMENT '快递公司名称',
  `courier` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司交接人',
  `carrier_car_license` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递车牌号',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'pos台号',
  `entry_name` varchar(32) DEFAULT NULL,
  `print_name` varchar(32) DEFAULT NULL,
  `hand_over_name` varchar(32) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '发货仓id',
  `loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓名称',
  `to_loc_id` int(11) DEFAULT NULL COMMENT '到货仓id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '到货仓名称',
  `track_no` varchar(50) DEFAULT NULL COMMENT '运单号',
  `upload_datetime` datetime DEFAULT NULL COMMENT '上传WMS收货仓时间',
  PRIMARY KEY (`hand_over_id`),
  KEY `transfer_hand_over_headerI1` (`hand_over_no`) USING BTREE,
  KEY `transfer_hand_over_headerI2` (`hand_over_date`) USING BTREE,
  KEY `transfer_hand_over_headerI3` (`entry_datetime`) USING BTREE,
  KEY `transfer_hand_over_headerI5` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer_in_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_box_detail`;
CREATE TABLE `transfer_in_box_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单id',
  `box_no` varchar(32) DEFAULT NULL,
  `box_seq_no` int(11) DEFAULT NULL COMMENT '包件单明细分录号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU',
  `sku_qty` int(20) DEFAULT NULL COMMENT '商品数量',
  `breakage_qty` int(20) DEFAULT NULL COMMENT '破损数量',
  `qc_qty` int(50) DEFAULT NULL COMMENT '质检数量',
  `loss_qty` int(20) DEFAULT NULL COMMENT '缺失数量',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型（商品属性）',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `status` int(11) DEFAULT '0' COMMENT '质检标志0未质检1已质检',
  `zp_qty` int(11) DEFAULT '0' COMMENT '正品数量',
  `cp_qty` int(11) DEFAULT '0' COMMENT '残品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364800 DEFAULT CHARSET=utf8 COMMENT='调拨入包件单明细表';

-- ----------------------------
-- Table structure for transfer_in_box_header
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_box_header`;
CREATE TABLE `transfer_in_box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '包件单编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '调入单ID',
  `order_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '调入单编号',
  `transfer_out_id` bigint(11) DEFAULT NULL COMMENT '调拨出单id',
  `transfer_out_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '调拨出单编号',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `box_status` int(11) DEFAULT '0' COMMENT '包件单外观: 0:外观良好 1：外观破损 2丢失',
  `box_status_desc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '包件单破损原因',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '商品品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `entry_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '确认时间',
  `confirm_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认人名称',
  `inbound_datetime` datetime DEFAULT NULL COMMENT '入库交接时间',
  `inbound_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入库交接人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `print_status` int(11) DEFAULT NULL COMMENT '打印标示: 0:未打印 1：已打印',
  `box_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfer_in_box_headerI1` (`box_id`) USING BTREE,
  UNIQUE KEY `transfer_in_box_headerI2` (`box_no`) USING BTREE,
  KEY `transfer_in_box_headerI3` (`order_id`) USING BTREE,
  KEY `transfer_in_box_headerI5` (`loc_id`) USING BTREE,
  KEY `transfer_in_box_headerI7` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149838 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='包件单表头';

-- ----------------------------
-- Table structure for transfer_in_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_detail`;
CREATE TABLE `transfer_in_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '调拨入单id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '调拨入单编号',
  `transfer_out_id` bigint(11) DEFAULT NULL COMMENT '调拨出单id',
  `transfer_out_no` varchar(32) DEFAULT NULL COMMENT '调拨出单编号',
  `order_line_no` int(11) DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) DEFAULT '0' COMMENT '商品编号',
  `sku_qty` int(11) DEFAULT NULL COMMENT '申请数量',
  `loss_qty` int(11) DEFAULT NULL,
  `breakage_qty` int(11) DEFAULT NULL COMMENT '破损数量',
  `qc_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `discrep_qty` int(11) DEFAULT NULL COMMENT '差异数量=订单数量-质检数量-破损数量-丢失数量',
  `discrep_type` int(11) DEFAULT NULL COMMENT '差异原因1仓库原因 2物流原因',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` int(11) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` int(11) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `lot` varchar(50) DEFAULT NULL,
  `zp_qty` int(11) DEFAULT NULL,
  `cp_qty` int(11) DEFAULT NULL,
  `loss_qyt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_in_detailI1` (`order_id`),
  KEY `transfer_in_detail2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=271824 DEFAULT CHARSET=utf8 COMMENT='调拨入明细表';

-- ----------------------------
-- Table structure for transfer_in_hand_over_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_hand_over_detail`;
CREATE TABLE `transfer_in_hand_over_detail` (
  `detail_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `hand_over_id` bigint(11) DEFAULT NULL COMMENT '批次交接ID',
  `bill_line_no` int(11) DEFAULT NULL COMMENT '扫描号',
  `box_id` bigint(20) DEFAULT NULL COMMENT '包裹ID',
  `box_no` varchar(32) DEFAULT NULL COMMENT '包裹no',
  `order_id` bigint(11) DEFAULT NULL COMMENT '调拨入ID',
  `order_no` varchar(32) DEFAULT NULL COMMENT '调拨入编号',
  `transfer_out_id` bigint(11) DEFAULT NULL COMMENT '调拨出单id',
  `transfer_out_no` varchar(32) DEFAULT NULL COMMENT '调拨出单编号',
  `actual_weight` decimal(32,8) DEFAULT NULL COMMENT '实际重量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT '0' COMMENT '0未确认,1已确认 2 收获交接 ',
  PRIMARY KEY (`detail_id`),
  KEY `transfer_in_hand_over_detailI1` (`hand_over_id`) USING BTREE,
  KEY `transfer_in_hand_over_detailI2` (`order_id`) USING BTREE,
  KEY `transfer_in_hand_over_detailI3` (`entry_datetime`) USING BTREE,
  KEY `transfer_in_hand_over_detailI4` (`box_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=298024 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for transfer_in_hand_over_header
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_hand_over_header`;
CREATE TABLE `transfer_in_hand_over_header` (
  `hand_over_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '由调拨出导入时生成',
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批次交接单编号: 由调拨出导入时生成',
  `loc_id` int(11) DEFAULT NULL,
  `waybill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '运单号',
  `STATUS` int(11) DEFAULT '0' COMMENT '0, 新增 1 交接完成',
  `box_cnt` int(11) DEFAULT NULL COMMENT '包裹总数量',
  `real_box_cnt` int(11) DEFAULT NULL COMMENT '实收包裹总数量',
  `total_weight` decimal(32,8) DEFAULT NULL COMMENT '总重量',
  `hand_over_date` datetime DEFAULT NULL COMMENT '交接批次日期',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL,
  `print_name` varchar(32) DEFAULT NULL,
  `hand_over_name` varchar(32) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL,
  `carrier_name` varchar(32) DEFAULT NULL,
  `courier` varchar(32) DEFAULT NULL COMMENT '快递交接人',
  `carrier_car_license` varchar(32) DEFAULT NULL COMMENT '车牌号',
  PRIMARY KEY (`hand_over_id`),
  KEY `transfer_in_hand_over_headerI1` (`hand_over_no`) USING BTREE,
  KEY `transfer_in_hand_over_headerI2` (`hand_over_date`) USING BTREE,
  KEY `transfer_in_hand_over_headerI3` (`entry_datetime`) USING BTREE,
  KEY `transfer_in_hand_over_headerI5` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123999 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transfer_in_order
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_order`;
CREATE TABLE `transfer_in_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '调拨入单id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '调拨入单据编号',
  `transfer_out_id` bigint(11) DEFAULT NULL COMMENT '调拨出单id',
  `transfer_out_no` varchar(32) DEFAULT NULL COMMENT '调拨出单编号',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `STATUS` varchar(2) DEFAULT '0' COMMENT '状态--0:新建,6:收货完成,(1:质检完成)',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `use_type` smallint(11) DEFAULT NULL COMMENT '调拨类型',
  `sku_qty` int(11) DEFAULT NULL COMMENT '申请数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `qc_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `in_wms_date` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `cross_dock` int(11) DEFAULT '0' COMMENT '是否转运：1转运， 0，正常PO',
  `purchase_no` varchar(20) DEFAULT NULL COMMENT '转运调拨采购单no',
  `purchase_id` int(11) DEFAULT NULL COMMENT '转运调拨采购单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50018 DEFAULT CHARSET=utf8 COMMENT='调拨入单据';

-- ----------------------------
-- Table structure for transfer_in_recv_temp
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_recv_temp`;
CREATE TABLE `transfer_in_recv_temp` (
  `order_id` bigint(20) DEFAULT NULL COMMENT '调入单id',
  `box_id` bigint(20) DEFAULT '0' COMMENT '包件单id',
  `box_no` varchar(32) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU',
  `sku_code` varchar(32) DEFAULT NULL,
  `sku_name` varchar(32) DEFAULT NULL,
  `sku_qty` int(20) DEFAULT NULL COMMENT '商品数量',
  `qc_qty` int(50) DEFAULT NULL COMMENT '质检数量',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位',
  `box_std` varchar(32) DEFAULT NULL COMMENT '规格',
  `temp_area_name` varchar(32) DEFAULT NULL COMMENT '温区',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recv_lot_no` varchar(32) DEFAULT NULL,
  `temp_area_id` bigint(11) DEFAULT NULL,
  `dest_bin_loc_id` int(11) DEFAULT NULL,
  `dest_zone_id` int(11) DEFAULT NULL,
  `recv_item_id` int(11) DEFAULT NULL,
  `recv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='调拨入质检临时表';

-- ----------------------------
-- Table structure for transfer_in_status
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_status`;
CREATE TABLE `transfer_in_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '调拨入单据ID',
  `status` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '调拨入单据状态：1',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态',
  `error_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `last_send_time` datetime DEFAULT NULL COMMENT '最后响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '需要上传： 0：不上传， 1：上传',
  PRIMARY KEY (`id`),
  KEY `transfer_in_status_UNIQUE` (`order_id`) USING BTREE,
  KEY `transfer_in_statusI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入状态表';

-- ----------------------------
-- Table structure for transfer_in_up_inv
-- ----------------------------
DROP TABLE IF EXISTS `transfer_in_up_inv`;
CREATE TABLE `transfer_in_up_inv` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨ru单id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型1：正品， 2：产品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `rec_qty` int(11) DEFAULT NULL COMMENT '发出数量 -- 出库数据上传汇总反写',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `status` int(11) DEFAULT NULL COMMENT '-1:上传失败;1:上传成功',
  `error_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `last_send_time` datetime DEFAULT NULL COMMENT '最后响应时间',
  `loss_flag` tinyint(11) DEFAULT '0' COMMENT '丢失状态 1:丢失;0:没有丢失',
  PRIMARY KEY (`up_id`),
  KEY `transfer_in_lot_invI2` (`order_id`),
  KEY `transfer_in_lot_invI3` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=364334 DEFAULT CHARSET=utf8 COMMENT='调拨入上传到调拨系统的订单库存信息表';

-- ----------------------------
-- Table structure for transfer_out_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_out_detail`;
CREATE TABLE `transfer_out_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `lot` varchar(50) DEFAULT NULL COMMENT '商品批次, 采销会指定商品的批次',
  `order_qty` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品数量（通知数量）',
  `qc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '质检数量',
  `ship_qty` decimal(10,2) DEFAULT '0.00' COMMENT '发出数量',
  `discrep_qty` decimal(10,2) DEFAULT '0.00' COMMENT '差异数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  KEY `transfer_out_detailI1` (`order_id`),
  KEY `transfer_out_detail2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=2181916 DEFAULT CHARSET=utf8 COMMENT='调拨出明细表';

-- ----------------------------
-- Table structure for transfer_out_order
-- ----------------------------
DROP TABLE IF EXISTS `transfer_out_order`;
CREATE TABLE `transfer_out_order` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(32) NOT NULL COMMENT '调拨出单据编号',
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `from_loc_id` int(11) NOT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL,
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `use_type` smallint(11) DEFAULT NULL COMMENT '调拨类型',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '申请数量',
  `qc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '质检数量',
  `ship_qty` decimal(10,2) DEFAULT '0.00' COMMENT '出库数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `qc_cnt` int(11) DEFAULT NULL COMMENT '质检种类',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `shortage_use` smallint(11) DEFAULT NULL COMMENT '仓库实物缺货占用，1占用0不占用',
  `in_wms_date` datetime DEFAULT NULL COMMENT '进入WMS时间',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `pick_id` int(11) DEFAULT NULL COMMENT '下架操作人id',
  `pick_name` varchar(255) DEFAULT NULL COMMENT '下架操作人名称',
  `pick_datetime` datetime DEFAULT NULL COMMENT '下架时间',
  `ship_id` int(11) DEFAULT NULL COMMENT '出库操作人id',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库时间',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `qc_id` int(11) DEFAULT NULL,
  `qc_name` varchar(32) DEFAULT NULL,
  `qc_datetime` datetime DEFAULT NULL,
  `from_province` varchar(20) DEFAULT NULL COMMENT '发货省',
  `to_province` varchar(20) DEFAULT NULL COMMENT '收货省',
  `transfer_in_id` bigint(11) DEFAULT NULL COMMENT '调拨入id',
  `transfer_in_no` varchar(32) DEFAULT NULL COMMENT '调拨入编号',
  `box_cnt` int(11) DEFAULT NULL COMMENT '箱子数量',
  `upload_datetime` datetime DEFAULT NULL COMMENT '上传wms收货仓时间',
  `cross_dock` smallint(6) DEFAULT NULL COMMENT '是否转运： 0：否， 1：是',
  `src_order_id` bigint(20) DEFAULT NULL COMMENT '来源订单ID',
  `temp_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送温区ID',
  PRIMARY KEY (`id`),
  KEY `idx_ship_datetime` (`ship_datetime`),
  KEY `idx_in_wms_date` (`in_wms_date`),
  KEY `idx_order_code` (`order_code`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=679536 DEFAULT CHARSET=utf8 COMMENT='调拨出单据';

-- ----------------------------
-- Table structure for transfer_out_status
-- ----------------------------
DROP TABLE IF EXISTS `transfer_out_status`;
CREATE TABLE `transfer_out_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '调拨出单据ID',
  `status` int(6) DEFAULT NULL COMMENT '调拨出单据状态：1',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态',
  `error_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '错误信息',
  `last_send_time` datetime DEFAULT NULL COMMENT '最后响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '需要上传： 0：不上传， 1：上传',
  PRIMARY KEY (`id`),
  KEY `transfer_out_status_UNIQUE` (`order_id`) USING BTREE,
  KEY `transfer_out_statusI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2531792 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

-- ----------------------------
-- Table structure for transfer_recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_recv_detail`;
CREATE TABLE `transfer_recv_detail` (
  `recv_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `recv_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '质检单号',
  `recv_lot_no` varchar(32) DEFAULT NULL COMMENT '质检单编号',
  `recv_item_seq` int(11) DEFAULT NULL COMMENT '质检单明细号',
  `order_item_seq` int(11) DEFAULT NULL COMMENT '订单分录行',
  `order_id` int(11) DEFAULT NULL COMMENT '调拨入id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '调拨入编号',
  `transfer_out_id` int(11) DEFAULT NULL,
  `transfer_out_no` varchar(32) DEFAULT NULL COMMENT '调拨出单编号',
  `box_id` int(11) DEFAULT NULL COMMENT '箱号',
  `box_no` varchar(32) DEFAULT NULL,
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区id',
  `temp_area_name` varchar(32) DEFAULT NULL COMMENT '温区名称',
  `sku_id` int(11) DEFAULT '0' COMMENT '商品id',
  `sku_qty` int(11) DEFAULT NULL COMMENT '应检数量',
  `recv_qty` int(255) DEFAULT NULL COMMENT '质检数量',
  `lot` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '生产批次号',
  `mfg_date` datetime DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` datetime DEFAULT NULL COMMENT '失效日期',
  `dest_zone_id` int(11) DEFAULT NULL COMMENT '目标货区',
  `dest_bin_loc_id` int(11) DEFAULT NULL COMMENT '目标货位',
  `shelf_life_unit` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保质期单位',
  `shelf_life` int(11) DEFAULT NULL COMMENT '保质期数量',
  `sku_code` varchar(255) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL,
  `unit_name` varchar(32) DEFAULT NULL,
  `box_std` varchar(32) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`recv_item_id`),
  KEY `transfer_recv_detailI1` (`recv_id`) USING BTREE,
  KEY `transfer_recv_detailI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `transfer_recv_detailI3` (`dest_bin_loc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=416674 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='质检单分录信息';

-- ----------------------------
-- Table structure for transfer_recv_header
-- ----------------------------
DROP TABLE IF EXISTS `transfer_recv_header`;
CREATE TABLE `transfer_recv_header` (
  `recv_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `recv_lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '质检批次号',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `pos_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'POS台号',
  `container_id` int(11) DEFAULT NULL COMMENT '容器编号',
  `recv_status` int(11) DEFAULT '0' COMMENT '质检单状态（0存盘 1质检确认 2质检审核）',
  `inv_type` int(11) DEFAULT NULL COMMENT '商品状态/正品1、残品2',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '质检品种数',
  `sku_qty` int(11) DEFAULT NULL COMMENT '质检数量',
  `confirm_id` int(11) DEFAULT NULL COMMENT '确认人',
  `confirm_name` varchar(32) DEFAULT NULL COMMENT '确认人名称',
  `confirm_date` datetime DEFAULT NULL COMMENT '确认时间',
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_name` varchar(32) DEFAULT NULL COMMENT '审核人名称',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  PRIMARY KEY (`recv_id`),
  UNIQUE KEY `transfer_recv_headerI5` (`recv_lot_no`) USING BTREE,
  KEY `transfer_recv_headerI3` (`entry_date`) USING BTREE,
  KEY `transfer_recv_headerI4` (`loc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70024 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收货单';

-- ----------------------------
-- Table structure for transfer_ship_que
-- ----------------------------
DROP TABLE IF EXISTS `transfer_ship_que`;
CREATE TABLE `transfer_ship_que` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `status` int(11) DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库日期',
  UNIQUE KEY `transfer_ship_queI1` (`order_id`) USING BTREE,
  KEY `transfer_ship_que` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 订单出库表';

-- ----------------------------
-- Table structure for transfer_status_upload_wdm_que
-- ----------------------------
DROP TABLE IF EXISTS `transfer_status_upload_wdm_que`;
CREATE TABLE `transfer_status_upload_wdm_que` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单据ID',
  `order_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '调拨出单据编号',
  `status` smallint(6) NOT NULL COMMENT '调拨出单据状态：',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '状态描述',
  `entry_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `response_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '响应时间',
  `return_status` smallint(11) DEFAULT '0' COMMENT '返回状态',
  `error_code` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '错误信息',
  `last_send_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '最后响应时间',
  PRIMARY KEY (`id`),
  KEY `upload_wdm_queI1` (`order_id`) USING BTREE,
  KEY `upload_wdm_queI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨上传委外系统订单状态队列表';

-- ----------------------------
-- Table structure for transfer_upload_wdm_que
-- ----------------------------
DROP TABLE IF EXISTS `transfer_upload_wdm_que`;
CREATE TABLE `transfer_upload_wdm_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `hand_over_id` bigint(20) NOT NULL COMMENT '批次交接单ID',
  `status` smallint(6) DEFAULT '0' COMMENT '0 未上传, 1 已上传',
  `error_code` varchar(128) DEFAULT '' COMMENT '返回信息',
  `entry_datetime` timestamp NOT NULL COMMENT '创建日期',
  `response_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '响应日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_wdm_queI1` (`hand_over_id`) USING BTREE,
  KEY `upload_wdm_queI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='wms 调拨出库批次交接上传委外系统';

-- ----------------------------
-- Table structure for transfer_upload_wms_que
-- ----------------------------
DROP TABLE IF EXISTS `transfer_upload_wms_que`;
CREATE TABLE `transfer_upload_wms_que` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID',
  `hand_over_id` bigint(20) NOT NULL COMMENT '批次交接单ID',
  `status` int(11) DEFAULT '0' COMMENT '0 未上传, 1 已上传',
  `error_code` varchar(255) DEFAULT NULL COMMENT '返回信息',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `upload_datetime` datetime DEFAULT NULL COMMENT '上传日期',
  UNIQUE KEY `transfer_upload_wms_queI1` (`hand_over_id`) USING BTREE,
  KEY `transfer_upload_wms_queI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WMS 调拨出库批次交接上传WMS收货仓库';

-- ----------------------------
-- Table structure for tr_alloc_inv_que
-- ----------------------------
DROP TABLE IF EXISTS `tr_alloc_inv_que`;
CREATE TABLE `tr_alloc_inv_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调出单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `alloc_status` int(11) NOT NULL DEFAULT '0' COMMENT '占用状态1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=576274 DEFAULT CHARSET=utf8 COMMENT='调出单库存占用表';

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
  `ware_province` varchar(32) NOT NULL COMMENT '仓库所在省',
  `province_id` int(11) NOT NULL COMMENT '仓库所在省ID',
  `ware_city` varchar(32) NOT NULL COMMENT '仓库所在市',
  `city_id` int(11) NOT NULL COMMENT '仓库所在市ID',
  `ware_region` varchar(32) NOT NULL COMMENT '仓库所在区',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warm_box
-- ----------------------------
DROP TABLE IF EXISTS `warm_box`;
CREATE TABLE `warm_box` (
  `warm_box_id` bigint(20) NOT NULL COMMENT '保温箱ID',
  `warm_box_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '资产编码-包裹编码',
  `material_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '物资编码',
  `type_no` varchar(8) COLLATE utf8_bin DEFAULT '' COMMENT '保温箱型号',
  `ware_no` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '归属',
  `entry_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`warm_box_id`),
  UNIQUE KEY `warm_boxI1` (`warm_box_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_box_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_exception_log`;
CREATE TABLE `warm_box_exception_log` (
  `exception_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warm_box_id` bigint(20) DEFAULT '0' COMMENT '保温箱号',
  `warm_box_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '保温箱号',
  `warm_box_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '保温箱类型',
  `loc_id` int(11) DEFAULT '0' COMMENT '仓库id',
  `current_qty` int(11) DEFAULT '0' COMMENT '该类保温箱剩余数量',
  `exception_type` smallint(6) DEFAULT '0' COMMENT '差异类型：1：系统有实物无2:实物有系统无3绑定4解绑',
  `current_box` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '当前包裹',
  `new_box` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '新关联包裹',
  `qc_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '质检人',
  `entry_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建人',
  `entry_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`exception_id`),
  KEY `warm_box_exceptionI1` (`warm_box_id`) USING BTREE,
  KEY `warm_box_exceptionI2` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=760904 DEFAULT CHARSET=utf8 COMMENT='保温箱异常日志表';

-- ----------------------------
-- Table structure for warm_box_import_tms_queue
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_import_tms_queue`;
CREATE TABLE `warm_box_import_tms_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `box_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `warm_box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '保温箱ID',
  `warm_box_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '资产编码-包裹编码',
  `warm_box_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '保温箱状态：1 :在库 2：占用 3:出库 9：停用',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `import_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入状态：0 未导入TMS, 1 已导入TMS',
  `opt_datetime` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '操作时间',
  `opt_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `entry_datetime` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '创建日期',
  `update_datetime` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '更新日期',
  `return_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '销退单号',
  PRIMARY KEY (`id`),
  KEY `warm_box_queI1` (`order_id`) USING BTREE,
  KEY `warm_box_queI2` (`box_no`) USING BTREE,
  KEY `warm_box_queI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32658720 DEFAULT CHARSET=utf8 COMMENT='WMS 保温箱同步到TMS队列表';

-- ----------------------------
-- Table structure for warm_box_loc
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_loc`;
CREATE TABLE `warm_box_loc` (
  `warm_box_id` bigint(20) NOT NULL COMMENT '保温箱ID',
  `loc_id` int(32) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态：1 :在库 2：占用 3:出库 9：停用',
  `entry_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `box_cnt` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前保温箱上绑定包裹数',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁控制',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `warm_box_id` (`warm_box_id`,`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263052 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_box_loc_conf
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_loc_conf`;
CREATE TABLE `warm_box_loc_conf` (
  `ware_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '归属',
  `ware_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '保温箱归属名称',
  `loc_id` int(32) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `warm_box_enabled` tinyint(4) DEFAULT '1' COMMENT '保温箱启用停用- 启用：1   停用：0',
  `entry_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `fid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `ware_no` (`ware_no`,`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_box_recv_detail
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_recv_detail`;
CREATE TABLE `warm_box_recv_detail` (
  `warm_box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '保温箱编码',
  `order_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '保温箱入库单号',
  `create_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`warm_box_id`,`order_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_box_recv_header
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_recv_header`;
CREATE TABLE `warm_box_recv_header` (
  `order_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '保温箱入库单号',
  `loc_id` int(32) DEFAULT '0' COMMENT '仓库',
  `ware_no` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '归属',
  `box_qty` int(11) DEFAULT '0' COMMENT '保温箱数量',
  `status` int(11) DEFAULT '0' COMMENT '保温箱入库单状态',
  `entry_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `enter_type` smallint(6) DEFAULT NULL COMMENT '入库类型',
  `recv_id` bigint(11) DEFAULT NULL COMMENT '销退质检批次id',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_box_rent_conf
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_rent_conf`;
CREATE TABLE `warm_box_rent_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '归属-货主编码',
  `rent_id` int(11) NOT NULL DEFAULT '0' COMMENT '租用id',
  `rent_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '租用名称',
  `rent_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '租用状态   1：租用 2：非租用',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rent_id` (`rent_id`,`owner_no`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='保温箱租用配置表';

-- ----------------------------
-- Table structure for warm_box_type
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_type`;
CREATE TABLE `warm_box_type` (
  `type_no` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '保温箱型号编码',
  `type_name` varchar(45) COLLATE utf8_bin DEFAULT '' COMMENT '保温箱型号名称',
  `length` double(5,2) DEFAULT '0.00' COMMENT '长(毫米)',
  `width` double(5,2) DEFAULT '0.00' COMMENT '宽(毫米)',
  `heigth` double(5,2) DEFAULT '0.00' COMMENT '高(毫米)',
  `volume` double(5,2) DEFAULT '0.00' COMMENT '有效容积升',
  `weight` double(5,2) DEFAULT NULL COMMENT '保温箱重量',
  `freeze_iceBox` tinyint(4) DEFAULT '0' COMMENT '冷冻冰盒数',
  `freeze_weight` double(5,2) DEFAULT '0.00' COMMENT '冷冻重量',
  `refrigerate_iceBox` tinyint(4) DEFAULT '0' COMMENT '冷藏冰盒数',
  `refrigerate_weight` double(5,2) DEFAULT '0.00' COMMENT '冷藏重量',
  `memo` varchar(120) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `ware_no` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '所属快递',
  `entry_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  `odo_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '保温箱号生成规则类型',
  PRIMARY KEY (`type_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for warm_odometer
-- ----------------------------
DROP TABLE IF EXISTS `warm_odometer`;
CREATE TABLE `warm_odometer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `odo_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '规则类型',
  `prefix` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '保温箱号前缀。',
  `len` int(11) NOT NULL DEFAULT '0' COMMENT '保温箱号数字部分的长度',
  `current_no` int(11) NOT NULL DEFAULT '0' COMMENT '运单号数字',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `note` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '注释',
  `update_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_odo_type` (`odo_type`) USING BTREE,
  UNIQUE KEY `idx_prefix` (`prefix`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='保温箱号产生规则表';

-- ----------------------------
-- Table structure for wms_action_logs
-- ----------------------------
DROP TABLE IF EXISTS `wms_action_logs`;
CREATE TABLE `wms_action_logs` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `wms_action` int(11) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for wms_bill_collect_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_bill_collect_task`;
CREATE TABLE `wms_bill_collect_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '单据id',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `pick_zone` varchar(128) NOT NULL DEFAULT '' COMMENT '拣选库区',
  `storage_temp` varchar(32) NOT NULL DEFAULT '' COMMENT '存储温区',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品种类',
  `sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `work_sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '加工单商品名称',
  `collect_status` smallint(2) NOT NULL DEFAULT '0' COMMENT '0:未汇总 1:已汇总',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_bill_id` (`bill_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77408 DEFAULT CHARSET=utf8 COMMENT='wms单据单据汇总任务表';

-- ----------------------------
-- Table structure for wms_bill_pending
-- ----------------------------
DROP TABLE IF EXISTS `wms_bill_pending`;
CREATE TABLE `wms_bill_pending` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '单据id',
  `bill_no` varchar(32) NOT NULL DEFAULT '' COMMENT '单据号',
  `parent_bill_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父单据号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递名称',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品种类',
  `sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `lot_type` int(11) NOT NULL DEFAULT '0' COMMENT '批次规则',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `comments` varchar(128) NOT NULL DEFAULT '' COMMENT '补充内容',
  `is_short_wait` smallint(6) NOT NULL DEFAULT '0' COMMENT '缺货等待1是0否',
  PRIMARY KEY (`id`),
  KEY `idx_bill_id` (`bill_id`) USING BTREE,
  KEY `idx_bill_no` (`bill_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28147650 DEFAULT CHARSET=utf8 COMMENT='wms单据报缺表';

-- ----------------------------
-- Table structure for wms_bin_location
-- ----------------------------
DROP TABLE IF EXISTS `wms_bin_location`;
CREATE TABLE `wms_bin_location` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `in_use` char(1) NOT NULL DEFAULT 'N' COMMENT '当前货位是否处于占用状态',
  `loc_fid` int(11) DEFAULT NULL COMMENT '仓库fid',
  `zone_fid` int(11) DEFAULT NULL COMMENT '库区fid',
  `active` varchar(20) DEFAULT NULL COMMENT '启用标志',
  `bin_loc_no` varchar(50) DEFAULT NULL COMMENT '库位编码',
  `zone_name` varchar(100) DEFAULT NULL COMMENT '库区名称',
  `owner` varchar(250) DEFAULT NULL COMMENT '货主',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `height` int(11) DEFAULT NULL COMMENT '高度',
  `length` int(11) DEFAULT NULL COMMENT '长度',
  `max_qty` int(11) DEFAULT NULL COMMENT '最大可用数量',
  `max_volumn` int(11) DEFAULT NULL COMMENT '最大可用体积',
  `max_weight` int(11) DEFAULT NULL COMMENT '最大可用重量',
  `rest_max_qty` int(11) DEFAULT NULL COMMENT '剩余可用数量',
  `rest_max_volumn` int(11) DEFAULT NULL COMMENT '剩余可用体积',
  `rest_max_weight` int(11) DEFAULT NULL COMMENT '剩余可用重量',
  `bin_loc_status` varchar(10) DEFAULT NULL COMMENT '货位状态（是否为空闲）',
  `effective_datetime` datetime DEFAULT NULL COMMENT '启用日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_id` varchar(250) DEFAULT NULL COMMENT '修改人',
  `entry_id` varchar(250) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL,
  `aisle` varchar(32) DEFAULT NULL,
  `bay` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `wms_bin_locationI3` (`bin_loc_no`,`loc_fid`) USING BTREE,
  KEY `wms_bin_locationI2` (`zone_fid`) USING BTREE,
  KEY `wms_bin_locationI4` (`loc_fid`) USING BTREE,
  KEY `wms_bin_locationI5` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59164 DEFAULT CHARSET=utf8 COMMENT='货位表';

-- ----------------------------
-- Table structure for wms_container
-- ----------------------------
DROP TABLE IF EXISTS `wms_container`;
CREATE TABLE `wms_container` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `loc_fid` int(11) DEFAULT NULL COMMENT '仓库id',
  `container_no` varchar(50) DEFAULT NULL COMMENT '容器编码',
  `container_name` varchar(50) DEFAULT NULL COMMENT '容器名称',
  `container_status` int(11) DEFAULT NULL COMMENT '容器状态',
  `used` int(11) NOT NULL DEFAULT '0' COMMENT '容器使用状态',
  `occupier_id` varchar(30) DEFAULT NULL COMMENT '领用人',
  `occup_stamp` varchar(20) DEFAULT NULL COMMENT '领用时间',
  `task_no` varchar(255) DEFAULT NULL COMMENT '领用任务号',
  `active` varchar(255) DEFAULT NULL COMMENT '启用',
  `effective_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_id` varchar(30) DEFAULT NULL COMMENT '修改人',
  `entry_id` varchar(30) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL,
  `last_use_datetime` datetime DEFAULT NULL,
  `last_use_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `wms_containerI3` (`container_no`,`loc_fid`) USING BTREE,
  KEY `wms_containerI2` (`loc_fid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13674 DEFAULT CHARSET=utf8 COMMENT='容器表';

-- ----------------------------
-- Table structure for wms_container_inv
-- ----------------------------
DROP TABLE IF EXISTS `wms_container_inv`;
CREATE TABLE `wms_container_inv` (
  `container_inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `wms_inv_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `bin_loc_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `pick_qty` int(11) DEFAULT NULL,
  `real_qty` int(11) DEFAULT NULL,
  `orde_qty` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`container_inv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_inv
-- ----------------------------
DROP TABLE IF EXISTS `wms_inv`;
CREATE TABLE `wms_inv` (
  `wms_inv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '库存唯一标示符 Unique index',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID    PK',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型: 1 正品, 2残品, 3废品',
  `zone_id` int(11) NOT NULL DEFAULT '0' COMMENT '库区ID',
  `zone_no` varchar(32) DEFAULT NULL,
  `bin_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '库位ID',
  `bin_loc_no` varchar(32) DEFAULT NULL,
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `lot` varchar(50) DEFAULT NULL COMMENT '批次     PK---同一批次，生产日期，保质期天数，失效日期应该是一样的，等待和用户确认',
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL,
  `on_hand_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'WMS on hand qty,实物库存。',
  `sales_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '被销售订单占用的库存。',
  `move_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移位占用',
  `mt_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移库占用',
  `rtv_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'return to vender 退货占用',
  `wip_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'work in process生产领料占用',
  `losses_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '报损占用。',
  `other_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '其他领用/抽检等占用',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `update_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `short_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '报缺占用',
  `owner_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '货主',
  `cancel_order_qty` decimal(10,2) DEFAULT '0.00',
  `sales_period` date DEFAULT NULL COMMENT '销售期最后一天',
  `risk_period` date DEFAULT NULL COMMENT '风险期起始日期',
  `freezing_period` date DEFAULT NULL COMMENT '冻结期起始日期',
  `end_period` date DEFAULT NULL COMMENT '冻结期起始日期',
  `frozen_send_erp` datetime DEFAULT NULL COMMENT '冻结库存, 上传到ERP时间',
  `update_name` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  UNIQUE KEY `fid_UNIQUE` (`wms_inv_id`) USING BTREE,
  UNIQUE KEY `wms_invI2` (`bin_loc_id`,`sku_id`,`lot`,`mfg_date`,`shelf_life_days`,`expire_date`,`loc_id`,`frozen_send_erp`) USING BTREE,
  KEY `wms_invI3` (`sku_id`,`lot`) USING BTREE,
  KEY `wms_invI5` (`freezing_period`) USING BTREE,
  KEY `wms_invI6` (`expire_date`) USING BTREE,
  KEY `wms_invI7` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6638136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_inv_snap
-- ----------------------------
DROP TABLE IF EXISTS `wms_inv_snap`;
CREATE TABLE `wms_inv_snap` (
  `snap_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '快照主键',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `loc_id` int(11) NOT NULL COMMENT '库房ID',
  `expire_date` date DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `inv_type` varchar(30) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL COMMENT '批次 ',
  `on_hand_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'WMS on hand qty,实物库存。',
  `sales_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '被销售订单占用的库存。',
  `move_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移位占用',
  `mt_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移库占用',
  `rtv_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '退货占用',
  `wip_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '生产领料占用',
  `losses_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '报损占用。',
  `other_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '其他领用/抽检等占用',
  `short_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '报缺占用',
  `owner_id` smallint(6) NOT NULL COMMENT '货主',
  `cancel_order_qty` decimal(10,2) DEFAULT '0.00',
  `date_flag` date NOT NULL,
  PRIMARY KEY (`snap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37934488 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_inv_trans_logs
-- ----------------------------
DROP TABLE IF EXISTS `wms_inv_trans_logs`;
CREATE TABLE `wms_inv_trans_logs` (
  `trans_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `wms_inv_id` int(11) DEFAULT NULL,
  `container_id` int(11) DEFAULT NULL,
  `trans_type_id` int(11) DEFAULT NULL,
  `trans_qty` decimal(10,2) DEFAULT '0.00' COMMENT '操作数量',
  `src_bill_id` bigint(11) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `bill_type` varchar(20) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `bin_loc_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `order_id` bigint(11) DEFAULT NULL,
  `trans_type` varchar(32) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `on_hand_qty` decimal(10,2) DEFAULT '0.00' COMMENT 'WMS on hand qty,实物库存。',
  `sales_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '被销售订单占用的库存。',
  `wip_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '生产领料占用',
  `move_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移位占用',
  `mt_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '移库占用',
  `rtv_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '退货占用',
  `losses_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '报损占用。',
  `other_alloc_qty` decimal(10,2) DEFAULT '0.00' COMMENT '其他领用/抽检等占用',
  `freezing_period` date DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `wms_inv_trans_logsI1` (`wms_inv_id`) USING BTREE,
  KEY `wms_inv_trans_logsI2` (`src_bill_id`) USING BTREE,
  KEY `wms_inv_trans_logsI3` (`entry_datetime`) USING BTREE,
  KEY `wms_inv_trans_logsI4` (`entry_name`) USING BTREE,
  KEY `wms_inv_trans_logsI5` (`sku_id`,`trans_type`)
) ENGINE=InnoDB AUTO_INCREMENT=181498632 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_modify_shelf_life
-- ----------------------------
DROP TABLE IF EXISTS `wms_modify_shelf_life`;
CREATE TABLE `wms_modify_shelf_life` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义自增主键',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `wms_inv_id` int(11) DEFAULT NULL COMMENT '库存ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型:1正品, 2残品',
  `lot` varchar(100) DEFAULT NULL COMMENT '批次',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `expire_date` date DEFAULT NULL COMMENT '旧截止日期',
  `new_expire_date` date DEFAULT NULL COMMENT '新截止日期',
  `old_days` int(11) DEFAULT NULL COMMENT '旧保质期天数',
  `new_days` int(11) DEFAULT NULL COMMENT '新保质期天数',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL,
  `return_flag` int(11) DEFAULT NULL COMMENT '返回类型: 1:成功, -1 失败, 0,null 新增',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `return_datetime` datetime DEFAULT NULL COMMENT '返回日期',
  PRIMARY KEY (`id`),
  KEY `wms_modify_shelf_lifeI1` (`loc_id`) USING BTREE,
  KEY `wms_modify_shelf_lifeI2` (`wms_inv_id`) USING BTREE,
  KEY `wms_modify_shelf_lifeI3` (`sku_id`,`lot`) USING BTREE,
  KEY `wms_modify_shelf_lifeI4` (`entry_datetime`) USING BTREE,
  KEY `wms_modify_shelf_lifeI5` (`return_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=865136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_order_short_inv
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_short_inv`;
CREATE TABLE `wms_order_short_inv` (
  `short_inv_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `loc_id` int(11) DEFAULT '0' COMMENT '库房Id',
  `order_id` bigint(11) NOT NULL COMMENT 'OMS订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT 'OMSparentID',
  `order_type` int(11) NOT NULL,
  `ware_id` int(11) NOT NULL COMMENT '老的库房ID， 被locId替换',
  `sku_id` int(11) NOT NULL,
  `inv_type` int(11) NOT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `order_qty` int(11) NOT NULL,
  `bin_loc_qty` int(11) NOT NULL,
  `short_qty` int(11) NOT NULL,
  `wms_inv_id` int(11) NOT NULL,
  `bin_locs` varchar(128) DEFAULT NULL COMMENT '货位名称拼的字符串',
  `pick_list_id` int(11) DEFAULT NULL,
  `pick_list_no` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '@deprecated',
  `user_name` varchar(32) DEFAULT NULL COMMENT '@deprecated',
  `bin_loc_id` int(11) DEFAULT NULL COMMENT '库位ID',
  `zone_id` int(11) DEFAULT NULL COMMENT '库区ID',
  `send_oms_date` datetime DEFAULT NULL,
  `return_status` int(11) DEFAULT NULL COMMENT 'OMS返回状态',
  `error_code` varchar(255) DEFAULT NULL COMMENT 'OMS返回错误信息',
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`short_inv_id`),
  KEY `wms_order_short_invI1` (`order_id`,`order_type`) USING BTREE,
  KEY `wms_order_short_invI2` (`ware_id`) USING BTREE,
  KEY `wms_order_short_invI3` (`sku_id`,`lot`) USING BTREE,
  KEY `wms_order_short_invI4` (`wms_inv_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83616 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_parameter
-- ----------------------------
DROP TABLE IF EXISTS `wms_parameter`;
CREATE TABLE `wms_parameter` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '外键关联',
  `parameter_id` varchar(64) DEFAULT NULL COMMENT '主键参数id',
  `parameter_name` varchar(50) DEFAULT NULL COMMENT '参数名称',
  `parameter_disc` varchar(100) DEFAULT NULL COMMENT '参数说明',
  `parameter_value` varchar(100) DEFAULT NULL COMMENT '参数value',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库名称（facility_type=''warehouse''）',
  `wh_flag` varchar(10) DEFAULT 'N' COMMENT '区分仓库标志（Y/N）',
  `parameter_status` varchar(20) DEFAULT NULL COMMENT '启用标志（参数的状态）',
  `effective_datetime` datetime DEFAULT NULL COMMENT '启用日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期',
  `update_id` varchar(250) DEFAULT NULL COMMENT '修改人',
  `entry_id` varchar(250) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `wms_parameterI1` (`parameter_id`,`loc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2190 DEFAULT CHARSET=utf8 COMMENT='WMS 配置表';

-- ----------------------------
-- Table structure for wms_pending_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_pending_order_detail`;
CREATE TABLE `wms_pending_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID',
  `sku_id` int(11) NOT NULL COMMENT '订单明细商品ID',
  `order_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `alloc_qty` int(11) DEFAULT NULL COMMENT '分配数量',
  `discrep_qty` int(11) DEFAULT NULL COMMENT '差异数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `order_type` int(11) DEFAULT NULL,
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父订单号',
  `loc_id` int(11) DEFAULT NULL,
  `import_his_status` smallint(6) DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` datetime DEFAULT NULL COMMENT '导入历史库时间',
  `sku_lot` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '商品批次',
  `temp_area_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送温区ID',
  PRIMARY KEY (`id`),
  KEY `wms_pending_order_detailI2` (`order_id`) USING BTREE,
  KEY `wms_pending_order_detailI1` (`entry_datetime`) USING BTREE,
  KEY `wms_pending_order_detailI3` (`import_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111315810 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for wms_pending_order_que
-- ----------------------------
DROP TABLE IF EXISTS `wms_pending_order_que`;
CREATE TABLE `wms_pending_order_que` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `order_type` int(11) NOT NULL COMMENT 'OMS订单类型',
  `status` int(11) DEFAULT NULL COMMENT 'OMSj进入报缺前订单状态',
  `comments` varchar(255) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL,
  `send_oms_date` datetime DEFAULT NULL,
  `return_status` int(11) DEFAULT NULL,
  `error_code` varchar(255) DEFAULT NULL,
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父订单号',
  `loc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wms_pending_order_queI1` (`order_id`) USING BTREE,
  KEY `wms_pending_order_queI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74226270 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_pl_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_pl_detail`;
CREATE TABLE `wms_pl_detail` (
  `pl_id` int(11) NOT NULL COMMENT '损益单ID',
  `pl_seq_no` int(11) NOT NULL COMMENT '损益明细分录号',
  `wms_inv_id` int(11) DEFAULT NULL COMMENT '库存ID',
  `cc_qty` int(11) DEFAULT NULL COMMENT ' 盘点数量',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `reason_code` varchar(60) DEFAULT NULL,
  `process_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '报废处理方式（公司内售NS01、丢弃DQ01）',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `lot` varchar(50) NOT NULL DEFAULT '' COMMENT '批次 PK---同一批次，生产日期，保质期天数，失效日期应该是一样的，等待和用户确认',
  `mfg_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '生产日期',
  `shelf_life_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `expire_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '失效日期',
  PRIMARY KEY (`id`),
  KEY `wms_pl_detailI2` (`wms_inv_id`) USING BTREE,
  KEY `idx_wms_pl_id` (`pl_id`) USING BTREE,
  KEY `idx_entry_datetime` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1617920 DEFAULT CHARSET=utf8 COMMENT='WMS 损益明细';

-- ----------------------------
-- Table structure for wms_pl_header
-- ----------------------------
DROP TABLE IF EXISTS `wms_pl_header`;
CREATE TABLE `wms_pl_header` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pl_no` varchar(30) DEFAULT NULL COMMENT '损益单号',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pl_type_id` int(11) DEFAULT NULL COMMENT '损益类型(报损、报益）',
  `src_trans_type` int(11) DEFAULT NULL COMMENT 'type',
  `src_bill_no` varchar(30) DEFAULT NULL COMMENT '来源业务单据号',
  `src_bill_id` int(11) DEFAULT NULL COMMENT '来源业务单据ID',
  `bill_status` varchar(10) DEFAULT NULL COMMENT '单据状态',
  `total_qty` int(11) DEFAULT NULL COMMENT '总数量，随分录数量变化',
  `total_count` int(11) DEFAULT NULL COMMENT '货物条目数，随分录变化而变化',
  `comments` varchar(250) DEFAULT NULL COMMENT '备注',
  `audit_comments` varchar(250) DEFAULT NULL COMMENT '核定备注',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `auditor_id` int(11) DEFAULT NULL COMMENT '审核人',
  `auditor_date` datetime DEFAULT NULL COMMENT '审核时间',
  `inv_type` int(11) DEFAULT NULL COMMENT '正残属性()',
  `entry_name` varchar(32) DEFAULT NULL,
  `auditor_name` varchar(32) DEFAULT NULL,
  `business_type` varchar(2) DEFAULT NULL,
  `use_code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `wms_pl_headerI2` (`pl_no`) USING BTREE,
  KEY `wms_pl_headerI3` (`entry_datetime`) USING BTREE,
  KEY `wms_pl_headerI4` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174020 DEFAULT CHARSET=utf8 COMMENT='WMS 损益表';

-- ----------------------------
-- Table structure for wms_pl_header_attribute
-- ----------------------------
DROP TABLE IF EXISTS `wms_pl_header_attribute`;
CREATE TABLE `wms_pl_header_attribute` (
  `pl_id` int(11) NOT NULL,
  `attr_name` varchar(80) NOT NULL DEFAULT '',
  `attr_value` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`pl_id`,`attr_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_pl_reason
-- ----------------------------
DROP TABLE IF EXISTS `wms_pl_reason`;
CREATE TABLE `wms_pl_reason` (
  `reason_type` varchar(20) NOT NULL,
  `reason_value` varchar(250) NOT NULL,
  `reason_code` varchar(60) NOT NULL,
  `reason_enabled` char(2) NOT NULL COMMENT '激活的',
  `loc_code` varchar(80) NOT NULL COMMENT '仓库编码',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物理主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9968 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_profiles
-- ----------------------------
DROP TABLE IF EXISTS `wms_profiles`;
CREATE TABLE `wms_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL,
  `profile_type` varchar(20) DEFAULT NULL COMMENT '属性字段',
  `profile_value` varchar(100) DEFAULT NULL COMMENT '属性值',
  `profile_code` varchar(60) DEFAULT NULL,
  `active` char(1) DEFAULT NULL COMMENT '是否作废标识',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wms_profileI1` (`fid`,`profile_type`) USING BTREE,
  UNIQUE KEY `wms_profileI2` (`profile_type`,`profile_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_putaway_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_putaway_detail`;
CREATE TABLE `wms_putaway_detail` (
  `putaway_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `putaway_id` bigint(11) NOT NULL,
  `putaway_line_no` int(11) NOT NULL,
  `src_bill_item_id` bigint(11) DEFAULT NULL,
  `sku_id` int(11) NOT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `suggest_bin_loc` int(11) DEFAULT NULL,
  `recv_qty` int(11) NOT NULL DEFAULT '0',
  `totalputaway_qty` int(11) DEFAULT '0',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `entry_name` varchar(32) DEFAULT NULL,
  `short_flag` smallint(6) DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL COMMENT '事务类型',
  `frozen_send_erp` datetime DEFAULT NULL COMMENT '冻结库存上传到ERP时间',
  `wms_inv_id` int(11) DEFAULT '0' COMMENT '库存id',
  PRIMARY KEY (`putaway_item_id`),
  KEY `wms_putaway_detailI1` (`putaway_id`) USING BTREE,
  KEY `wms_putaway_detailI2` (`sku_id`,`lot`,`shelf_life_days`,`expire_date`) USING BTREE,
  KEY `wms_putaway_detailI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3813758 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_putaway_header
-- ----------------------------
DROP TABLE IF EXISTS `wms_putaway_header`;
CREATE TABLE `wms_putaway_header` (
  `putaway_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `putaway_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `container_id` int(11) DEFAULT NULL COMMENT '容器id',
  `owner_id` int(11) DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `dest_zone_id` int(11) DEFAULT NULL,
  `temp_zone_id` int(11) DEFAULT NULL COMMENT '选择的暂存区库区',
  `temp_bin_loc_id` int(11) DEFAULT NULL COMMENT '选择的暂存区货位',
  `status` int(11) DEFAULT NULL,
  `src_bill_id` bigint(11) DEFAULT NULL COMMENT '质检单id',
  `src_order_id` bigint(11) DEFAULT NULL COMMENT '采购订单id',
  `src_order_type` int(11) DEFAULT NULL COMMENT '采购订单类型',
  `total_sku_cnt` int(11) DEFAULT NULL,
  `total_sku_qty` int(11) DEFAULT NULL,
  `actual_sku_cnt` int(11) DEFAULT NULL,
  `actual_sku_qty` int(11) DEFAULT NULL,
  `discrep_sku_cnt` int(11) DEFAULT NULL,
  `discrep_sku_qty` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `putaway_woker` int(11) DEFAULT NULL,
  `putaway_date` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型',
  PRIMARY KEY (`putaway_id`),
  KEY `wms_putaway_headerI1` (`putaway_no`) USING BTREE,
  KEY `wms_putaway_headerI2` (`src_bill_id`) USING BTREE,
  KEY `wms_putaway_headerI3` (`src_order_id`,`src_order_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1856212 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_putaway_progress
-- ----------------------------
DROP TABLE IF EXISTS `wms_putaway_progress`;
CREATE TABLE `wms_putaway_progress` (
  `putaway_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `putaway_id` int(11) NOT NULL,
  `putaway_item_id` int(11) NOT NULL,
  `recv_qty` int(11) NOT NULL,
  `putaway_bin` int(11) DEFAULT NULL,
  `putaway_qty` int(11) DEFAULT '0',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`putaway_progress_id`),
  KEY `wms_putaway_progressI1` (`putaway_id`) USING BTREE,
  KEY `wms_putaway_progressI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3888548 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_putaway_src_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_putaway_src_item`;
CREATE TABLE `wms_putaway_src_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `putaway_id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_type` int(11) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(100) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `shelf_life_day` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wms_putaway_src_itemI1` (`order_id`),
  KEY `wms_putaway_src_itemI2` (`entry_datetime`),
  KEY `wms_putaway_src_itemI3` (`sku_id`,`lot`)
) ENGINE=InnoDB AUTO_INCREMENT=2688174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_reason
-- ----------------------------
DROP TABLE IF EXISTS `wms_reason`;
CREATE TABLE `wms_reason` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(64) NOT NULL DEFAULT '' COMMENT '原因',
  `code_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1 加工差异原因',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT 'warehouse 编号',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态: 0 新增, 1 启用, -1 废弃',
  `create_name` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=740 DEFAULT CHARSET=utf8 COMMENT='WMS系统原因表';

-- ----------------------------
-- Table structure for wms_suggestbin_poor
-- ----------------------------
DROP TABLE IF EXISTS `wms_suggestbin_poor`;
CREATE TABLE `wms_suggestbin_poor` (
  `poor_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL,
  `lot` varchar(50) NOT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `loc_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `suggest_bin_loc` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`poor_id`),
  KEY `wms_suggestbin_poorI2` (`sku_id`,`lot`,`expire_date`,`zone_id`,`loc_id`) USING BTREE,
  KEY `wms_suggestbin_poorI1` (`suggest_bin_loc`) USING BTREE,
  KEY `wms_suggestbin_poorI3` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2850384 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_trans_type
-- ----------------------------
DROP TABLE IF EXISTS `wms_trans_type`;
CREATE TABLE `wms_trans_type` (
  `trans_id` int(11) NOT NULL,
  `trans_type` varchar(50) DEFAULT NULL,
  `inv_falg` char(1) DEFAULT 'N',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wms_zone
-- ----------------------------
DROP TABLE IF EXISTS `wms_zone`;
CREATE TABLE `wms_zone` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loc_no` int(11) DEFAULT NULL COMMENT '仓库编号',
  `zone_no` varchar(50) DEFAULT NULL COMMENT '库区编码',
  `zone_name` varchar(100) DEFAULT NULL COMMENT '库区名称',
  `temporature_value` varchar(50) DEFAULT NULL COMMENT '温度属性',
  `purpose` varchar(30) DEFAULT NULL COMMENT '用途属性',
  `inv_type` varchar(30) DEFAULT NULL COMMENT '货物属性',
  `return_flag` varchar(20) DEFAULT NULL COMMENT '退货属性',
  `replenish_flag` varchar(20) DEFAULT NULL COMMENT '补货属性',
  `transit_flag` varchar(20) DEFAULT NULL COMMENT '流转属性',
  `precious` varchar(20) DEFAULT NULL COMMENT '贵重商品标识',
  `multi_prod` varchar(20) DEFAULT NULL COMMENT '货位品种属性',
  `multi_owner` varchar(50) DEFAULT NULL COMMENT '货位货主属性',
  `zone_sequence` varchar(20) DEFAULT NULL COMMENT '货区序号',
  `zone_status` varchar(20) DEFAULT NULL COMMENT '库区状态，启用',
  `effective_datetime` datetime DEFAULT NULL COMMENT '启用日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_id` varchar(250) DEFAULT NULL COMMENT '修改人',
  `entry_id` varchar(250) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `temp_area_id` smallint(6) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `dry_flag` char(1) DEFAULT NULL COMMENT 'Y 是, N 否',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `wms_zoneI3` (`zone_no`,`loc_no`) USING BTREE,
  KEY `wms_zoneI2` (`loc_no`) USING BTREE,
  KEY `wms_zoneI4` (`temp_area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=994 DEFAULT CHARSET=utf8 COMMENT='库区表';

-- ----------------------------
-- Table structure for work_alloc_inv_que
-- ----------------------------
DROP TABLE IF EXISTS `work_alloc_inv_que`;
CREATE TABLE `work_alloc_inv_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `alloc_status` int(11) NOT NULL DEFAULT '0' COMMENT '占用状态1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8456 DEFAULT CHARSET=utf8 COMMENT='加工库存占用队列';

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '加工单id, ERP传入',
  `process_id` int(11) NOT NULL COMMENT '加工单id, ERP传入',
  `process_name` varchar(128) DEFAULT NULL COMMENT '加工单名称',
  `process_code` varchar(32) DEFAULT NULL COMMENT '加工单编号',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `plan_work_date` datetime DEFAULT NULL COMMENT '计划生产日期',
  `is_lot` smallint(6) DEFAULT NULL COMMENT '是否指定批次',
  `use_sku_type` smallint(6) DEFAULT NULL COMMENT '加工单原料使用类型 0：按原料计划生产\r\n1：按成品计划生产，补料\r\n2：按成品计划生产，不补料',
  `process_type` smallint(6) DEFAULT NULL COMMENT '加工单类型，0：单一品加工；1：多成品合装',
  `product_number` int(11) DEFAULT NULL COMMENT '生产成品数量',
  `real_product_num` int(11) DEFAULT NULL COMMENT '实际生产成品数量，由仓库回传得到',
  `process_state` smallint(6) DEFAULT NULL COMMENT '加工单状态，有仓库回传得到,0:新建  1：加工中 2：加工完成 3:取消生产',
  `plan_top_sku_cnt` int(11) DEFAULT NULL COMMENT '预计成品品种数',
  `plan_top_sku_qty` int(11) DEFAULT NULL COMMENT ' 预计成品数量',
  `top_sku_cnt` int(11) DEFAULT NULL COMMENT '实际成品品种数',
  `top_sku_qty` int(11) DEFAULT NULL COMMENT '实际成品数量',
  `difference_reason` varchar(64) NOT NULL DEFAULT '' COMMENT '加工差异原因',
  `pick_date` datetime DEFAULT NULL COMMENT '原料下架时间',
  `comp_sku_cnt` int(11) DEFAULT NULL COMMENT '原料品种数',
  `comp_sku_qty` int(11) DEFAULT NULL COMMENT '原料总数量',
  `finish_date` datetime DEFAULT NULL COMMENT '成品上架时间',
  `mfg_opt_date` datetime DEFAULT NULL COMMENT '生产情况录入时间',
  `mfg_opt_id` int(11) DEFAULT NULL COMMENT '生产情况录入人',
  `entry_id` int(10) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `comp_off_sve_byid` int(10) DEFAULT NULL COMMENT '下架操作人id',
  `comp_off_sve_byname` varchar(50) DEFAULT NULL COMMENT '下架操作人名',
  `top_on_sve_byid` int(10) DEFAULT NULL COMMENT '上架操作人id',
  `top_on_sve_byname` varchar(50) DEFAULT NULL COMMENT '上架操作人名',
  `cancel_proc_byid` int(10) DEFAULT NULL COMMENT '取消加工单人id',
  `cancel_proc_byname` varchar(50) DEFAULT NULL COMMENT '取消加工单人名',
  `cancel_proc_cause` varchar(250) DEFAULT NULL COMMENT '取消原因',
  `cancel_proc_date` datetime DEFAULT NULL,
  `comp_off_sve_date` datetime DEFAULT NULL,
  `top_on_sve_date` datetime DEFAULT NULL,
  `entry_name` varchar(50) DEFAULT NULL COMMENT '加工信息录入人',
  `mfg_opt_name` varchar(50) DEFAULT NULL,
  `is_book_num` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0默认流程不变 １加工系统进行接口调用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_order_topI1` (`order_id`) USING BTREE,
  KEY `work_orderI1` (`process_id`) USING BTREE,
  KEY `work_orderI2` (`finish_date`) USING BTREE,
  KEY `work_orderI3` (`entry_datetime`) USING BTREE,
  KEY `idx_pcode` (`process_code`(10))
) ENGINE=InnoDB AUTO_INCREMENT=868202 DEFAULT CHARSET=utf8 COMMENT='加工单';

-- ----------------------------
-- Table structure for work_order_comp
-- ----------------------------
DROP TABLE IF EXISTS `work_order_comp`;
CREATE TABLE `work_order_comp` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_sku_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL COMMENT 'OMS加工单ID',
  `bom_sku_id` int(11) DEFAULT NULL COMMENT '物料清单bom原料表id',
  `purchase_id` int(11) DEFAULT NULL,
  `purchase_code` varchar(32) DEFAULT NULL COMMENT '原料采购订单号',
  `sku_id` int(11) NOT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `upc_no` varchar(64) DEFAULT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `order_qty` int(11) NOT NULL,
  `real_qty` int(11) NOT NULL,
  `damage_qty` int(11) DEFAULT NULL,
  `left_qty` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`comp_id`),
  UNIQUE KEY `work_ocidx` (`order_id`,`sku_id`,`lot`) USING BTREE,
  KEY `work_order_compI1` (`process_sku_id`) USING BTREE,
  KEY `work_order_compI3` (`bom_sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3894024 DEFAULT CHARSET=utf8 COMMENT='加工单物料明细表';

-- ----------------------------
-- Table structure for work_order_comp_cost
-- ----------------------------
DROP TABLE IF EXISTS `work_order_comp_cost`;
CREATE TABLE `work_order_comp_cost` (
  `cost_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT '0' COMMENT '当前加工单号',
  `sku_id` int(11) DEFAULT '0' COMMENT '当前加工单的sku_id',
  `lot` varchar(50) DEFAULT '' COMMENT '当前加工单的批次',
  `mfg_date` date DEFAULT '1970-01-01' COMMENT '当前原料sku加工日期',
  `shelf_life_days` int(11) DEFAULT '0' COMMENT '当前加工单原料的保质期天数',
  `expire_date` date DEFAULT '1970-01-01' COMMENT '当前加工单原料失效日期',
  `order_qty` int(11) DEFAULT '0' COMMENT '当前加工单原料使用数量 wipSplitNum 拆分数量',
  `src_order_id` bigint(20) DEFAULT '0' COMMENT '来源组装加工单号 purchaseId',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_id` int(11) DEFAULT '0' COMMENT '添加人',
  `entry_name` varchar(30) DEFAULT '' COMMENT '添加人名',
  `bom_id` int(11) DEFAULT '0' COMMENT '来源组装加工bomid  冗余字段取消使用',
  `id` bigint(20) DEFAULT '0' COMMENT '申请拆分订单id   冗余字段取消使用',
  `wip_num` int(11) DEFAULT '0' COMMENT '原加工单成品数量  冗余字段取消使用',
  `wip_out_num` int(11) DEFAULT '0' COMMENT '原加工单成品出库数量  冗余字段取消使用',
  `create_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '原加工单创建时间  冗余字段取消使用',
  PRIMARY KEY (`cost_id`),
  KEY `order_idindex` (`order_id`) USING BTREE,
  KEY `src_order_idindex` (`src_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9116 DEFAULT CHARSET=utf8 COMMENT='保存拆分单原料和来源加工单的成品的关系';

-- ----------------------------
-- Table structure for work_order_create_que
-- ----------------------------
DROP TABLE IF EXISTS `work_order_create_que`;
CREATE TABLE `work_order_create_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '原加工单id',
  `new_order_id` int(11) DEFAULT NULL COMMENT '新生成加工单ID',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `plan_work_date` datetime DEFAULT NULL COMMENT '计划生产日期',
  `use_sku_type` smallint(6) DEFAULT NULL COMMENT '加工单原料使用类型 0：按原料计划生产\r\n1：按成品计划生产，补料\r\n2：按成品计划生产，不补料',
  `sku_type` smallint(6) DEFAULT NULL COMMENT '1：实体组套；2：虚拟组套   必填',
  `product_number` int(11) DEFAULT NULL COMMENT '生产成品数量',
  `order_qty` int(11) NOT NULL COMMENT '加工单订单数量',
  `real_qty` int(11) NOT NULL COMMENT '实际加工数量',
  `bom_id` int(11) DEFAULT NULL COMMENT '物料清单bom  id',
  `bom_no` varchar(32) DEFAULT NULL,
  `sku_id` int(11) NOT NULL,
  `sku_name` varchar(32) DEFAULT NULL,
  `buyer` varchar(32) DEFAULT NULL COMMENT '采购员',
  `entry_name` varchar(50) DEFAULT NULL COMMENT '加工信息录入人',
  `entry_datetime` timestamp NULL DEFAULT NULL,
  `update_datetime` timestamp NULL DEFAULT NULL,
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态表示0:成功;1:失败"',
  `error_code` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`),
  KEY `work_order_create_queI3` (`entry_datetime`) USING BTREE,
  KEY `work_order_create_queI1` (`order_id`,`bom_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63736 DEFAULT CHARSET=utf8 COMMENT='加工单创建队列';

-- ----------------------------
-- Table structure for work_order_status
-- ----------------------------
DROP TABLE IF EXISTS `work_order_status`;
CREATE TABLE `work_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '加工单ID',
  `status` smallint(6) DEFAULT NULL COMMENT '订单状态',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `response_date` datetime DEFAULT NULL COMMENT '响应时间',
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态表示',
  `error_code` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `last_send_time` datetime DEFAULT NULL COMMENT '最后一次同步时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '1:需要上传, 0 不需要',
  `status_desc` varchar(32) DEFAULT NULL COMMENT '状态说明',
  PRIMARY KEY (`id`),
  KEY `work_order_statusI1` (`order_id`) USING BTREE,
  KEY `work_order_statusI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2173224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_order_top
-- ----------------------------
DROP TABLE IF EXISTS `work_order_top`;
CREATE TABLE `work_order_top` (
  `top_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT 'OMS加工单ID',
  `bom_id` int(11) DEFAULT NULL COMMENT '物料清单bom  id',
  `bom_no` varchar(32) DEFAULT NULL COMMENT 'the number of bom',
  `sku_id` int(11) NOT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `upc_no` varchar(32) DEFAULT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `order_qty` int(11) NOT NULL,
  `real_qty` int(11) NOT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `bin_loc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`top_id`),
  KEY `work_order_topI1` (`order_id`) USING BTREE,
  KEY `work_order_topI3` (`bom_id`) USING BTREE,
  KEY `work_order_topI2` (`sku_id`,`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=912576 DEFAULT CHARSET=utf8 COMMENT='加工单成品表';

-- ----------------------------
-- Table structure for work_order_top_cost
-- ----------------------------
DROP TABLE IF EXISTS `work_order_top_cost`;
CREATE TABLE `work_order_top_cost` (
  `cost_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT '0' COMMENT '当前加工单号',
  `sku_id` int(11) DEFAULT '0' COMMENT '当前加工单的sku_id',
  `lot` varchar(50) DEFAULT '' COMMENT '当前加工单的批次',
  `mfg_date` date DEFAULT '1970-01-01' COMMENT '当前成品sku加工日期',
  `shelf_life_days` int(11) DEFAULT '0' COMMENT '当前加工单成品的保质期天数',
  `expire_date` date DEFAULT '1970-01-01' COMMENT '当前加工单成品失效日期',
  `order_qty` int(11) DEFAULT '0' COMMENT '当前加工单成品数量',
  `src_order_id` bigint(20) DEFAULT '0' COMMENT '来源组装加工单号',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_id` int(11) DEFAULT '0' COMMENT '添加人',
  `entry_name` varchar(30) DEFAULT '' COMMENT '添加人名',
  `id` bigint(20) DEFAULT '0' COMMENT '申请拆分订单id  冗余字段取消使用',
  `src_num` int(11) DEFAULT '0' COMMENT '原料实际使用数量  冗余字段取消使用',
  `out_num` int(11) NOT NULL DEFAULT '0' COMMENT '原料实际出库数量  冗余字段取消使用',
  `bom_id` bigint(20) DEFAULT '0' COMMENT '原料bomid  冗余字段取消使用',
  `purchase_id` bigint(20) DEFAULT '0' COMMENT '采购单号',
  `add_time` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '加工单拆分原料添加时间  冗余字段取消使用',
  `receipt_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传erp的时候需要带着的业务id',
  PRIMARY KEY (`cost_id`),
  KEY `order_idindex` (`order_id`),
  KEY `src_order_idindex` (`src_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59228 DEFAULT CHARSET=utf8 COMMENT='保存拆分加工单的成品和来源组装加工单的原料的关系';

/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : tmscoredb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:47:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assign_carrier_fail_log
-- ----------------------------
DROP TABLE IF EXISTS `assign_carrier_fail_log`;
CREATE TABLE `assign_carrier_fail_log` (
  `order_id` bigint(11) NOT NULL COMMENT '订单号',
  `loc_id` int(11) NOT NULL COMMENT '仓库id',
  `to_province` varchar(32) DEFAULT '' COMMENT '收货省',
  `to_city` varchar(32) DEFAULT '' COMMENT '收货市',
  `to_district` varchar(32) DEFAULT '' COMMENT '收货区',
  `from_province` varchar(20) NOT NULL DEFAULT '' COMMENT '发件省',
  `from_city` varchar(50) NOT NULL DEFAULT '' COMMENT '发件市',
  `from_area` varchar(50) NOT NULL DEFAULT '' COMMENT '发件区',
  `to_4th_addr` varchar(32) DEFAULT '' COMMENT '收货4级地址',
  `to_address` varchar(100) DEFAULT '' COMMENT '收货地址',
  `order_src` int(11) DEFAULT NULL COMMENT '订单来源',
  `order_class` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:销售单、2:领用单',
  `group_name` varchar(255) DEFAULT '' COMMENT '订单温区',
  `abnormal_cause` varchar(255) DEFAULT '' COMMENT '异常原因',
  `repeat_times` int(11) DEFAULT '1' COMMENT '获取快递次数',
  `send_times` int(11) DEFAULT '0' COMMENT '邮件发送次数',
  `is_success` tinyint(1) DEFAULT '0' COMMENT '是否分配成功 1：是 0：否',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`order_id`),
  KEY `entry_didx` (`entry_datetime`) USING BTREE,
  KEY `fuhe_repeat_tidx` (`repeat_times`,`is_success`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单分配失败日志表';

-- ----------------------------
-- Table structure for b
-- ----------------------------
DROP TABLE IF EXISTS `b`;
CREATE TABLE `b` (
  `order_id` bigint(20) DEFAULT NULL,
  `weight` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `sku_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '商品类型：1、普通商品，2、虚拟组套，3、虚拟组套子商品，4、积分商城优惠券',
  `kit_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟组套套装商品ID',
  PRIMARY KEY (`id`),
  KEY `box_detailI1` (`box_id`) USING BTREE,
  KEY `idx_entry_date` (`entry_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112727870 DEFAULT CHARSET=utf8 COMMENT='订单包件单明细表';

-- ----------------------------
-- Table structure for box_header
-- ----------------------------
DROP TABLE IF EXISTS `box_header`;
CREATE TABLE `box_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_type` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1:普通包裹, 2:保温箱, 3:独立成箱',
  `warm_box_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '保温箱号',
  `box_cnt` int(11) DEFAULT NULL COMMENT '当前作业单包裹数量',
  `box_sequence` int(11) DEFAULT NULL COMMENT '当前包裹序号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '作业单ID',
  `logistics_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流订单号',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单ID',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `owner_id` int(11) DEFAULT NULL COMMENT '货主ID',
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `track_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运单号',
  `status` int(11) DEFAULT NULL COMMENT '包件单状态: 0初始化, 1新增包裹, 5质检确认, 6订单称重, 7 批次交接出库 ',
  `status_datetime` datetime DEFAULT NULL COMMENT '状态变更时间',
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
  `actual_weight` decimal(32,6) DEFAULT NULL,
  `print_status` int(11) DEFAULT '0',
  `price_hide_flag` smallint(6) DEFAULT NULL COMMENT '1、隐藏 2、显示',
  `sl_print_cnt` int(11) DEFAULT '0' COMMENT '运单打印次数',
  `pl_print_cnt` int(11) DEFAULT '0' COMMENT '清单打印次数',
  `package_type` int(11) DEFAULT NULL COMMENT '1.普通包装 2.环保包装',
  `import_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否同步到配送系统 1：yes， 0: NO',
  `import_datetime` datetime DEFAULT NULL COMMENT '是否同步到配送系统',
  `temp_area_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包裹配送温区',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `box_headerI1` (`box_id`) USING BTREE,
  UNIQUE KEY `box_header2` (`box_no`) USING BTREE,
  KEY `box_headerI3` (`order_id`,`order_type`) USING BTREE,
  KEY `box_headerI6` (`pick_list_id`) USING BTREE,
  KEY `box_headerI7` (`entry_datetime`) USING BTREE,
  KEY `box_headerI4` (`parent_order_id`) USING BTREE,
  KEY `box_headerI5` (`track_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53799894 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单包件单表头';

-- ----------------------------
-- Table structure for box_header3
-- ----------------------------
DROP TABLE IF EXISTS `box_header3`;
CREATE TABLE `box_header3` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `box_headerI1` (`box_id`) USING BTREE,
  UNIQUE KEY `box_header2` (`box_no`) USING BTREE,
  KEY `box_headerI3` (`order_id`,`order_type`) USING BTREE,
  KEY `box_headerI6` (`pick_list_id`) USING BTREE,
  KEY `box_headerI7` (`entry_datetime`) USING BTREE,
  KEY `box_headerI4` (`parent_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2735304 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单包件单表头';

-- ----------------------------
-- Table structure for cac_order_source
-- ----------------------------
DROP TABLE IF EXISTS `cac_order_source`;
CREATE TABLE `cac_order_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `code` varchar(30) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cac_profiles
-- ----------------------------
DROP TABLE IF EXISTS `cac_profiles`;
CREATE TABLE `cac_profiles` (
  `config_id` int(11) NOT NULL COMMENT '快递配置ID, 参与业务逻辑判断',
  `carrier_id` int(11) NOT NULL COMMENT '快递公司ID, 数据冗余， 不做业务逻辑判断',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID， 不做业务逻辑判断',
  `prof_type` varchar(10) DEFAULT NULL COMMENT '属性类型:ORDER_SRC:数据来源1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP，TEMP_AREA:配送温区',
  `prof_c` varchar(32) DEFAULT NULL COMMENT '字符类型值',
  `prof_i` int(11) DEFAULT NULL COMMENT '数值类型值',
  `prof_d` datetime DEFAULT NULL COMMENT '日期类型值',
  `comments` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  KEY `cac_profilesI1` (`config_id`),
  KEY `cac_profilesI2` (`prof_type`,`prof_i`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递分配枚举属性配置表';

-- ----------------------------
-- Table structure for cac_shipfrom
-- ----------------------------
DROP TABLE IF EXISTS `cac_shipfrom`;
CREATE TABLE `cac_shipfrom` (
  `config_id` int(11) NOT NULL COMMENT '快递分配ID',
  `loc_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `carrier_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `from_country` varchar(32) DEFAULT NULL COMMENT '发货国家',
  `from_province` varchar(32) DEFAULT NULL COMMENT '发货省',
  `from_city` varchar(32) DEFAULT NULL COMMENT '发货市',
  `from_district` varchar(100) DEFAULT NULL COMMENT '发货区',
  `from_4th_addr` varchar(32) DEFAULT NULL COMMENT '发货四级地址',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `from_province_code` varchar(32) DEFAULT NULL,
  `from_city_code` varchar(32) DEFAULT NULL,
  `from_district_code` varchar(32) DEFAULT NULL,
  `from_4th_code` varchar(32) DEFAULT NULL,
  KEY `cac_ship_addressI1` (`config_id`),
  KEY `cac_ship_addressI2` (`from_country`,`from_province`,`from_city`,`from_district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递分配规则，发货地址配置表';

-- ----------------------------
-- Table structure for cac_shipto
-- ----------------------------
DROP TABLE IF EXISTS `cac_shipto`;
CREATE TABLE `cac_shipto` (
  `config_id` int(11) NOT NULL COMMENT '快递分配ID',
  `loc_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `carrier_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `to_country` varchar(32) DEFAULT NULL COMMENT '收货国际',
  `to_province` varchar(32) DEFAULT NULL COMMENT '收货省',
  `to_city` varchar(32) DEFAULT NULL COMMENT '收货市',
  `to_district` varchar(32) DEFAULT NULL COMMENT '收货区',
  `to_4th_addr` varchar(32) DEFAULT NULL COMMENT '收货4级地址',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `to_province_code` varchar(32) DEFAULT NULL,
  `to_city_code` varchar(32) DEFAULT NULL,
  `to_district_code` varchar(32) DEFAULT NULL,
  `to_4th_code` varchar(32) DEFAULT NULL,
  KEY `cac_shiptoI1` (`config_id`),
  KEY `cac_shiptoI2` (`to_district`,`to_city`,`to_province`,`to_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递分配规则，收货地址配置表';

-- ----------------------------
-- Table structure for cac_shipto_bak
-- ----------------------------
DROP TABLE IF EXISTS `cac_shipto_bak`;
CREATE TABLE `cac_shipto_bak` (
  `config_id` int(11) NOT NULL COMMENT '快递分配ID',
  `loc_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `carrier_id` int(11) DEFAULT NULL COMMENT '不参与分配逻辑',
  `to_country` varchar(32) DEFAULT NULL COMMENT '收货国际',
  `to_province` varchar(32) DEFAULT NULL COMMENT '收货省',
  `to_city` varchar(32) DEFAULT NULL COMMENT '收货市',
  `to_district` varchar(32) DEFAULT NULL COMMENT '收货区',
  `to_4th_addr` varchar(32) DEFAULT NULL COMMENT '收货4级地址',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `to_province_code` varchar(32) DEFAULT NULL,
  `to_city_code` varchar(32) DEFAULT NULL,
  `to_district_code` varchar(32) DEFAULT NULL,
  `to_4th_code` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier
-- ----------------------------
DROP TABLE IF EXISTS `carrier`;
CREATE TABLE `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` bigint(30) NOT NULL COMMENT '快递公司id',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT '快递公司编码',
  `carrier_name` varchar(128) DEFAULT NULL COMMENT '快递公司名称',
  `carrierr_address` varchar(512) DEFAULT NULL COMMENT '快递公司地址',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮政编码',
  `carrier_type_id` int(4) DEFAULT NULL COMMENT '快递公司类型',
  `tel` varchar(24) DEFAULT NULL COMMENT '电话',
  `fax` varchar(24) DEFAULT NULL COMMENT '传真',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '添加人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrierI1` (`carrier_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=8001060 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_assign_config
-- ----------------------------
DROP TABLE IF EXISTS `carrier_assign_config`;
CREATE TABLE `carrier_assign_config` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `config_id` int(11) NOT NULL,
  `loc_id` int(11) NOT NULL COMMENT '仓库ID',
  `carrier_id` int(11) NOT NULL COMMENT '快递公司',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `delivery_spot` char(1) DEFAULT NULL COMMENT '是否需要配送站点',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `supplier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修该人ID',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人名称',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `active` char(1) DEFAULT NULL COMMENT '启用(Y启用, N停用)',
  `enable_id` int(11) DEFAULT NULL COMMENT '启用人ID',
  `enable_name` varchar(32) DEFAULT NULL COMMENT '启用人名称',
  `enable_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `disable_id` int(11) DEFAULT NULL COMMENT '停用人ID',
  `disable_name` varchar(32) DEFAULT NULL COMMENT '停用人名称',
  `disable_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  `cod_flag` smallint(6) NOT NULL DEFAULT '0',
  `max_day_qty` int(11) DEFAULT NULL,
  `from_country` varchar(32) DEFAULT NULL COMMENT 'useless now replaced by cac_shipfrom',
  `from_province` varchar(32) DEFAULT NULL COMMENT 'useless now replaced by cac_shipfrom',
  `from_city` varchar(32) DEFAULT NULL COMMENT 'useless now replaced by cac_shipfrom',
  `from_district` varchar(32) DEFAULT NULL COMMENT 'useless now replaced by cac_shipfrom',
  `from_4th_addr` varchar(32) DEFAULT NULL COMMENT 'useless now replaced by cac_shipfrom',
  `effective_start_datetime` time DEFAULT NULL COMMENT '生效时间:起始时间',
  `effective_end_datetime` time DEFAULT NULL COMMENT '生效时间：截至时间',
  `effective_flag` smallint(6) DEFAULT NULL COMMENT '生效时间标识 1、包含 0 、不包含',
  `force_4th` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否强制四级地址分配：0否， 1是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrier_assign_configI5` (`config_id`) USING BTREE,
  UNIQUE KEY `carrier_assign_configI4` (`loc_id`,`priority`) USING BTREE,
  KEY `carrier_assign_configI3` (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_daily_assign_cnt
-- ----------------------------
DROP TABLE IF EXISTS `carrier_daily_assign_cnt`;
CREATE TABLE `carrier_daily_assign_cnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` bigint(30) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `assign_date` date NOT NULL DEFAULT '1971-01-01',
  `order_cnt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrier_daily_assign_cntI1` (`assign_date`,`carrier_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138522 DEFAULT CHARSET=utf8 COMMENT='单日运单数量';

-- ----------------------------
-- Table structure for carrier_exp_detail
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_detail`;
CREATE TABLE `carrier_exp_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_header_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `in_tms_date` datetime DEFAULT NULL COMMENT '进入tms时间',
  `from_province` varchar(20) DEFAULT NULL COMMENT '订单省',
  `from_city` varchar(50) DEFAULT NULL COMMENT '订单市',
  `from_area` varchar(50) DEFAULT NULL COMMENT '订单区',
  `weight` float DEFAULT NULL COMMENT '订单重量',
  `first_weight` double(32,4) DEFAULT NULL COMMENT '首重',
  `first_exp` double(32,4) DEFAULT NULL COMMENT '首重价格',
  `continue_weight` double(32,4) DEFAULT NULL COMMENT '续重',
  `continue_exp` double(32,4) DEFAULT NULL COMMENT '续重价格',
  `expense` double(10,0) DEFAULT NULL COMMENT '订单运费',
  `start_date` datetime DEFAULT NULL COMMENT '模板开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '模板结束时间',
  `carrexptemp_id` varchar(32) DEFAULT NULL COMMENT '快递运费模板id',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_exp_header
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_header`;
CREATE TABLE `carrier_exp_header` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '流水',
  `loc_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL COMMENT '统计开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '统计结束时间',
  `carrier_id` varchar(64) DEFAULT NULL COMMENT '快递公司id',
  `total_expense` double DEFAULT NULL COMMENT '快递费用',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_name` varchar(32) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_exp_temp_detail
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_temp_detail`;
CREATE TABLE `carrier_exp_temp_detail` (
  `exp_id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '模板明细id',
  `region_id` bigint(30) NOT NULL COMMENT '地区id',
  `carrexptemp_id` bigint(30) NOT NULL COMMENT '运费模板id',
  `carrexptemp_code` varchar(32) DEFAULT NULL,
  `region_code` varchar(32) DEFAULT NULL,
  `first_weight` double(32,4) DEFAULT NULL COMMENT '首重重量',
  `first_exp` double(32,4) DEFAULT NULL COMMENT '首重费用',
  `continue_weight` double(16,4) DEFAULT NULL COMMENT '续重重量',
  `continue_exp` double(32,4) DEFAULT NULL COMMENT '续重费用',
  `cod_Ratio` double(32,4) DEFAULT NULL COMMENT '货到付款收费比率',
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=848174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_exp_temp_header
-- ----------------------------
DROP TABLE IF EXISTS `carrier_exp_temp_header`;
CREATE TABLE `carrier_exp_temp_header` (
  `carrexptemp_id` bigint(30) NOT NULL COMMENT '运费模板id',
  `ware_id` bigint(30) NOT NULL COMMENT '仓库id',
  `carrier_id` bigint(30) NOT NULL,
  `carrexptemp_code` varchar(32) DEFAULT NULL,
  `carrexptemp_name` varchar(128) DEFAULT NULL COMMENT '快递运费模板名称',
  `carrexptemp_note` varchar(512) DEFAULT NULL COMMENT '快递模板描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `run_status` int(1) DEFAULT '0' COMMENT '启动状态0存盘 1停用 2启用',
  `run_by` varchar(32) DEFAULT NULL COMMENT '启动人',
  `run_date` datetime DEFAULT NULL COMMENT '启动时间',
  `stop_by` varchar(32) DEFAULT NULL COMMENT '停用人',
  `stop_date` datetime DEFAULT NULL COMMENT '停用时间',
  PRIMARY KEY (`carrexptemp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_extends_prof
-- ----------------------------
DROP TABLE IF EXISTS `carrier_extends_prof`;
CREATE TABLE `carrier_extends_prof` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id no biz meaning',
  `carrier_id` int(11) NOT NULL COMMENT 'carrier ID',
  `prof_type` varchar(32) DEFAULT NULL COMMENT 'profile type: 快递月结号：Month_Account_No',
  `prof_value` varchar(100) DEFAULT NULL COMMENT 'profile value',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `entry_date` datetime DEFAULT NULL COMMENT '创建日期',
  `active` smallint(6) DEFAULT NULL COMMENT '是否启用:1启用，others 未启用',
  PRIMARY KEY (`id`),
  KEY `carrier_extends_profI1` (`carrier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8 COMMENT='快递公司扩展信息配置表';

-- ----------------------------
-- Table structure for carrier_finance_info
-- ----------------------------
DROP TABLE IF EXISTS `carrier_finance_info`;
CREATE TABLE `carrier_finance_info` (
  `carrier_id` int(11) NOT NULL COMMENT '快递公司ID',
  `pay_type` varchar(32) DEFAULT NULL COMMENT '付款方式：寄付月结，转第三方付',
  `account` varchar(32) DEFAULT NULL COMMENT '月结账号',
  `security_key` varchar(32) DEFAULT NULL,
  `partner` varchar(50) DEFAULT NULL COMMENT '第三方partner',
  `verify_key` varchar(50) DEFAULT NULL COMMENT '快递校验key',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carrier_service
-- ----------------------------
DROP TABLE IF EXISTS `carrier_service`;
CREATE TABLE `carrier_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `service_id` varchar(8) NOT NULL COMMENT '快递服务标示',
  `service_desc` varchar(32) DEFAULT NULL COMMENT '快递服务简介',
  `import_type` smallint(6) NOT NULL COMMENT '导入类型：1：需要import， 0不需要独立import',
  `import_service` varchar(32) DEFAULT NULL COMMENT '订单导入接口',
  `import_url` varchar(100) DEFAULT NULL COMMENT '订单导入URL',
  `track_type` smallint(6) DEFAULT NULL COMMENT '1:TMS生成， 2 WMS 生成， 3， 快递系统生成',
  `track_service` varchar(32) DEFAULT NULL COMMENT '获取运单号服务',
  `track_url` varchar(100) DEFAULT NULL COMMENT '获取运单号URL',
  `route_type` varchar(10) NOT NULL COMMENT '获取路由状态方式：push:对方主动推/pull：我们自己拉',
  `route_push_service` varchar(32) DEFAULT NULL COMMENT '我们接受的接口名称',
  `route_push_url` varchar(100) DEFAULT NULL COMMENT '我们接受路由状态的URL地址',
  `route_service` varchar(32) DEFAULT NULL COMMENT '对方提供的路由状态查询接口服务名称',
  `route_url` varchar(100) DEFAULT NULL COMMENT '对方提供的路由状态查询接口服务URL',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `point_type` smallint(6) DEFAULT '0' COMMENT '1 需要获取配送站点， 0 不需要获取配送站点',
  `box_import` smallint(6) unsigned zerofill DEFAULT '000000' COMMENT '是否需要导入包裹:1 需要， 0 不需要',
  PRIMARY KEY (`id`),
  KEY `carrier_serviceI1` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
-- Table structure for collect_task
-- ----------------------------
DROP TABLE IF EXISTS `collect_task`;
CREATE TABLE `collect_task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '提货任务ID',
  `task_no` varchar(32) DEFAULT '' COMMENT '提货单号:TH+日期+三位流水',
  `trans_com_id` int(11) DEFAULT '0' COMMENT '运输公司Id',
  `carrier_car_license` varchar(32) DEFAULT '' COMMENT '车牌号',
  `driver` varchar(32) DEFAULT '' COMMENT '司机',
  `driver_phone` varchar(24) DEFAULT '' COMMENT '司机电话',
  `mileage` double DEFAULT NULL COMMENT '里程',
  `expense` decimal(16,4) DEFAULT '0.0000' COMMENT '总费用',
  `road_toll` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '过路费（元）',
  `parking_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '停车费（元）',
  `collection_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '取货费（元）',
  `other_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '其他费用（元）',
  `sku_cnt` int(11) DEFAULT '0' COMMENT '品种数',
  `sku_qty` int(11) DEFAULT '0' COMMENT '总数量',
  `reject_reason` varchar(255) DEFAULT '' COMMENT '驳回原因',
  `return_status` smallint(6) DEFAULT '0' COMMENT '0,未回传;1:成功;-1:失败',
  `status` smallint(6) DEFAULT '0' COMMENT '1:新建, 2:提货登记, 3:提交审核, 4:审核通过, 5:驳回, 6:取消 ',
  `comment` varchar(255) DEFAULT '' COMMENT '备注',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '创建人员',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(32) DEFAULT '' COMMENT '修改人员',
  `register_datetime` datetime DEFAULT NULL COMMENT '登记时间',
  `register_name` varchar(32) DEFAULT '' COMMENT '登记人员',
  `commit_datetime` datetime DEFAULT NULL COMMENT '提交时间',
  `commit_name` varchar(32) DEFAULT '' COMMENT '提交人员',
  `check_name` varchar(32) DEFAULT '' COMMENT '审核人员',
  `check_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `cancel_datetime` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_name` varchar(32) DEFAULT '' COMMENT '取消人员',
  PRIMARY KEY (`task_id`),
  KEY `collect_taskI1` (`task_no`),
  KEY `collect_taskI2` (`trans_com_id`),
  KEY `collect_taskI3` (`entry_datetime`),
  KEY `collect_taskI4` (`register_datetime`),
  KEY `collect_taskI5` (`commit_datetime`),
  KEY `collect_taskI6` (`check_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29656 DEFAULT CHARSET=utf8 COMMENT='提货任务';

-- ----------------------------
-- Table structure for collect_task_attribute
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_attribute`;
CREATE TABLE `collect_task_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) DEFAULT '0',
  `field_name` varchar(40) COLLATE utf8_bin DEFAULT '' COMMENT '属性名',
  `field_value` varchar(120) COLLATE utf8_bin DEFAULT '' COMMENT '属性值',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_hand_over_attribI1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='提货任务属性表';

-- ----------------------------
-- Table structure for collect_task_cost_queue
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_cost_queue`;
CREATE TABLE `collect_task_cost_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT '0' COMMENT '提货单号',
  `order_id` bigint(20) DEFAULT '0' COMMENT '业务单据ID',
  `order_type` smallint(6) DEFAULT '0' COMMENT '业务类型',
  `cost` decimal(16,4) DEFAULT NULL COMMENT '提货成本',
  `status` smallint(6) DEFAULT '0' COMMENT '0,未回传;1:成功;-1:失败',
  `error_message` varchar(64) DEFAULT '',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT '',
  `update_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `collect_task_costI1` (`task_id`),
  KEY `collect_task_costI2` (`order_id`,`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57412 DEFAULT CHARSET=utf8 COMMENT='提货登记成本队列';

-- ----------------------------
-- Table structure for collect_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_detail`;
CREATE TABLE `collect_task_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT '0' COMMENT '提货任务ID',
  `order_id` bigint(20) DEFAULT '0' COMMENT '业务单据ID',
  `order_type` smallint(6) DEFAULT '0' COMMENT '业务类型',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品编码',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT '',
  `update_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT '',
  `status` smallint(6) DEFAULT '0' COMMENT '状态：取消为6',
  PRIMARY KEY (`id`),
  KEY `collect_task_register_detailI1` (`task_id`),
  KEY `collect_task_register_detailI2` (`order_id`,`order_type`),
  KEY `collect_task_register_detailI3` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=755610 DEFAULT CHARSET=utf8 COMMENT='提货任务明细';

-- ----------------------------
-- Table structure for collect_task_sequence
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_sequence`;
CREATE TABLE `collect_task_sequence` (
  `date` date NOT NULL COMMENT '流水日期',
  `seq_no` int(11) NOT NULL COMMENT '流水号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提货任务流水表';

-- ----------------------------
-- Table structure for collect_task_src
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_src`;
CREATE TABLE `collect_task_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '业务单据ID',
  `order_type` smallint(6) DEFAULT '0' COMMENT '业务类型',
  `src_order_id` bigint(20) DEFAULT '0' COMMENT '原单号',
  `from_name` varchar(128) DEFAULT '' COMMENT '采购单：供应商名称； 采退单：目标仓库； 领用单：领货仓库',
  `from_address` varchar(128) DEFAULT '' COMMENT '采购单：供应商提货地址； 采退单：目标仓库地址；领用单：仓库地址',
  `from_contact` varchar(64) DEFAULT '' COMMENT '采购单：供应商联系人；采退单：对接采购员；领用单：仓库联系人',
  `from_contact_phone` varchar(24) DEFAULT '' COMMENT '采购单：供应商联系方式；采退单：采购员电话；领用单：仓库联系电话',
  `to_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库',
  `to_name` varchar(128) DEFAULT '' COMMENT '采购单：收货仓库；采退单：供应商名称；领用单：领用地',
  `to_address` varchar(128) DEFAULT '' COMMENT '采购单：收货地址；采退单：供应商地址；领用单：领用地址',
  `to_contact` varchar(64) DEFAULT '' COMMENT '采购单：对接采购；采退单：供应商联系人；领用单：领用人',
  `to_contact_phone` varchar(24) DEFAULT '' COMMENT '采购单：采购员电话；采退单：供应商联系电话；领用单：领用人电话',
  `use_type` varchar(24) DEFAULT '' COMMENT '领用类型',
  `dept_name` varchar(255) DEFAULT '' COMMENT '领用部门',
  `usage_name` varchar(255) DEFAULT '' COMMENT '用途',
  `trans_date` date DEFAULT NULL COMMENT '采购单为预计提货时间，采退单为预计退货时间，领用单为领用时间',
  `sku_cnt` int(11) DEFAULT '0' COMMENT '品种数',
  `sku_qty` int(11) DEFAULT '0' COMMENT '总数量',
  `status` smallint(6) DEFAULT '0' COMMENT '1:未登记;2:部分登记;3:已登记;4:取消',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT '',
  `update_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT '',
  `cancel_datetime` datetime DEFAULT NULL,
  `cancel_name` varchar(32) DEFAULT '',
  `order_code` varchar(32) DEFAULT '' COMMENT '单据编码',
  PRIMARY KEY (`id`),
  KEY `collect_task_src_headerI1` (`order_id`,`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=111866 DEFAULT CHARSET=utf8 COMMENT='提货任务来源';

-- ----------------------------
-- Table structure for collect_task_src_detail
-- ----------------------------
DROP TABLE IF EXISTS `collect_task_src_detail`;
CREATE TABLE `collect_task_src_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT '0' COMMENT '业务单据ID',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品编码',
  `temp_ship_group_name` varchar(32) NOT NULL DEFAULT '' COMMENT '配送温区',
  `sku_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `box_std` varchar(32) DEFAULT '' COMMENT '包装规格',
  `unit` varchar(32) DEFAULT '' COMMENT '单位',
  `qty` int(11) DEFAULT '0' COMMENT '数量',
  `status` smallint(6) DEFAULT '0' COMMENT '1:未登记;3:已登记;4:取消',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT '',
  `update_datetime` datetime DEFAULT NULL,
  `update_name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `collect_task_src_detailI1` (`order_id`),
  KEY `collect_task_src_detailI2` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=709514 DEFAULT CHARSET=utf8 COMMENT='提货任务来源明细';

-- ----------------------------
-- Table structure for data_push_que
-- ----------------------------
DROP TABLE IF EXISTS `data_push_que`;
CREATE TABLE `data_push_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `time_stamp` bigint(20) NOT NULL DEFAULT '0' COMMENT '当时时间long值',
  `push_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送类型',
  `redis_key` varchar(64) NOT NULL DEFAULT '' COMMENT 'redisKeys',
  `push_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1 失败， 1 成功， 2 重复， 0 新建',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `udpate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `box_ids` varchar(40) NOT NULL DEFAULT '' COMMENT '包裹ID集合，逗号分隔',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7391030 DEFAULT CHARSET=utf8 COMMENT='数据推送队列， 推送的值保存在redis上， 推送成功后失效key';

-- ----------------------------
-- Table structure for deliveryarea
-- ----------------------------
DROP TABLE IF EXISTS `deliveryarea`;
CREATE TABLE `deliveryarea` (
  `deliveryarea_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配送区域id',
  `region_id` int(11) DEFAULT NULL COMMENT '行政区域id (从行政区域表中取)',
  `delivery_code` varchar(32) DEFAULT NULL COMMENT '配送区域编号',
  `delivery_name` varchar(128) DEFAULT NULL COMMENT '配送区域名称',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`deliveryarea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6256 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for deliveryarea_2016_05_bak
-- ----------------------------
DROP TABLE IF EXISTS `deliveryarea_2016_05_bak`;
CREATE TABLE `deliveryarea_2016_05_bak` (
  `deliveryarea_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送区域id',
  `region_id` int(11) DEFAULT NULL COMMENT '行政区域id (从行政区域表中取)',
  `delivery_code` varchar(32) DEFAULT NULL COMMENT '配送区域编号',
  `delivery_name` varchar(128) DEFAULT NULL COMMENT '配送区域名称',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for delivery_coefficient
-- ----------------------------
DROP TABLE IF EXISTS `delivery_coefficient`;
CREATE TABLE `delivery_coefficient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku_weight` decimal(12,4) DEFAULT '0.0000' COMMENT '商品毛重',
  `sku_spec` varchar(32) NOT NULL DEFAULT '' COMMENT '商品规格',
  `wrapping_factor` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '包裹系数',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='独立成箱商品配送信息';

-- ----------------------------
-- Table structure for elec_fence_point
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_point`;
CREATE TABLE `elec_fence_point` (
  `point_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `entry_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`point_id`),
  UNIQUE KEY `idx_ware_id_sort_num` (`ware_id`,`sort_num`) USING BTREE,
  KEY `idx_entry_time` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9944 DEFAULT CHARSET=utf8 COMMENT='电子围栏经纬度点集合';

-- ----------------------------
-- Table structure for ele_route_msg_que
-- ----------------------------
DROP TABLE IF EXISTS `ele_route_msg_que`;
CREATE TABLE `ele_route_msg_que` (
  `rwbs_id` bigint(19) NOT NULL AUTO_INCREMENT,
  `oms_order_id` bigint(19) NOT NULL DEFAULT '0' COMMENT '三方销售计划OMS分配的订单id',
  `ele_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '饿了么路由消息内容',
  `create_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '消息处理状态：0、未处理，1:处理完毕，2:异常',
  PRIMARY KEY (`rwbs_id`),
  KEY `idx_oms_order_id` (`oms_order_id`),
  KEY `idx_create_datetime` (`create_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饿了么路由消息';

-- ----------------------------
-- Table structure for evaluative_category
-- ----------------------------
DROP TABLE IF EXISTS `evaluative_category`;
CREATE TABLE `evaluative_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价树id',
  `category_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` int(11) NOT NULL DEFAULT '-1' COMMENT '父分类id',
  `level` smallint(6) NOT NULL DEFAULT '1' COMMENT '分类层级',
  `idx` int(11) NOT NULL DEFAULT '1' COMMENT '当前层级序列',
  `run_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1：启用；2：停用',
  `del_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否删除 1：否；2：是',
  `create_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '创建时间',
  `create_user` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '修改时间',
  `update_user` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `del_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '删除时间',
  `del_user` varchar(32) NOT NULL DEFAULT '' COMMENT '删除人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='评价分类树表';

-- ----------------------------
-- Table structure for express_service_temp_relation
-- ----------------------------
DROP TABLE IF EXISTS `express_service_temp_relation`;
CREATE TABLE `express_service_temp_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(10) NOT NULL,
  `carrier_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for front_ware_carrier
-- ----------------------------
DROP TABLE IF EXISTS `front_ware_carrier`;
CREATE TABLE `front_ware_carrier` (
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `dms_carrier_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'DMS快递id',
  `loc_name` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递名称',
  `dms_carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'DMS快递名称',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT 'status 1:新建启用、2：停用',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `priority` smallint(6) NOT NULL DEFAULT '0' COMMENT '优先级',
  PRIMARY KEY (`loc_id`,`carrier_id`,`dms_carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前置仓快递';

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id_type` varchar(15) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for kdn_carrier
-- ----------------------------
DROP TABLE IF EXISTS `kdn_carrier`;
CREATE TABLE `kdn_carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司编码',
  `carrier_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `carrier_type` int(4) NOT NULL DEFAULT '1' COMMENT '1：国内、2：国外、3：转运',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `create_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '添加人',
  `update_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kdn_carrier1` (`carrier_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14630 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='快递鸟支持快递编码表';

-- ----------------------------
-- Table structure for maluation_info
-- ----------------------------
DROP TABLE IF EXISTS `maluation_info`;
CREATE TABLE `maluation_info` (
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递ID',
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '顾客ID',
  `evaluative_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '评价时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_carrier_id` (`carrier_id`) USING BTREE,
  KEY `idx_customer_id` (`member_id`) USING BTREE,
  KEY `idx_evaluative_time` (`evaluative_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价信息表';

-- ----------------------------
-- Table structure for maluation_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `maluation_info_detail`;
CREATE TABLE `maluation_info_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价详情id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `category_first_level_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级评论分类id',
  `evaluative_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评价得分',
  `evaluative_options` varchar(32) NOT NULL DEFAULT '' COMMENT '评价选项',
  `evaluative_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有评价内容 0：无；1：有',
  `evaluative_content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3212754 DEFAULT CHARSET=utf8 COMMENT='评价信息详情表';

-- ----------------------------
-- Table structure for open_exp_plat_carrier_code
-- ----------------------------
DROP TABLE IF EXISTS `open_exp_plat_carrier_code`;
CREATE TABLE `open_exp_plat_carrier_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司编码',
  `carrier_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `carrier_type` int(4) NOT NULL DEFAULT '0' COMMENT '1：国内、2：国外、3：转运',
  `charge` int(4) NOT NULL DEFAULT '0' COMMENT '0：当前使用免费版本，1：当前使用收费版本',
  `platform_type` int(4) NOT NULL DEFAULT '1' COMMENT '1：快递鸟、2：快递100',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_date` timestamp NOT NULL DEFAULT '1971-01-01 00:00:01' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1971-01-01 00:00:01' COMMENT '更新时间',
  `create_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '添加人',
  `update_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_joint_carrier_code` (`carrier_code`,`platform_type`) USING BTREE,
  UNIQUE KEY `idx_carrier_code` (`carrier_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1762 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开放平台快递支持编码表';

-- ----------------------------
-- Table structure for order_2mt
-- ----------------------------
DROP TABLE IF EXISTS `order_2mt`;
CREATE TABLE `order_2mt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT 'order_id',
  `order_json` varchar(2000) NOT NULL DEFAULT '' COMMENT '美团订单json对象',
  `push_time` int(2) NOT NULL DEFAULT '0' COMMENT '推送次数',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30300 DEFAULT CHARSET=utf8 COMMENT='美团订单表';

-- ----------------------------
-- Table structure for order_assign_carrier_info
-- ----------------------------
DROP TABLE IF EXISTS `order_assign_carrier_info`;
CREATE TABLE `order_assign_carrier_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `carrier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司名称',
  `service_id` varchar(20) DEFAULT NULL COMMENT '关联carrier_service表',
  `cust_acct_no` varchar(32) DEFAULT NULL COMMENT '在快递公司的月结账号',
  `track_no` varchar(500) DEFAULT NULL COMMENT '运单号',
  `source_code` varchar(32) DEFAULT NULL COMMENT '发货地，来源编码',
  `destination_code` varchar(32) DEFAULT NULL COMMENT '接受地编码',
  `pay_type` varchar(32) DEFAULT NULL COMMENT '付款方式',
  `carrier_code1` varchar(32) DEFAULT NULL COMMENT '快递其它code1-backup字段',
  `carrier_code2` varchar(32) DEFAULT NULL COMMENT '快递其它code2-backup字段',
  `carrier_code3` varchar(32) DEFAULT NULL COMMENT '快递其它code3-backup字段',
  `entry_name` varchar(20) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_name` varchar(20) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `shipment_spot_id` varchar(32) DEFAULT NULL,
  `shipment_spot_name` varchar(32) DEFAULT NULL,
  `ship_service` varchar(10) DEFAULT NULL,
  `package_type` int(11) DEFAULT NULL COMMENT '1.普通包装 2.环保包装',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  `combine_ship` smallint(6) NOT NULL DEFAULT '0' COMMENT '合单标识 0：否，1：是',
  `direction` varchar(20) NOT NULL DEFAULT '' COMMENT '方位',
  `line_distance` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '直线距离（单位米，保留两位小数）',
  `grid_code` varchar(10) NOT NULL DEFAULT '' COMMENT '网格',
  `two_dimension_code` varchar(255) NOT NULL DEFAULT '' COMMENT '新顺丰V2 API 二维码',
  `dest_route_label` varchar(255) NOT NULL DEFAULT '' COMMENT '路由标签信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_assign_carrier_infoI1` (`order_id`,`order_type`)
) ENGINE=InnoDB AUTO_INCREMENT=25359672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_base_header
-- ----------------------------
DROP TABLE IF EXISTS `order_base_header`;
CREATE TABLE `order_base_header` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID(正向订单订单号)',
  `order_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT '0：普通订单 1悦店小单',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '类型（0:普通订单，1:上门换货，2:上门退货）',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS父单id',
  `third_order_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '三方单号',
  `settlement_order_no` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '结算单号',
  `order_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '父单对应订单数',
  `order_sequense` int(11) NOT NULL DEFAULT '0' COMMENT '当前第几个订单',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹数量',
  `weight` decimal(32,4) NOT NULL DEFAULT '0.0000' COMMENT '重量',
  `temp_area_id` int(11) NOT NULL DEFAULT '0' COMMENT '温区属性',
  `temp_area_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '温区',
  `drop_ship` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否产地直发：1是， 0否',
  `sale_type` int(11) NOT NULL DEFAULT '0' COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_channel` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '1:网站 2:手机 3:平板',
  `from_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源仓库ID',
  `src_order_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '来源订单编号',
  `src_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单ID',
  `order_source_desc` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '来源介绍',
  `in_tms_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单下发TMS的时间',
  `freight_type` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货运类型',
  `delivery_bill_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  `hand_over_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '交接人',
  `hand_over_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '交接出库时间',
  `hand_over_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '批次交接单编号',
  `form_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'OMS 订单ID: 商家订单号(退货单为字符串), 正向订单和order_id相同',
  `pick_up_flag` smallint(6) NOT NULL DEFAULT '-1' COMMENT '1:上门取货, 0, 不需要上门取货',
  `presell_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预售属性',
  `groupon_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '团购属性',
  `cod_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '是否货到付款',
  `trade_no` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号和parentID相同',
  `total_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '总金额',
  `paid_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '已付款',
  `receive_rmount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '应收金额',
  `refund_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '应退金额',
  `insure_amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '保价金额',
  PRIMARY KEY (`order_id`),
  KEY `order_headerI1` (`parent_id`),
  KEY `order_headerI2` (`delivery_bill_no`),
  KEY `order_headerI3` (`in_tms_date`),
  KEY `order_headerI4` (`hand_over_date`),
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单基本信息表';

-- ----------------------------
-- Table structure for order_customer
-- ----------------------------
DROP TABLE IF EXISTS `order_customer`;
CREATE TABLE `order_customer` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID(正向订单订单号)',
  `cust_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'cust_id',
  `to_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `to_post_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `to_mobile` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人手机号码',
  `to_phone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人电话号码',
  `to_address` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人地址',
  `to_province` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人省份',
  `to_city` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人城市',
  `to_area` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人地区',
  `to_4th_addr_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '四级地址ID',
  `to_4th_addr` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '四级地址名称',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `district_id` int(11) NOT NULL DEFAULT '0' COMMENT '区ID',
  `country_id` int(11) NOT NULL DEFAULT '0' COMMENT '国家ID',
  `delivery_type` int(11) NOT NULL DEFAULT '-1' COMMENT '配送类型 0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `book_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预约送货日期',
  `delivery_from_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '定时达送货开始时间',
  `delivery_to_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '定时达到货结束时间',
  `payment_type` smallint(10) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `payment_type_desc` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '支付方式介绍',
  `send_station_id` int(6) NOT NULL DEFAULT '0' COMMENT '配送站点ID',
  `send_station_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送站点名称',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  `combine_ship` smallint(6) NOT NULL DEFAULT '0' COMMENT '合单标识 0：否，1：是',
  `map_source` smallint(6) NOT NULL DEFAULT '0' COMMENT '1高德 2百度 3腾讯',
  `lng` varchar(26) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '经度坐标',
  `lat` varchar(26) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '纬度坐标',
  `real_cust_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `real_cust_mobile` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '提货人手机号码',
  `order_letter` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '提货码',
  `distance` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '距离',
  `direction` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方位',
  `grid_code` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网格',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单客户信息表';

-- ----------------------------
-- Table structure for order_deliver_info
-- ----------------------------
DROP TABLE IF EXISTS `order_deliver_info`;
CREATE TABLE `order_deliver_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 仅作表复制使用',
  `once_key` varchar(50) NOT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `order_id` bigint(11) DEFAULT NULL COMMENT 'OMS 订单ID',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单号, 如风达系统使用',
  `waybill_no` varchar(100) DEFAULT NULL COMMENT '运单号',
  `order_type` int(11) NOT NULL COMMENT 'OMS: 订单类型',
  `request_from_date` datetime DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `do_time` varchar(50) DEFAULT NULL COMMENT '操作时间, 根据操作时间来判断是否需要传送状态给ERP',
  `do_operation` varchar(255) DEFAULT NULL COMMENT '操作结果',
  `status` varchar(32) NOT NULL,
  `status_name` varchar(500) NOT NULL,
  `signee` varchar(32) DEFAULT NULL,
  `return_status` smallint(6) DEFAULT NULL COMMENT 'OMS返回状态:1成功, -1失败',
  `error_code` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `last_send_date` datetime DEFAULT NULL COMMENT '发送到OMS的最后日期',
  `service` varchar(50) DEFAULT NULL,
  `service_version` varchar(50) DEFAULT NULL,
  `src_sys` varchar(20) DEFAULT NULL,
  `dst_sys` varchar(20) DEFAULT NULL,
  `datestr` varchar(20) DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL COMMENT '操作人',
  `operate_id` varchar(100) NOT NULL COMMENT '如风达物流状态变更Id',
  `carrier_status` int(11) DEFAULT NULL COMMENT '物流公司状态',
  `carrier_status_name` varchar(100) DEFAULT NULL COMMENT '物流公司状态描述',
  `carrier_flag` varchar(30) DEFAULT NULL COMMENT '快递公司标示',
  `courier_name` varchar(32) DEFAULT NULL COMMENT '快递员名称',
  `courier_phone` varchar(32) DEFAULT NULL COMMENT '快递员联系电话',
  `need_sync` smallint(6) DEFAULT '1' COMMENT '是否需要上传',
  `carrier_return_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上传快递签收数据到供应商平台返回时间',
  `carrier_sys_sync` smallint(6) DEFAULT '0' COMMENT '上传快递签收数据到供应商平台：1上传， 0不上传',
  `carrier_return_status` smallint(6) DEFAULT NULL COMMENT '上传供应商平台返回状态:1成功, -1失败，0新增',
  `carrier_error_code` varchar(255) DEFAULT NULL COMMENT '供应商平台返回错误信息',
  PRIMARY KEY (`id`),
  KEY `order_deliver_infoI4` (`entry_datetime`),
  KEY `order_diidex` (`waybill_no`),
  KEY `idx_order_deliver_infoI1` (`order_id`) USING BTREE,
  KEY `idx_operate_id` (`operate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=403055668 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为表复制使用',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS order ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '货物名称',
  `count` int(11) NOT NULL COMMENT '数量',
  `unit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `unit_price` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `size` double DEFAULT NULL COMMENT '尺寸',
  `product_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '货物编码',
  `order_type` int(11) DEFAULT NULL,
  `is_gift` int(11) DEFAULT NULL COMMENT '是否赠品',
  `src_sku_id` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '来源sku',
  PRIMARY KEY (`id`),
  KEY `order_detailI2` (`sku_id`),
  KEY `order_detailI1` (`order_id`,`order_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131919402 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `order_dynamic`;
CREATE TABLE `order_dynamic` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID 正向订单订单号',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单当前状态',
  `logis_end_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '归班时间',
  `update_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `import_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单倒入快递系统时间',
  `status_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '状态发生变化时间',
  `status_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '当前状态说明',
  PRIMARY KEY (`order_id`),
  KEY `order_dynamicI1` (`logis_end_datetime`) USING BTREE,
  KEY `idx_import_datetime` (`import_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单动态信息表';

-- ----------------------------
-- Table structure for order_header
-- ----------------------------
DROP TABLE IF EXISTS `order_header`;
CREATE TABLE `order_header` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID(正向订单订单号)',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型（0:普通订单，1:上门换货，2:上门退货）',
  `parent_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '订单当前状态',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_channel` smallint(6) DEFAULT NULL COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `order_channel_desr` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `order_source` int(11) DEFAULT NULL COMMENT '1:网站 2:手机 3:平板',
  `order_cnt` int(11) DEFAULT NULL,
  `order_sequense` int(11) DEFAULT NULL,
  `box_cnt` int(11) DEFAULT '0' COMMENT '订单包裹数量',
  `order_source_desc` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `trade_no` bigint(20) DEFAULT NULL COMMENT '交易单号和parentID相同',
  `owner_id` int(11) DEFAULT NULL,
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区属性',
  `temp_area_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单温区',
  `payment_type` smallint(10) DEFAULT NULL COMMENT '支付方式',
  `payment_type_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式介绍',
  `delivery_from_time` datetime DEFAULT NULL,
  `delivery_to_time` datetime DEFAULT NULL,
  `delivery_bill_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `pick_list_id` bigint(20) DEFAULT NULL COMMENT '拣货单ID',
  `src_order_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `in_tms_date` datetime DEFAULT NULL,
  `cod_flag` char(1) COLLATE utf8_bin DEFAULT 'N',
  `freight_type` char(1) COLLATE utf8_bin DEFAULT NULL,
  `delivery_date` int(11) DEFAULT NULL,
  `book_date` datetime DEFAULT NULL COMMENT '预约送货日期',
  `hand_over_date` datetime DEFAULT NULL,
  `presell_flag` char(1) COLLATE utf8_bin DEFAULT NULL,
  `groupon_flag` char(1) COLLATE utf8_bin DEFAULT NULL,
  `waybill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `single_part_flag` char(1) COLLATE utf8_bin DEFAULT NULL,
  `trade_message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `merchant_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商家编号',
  `form_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'OMS 订单ID: 商家订单号(退货单为字符串), 正向订单和order_id相同',
  `per_form_code` bigint(20) DEFAULT NULL COMMENT '前订单号，用作退货和换货单之前的订单号。普通订单传空值。',
  `to_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `to_address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地址',
  `to_province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人省份',
  `to_city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人城市',
  `to_area` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地区',
  `to_post_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人邮编',
  `to_mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机号码',
  `to_phone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人电话号码',
  `to_4th_addr_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址ID',
  `to_4th_addr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址名称',
  `total_amount` decimal(10,0) DEFAULT NULL COMMENT '总金额',
  `paid_amount` decimal(10,0) DEFAULT NULL COMMENT '已付款',
  `receive_rmount` decimal(10,0) DEFAULT NULL COMMENT '应收金额',
  `refund_amount` decimal(10,0) DEFAULT NULL COMMENT '应退金额',
  `insure_amount` decimal(10,0) DEFAULT NULL COMMENT '保价金额',
  `weight` decimal(32,4) DEFAULT NULL COMMENT '重量',
  `comment` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '重要提示',
  `from_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '发货用户姓名',
  `from_address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发件地址',
  `from_province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '发件省',
  `from_city` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发件市',
  `from_area` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发件区',
  `from_post_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发件邮编',
  `from_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '发件人手机号码',
  `from_phone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发件人电话号码',
  `goods_property` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '货物属性0:普货,1:禁航,2:易碎品',
  `extend_data` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '拓展字段（备用）',
  `entry_datetime` datetime DEFAULT NULL COMMENT '进入TMS时间',
  `carrier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `carrier_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司名称',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '来源仓库ID',
  `to_loc_id` int(11) DEFAULT NULL COMMENT '收货仓库ID',
  `province_id` int(11) DEFAULT NULL COMMENT '省ID',
  `city_id` int(11) DEFAULT NULL COMMENT '市ID',
  `district_id` int(11) DEFAULT NULL COMMENT '区ID',
  `country_id` int(11) DEFAULT NULL COMMENT '国家ID',
  `from_country_id` int(11) DEFAULT NULL,
  `from_city_id` int(11) DEFAULT NULL,
  `from_province_id` int(11) DEFAULT NULL,
  `from_district_id` int(11) DEFAULT NULL,
  `pick_up_flag` smallint(6) DEFAULT '1' COMMENT '1:上门取货, 0, 不需要上门取货',
  `hand_over_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '交接人',
  `status_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '当前状态说明',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `carrier_status` int(11) DEFAULT NULL COMMENT '快递公司状态值',
  `drop_ship` smallint(6) DEFAULT '0' COMMENT '是否产地直发：1是， 0否',
  `send_station_id` int(6) DEFAULT NULL COMMENT '配送站点ID',
  `send_station_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '配送站点名称',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `import_datetime` datetime DEFAULT NULL COMMENT '订单倒入快递系统时间',
  `status_datetime` datetime DEFAULT NULL COMMENT '状态发生变化时间',
  `sync_status` smallint(6) unsigned zerofill DEFAULT '000000' COMMENT '同步到FR系统',
  `sync_datetime` datetime DEFAULT NULL COMMENT '同步时间',
  `logis_end_datetime` datetime DEFAULT NULL COMMENT '归班时间',
  PRIMARY KEY (`order_id`,`order_type`),
  KEY `order_headerI2` (`parent_id`),
  KEY `order_headerI3` (`delivery_bill_no`),
  KEY `order_headerI4` (`in_tms_date`),
  KEY `order_headerI5` (`carrier_id`),
  KEY `order_headerI6` (`hand_over_date`),
  KEY `order_headerI7` (`logis_end_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_import_log
-- ----------------------------
DROP TABLE IF EXISTS `order_import_log`;
CREATE TABLE `order_import_log` (
  `once_key` varchar(36) COLLATE utf8_bin NOT NULL COMMENT 'GUID, java 生成.为随机生成的guid,每次请求都使用新的guid值,重复提交OnceKey的请求系统将不正常响应数据,并返回错误日志.',
  `service` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Service 元素预先定义了服务名',
  `service_version` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT 'ServiceVersion定义请求处理的版本号',
  `src_sys` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'SrcSys 发起请求方编码，即商家系统编码',
  `dst_sys` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'DstSys  应答方编码，即如风达系统编码，默认为RFD',
  `datestr` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'DateTime节点填充请求的时间，格式化为 yyyyMMddhhmmss,如20131127132426',
  `result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `order_id` bigint(20) NOT NULL COMMENT 'OMS order_id',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `waybill_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '运单号',
  `form_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'RFD 返回订单ID',
  `result_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '结果编号',
  `result_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '结果信息',
  `send_datetime` datetime DEFAULT NULL COMMENT '发送时间日期',
  `response_datetime` datetime DEFAULT NULL COMMENT '返回日期',
  `status` smallint(6) DEFAULT NULL COMMENT '0: 新增 1:成功, -1失败',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  PRIMARY KEY (`once_key`),
  KEY `order_import_logI2` (`waybill_no`) USING BTREE,
  KEY `order_import_logI3` (`send_datetime`) USING BTREE,
  KEY `order_import_logI4` (`entry_datetime`) USING BTREE,
  KEY `order_import_logI1` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='该表为从TMS向如风达系统导入使用';

-- ----------------------------
-- Table structure for order_import_queue
-- ----------------------------
DROP TABLE IF EXISTS `order_import_queue`;
CREATE TABLE `order_import_queue` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS订单ID',
  `status` smallint(6) DEFAULT NULL COMMENT '状态:0: 新增 1:成功, -1失败',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `order_type` int(11) NOT NULL,
  `carrier_id` varchar(255) DEFAULT NULL COMMENT '快递id',
  `carrier_name` varchar(255) DEFAULT NULL COMMENT '快递名称',
  `loc_id` int(11) DEFAULT NULL,
  `loc_name` varchar(32) DEFAULT NULL,
  `to_province` varchar(32) DEFAULT NULL,
  `to_city` varchar(32) DEFAULT NULL,
  `to_area` varchar(32) DEFAULT NULL,
  `to_4th_addr` varchar(50) DEFAULT NULL,
  `to_5th_addr` varchar(50) DEFAULT NULL,
  `to_address` varchar(200) DEFAULT NULL,
  `to_post_code` varchar(20) DEFAULT NULL COMMENT '邮编',
  `temp_area` int(11) DEFAULT NULL,
  `cod_type` smallint(6) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `cust_id` varchar(20) DEFAULT NULL COMMENT '商家编码',
  `cust_name` varchar(60) DEFAULT NULL COMMENT '商家名称',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  `combine_ship` smallint(6) NOT NULL DEFAULT '0' COMMENT '合单标识 0：否，1：是',
  PRIMARY KEY (`id`),
  KEY `ordermasterI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25465776 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_point_import_log
-- ----------------------------
DROP TABLE IF EXISTS `order_point_import_log`;
CREATE TABLE `order_point_import_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递ID',
  `order_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '1成功  0、新增  -1失败',
  `entry_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `return_msg` varchar(255) DEFAULT NULL,
  `return_datetime` datetime DEFAULT NULL,
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  PRIMARY KEY (`id`),
  KEY `orderpointI1` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6155996 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_profiles
-- ----------------------------
DROP TABLE IF EXISTS `order_profiles`;
CREATE TABLE `order_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `prof_cat` varchar(15) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(15) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_i` bigint(20) NOT NULL DEFAULT '0' COMMENT '整型属性值',
  `prof_c` varchar(100) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_prof` (`prof_cat`(2)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1849176 DEFAULT CHARSET=utf8 COMMENT='订单属性表';

-- ----------------------------
-- Table structure for order_pull_route_que
-- ----------------------------
DROP TABLE IF EXISTS `order_pull_route_que`;
CREATE TABLE `order_pull_route_que` (
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `track_no` varchar(100) DEFAULT NULL COMMENT '主运单号',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房ID',
  `service_id` varchar(30) NOT NULL DEFAULT '' COMMENT '配送服务标示',
  `spare_service_id` varchar(80) NOT NULL DEFAULT '' COMMENT '备用快递编码',
  `status` int(11) DEFAULT NULL COMMENT '当前状态',
  `status_desc` varchar(100) DEFAULT NULL COMMENT '状态简介',
  `cb_status` int(11) DEFAULT NULL COMMENT '春播状态',
  `closed` smallint(6) DEFAULT '0' COMMENT '是否结束:1结束， 0没结束',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `close_datetime` datetime DEFAULT NULL COMMENT '关闭时间',
  `return_status` int(11) DEFAULT NULL COMMENT '返回状态',
  `return_message` varchar(255) DEFAULT NULL COMMENT '返回信息',
  `return_datetime` datetime DEFAULT NULL COMMENT '返回时间',
  PRIMARY KEY (`order_id`),
  KEY `order_pull_route_quei2` (`track_no`),
  KEY `order_pull_route_queI3` (`close_datetime`),
  KEY `order_pull_route_quei4` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主动获取路由状态que。\r\n1. 只有主动获取路由状态的订单才会进入该表。\r\n2.每一个小时对非关闭状态的订单发起获取路由状态。\r\n3.每天晚上关闭前一天的已经是最终状态的订单。';

-- ----------------------------
-- Table structure for order_shipper
-- ----------------------------
DROP TABLE IF EXISTS `order_shipper`;
CREATE TABLE `order_shipper` (
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID(正向订单订单号)',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `merchant_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家编号',
  `from_name` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发货用户姓名',
  `from_mobile` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件人手机号码',
  `from_phone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件人电话号码',
  `from_post_code` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件邮编',
  `from_address` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件地址',
  `goods_property` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货物属性0:普货,1:禁航,2:易碎品',
  `to_loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货仓库ID',
  `from_country_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货人国家ID',
  `from_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货人城市ID',
  `from_province_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货人省ID',
  `from_district_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货人地区ID',
  `from_province` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件省',
  `from_city` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件市',
  `from_area` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '发件区',
  `sorting_code` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分拣码',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单发货方信息表';

-- ----------------------------
-- Table structure for order_shipping_point
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping_point`;
CREATE TABLE `order_shipping_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `ship_to_province` varchar(30) DEFAULT NULL COMMENT '收货省',
  `ship_to_city` varchar(30) DEFAULT NULL COMMENT '收货市',
  `ship_to_area` varchar(30) DEFAULT NULL COMMENT '收货区',
  `ship_to_4th_addr` varchar(50) DEFAULT NULL COMMENT '四级地址',
  `ship_to_address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `return_status` int(1) DEFAULT NULL COMMENT '返回状态 1、成功（T） 0、失败（F）',
  `return_msg` varchar(50) DEFAULT NULL COMMENT '返回信息',
  `point_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `simple_name` varchar(50) DEFAULT NULL COMMENT '站点简称',
  `service_id` varchar(20) DEFAULT NULL COMMENT '关联carrier_service表',
  `entry_name` varchar(20) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_name` varchar(20) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `sendcode` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `carrier_id` bigint(30) DEFAULT NULL COMMENT '快递id',
  `carrier_code` varchar(100) NOT NULL DEFAULT '0' COMMENT '快递code',
  `carrier_name` varchar(50) DEFAULT NULL COMMENT '快递名称',
  `from_province` varchar(30) DEFAULT NULL COMMENT '发货省',
  `from_city` varchar(30) DEFAULT NULL COMMENT '发货市',
  `from_area` varchar(30) DEFAULT NULL COMMENT '发货区',
  `from_address` varchar(255) DEFAULT NULL COMMENT '发货地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `package_type` int(11) DEFAULT NULL COMMENT '1.普通包装 2.环保包装',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易单号',
  PRIMARY KEY (`id`),
  KEY `order_iidx` (`order_id`) USING HASH,
  KEY `entry_didx` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18087998 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT 'OMS订单类型',
  `do_time` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作时间, 根据操作时间来判断是否需要传送状态给ERP',
  `do_operation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作结果',
  `status` smallint(6) DEFAULT NULL COMMENT 'OMS订单状态',
  `status_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `kind_msg` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '经转换，展示给用户的话',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `return_status` smallint(6) DEFAULT NULL COMMENT '返回状态: 1 成功, 0 失败',
  `error_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '错误原因',
  `last_send_date` datetime DEFAULT NULL COMMENT '最后上传, 响应时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要上传: 1需要, 0不需要',
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `upload_data_datetime` timestamp NULL DEFAULT NULL,
  `upload_data_id` int(11) DEFAULT NULL,
  `upload_data_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_UNIQUE` (`order_id`,`order_type`) USING BTREE,
  KEY `order_statusI1` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126691858 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单状态表';

-- ----------------------------
-- Table structure for order_status_log
-- ----------------------------
DROP TABLE IF EXISTS `order_status_log`;
CREATE TABLE `order_status_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_type` int(11) NOT NULL,
  `request_from_date` datetime DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `order_status_logI1` (`order_id`,`order_type`) USING BTREE,
  KEY `order_status_logI2` (`request_from_date`) USING BTREE,
  KEY `order_status_logI3` (`request_date`) USING BTREE,
  KEY `order_status_logI4` (`response_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单状态记录表';

-- ----------------------------
-- Table structure for order_sync
-- ----------------------------
DROP TABLE IF EXISTS `order_sync`;
CREATE TABLE `order_sync` (
  `sync_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID(正向订单订单号)',
  `sync_sys_type` int(11) NOT NULL DEFAULT '0' COMMENT '同步到外部系统类型，1:FR',
  `sync_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单当前同步状态：-1：待同步，0：可以同步、1：同步成功、2:同步失败',
  `dim_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '维度类型，1:订单 2:运单 3:物流订单 4:结算单',
  `fail_reason` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '失败原因',
  `sync_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同步时间',
  `create_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sync_id`),
  KEY `order_syncI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25613776 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单同步上传表';

-- ----------------------------
-- Table structure for order_tracks
-- ----------------------------
DROP TABLE IF EXISTS `order_tracks`;
CREATE TABLE `order_tracks` (
  `tracks_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `track_no` varchar(100) NOT NULL COMMENT '运单号',
  `main_track` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否主运单：1：是， 0否',
  `status` int(11) DEFAULT NULL COMMENT '春播订单状态',
  `status_name` varchar(64) DEFAULT NULL COMMENT '订单状态内容',
  `carrier_status` int(11) DEFAULT NULL COMMENT '快递公司运单状态',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否有效：1是、0否',
  PRIMARY KEY (`tracks_id`),
  KEY `order_tracksI1` (`order_id`),
  KEY `order_tracksI2` (`track_no`)
) ENGINE=InnoDB AUTO_INCREMENT=39501848 DEFAULT CHARSET=utf8 COMMENT='订单运单状态表：包含自运单号， 父运单号。';

-- ----------------------------
-- Table structure for plat_carrier_adapter
-- ----------------------------
DROP TABLE IF EXISTS `plat_carrier_adapter`;
CREATE TABLE `plat_carrier_adapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_use_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '供应商改派使用编码',
  `match_plat` int(4) NOT NULL DEFAULT '2' COMMENT '1：快递鸟、2：快递100',
  `plat_carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '匹配平台快递id',
  `match_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '匹配编码',
  `carrier_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '添加人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商改派路由拉取适配';

-- ----------------------------
-- Table structure for rdc_chiute_code
-- ----------------------------
DROP TABLE IF EXISTS `rdc_chiute_code`;
CREATE TABLE `rdc_chiute_code` (
  `rdc_chiute_code_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sorting_data_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预分拣信息id',
  `chute_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '滑道号',
  `rdc_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '分拨简码',
  `rdc_short_name` varchar(60) NOT NULL DEFAULT '' COMMENT '分拨简称',
  `rdc_id` bigint(30) NOT NULL DEFAULT '0' COMMENT '分拨id',
  `create_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`rdc_chiute_code_id`),
  KEY `idx_sorting_data_id` (`sorting_data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10312 DEFAULT CHARSET=utf8 COMMENT='丹鸟预分拣-多级分拨信息';

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间',
  PRIMARY KEY (`region_id`),
  KEY `region_type_id_idx` (`region_level_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域维表';

-- ----------------------------
-- Table structure for region_2015_05
-- ----------------------------
DROP TABLE IF EXISTS `region_2015_05`;
CREATE TABLE `region_2015_05` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for region_bak0925
-- ----------------------------
DROP TABLE IF EXISTS `region_bak0925`;
CREATE TABLE `region_bak0925` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for region_level
-- ----------------------------
DROP TABLE IF EXISTS `region_level`;
CREATE TABLE `region_level` (
  `region_level_id` int(11) NOT NULL COMMENT '区域级别id',
  `region_level_name` varchar(64) DEFAULT NULL COMMENT '区域级别:1:省,2:市,3:县',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '国家名',
  PRIMARY KEY (`region_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域级别表';

-- ----------------------------
-- Table structure for region_prof
-- ----------------------------
DROP TABLE IF EXISTS `region_prof`;
CREATE TABLE `region_prof` (
  `region_id` int(11) NOT NULL,
  `prof_type` varchar(10) DEFAULT NULL COMMENT '属性''DC'' 直辖市',
  `prof_value` varchar(100) DEFAULT NULL COMMENT '属性值',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ship_area
-- ----------------------------
DROP TABLE IF EXISTS `ship_area`;
CREATE TABLE `ship_area` (
  `a_code` varchar(32) DEFAULT NULL,
  `a_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ship_service
-- ----------------------------
DROP TABLE IF EXISTS `ship_service`;
CREATE TABLE `ship_service` (
  `service_id` int(10) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `carrier_id` int(10) NOT NULL,
  `carrier_name` varchar(20) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sorting_data
-- ----------------------------
DROP TABLE IF EXISTS `sorting_data`;
CREATE TABLE `sorting_data` (
  `sorting_data_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预分拣组件id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `site_short_code` varchar(20) NOT NULL COMMENT '站点简码',
  `site_name` varchar(60) NOT NULL DEFAULT '' COMMENT '站点名称',
  `site_area_code` varchar(20) NOT NULL DEFAULT '' COMMENT '小件员片区号',
  `first_rdc_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '始发分拔简码',
  `end_rdc_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '目的分拔简码',
  `first_chute_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '始发分拨滑道号',
  `end_chute_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '目的分拔滑道号',
  `cp_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT 'CP简码',
  `city_short_code` varchar(20) NOT NULL DEFAULT '' COMMENT '城市简码',
  `biz_id` varchar(30) NOT NULL DEFAULT '' COMMENT '业务单号',
  `point_of_interest` varchar(30) NOT NULL DEFAULT '' COMMENT 'POI',
  `calculate_delivery_model` varchar(255) NOT NULL DEFAULT '' COMMENT 'POI',
  `distribution_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'POI',
  `center_site_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'POI',
  `create_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sorting_data_id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10354 DEFAULT CHARSET=utf8 COMMENT='丹鸟预分拣信息';

-- ----------------------------
-- Table structure for sync_supplier_task_que
-- ----------------------------
DROP TABLE IF EXISTS `sync_supplier_task_que`;
CREATE TABLE `sync_supplier_task_que` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 仅作表复制使用',
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `do_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间, 根据操作时间来判断是否需要传送状态给ERP',
  `carrier_return_status` smallint(6) DEFAULT '0' COMMENT '上传供应商平台返回状态:1成功, -1失败，0新增',
  `carrier_error_code` varchar(255) DEFAULT NULL COMMENT '供应商平台返回错误信息',
  `carrier_return_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上传快递签收数据到供应商平台返回时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sync_supplier_task_queI1` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1159928 DEFAULT CHARSET=utf8 COMMENT='上传供应商队列表';

-- ----------------------------
-- Table structure for t1
-- ----------------------------
DROP TABLE IF EXISTS `t1`;
CREATE TABLE `t1` (
  `order_id` bigint(20) DEFAULT NULL,
  `track_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temp_ship_group
-- ----------------------------
DROP TABLE IF EXISTS `temp_ship_group`;
CREATE TABLE `temp_ship_group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `ship_priority` int(11) DEFAULT NULL COMMENT '配送优先级',
  `entry_name` varchar(32) NOT NULL,
  `entry_datetime` datetime NOT NULL,
  `temp_type` tinyint(2) DEFAULT '1' COMMENT '1:基础温区、2:混合温区',
  `sf_ship_method` int(11) NOT NULL COMMENT '1、标准快递 14、冷运宅配 15、生鲜速配',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配送温区表';

-- ----------------------------
-- Table structure for temp_ship_group_set
-- ----------------------------
DROP TABLE IF EXISTS `temp_ship_group_set`;
CREATE TABLE `temp_ship_group_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '配送分组ID',
  `group_name` varchar(32) DEFAULT NULL COMMENT '配送分组名称',
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区ID',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `loc_id` int(11) DEFAULT NULL COMMENT '库房id',
  PRIMARY KEY (`id`),
  KEY `temperature_area_groupI1` (`group_id`,`temp_area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for third_extract_order_que
-- ----------------------------
DROP TABLE IF EXISTS `third_extract_order_que`;
CREATE TABLE `third_extract_order_que` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID',
  `trade_id` varchar(30) NOT NULL DEFAULT '' COMMENT '三方交易单号',
  `waybill` varchar(30) NOT NULL DEFAULT '' COMMENT '运单号',
  `extract_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '抽取状态 0:开始, 1:结束',
  `extract_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '抽取类型，1:悦店',
  `create_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_waybill` (`waybill`) USING BTREE,
  KEY `idx_create_datetime` (`create_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4054388 DEFAULT CHARSET=utf8 COMMENT='三方包裹路由抽取任务表';

-- ----------------------------
-- Table structure for third_sync_deliver_que
-- ----------------------------
DROP TABLE IF EXISTS `third_sync_deliver_que`;
CREATE TABLE `third_sync_deliver_que` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT 'OMS 订单ID',
  `trade_id` varchar(30) NOT NULL DEFAULT '' COMMENT '三方交易单号',
  `waybill` varchar(30) NOT NULL DEFAULT '' COMMENT '运单号',
  `waybill_old` varchar(30) NOT NULL DEFAULT '' COMMENT '旧运单号',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单当前状态',
  `cb_status` varchar(32) NOT NULL DEFAULT '' COMMENT '春播状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '操作结果',
  `do_time` varchar(50) NOT NULL DEFAULT '' COMMENT '操作时间',
  `deliver_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '包裹路由id',
  `sync_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '同步状态 0:new, -1:failed, 1:success',
  `sync_third_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '三方系统类型，1:悦店',
  `create_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sync_datetime` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '同步时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_waybill` (`waybill`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20495186 DEFAULT CHARSET=utf8 COMMENT='三方包裹路由同步任务表';

-- ----------------------------
-- Table structure for tms_parameter
-- ----------------------------
DROP TABLE IF EXISTS `tms_parameter`;
CREATE TABLE `tms_parameter` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '外键关联',
  `parameter_id` varchar(20) DEFAULT NULL COMMENT '主键参数id',
  `parameter_name` varchar(50) DEFAULT NULL COMMENT '参数名称',
  `parameter_disc` varchar(100) DEFAULT NULL COMMENT '参数说明',
  `parameter_value` varchar(100) DEFAULT NULL COMMENT '参数value',
  `loc_id` int(11) DEFAULT NULL COMMENT '仓库名称（facility_type=''warehouse''）',
  `loc_name` varchar(20) DEFAULT NULL,
  `wh_flag` varchar(10) DEFAULT 'N' COMMENT '区分仓库标志（Y/N）',
  `parameter_status` int(11) DEFAULT '0' COMMENT '启用标志（参数的状态）',
  `effective_datetime` datetime DEFAULT NULL COMMENT '启用日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人',
  `update_name` varchar(32) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `wms_parameterI1` (`parameter_id`,`loc_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TMS 配置表';

-- ----------------------------
-- Table structure for upload_data
-- ----------------------------
DROP TABLE IF EXISTS `upload_data`;
CREATE TABLE `upload_data` (
  `col_1` varchar(255) DEFAULT NULL,
  `col_2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `timing_arrival_flag` int(4) NOT NULL DEFAULT '0' COMMENT '定时达标志1是,0非',
  `parent_ware` varchar(128) DEFAULT '' COMMENT '父仓库',
  `ware_province` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库所在省',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库所在省ID',
  `ware_city` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库所在市',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库所在市ID',
  `ware_region` varchar(32) NOT NULL DEFAULT '' COMMENT '仓库所在区',
  `area_code` varchar(16) NOT NULL DEFAULT '' COMMENT '区号',
  `lng` varchar(26) NOT NULL DEFAULT '' COMMENT '商家经度坐标',
  `lat` varchar(26) NOT NULL DEFAULT '' COMMENT '商家纬度坐标',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse_contact
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_contact`;
CREATE TABLE `warehouse_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `contact_type` int(11) DEFAULT NULL COMMENT '联系类型',
  `contact_name` varchar(32) DEFAULT NULL COMMENT '联系人名称',
  `contact_phone` varchar(32) DEFAULT NULL COMMENT '联系人手机',
  `contact_tel` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse_profiles
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_profiles`;
CREATE TABLE `warehouse_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `prof_cat` varchar(15) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(15) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_i` bigint(20) NOT NULL DEFAULT '0' COMMENT '整型属性值',
  `prof_c` varchar(100) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='仓库属性表';

-- ----------------------------
-- Table structure for warm_box_flow
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_flow`;
CREATE TABLE `warm_box_flow` (
  `warm_box_flow_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '保温箱归属仓',
  `carrier_id` varchar(32) NOT NULL DEFAULT '' COMMENT '快递id',
  `box_no` varchar(32) NOT NULL DEFAULT '' COMMENT '包裹号',
  `warm_box_no` varchar(32) NOT NULL DEFAULT '' COMMENT '保温箱号',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态,1：出库，2：返货，3：入库',
  `create_datetime` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '创建时间',
  `do_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '操作时间',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `type_name` varchar(45) NOT NULL DEFAULT '' COMMENT '保温箱类型',
  PRIMARY KEY (`warm_box_flow_id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_warm_box_no` (`warm_box_no`) USING BTREE,
  KEY `idx_box_no` (`box_no`) USING BTREE,
  KEY `idx_do_time` (`do_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50185048 DEFAULT CHARSET=utf8 COMMENT='保温箱使用流水';

-- ----------------------------
-- Table structure for warm_box_status
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_status`;
CREATE TABLE `warm_box_status` (
  `warm_box_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `warm_box_no` varchar(32) NOT NULL DEFAULT '' COMMENT '保温箱号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '保温箱归属仓',
  `carrier_id` varchar(32) NOT NULL DEFAULT '' COMMENT '快递id',
  `box_no` varchar(32) NOT NULL DEFAULT '' COMMENT '包裹号',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态,1：出库，2：返货，3：入库',
  `update_datetime` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '修改时间',
  `do_time` timestamp NOT NULL DEFAULT '1971-01-01 00:00:00' COMMENT '操作时间',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `type_name` varchar(45) NOT NULL DEFAULT '' COMMENT '保温箱类型',
  PRIMARY KEY (`warm_box_id`),
  KEY `warm_box_no_I1` (`warm_box_no`) USING BTREE,
  KEY `idx_box_no` (`box_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18469510 DEFAULT CHARSET=utf8 COMMENT='保温箱状态';

-- ----------------------------
-- Table structure for waybill_pond
-- ----------------------------
DROP TABLE IF EXISTS `waybill_pond`;
CREATE TABLE `waybill_pond` (
  `pond_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '运单池ID',
  `service_id` varchar(32) NOT NULL DEFAULT '' COMMENT '快递服务',
  `waybill` varchar(50) NOT NULL DEFAULT '' COMMENT '运单号',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态（0：新建、1：已用、2：过期）',
  `appli_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `used_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用时间',
  `overdue_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`pond_id`) USING BTREE,
  KEY `idx_waybill` (`waybill`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=309604 DEFAULT CHARSET=utf8 COMMENT='运单池';

/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmsaddrdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addr_assign_set
-- ----------------------------
DROP TABLE IF EXISTS `addr_assign_set`;
CREATE TABLE `addr_assign_set` (
  `addr_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '地址编码 ',
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `province_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '省编码',
  `province_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '省名称',
  `city_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '市编码',
  `city_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '市名称',
  `area_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '区编码',
  `area_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '区名称',
  `fourth_addr_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址编码',
  `fourth_addr_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '四级地址名称',
  `assign_type` smallint(6) DEFAULT '0' COMMENT '当前分单方式 1区域分单 2地址库分单 3GIS分单 4地址库GIS分单',
  `his_assign_type` smallint(6) DEFAULT '0' COMMENT '历史分单方式 1区域分单 2地址库分单 3GIS分单 4地址库GIS分单',
  `enable_time` datetime NOT NULL COMMENT '生效时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creare_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '更新人',
  UNIQUE KEY `addr_assign_setI1` (`carrier_id`,`addr_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址分单设置表';

-- ----------------------------
-- Table structure for addr_key_word
-- ----------------------------
DROP TABLE IF EXISTS `addr_key_word`;
CREATE TABLE `addr_key_word` (
  `key_word_id` bigint(20) NOT NULL COMMENT '关键字id',
  `key_word_content` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字内容',
  `province_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '省名称',
  `city_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '市名称',
  `area_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '区名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `addr_attr` smallint(6) DEFAULT NULL COMMENT '标识送货地址 1:家 2:公司',
  UNIQUE KEY `addr_key_wordI1` (`key_word_id`) USING BTREE,
  KEY `addr_key_wordI2` (`key_word_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关键字';

-- ----------------------------
-- Table structure for addr_lib
-- ----------------------------
DROP TABLE IF EXISTS `addr_lib`;
CREATE TABLE `addr_lib` (
  `lib_id` bigint(20) NOT NULL COMMENT '地址库id',
  `lib_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '地址库名称',
  `station_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递编码',
  `carrier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `lib_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '地址库描述',
  `status` smallint(6) DEFAULT '1' COMMENT '状态  1启用 2停用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址库表';

-- ----------------------------
-- Table structure for business_unit
-- ----------------------------
DROP TABLE IF EXISTS `business_unit`;
CREATE TABLE `business_unit` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'bumen编码相同 系统自动生成唯一  企业不同  站点编码可以',
  `unit_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门编码 快递下唯一',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型 1:配送商,2:职能部门,3:配送站,4:分拣中心,5:运输中心,6:仓储中心,7:企业,8:商家',
  `type_attr` tinyint(3) unsigned DEFAULT '0' COMMENT '类型属性 自建站点、加盟总站、加盟子站',
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司名称',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '上级单位',
  `top_type` tinyint(3) DEFAULT NULL COMMENT 'top类型 1:配送商,8:商家',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态  停用、启用',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建用户',
  `distributors_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送商编码',
  `update_user` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '修改用户',
  `sync_date` datetime DEFAULT NULL COMMENT 'mq同步时间',
  `province_code` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址省',
  `province_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址省',
  `city_code` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址市',
  `city_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址市',
  `area_code` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址区',
  `area_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司地址区',
  `address` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lng` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`unit_id`),
  KEY `Business_Unit_I1` (`parent_id`),
  KEY `Business_Unit_I2` (`unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for delivery_area
-- ----------------------------
DROP TABLE IF EXISTS `delivery_area`;
CREATE TABLE `delivery_area` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for delivery_area_2016_05_bak
-- ----------------------------
DROP TABLE IF EXISTS `delivery_area_2016_05_bak`;
CREATE TABLE `delivery_area_2016_05_bak` (
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
-- Table structure for elec_fence_marker
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_marker`;
CREATE TABLE `elec_fence_marker` (
  `marker_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '''站点编码''',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '''站点编码''',
  `station_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '''站点描述''',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递编码',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `enable_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '1：停用 2：启用',
  `entry_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`marker_id`),
  KEY `fence_markerI1` (`station_id`,`carrier_id`) USING BTREE,
  KEY `fence_markerI2` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='电子围栏站点标记';

-- ----------------------------
-- Table structure for elec_fence_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_opt_log`;
CREATE TABLE `elec_fence_opt_log` (
  `opt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `station_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '''站点编码''',
  `carrier_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递编码',
  `opt_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '操作时间',
  `opt_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '操作类型  1新增 2修改 3删除',
  `opt_ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人所在ip',
  `opt_depart_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门编码',
  `opt_depart_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  PRIMARY KEY (`opt_id`),
  KEY `opt_logI1` (`opt_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='电子围栏操作日志';

-- ----------------------------
-- Table structure for elec_fence_point
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_point`;
CREATE TABLE `elec_fence_point` (
  `point_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站点编码',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `entry_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`point_id`),
  UNIQUE KEY `fence_pointI2` (`station_id`,`sort_num`) USING BTREE,
  KEY `fence_pointI1` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7912 DEFAULT CHARSET=utf8 COMMENT='电子围栏 经纬度点集合';

-- ----------------------------
-- Table structure for his_station_addr
-- ----------------------------
DROP TABLE IF EXISTS `his_station_addr`;
CREATE TABLE `his_station_addr` (
  `addr_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '地址编码',
  `carrier_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `station_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creare_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  UNIQUE KEY `his_station_addrI1` (`carrier_id`,`station_id`,`addr_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='历史 站点和地址关联表';

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  UNIQUE KEY `id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ID 生成表';

-- ----------------------------
-- Table structure for importdata
-- ----------------------------
DROP TABLE IF EXISTS `importdata`;
CREATE TABLE `importdata` (
  `col1` varchar(100) DEFAULT NULL,
  `col2` varchar(100) DEFAULT NULL,
  `col3` varchar(100) DEFAULT NULL,
  `col4` varchar(100) DEFAULT NULL,
  `col5` varchar(100) DEFAULT NULL,
  `col6` varchar(100) DEFAULT NULL,
  `col7` varchar(100) DEFAULT NULL,
  KEY `IimportDataI1` (`col1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for key_word_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `key_word_opt_log`;
CREATE TABLE `key_word_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_word_id` bigint(20) NOT NULL COMMENT '关键字id',
  `opt_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `opt_time` datetime NOT NULL COMMENT '更新时间',
  `opt_type` smallint(6) NOT NULL COMMENT '操作类型  1新增 2修改  ',
  `opt_ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人所在ip',
  `opt_depart_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '部门编码',
  `opt_depart_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '部门名称',
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241736 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关键字操作日志';

-- ----------------------------
-- Table structure for lib_key_relation
-- ----------------------------
DROP TABLE IF EXISTS `lib_key_relation`;
CREATE TABLE `lib_key_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lib_id` bigint(20) NOT NULL COMMENT '地址库id',
  `key_word_id` bigint(20) NOT NULL COMMENT '关键字id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lib_key_relationI1` (`key_word_id`,`lib_id`) USING BTREE,
  KEY `lib_key_relationI2` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=506652 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址库和关键字关联表';

-- ----------------------------
-- Table structure for lib_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `lib_opt_log`;
CREATE TABLE `lib_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lib_id` bigint(20) NOT NULL COMMENT '地址库id',
  `lib_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '地址库名称',
  `opt_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `opt_time` datetime NOT NULL COMMENT '更新时间',
  `opt_type` smallint(6) NOT NULL COMMENT '操作类型  1新增 2修改 3启用  4停用 ',
  `opt_ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人所在ip',
  `opt_depart_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '部门编码',
  `opt_depart_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6764 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址库操作日志';

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
-- Table structure for station_addr
-- ----------------------------
DROP TABLE IF EXISTS `station_addr`;
CREATE TABLE `station_addr` (
  `addr_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '地址编码',
  `carrier_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `station_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creare_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  UNIQUE KEY `station_addrI1` (`carrier_id`,`station_id`,`addr_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点和地址关联表';

-- ----------------------------
-- Table structure for temp_es_test
-- ----------------------------
DROP TABLE IF EXISTS `temp_es_test`;
CREATE TABLE `temp_es_test` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `to_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人省',
  `to_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人城市',
  `to_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地区',
  `to_4th_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '4级地址名称',
  `to_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地址',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `key_words` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'key words of addr assign station',
  `addr_attr` smallint(6) DEFAULT NULL COMMENT '标识送货地址 1:家 2:公司',
  `es_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `es_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `es_key_words` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'key words of addr assign station',
  `es_addr_attr` smallint(6) DEFAULT NULL COMMENT '标识送货地址 1:家 2:公司',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=351324 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ttt2
-- ----------------------------
DROP TABLE IF EXISTS `ttt2`;
CREATE TABLE `ttt2` (
  `city_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市名称',
  `area_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '区名称',
  `key_word_content` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '关键字内容',
  `lib_name` varchar(32) NOT NULL,
  `kid` bigint(20) DEFAULT NULL,
  `addrid` bigint(20) DEFAULT NULL,
  KEY `ttt2I1` (`key_word_content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

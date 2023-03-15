/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmsorderdb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:50:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for batch_id_generator
-- ----------------------------
DROP TABLE IF EXISTS `batch_id_generator`;
CREATE TABLE `batch_id_generator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `date_str` varchar(32) NOT NULL COMMENT '年月日',
  `current_no` int(11) NOT NULL COMMENT '当前id',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '创建人',
  `update_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `batch_id_generator1` (`date_str`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2606 DEFAULT CHARSET=utf8 COMMENT='订单导入批次id生成表';

-- ----------------------------
-- Table structure for cust_order_import
-- ----------------------------
DROP TABLE IF EXISTS `cust_order_import`;
CREATE TABLE `cust_order_import` (
  `import_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `import_lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '导入批次号',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '接货站点',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '接货站点名称',
  `handle_status` smallint(6) DEFAULT '1' COMMENT ' 处理状态 1处理中  2处理完成',
  `handle_result` smallint(6) DEFAULT '0' COMMENT ' 处理结果 1验证未通过 2全部导入成功  3部分导入成功 4全部失败 ',
  `import_sum_num` int(11) NOT NULL DEFAULT '0' COMMENT '导入的总数量',
  `import_suc_num` int(11) DEFAULT '0' COMMENT '导入成功数量',
  `import_fail_num` int(11) DEFAULT '0' COMMENT '导入失败数量',
  `upload_file_url` varchar(128) DEFAULT '' COMMENT '订单导入文件fastdfs url',
  `reply_file_url` varchar(128) DEFAULT '' COMMENT '回执文件fastdfs url',
  `import_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导入人',
  `import_datetime` timestamp NOT NULL COMMENT '导入时间',
  `update_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `comment` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '备注(导入成功 或导入失败)',
  `station_type` smallint(6) DEFAULT '0' COMMENT '站点类型 1分拣  2站点',
  PRIMARY KEY (`import_id`),
  KEY `order_import2` (`cust_id`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8858 DEFAULT CHARSET=utf8 COMMENT='商家订单导入表';

-- ----------------------------
-- Table structure for cust_order_import_queue
-- ----------------------------
DROP TABLE IF EXISTS `cust_order_import_queue`;
CREATE TABLE `cust_order_import_queue` (
  `import_id` bigint(20) NOT NULL COMMENT '导入id',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板创建站点',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `entry_datetime` timestamp NOT NULL COMMENT '生成时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态： 0 未处理， 1 已处理， -1 处理失败',
  `handle_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '处理完成时间',
  `handle_exp_message` varchar(128) DEFAULT '' COMMENT '处理失败异常记录信息',
  PRIMARY KEY (`import_id`),
  KEY `import_queueI1` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家订单导入队列表';

-- ----------------------------
-- Table structure for cust_temp_detail
-- ----------------------------
DROP TABLE IF EXISTS `cust_temp_detail`;
CREATE TABLE `cust_temp_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `temp_id` bigint(20) NOT NULL COMMENT '模板id',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `sys_col_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '系统列命',
  `cust_col_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商家列命',
  `display_flag` smallint(6) DEFAULT '1' COMMENT ' 1显示  2隐藏',
  `input_flag` smallint(6) DEFAULT '1' COMMENT ' 1可输  2必输',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '修改日期： 每次修改都需要反写',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `cust_temp_detail1` (`temp_id`) USING BTREE,
  KEY `cust_temp_detail2` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3608 DEFAULT CHARSET=utf8 COMMENT='商家模板明细';

-- ----------------------------
-- Table structure for cust_temp_header
-- ----------------------------
DROP TABLE IF EXISTS `cust_temp_header`;
CREATE TABLE `cust_temp_header` (
  `temp_id` bigint(20) NOT NULL COMMENT '模板id, 从序列号服务获取',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '模板创建或更新站点',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '模板创建或更新站点名称',
  `temp_type` smallint(6) DEFAULT '1' COMMENT ' 模板类型 1标准模板  2定制模板',
  `temp_file_url` varchar(128) DEFAULT '' COMMENT '模板文件fastdfs url',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '创建人',
  `update_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新日期',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`temp_id`),
  KEY `temp_headerI1` (`cust_id`,`carrier_id`) USING BTREE,
  KEY `temp_headerI2` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家模板表头';

-- ----------------------------
-- Table structure for dms_assign_addr_h
-- ----------------------------
DROP TABLE IF EXISTS `dms_assign_addr_h`;
CREATE TABLE `dms_assign_addr_h` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `order_type` int(11) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货',
  `cust_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家库房ID',
  `loc_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家库房名称',
  `assign_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '分单状态： 0 未分配， 1 已分配',
  `assign_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '分单类型： 0： 手动分单， 1 自动分单',
  `to_province` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '收货人省',
  `to_city` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收货人城市',
  `to_area` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收货人地区',
  `to_post_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人邮编',
  `to_4th_addr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '4级地址名称',
  `to_5th_addr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '5级地址名称',
  `to_address` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '收货人地址',
  `dc_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分拣中心编码',
  `dc_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分拣中心名称',
  `temp_area` int(11) DEFAULT NULL COMMENT '温区属性',
  `cod_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0： 非code，1：现金、2：POS机',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `assign_datetime` datetime DEFAULT NULL COMMENT '分单日期',
  `assign_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点分配人， 自动分单：SYSTEM',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期： 每次修改都需要反写',
  `update_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `comment` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '重要提示',
  `station_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `mnemonic_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NO',
  `mnemonic_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NAME',
  `key_words` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'key words of addr assign station',
  `addr_attr` smallint(6) DEFAULT NULL COMMENT '标识送货地址 1:家 2:公司',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `baidu_addr_type` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '百度地址属性',
  `book_date` date NOT NULL DEFAULT '1970-10-01' COMMENT '期望收货时间',
  `dest_lat` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目标纬度',
  `dest_lng` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目标经度',
  `direction` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方位',
  `line_distance` int(11) NOT NULL DEFAULT '-1' COMMENT '距离m',
  `grid_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网格',
  `order_status` tinyint(3) NOT NULL DEFAULT '-1' COMMENT '订单出入站状态: -1 默认；0 新建 ； 1 已入站；-2 已取消',
  `map_source` smallint(6) NOT NULL DEFAULT '0' COMMENT '1高德,2百度,3腾讯',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dms_assign_addr_hI1` (`order_id`,`cust_id`,`carrier_id`) USING BTREE,
  KEY `dms_assign_addr_hI2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=20751754 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='DMS 分单主表';

-- ----------------------------
-- Table structure for dms_assign_addr_queue
-- ----------------------------
DROP TABLE IF EXISTS `dms_assign_addr_queue`;
CREATE TABLE `dms_assign_addr_queue` (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `order_type` int(11) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `mnemonic_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NO',
  `mnemonic_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NAME',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `need_response` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否需要响应给商家',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态： 0 未返回上架， 1 已返回商家， -1 发生异常',
  `response_datetime` datetime DEFAULT NULL COMMENT '商家返回时间',
  `return_code` varchar(32) DEFAULT NULL COMMENT '商家返回信息编码',
  `return_message` varchar(255) DEFAULT NULL COMMENT '商家返回信息主体',
  `addr_attr` smallint(6) DEFAULT NULL COMMENT '标识送货地址 1:家 2:公司',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  KEY `assign_queueI1` (`order_id`) USING BTREE,
  KEY `assign_queueI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传分单结果队列';

-- ----------------------------
-- Table structure for dms_assign_fail_queue
-- ----------------------------
DROP TABLE IF EXISTS `dms_assign_fail_queue`;
CREATE TABLE `dms_assign_fail_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态： -1 分单失败， 1分单成功',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期:每次修改都需要反写',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fail_queueI1` (`order_id`,`cust_id`,`carrier_id`) USING BTREE,
  KEY `fail_queueI2` (`entry_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=201042 DEFAULT CHARSET=utf8 COMMENT='自动分单失败队列';

-- ----------------------------
-- Table structure for dms_courier_location
-- ----------------------------
DROP TABLE IF EXISTS `dms_courier_location`;
CREATE TABLE `dms_courier_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_id` varchar(64) NOT NULL COMMENT '配送员账号',
  `courier_model` varchar(64) NOT NULL DEFAULT '' COMMENT '配送员设备型号',
  `gather_time` datetime NOT NULL COMMENT '位置采集时间',
  `lon` varchar(64) NOT NULL COMMENT '经度',
  `lat` varchar(64) NOT NULL COMMENT '纬度',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9078316 DEFAULT CHARSET=utf8 COMMENT='配送员位置表';

-- ----------------------------
-- Table structure for dms_cust_config
-- ----------------------------
DROP TABLE IF EXISTS `dms_cust_config`;
CREATE TABLE `dms_cust_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家编码',
  `cust_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家名称',
  `carrier_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递ID',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `switch_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT ' 开关标识1:不生成出入站信息，2生成出入站信息',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家库房ID',
  `loc_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家库房名称',
  `station_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站点ID--直接映射站点',
  `station_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站点名称',
  `sortation_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分拣ID-出库到哪个分拣',
  `sortation_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分拣名称',
  `task_type` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `taks_topic` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务topic',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新日期',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='DMS 商家配置';

-- ----------------------------
-- Table structure for dms_extends_data
-- ----------------------------
DROP TABLE IF EXISTS `dms_extends_data`;
CREATE TABLE `dms_extends_data` (
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `prof_type` varchar(32) NOT NULL COMMENT 'DRIVER: 司机， LICENCE: 车牌号',
  `prof_value` varchar(100) NOT NULL COMMENT '属性值',
  `entry_datetime` datetime NOT NULL COMMENT '创建时间',
  `entry_name` varchar(32) NOT NULL COMMENT '创建人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_order_d
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_d`;
CREATE TABLE `dms_order_d` (
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `sku_id` bigint(20) NOT NULL COMMENT '商品编码',
  `sku_name` varchar(225) NOT NULL COMMENT '商品名称',
  `temp_area` varchar(32) DEFAULT NULL COMMENT '商品温度属性',
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `sku_price` decimal(32,4) DEFAULT NULL COMMENT '商品价格',
  `sku_size` varchar(50) DEFAULT NULL COMMENT '商品尺寸',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  KEY `dms_order_dI1` (`sub_order_id`),
  KEY `dms_order_dI2` (`order_id`),
  KEY `idx_entry_datetime` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_order_h
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_h`;
CREATE TABLE `dms_order_h` (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `order_type` int(11) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货',
  `pre_order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退单对应商家原订单',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家库房ID',
  `loc_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家库房名称',
  `track_no` varchar(64) NOT NULL COMMENT '商家运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子单数量',
  `express_type` smallint(6) DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `is_assignned` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否已分单 1、已分单',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态：1000截单，2000入站， 3000出站交接，4001拒收',
  `to_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人省',
  `to_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人城市',
  `to_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人地区',
  `to_post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人邮编',
  `to_4th_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '4级地址名称',
  `to_5th_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '5级地址名称',
  `to_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人地址',
  `to_mobile` varchar(32) DEFAULT '' COMMENT '收货人手机号码',
  `to_phone` varchar(32) DEFAULT '' COMMENT '收货人电话号码',
  `to_name` varchar(128) DEFAULT NULL COMMENT '收货人名称',
  `total_amount` decimal(32,4) DEFAULT NULL COMMENT '总金额',
  `paid_amount` decimal(32,4) DEFAULT NULL COMMENT '已付款',
  `receive_amount` decimal(32,4) DEFAULT NULL COMMENT '应收金额',
  `refund_amount` decimal(32,4) DEFAULT NULL COMMENT '应退金额',
  `insure_amount` decimal(32,4) DEFAULT NULL COMMENT '保价金额',
  `weight` double DEFAULT NULL COMMENT '重量,单位为Kg，保留3位小数',
  `from_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发货用户姓名',
  `from_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件地址',
  `from_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件省',
  `from_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件市',
  `from_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件区',
  `from_post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件邮编',
  `from_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件人手机号码',
  `from_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发件人电话号码',
  `goods_property` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '货物属性0:普货,1:禁航,2:易碎品',
  `extend_data` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '拓展字段（备用）',
  `dc_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分拣中心编码',
  `dc_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分拣中心名称',
  `temp_area` varchar(32) DEFAULT NULL COMMENT '温区属性',
  `container_no` varchar(32) DEFAULT NULL COMMENT '订单包裹容器， 保温箱号，非必须字段',
  `cod_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0： 非code，1：现金、2：POS机',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期： 每次修改都需要反写',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '重要提示',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `mnemonic_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NO，反写',
  `mnemonic_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NAME， 反写',
  `in_station_date` datetime DEFAULT NULL COMMENT '入站时间， 入站时反写',
  `in_station_name` varchar(32) DEFAULT NULL COMMENT '入站操作人， 入站时反写',
  `courier` varchar(32) DEFAULT '' COMMENT '快递员， 分配快递后调用服务更新',
  `out_station_date` datetime DEFAULT NULL COMMENT '出站时间',
  `out_station_name` varchar(32) DEFAULT NULL COMMENT '出站操作人',
  `finish_datetime` datetime DEFAULT NULL COMMENT '妥投/拒收操作时间',
  `finish_name` varchar(32) DEFAULT NULL COMMENT '结束动作操作人',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  `order_source` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `settlement_orderNo` varchar(64) NOT NULL DEFAULT '' COMMENT '结算单号',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direction` varchar(10) DEFAULT '' COMMENT '方位',
  `grid_code` varchar(32) NOT NULL DEFAULT '' COMMENT '网格',
  `line_distance` double(11,2) DEFAULT '0.00' COMMENT '直线距离(m)',
  `map_source` smallint(6) NOT NULL DEFAULT '0' COMMENT '1高德,2百度,3腾讯',
  `dest_lon` varchar(32) NOT NULL DEFAULT '' COMMENT '经度坐标',
  `dest_lat` varchar(32) NOT NULL DEFAULT '' COMMENT '纬度坐标',
  `deliver_distance` double(11,2) DEFAULT '0.00' COMMENT '快递员妥投距离',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_oid15__cid9__caid20` (`order_id`(15),`cust_id`(9),`carrier_id`(20)),
  KEY `dms_order_hI3` (`expect_date`),
  KEY `dms_order_hI4` (`entry_datetime`),
  KEY `idx_mobile_name` (`to_mobile`,`to_name`,`to_address`,`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17938808 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_order_h_extends
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_h_extends`;
CREATE TABLE `dms_order_h_extends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` varchar(64) NOT NULL COMMENT '订单ID(商家订单号)',
  `return_remark` varchar(200) DEFAULT NULL COMMENT '整单销退备注',
  `return_reason` varchar(200) DEFAULT NULL COMMENT '整单销退原因',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2378 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='dms_order_h拓展表';

-- ----------------------------
-- Table structure for dms_order_issue_task
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_issue_task`;
CREATE TABLE `dms_order_issue_task` (
  `task_id` bigint(20) NOT NULL COMMENT 'taksID, 从序列号服务获取',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `container_no` varchar(32) DEFAULT NULL COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT NULL COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `next_task_type` int(11) NOT NULL COMMENT '10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) DEFAULT '-1' COMMENT '下一个任务ID',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '入站操作时间',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '入站操作人名称',
  `send_mq_datetime` datetime DEFAULT NULL COMMENT '发送入站TOPIC时间',
  `send_status` int(11) DEFAULT NULL COMMENT '0: 未发送， 1：发送成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `message_id` varchar(50) DEFAULT NULL COMMENT 'MQ返回消息ID',
  `expand_send_status` int(11) DEFAULT NULL COMMENT '扩展字段：存储多的topic状态 0: 未发送， 1：发送成功， -1：发送失败',
  `expand_error_message` varchar(255) DEFAULT NULL COMMENT '扩展字段：存储多的topic 错误信息',
  `expand_message_id` varchar(50) DEFAULT NULL COMMENT '扩展字段：存储多的topic MQ返回消息ID',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间',
  `station_type` smallint(6) DEFAULT '0' COMMENT '站点类型 1分拣  2站点',
  `sub_order_type` smallint(6) DEFAULT '0' COMMENT '0普通订单，1上门换货，2上门退货,3 签回单',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  PRIMARY KEY (`task_id`),
  KEY `issue_taskI1` (`task_id`) USING BTREE,
  KEY `issue_taskI2` (`order_id`) USING BTREE,
  KEY `issue_taskI3` (`sub_track_no`) USING BTREE,
  KEY `issue_taskI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_order_message
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_message`;
CREATE TABLE `dms_order_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` varchar(64) NOT NULL COMMENT '订单ID(商家订单号)',
  `message` varchar(200) DEFAULT NULL COMMENT '留言内容',
  `message_maker` varchar(128) DEFAULT NULL COMMENT '留言人',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2072 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='留言表';

-- ----------------------------
-- Table structure for dms_order_prof_files
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_prof_files`;
CREATE TABLE `dms_order_prof_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单ID(商家订单号)',
  `prof_type` varchar(64) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_value` varchar(64) NOT NULL DEFAULT '' COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13288246 DEFAULT CHARSET=utf8 COMMENT='提货信息表';

-- ----------------------------
-- Table structure for dms_order_refuse_request
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_refuse_request`;
CREATE TABLE `dms_order_refuse_request` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单ID',
  `carrier_id` varchar(64) DEFAULT NULL COMMENT '快递ID',
  `cust_id` varchar(64) DEFAULT NULL COMMENT '商家ID',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `upload_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '上传状态:0新增， 1成功',
  `upload_datetime` datetime DEFAULT NULL COMMENT '上传时间',
  `upload_msg` varchar(255) DEFAULT NULL COMMENT '上传错误信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Idms_order_refuse_requestI1` (`order_id`,`carrier_id`,`cust_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='整单拒收表';

-- ----------------------------
-- Table structure for dms_order_sub
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_sub`;
CREATE TABLE `dms_order_sub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `sub_weight` double DEFAULT NULL COMMENT '重量,单位为Kg，保留3位小数',
  `box_type` smallint(6) NOT NULL DEFAULT '-1' COMMENT '包装箱类型 1：普通包裹  2：保温箱  3:独立成箱',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改日期： 每次修改都需要反写',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '重要提示',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `mnemonic_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NO，反写',
  `mnemonic_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点助记信息-NAME， 反写',
  `in_station_date` datetime DEFAULT NULL COMMENT '入站时间， 入站时反写',
  `in_station_name` varchar(32) DEFAULT NULL COMMENT '入站操作人， 入站时反写',
  `courier` varchar(32) DEFAULT '' COMMENT '快递员账号， 分配快递后调用服务更新',
  `courier_name` varchar(32) DEFAULT NULL COMMENT '快递员名称',
  `out_station_date` datetime DEFAULT NULL COMMENT '出站时间',
  `out_station_name` varchar(32) DEFAULT NULL COMMENT '出站操作人',
  `finish_datetime` datetime DEFAULT NULL COMMENT '妥投/拒收操作时间',
  `finish_name` varchar(32) DEFAULT NULL COMMENT '结束动作操作人',
  `extend_data` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '拓展字段（备用）',
  `status` int(11) DEFAULT NULL COMMENT '当前状态',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间',
  `print_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:未打印-未入站;1:已打印-已入站',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人',
  `reason` varchar(50) DEFAULT NULL COMMENT '修改原因',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `reason_remark` varchar(100) DEFAULT NULL COMMENT '修改原因为其他时备注信息',
  `container_no` varchar(32) DEFAULT NULL COMMENT '订单包裹容器， 保温箱号，非必须字段',
  `sub_order_type` smallint(6) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货,3 签回单',
  `manual_weight` double DEFAULT '0' COMMENT '手动称重重量,单位为Kg，保留3位小数',
  `import_lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '导入批次号',
  `return_out_station_date` timestamp NOT NULL DEFAULT '1971-10-01 00:00:00' COMMENT '返货出站时间',
  `in_warehouse_date` timestamp NOT NULL DEFAULT '1971-10-01 00:00:00' COMMENT '返货入库时间',
  `import_his_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '导入历史库状态 1, 导入, 0,未导入',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `in_sortation_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '入分拣时间',
  `out_sortation_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出分拣时间',
  `in_sortation_name` varchar(32) NOT NULL DEFAULT '' COMMENT '入分拣操作人',
  `out_sortation_name` varchar(32) NOT NULL DEFAULT '' COMMENT '出分拣操作人',
  `temp_area_name` varchar(32) NOT NULL DEFAULT '' COMMENT '包裹配送温区',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dms_order_subI6` (`sub_order_id`,`carrier_id`) USING BTREE,
  KEY `dms_order_subI4` (`entry_datetime`) USING BTREE,
  KEY `dms_order_subI2` (`sub_track_no`) USING BTREE,
  KEY `dms_order_subI5` (`shipment_id`),
  KEY `idx_order_id_10` (`order_id`(10)),
  KEY `idx_carrier_id_10__station_id_10` (`carrier_id`(10),`station_id`(10))
) ENGINE=InnoDB AUTO_INCREMENT=34119726 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_order_sub_status
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_sub_status`;
CREATE TABLE `dms_order_sub_status` (
  `id` bigint(20) unsigned NOT NULL COMMENT '使用ID生成器',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `sub_track_no` varchar(64) DEFAULT NULL COMMENT '子运单号',
  `courier` varchar(32) DEFAULT NULL COMMENT '快递登陆ID',
  `courier_name` varchar(32) DEFAULT NULL COMMENT '快递员名称',
  `operator` varchar(64) DEFAULT NULL,
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_message` varchar(400) NOT NULL COMMENT '操作结果描述',
  `status` int(11) NOT NULL COMMENT '运单状态',
  `status_name` varchar(30) NOT NULL COMMENT '运单状态名称',
  `confirm_type` smallint(6) DEFAULT NULL COMMENT '签收类型：1子签， 2他人代签',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime NOT NULL COMMENT '创建时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要返回给商家 1、需要 0、不需要 ',
  `resp_datetime` datetime DEFAULT NULL COMMENT '商家系统响应时间',
  `resp_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `resp_code` varchar(32) DEFAULT NULL COMMENT '错误码',
  `return_status` tinyint(4) DEFAULT '3' COMMENT '返回状态:1-成功,3-默认,-1-失败,0-新建',
  `gathering_type` smallint(6) DEFAULT NULL COMMENT '收款方式，1:现金， 2:信用卡。',
  `reason` varchar(50) DEFAULT NULL COMMENT '滞留原因',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `operate_dept_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作部门名称',
  `operate_func_desc` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作功能描述',
  `courier_phone` varchar(20) DEFAULT NULL COMMENT '配送员电话号码',
  `import_his_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导入历史库状态:0-未导,1-已导',
  `import_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '导入历史库时间',
  PRIMARY KEY (`id`),
  KEY `order_sub_statusI4` (`sub_track_no`),
  KEY `sub_statusI3` (`order_id`) USING BTREE,
  KEY `sub_statusI5` (`entry_datetime`) USING BTREE,
  KEY `order_sub_statusI2` (`sub_order_id`) USING BTREE,
  KEY `idx_return_status__need_sync__cust_id` (`return_status`,`need_sync`,`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_print_logs
-- ----------------------------
DROP TABLE IF EXISTS `dms_print_logs`;
CREATE TABLE `dms_print_logs` (
  `task_id` bigint(20) NOT NULL COMMENT 'taksID, 从序列号服务获取',
  `print_ip` varchar(50) DEFAULT NULL COMMENT '打印IP地址',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_refuse_task_d
-- ----------------------------
DROP TABLE IF EXISTS `dms_refuse_task_d`;
CREATE TABLE `dms_refuse_task_d` (
  `refuse_id` bigint(20) NOT NULL COMMENT 'idgenerator：RefuseID',
  `sub_order_id` varchar(64) DEFAULT NULL COMMENT '子包裹ID',
  `sub_track_no` varchar(64) DEFAULT NULL,
  `sku_id` bigint(20) NOT NULL COMMENT '商品编码',
  `sku_name` varchar(32) NOT NULL COMMENT '商品名称',
  `temp_area` varchar(32) DEFAULT NULL COMMENT '商品温度属性',
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `sku_price` decimal(32,4) DEFAULT NULL COMMENT '商品价格',
  `sku_size` varchar(50) DEFAULT NULL COMMENT '商品尺寸',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '签收操作人名称',
  `carrier_id` varchar(32) DEFAULT NULL,
  `cust_id` varchar(32) DEFAULT NULL,
  KEY `dms_refuse_task_dI1` (`refuse_id`),
  KEY `dms_refuse_task_dI2` (`sub_order_id`),
  KEY `dms_refuse_task_dI3` (`sub_track_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_refuse_task_h
-- ----------------------------
DROP TABLE IF EXISTS `dms_refuse_task_h`;
CREATE TABLE `dms_refuse_task_h` (
  `refuse_id` bigint(20) NOT NULL,
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `courier` varchar(32) NOT NULL DEFAULT '' COMMENT '快递员',
  `container_no` varchar(32) DEFAULT NULL COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) NOT NULL COMMENT '订单运单号',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '签收操作时间',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '签收操作人名称',
  `return_datetime` datetime DEFAULT NULL COMMENT '上传客服系统时间',
  `return_status` int(11) DEFAULT NULL COMMENT '0: 新增， 1：处理成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `refuse_reason` varchar(50) DEFAULT NULL COMMENT '拒收原因',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`refuse_id`),
  KEY `dms_refuse_task_hI2` (`sub_order_id`),
  KEY `dms_refuse_task_hI3` (`sub_track_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_refuse_task_image
-- ----------------------------
DROP TABLE IF EXISTS `dms_refuse_task_image`;
CREATE TABLE `dms_refuse_task_image` (
  `id` bigint(20) NOT NULL,
  `refuse_id` bigint(20) NOT NULL COMMENT 'RefuseID',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `thumb_path` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `origin_path` varchar(255) DEFAULT NULL COMMENT '原图地址',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '签收操作人名称',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '快递ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `image_blog` mediumblob COMMENT '图片blog类型， 只有上传失败的时候， 才会存图片',
  `image_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `upload_dfs` tinyint(4) DEFAULT '0' COMMENT '是否上传到dfs：1是， 0否，-1失败',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `dms_refuse_task_imageI1` (`refuse_id`),
  KEY `dms_refuse_task_imageI2` (`sub_order_id`),
  KEY `dms_refuse_task_imageI3` (`sub_track_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_send_order_task
-- ----------------------------
DROP TABLE IF EXISTS `dms_send_order_task`;
CREATE TABLE `dms_send_order_task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'taksID, 从序列号服务获取',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `courier` varchar(32) NOT NULL DEFAULT '' COMMENT '快递员ID',
  `courier_name` varchar(32) DEFAULT NULL COMMENT '快递员名称',
  `container_no` varchar(32) DEFAULT NULL COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT NULL COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_type` int(11) DEFAULT NULL COMMENT '当前任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `next_task_type` int(11) DEFAULT NULL COMMENT '下一个任务类型：10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_type` int(11) DEFAULT NULL COMMENT '来源任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '下一个任务ID',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心ID',
  `next_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心名称',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '签收操作时间',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '签收操作人名称',
  `send_mq_datetime` datetime DEFAULT NULL,
  `send_status` int(11) DEFAULT NULL COMMENT '0: 未发送， 1：发送成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `message_id` varchar(50) DEFAULT NULL COMMENT 'MQ返回消息ID',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  PRIMARY KEY (`task_id`),
  KEY `send_taskI3` (`sub_track_no`,`courier`) USING BTREE,
  KEY `send_taskI4` (`order_id`,`courier`) USING BTREE,
  KEY `send_taskI5` (`entry_datetime`) USING BTREE,
  KEY `idx_courier_9` (`courier`(9))
) ENGINE=InnoDB AUTO_INCREMENT=39728802 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id_type` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

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
-- Table structure for order_id_generator
-- ----------------------------
DROP TABLE IF EXISTS `order_id_generator`;
CREATE TABLE `order_id_generator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `id_type` varchar(10) NOT NULL,
  `length` int(11) NOT NULL,
  `current_no` int(11) NOT NULL,
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entry_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fid_UNIQUE` (`id_type`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for route_subscribe_data
-- ----------------------------
DROP TABLE IF EXISTS `route_subscribe_data`;
CREATE TABLE `route_subscribe_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `carrier_id` varchar(64) NOT NULL DEFAULT '' COMMENT '快递编号',
  `track_no` varchar(64) NOT NULL DEFAULT '' COMMENT '运单号',
  `cust_id` varchar(32) NOT NULL DEFAULT '' COMMENT '平台编码: 001阿里云',
  `call_back_url` varchar(255) NOT NULL DEFAULT '' COMMENT '对方平台回调地址',
  `push_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0-new, 1-成功,-1:失败',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号-只推送版本号<3的数据',
  `max_sub_order_status_id` bigint(20) DEFAULT '0' COMMENT '当前运单对应最大的dms_order_sub_status.id',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_track_no` (`track_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1364 DEFAULT CHARSET=utf8 COMMENT='平台路由订阅表';

-- ----------------------------
-- Table structure for tt1
-- ----------------------------
DROP TABLE IF EXISTS `tt1`;
CREATE TABLE `tt1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  PRIMARY KEY (`id`),
  KEY `Itt1I1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148448340 DEFAULT CHARSET=utf8;

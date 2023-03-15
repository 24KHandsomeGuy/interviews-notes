/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmscoredb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dms_containerno_fail
-- ----------------------------
DROP TABLE IF EXISTS `dms_containerno_fail`;
CREATE TABLE `dms_containerno_fail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `container_no` varchar(32) NOT NULL DEFAULT '' COMMENT '保温箱号',
  `station_id` varchar(32) NOT NULL DEFAULT '' COMMENT '站点id',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '站点名称',
  `system_exeception` varchar(100) NOT NULL COMMENT '系统异常信息',
  `input_exeception` varchar(100) NOT NULL COMMENT '界面录入异常',
  `origin_path` varchar(255) NOT NULL COMMENT '上传图片链接',
  `operator` varchar(32) NOT NULL COMMENT '操作人',
  `operator_time` datetime NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `carrier_id` varchar(32) NOT NULL COMMENT '快递id',
  PRIMARY KEY (`id`),
  KEY `idx_con` (`container_no`(12)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_extends_data
-- ----------------------------
DROP TABLE IF EXISTS `dms_extends_data`;
CREATE TABLE `dms_extends_data` (
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `prof_type` varchar(32) NOT NULL COMMENT 'DRIVER: 司机， LICENCE: 车牌号',
  `prof_value` varchar(100) NOT NULL COMMENT '属性值',
  `entry_datetime` datetime NOT NULL COMMENT '创建时间',
  `entry_name` varchar(32) NOT NULL COMMENT '创建人',
  KEY `dms_extends_dataI1` (`carrier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_hand_over_attribute
-- ----------------------------
DROP TABLE IF EXISTS `dms_hand_over_attribute`;
CREATE TABLE `dms_hand_over_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `field_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `field_value` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dms_hand_over_attributeI1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dms_in_station_exeption
-- ----------------------------
DROP TABLE IF EXISTS `dms_in_station_exeption`;
CREATE TABLE `dms_in_station_exeption` (
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
  `to_addr` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `exception_info` varchar(100) DEFAULT NULL COMMENT '异常信息',
  `process_datetime` datetime DEFAULT NULL COMMENT '处理时间',
  `processor` varchar(32) DEFAULT NULL COMMENT '处理人',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间',
  KEY `in_station_expI1` (`order_id`),
  KEY `in_station_expI2` (`sub_track_no`),
  KEY `in_station_expI3` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_in_station_task
-- ----------------------------
DROP TABLE IF EXISTS `dms_in_station_task`;
CREATE TABLE `dms_in_station_task` (
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
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `task_type` int(11) DEFAULT NULL COMMENT '当前任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `next_task_type` int(11) NOT NULL COMMENT '下一个任务类型：10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_type` int(11) DEFAULT NULL COMMENT '来源任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '下一个任务ID',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '入站操作时间',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '入站操作人名称',
  `send_mq_datetime` datetime DEFAULT NULL,
  `send_status` int(11) DEFAULT NULL COMMENT '0: 未发送， 1：发送成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `message_id` varchar(50) DEFAULT NULL COMMENT 'topic MQ返回消息ID',
  `expand_send_status` int(11) DEFAULT NULL COMMENT '扩展字段：存储多的topic状态 0: 未发送， 1：发送成功， -1：发送失败',
  `expand_error_message` varchar(255) DEFAULT NULL COMMENT '扩展字段：存储多的topic 错误信息',
  `expand_message_id` varchar(50) DEFAULT NULL COMMENT '扩展字段：存储多的topic MQ返回消息ID',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间',
  `receive_order_date` datetime DEFAULT NULL COMMENT '接单时间',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `terminal` tinyint(3) NOT NULL DEFAULT '0' COMMENT '终端类型 0:未记录 1:PC 2:RF',
  PRIMARY KEY (`task_id`),
  KEY `dms_in_station_taskI1` (`order_id`),
  KEY `dms_in_station_taskI2` (`sub_track_no`),
  KEY `dms_in_station_taskI3` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_out_station_attribute
-- ----------------------------
DROP TABLE IF EXISTS `dms_out_station_attribute`;
CREATE TABLE `dms_out_station_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司',
  `field_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `field_value` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dms_out_station_attribute1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='出站属性表';

-- ----------------------------
-- Table structure for dms_out_station_exeption
-- ----------------------------
DROP TABLE IF EXISTS `dms_out_station_exeption`;
CREATE TABLE `dms_out_station_exeption` (
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
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `recv_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `exception_info` varchar(100) DEFAULT NULL COMMENT '异常信息',
  `process_datetime` datetime DEFAULT NULL COMMENT '处理时间',
  `processor` varchar(32) DEFAULT NULL COMMENT '处理人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  KEY `out_station_expI1` (`order_id`),
  KEY `out_station_expI2` (`sub_track_no`),
  KEY `out_station_expI3` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_out_station_task
-- ----------------------------
DROP TABLE IF EXISTS `dms_out_station_task`;
CREATE TABLE `dms_out_station_task` (
  `task_id` bigint(20) NOT NULL COMMENT 'taksID, 从序列号服务获取',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递公司名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `container_no` varchar(32) DEFAULT NULL COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT NULL COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：待入站，4：限时达 5： 定时达',
  `recv_address` varchar(128) DEFAULT NULL COMMENT '收货地址',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` datetime DEFAULT NULL COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` datetime DEFAULT NULL COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `task_type` int(11) DEFAULT NULL COMMENT '当前任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `next_task_type` int(11) NOT NULL COMMENT '下一个任务类型：10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_type` int(11) DEFAULT NULL COMMENT '来源任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) DEFAULT '-1' COMMENT '上一个任务ID',
  `courier_id` varchar(32) DEFAULT '' COMMENT '快递员_id， 分配快递后调用服务更新',
  `courier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递员_name， 分配快递后调用服务更新',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心ID',
  `next_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心名称',
  `send_mis` smallint(6) DEFAULT '0' COMMENT '是否发送短信： 0：不发送， 1：发送',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '入站操作时间',
  `worker_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作人账户',
  `worker_name` varchar(32) DEFAULT NULL COMMENT '入站操作人名称',
  `send_mq_datetime` datetime DEFAULT NULL,
  `send_status` int(11) DEFAULT NULL COMMENT '0: 未发送， 1：发送成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `message_id` varchar(50) DEFAULT NULL COMMENT 'MQ返回消息ID',
  `return_amt` decimal(16,4) DEFAULT NULL COMMENT '应退款',
  `recv_amt` decimal(16,4) DEFAULT NULL COMMENT '应收款',
  `weight` decimal(16,4) DEFAULT NULL COMMENT '重量',
  `expand_send_status` int(11) DEFAULT NULL COMMENT '扩展字段：存储多的topic状态 0: 未发送， 1：发送成功， -1：发送失败',
  `expand_error_message` varchar(255) DEFAULT NULL COMMENT '扩展字段：存储多的topic 错误信息',
  `expand_message_id` varchar(50) DEFAULT NULL COMMENT '扩展字段：存储多的topic MQ返回消息ID',
  `expand_send_mq_datetime` datetime DEFAULT NULL COMMENT '扩展字段 存储发送消息时间',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间',
  `receive_order_date` datetime DEFAULT NULL COMMENT '接单时间',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  PRIMARY KEY (`task_id`),
  KEY `dms_out_station_taskI3` (`entry_datetime`),
  KEY `dms_out_station_taskI2` (`sub_track_no`) USING BTREE,
  KEY `dms_out_station_taskI4` (`order_id`) USING BTREE,
  KEY `dms_out_station_taskI5` (`shipment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_print_logs
-- ----------------------------
DROP TABLE IF EXISTS `dms_print_logs`;
CREATE TABLE `dms_print_logs` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT 'taksID, 从序列号服务获取',
  `print_ip` varchar(50) DEFAULT NULL COMMENT '打印IP地址',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '快递公司id',
  `driver` varchar(32) DEFAULT NULL COMMENT '司机',
  `car_licence` varchar(32) DEFAULT NULL COMMENT '车牌号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_return_out_station_task
-- ----------------------------
DROP TABLE IF EXISTS `dms_return_out_station_task`;
CREATE TABLE `dms_return_out_station_task` (
  `task_id` bigint(20) NOT NULL COMMENT 'taksID, 从序列号服务获取',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `order_type` int(11) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货',
  `pre_order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退单对应商家原订单',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家库房ID',
  `loc_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商家库房名称',
  `track_no` varchar(64) NOT NULL COMMENT '商家运单号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子单数量',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态：orderStatusEnum',
  `to_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人省',
  `to_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人城市',
  `to_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '收货人地区',
  `from_task_id` bigint(20) DEFAULT NULL COMMENT '来源任务id',
  `from_task_type` int(11) DEFAULT NULL COMMENT '来源任务类型:130:退货,140:拒收,150:返货入站,160:返货出站',
  `task_status` int(11) NOT NULL DEFAULT '0' COMMENT '任务状态： 1：已处理， 0：未处理',
  `task_type` int(11) DEFAULT NULL COMMENT '当前任务类型：160：返货出站',
  `next_task_type` int(11) NOT NULL COMMENT '下一个任务类型：130:退货,140:拒收,150:返货入站,160:返货出站',
  `driver` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '交接司机',
  `car_license` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '交接车牌号',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` datetime DEFAULT NULL COMMENT '操作返货时间',
  `work_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作返货出站的人',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心ID',
  `next_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点/分拣中心名称',
  `send_mq_datetime` datetime DEFAULT NULL COMMENT '发送消息队列的时间',
  `send_status` int(11) DEFAULT NULL COMMENT 'topic状态 0: 未发送， 1：发送成功， -1：发送失败',
  `error_message` varchar(255) DEFAULT NULL COMMENT '存储MQ的错误信息',
  `message_id` varchar(50) DEFAULT NULL COMMENT ' MQ消息ID',
  `from_message_id` varchar(50) DEFAULT NULL COMMENT '来源消息ID',
  `print_datetime` datetime DEFAULT NULL COMMENT '打印时间',
  `print_name` varchar(32) DEFAULT NULL COMMENT '打印人',
  `finish_datetime` datetime DEFAULT NULL COMMENT '归班时间（妥投或拒收的时间）',
  `in_datetime` datetime DEFAULT NULL COMMENT '退单进入dms的时间;接单时间',
  `container_no` varchar(32) DEFAULT NULL COMMENT '保温箱号',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  PRIMARY KEY (`task_id`),
  KEY `dms_sales_return_taskI1` (`order_id`,`carrier_id`) USING BTREE,
  KEY `dms_sales_return_taskI2` (`sub_track_no`,`carrier_id`) USING BTREE,
  KEY `dms_sales_return_taskI3` (`entry_datetime`),
  KEY `dms_cont_carrier_taskI5` (`carrier_id`,`container_no`) USING BTREE,
  KEY `dms_return_taskI4` (`station_id`(20),`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for operation_record
-- ----------------------------
DROP TABLE IF EXISTS `operation_record`;
CREATE TABLE `operation_record` (
  `operation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户 id',
  `entry_id` varchar(32) DEFAULT NULL COMMENT '操作用户id',
  `task_num` int(11) DEFAULT '0' COMMENT '当前任务的数量',
  `task_type` int(11) DEFAULT NULL COMMENT '任务类型:1、入站  2、出站',
  `entry_datetime` date DEFAULT NULL,
  `update_datetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`operation_id`),
  KEY `entry_id` (`entry_id`) USING BTREE,
  KEY `task_type` (`task_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=944 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- ----------------------------
-- Table structure for operation_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `operation_record_detail`;
CREATE TABLE `operation_record_detail` (
  `entry_id` varchar(32) DEFAULT NULL COMMENT '操作用户 id',
  `task_id` bigint(11) DEFAULT NULL COMMENT '任务id',
  `task_type` int(11) DEFAULT NULL COMMENT '任务类型',
  KEY `entry_id` (`entry_id`) USING BTREE,
  KEY `task_type` (`task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作记录明细';

-- ----------------------------
-- Table structure for warm_box_sync_tms_que
-- ----------------------------
DROP TABLE IF EXISTS `warm_box_sync_tms_que`;
CREATE TABLE `warm_box_sync_tms_que` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `warm_box_no` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '保温箱号',
  `loc_id` int(6) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_id` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `carrier_id` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递id',
  `box_no` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '包裹号',
  `opt_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '操作时间',
  `opt_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '操作时间',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  PRIMARY KEY (`id`),
  KEY `idx_warm_box_no` (`warm_box_no`,`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17569584 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='保温箱同步tms队列表';

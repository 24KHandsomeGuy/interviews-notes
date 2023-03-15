/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmsex2

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for box_print_lot
-- ----------------------------
DROP TABLE IF EXISTS `box_print_lot`;
CREATE TABLE `box_print_lot` (
  `lot_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `lot_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批次号',
  `station_id` varchar(32) DEFAULT '' COMMENT '当前交接所在站点',
  `station_name` varchar(32) DEFAULT '' COMMENT '当前交接所在站点名',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `print_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '打印人',
  `print_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '打印时间',
  `driver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '交接司机',
  `carrier_car_license` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '交接司机车牌号',
  `entry_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  PRIMARY KEY (`lot_id`),
  KEY `print_lotI1` (`lot_no`) USING BTREE,
  KEY `print_lotI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='包裹打印批次信息';

-- ----------------------------
-- Table structure for dms_hand_over_attribute
-- ----------------------------
DROP TABLE IF EXISTS `dms_hand_over_attribute`;
CREATE TABLE `dms_hand_over_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrier_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递编码',
  `field_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段名称',
  `field_value` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段值',
  `entry_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `dms_hand_over_attributeI1` (`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dms_in_station_exeption
-- ----------------------------
DROP TABLE IF EXISTS `dms_in_station_exeption`;
CREATE TABLE `dms_in_station_exeption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sub_order_id` varchar(32) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `to_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '应到站点ID',
  `to_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '应到站点名称',
  `container_no` varchar(32) DEFAULT '' COMMENT '保温箱号',
  `sub_track_no` varchar(32) NOT NULL COMMENT '子运单号',
  `track_no` varchar(32) DEFAULT '' COMMENT '订单运单号',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT '1970-10-01' COMMENT '期望收货时期',
  `start_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `exception_info` varchar(100) DEFAULT '' COMMENT '异常信息',
  `process_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '处理时间',
  `processor` varchar(32) DEFAULT '' COMMENT '处理人',
  `entry_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  `out_warehouse_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出库时间',
  PRIMARY KEY (`id`),
  KEY `in_station_exeptionI1` (`entry_datetime`) USING BTREE,
  KEY `in_station_exeptionI2` (`sub_track_no`) USING BTREE,
  KEY `in_station_exeptionI3` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1278 DEFAULT CHARSET=utf8;

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
  `container_no` varchar(32) DEFAULT '' COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT '' COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT '1970-10-01' COMMENT '期望收货时期',
  `start_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `task_type` int(11) DEFAULT '0' COMMENT '当前任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `next_task_type` int(11) NOT NULL COMMENT '下一个任务类型：10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_type` int(11) DEFAULT NULL COMMENT '来源任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '下一个任务ID',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '入站操作时间',
  `worker_name` varchar(32) DEFAULT '' COMMENT '入站操作人名称',
  `status_send_mq_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '状态mq发送时间',
  `status_send_status` int(11) DEFAULT '0' COMMENT '运单状态mq发送状态0:未发送;1:发送成功;-1:发送失败',
  `status_error_message` varchar(64) DEFAULT '' COMMENT '运单状态mq发送错误信息',
  `status_message_id` varchar(40) DEFAULT '' COMMENT '发送运单状态mq的messageId',
  `out_send_status` int(11) DEFAULT '0' COMMENT '出站mq消息发送状态 0:未发送;1:发送成功;-1:发送失败',
  `out_error_message` varchar(64) DEFAULT '' COMMENT '出站mq发送错误信息',
  `out_message_id` varchar(40) DEFAULT '' COMMENT '发送出站mq消息的messageId',
  `out_send_mq_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出站mq发送时间',
  `out_warehouse_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出库时间',
  `weight` decimal(16,4) DEFAULT '0.0000' COMMENT '重量',
  `receive_order_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '接单时间',
  `sub_order_type` smallint(6) DEFAULT '0' COMMENT '0普通订单，1上门换货，2上门退货,3 签回单',
  `version` int(11) DEFAULT '0',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `send_station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '配送站',
  PRIMARY KEY (`task_id`),
  KEY `in_stationI1` (`sub_track_no`) USING BTREE,
  KEY `in_stationI2` (`order_id`) USING BTREE,
  KEY `in_stationI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入分拣表';

-- ----------------------------
-- Table structure for dms_order_cancle
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_cancle`;
CREATE TABLE `dms_order_cancle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cust_id` varchar(32) NOT NULL DEFAULT '' COMMENT '商家id',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `carrier_id` varchar(32) NOT NULL DEFAULT '' COMMENT '快递id',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`(12),`carrier_id`(19),`cust_id`(6)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=572326 DEFAULT CHARSET=utf8 COMMENT='dms取消订单';

-- ----------------------------
-- Table structure for dms_out_station_batch_info
-- ----------------------------
DROP TABLE IF EXISTS `dms_out_station_batch_info`;
CREATE TABLE `dms_out_station_batch_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(64) NOT NULL COMMENT '批次号',
  `from_station_id` varchar(32) DEFAULT NULL COMMENT '发出站id',
  `from_station_name` varchar(32) DEFAULT NULL COMMENT '发出站名称',
  `to_station_id` varchar(32) DEFAULT NULL COMMENT '收货站id',
  `to_station_short_code` int(11) DEFAULT NULL COMMENT '站点码',
  `to_station_name` varchar(32) DEFAULT NULL COMMENT '收货站名称',
  `package_qty` int(11) DEFAULT NULL COMMENT '包裹数量',
  `box_qty` int(11) DEFAULT NULL COMMENT '箱数',
  `volume` int(11) DEFAULT NULL COMMENT '体积',
  `print_status` tinyint(4) DEFAULT NULL COMMENT '打印状态: 0:未打印 1：已打印',
  `opt_time` timestamp NULL DEFAULT NULL COMMENT '截单时间',
  `print_time` timestamp NULL DEFAULT NULL COMMENT '打印时间',
  `operator` varchar(64) DEFAULT NULL COMMENT '分拣人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='截单批次详情';

-- ----------------------------
-- Table structure for dms_out_station_exeption
-- ----------------------------
DROP TABLE IF EXISTS `dms_out_station_exeption`;
CREATE TABLE `dms_out_station_exeption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `container_no` varchar(32) DEFAULT '' COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT '' COMMENT '订单运单号',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `expect_date` date DEFAULT NULL COMMENT '期望收货时期',
  `start_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `exception_info` varchar(100) DEFAULT '' COMMENT '异常信息',
  `process_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '处理时间',
  `processor` varchar(32) DEFAULT '' COMMENT '处理人',
  `entry_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  `out_warehouse_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出库时间',
  `recv_address` varchar(128) DEFAULT '' COMMENT '收货地址',
  PRIMARY KEY (`id`),
  KEY `out_station_exeptionI1` (`sub_track_no`) USING BTREE,
  KEY `out_station_exeptionI2` (`order_id`) USING BTREE,
  KEY `out_station_exeptionI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3054 DEFAULT CHARSET=utf8;

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
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `container_no` varchar(32) DEFAULT '' COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT '' COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：待入站，4：限时达 5： 定时达',
  `recv_address` varchar(128) DEFAULT '' COMMENT '收货地址',
  `expect_date` date DEFAULT '1970-10-01' COMMENT '期望收货时期',
  `start_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货起始时间，限时达， 定时需要指定',
  `end_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '期望收货截止时间，限时达， 定时需要指定',
  `task_status` int(11) NOT NULL COMMENT '任务状态： 1：已处理， 0：未处理',
  `task_type` int(11) DEFAULT '0' COMMENT '当前任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `next_task_type` int(11) NOT NULL COMMENT '下一个任务类型：10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_type` int(11) DEFAULT '0' COMMENT '来源任务类型： 10： 接单， 20:入站， 30： 出站， 40：派送',
  `from_task_id` bigint(20) DEFAULT '-1' COMMENT '上一个任务ID',
  `courier_id` varchar(32) DEFAULT '' COMMENT '快递员_id， 分配快递后调用服务更新',
  `courier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '快递员_name',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '站点/分拣中心ID',
  `next_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '站点/分拣中心名称',
  `send_mis` smallint(6) DEFAULT '0' COMMENT '是否发送短信： 0：不发送， 1：发送',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期， 接单日期',
  `work_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出站操作时间',
  `worker_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '操作人账户',
  `worker_name` varchar(32) DEFAULT '' COMMENT '入站操作人名称',
  `return_amt` decimal(16,4) DEFAULT '0.0000' COMMENT '应退款',
  `recv_amt` decimal(16,4) DEFAULT '0.0000' COMMENT '应收款',
  `weight` decimal(16,4) DEFAULT '0.0000' COMMENT '重量',
  `status_send_mq_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '状态mq发送时间',
  `status_send_status` int(11) DEFAULT '0' COMMENT '运单状态mq发送状态0:未发送;1:发送成功;-1:发送失败',
  `status_error_message` varchar(64) DEFAULT '' COMMENT '运单状态mq发送错误信息',
  `status_message_id` varchar(40) DEFAULT '' COMMENT '发送运单状态mq的messageId',
  `in_send_status` int(11) DEFAULT '0' COMMENT '入站站mq消息发送状态 0:未发送;1:发送成功;-1:发送失败',
  `in_error_message` varchar(64) DEFAULT '' COMMENT '入站mq发送错误信息',
  `in_message_id` varchar(40) DEFAULT '' COMMENT '发送入站mq消息的messageId',
  `in_send_mq_datetime` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '入站mq发送时间',
  `out_warehouse_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出库时间',
  `receive_order_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '接单时间',
  `sub_order_type` smallint(6) DEFAULT '0' COMMENT '0普通订单，1上门换货，2上门退货;3 签回单',
  `lot_id` bigint(11) DEFAULT '0' COMMENT '打印批次id',
  `print_status` smallint(6) DEFAULT '0' COMMENT '打印状态 0:未打印 1:已打印',
  `version` int(11) DEFAULT '0',
  `combine_ship` tinyint(2) NOT NULL DEFAULT '0' COMMENT '物流合单标识：0:不合单,1:合单',
  `shipment_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流交易单号',
  `send_station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '配送站',
  `terminal` tinyint(3) NOT NULL DEFAULT '0' COMMENT '终端类型 0:未记录 1:PC 2:RF',
  `batch_no` varchar(64) NOT NULL DEFAULT '' COMMENT '批次截单的批次号',
  PRIMARY KEY (`task_id`),
  KEY `out_stationI3` (`entry_datetime`) USING BTREE,
  KEY `out_stationI1` (`sub_track_no`) USING BTREE,
  KEY `out_stationI2` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dms_sub_track
-- ----------------------------
DROP TABLE IF EXISTS `dms_sub_track`;
CREATE TABLE `dms_sub_track` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sub_order_id` varchar(64) NOT NULL COMMENT '包裹ID， 如果没有包裹， 可以和订单号一致，商家（快递）范围内一致',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递公司ID',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递公司名称',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点ID',
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `container_no` varchar(32) DEFAULT '' COMMENT '保温箱号',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `track_no` varchar(64) DEFAULT '' COMMENT '订单运单号',
  `sub_order_cnt` int(11) NOT NULL COMMENT '子包裹数量',
  `express_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:普通， 1：当日达， 2：次日达， 3：限时达， 4 定时达',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '下一站点/分拣中心ID',
  `next_station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '下一站点/分拣中心名称',
  `track_status` int(11) NOT NULL COMMENT '运单状态',
  `entry_datetime` datetime NOT NULL COMMENT '创建日期',
  `in_sortation_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '入分拣时间，对应查询的入库时间',
  `out_sortation_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '出分拣时间，对应查询的出库时间',
  `out_warehouse_date` datetime DEFAULT NULL COMMENT '出库时间。对应仓库的出库时间',
  `receive_order_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '接单时间',
  `sub_order_type` smallint(6) DEFAULT '0' COMMENT '0普通订单，1上门换货，2上门退货;3 签回单',
  `lot_id` bigint(11) DEFAULT '0' COMMENT '打印批次id',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `sub_trackI4` (`in_sortation_date`) USING BTREE,
  KEY `sub_trackI5` (`out_sortation_date`) USING BTREE,
  KEY `sub_trackI1` (`order_id`) USING BTREE,
  KEY `sub_trackI2` (`sub_track_no`) USING BTREE,
  KEY `sub_trackI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31123744 DEFAULT CHARSET=utf8 COMMENT='dms运单表';

-- ----------------------------
-- Table structure for id_generator
-- ----------------------------
DROP TABLE IF EXISTS `id_generator`;
CREATE TABLE `id_generator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `id_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) NOT NULL COMMENT '步长',
  `current_id` bigint(20) NOT NULL COMMENT '当前ID',
  `descreption` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID简介',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for in_sortation_batch_detail
-- ----------------------------
DROP TABLE IF EXISTS `in_sortation_batch_detail`;
CREATE TABLE `in_sortation_batch_detail` (
  `batch_detail_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `batch_no` bigint(11) NOT NULL COMMENT '批次号',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单ID(商家订单号)',
  `sub_track_no` varchar(64) NOT NULL COMMENT '子运单号',
  `station_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '站点id',
  `station_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '站点名称',
  `scan_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '扫描人',
  `scan_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '扫描时间',
  PRIMARY KEY (`batch_detail_id`) USING BTREE,
  KEY `in_sortation_batch_detailI1` (`batch_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9141614 DEFAULT CHARSET=utf8 COMMENT='入库扫描批次明细表';

-- ----------------------------
-- Table structure for in_sortation_batch_header
-- ----------------------------
DROP TABLE IF EXISTS `in_sortation_batch_header`;
CREATE TABLE `in_sortation_batch_header` (
  `batch_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `batch_no` bigint(11) NOT NULL COMMENT '批次号',
  `cust_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家编码',
  `cust_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商家名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递id',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '快递名称',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 0 新建 1已开始 2 已结束',
  `scan_num` int(11) NOT NULL DEFAULT '0' COMMENT '扫描数量',
  `create_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `department_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门id',
  `department_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  `finish_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '结束人',
  `finish_datetime` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '结束时间',
  PRIMARY KEY (`batch_id`) USING BTREE,
  KEY `in_sortation_batch_headerI1` (`batch_no`) USING BTREE,
  KEY `in_sortation_batch_headerI2` (`create_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1468 DEFAULT CHARSET=utf8 COMMENT='入库扫描批次表';

-- ----------------------------
-- Table structure for in_sortation_batch_operator
-- ----------------------------
DROP TABLE IF EXISTS `in_sortation_batch_operator`;
CREATE TABLE `in_sortation_batch_operator` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `batch_no` bigint(11) NOT NULL COMMENT '批次号',
  `invited_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '受邀请的人',
  `invited_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '受邀请的人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `in_sortation_batch_operatorI1` (`batch_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47898 DEFAULT CHARSET=utf8 COMMENT='入库扫描批次操作人表';

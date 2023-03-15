/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : dmsex1

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dms_order_status_routs
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_status_routs`;
CREATE TABLE `dms_order_status_routs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organ_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织编码',
  `organ_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流名称',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `sub_track_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '运单号',
  `courier` varchar(32) DEFAULT NULL COMMENT '配送员编码',
  `courier_name` varchar(32) DEFAULT NULL COMMENT '配送员名字',
  `courier_phone` varchar(20) DEFAULT NULL COMMENT '配送员电话号码',
  `weight` double DEFAULT NULL COMMENT '重量,单位为Kg，保留3位小数',
  `station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '站点编码',
  `next_station_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '下站到达站点编码',
  `operator` varchar(32) DEFAULT NULL COMMENT '操作人:签收人',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_message` varchar(400) NOT NULL COMMENT '操作结果描述',
  `status` int(11) NOT NULL COMMENT '运单状态',
  `status_name` varchar(30) NOT NULL COMMENT '运单状态名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `need_sync` smallint(6) DEFAULT NULL COMMENT '是否需要返回给商家 1、需要 0、不需要 ',
  `resp_datetime` datetime DEFAULT NULL COMMENT '响应时间',
  `resp_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '错误码',
  `return_status` smallint(6) DEFAULT '0' COMMENT '返回状态 1、推送成功 -1、失败 0、新建',
  `push_count` int(11) DEFAULT '0' COMMENT '推送次数',
  `resp_message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`),
  KEY `order_routs_idxI1` (`sub_track_no`,`organ_code`,`carrier_id`) USING BTREE,
  KEY `order_routs_idxI2` (`order_id`,`organ_code`,`carrier_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='路由信息';

-- ----------------------------
-- Table structure for dms_order_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `dms_order_subscribe`;
CREATE TABLE `dms_order_subscribe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `sub_track_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '运单号',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流名称',
  `organ_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织编码',
  `organ_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '记录生成时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribe_idxI1` (`sub_track_no`,`carrier_id`,`organ_code`) USING BTREE,
  KEY `subscribe_idxI2` (`order_id`,`carrier_id`,`organ_code`) USING BTREE,
  KEY `subscribe_idxI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='订阅信息表';

-- ----------------------------
-- Table structure for dms_organ_info
-- ----------------------------
DROP TABLE IF EXISTS `dms_organ_info`;
CREATE TABLE `dms_organ_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organ_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织编码',
  `organ_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流名称',
  `organ_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '组织类型 1:平台，2：商家',
  `subscribe_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '订阅方式 1主动推送 2主动拉取 3主动推送和主动拉取配合使用',
  `active_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT '启停标识 1：启用 2：停用',
  `enable_datetime` datetime DEFAULT NULL COMMENT '生效时间',
  `stop_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` datetime DEFAULT NULL COMMENT '更新人',
  `entry_name` varchar(16) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `organ_infoI1` (`organ_code`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='组织信息';

-- ----------------------------
-- Table structure for dms_rout_config
-- ----------------------------
DROP TABLE IF EXISTS `dms_rout_config`;
CREATE TABLE `dms_rout_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `organ_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织编码',
  `organ_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织名称',
  `carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流编码',
  `carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物流名称',
  `map_carrier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织内对应的物流编码',
  `map_carrier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组织内对应的物流名称',
  `encrypt_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  `push_ws_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '推送ws地址',
  `pull_ws_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '拉取ws地址',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` datetime DEFAULT NULL COMMENT '更新人',
  `entry_name` varchar(16) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `rout_configI1` (`organ_code`,`carrier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='路由配置表';

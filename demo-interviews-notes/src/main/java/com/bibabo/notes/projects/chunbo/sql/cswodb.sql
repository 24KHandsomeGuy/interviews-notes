/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : cswodb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_extends_info
-- ----------------------------
DROP TABLE IF EXISTS `product_extends_info`;
CREATE TABLE `product_extends_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品sku',
  `sort_id` int(11) NOT NULL DEFAULT '-1',
  `problem_reason` text COMMENT '产品内/外部问题原因',
  `arrival_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '商品报缺时预计到货时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_extends_info1` (`sku_id`,`sort_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4072 DEFAULT CHARSET=utf8 COMMENT='加工单产品扩展信息';

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `work_order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工单id',
  `src_order_id` bigint(20) DEFAULT NULL COMMENT '处理订单号',
  `cust_mobile` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `handle_desc` varchar(150) DEFAULT NULL COMMENT '处理结果',
  `type` tinyint(4) DEFAULT NULL COMMENT '工单类别:1、咨询 2、售后',
  `handle_channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '工单处理渠道:1 外呼，2在线，3呼入',
  `handle_detail` varchar(500) DEFAULT NULL COMMENT '处理详情',
  `status` int(11) DEFAULT NULL COMMENT '处理状态:1、处理中 2、处理完毕 3、关闭',
  `is_liability` tinyint(4) DEFAULT NULL COMMENT '是否认责:1、否 2、是',
  `liability_department_id` int(11) DEFAULT NULL COMMENT '认责部门id',
  `liability_department_name` varchar(50) DEFAULT NULL COMMENT '认责部门名称',
  `problem_level` tinyint(4) DEFAULT NULL COMMENT '问题级别：1、A类   2、B类  3、C类',
  `is_cycle` tinyint(4) DEFAULT NULL COMMENT '是否需要流转: 1、不需要    2、需要',
  `is_reply` tinyint(4) DEFAULT NULL COMMENT '是否已回复: 1、未回复    2、已回复',
  `sort_desc` varchar(150) DEFAULT NULL COMMENT '分类',
  `sort_id` int(11) DEFAULT NULL COMMENT '工单类型id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `sku_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `entry_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `entry_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `handle_id` int(11) DEFAULT NULL COMMENT '答复人id',
  `handle_name` varchar(50) DEFAULT NULL COMMENT '答复人名',
  `handle_datetime` datetime DEFAULT NULL COMMENT '答复时间',
  `handle_end_name` varchar(50) DEFAULT NULL COMMENT '处理完毕人',
  `handle_end_id` int(11) DEFAULT NULL,
  `handle_end_datetime` datetime DEFAULT NULL COMMENT '处理完毕时间',
  `duty_id` int(11) DEFAULT NULL COMMENT '工单（客服部门）责任人',
  `duty_name` varchar(50) DEFAULT NULL COMMENT '工单（客服部门）责任人名',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `duty_datetime` datetime DEFAULT NULL COMMENT '开始负责时间',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单发货仓库',
  `complaint_goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '客诉商品数量',
  PRIMARY KEY (`work_order_id`),
  KEY `src_oiidx` (`src_order_id`),
  KEY `sku_iidx` (`sku_id`),
  KEY `handle_didx` (`handle_datetime`),
  KEY `liability_idx` (`liability_department_id`),
  KEY `cust_midx` (`cust_mobile`),
  KEY `cust_iidx` (`cust_id`),
  KEY `handle_edidx` (`handle_end_datetime`),
  KEY `duty_didx` (`duty_datetime`),
  KEY `idx_work_order9` (`sort_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1123786 DEFAULT CHARSET=utf8 COMMENT='工单主表';

-- ----------------------------
-- Table structure for work_order_imags
-- ----------------------------
DROP TABLE IF EXISTS `work_order_imags`;
CREATE TABLE `work_order_imags` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `work_order_id` bigint(20) DEFAULT NULL COMMENT '工单id',
  `image_seq` int(11) DEFAULT NULL COMMENT '图片顺序',
  `origin_path` varchar(255) DEFAULT NULL COMMENT '原图地址',
  `tbn_path` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `entry_datetime` datetime DEFAULT NULL COMMENT '添加时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '添加人',
  `entry_id` int(11) DEFAULT NULL COMMENT '添加人id',
  PRIMARY KEY (`image_id`),
  KEY `work_oiidx` (`work_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=598128 DEFAULT CHARSET=utf8 COMMENT='工单图片表';

-- ----------------------------
-- Table structure for work_order_log
-- ----------------------------
DROP TABLE IF EXISTS `work_order_log`;
CREATE TABLE `work_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工单id',
  `work_order_id` bigint(20) NOT NULL COMMENT '工单id',
  `operate_type` tinyint(4) NOT NULL COMMENT '操作类型: 1、指派  2、认责  3、 处理完毕  4、关闭',
  `operate_type_name` varchar(15) DEFAULT NULL COMMENT '操作类型名称',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '操作人',
  `entry_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `entry_date` datetime DEFAULT NULL COMMENT '添加时间',
  `duty_id` int(11) DEFAULT NULL COMMENT '指派责任人',
  `duty_name` varchar(50) DEFAULT NULL COMMENT '指派责任人',
  PRIMARY KEY (`id`),
  KEY `work_oiidx` (`work_order_id`),
  KEY `entry_didx` (`entry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=17036 DEFAULT CHARSET=utf8 COMMENT='工单流水表';

-- ----------------------------
-- Table structure for work_order_reply
-- ----------------------------
DROP TABLE IF EXISTS `work_order_reply`;
CREATE TABLE `work_order_reply` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `work_order_id` bigint(20) DEFAULT NULL COMMENT '工单id',
  `reply_comment` varchar(600) DEFAULT NULL COMMENT '回复内容',
  `entry_id` int(11) DEFAULT NULL COMMENT '回复人id',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '回复人名字',
  `entry_datetime` datetime DEFAULT NULL COMMENT '回复时间',
  `is_liability` tinyint(4) DEFAULT NULL COMMENT '是否认责:1、否 2、是',
  `reply_department_id` int(11) DEFAULT NULL COMMENT '回复部门id',
  `reply_department_name` varchar(50) DEFAULT NULL COMMENT '回复部门',
  PRIMARY KEY (`reply_id`),
  KEY `work_oiidx` (`work_order_id`),
  KEY `entry_didx` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工单回复信息表';

-- ----------------------------
-- Table structure for work_order_sort
-- ----------------------------
DROP TABLE IF EXISTS `work_order_sort`;
CREATE TABLE `work_order_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_sort_id` int(11) NOT NULL COMMENT '父id',
  `parent_sort_name` varchar(50) DEFAULT NULL COMMENT '父节点名称',
  `sort_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `sort_level` tinyint(4) DEFAULT NULL COMMENT '类的级别 :1、一级 2、二级 3、三级',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '是否生效:1 启用 0 新建 2 停用',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '添加人',
  `entry_name` varchar(50) DEFAULT NULL COMMENT '添加人姓名',
  `entry_datetime` datetime DEFAULT NULL COMMENT '停用/启用人id',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(50) DEFAULT NULL COMMENT '启用/关闭人',
  `update_datetime` datetime DEFAULT NULL COMMENT '启用关闭时间',
  PRIMARY KEY (`sort_id`),
  KEY `parent_snidx` (`parent_sort_name`),
  KEY `sort_nidx` (`sort_name`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COMMENT='工单分类';

/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmsindb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:53:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oms_gift_activity
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_activity`;
CREATE TABLE `oms_gift_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附赠活动id,自动增长',
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '活动名称',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `cover_num` int(11) DEFAULT NULL COMMENT '覆盖人数',
  `total_num` decimal(10,0) DEFAULT NULL COMMENT '总人数',
  `plan_num` int(11) DEFAULT NULL COMMENT '计划送出数',
  `cost_dept_name` varchar(64) DEFAULT NULL COMMENT '费用承担部门名称',
  `cost_dept_id` int(11) DEFAULT NULL COMMENT '费用承担部门id',
  `is_valid` int(11) DEFAULT NULL COMMENT '是否有效 1 有效 0 无效',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_source` varchar(32) DEFAULT NULL,
  `is_twin` tinyint(2) DEFAULT '0' COMMENT '是否并行0否',
  `give_ripe` tinyint(2) unsigned DEFAULT '0' COMMENT '赠送时机0随单赠',
  `gift_explain` varchar(255) DEFAULT NULL COMMENT '商品说明',
  `gift_site` varchar(255) DEFAULT '0' COMMENT '适用站点',
  `give_type` tinyint(2) DEFAULT '0' COMMENT '赠品类型--商品：0，商品券：1',
  `give_byorder_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:默认付款后(flow-附赠), 1:妥投后',
  `text_send_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:随券发送,1:付款后',
  `real_order_amount` decimal(16,4) DEFAULT NULL COMMENT '本次客单价',
  `relate_activities` varchar(255) DEFAULT NULL COMMENT '关联的活动',
  `is_only_sms` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-否，1-是',
  `customer_type` varchar(16) DEFAULT '0' COMMENT '客户类型',
  `user_type` varchar(64) NOT NULL DEFAULT '-1' COMMENT '用户类型',
  `give_object` tinyint(2) DEFAULT '0' COMMENT '赠品对象--春播用户：0，第三方用户：1',
  `start_bind_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '开始赠券时间',
  `finish_bind_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '结束赠券时间',
  `bind_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'binding status: 0 new, 1 running, 2 finished',
  `imported_candidate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否完成候选用户导入：0否， 1 是',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0新建, 1提交审核, 2审核通过, 0审核驳回',
  `audit_name` varchar(32) NOT NULL DEFAULT '' COMMENT '审核人',
  `audit_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '审核时间',
  `min_sku_cnt` int(11) DEFAULT '0' COMMENT '最小赠送商品种类数量, 个性化推荐使用,买前赠使用, 随单赠固定只赠送一个',
  `min_score` decimal(10,2) DEFAULT '0.00' COMMENT '商品最低分数, 个性化推荐使用, 低于该分数使用兜底商品',
  `re_join` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否允许同一客户多次参加一个活动:1是, 0否',
  `front_activity_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '前端运营弹窗活动ids',
  `today_reg` smallint(4) NOT NULL DEFAULT '0' COMMENT '包含当日注册：0-不包含， 1-包含',
  `all_cust` smallint(4) NOT NULL DEFAULT '0' COMMENT '是否全员活动：0-不是， 1-是',
  `clearing` smallint(6) NOT NULL DEFAULT '0' COMMENT '待清理：0：正常，1:待清理',
  `smart_call_id` varchar(128) NOT NULL DEFAULT '' COMMENT '智能外呼ID，只能单选',
  `smart_call_start_hour` int(11) unsigned NOT NULL DEFAULT '9' COMMENT '智能外呼开始时间',
  `smart_call_end_hour` int(11) unsigned NOT NULL DEFAULT '21' COMMENT '智能外呼结束时间',
  `push_url` varchar(128) NOT NULL DEFAULT '' COMMENT 'push 跳转地址',
  `send_push` smallint(4) NOT NULL DEFAULT '0' COMMENT '0:不发送，1发送',
  `push_title` varchar(64) NOT NULL DEFAULT '' COMMENT 'push 标题',
  `push_context` varchar(255) NOT NULL DEFAULT '' COMMENT 'push 内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_idx` (`code`) USING HASH,
  KEY `start_date_idx` (`start_date`) USING BTREE,
  KEY `end_date_idx` (`end_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16100 DEFAULT CHARSET=utf8 COMMENT='订单附赠活动';

-- ----------------------------
-- Table structure for oms_gift_activity_remove
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_activity_remove`;
CREATE TABLE `oms_gift_activity_remove` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `remove_activity_id` varchar(32) NOT NULL COMMENT '需要排除的活动id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8 COMMENT='活动排除表';

-- ----------------------------
-- Table structure for oms_gift_candidate_cust
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_candidate_cust`;
CREATE TABLE `oms_gift_candidate_cust` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '附赠活动id',
  `cust_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0为启用，1为删除',
  `site` varchar(255) DEFAULT NULL COMMENT '适用站点',
  PRIMARY KEY (`id`),
  KEY `cust_id_index` (`cust_id`),
  KEY `activity_id_index` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18228310400 DEFAULT CHARSET=utf8 COMMENT='附赠候选客户';

-- ----------------------------
-- Table structure for oms_gift_candidate_cust_bak
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_candidate_cust_bak`;
CREATE TABLE `oms_gift_candidate_cust_bak` (
  `id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) DEFAULT NULL COMMENT '附赠活动id',
  `cust_id` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0为启用，1为删除',
  `site` varchar(255) DEFAULT NULL COMMENT '适用站点'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_gift_candidate_error_cust
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_candidate_error_cust`;
CREATE TABLE `oms_gift_candidate_error_cust` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '附赠活动id',
  `cust_id` bigint(20) NOT NULL COMMENT '需要排除的客户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102692 DEFAULT CHARSET=utf8 COMMENT='需要排除的客户ID记录表';

-- ----------------------------
-- Table structure for oms_gift_condition
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_condition`;
CREATE TABLE `oms_gift_condition` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '条件id,主键自增',
  `activity_id` int(11) DEFAULT NULL COMMENT '附赠活动id',
  `code` varchar(32) DEFAULT NULL,
  `left_bracket` varchar(64) DEFAULT NULL COMMENT '左括号',
  `right_bracket` varchar(64) DEFAULT NULL COMMENT '右括号',
  `start_date` datetime DEFAULT NULL COMMENT '条件筛选开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '条件筛选结束时间',
  `lower` text,
  `upper` varchar(10) DEFAULT NULL,
  `lower_relation_sign` varchar(16) DEFAULT NULL COMMENT '下限关系符 > >=',
  `upper_relation_sign` varchar(16) DEFAULT NULL COMMENT '上限关系符 < <=',
  `operator` varchar(16) DEFAULT NULL COMMENT '逻辑运算符 and or',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(2) unsigned DEFAULT '0' COMMENT '删除标记，默认0使用中',
  `frequency` varchar(10) DEFAULT NULL COMMENT '频次',
  `condition_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '条件类型:0-BI条件, 1-随单实时订单条件',
  PRIMARY KEY (`condition_id`),
  KEY `activity_id_idx` (`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29794 DEFAULT CHARSET=utf8 COMMENT='附赠条件表';

-- ----------------------------
-- Table structure for oms_gift_cust_record
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_cust_record`;
CREATE TABLE `oms_gift_cust_record` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL,
  `gift_status` int(11) DEFAULT NULL COMMENT '0 附赠未出库 1 附赠成功 2 附赠失败,在erp报缺,实物报缺时附赠失败',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `sku_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '实际绑券， 赠送商品ID',
  PRIMARY KEY (`id`),
  KEY `a_id_idx` (`activity_id`) USING BTREE,
  KEY `c_id_idx` (`cust_id`) USING BTREE,
  KEY `order_i_idx` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=932126744 DEFAULT CHARSET=utf8 COMMENT='附赠记录';

-- ----------------------------
-- Table structure for oms_gift_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_info`;
CREATE TABLE `oms_gift_info` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '赠品id,主键自增',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `coupons_link_id` bigint(20) DEFAULT '0' COMMENT '券小批次',
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `gift_num` int(11) DEFAULT NULL COMMENT '赠品数量',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(2) unsigned DEFAULT '0' COMMENT '删除标记，默认0使用中',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '优先级，非必选项时为必录项',
  `required` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可选性：1必选，0非必选(多选1)',
  `sku_type` smallint(6) NOT NULL DEFAULT '1001' COMMENT '商品类型',
  `ctl_num` int(11) NOT NULL DEFAULT '-1' COMMENT '赠送总量控制：-1表示不受控制',
  `ctl_type` smallint(255) DEFAULT '0' COMMENT '赠送总量类型：1-总量，2-天量，0-没有总量控制',
  PRIMARY KEY (`gift_id`),
  KEY `activity_id_idx` (`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_gift_stock_warning
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_stock_warning`;
CREATE TABLE `oms_gift_stock_warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自动增长',
  `activity_id` int(11) DEFAULT NULL COMMENT '附赠活动Id',
  `sku_id` bigint(20) DEFAULT NULL,
  `lower_limit` int(11) DEFAULT NULL COMMENT '库存下限',
  `emails` varchar(500) DEFAULT NULL COMMENT '通知邮箱,以逗号分隔',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(2) unsigned DEFAULT '0' COMMENT '删除标记，默认0使用中',
  PRIMARY KEY (`id`),
  KEY `activity_id_idx` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6160 DEFAULT CHARSET=utf8 COMMENT='附赠库存预警';

-- ----------------------------
-- Table structure for oms_gift_stock_warning_send
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_stock_warning_send`;
CREATE TABLE `oms_gift_stock_warning_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '预警发送状态 0 新建 1 成功 2 失败',
  `content` varchar(500) DEFAULT NULL COMMENT '发送内容',
  `emails` varchar(500) DEFAULT NULL COMMENT '发送邮箱',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9858 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_gift_with_order_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_with_order_log`;
CREATE TABLE `oms_gift_with_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动号',
  `cust_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户id',
  `is_first_order` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为首单,0 否, 1是, 默认0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单附赠状态 0 失败, 1成功, 默认1',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cust_id` (`cust_id`),
  KEY `activity_id` (`activity_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26171718 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_predit_gift_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_predit_gift_info`;
CREATE TABLE `oms_predit_gift_info` (
  `gift_predit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '赠品id,主键自增',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动Id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuid,或者券批次ID',
  `product_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '卖场商品id， 品类券可能会有多个',
  `coupons_link_id` bigint(20) unsigned DEFAULT NULL COMMENT '小批次ID0',
  `sku_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `gift_num` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '赠品数量',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记，默认0使用中',
  `guarantee` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否兜底选项 1:是, 0:否',
  `sku_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '商品类型:1 普通商品, 2:券',
  `message_content` varchar(100) DEFAULT NULL COMMENT '短信内容',
  PRIMARY KEY (`gift_predit_id`),
  KEY `activity_id_idx` (`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='附赠个性化推荐商品, 券信息表';

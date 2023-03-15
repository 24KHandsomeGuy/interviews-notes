/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : cscoredb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assist_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `assist_order_detail`;
CREATE TABLE `assist_order_detail` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(11) DEFAULT NULL COMMENT '关联主表',
  `order_id` bigint(11) DEFAULT NULL COMMENT '订单号',
  `coupon_no` varchar(32) DEFAULT NULL COMMENT '商品券号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '销售价',
  `coupon_money` decimal(16,4) DEFAULT NULL COMMENT '商品券面值',
  `sku_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `status` int(11) DEFAULT NULL COMMENT '扣券状态:0:未绑定，1：扣券失败，2：扣券成功',
  `response_cause` varchar(250) DEFAULT NULL COMMENT '扣券响应',
  `response_datetime` datetime DEFAULT NULL COMMENT '处理响应时间',
  `bunding_datetime` datetime DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`request_item_id`),
  KEY `request_id1` (`request_id`) USING BTREE,
  KEY `request_id2` (`coupon_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3748 DEFAULT CHARSET=utf8 COMMENT='辅助下单明细';

-- ----------------------------
-- Table structure for assist_order_request
-- ----------------------------
DROP TABLE IF EXISTS `assist_order_request`;
CREATE TABLE `assist_order_request` (
  `request_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) DEFAULT NULL COMMENT '订单id',
  `order_type` smallint(6) DEFAULT NULL COMMENT '订单类型',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '收货人姓名',
  `cust_id` varchar(128) DEFAULT NULL COMMENT '收货人id',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '收货人联系方式',
  `entry_datetime` datetime DEFAULT NULL COMMENT '下单时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '下单人名',
  `entry_id` int(11) DEFAULT NULL COMMENT '下单人id',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `response_cause` varchar(250) DEFAULT NULL COMMENT '生单结果原因',
  `response_datetime` datetime DEFAULT NULL COMMENT '生单时间',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间',
  `province_id` int(11) DEFAULT NULL COMMENT '省id',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省名',
  `city_id` int(11) DEFAULT NULL COMMENT '市id',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市名',
  `district_id` int(11) DEFAULT NULL COMMENT '区id',
  `district_name` varchar(20) DEFAULT NULL COMMENT '区名',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '地址',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `is_print_price` int(11) DEFAULT NULL COMMENT '是否打印价格，1：打印,0,不打印',
  PRIMARY KEY (`request_id`),
  KEY `order_return_requestI1` (`order_id`) USING BTREE,
  KEY `order_return_requestI2` (`cust_name`) USING BTREE,
  KEY `order_return_requestI3` (`cust_mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3470 DEFAULT CHARSET=utf8 COMMENT='辅助下单主表';

-- ----------------------------
-- Table structure for black_gray_list_rule
-- ----------------------------
DROP TABLE IF EXISTS `black_gray_list_rule`;
CREATE TABLE `black_gray_list_rule` (
  `black_gray_list_rule_id` int(11) NOT NULL,
  `rule_type` tinyint(4) DEFAULT '3' COMMENT '灰黑:3 灰，2 黑',
  `rule_vals` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '规则值',
  `update_user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`black_gray_list_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='黑灰名单规则表';

-- ----------------------------
-- Table structure for black_white_gray_list
-- ----------------------------
DROP TABLE IF EXISTS `black_white_gray_list`;
CREATE TABLE `black_white_gray_list` (
  `cust_account` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户帐号',
  `cust_type` tinyint(4) DEFAULT '1' COMMENT '灰黑:1 白，2 黑,3 灰',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `founder_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人id',
  `founder_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `take_effect` tinyint(4) DEFAULT '1' COMMENT '生效标记:1 未生效，2 生效',
  `update_user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  PRIMARY KEY (`cust_account`),
  KEY `black_white_gray_list_I1` (`cust_type`),
  KEY `black_white_gray_list_I2` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='黑白灰名单';

-- ----------------------------
-- Table structure for cancel_reason
-- ----------------------------
DROP TABLE IF EXISTS `cancel_reason`;
CREATE TABLE `cancel_reason` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `request_id` int(11) NOT NULL,
  `code_id` smallint(6) NOT NULL COMMENT '原因ID',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cr_id`),
  KEY `cancel_reasonI2` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=941696 DEFAULT CHARSET=utf8 COMMENT='取消使用原因表';

-- ----------------------------
-- Table structure for cs_anticheat_operate
-- ----------------------------
DROP TABLE IF EXISTS `cs_anticheat_operate`;
CREATE TABLE `cs_anticheat_operate` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(11) NOT NULL COMMENT '订单id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `comments` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `function_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '申请时间',
  `create_name` varchar(50) NOT NULL DEFAULT '' COMMENT '申请人名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cs_push_issuccess
-- ----------------------------
DROP TABLE IF EXISTS `cs_push_issuccess`;
CREATE TABLE `cs_push_issuccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(64) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单Id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `request_type` smallint(6) DEFAULT NULL COMMENT '1:赔付 2：取消  3：退货  4：补发 5 发票 6 售后',
  `is_success` smallint(6) DEFAULT NULL COMMENT '状态 1:推送数成功,0推送数据失败',
  `process_flag` smallint(6) DEFAULT NULL COMMENT '10:赔付推送发票冲红  11：赔付推凭证',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `comments` varchar(64) DEFAULT NULL COMMENT '备注',
  `push_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '推送时间',
  PRIMARY KEY (`id`),
  KEY `is_success_index` (`is_success`),
  KEY `process_flag_index` (`process_flag`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_oid_rid_pf_is` (`order_id`,`request_id`,`process_flag`,`is_success`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8783404 DEFAULT CHARSET=utf8 COMMENT='赔付，退货，取消，补开发票，等子流程标记是否推送成功';

-- ----------------------------
-- Table structure for cs_reason_code
-- ----------------------------
DROP TABLE IF EXISTS `cs_reason_code`;
CREATE TABLE `cs_reason_code` (
  `code_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code_name` varchar(32) NOT NULL COMMENT '原因',
  `code_type` smallint(6) NOT NULL COMMENT '1 退款申请, 2 补发申请单, 3 取消订单申请, 4 销退申请',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态: 0 新增, 1 启用, -1 废弃',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code_id`),
  KEY `cs_reason_codeI1` (`code_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39250 DEFAULT CHARSET=utf8 COMMENT='客服系统原因表';

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
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indemnity_reason
-- ----------------------------
DROP TABLE IF EXISTS `indemnity_reason`;
CREATE TABLE `indemnity_reason` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `request_id` int(11) NOT NULL DEFAULT '0',
  `code_id` bigint(6) DEFAULT '0' COMMENT 'cs_reason_code主键。数据类型错误由smallint(6)改为正确的bigint(6)',
  `entry_id` int(11) DEFAULT '0' COMMENT '添加人id',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '添加人名',
  `collect_method` int(11) DEFAULT '1' COMMENT '赔付方式：1、历史支持持券赔付 request_id为表头的request_id的值，2、兼容券及现金的赔付方式request_id明细表中的cid值',
  `cp_id` int(11) DEFAULT '0' COMMENT '明细id',
  PRIMARY KEY (`cr_id`),
  KEY `request_idindex` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=328914 DEFAULT CHARSET=utf8 COMMENT='赔付使用原因表';

-- ----------------------------
-- Table structure for indemnity_request
-- ----------------------------
DROP TABLE IF EXISTS `indemnity_request`;
CREATE TABLE `indemnity_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(32) NOT NULL,
  `quality_rel` char(1) DEFAULT NULL,
  `carrier_rel` char(1) DEFAULT NULL,
  `other` char(1) DEFAULT NULL,
  `indemnity_reason` varchar(255) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `indemnity_amount` decimal(32,8) DEFAULT NULL,
  `collect_method` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_phone` varchar(32) NOT NULL,
  `src_order_id` int(11) NOT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL,
  `audit_date` datetime DEFAULT NULL,
  `audit_comments` varchar(255) DEFAULT NULL,
  `entry_name` varchar(100) DEFAULT NULL COMMENT '录入人',
  `audit_name` varchar(100) DEFAULT NULL COMMENT '审核人姓名',
  `member_point` int(11) unsigned DEFAULT NULL COMMENT '积分',
  `response_status` int(11) DEFAULT NULL,
  `response_cause` varchar(100) DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `sync_logistics_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '同步运费状态：0,不需要同步,1、需要同步（未同步）或同步失败 ,2、同步成功',
  `sync_logistics_datetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '赔付运费同步响应时间时间',
  `sync_logistics_cause` varchar(250) DEFAULT '' COMMENT '赔付运费同步响应原因',
  `op_sync_vendor_status` smallint(6) NOT NULL DEFAULT '2' COMMENT '产地直发同步供应商系统状态 2-默认 0-新建  1-成功',
  `op_sync_vendor_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 产地直发同步供应商系统日期',
  PRIMARY KEY (`request_id`),
  KEY `indemnity_requestI1` (`request_no`),
  KEY `indemnity_requestI2` (`entry_date`),
  KEY `idx_src_order_id` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=324350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for indemnity_request_coupons
-- ----------------------------
DROP TABLE IF EXISTS `indemnity_request_coupons`;
CREATE TABLE `indemnity_request_coupons` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券主键',
  `request_id` int(11) NOT NULL COMMENT '赔款单id',
  `coupons_id` int(11) NOT NULL COMMENT '优惠券批次id',
  `start_time` datetime NOT NULL COMMENT '优惠券启用时间',
  `end_time` datetime NOT NULL COMMENT '优惠券有效截止时间',
  `coupons_fv` decimal(10,2) DEFAULT NULL,
  `coupons_qty` smallint(6) NOT NULL COMMENT '使用数量',
  `entry_id` int(11) NOT NULL COMMENT '录入人',
  `entry_date` datetime NOT NULL COMMENT '录入时间',
  `coupons_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `entry_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `coupons_link_id` int(11) DEFAULT '0' COMMENT '领用批次',
  `sync_status` tinyint(4) DEFAULT '0' COMMENT '同步状态 1、未同步或同步失败，2、同步成功',
  `sync_datetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '同步时间',
  `response_cause` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '失败描述',
  `sku_id` int(11) DEFAULT '0' COMMENT '赔付的商品sku_id',
  `sku_name` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '赔付的商品sku_name',
  `type` smallint(6) DEFAULT '1' COMMENT '赔付方式：1、优惠券，2、赔付现金',
  `order_detail_id` bigint(20) DEFAULT '0' COMMENT '订单明细id',
  `comment` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '原因说明',
  PRIMARY KEY (`cid`),
  KEY `idx_request_id` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=334646 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for invoice_attribute
-- ----------------------------
DROP TABLE IF EXISTS `invoice_attribute`;
CREATE TABLE `invoice_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(40) DEFAULT '' COMMENT '属性名',
  `field_value` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '属性值',
  `entry_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `field_name_valueindex` (`field_name`,`field_value`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='补开发票属性表';

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `invoice_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `header_id` bigint(11) NOT NULL COMMENT '收货id',
  `title` varchar(200) NOT NULL,
  `content` smallint(6) DEFAULT '0' COMMENT '发票内容:0-食品、1-礼品、2-酒水、3-办公用品、4-福利费',
  `drawer` varchar(200) DEFAULT '' COMMENT '开票单位',
  `amount` decimal(14,4) NOT NULL DEFAULT '0.0000' COMMENT '发票金额',
  `amount_capital` varchar(100) DEFAULT '' COMMENT '发票金额大写',
  `status` smallint(6) DEFAULT '0' COMMENT '发票状态:0-待打印;1-已打印',
  `type` smallint(6) DEFAULT '0' COMMENT '发票类型:0、普通发票；1、增值税发票',
  `entry_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `co_tax_no` varchar(30) NOT NULL DEFAULT '' COMMENT '公司税号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '按订单开商品明细发票时存放',
  PRIMARY KEY (`invoice_id`),
  KEY `header_idindex` (`header_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63594 DEFAULT CHARSET=utf8 COMMENT='发票信息表';

-- ----------------------------
-- Table structure for invoice_header
-- ----------------------------
DROP TABLE IF EXISTS `invoice_header`;
CREATE TABLE `invoice_header` (
  `header_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(50) DEFAULT '' COMMENT '收件人姓名',
  `cust_phone` varchar(20) DEFAULT '' COMMENT '收件人电话',
  `cust_address` varchar(200) DEFAULT '' COMMENT '邮寄地址',
  `cust_postcode` varchar(6) DEFAULT '' COMMENT '邮编',
  `common` varchar(255) DEFAULT '' COMMENT '备注',
  `entry_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(30) DEFAULT '' COMMENT '创建人',
  `medium_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '开票介质：0普通、1增值、2电子',
  `invoice_method` tinyint(2) NOT NULL DEFAULT '0' COMMENT '开票方式：1合单开、2按订单开',
  `invoice_email` varchar(64) NOT NULL DEFAULT '' COMMENT '客户邮箱',
  `purchase_address` varchar(255) NOT NULL DEFAULT '' COMMENT '购买地址',
  `purchase_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '购买电话',
  `purchaser_account_bank` varchar(50) NOT NULL DEFAULT '' COMMENT '购买方开户行',
  `purchaser_bank_account_number` varchar(80) NOT NULL DEFAULT '' COMMENT '购买方银行账号',
  PRIMARY KEY (`header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60384 DEFAULT CHARSET=utf8 COMMENT='发票创建批次表';

-- ----------------------------
-- Table structure for invoice_order
-- ----------------------------
DROP TABLE IF EXISTS `invoice_order`;
CREATE TABLE `invoice_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `cust_id` varchar(50) NOT NULL COMMENT '客户id',
  `cust_phone` varchar(20) DEFAULT '' COMMENT '客户手机号',
  `src_order_id` bigint(20) DEFAULT NULL COMMENT '原单号',
  `is_parent` smallint(6) DEFAULT '0' COMMENT '是否是父单',
  `order_status` smallint(6) NOT NULL COMMENT '订单状态',
  `order_type` smallint(6) DEFAULT '1' COMMENT '订单类型:1-销售订单2-销售订单（宅配）3-春播卡4-服务费5-其他6-预收款7-销售订单（企业）',
  `sale_type` smallint(6) DEFAULT '0' COMMENT '订单销售类型：0-toc;1-tob',
  `order_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '订单金额',
  `max_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '可开发票限额',
  `print_type` smallint(6) DEFAULT '0' COMMENT '开票方式:0-未开；1-随单开；2-已开',
  `invoice_header_id` bigint(11) NOT NULL COMMENT '发票邮寄地址id',
  `create_datetime` datetime NOT NULL COMMENT '下单时间',
  `entry_datetime` datetime NOT NULL COMMENT '创建时间',
  `entry_name` varchar(30) DEFAULT '' COMMENT '创建人',
  `medium_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '开票介质：0普通、1增值、2电子',
  PRIMARY KEY (`order_id`),
  KEY `cust_idindex` (`cust_id`) USING BTREE,
  KEY `create_datetimeindex` (`create_datetime`) USING BTREE,
  KEY `entry_nameindex` (`entry_name`) USING BTREE,
  KEY `invoice_header_idindex` (`invoice_header_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='补开发票订单表';

-- ----------------------------
-- Table structure for invoice_pull_que
-- ----------------------------
DROP TABLE IF EXISTS `invoice_pull_que`;
CREATE TABLE `invoice_pull_que` (
  `invoice_id` bigint(11) NOT NULL COMMENT '发票id',
  `bill_id` varchar(500) DEFAULT '' COMMENT '流水单ID 多个以英文/分割',
  `bill_type` smallint(6) DEFAULT '1' COMMENT '流水单类型:1-销售订单2-销售订单（宅配）3-春播卡4-服务费5-其他6-预收款7-销售订单（企业） ',
  `bill_source` smallint(6) DEFAULT '4' COMMENT '订单来源来源:1-TMS2-春播卡系统3-发票系统4-客服系统5-企销系统6-用户自主补开 ',
  `invoice_type` smallint(6) DEFAULT '1' COMMENT '发票类型:1-普通发票2-增值税发票3-电子发票4-专业发票 ',
  `invoice_drawer` varchar(200) DEFAULT '' COMMENT '开票单位',
  `invoice_title` varchar(200) DEFAULT '' COMMENT '发票抬头',
  `invoice_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '发票总金额',
  `invoice_amount_capital` varchar(100) DEFAULT '' COMMENT '发票总金额大写',
  `invoice_status` smallint(6) DEFAULT '0' COMMENT '发票状态:0-待打印1-已打印 ',
  `extend_param` varchar(50) DEFAULT '' COMMENT '扩展参数',
  `post_receiver_name` varchar(50) DEFAULT '' COMMENT '邮寄收件人名称',
  `post_receiver_phone` varchar(20) DEFAULT '' COMMENT '邮寄收件人电话',
  `post_receiver_address` varchar(255) DEFAULT '' COMMENT '邮寄收件人地址',
  `postcode` varchar(6) DEFAULT '' COMMENT '邮编',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `item_name` varchar(50) DEFAULT '' COMMENT '项目名称',
  `price` decimal(14,4) DEFAULT '0.0000' COMMENT '单价',
  `quantity` int(11) DEFAULT '1' COMMENT '数量',
  `amount` decimal(14,4) DEFAULT '0.0000' COMMENT '总金额',
  `fill_flag` smallint(6) DEFAULT '1' COMMENT '补开标记:0-非补开；1-补开',
  `is_success` smallint(6) DEFAULT '0' COMMENT '是否上传成功:0-未上传;1-已上传;-1-失败',
  `error_msg` varchar(255) DEFAULT '' COMMENT '失败描述',
  `entry_datetime` datetime NOT NULL COMMENT '创建时间',
  `send_datetime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '上传时间',
  `medium_type` smallint(6) NOT NULL DEFAULT '2' COMMENT '开票介质：1电子、2纸质',
  `send_times` int(11) NOT NULL DEFAULT '0' COMMENT '发送次数',
  `buyer_id` varchar(20) NOT NULL DEFAULT '' COMMENT '客户id',
  `co_tax_no` varchar(30) NOT NULL DEFAULT '' COMMENT '公司税号',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推送FMS队列表';

-- ----------------------------
-- Table structure for malice_rule
-- ----------------------------
DROP TABLE IF EXISTS `malice_rule`;
CREATE TABLE `malice_rule` (
  `malice_rule_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `malice_reason` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '原因',
  `malice_value` int(8) NOT NULL COMMENT '分值',
  `founder_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_type` tinyint(4) DEFAULT '1' COMMENT '删除标记:1 是，2 否',
  PRIMARY KEY (`malice_rule_id`),
  KEY `malice_rule_I1` (`del_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='恶意度规则表';

-- ----------------------------
-- Table structure for malicious_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `malicious_order_setting`;
CREATE TABLE `malicious_order_setting` (
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `cust_account` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户帐号',
  `malice_rule_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '恶意度规则主键',
  `malice_reason` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '原因',
  `malicious_remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '恶意备注',
  `founder_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人id',
  `founder_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `approver_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人id',
  `approver_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `audit_status` tinyint(4) DEFAULT '1' COMMENT '审核状态:1 新建，2 审核通过，3 审核未通过',
  PRIMARY KEY (`order_id`),
  KEY `malicious_order_setting_I1` (`cust_account`),
  KEY `malicious_order_setting_I2` (`audit_status`),
  KEY `malicious_order_setting_I3` (`created_time`),
  KEY `malicious_order_setting_I4` (`audit_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='恶意订单设置';

-- ----------------------------
-- Table structure for nps_detail
-- ----------------------------
DROP TABLE IF EXISTS `nps_detail`;
CREATE TABLE `nps_detail` (
  `nps_detail_id` bigint(11) NOT NULL,
  `nps_header_id` bigint(11) NOT NULL,
  `callback_status` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '回访结果0不满意1满意',
  `comment` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '意见',
  `callback_date` datetime DEFAULT NULL COMMENT '创建时间 回访时间',
  `callback_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `callback_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人 回访人',
  PRIMARY KEY (`nps_detail_id`,`nps_header_id`),
  UNIQUE KEY `nps_detail_id` (`nps_detail_id`) USING BTREE,
  KEY `nps_header_id` (`nps_header_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for nps_header
-- ----------------------------
DROP TABLE IF EXISTS `nps_header`;
CREATE TABLE `nps_header` (
  `nps_header_id` bigint(11) NOT NULL,
  `sms_id` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '短信id',
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户账号id',
  `user_account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号名称',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户姓名',
  `score` int(11) DEFAULT NULL COMMENT '用户评分',
  `status` int(11) DEFAULT NULL COMMENT '状态1已回访 0 未回访',
  `entry_date` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `entry_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`nps_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for nps_reason_code_map
-- ----------------------------
DROP TABLE IF EXISTS `nps_reason_code_map`;
CREATE TABLE `nps_reason_code_map` (
  `id` bigint(32) NOT NULL DEFAULT '0',
  `nps_detail_id` bigint(32) DEFAULT NULL,
  `request_code_id` bigint(32) DEFAULT NULL,
  `status` int(32) DEFAULT NULL COMMENT '0不满意1满意',
  PRIMARY KEY (`id`),
  KEY `nps_detail_id` (`nps_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for odometer
-- ----------------------------
DROP TABLE IF EXISTS `odometer`;
CREATE TABLE `odometer` (
  `odo_type` varchar(10) NOT NULL,
  `length` int(11) NOT NULL,
  `current_no` int(11) NOT NULL,
  PRIMARY KEY (`odo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_callback_request
-- ----------------------------
DROP TABLE IF EXISTS `order_callback_request`;
CREATE TABLE `order_callback_request` (
  `request_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `src_order_id` bigint(11) DEFAULT NULL COMMENT '来源单据号',
  `src_order_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `src_order_type` int(11) DEFAULT NULL COMMENT '来源单据类型',
  `src_order_status` int(11) DEFAULT NULL COMMENT '来源单据状态',
  `status` int(11) DEFAULT NULL COMMENT '状态1、新增 2、审核 3、推送',
  `request_type` int(11) DEFAULT NULL COMMENT '申请单类型',
  `cancel_order_id` bigint(11) DEFAULT NULL COMMENT '取消单id',
  `cancel_order_no` bigint(11) DEFAULT NULL,
  `cancel_order_type` int(11) DEFAULT NULL COMMENT '44取消订单',
  `return_cancel_status` int(11) DEFAULT NULL COMMENT '上传ERP时OMS系统的返回值',
  `return_cancel_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '上传ERP时OMS系统的返回值',
  `return_cancel_date` datetime DEFAULT NULL COMMENT '调用退单的返回时间',
  `new_order_id` bigint(20) DEFAULT NULL COMMENT '重发订单',
  `new_order_no` bigint(20) DEFAULT NULL,
  `new_order_type` int(11) DEFAULT NULL COMMENT '43重发订单',
  `return_new_status` int(11) DEFAULT NULL COMMENT '调用重发service的返回状态',
  `return_new_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调用重发service的返回错误信息',
  `return_new_date` datetime DEFAULT NULL COMMENT '调用重发的返回时间',
  `cancel_cash_order_id` bigint(20) DEFAULT NULL COMMENT '退款',
  `cancel_cash_order_no` bigint(20) DEFAULT NULL,
  `cancel_cash_order_type` int(11) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cust_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `cust_telephone` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人电话',
  `cust_mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机',
  `cust_email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户邮箱',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `district_id` int(11) DEFAULT NULL COMMENT '区',
  `postal_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `cust_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '客户地址',
  `new_cust_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户新名称',
  `new_cust_telephone` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '客户新电话',
  `new_cust_mobile` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `new_cust_email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `new_province_id` int(11) DEFAULT NULL,
  `new_city_id` int(11) DEFAULT NULL,
  `new_district_id` int(11) DEFAULT NULL,
  `new_postal_code` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `new_cust_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL COMMENT '审核id',
  `audit_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_comments` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审核备注',
  `delivery_type` int(11) DEFAULT NULL COMMENT '送货方式',
  `total_sku_num` int(11) DEFAULT NULL COMMENT '总数量',
  `cancel_total_price` decimal(10,2) DEFAULT NULL COMMENT '取消单总价格',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总价格',
  `callback_date` datetime DEFAULT NULL COMMENT '拉回时间',
  `shipment_type` smallint(6) DEFAULT NULL COMMENT '送货方式',
  `book_date` datetime DEFAULT NULL COMMENT '预定送货时间',
  `county_id` int(11) DEFAULT NULL,
  `county` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `area_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `area_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `fixed_time_arrive_type` int(11) DEFAULT NULL COMMENT '定时达类型',
  `short_wait_order_id` bigint(20) DEFAULT NULL COMMENT '缺货等待单号',
  `shipment_start_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '送货开始时间',
  `shipment_end_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '送货结束时间',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源',
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `order_callback_requestI1` (`src_order_id`) USING BTREE,
  KEY `idx_entry_date` (`entry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1587022 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拉回表';

-- ----------------------------
-- Table structure for order_callback_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_callback_request_detail`;
CREATE TABLE `order_callback_request_detail` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(11) DEFAULT NULL,
  `request_seq` int(11) DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细id',
  `sku_id` bigint(11) DEFAULT NULL,
  `sku_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `sales_prices` decimal(16,4) DEFAULT NULL COMMENT '单价',
  `order_qty` int(11) DEFAULT NULL,
  `return_qty` int(11) DEFAULT NULL COMMENT '退款数量',
  `new_qty` int(11) DEFAULT NULL COMMENT '重发数量',
  `is_gift` smallint(6) DEFAULT NULL,
  `src_sku_id` bigint(20) DEFAULT NULL,
  `short_wait_qty` int(11) DEFAULT NULL COMMENT '缺货等待数量',
  PRIMARY KEY (`request_item_id`),
  KEY `order_callback_request_detailI1` (`request_id`),
  KEY `order_callback_request_detailI2` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7248690 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拉回操作商品信息';

-- ----------------------------
-- Table structure for order_cancel_request
-- ----------------------------
DROP TABLE IF EXISTS `order_cancel_request`;
CREATE TABLE `order_cancel_request` (
  `request_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '取消单ID',
  `request_no` varchar(32) NOT NULL COMMENT '取消单编号',
  `src_order_id` bigint(11) NOT NULL COMMENT '来源订单id',
  `src_order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `src_order_no` varchar(32) DEFAULT NULL COMMENT '来源单据编号',
  `src_order_status` int(11) DEFAULT NULL COMMENT '来源单据状态',
  `status` int(11) DEFAULT NULL COMMENT '申请单状态 0:新增, 1, 提交, 2 完成',
  `close_date` datetime DEFAULT NULL COMMENT '取消结束时间（和OMS等其他的系统确认的时间）',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注	',
  `entry_id` int(11) DEFAULT NULL COMMENT '申请人',
  `entry_date` datetime DEFAULT NULL COMMENT '申请时间',
  `entry_name` varchar(50) DEFAULT NULL COMMENT '申请人名',
  `response_cause` varchar(255) DEFAULT NULL,
  `request_type` tinyint(4) DEFAULT NULL COMMENT '操作类型:1、客服取消 2、人工省单',
  PRIMARY KEY (`request_id`),
  KEY `order_cancel_requestI1` (`src_order_id`,`src_order_type`),
  KEY `order_cancel_requestI2` (`entry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=944006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_delivery_main
-- ----------------------------
DROP TABLE IF EXISTS `order_delivery_main`;
CREATE TABLE `order_delivery_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单号',
  `delivery_station_id` varchar(32) DEFAULT NULL COMMENT '配送站点编号',
  `delivery_station` varchar(64) DEFAULT NULL COMMENT '配送站点名',
  `waybill_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '配送公司',
  `delivery_id` int(11) DEFAULT NULL COMMENT '承运商id',
  `modify_date` timestamp NULL DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '县',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37989344 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sku_name` varchar(64) DEFAULT NULL COMMENT 'sku名',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `temp_area_id` smallint(6) DEFAULT NULL COMMENT '温区id',
  `is_suit` int(11) DEFAULT NULL COMMENT '1:套装 0:非套装',
  `sku_num` int(11) DEFAULT NULL COMMENT 'sku数量',
  `sku_price` decimal(16,4) DEFAULT NULL COMMENT 'sku价格',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销单价',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '销售价',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sku_width` decimal(12,4) DEFAULT NULL COMMENT '宽',
  `sku_height` decimal(12,4) DEFAULT NULL COMMENT '高',
  `sku_length` decimal(12,4) DEFAULT NULL COMMENT '长',
  `sku_weight` decimal(12,4) DEFAULT NULL COMMENT '重量',
  `member_points` int(11) DEFAULT NULL COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '客户积分金额',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `is_short` smallint(6) DEFAULT NULL COMMENT '是否缺货',
  `short_num` int(11) DEFAULT NULL COMMENT '缺货数量',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品  1是0否',
  `promotion_id` varchar(32) DEFAULT NULL COMMENT '促销活动编号',
  `promation_origin` varchar(32) DEFAULT NULL COMMENT '促销来源',
  `gift_num` int(11) DEFAULT NULL COMMENT '赠品数量',
  `sale_type` smallint(6) DEFAULT NULL COMMENT '1:普通商品 2:预售商品',
  `presale_date` datetime DEFAULT NULL COMMENT '预计送货时间',
  `sku_remark` varchar(256) DEFAULT NULL COMMENT '附加信息',
  `properties` varchar(256) DEFAULT NULL,
  `sku_extend` varchar(2048) DEFAULT NULL COMMENT '套装sku明细',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费金额',
  `sku_type` int(11) DEFAULT NULL COMMENT '类似零元购，加价购',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券价格',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开发票金额',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '实付金额',
  `src_sku_id` varchar(50) DEFAULT NULL,
  `is_short_wait` int(11) DEFAULT NULL,
  `gift_type` smallint(6) DEFAULT '0' COMMENT '赠品类型',
  `book_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '预定时间',
  `active_type` smallint(6) DEFAULT '0' COMMENT '活动类型',
  `is_cashBack` smallint(6) DEFAULT '0' COMMENT '是否返利商品 0 否 1是',
  `is_direct_delivery` smallint(6) DEFAULT '0' COMMENT '是否原产地直发 0 否 1 是',
  `shipment_start_time` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '送货开始时间',
  `shipment_end_time` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '送货结束时间',
  `shipment_type` smallint(6) DEFAULT '0' COMMENT '履约类型:1:工作日送货 2:节假日 3:随时 4:定时达',
  `line_no` int(11) NOT NULL DEFAULT '0',
  `src_order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单明细号',
  PRIMARY KEY (`order_detail_id`),
  KEY `order_detailI1` (`order_id`),
  KEY `order_detailI2` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_exception_request
-- ----------------------------
DROP TABLE IF EXISTS `order_exception_request`;
CREATE TABLE `order_exception_request` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sys_source` smallint(6) NOT NULL COMMENT '异常来源：1、OMS 2、WMS',
  `order_id` bigint(11) NOT NULL COMMENT '异常订单号',
  `order_type` smallint(6) NOT NULL COMMENT '订单类型',
  `loc_id` int(11) NOT NULL COMMENT '库房id',
  `code` smallint(6) NOT NULL COMMENT '异常原因',
  `status` smallint(6) DEFAULT NULL COMMENT '异常处理标识：1、新增 2、已处理',
  `content` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT '异常日期',
  `entry_id` int(11) DEFAULT NULL COMMENT '上传异常订单操作人id',
  `entry_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '上传异常订单操作人名',
  `entry_date` datetime DEFAULT NULL COMMENT '上传异常订单操作时间',
  `audit_id` int(11) DEFAULT NULL COMMENT '异常处理人id',
  `audit_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '异常处理人名',
  `audit_comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '异常处理信息',
  `audit_date` datetime DEFAULT NULL COMMENT '处理时间',
  `loc_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发货仓库名称',
  `sku_id` bigint(20) DEFAULT '0' COMMENT 'sku id',
  `question_type` varchar(30) DEFAULT '' COMMENT '问题种类',
  PRIMARY KEY (`id`),
  KEY `order_exception_requestI1` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1160150 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for order_main
-- ----------------------------
DROP TABLE IF EXISTS `order_main`;
CREATE TABLE `order_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `order_type` smallint(6) DEFAULT NULL COMMENT '1:正向订单 2:退货单 3:换货取货单 4:换货配送单 5:漏发补发单 6:不退补发单 7:有货先发订单 100:取消订单	',
  `order_source` int(11) DEFAULT NULL COMMENT '订单平台来源 1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP',
  `order_direct_source` int(11) DEFAULT NULL COMMENT '订单平台来源:1-PC,2-微信,3-移动端-IOS,4-移动端-ANDROID,5-WAP',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `order_channel` smallint(6) DEFAULT NULL COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `cust_account` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `cust_telephone` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `cust_email` varchar(64) DEFAULT NULL COMMENT '客户邮箱',
  `pay_money` decimal(16,4) DEFAULT NULL COMMENT '应付现金金额',
  `total_price` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠金额',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `member_points` decimal(16,4) DEFAULT '0.0000' COMMENT '积分',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `order_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `book_date` datetime DEFAULT NULL COMMENT '预约送货日期',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '县区',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮编',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `need_invoice` smallint(6) DEFAULT '0' COMMENT '1:需要发票 0:不需要发票',
  `split_type` smallint(6) DEFAULT NULL COMMENT '1:未拆分 2:已拆分 3:重拆分 4:无需拆分',
  `is_payed` smallint(6) DEFAULT NULL COMMENT '1:已支付 0:未支付',
  `payment_type` smallint(6) DEFAULT NULL COMMENT '支付方式：1:在线支付 2:货到付款',
  `payment_channel` varchar(32) DEFAULT NULL COMMENT '支付渠道',
  `parent_payment_channel` varchar(32) DEFAULT NULL COMMENT '父支付渠道',
  `payment_account` varchar(32) DEFAULT NULL COMMENT '支付帐号',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已付现金金额',
  `shipment_type` smallint(6) DEFAULT NULL COMMENT '履约类型:1:工作日送货 2:节假日 3:随时',
  `order_flag` varchar(64) DEFAULT NULL COMMENT '订单标示（待用字段）',
  `shipment_start_time` datetime DEFAULT NULL COMMENT '送货开始时间',
  `shipment_end_time` datetime DEFAULT NULL COMMENT '送货结束时间',
  `weight` decimal(12,4) DEFAULT NULL COMMENT '总重量',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `delivery_type` smallint(6) DEFAULT NULL COMMENT '配送方式:1:快递,2:邮寄',
  `payment_date` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `ware_out_date` timestamp NULL DEFAULT NULL COMMENT '出库时间',
  `finish_date` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '本系统创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_short` int(11) DEFAULT NULL COMMENT '缺货标示',
  `pack_num` int(11) DEFAULT NULL COMMENT '包裹数',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额支付金额',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户登录id',
  `is_refund` smallint(6) DEFAULT NULL COMMENT '是否退款',
  `is_parent` smallint(6) DEFAULT '0' COMMENT '1:父单 0:子单',
  `order_remark` varchar(256) DEFAULT NULL COMMENT '订单附加信息',
  `temp_area_id` smallint(6) DEFAULT NULL COMMENT '温区id',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `traffic_source` varchar(256) DEFAULT NULL COMMENT '订单流量来源 1:CPS等平台 2:导航网站等 3:特定广告等（跟踪码）4:域名直接访问',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开票金额',
  `delivery_area_id` int(11) DEFAULT NULL COMMENT '配送区域',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '县区',
  `is_short_split` smallint(6) DEFAULT '0' COMMENT '1:有货先发 0:暂停',
  `session_id` varchar(64) DEFAULT NULL COMMENT '用户登录sessionid',
  `order_sequence` int(11) DEFAULT NULL COMMENT '子订单编号',
  `trade_type` int(11) DEFAULT NULL COMMENT '1-普通订单支付 2-预售单定金 3-预售单尾款',
  `business_type` int(11) DEFAULT NULL COMMENT '1-普通商品购买 2-他人代付',
  `area_id` varchar(32) DEFAULT NULL COMMENT '四级地址id',
  `area_name` varchar(64) DEFAULT NULL COMMENT '四级地址名',
  `is_print_price` int(11) DEFAULT '1' COMMENT '是否打印价格1:是2:否',
  `third_order_id` varchar(32) DEFAULT NULL,
  `in_cs_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_mainI1` (`order_id`) USING BTREE,
  KEY `order_mainI2` (`create_date`),
  KEY `order_mainI3` (`ware_out_date`),
  KEY `order_mainI4` (`book_date`)
) ENGINE=InnoDB AUTO_INCREMENT=127308358 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_replenish_request
-- ----------------------------
DROP TABLE IF EXISTS `order_replenish_request`;
CREATE TABLE `order_replenish_request` (
  `request_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(32) NOT NULL,
  `src_order_id` bigint(11) NOT NULL,
  `src_order_type` int(11) NOT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_status` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `replenish_order_id` bigint(11) DEFAULT NULL,
  `replenish_order_no` int(11) DEFAULT NULL,
  `replenish_order_type` int(11) DEFAULT NULL,
  `whole_replenish` char(1) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `audit_comments` varchar(100) DEFAULT NULL COMMENT '补发审核备注原因',
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `return_rep_status` int(11) DEFAULT NULL COMMENT 'OMS返回状态',
  `return_rep_cause` varchar(255) DEFAULT NULL COMMENT 'OMS返回错误原因',
  `return_rep_date` datetime DEFAULT NULL COMMENT 'OMS返回时间',
  `audit_name` varchar(100) DEFAULT NULL COMMENT '审核人名',
  `entry_name` varchar(100) DEFAULT NULL COMMENT '录入人名',
  `delivery_date` date DEFAULT NULL,
  `fixed_time_arrive_type` int(11) DEFAULT NULL COMMENT '定时达类型',
  `sync_logistics_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '同步运费状态：0,不需要同步,1、需要同步（未同步）或同步失败 ,2、同步成功',
  `sync_logistics_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赔付运费同步响应时间时间',
  `sync_logistics_cause` varchar(250) DEFAULT '' COMMENT '赔付运费同步响应原因',
  `shipment_type` smallint(6) DEFAULT '0' COMMENT '履约类型:0:默认 1:工作日送货 2:节假日 3:随时 4:定时达 5:极速达',
  `shipment_start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '送货开始时间',
  `shipment_end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '送货结束时间',
  PRIMARY KEY (`request_id`),
  KEY `order_replenish_requestI1` (`src_order_id`,`src_order_type`),
  KEY `order_replenish_requestI2` (`replenish_order_id`),
  KEY `order_replenish_requestI3` (`entry_date`),
  KEY `order_replenish_requestI4` (`request_no`)
) ENGINE=InnoDB AUTO_INCREMENT=77034 DEFAULT CHARSET=utf8 COMMENT='补发订单申请表';

-- ----------------------------
-- Table structure for order_replenish_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_replenish_request_detail`;
CREATE TABLE `order_replenish_request_detail` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(11) NOT NULL,
  `request_seq` int(11) NOT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `sku_id` int(11) NOT NULL,
  `avilable_qty` int(11) NOT NULL,
  `sales_price` decimal(16,4) DEFAULT NULL,
  `order_qty` int(11) NOT NULL,
  `replenish_qty` int(11) NOT NULL,
  `is_gift` smallint(6) DEFAULT NULL,
  `src_sku_id` bigint(20) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL,
  `src_order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单明细号',
  PRIMARY KEY (`request_item_id`),
  KEY `order_replenish_request_detailI2` (`request_id`) USING BTREE,
  KEY `order_replenish_request_detailI3` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104882 DEFAULT CHARSET=utf8 COMMENT='补发订单分录表';

-- ----------------------------
-- Table structure for order_retry_front
-- ----------------------------
DROP TABLE IF EXISTS `order_retry_front`;
CREATE TABLE `order_retry_front` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单号',
  `retry_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '重试类型',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品编号',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `catch_date` timestamp NULL DEFAULT '1970-01-01 08:00:01',
  `msg_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '消息发送时机',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1209430 DEFAULT CHARSET=utf8 COMMENT='推送重试表';

-- ----------------------------
-- Table structure for order_return_abandon_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_return_abandon_detail`;
CREATE TABLE `order_return_abandon_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `src_order_id` bigint(20) DEFAULT '0' COMMENT '来源单号',
  `return_order_id` bigint(20) DEFAULT '0' COMMENT '退单号',
  `request_item_id` bigint(20) DEFAULT '0' COMMENT '销退明细id',
  `entry_id` int(11) DEFAULT '0' COMMENT '操作人id',
  `entry_name` varchar(50) DEFAULT '' COMMENT '操作人姓名',
  `entry_datetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `comments` varchar(255) DEFAULT '' COMMENT '放弃原因描述',
  `sku_id` int(11) DEFAULT '0' COMMENT 'skuId',
  `sku_type` int(11) DEFAULT '0' COMMENT 'sku类型',
  `return_qty` int(11) DEFAULT '0' COMMENT '退货数量',
  `abandon_qty` int(11) DEFAULT '0' COMMENT '放弃回收数量',
  `is_gift` smallint(6) DEFAULT '0' COMMENT '是否是赠品',
  `ware_id` int(11) DEFAULT '0' COMMENT '仓库编号',
  `src_sku_id` int(11) DEFAULT '0' COMMENT '来源sku',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态:code=1为成功，0修改失败需要重新提交  -1为不能修改',
  PRIMARY KEY (`id`),
  KEY `src_order_idindex` (`src_order_id`) USING BTREE,
  KEY `return_order_idindex` (`return_order_id`) USING BTREE,
  KEY `request_item_idindex` (`request_item_id`),
  KEY `sku_idindex` (`sku_id`),
  KEY `src_sku_idindex` (`src_sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1184 DEFAULT CHARSET=utf8 COMMENT='销退换退：回收/放弃数量表';

-- ----------------------------
-- Table structure for order_return_request
-- ----------------------------
DROP TABLE IF EXISTS `order_return_request`;
CREATE TABLE `order_return_request` (
  `request_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(32) NOT NULL,
  `request_type` smallint(6) NOT NULL COMMENT '订单消退、换退类型',
  `src_order_id` bigint(11) DEFAULT NULL,
  `src_order_type` int(11) NOT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_status` int(11) DEFAULT NULL,
  `src_system_type` smallint(6) DEFAULT NULL COMMENT '单据录入方式：1,客服录入  2,用户自助',
  `purchase_return_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '补货计划销单关联采购单对应的采退单号',
  `status` int(11) DEFAULT NULL,
  `return_type` int(11) DEFAULT NULL,
  `return_order_id` bigint(20) DEFAULT NULL,
  `return_order_no` bigint(20) DEFAULT NULL,
  `return_order_type` int(11) DEFAULT NULL,
  `return_status` int(11) DEFAULT NULL COMMENT '上传ERP时OMS系统的返回值',
  `return_code` varchar(255) DEFAULT NULL COMMENT '上传ERP时OMS系统的返回值',
  `return_date` datetime DEFAULT NULL COMMENT '调用退单的返回时间',
  `swap_order_id` bigint(20) DEFAULT NULL,
  `swap_order_no` bigint(20) DEFAULT NULL,
  `swap_order_type` int(11) DEFAULT NULL,
  `return_swap_status` int(11) DEFAULT NULL COMMENT '调用swap的返回状态',
  `return_swap_code` varchar(255) DEFAULT NULL COMMENT '调用swap的返回错误信息',
  `return_swap_date` datetime DEFAULT NULL COMMENT '调用swap的返回时间',
  `return_cash_order_id` int(11) DEFAULT NULL,
  `return_cash_order_no` int(11) DEFAULT NULL,
  `return_cash_order_type` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `cc_message` varchar(255) DEFAULT NULL,
  `cust_name` varchar(64) DEFAULT NULL COMMENT '收货人',
  `cust_telephone` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `cust_email` varchar(64) DEFAULT NULL COMMENT '客户邮箱',
  `province_id` int(11) DEFAULT NULL COMMENT '省（跟网站商量直接存名称）',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `district_id` int(11) DEFAULT NULL COMMENT '县区',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮编',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `new_cust_name` varchar(64) DEFAULT NULL,
  `new_cust_telephone` varchar(32) DEFAULT NULL,
  `new_cust_mobile` varchar(32) DEFAULT NULL,
  `new_cust_email` varchar(64) DEFAULT NULL,
  `new_province_id` int(11) DEFAULT NULL,
  `new_city_id` int(11) DEFAULT NULL,
  `new_district_id` int(11) DEFAULT NULL,
  `new_postal_code` varchar(16) DEFAULT NULL,
  `new_cust_address` varchar(128) DEFAULT NULL,
  `pick_up` char(1) DEFAULT 'Y',
  `is_return_freight` char(1) DEFAULT 'N',
  `freight_type` smallint(6) NOT NULL,
  `freight` decimal(16,4) DEFAULT NULL,
  `return_invoice` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `total_return_qty` int(11) DEFAULT NULL,
  `total_return_amt` decimal(16,4) DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_comments` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `entry_name` varchar(32) DEFAULT NULL,
  `audit_name` varchar(32) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `from_loc_id` int(11) DEFAULT NULL,
  `from_loc_name` varchar(128) DEFAULT NULL,
  `to_loc_id` int(11) DEFAULT NULL,
  `to_loc_name` varchar(128) DEFAULT NULL,
  `area_id` varchar(32) DEFAULT NULL,
  `area_name` varchar(64) DEFAULT NULL,
  `swap_area_id` varchar(32) DEFAULT NULL,
  `swap_area_name` varchar(64) DEFAULT NULL,
  `fixed_time_arrive_type` int(11) DEFAULT NULL COMMENT '定时达类型',
  `sync_logistics_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '同步运费状态：0,不需要同步,1、需要同步（未同步）或同步失败 ,2、同步成功',
  `sync_logistics_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '赔付运费同步响应时间时间',
  `sync_logistics_cause` varchar(250) DEFAULT '' COMMENT '赔付运费同步响应原因',
  `shipment_type` smallint(6) DEFAULT '0' COMMENT '履约类型:0:默认 1:工作日送货 2:节假日 3:随时 4:定时达 5:极速达',
  `shipment_start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '送货开始时间',
  `shipment_end_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '送货结束时间',
  `whole_order_return_type` smallint(6) DEFAULT '0' COMMENT '0:部分退货 1:当前销退单整单退货 2.订单所有审核通过销退单，整单退货（未使用）)',
  PRIMARY KEY (`request_id`),
  KEY `order_return_requestI1` (`request_no`),
  KEY `order_return_requestI2` (`src_order_id`),
  KEY `order_return_requestI3` (`return_order_id`),
  KEY `order_return_requestI4` (`swap_order_id`),
  KEY `order_return_requestI5` (`entry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=628388 DEFAULT CHARSET=utf8 COMMENT='销退订单申请表';

-- ----------------------------
-- Table structure for order_return_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_return_request_detail`;
CREATE TABLE `order_return_request_detail` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(11) NOT NULL,
  `request_seq` int(11) NOT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT 'OMS订单明细ID',
  `sku_id` int(11) NOT NULL,
  `sales_price` decimal(16,4) DEFAULT NULL COMMENT '单价',
  `order_qty` int(11) NOT NULL,
  `return_qty` int(11) NOT NULL,
  `member_points_price` decimal(16,4) DEFAULT NULL COMMENT '客户积分金额',
  `pay_money` decimal(16,4) DEFAULT NULL COMMENT '应付金额',
  `delivery_price` decimal(16,4) DEFAULT NULL COMMENT '运费金额',
  `coupon_price` decimal(16,4) DEFAULT NULL COMMENT '礼券价格',
  `giftcard_price` decimal(16,4) DEFAULT NULL COMMENT '礼品卡金额',
  `account_money` decimal(16,4) DEFAULT NULL COMMENT '帐户余额',
  `cash_coupon` decimal(16,4) DEFAULT NULL COMMENT '代金券',
  `no_invoice_amount` decimal(16,4) DEFAULT NULL COMMENT '不开发票金额',
  `paid_amount` decimal(16,4) DEFAULT NULL COMMENT '实付金额',
  `promation_price` decimal(16,4) DEFAULT NULL COMMENT '促销单价',
  `member_points` decimal(10,0) DEFAULT NULL COMMENT '积分',
  `is_gift` smallint(6) DEFAULT NULL,
  `src_sku_id` varchar(50) DEFAULT NULL,
  `damage_qty` int(11) DEFAULT NULL,
  `damage_reason` varchar(255) DEFAULT NULL,
  `re_check_flag` char(1) NOT NULL DEFAULT 'N' COMMENT '是否回收重新质检',
  PRIMARY KEY (`request_item_id`),
  KEY `order_return_request_detailI2` (`request_id`) USING BTREE,
  KEY `order_return_request_detailI3` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=979814 DEFAULT CHARSET=utf8 COMMENT='销退订单分录表';

-- ----------------------------
-- Table structure for order_return_request_images
-- ----------------------------
DROP TABLE IF EXISTS `order_return_request_images`;
CREATE TABLE `order_return_request_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL COMMENT '申请ID',
  `image_seq` int(11) DEFAULT NULL COMMENT '图片顺序',
  `image_name` varchar(100) DEFAULT NULL COMMENT '图片名称',
  `origin_path` varchar(255) DEFAULT NULL COMMENT '原图地址',
  `tbn_path` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_status` smallint(6) DEFAULT NULL COMMENT '订单状态: 1:新建 2:等待出库   10:取消 11:锁定',
  `is_lock` smallint(6) DEFAULT NULL COMMENT '是否锁定 1:锁定 0:未锁',
  `is_finish` smallint(6) DEFAULT NULL COMMENT '1:完成 0:结束',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_pause` smallint(6) DEFAULT '0' COMMENT '1:暂停 0:未暂停',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `lock_date` timestamp NULL DEFAULT NULL COMMENT '锁定时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36761890 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for post_sale_reason
-- ----------------------------
DROP TABLE IF EXISTS `post_sale_reason`;
CREATE TABLE `post_sale_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `post_sale_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '售后单号',
  `code_id` int(11) NOT NULL DEFAULT '-1' COMMENT '原因id',
  `code_type` int(11) NOT NULL DEFAULT '-1' COMMENT '原因类型',
  `create_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT '' COMMENT '创建人名称',
  PRIMARY KEY (`id`),
  KEY `idx_psre_post_sale_id` (`post_sale_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=343310 DEFAULT CHARSET=utf8 COMMENT='售后原因表';

-- ----------------------------
-- Table structure for post_sale_request
-- ----------------------------
DROP TABLE IF EXISTS `post_sale_request`;
CREATE TABLE `post_sale_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `post_sale_id` varchar(32) NOT NULL DEFAULT '' COMMENT '售后单号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `src_system` varchar(255) DEFAULT '' COMMENT '来源系统',
  `post_sale_type` int(11) NOT NULL DEFAULT '-1' COMMENT '售后单类型',
  `post_sale_result` smallint(6) DEFAULT '-1' COMMENT '售后结果',
  `post_sale_status` smallint(6) DEFAULT '-1' COMMENT '售后状态',
  `refund_description` varchar(500) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '客户退款描述',
  `goods_ratio` decimal(5,4) DEFAULT NULL COMMENT '问题商品占比',
  `cust_id` bigint(20) DEFAULT '0' COMMENT '用户id',
  `cust_telephone` varchar(32) DEFAULT '' COMMENT '客户电话',
  `cust_name` varchar(64) DEFAULT '' COMMENT '客户名称',
  `refund_amount` decimal(16,4) DEFAULT NULL COMMENT '实际退款金额',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '售后申请日志',
  `audit_name` varchar(32) DEFAULT NULL COMMENT '审核人名字',
  `audit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核日期',
  `audit_opinion` varchar(255) DEFAULT '' COMMENT '审核意见',
  `return_request_id` int(11) DEFAULT '0' COMMENT '销退申请单号',
  `indemnity_request_id` int(11) DEFAULT '0' COMMENT '赔付申请单号',
  `refund_status` varchar(50) DEFAULT '' COMMENT '退款状态',
  `comments` varchar(255) DEFAULT '' COMMENT '备注',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `cancel_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请撤销时间',
  PRIMARY KEY (`id`),
  KEY `idx_psr_order_id` (`order_id`) USING BTREE,
  KEY `idx_psr_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=407744 DEFAULT CHARSET=utf8 COMMENT='售后申请主表';

-- ----------------------------
-- Table structure for post_sale_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `post_sale_request_detail`;
CREATE TABLE `post_sale_request_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `post_sale_id` varchar(32) NOT NULL DEFAULT '' COMMENT '售后单号',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL COMMENT '订单明细号',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_name` varchar(64) DEFAULT '' COMMENT '商品名称',
  `sku_type` int(11) DEFAULT '0' COMMENT '商品类型',
  `sku_num` int(11) DEFAULT '0' COMMENT '商品数量',
  `post_sale_num` int(11) NOT NULL DEFAULT '0' COMMENT '售后商品数量',
  `is_gift` smallint(6) DEFAULT '-1' COMMENT '是否赠品',
  `sku_price` decimal(16,4) DEFAULT '0.0000' COMMENT 'sku价格',
  `sale_price` decimal(16,4) DEFAULT '0.0000' COMMENT '销售价',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `paid_amount` decimal(16,4) DEFAULT NULL COMMENT '实付金额(现金)',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券价格',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `member_points` int(11) DEFAULT '0' COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '客户积分金额',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开发票金额',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销单价',
  `goods_ratio` decimal(5,4) DEFAULT '0.0000' COMMENT '问题商品占比',
  `src_order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单明细号',
  `src_sku_id` varchar(50) DEFAULT NULL COMMENT '来源skuId',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `picture_address` varchar(1500) DEFAULT NULL COMMENT '客诉上传图片地址',
  PRIMARY KEY (`id`),
  KEY `idx_psrd_post_sale_id` (`post_sale_id`) USING BTREE,
  KEY `idx_psrd_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_psrd_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=478414 DEFAULT CHARSET=utf8 COMMENT='售后申请商品明细表';

-- ----------------------------
-- Table structure for post_sale_request_operate
-- ----------------------------
DROP TABLE IF EXISTS `post_sale_request_operate`;
CREATE TABLE `post_sale_request_operate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `post_sale_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '售后单号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `op_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `status` int(11) DEFAULT NULL COMMENT 'status',
  `operator` varchar(64) DEFAULT '' COMMENT '操作人',
  `op_system` varchar(32) DEFAULT '' COMMENT '系统',
  `op_content` varchar(128) DEFAULT '' COMMENT '操作详情',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `op_desc` varchar(128) DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`),
  KEY `idx_psro_order_id` (`order_id`) USING BTREE,
  KEY `idx_psro_post_sale_id` (`post_sale_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=417408 DEFAULT CHARSET=utf8 COMMENT='售后申请操作流水表';

-- ----------------------------
-- Table structure for qrtz_test_table
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_test_table`;
CREATE TABLE `qrtz_test_table` (
  `test_num` int(11) DEFAULT NULL,
  `test_orign_num` int(11) DEFAULT NULL,
  `test_ip` varchar(255) DEFAULT NULL,
  `fdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for region_back0925
-- ----------------------------
DROP TABLE IF EXISTS `region_back0925`;
CREATE TABLE `region_back0925` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for replenish_reason
-- ----------------------------
DROP TABLE IF EXISTS `replenish_reason`;
CREATE TABLE `replenish_reason` (
  `rr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `request_id` int(11) NOT NULL,
  `code_id` smallint(6) NOT NULL COMMENT '原因ID',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(100) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`rr_id`),
  KEY `replenish_reasonI2` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77314 DEFAULT CHARSET=utf8 COMMENT='补发原因对应表';

-- ----------------------------
-- Table structure for return_reason
-- ----------------------------
DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE `return_reason` (
  `rr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `request_id` bigint(11) NOT NULL,
  `code_id` bigint(11) NOT NULL COMMENT '原因ID',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  UNIQUE KEY `return_reasonI1` (`rr_id`) USING BTREE,
  KEY `return_reasonI2` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523420 DEFAULT CHARSET=utf8 COMMENT='销退原因对应表';

-- ----------------------------
-- Table structure for send_message
-- ----------------------------
DROP TABLE IF EXISTS `send_message`;
CREATE TABLE `send_message` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `phone_num` varchar(11) DEFAULT NULL COMMENT '手机号',
  `content` varchar(1024) DEFAULT NULL COMMENT '短信内容',
  `entry_time` datetime DEFAULT NULL COMMENT '发送时间',
  `entry_id` int(11) DEFAULT NULL COMMENT '发送人id',
  `entry_name` varchar(30) DEFAULT NULL COMMENT '发送人姓名',
  `status` smallint(6) DEFAULT NULL COMMENT '短信状态:1、发送成功，2、发送失败',
  `response_cause` varchar(250) DEFAULT NULL COMMENT '响应描述',
  `re_send_id` int(11) DEFAULT NULL COMMENT '重发人id',
  `re_send_name` varchar(30) DEFAULT NULL COMMENT '重发人',
  `re_send_time` datetime DEFAULT NULL COMMENT '重发时间',
  PRIMARY KEY (`request_item_id`),
  KEY `request_id1` (`phone_num`) USING BTREE,
  KEY `request_id2` (`entry_name`) USING BTREE,
  KEY `request_id3` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1213968 DEFAULT CHARSET=utf8 COMMENT='发送短息';

-- ----------------------------
-- Table structure for tree
-- ----------------------------
DROP TABLE IF EXISTS `tree`;
CREATE TABLE `tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(30) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for un_bunding_coupon
-- ----------------------------
DROP TABLE IF EXISTS `un_bunding_coupon`;
CREATE TABLE `un_bunding_coupon` (
  `request_item_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `coupon_no` varchar(32) DEFAULT NULL COMMENT '券号',
  `entry_id` int(11) DEFAULT NULL COMMENT '解绑人id',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '解绑人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '解绑时间',
  `comments` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`request_item_id`),
  KEY `request_id2` (`coupon_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=913408 DEFAULT CHARSET=utf8 COMMENT='解绑操作记录';

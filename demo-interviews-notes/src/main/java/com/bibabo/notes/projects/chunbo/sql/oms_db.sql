/*
Navicat MySQL Data Transfer

Source Server         : oms-fukuixiang
Source Server Version : 50628
Source Host           : birdb.prod.chunbo.com:3308
Source Database       : oms_db

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dps_pre_ware_sku_sale
-- ----------------------------
DROP TABLE IF EXISTS `dps_pre_ware_sku_sale`;
CREATE TABLE `dps_pre_ware_sku_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `date_flag` date DEFAULT NULL COMMENT '统计日期',
  `sku_id` bigint(20) NOT NULL,
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `sku_num` decimal(10,2) DEFAULT NULL COMMENT '销售数量',
  `sku_price` decimal(10,2) DEFAULT NULL COMMENT '销售总金额',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_name` varchar(64) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_date_flag` (`date_flag`),
  KEY `idx_sku_id_ware_id` (`sku_id`,`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211730 DEFAULT CHARSET=utf8 COMMENT='开仓前临时使用';

-- ----------------------------
-- Table structure for jsd_candinate_address
-- ----------------------------
DROP TABLE IF EXISTS `jsd_candinate_address`;
CREATE TABLE `jsd_candinate_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cust_id` int(255) DEFAULT NULL COMMENT '客户ID',
  `cust_address` varchar(150) DEFAULT NULL COMMENT '收货地址',
  `province` varchar(32) DEFAULT NULL COMMENT '省',
  `city` varchar(32) DEFAULT NULL COMMENT '市',
  `county` varchar(32) DEFAULT NULL COMMENT '区',
  `jingdu` varchar(100) DEFAULT NULL COMMENT '经度',
  `weidu` varchar(100) DEFAULT NULL COMMENT '维度',
  `la_type` smallint(255) DEFAULT NULL COMMENT '经纬度类型',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` smallint(255) NOT NULL DEFAULT '0' COMMENT '用来计算坐标，0新增， 1 计算成功， -1计算失败',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '当日达ware_id',
  `drd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '控制计算是否是胡家园的状态，0新增， 1 已计算， -2失败不再重试',
  `jsd_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '极速达wareId',
  `jsd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '极速达wareId计算控制：0新增， 1 已计算， -2失败不再重试',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_address` (`cust_address`),
  KEY `idx_cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3049862 DEFAULT CHARSET=utf8 COMMENT='极速达坐标，仓库划分表';

-- ----------------------------
-- Table structure for oms_address_points
-- ----------------------------
DROP TABLE IF EXISTS `oms_address_points`;
CREATE TABLE `oms_address_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id自增主键',
  `order_date` date NOT NULL DEFAULT '2020-11-29' COMMENT '下单日期',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `county` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area_name` varchar(32) NOT NULL DEFAULT '' COMMENT '四级地址',
  `cust_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `origin_map_type` smallint(4) NOT NULL DEFAULT '0' COMMENT '来源地图类型',
  `origin_lon` varchar(255) NOT NULL DEFAULT '' COMMENT '来源经度',
  `origin_lat` varchar(255) NOT NULL DEFAULT '' COMMENT '来源纬度',
  `bd_lon` varchar(255) NOT NULL DEFAULT '' COMMENT '另外一种坐标系经度',
  `bd_lat` varchar(255) NOT NULL DEFAULT '' COMMENT '另外一种坐标系纬度',
  `order_cnt3` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量3公里',
  `order_amount3` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额3公里',
  `order_cnt35` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量3.5公里',
  `order_amount35` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额3.5公里',
  `order_cnt4` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量4公里',
  `order_amount4` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额4公里',
  `order_cnt5` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量5公里',
  `order_amount5` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额5公里',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 更新时间',
  `yd_order_cnt3` int(255) NOT NULL DEFAULT '0' COMMENT '悦店3公里所在月份订单数量',
  `yd_order_amount3` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额3公里',
  `yd_order_cnt35` int(255) NOT NULL DEFAULT '0' COMMENT '悦店3.5公里所在月份订单数量',
  `yd_order_amount35` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额3.5公里',
  `yd_order_cnt4` int(255) NOT NULL DEFAULT '0' COMMENT '悦店4公里所在月份订单数量',
  `yd_order_amount4` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额34公里',
  `yd_order_cnt5` int(255) NOT NULL DEFAULT '0' COMMENT '悦店5公里所在月份订单数量',
  `yd_order_amount5` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额5公里',
  `cust_cnt3` int(255) NOT NULL DEFAULT '0' COMMENT '主站3公里所在月份顾客数量',
  `cust_cnt35` int(255) NOT NULL DEFAULT '0' COMMENT '主站3.5公里所在月份顾客数量',
  `cust_cnt4` int(255) NOT NULL DEFAULT '0' COMMENT '主站4公里所在月份顾客数量',
  `cust_cnt5` int(255) NOT NULL DEFAULT '0' COMMENT '主站5公里所在月份顾客数量',
  `status` smallint(8) NOT NULL DEFAULT '0' COMMENT '计算状态：0未计算,1成功',
  `order_cnt78` int(8) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量7.8公里',
  `order_amount78` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额7.8公里',
  `cust_cnt78` int(8) NOT NULL DEFAULT '0' COMMENT '所在月份顾客数量7.8公里',
  `yd_order_cnt78` int(255) NOT NULL DEFAULT '0' COMMENT '悦店7.8公里所在月份订单数量',
  `yd_order_amount78` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额7.8公里',
  `order_cnt6` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量6公里',
  `order_amount6` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额6公里',
  `cust_cnt6` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份客户数量6公里',
  `yd_order_cnt6` int(255) NOT NULL DEFAULT '0' COMMENT '悦店6公里所在月份订单数量',
  `yd_order_amount6` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额6公里',
  `order_cnt7` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份订单数量7公里',
  `order_amount7` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份订单金额7公里',
  `cust_cnt7` int(255) NOT NULL DEFAULT '0' COMMENT '所在月份客户数量7公里',
  `yd_order_cnt7` int(255) NOT NULL DEFAULT '0' COMMENT '悦店7公里所在月份订单数量',
  `yd_order_amount7` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '所在月份悦店订单金额7公里',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24228 DEFAULT CHARSET=utf8 COMMENT=' 各地址经纬度每月订单数量统计汇总表';

-- ----------------------------
-- Table structure for oms_invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_invoice_detail`;
CREATE TABLE `oms_invoice_detail` (
  `invoice_id` bigint(20) NOT NULL COMMENT '发票id',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票title',
  `invoice_content` varchar(32) DEFAULT NULL COMMENT '发票内容',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `parent_order_id` bigint(20) DEFAULT NULL,
  `root_order_id` bigint(20) DEFAULT NULL,
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型',
  `invoice_marker` varchar(64) DEFAULT NULL COMMENT '开票单位',
  `invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `promotion_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠金额',
  `tax_rate` decimal(16,4) DEFAULT NULL COMMENT '税率',
  `gift_card` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡',
  `coupon_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券金额',
  `invoice_amount_captial` varchar(64) DEFAULT NULL COMMENT '金额大写',
  `invoice_detail` text COMMENT '发票详细信息',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `account_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_autoorder
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_autoorder`;
CREATE TABLE `oms_order_autoorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `cust_mobile` varchar(20) DEFAULT NULL COMMENT '用户手机',
  `province` varchar(20) DEFAULT NULL COMMENT '所在省',
  `province_id` int(10) DEFAULT NULL COMMENT '省邮编',
  `city` varchar(20) DEFAULT NULL COMMENT '所在市',
  `city_id` int(10) DEFAULT NULL COMMENT '市邮编',
  `county` varchar(150) DEFAULT NULL COMMENT '所在县',
  `county_id` int(10) DEFAULT NULL COMMENT '县邮编',
  `cust_address` varchar(255) DEFAULT NULL COMMENT '具体地址',
  `sku_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `sku_id` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `sku_num` varchar(20) DEFAULT NULL COMMENT '商品数量',
  `sku_price` varchar(20) DEFAULT NULL COMMENT '商品价格',
  `landline` varchar(20) DEFAULT NULL COMMENT '座机',
  `order_time` date DEFAULT NULL COMMENT '订单日期',
  `data_state` tinyint(2) DEFAULT NULL COMMENT '数据状态（0数据正常，1数据推送失败，2数据推送成功,3数据已删除，其他标示数据的错误状态）',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `out_time` datetime DEFAULT NULL COMMENT '数据推送时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '推送后的订单ID',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `area_id` varchar(12) DEFAULT NULL COMMENT '四级地址编号',
  `area_name` varchar(20) DEFAULT NULL COMMENT '四级地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_autoorderuser
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_autoorderuser`;
CREATE TABLE `oms_order_autoorderuser` (
  `use_account` varchar(20) NOT NULL COMMENT '用户名',
  `use_psw` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `use_type` int(2) DEFAULT '2' COMMENT '用户类型-1为超级管理员，1为部门管理员，2为操作员',
  `departiment_id` int(20) DEFAULT NULL COMMENT '部门id',
  `use_level` int(2) DEFAULT NULL COMMENT '用户级别',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `use_state` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '用户状态，0为启用，1为停用',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`use_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_auto_departiment
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_auto_departiment`;
CREATE TABLE `oms_order_auto_departiment` (
  `departiment_id` bigint(10) NOT NULL,
  `parent_departiment_id` bigint(10) DEFAULT NULL,
  `departiment_name` varchar(20) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`departiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门字典表';

-- ----------------------------
-- Table structure for oms_order_channel
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_channel`;
CREATE TABLE `oms_order_channel` (
  `order_channel` smallint(4) NOT NULL COMMENT '订单渠道编码',
  `order_channel_value` varchar(16) NOT NULL COMMENT '订单渠道编码说明',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(16) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`order_channel`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单渠道表';

-- ----------------------------
-- Table structure for oms_order_cheat_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_cheat_log`;
CREATE TABLE `oms_order_cheat_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `coupon_id` varchar(255) NOT NULL COMMENT '商品券',
  `process` bigint(20) NOT NULL COMMENT '处理步骤(0初始化,1成功,2保留,3商品劵成功,4订单取消成功)',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='作弊订单记录表';

-- ----------------------------
-- Table structure for oms_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_coupon`;
CREATE TABLE `oms_order_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `coupon_id` varchar(1024) DEFAULT NULL,
  `coupon_type` smallint(6) DEFAULT NULL COMMENT '1:全品类优惠;2:限品类优惠;3:满减;4:礼品卡;',
  `coupon_price` decimal(16,4) DEFAULT NULL COMMENT '优惠金额',
  `coupon_content` varchar(64) DEFAULT NULL COMMENT '优惠内容',
  `coupon_owner` varchar(32) DEFAULT NULL COMMENT '优惠券所属:店铺',
  `create_date` timestamp NULL DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品券sku',
  `line_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品明细行号(对应订单详情表的行号)',
  `other_params` varchar(64) DEFAULT '' COMMENT '优惠券扩展字段',
  PRIMARY KEY (`id`),
  KEY `oid_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21842608 DEFAULT CHARSET=utf8 COMMENT='订单优惠信息（暂时无）';

-- ----------------------------
-- Table structure for oms_order_coupon_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_coupon_detail`;
CREATE TABLE `oms_order_coupon_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `coupon_id` varchar(64) NOT NULL DEFAULT '' COMMENT '一个卡号',
  `coupon_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1001:优惠券;1002:代金券;1003:礼品卡;1004:商品券;1005:商品卡;1006:运费券',
  `coupon_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额--已经合并的话就不设置',
  `coupon_content` varchar(64) NOT NULL DEFAULT '' COMMENT '优惠内容',
  `coupon_owner` varchar(32) NOT NULL DEFAULT '' COMMENT '优惠券所属:店铺',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品券sku',
  `line_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品明细行号(对应明细表的行号)',
  `other_params` varchar(64) NOT NULL DEFAULT '' COMMENT '优惠券扩展字段',
  PRIMARY KEY (`id`),
  KEY `oid_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11158468 DEFAULT CHARSET=utf8 COMMENT='订单卡券信息详情';

-- ----------------------------
-- Table structure for oms_order_coupon_sku_map
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_coupon_sku_map`;
CREATE TABLE `oms_order_coupon_sku_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '交易单号',
  `coupon_id` varchar(128) NOT NULL DEFAULT '' COMMENT '品类券ID',
  `coupon_content` varchar(64) NOT NULL DEFAULT '' COMMENT '优惠内容',
  `coupon_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '品类券总金额，针对多个商品无需相加',
  `coupon_owner` varchar(32) NOT NULL DEFAULT '' COMMENT '券所属',
  `coupon_type` smallint(4) NOT NULL DEFAULT '1010' COMMENT '券类型',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuId',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `other_params` varchar(64) NOT NULL DEFAULT '' COMMENT '优惠券扩展字段',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237404 DEFAULT CHARSET=utf8 COMMENT='订单品类券和商品映射表';

-- ----------------------------
-- Table structure for oms_order_create_failed_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_create_failed_log`;
CREATE TABLE `oms_order_create_failed_log` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(21) NOT NULL DEFAULT '0' COMMENT '订单号',
  `cust_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户id',
  `ware_id` smallint(4) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单时间',
  `total_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_num` smallint(4) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `short_message` varchar(255) NOT NULL DEFAULT '' COMMENT '缺货信息',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `cust_id` (`cust_id`),
  KEY `sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5900 DEFAULT CHARSET=utf8 COMMENT='订单生单失败记录表';

-- ----------------------------
-- Table structure for oms_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_delivery`;
CREATE TABLE `oms_order_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `delivery_date` timestamp NULL DEFAULT NULL COMMENT '配送信息时间',
  `delivery_id` int(11) DEFAULT NULL COMMENT '配送公司id',
  `status` int(11) DEFAULT NULL COMMENT '配送状态',
  `status_name` varchar(128) DEFAULT NULL COMMENT '配送状态名称',
  `signer` varchar(64) DEFAULT NULL COMMENT '签收人',
  `delivery_content` varchar(256) DEFAULT NULL COMMENT '配送详情',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_deli_rel` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102723610 DEFAULT CHARSET=utf8 COMMENT='订单物流信息表';

-- ----------------------------
-- Table structure for oms_order_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_delivery_detail`;
CREATE TABLE `oms_order_delivery_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(1) DEFAULT NULL,
  `waybill_no` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22819550 DEFAULT CHARSET=utf8 COMMENT='配送明细表';

-- ----------------------------
-- Table structure for oms_order_delivery_main
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_delivery_main`;
CREATE TABLE `oms_order_delivery_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父单号',
  `delivery_station_id` varchar(32) DEFAULT NULL COMMENT '配送站点编号',
  `delivery_station` varchar(64) DEFAULT NULL COMMENT '配送站点名',
  `waybill_no` varchar(100) DEFAULT NULL COMMENT '运单号',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '配送公司',
  `delivery_id` int(11) DEFAULT NULL COMMENT '承运商id',
  `modify_date` timestamp NULL DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '县',
  `other_params` varchar(512) DEFAULT NULL COMMENT '扩展字段',
  `package_type` tinyint(1) DEFAULT '1' COMMENT '包装类型， 1-普通包装，2-环保包装',
  `service_id` varchar(10) NOT NULL DEFAULT '' COMMENT '快递服务编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `idx_modify_date` (`modify_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37989534 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_detail`;
CREATE TABLE `oms_order_detail` (
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `line_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品明细行号',
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
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sku_width` decimal(12,4) DEFAULT NULL COMMENT '宽',
  `sku_height` decimal(12,4) DEFAULT NULL COMMENT '高',
  `sku_length` decimal(12,4) DEFAULT NULL COMMENT '长',
  `sku_weight` decimal(12,4) DEFAULT NULL COMMENT '重量',
  `is_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '0:不称重 1:称重',
  `unit` varchar(32) NOT NULL DEFAULT '' COMMENT '单位',
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
  `properties` varchar(256) DEFAULT NULL COMMENT '券所属的公司id',
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
  `book_date` datetime DEFAULT NULL,
  `is_short_wait` smallint(6) DEFAULT '0' COMMENT '是否缺货等待 1 等待 0 不等待(抛异常)',
  `active_type` smallint(6) DEFAULT NULL COMMENT '活动类型',
  `is_cashBack` smallint(6) DEFAULT '0' COMMENT '是否返利商品 0 否 1是',
  `other_params` varchar(500) DEFAULT NULL COMMENT ' ',
  `gift_type` smallint(6) DEFAULT '0' COMMENT '1 促销赠品 2 市场赠品',
  `is_direct_delivery` smallint(6) DEFAULT '0' COMMENT '是否原产地直发 0 否 1 是',
  `shipment_start_time` datetime DEFAULT NULL COMMENT '送货开始时间',
  `shipment_end_time` datetime DEFAULT NULL COMMENT '送货结束时间',
  `shipment_type` smallint(6) DEFAULT NULL COMMENT '履约类型:1:工作日送货 2:节假日 3:随时 4:定时达',
  `sale_tax_code_id` int(11) DEFAULT NULL,
  `sale_tax_code_value` decimal(16,4) DEFAULT '0.0000' COMMENT '税码值',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分',
  `src_order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源订单明细号',
  `face_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '面额(主要针对卡类商品)',
  PRIMARY KEY (`order_detail_id`),
  KEY `oms_order_detail_idx` (`order_id`),
  KEY `idx_book_date` (`book_date`),
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Table structure for oms_order_detail_exp
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_detail_exp`;
CREATE TABLE `oms_order_detail_exp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细表detail_id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `delivery_sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '出库商品数量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_detail_id` (`order_detail_id`) USING BTREE,
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7755334 DEFAULT CHARSET=utf8 COMMENT='订单明细拓展表';

-- ----------------------------
-- Table structure for oms_order_duplicate
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_duplicate`;
CREATE TABLE `oms_order_duplicate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_idx_order_dupl` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单防重表';

-- ----------------------------
-- Table structure for oms_order_exception
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_exception`;
CREATE TABLE `oms_order_exception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `op_system` varchar(32) DEFAULT NULL COMMENT '操作系统',
  `exception_desc` varchar(128) DEFAULT NULL COMMENT '异常描述',
  `exception_cause` varchar(256) DEFAULT NULL COMMENT '异常原因',
  `is_operated` int(11) DEFAULT '0' COMMENT '1:已处理 0:未处理',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '异常日期',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  `op_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `order_status` int(11) DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1345444 DEFAULT CHARSET=utf8 COMMENT='订单异常信息表';

-- ----------------------------
-- Table structure for oms_order_exp
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_exp`;
CREATE TABLE `oms_order_exp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `prof_cat` varchar(10) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(16) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `prof_i` bigint(20) NOT NULL DEFAULT '-1' COMMENT '整型属性值',
  `prof_c` varchar(100) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=298898 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_fail_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_fail_log`;
CREATE TABLE `oms_order_fail_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `service_method` varchar(50) DEFAULT NULL COMMENT '调用方法',
  `status` smallint(10) DEFAULT '0' COMMENT '状态：1.成功 0.失败',
  `reason` text COMMENT '失败原因',
  `content` text COMMENT '失败数据',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_flow
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_flow`;
CREATE TABLE `oms_order_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `current_process` int(11) DEFAULT '10',
  `process_flag` smallint(6) DEFAULT '0' COMMENT '0:初始 1:处理中 2:暂停 9:完成',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_finish` int(11) DEFAULT '0' COMMENT '0:未完成 1:已完成',
  `lock_flag` int(11) DEFAULT '0' COMMENT '1:加锁 0:未加锁',
  `retry_num` int(11) DEFAULT '0' COMMENT '重试次数',
  `catch_date` timestamp NULL DEFAULT NULL COMMENT '抓取时间',
  `is_job_processing` tinyint(1) DEFAULT '0' COMMENT '后台job处理状态：0-未处理，1-正在处理',
  PRIMARY KEY (`id`),
  KEY `is_finish_idx` (`is_finish`),
  KEY `order_id_idx` (`order_id`) USING HASH,
  KEY `create_date_Idx` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=127242904 DEFAULT CHARSET=utf8 COMMENT='订单处理流程表';

-- ----------------------------
-- Table structure for oms_order_flow_config
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_flow_config`;
CREATE TABLE `oms_order_flow_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` int(11) DEFAULT NULL COMMENT '处理节编号',
  `process_name` varchar(32) DEFAULT NULL COMMENT '处理节点名',
  `thread_num` int(11) DEFAULT NULL COMMENT '处理线程数',
  `process_num` int(11) DEFAULT NULL COMMENT '处理数量',
  `thread_gap` int(11) DEFAULT NULL COMMENT '线程间隔时间',
  `thread_sleep` int(11) DEFAULT NULL COMMENT '线程池休眠时间',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_flow_exception
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_flow_exception`;
CREATE TABLE `oms_order_flow_exception` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` bigint(21) NOT NULL COMMENT '订单id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `current_process` tinyint(4) NOT NULL COMMENT '订单当前履约步骤',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '记录是否有效 0 失效 1 有效',
  `exception_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '错误描述',
  PRIMARY KEY (`id`),
  KEY `sku_id` (`sku_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36882786 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_giving
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_giving`;
CREATE TABLE `oms_order_giving` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cust_id` varchar(20) DEFAULT NULL COMMENT '用户登录id',
  `activities_name` varchar(20) DEFAULT NULL COMMENT '市场推广业务方向',
  `activities_type` int(2) DEFAULT NULL COMMENT '市场推广业务方向',
  `sku_id` varchar(20) DEFAULT NULL COMMENT 'sku id',
  `sku_name` varchar(100) DEFAULT '' COMMENT '赠送礼品名称',
  `giving_state` tinyint(1) DEFAULT '0' COMMENT '是否已赠',
  `giving_number` int(11) DEFAULT '0' COMMENT '已赠次数',
  `giving_cycel` int(11) DEFAULT '1' COMMENT '准备赠送次数',
  `activities_content` varchar(50) DEFAULT NULL COMMENT '活动内容',
  `remark` varchar(200) DEFAULT '' COMMENT '赠送描述',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(60) DEFAULT NULL,
  `update_by` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='礼品赠送用户表';

-- ----------------------------
-- Table structure for oms_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_invoice`;
CREATE TABLE `oms_order_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `invoice_type` smallint(6) DEFAULT NULL COMMENT '发票类型',
  `is_invoiced` smallint(6) DEFAULT NULL COMMENT '是否已开发票',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `invoice_tax_payer_code` varchar(32) NOT NULL DEFAULT '' COMMENT '单位税号',
  `invoice_email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `invoice_content` varchar(32) DEFAULT NULL COMMENT '发票内容',
  `invoice_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发票状态：0 未打印，1 已打印',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127275764 DEFAULT CHARSET=utf8 COMMENT='订单发票表';

-- ----------------------------
-- Table structure for oms_order_invoice_print
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_invoice_print`;
CREATE TABLE `oms_order_invoice_print` (
  `print_id` bigint(20) NOT NULL,
  `invoice_id` bigint(20) DEFAULT NULL COMMENT '发票id',
  `invoice_no` varchar(64) DEFAULT NULL COMMENT '发票号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `status` int(11) DEFAULT NULL COMMENT '0-未开 1-已开 2-作废 3-退票',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(64) DEFAULT NULL COMMENT '开票人',
  `invoice_date` timestamp NULL DEFAULT NULL COMMENT '开票时间',
  `return_operator` varchar(64) DEFAULT NULL COMMENT '退票人',
  `return_date` timestamp NULL DEFAULT NULL COMMENT '退票时间',
  `discard_cause` varchar(256) DEFAULT NULL COMMENT '作废原因',
  PRIMARY KEY (`print_id`),
  UNIQUE KEY `unidx_invoice_discard` (`invoice_id`,`invoice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_main
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_main`;
CREATE TABLE `oms_order_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `order_type` smallint(6) DEFAULT NULL COMMENT '1:正向订单 2:退货单 3:换货取货单 4:换货配送单 5:漏发补发单 6:不退补发单 7:有货先发订单 100:取消订单	',
  `order_source` int(11) DEFAULT NULL COMMENT '订单平台来源 1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP',
  `order_direct_source` int(11) DEFAULT NULL COMMENT '订单平台来源 1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP',
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
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
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
  `shipment_type` smallint(6) DEFAULT '0' COMMENT '履约类型:0:默认 1:工作日送货 2:节假日 3:随时 4:定时达 5:极速达',
  `order_flag` varchar(64) DEFAULT NULL COMMENT '订单标示（待用字段）',
  `shipment_start_time` datetime DEFAULT NULL COMMENT '送货开始时间',
  `shipment_end_time` datetime DEFAULT NULL COMMENT '送货结束时间',
  `weight` decimal(12,4) DEFAULT NULL COMMENT '总重量',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `delivery_type` smallint(6) DEFAULT '0' COMMENT '待用字段',
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
  `third_order_id` varchar(32) DEFAULT NULL COMMENT '第三方订单id',
  `freight_type` int(11) DEFAULT '0' COMMENT '运费类型 0 无运费 1 普通 2 满减 3 运费券',
  `third_cust_id` varchar(64) DEFAULT '' COMMENT '第三方系统客户编号',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分',
  `payment_serial_number` varchar(32) DEFAULT '' COMMENT '支付流水号',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `custid_index` (`cust_id`),
  KEY `idx_root_pid` (`root_parent_id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_direct_parent_id` (`direct_parent_id`) USING BTREE,
  KEY `idx_third_order_id` (`third_order_id`) USING BTREE,
  KEY `idx_cust_mobile` (`cust_mobile`),
  KEY `idx_payment_serial_number` (`payment_serial_number`) USING BTREE,
  KEY `idx_payment_date` (`payment_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127308928 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Table structure for oms_order_money_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_money_account`;
CREATE TABLE `oms_order_money_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `direct_parent_id` bigint(20) DEFAULT NULL,
  `root_parent_id` bigint(20) DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细号',
  `op_type` int(11) DEFAULT NULL COMMENT '1 正向流水 2 取消 3 退货',
  `line_id` bigint(20) DEFAULT NULL COMMENT '费用行id，记录商品明细的一组费用',
  `account_source` int(11) DEFAULT NULL COMMENT '费用来源 1  订单 2 订单明细',
  `account_type` varchar(64) DEFAULT NULL COMMENT '费用分类',
  `account_code` varchar(32) DEFAULT NULL COMMENT '费用编码,现金,余额,礼品卡,积分,优惠券',
  `money` decimal(16,4) DEFAULT NULL COMMENT '金额',
  `sku_id` varchar(32) DEFAULT NULL,
  `sku_num` int(11) DEFAULT NULL COMMENT '数量',
  `coupon_id` varchar(128) DEFAULT NULL COMMENT '卡号,券号',
  `extend_info` varchar(255) DEFAULT NULL COMMENT '扩展字段,备用',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1500832 DEFAULT CHARSET=utf8 COMMENT='订单金额台账表';

-- ----------------------------
-- Table structure for oms_order_off_line
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_off_line`;
CREATE TABLE `oms_order_off_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `overage` decimal(16,4) NOT NULL COMMENT '收银损益',
  `store_id` varchar(32) NOT NULL COMMENT '门店号',
  `invoice_id` varchar(32) NOT NULL COMMENT '小票号',
  `pos_id` varchar(32) NOT NULL COMMENT 'POS机号',
  `region_id` int(10) NOT NULL COMMENT '区号',
  `create_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7075076 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_off_line_push
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_off_line_push`;
CREATE TABLE `oms_order_off_line_push` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `ware_id` int(11) NOT NULL DEFAULT '-1' COMMENT '库房号',
  `process_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1166470 DEFAULT CHARSET=utf8 COMMENT='线下店订单库存占用表';

-- ----------------------------
-- Table structure for oms_order_operate
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate`;
CREATE TABLE `oms_order_operate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  `op_system` varchar(32) DEFAULT NULL COMMENT '系统',
  `op_content` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '1:网站 2:oms 3:wms 4:tms 5:crm 6:ordercancel',
  `op_desc` varchar(128) DEFAULT NULL,
  `hide_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT '隐藏标识：0-客户可见， 1-隐藏使得客户不可见',
  PRIMARY KEY (`id`),
  KEY `idx_order_op_rel` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=497512282 DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';

-- ----------------------------
-- Table structure for oms_order_paid_process
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_paid_process`;
CREATE TABLE `oms_order_paid_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态',
  `rebate_sku_num` int(11) DEFAULT '0' COMMENT '预计返利商品数量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `catch_date` timestamp NULL DEFAULT NULL COMMENT '抓取时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_order_process` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29279962 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_pay_method
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_pay_method`;
CREATE TABLE `oms_order_pay_method` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `pay_name` varchar(32) NOT NULL DEFAULT '' COMMENT '支付名称',
  `pay_card_no` varchar(255) NOT NULL COMMENT '支付卡号',
  `pay_amount` decimal(16,4) NOT NULL COMMENT '支付金额',
  `pay_overage` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '支付损益',
  `pay_trace` varchar(64) NOT NULL COMMENT '支付流水号',
  `pay_id` varchar(32) NOT NULL COMMENT '支付ID',
  `pay_memo` varchar(256) NOT NULL DEFAULT '' COMMENT '支付备注',
  `pay_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '支付时间',
  `create_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7222550 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_process_web
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_process_web`;
CREATE TABLE `oms_order_process_web` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `catch_date` timestamp NULL DEFAULT NULL COMMENT '抓取时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_order_process` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5783766 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_order_profiles
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_profiles`;
CREATE TABLE `oms_order_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `prof_cat` varchar(10) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(32) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_i` bigint(20) NOT NULL DEFAULT '-1' COMMENT '整型属性值',
  `prof_c` varchar(256) DEFAULT NULL,
  `prof_d` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_profile_c` (`prof_c`(255),`prof_type`),
  KEY `idx_profiles_i` (`prof_i`,`prof_type`),
  KEY `idx_prof_type_cat` (`prof_type`,`prof_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=210064778 DEFAULT CHARSET=utf8 COMMENT='订单属性表\r\n\r\n';

-- ----------------------------
-- Table structure for oms_order_push
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_push`;
CREATE TABLE `oms_order_push` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '重试的任务类型：1--POS机支付信息推送',
  `process_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '更新日期',
  `catch_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '抓取时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务推送表';

-- ----------------------------
-- Table structure for oms_order_rebate
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_rebate`;
CREATE TABLE `oms_order_rebate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `process_status` smallint(6) DEFAULT '0',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `catch_date` timestamp NULL DEFAULT NULL,
  `is_lock` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30122674 DEFAULT CHARSET=utf8 COMMENT='订单返利';

-- ----------------------------
-- Table structure for oms_order_request_execution
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_request_execution`;
CREATE TABLE `oms_order_request_execution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(45) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `is_executed` int(11) DEFAULT NULL COMMENT '是否执行,0未执行 1已执行',
  `execute_result` int(11) DEFAULT NULL COMMENT '0 失败 1 成功',
  `message` varchar(512) DEFAULT NULL COMMENT '执行返回信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号，通过版本号控制重复提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8 COMMENT='订单请求服务防重表';

-- ----------------------------
-- Table structure for oms_order_retry_front
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_retry_front`;
CREATE TABLE `oms_order_retry_front` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '重试类型RebateEnum:1老拉新,2分享基金,3妥投返积分,4保温箱返积分',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `catch_date` timestamp NULL DEFAULT NULL COMMENT '抓取时间',
  `msg_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '消息发送时机',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=154615102 DEFAULT CHARSET=utf8 COMMENT='单品页分享重试表';

-- ----------------------------
-- Table structure for oms_order_ship_time_period
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_ship_time_period`;
CREATE TABLE `oms_order_ship_time_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `seq` int(11) DEFAULT '1' COMMENT '序号：排序方式',
  `start_time` int(11) DEFAULT '0' COMMENT '开始时间段',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间段',
  `shipment_type` smallint(6) DEFAULT '5' COMMENT '配送类型：5极速达，7当日达',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单配送时区字典表';

-- ----------------------------
-- Table structure for oms_order_source
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_source`;
CREATE TABLE `oms_order_source` (
  `order_source` smallint(6) NOT NULL COMMENT '订单来源编号',
  `order_source_value` varchar(16) NOT NULL COMMENT '订单来源编号描述',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(16) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`order_source`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单来源表';

-- ----------------------------
-- Table structure for oms_order_status
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_status`;
CREATE TABLE `oms_order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_status` smallint(6) DEFAULT NULL COMMENT '订单状态: 1:新建 2:等待出库   10:取消 11:锁定',
  `is_lock` smallint(6) DEFAULT NULL COMMENT '是否锁定 1:锁定 0:未锁',
  `is_finish` smallint(6) DEFAULT NULL COMMENT '1:完成 0:结束',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_pause` smallint(6) DEFAULT '0' COMMENT '1:暂停 0:未暂停',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `lock_date` timestamp NULL DEFAULT NULL COMMENT '锁定时间',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单是否删除, 0未删除,1 删除',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '出库时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '归班时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127275894 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

-- ----------------------------
-- Table structure for oms_order_status_desc
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_status_desc`;
CREATE TABLE `oms_order_status_desc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `status_desc` varchar(32) NOT NULL COMMENT '订单状态描述',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  `create_name` varchar(32) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='订单状态枚举表';

-- ----------------------------
-- Table structure for oms_order_status_rule
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_status_rule`;
CREATE TABLE `oms_order_status_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态: 1成功',
  `order_status` smallint(6) DEFAULT NULL COMMENT '订单状态:',
  `send_order` int(11) DEFAULT NULL COMMENT '推送顺序',
  `op_process` varchar(32) DEFAULT NULL COMMENT '处理process',
  `send_address` varchar(64) DEFAULT NULL COMMENT '系统推送地址',
  `rule_desc` varchar(128) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oms_unidx_status_rule` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=30753442 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_paid_timeout
-- ----------------------------
DROP TABLE IF EXISTS `oms_paid_timeout`;
CREATE TABLE `oms_paid_timeout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `status` int(10) DEFAULT '0' COMMENT '状态 0:创建 1:取消订单成功 2:释放可卖数成功',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=743936 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_priority_fulfill_conf
-- ----------------------------
DROP TABLE IF EXISTS `oms_priority_fulfill_conf`;
CREATE TABLE `oms_priority_fulfill_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '交易单号',
  `status` smallint(6) DEFAULT '0' COMMENT '状态：0新增，1已处理',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12374 DEFAULT CHARSET=utf8 COMMENT='订单履约限流-订单优先下发表';

-- ----------------------------
-- Table structure for oms_ship_capacity_conf
-- ----------------------------
DROP TABLE IF EXISTS `oms_ship_capacity_conf`;
CREATE TABLE `oms_ship_capacity_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `time_period_id` int(11) DEFAULT NULL COMMENT '时间段ID',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `status` smallint(6) DEFAULT '0' COMMENT '状态：0新增，1启用， -1停用',
  `ship_capacity` int(11) DEFAULT NULL COMMENT '运力',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='订单运力配置明细表';

-- ----------------------------
-- Table structure for oms_ship_capacity_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_ship_capacity_log`;
CREATE TABLE `oms_ship_capacity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ware_id` int(11) NOT NULL COMMENT '仓库id',
  `cfg_type` smallint(6) DEFAULT '0' COMMENT '配置类型：0 前置仓运力，1 仓库作业限流',
  `attr_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性',
  `old_val` varchar(30) NOT NULL DEFAULT '' COMMENT '原值',
  `new_val` varchar(30) NOT NULL DEFAULT '' COMMENT '新值',
  `do_time` varchar(30) NOT NULL COMMENT '操作时间',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3266 DEFAULT CHARSET=utf8 COMMENT='订单运力配置操作日志表';

-- ----------------------------
-- Table structure for oms_ship_capacity_main
-- ----------------------------
DROP TABLE IF EXISTS `oms_ship_capacity_main`;
CREATE TABLE `oms_ship_capacity_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库ID',
  `cfg_type` smallint(6) DEFAULT '0' COMMENT '配置类型：0 前置仓运力，1 仓库作业限流',
  `status` smallint(6) DEFAULT '0' COMMENT '状态：0新增，1启用， -1停用',
  `picker_num` int(11) DEFAULT NULL COMMENT '前置仓拣货人员数量',
  `courier_num` int(11) DEFAULT NULL COMMENT '前置仓配送员数量',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='订单运力配置表主表';

-- ----------------------------
-- Table structure for oms_sku_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_sku_coupon`;
CREATE TABLE `oms_sku_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `sku_id` bigint(20) DEFAULT NULL,
  `coupon_id` varchar(1024) DEFAULT NULL,
  `coupon_type` smallint(6) DEFAULT NULL COMMENT '1:全品类优惠;2:限品类优惠;3:满减;4:礼品卡;',
  `coupon_price` decimal(16,4) DEFAULT NULL COMMENT '优惠金额',
  `coupon_content` varchar(64) DEFAULT NULL COMMENT '优惠内容',
  `coupon_owner` varchar(32) DEFAULT NULL COMMENT '优惠券所属:店铺',
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `odid_idx` (`order_detail_id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54543932 DEFAULT CHARSET=utf8 COMMENT='订单优惠信息（暂时无）';

-- ----------------------------
-- Table structure for oms_sku_sales_amount
-- ----------------------------
DROP TABLE IF EXISTS `oms_sku_sales_amount`;
CREATE TABLE `oms_sku_sales_amount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品id',
  `sku_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `sku_num` decimal(12,4) DEFAULT '0.0000' COMMENT 'sku数量',
  `is_weight` smallint(6) DEFAULT '0' COMMENT '是不是称重品',
  `total_sale_price` decimal(10,4) DEFAULT '0.0000' COMMENT 'sku销售总额',
  `ware_id` int(11) DEFAULT '0' COMMENT '库房id',
  `date_flag` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单创建日期',
  `operate_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_date_flag` (`date_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=24686728 DEFAULT CHARSET=utf8 COMMENT='订单每日销量统计表';

-- ----------------------------
-- Table structure for oms_sku_sales_qty
-- ----------------------------
DROP TABLE IF EXISTS `oms_sku_sales_qty`;
CREATE TABLE `oms_sku_sales_qty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'skuId',
  `sku_type` smallint(4) NOT NULL DEFAULT '1' COMMENT '1,普通, 2虚拟组套, 3组套子商品, 4积分优惠券',
  `sku_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计销售数量',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101830 DEFAULT CHARSET=utf8 COMMENT='商品售卖数量表';

-- ----------------------------
-- Table structure for oms_system_config
-- ----------------------------
DROP TABLE IF EXISTS `oms_system_config`;
CREATE TABLE `oms_system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型: 1 是否需要人工审核',
  `type_value` int(11) DEFAULT NULL COMMENT '类型值',
  `type_desc` varchar(32) DEFAULT NULL COMMENT '描述',
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_third_retry_front
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_retry_front`;
CREATE TABLE `oms_third_retry_front` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) DEFAULT '0' COMMENT '订单号',
  `third_system` smallint(6) DEFAULT '0' COMMENT '第三方系统名称,1-宝钢',
  `third_module` smallint(6) DEFAULT '0' COMMENT '第三方系统模块名称(第三方系统接口名称) 1-兑换码核销接口',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新日期',
  `catch_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '抓取时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4424 DEFAULT CHARSET=utf8 COMMENT='第三方系统接口失败重试表';

-- ----------------------------
-- Table structure for oms_upload_third_queue
-- ----------------------------
DROP TABLE IF EXISTS `oms_upload_third_queue`;
CREATE TABLE `oms_upload_third_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `traffic_source` varchar(32) DEFAULT '' COMMENT '来源平台 8 兜礼',
  `process_status` smallint(6) DEFAULT '0' COMMENT '上传ftp的状态0:未上传 1:ftp成功，dfs未成功 2:ftp失败，dfs成功 3:ftp和dfs都成功',
  `fastdfs_url` varchar(128) DEFAULT '' COMMENT 'fastdfs文件路径',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `catch_date` date DEFAULT '1970-10-01' COMMENT '抓取哪一天的数据做报表',
  PRIMARY KEY (`id`),
  KEY `idx_crte_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2252 DEFAULT CHARSET=utf8 COMMENT='上传三方报表队列';

-- ----------------------------
-- Table structure for oms_user_cheat_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_user_cheat_log`;
CREATE TABLE `oms_user_cheat_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `act_id` int(20) NOT NULL COMMENT '活动id',
  `cust_address` varchar(64) DEFAULT NULL COMMENT '配送地址',
  `coupon_id` varchar(255) NOT NULL COMMENT '商品券',
  `pay_money` decimal(16,4) DEFAULT NULL COMMENT '应付现金金额',
  `total_price` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `order_id` bigint(20) DEFAULT NULL,
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3346 DEFAULT CHARSET=utf8 COMMENT='作弊用户记录表';

-- ----------------------------
-- Table structure for order_pending_recall
-- ----------------------------
DROP TABLE IF EXISTS `order_pending_recall`;
CREATE TABLE `order_pending_recall` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `direct_parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '直接父单号',
  `root_parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '根父单号',
  `order_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1:正向订单 2:退货单 3:换货取货单 4:换货配送单 5:漏发补发单 6:不退补发单 7:有货先发订单 100:取消订单 ',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单平台来源 1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房号',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总金额',
  `cust_account` varchar(32) NOT NULL DEFAULT '' COMMENT '用户帐号',
  `cust_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户登录id',
  `cust_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `cust_telephone` varchar(32) NOT NULL DEFAULT '' COMMENT '用户电话',
  `cust_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '用户手机',
  `cust_email` varchar(64) NOT NULL DEFAULT '' COMMENT '客户邮箱',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本系统创建时间',
  `book_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '预约送货日期',
  `shipment_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '履约类型:0:默认 1:工作日送货 2:节假日 3:随时 4:定时达 5:极速达',
  `shipment_start_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '送货开始时间',
  `shipment_end_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '送货结束时间',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '0新增， -1 失败， 1成功',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1469418 DEFAULT CHARSET=utf8 COMMENT='待拉回订单列表';

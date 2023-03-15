/*
Navicat MySQL Data Transfer

Source Server         : oms-fukuixiang
Source Server Version : 50628
Source Host           : birdb.prod.chunbo.com:3308
Source Database       : ordercancel_db

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:52:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oms_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_cancel`;
CREATE TABLE `oms_order_cancel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房号',
  `cancel_result` smallint(6) DEFAULT NULL COMMENT '1:可取消 0:不可取消',
  `cancel_source` varchar(32) DEFAULT NULL COMMENT '取消来源',
  `src_system` varchar(32) DEFAULT NULL COMMENT '来源系统',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  `cancel_cause` varchar(256) DEFAULT NULL COMMENT '取消原因',
  `type` int(11) DEFAULT NULL COMMENT '1：取消 2：拒收 3：退货',
  `request_id` bigint(20) DEFAULT NULL COMMENT '逆向申请单号',
  `return_id` bigint(20) DEFAULT NULL COMMENT '逆向单号',
  `return_code` varchar(64) DEFAULT NULL COMMENT '逆向单号编码',
  `cash_refund_type` int(11) DEFAULT NULL COMMENT '现金退款类型 1：原方式，2：虚拟账户',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直父单号',
  `self_help_flag` int(2) DEFAULT NULL COMMENT '是否客户自助取消标识:0-不是,1-是',
  PRIMARY KEY (`id`),
  KEY `return_id_idx` (`return_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2748594 DEFAULT CHARSET=utf8 COMMENT='订单取消';

-- ----------------------------
-- Table structure for oms_order_cancel_flow
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_cancel_flow`;
CREATE TABLE `oms_order_cancel_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `current_process` smallint(6) NOT NULL COMMENT '当前处理环节 0:新建 1:询问网站 2:询问oms 3:询问wms 4:询问tms 5:通知财务6:通知客服(待定) 10:完成',
  `process_flag` smallint(6) DEFAULT NULL COMMENT '处理状态 0 未完成，1完成',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `return_id` bigint(20) DEFAULT NULL COMMENT '逆向单号',
  `return_code` varchar(64) DEFAULT NULL COMMENT '逆向单号编码',
  `type` int(11) DEFAULT NULL COMMENT '1：取消 2：拒收 3：退货',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直父单号',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `lock_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT '1:加锁 0:未加锁',
  PRIMARY KEY (`id`),
  KEY `idx_cp_tp_pf` (`current_process`,`type`,`process_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2695802 DEFAULT CHARSET=utf8 COMMENT='取消流程表';

-- ----------------------------
-- Table structure for oms_push_issuccess
-- ----------------------------
DROP TABLE IF EXISTS `oms_push_issuccess`;
CREATE TABLE `oms_push_issuccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(64) DEFAULT NULL COMMENT '逆向单号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单Id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `type` smallint(6) DEFAULT NULL COMMENT '1:取消 2：拒收  3：退货 ',
  `is_success` smallint(6) DEFAULT NULL COMMENT '状态 1:推送数成功,0推送数据失败',
  `process_flag` smallint(6) DEFAULT NULL COMMENT '0:erp 1:wms 2:fms（申请退款） 3：fms（退货商品信息）4：fms（推送各项钱分别付运费多少钱）5：推送数据给可卖数维护',
  `result_type` int(11) DEFAULT NULL COMMENT '逆向类型：1305 取消（未到wms） 1302取消（已到wms）',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `return_code` varchar(64) DEFAULT NULL COMMENT 'cancel+生成号  reject+生成号  return+生成号',
  `comments` varchar(64) DEFAULT NULL COMMENT '备注',
  `push_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '推送时间',
  `trans_type` int(11) NOT NULL DEFAULT '0' COMMENT '库存流水类型',
  PRIMARY KEY (`id`),
  KEY `is_success_index` (`is_success`),
  KEY `process_flag_index` (`process_flag`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20762272 DEFAULT CHARSET=utf8 COMMENT='拒收或是退货成功后，推送WMS和财务，标记是否推送成功';

-- ----------------------------
-- Table structure for oms_third_push_issuccess
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_push_issuccess`;
CREATE TABLE `oms_third_push_issuccess` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `return_id` bigint(64) NOT NULL COMMENT '逆向单号',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `third_system` smallint(6) DEFAULT '0' COMMENT '第三方系统名称,1-宝钢',
  `third_module` smallint(6) DEFAULT '0' COMMENT '第三方系统模块名称(第三方系统接口名称)',
  `process_status` smallint(6) DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新日期',
  `catch_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '抓取时间',
  `self_help_flag` int(2) DEFAULT NULL COMMENT '是否客户自助取消标识:0-不是,1-是',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_return_id` (`return_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52896 DEFAULT CHARSET=utf8 COMMENT='第三方系统推送状态表';

-- ----------------------------
-- Table structure for order_cancel_off_line
-- ----------------------------
DROP TABLE IF EXISTS `order_cancel_off_line`;
CREATE TABLE `order_cancel_off_line` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单号--原始订单号',
  `return_id` bigint(20) unsigned NOT NULL COMMENT '退单id',
  `fake_order_id` bigint(20) unsigned NOT NULL COMMENT '查询订单号--汉硕pos机打印订单号',
  `store_id` varchar(32) NOT NULL COMMENT '门店号',
  `invoice_id` varchar(32) NOT NULL COMMENT '退货小票号',
  `pos_id` varchar(32) NOT NULL COMMENT '退货POS机号',
  `origin_invoice_id` varchar(32) NOT NULL COMMENT '销单小票号',
  `origin_pos_id` varchar(32) NOT NULL COMMENT '销单POS机号',
  `region_id` int(11) NOT NULL COMMENT '区号',
  `create_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:01' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_return_id` (`return_id`),
  UNIQUE KEY `idx_uniq_invoice_id__pos_id` (`invoice_id`,`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_return_delivery
-- ----------------------------
DROP TABLE IF EXISTS `order_return_delivery`;
CREATE TABLE `order_return_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(20) DEFAULT NULL COMMENT '销退订单号',
  `delivery_date` timestamp NULL DEFAULT NULL COMMENT '配送信息时间',
  `delivery_id` int(11) DEFAULT NULL COMMENT '配送公司id',
  `status` int(11) DEFAULT NULL COMMENT '配送状态',
  `status_name` varchar(128) DEFAULT NULL COMMENT '配送状态名称',
  `signer` varchar(64) DEFAULT NULL COMMENT '签收人',
  `delivery_content` varchar(256) DEFAULT NULL COMMENT '配送详情',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_return_deli_rel` (`return_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253106 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='订单物流信息表';

-- ----------------------------
-- Table structure for order_return_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_return_delivery_detail`;
CREATE TABLE `order_return_delivery_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(1) DEFAULT NULL COMMENT '销退订单号',
  `waybill_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='配送明细表';

-- ----------------------------
-- Table structure for order_return_delivery_main
-- ----------------------------
DROP TABLE IF EXISTS `order_return_delivery_main`;
CREATE TABLE `order_return_delivery_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(20) DEFAULT NULL COMMENT '销退订单号',
  `parent_return_id` bigint(20) DEFAULT NULL COMMENT '销退父单号',
  `delivery_station_id` varchar(32) DEFAULT NULL COMMENT '配送站点编号',
  `delivery_station` varchar(64) DEFAULT NULL COMMENT '配送站点名',
  `waybill_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '配送公司',
  `delivery_id` int(11) DEFAULT NULL COMMENT '承运商id',
  `modify_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '县',
  `other_params` varchar(512) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `return_id_UNIQUE` (`return_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72264 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for order_return_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_return_detail`;
CREATE TABLE `order_return_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单号',
  `sku_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `temp_area_id` smallint(6) DEFAULT NULL COMMENT '温区',
  `is_suit` int(11) DEFAULT NULL COMMENT '1:套装 0：非套装',
  `sku_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `sku_width` decimal(12,4) DEFAULT NULL COMMENT '宽',
  `sku_height` decimal(12,4) DEFAULT NULL COMMENT '高',
  `sku_length` decimal(12,4) DEFAULT NULL COMMENT '长',
  `sku_weight` decimal(12,4) DEFAULT NULL COMMENT '重量',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品',
  `gift_num` int(11) DEFAULT NULL COMMENT '赠品数量',
  `sale_type` smallint(6) DEFAULT NULL COMMENT '1:普通商品 2：预售商品',
  `properties` varchar(256) DEFAULT NULL,
  `sku_extend` varchar(2048) DEFAULT NULL COMMENT '套装商品明细',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `return_type` smallint(6) DEFAULT NULL COMMENT '1:取消 2：拒收 3：退货',
  `return_id` bigint(64) DEFAULT NULL COMMENT '逆向单号',
  `sku_price` decimal(16,4) DEFAULT '0.0000' COMMENT 'sku价格',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销金额',
  `sale_price` decimal(16,4) DEFAULT '0.0000' COMMENT '销售价',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已付金额（现金）',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '账户余额支付金额',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `member_points` int(11) unsigned DEFAULT '0' COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '客户积分金额',
  `sku_receive_num` int(11) DEFAULT '0' COMMENT '仓库收到的退货商品数',
  `gift_receive_num` int(11) DEFAULT '0' COMMENT '仓库收到的退货礼品数',
  `sku_return_num` int(11) DEFAULT '0' COMMENT '商品退货数量',
  `gift_return_num` int(11) DEFAULT '0' COMMENT '礼品退货数量',
  `return_code` varchar(64) DEFAULT NULL COMMENT 'cancel+生成号  reject+生成号  return+生成号',
  `update_date` date DEFAULT NULL COMMENT '修改时间',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开票金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠金额',
  `src_sku_id` varchar(50) DEFAULT NULL COMMENT '赠品的来源主品',
  `abandon` int(11) DEFAULT NULL COMMENT '放弃的商品数量',
  `gift_type` smallint(6) DEFAULT '0' COMMENT '商品类型 0–非赠品  1-促销赠品  2-市场赠品 ',
  `receive_ware_id` bigint(20) NOT NULL COMMENT '退货收货仓库',
  `sku_type` int(11) DEFAULT '0' COMMENT 'sku类型：1普通 2虚拟组套 3虚拟商品组套子商品',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分',
  `sale_tax_code_value` decimal(16,4) DEFAULT NULL COMMENT '税码值',
  `need_retest` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否回收重新质检，0不质检，1质检',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细ID',
  PRIMARY KEY (`id`),
  KEY `sku_id_idx` (`sku_id`),
  KEY `return_id_idx` (`return_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8990736 DEFAULT CHARSET=utf8 COMMENT='拒收或是退货订单商品详情表';

-- ----------------------------
-- Table structure for order_return_number
-- ----------------------------
DROP TABLE IF EXISTS `order_return_number`;
CREATE TABLE `order_return_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku id',
  `sku_num` int(11) DEFAULT NULL COMMENT '订单商品购买数',
  `sku_return_num` int(11) DEFAULT NULL COMMENT '订单商品退货数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `sku_type` int(11) DEFAULT '0' COMMENT 'sku类型：1普通 2虚拟组套 3虚拟商品组套子商品',
  `src_sku_id` varchar(50) DEFAULT '' COMMENT '来源商品',
  `is_weight` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否称重商品:1是，0否',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细ID',
  `sale_price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '= oms_order_detail.sale_price(成交价)',
  `upc_no` varchar(64) NOT NULL DEFAULT '' COMMENT '商品UPC码',
  `unit` varchar(64) NOT NULL DEFAULT '' COMMENT '单位',
  `sku_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `idx_oid_rpid` (`order_id`,`root_parent_id`),
  KEY `idx_rpid_oid` (`root_parent_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12789444 DEFAULT CHARSET=utf8 COMMENT='订单退货数量';

-- ----------------------------
-- Table structure for order_return_operate
-- ----------------------------
DROP TABLE IF EXISTS `order_return_operate`;
CREATE TABLE `order_return_operate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `return_id` bigint(20) DEFAULT NULL COMMENT '退货单号',
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型',
  `op_date` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  `op_system` varchar(32) DEFAULT NULL COMMENT '系统',
  `op_content` varchar(128) DEFAULT NULL COMMENT '操作详情',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `type` smallint(6) DEFAULT NULL COMMENT '1:网站 2:oms 3:wms 4:tms 5:crm 6:ordercancel 7 客服',
  `op_desc` varchar(128) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`),
  KEY `idx_return_id` (`return_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38035276 DEFAULT CHARSET=utf8 COMMENT='订单退货状态修改流水';

-- ----------------------------
-- Table structure for order_return_refund
-- ----------------------------
DROP TABLE IF EXISTS `order_return_refund`;
CREATE TABLE `order_return_refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL COMMENT '订单号',
  `root_parent_id` varchar(20) DEFAULT NULL COMMENT '原始单号',
  `dirdct_parent_id` varchar(20) DEFAULT NULL COMMENT '直接父单号',
  `return_id` varchar(20) NOT NULL COMMENT '退货单号',
  `sku_id` varchar(20) DEFAULT NULL COMMENT '商品sku id',
  `return_num` int(11) DEFAULT NULL COMMENT '商品退货数量',
  `sale_type` smallint(6) DEFAULT NULL COMMENT '销售类型',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品',
  `sale_price` varchar(16) DEFAULT NULL COMMENT '商品售价',
  `sku_type` int(11) DEFAULT NULL COMMENT '商品类型 0,1 普通品；2虚拟组套；3虚拟组套子商品',
  `src_sku_id` varchar(50) DEFAULT '' COMMENT '来源商品sku id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_return` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否退 1是 0否',
  `money_type` varchar(20) NOT NULL DEFAULT '0' COMMENT '金额类型 1005(商品卡) 1004（商品券） 1003（礼品卡） 1001（普通优惠券）',
  `total_amount` varchar(16) NOT NULL DEFAULT '0' COMMENT '金额',
  `extend_info` varchar(100) DEFAULT '' COMMENT '扩展字段',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '线下是否已确认退款：0未确认，1已确认',
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`),
  KEY `index_return_id` (`return_id`),
  KEY `index_rtpar_id` (`root_parent_id`),
  KEY `idx_oid_rid` (`order_id`,`return_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1771658 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_return_status
-- ----------------------------
DROP TABLE IF EXISTS `order_return_status`;
CREATE TABLE `order_return_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'return+',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `direct_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父单号',
  `order_type` smallint(6) DEFAULT NULL COMMENT '订单类型一 1：正向订单 2：退货单 3：换货单(换货取货单) 4：换货单(换货配货单) 5：漏发补发单 6：不退补发单 7：有货先发订单 100：取消订单',
  `order_channel` smallint(6) DEFAULT NULL COMMENT '订单类型二 1：自营 2：供应商订单 3：虚拟',
  `order_source` int(11) DEFAULT NULL COMMENT '订单来源 1：网站 2：手机 3：平板',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `cust_account` varchar(32) DEFAULT NULL COMMENT '用户账号',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `cust_telephone` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `cust_email` varchar(64) DEFAULT NULL COMMENT '客户邮箱',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮编',
  `weigth` decimal(10,0) DEFAULT NULL COMMENT '总重量',
  `pack_num` int(11) DEFAULT NULL COMMENT '包裹数',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户登录id',
  `is_refund` smallint(6) DEFAULT NULL COMMENT '是否已退款',
  `is_parent` smallint(6) DEFAULT NULL COMMENT '1：父单 0：子单',
  `return_status` int(11) DEFAULT NULL COMMENT '退款状态：9001取消 9003退货申请 9004退货申请确认9005待快递上门取货 9006取货完成 9007到货登记 9008已申请退款 9009退款审核通过 9010已退款',
  `return_status_wms` int(11) DEFAULT NULL COMMENT '退货状态：9001取消 9003退货申请 9004退货申请确认9005待快递上门取货 9006取货完成 9007到货登记 9008已申请退款 9009退款审核通过 9010已退款',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `is_invoiced` smallint(6) DEFAULT NULL COMMENT '发票是否已经开  0：未开  1：已开',
  `return_type` smallint(6) DEFAULT NULL COMMENT '1:取消 2：拒收 3：退货',
  `return_id` bigint(64) DEFAULT NULL COMMENT '逆向单号',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `total_money` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠金额',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已付金额(现金)',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额支付金额',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `member_points` int(10) DEFAULT '0' COMMENT '积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `no_invoice_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '不开票金额',
  `pickup_province_id` int(11) DEFAULT NULL COMMENT '上门取货省',
  `pickup_city_id` int(11) DEFAULT NULL COMMENT '上门取货市',
  `pickup_county_id` int(11) DEFAULT NULL COMMENT '上门取货区县',
  `pickup_address` varchar(128) DEFAULT NULL COMMENT '上门取货地址',
  `pickup_postal_code` varchar(16) DEFAULT NULL COMMENT '上门取货邮编',
  `ware_province_id` int(11) DEFAULT NULL COMMENT '收货仓库省',
  `ware_city_id` int(11) DEFAULT NULL COMMENT '收货仓库市',
  `ware_county_id` int(11) DEFAULT NULL COMMENT '收货仓库区县',
  `ware_address` varchar(128) DEFAULT NULL COMMENT '收货仓库地址',
  `ware_postal_code` varchar(16) DEFAULT NULL COMMENT '收货仓库邮编',
  `return_code` varchar(64) DEFAULT NULL COMMENT 'cancel+生成号  reject+生成号  return+生成号',
  `payment_date` datetime DEFAULT NULL COMMENT '交易时间',
  `payment_channel` varchar(32) DEFAULT NULL COMMENT '付款渠道',
  `parent_payment_channel` varchar(32) DEFAULT NULL COMMENT '父付款渠道',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省名称',
  `city_name` varchar(64) DEFAULT NULL COMMENT '市名称',
  `county_name` varchar(64) DEFAULT NULL COMMENT '区县名称',
  `is_payed` smallint(32) DEFAULT NULL COMMENT '1:已支付 0:未支付',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `pickup_province_name` varchar(64) DEFAULT NULL COMMENT '上门取货省',
  `pickup_city_name` varchar(64) DEFAULT NULL COMMENT '上门取货市',
  `pickup_county_name` varchar(64) DEFAULT NULL COMMENT '上门取货区县',
  `receive_date` datetime DEFAULT NULL COMMENT '仓库收货时间',
  `pick_up_flag` int(11) DEFAULT NULL COMMENT '1: 需要上门取货, 0, 不需要上门取货',
  `receive_ware_id` bigint(20) NOT NULL COMMENT '退货收货仓库',
  `area_id` varchar(32) DEFAULT NULL COMMENT '四级地址编号',
  `area_name` varchar(64) DEFAULT NULL COMMENT '四级地址名称',
  `pickup_area_id` varchar(32) DEFAULT NULL COMMENT '上门取货四级地址编号',
  `pickup_area_name` varchar(64) DEFAULT NULL COMMENT '上门取货四级地址名称',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分',
  `payment_serial_number` varchar(32) DEFAULT '' COMMENT '支付流水号',
  `traffic_source` varchar(256) DEFAULT NULL COMMENT '订单流量来源 1:CPS等平台 2:导航网站等 3:特定广告等（跟踪码）4:域名直接访问',
  `third_cust_id` varchar(20) DEFAULT '' COMMENT '第三方系统客户编号',
  `purchase_return_id` bigint(20) DEFAULT '-1' COMMENT '采购单号',
  `whole_order_return_type` smallint(6) DEFAULT '0' COMMENT '0:部分退货 1:当前销退单整单退货 2.订单所有审核通过销退单，整单退货（未使用）)',
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `return_id_idx` (`return_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2765076 DEFAULT CHARSET=utf8 COMMENT='订单拒收或是退货详情表';

-- ----------------------------
-- Table structure for order_return_third_info
-- ----------------------------
DROP TABLE IF EXISTS `order_return_third_info`;
CREATE TABLE `order_return_third_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `return_id` bigint(64) NOT NULL COMMENT '逆向单号',
  `order_id` bigint(20) NOT NULL COMMENT '订单Id',
  `order_type` smallint(6) DEFAULT '0' COMMENT '1:取消 2：拒收  3：退货 ',
  `traffic_source` varchar(32) DEFAULT '' COMMENT '订单平台来源 8 兜礼',
  `third_cust_id` varchar(20) DEFAULT '' COMMENT '第三方系统客户编号',
  `payment_serial_number` varchar(32) DEFAULT '' COMMENT '支付流水号',
  `total_sku_price` decimal(16,4) DEFAULT '0.0000' COMMENT '所有sku金额',
  `cash_price` decimal(16,4) DEFAULT '0.0000' COMMENT '现金金额',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '余额',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `skucard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '商品卡金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券-礼券',
  `member_points` decimal(16,4) DEFAULT '0.0000' COMMENT '积分',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `delivery_price_type` smallint(6) DEFAULT '0' COMMENT '运费类型 ',
  `payment_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '上传财务的时间',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `third_delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '三方积分和现金支付的运费',
  PRIMARY KEY (`id`),
  KEY `idx_rtn_id` (`return_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_pay_date` (`payment_date`)
) ENGINE=InnoDB AUTO_INCREMENT=76162 DEFAULT CHARSET=utf8 COMMENT='三方订单退单信息';

-- ----------------------------
-- Table structure for order_should_refund_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_should_refund_detail`;
CREATE TABLE `order_should_refund_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `root_parent_id` bigint(20) DEFAULT NULL COMMENT '根父单号',
  `dirdct_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父单号',
  `return_id` bigint(20) DEFAULT NULL COMMENT '退货单号',
  `total_money` decimal(16,4) DEFAULT NULL COMMENT '总金额',
  `coupon_price` decimal(16,4) DEFAULT NULL COMMENT '优惠金额',
  `delivery_price` decimal(16,4) DEFAULT NULL COMMENT '运费',
  `paid_amount` decimal(16,4) DEFAULT NULL COMMENT '已付现金',
  `account_money` decimal(16,4) DEFAULT NULL COMMENT '账户余额',
  `giftcard_price` decimal(16,4) DEFAULT NULL COMMENT '礼品卡',
  `cash_coupon` decimal(16,4) DEFAULT NULL COMMENT '代金券',
  `member_points` int(11) DEFAULT NULL COMMENT '积分',
  `member_points_price` decimal(16,4) DEFAULT NULL COMMENT '积分金额',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku id',
  `sku_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品',
  `sale_type` smallint(6) DEFAULT NULL COMMENT '销售类型',
  `return_coupon` smallint(6) DEFAULT NULL COMMENT '退优惠券  1是 0否',
  `trading_order` smallint(6) DEFAULT NULL COMMENT '是否为最原始单（交易单）1是  0否',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '售价',
  `sku_type` int(11) DEFAULT '0' COMMENT 'sku类型：1普通 2虚拟组套 3虚拟商品组套子商品',
  `src_sku_id` varchar(50) DEFAULT '' COMMENT '来源商品',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '线下是否已确认退款：0未确认，1已确认',
  PRIMARY KEY (`id`),
  KEY `sku_id_idx` (`sku_id`),
  KEY `return_id_idx` (`return_id`),
  KEY `idx_oid_rpid` (`order_id`,`root_parent_id`),
  KEY `idx_rpid_oid` (`root_parent_id`,`order_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4511606 DEFAULT CHARSET=utf8 COMMENT='订单销退应退款明细';

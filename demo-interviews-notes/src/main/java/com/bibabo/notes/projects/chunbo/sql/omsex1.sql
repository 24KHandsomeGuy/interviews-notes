/*
Navicat MySQL Data Transfer

Source Server         : oms-fukuixiang
Source Server Version : 50628
Source Host           : birdb.prod.chunbo.com:3308
Source Database       : omsex1

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:51:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dami_test
-- ----------------------------
DROP TABLE IF EXISTS `dami_test`;
CREATE TABLE `dami_test` (
  `activity_id` int(11) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户登录id',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for elec_fence_grid
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_grid`;
CREATE TABLE `elec_fence_grid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `grid_code` varchar(18) NOT NULL DEFAULT '' COMMENT '网格编号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`ware_id`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 COMMENT='电子围栏网格信息';

-- ----------------------------
-- Table structure for elec_fence_grid_point
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_grid_point`;
CREATE TABLE `elec_fence_grid_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `grid_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '网格id',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8725 DEFAULT CHARSET=utf8 COMMENT='电子围栏网格经纬度点';

-- ----------------------------
-- Table structure for elec_fence_marker
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_marker`;
CREATE TABLE `elec_fence_marker` (
  `marker_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库编号',
  `ware_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库名称',
  `ware_desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库描述',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `enable_status` smallint(6) NOT NULL DEFAULT '1' COMMENT '1：停用 2：启用',
  `entry_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `entry_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `fence_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1极速达 2当日达',
  PRIMARY KEY (`marker_id`),
  KEY `fence_markerI1` (`ware_id`) USING BTREE,
  KEY `fence_markerI2` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='电子围栏站点标记';

-- ----------------------------
-- Table structure for elec_fence_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_opt_log`;
CREATE TABLE `elec_fence_opt_log` (
  `opt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `opt_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `opt_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '操作时间',
  `opt_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '操作类型  1新增 2修改 3删除',
  `opt_ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人所在ip',
  `fence_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1极速达 2当日达',
  PRIMARY KEY (`opt_id`),
  KEY `opt_logI1` (`opt_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2650 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='电子围栏操作日志';

-- ----------------------------
-- Table structure for elec_fence_point
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_point`;
CREATE TABLE `elec_fence_point` (
  `point_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sort_num` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `entry_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `fence_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '1极速达 2当日达',
  PRIMARY KEY (`point_id`),
  UNIQUE KEY `uniq_ware_id` (`ware_id`,`sort_num`,`fence_type`) USING BTREE,
  KEY `fence_pointI1` (`entry_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=418646 DEFAULT CHARSET=utf8 COMMENT='电子围栏 经纬度点集合';

-- ----------------------------
-- Table structure for elec_fence_station
-- ----------------------------
DROP TABLE IF EXISTS `elec_fence_station`;
CREATE TABLE `elec_fence_station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '站定名称',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222334 DEFAULT CHARSET=utf8 COMMENT='电子围栏站点信息';

-- ----------------------------
-- Table structure for hs_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `hs_ordergoods`;
CREATE TABLE `hs_ordergoods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `StoreID` varchar(20) NOT NULL DEFAULT '',
  `PosID` varchar(20) NOT NULL,
  `InvoiceID` bigint(20) NOT NULL,
  `RowNo` int(11) NOT NULL,
  `SalesManID` varchar(20) DEFAULT NULL,
  `SysGoodsID` varchar(20) DEFAULT NULL,
  `GoodsID` varchar(20) DEFAULT NULL,
  `InputCode` varchar(20) DEFAULT NULL,
  `GoodsBarcode` varchar(40) DEFAULT NULL,
  `CustomCode` varchar(40) DEFAULT NULL,
  `ManageID` varchar(40) DEFAULT NULL,
  `CatID` varchar(40) DEFAULT NULL,
  `BrandID` varchar(40) DEFAULT NULL,
  `VendorID` varchar(40) DEFAULT NULL,
  `BatchID` varchar(40) DEFAULT NULL,
  `CodeType` varchar(10) DEFAULT NULL,
  `GoodsType` varchar(10) DEFAULT NULL,
  `ManageMode` varchar(10) DEFAULT NULL,
  `GoodsName` varchar(100) DEFAULT NULL,
  `GoodsUnit` varchar(10) DEFAULT NULL,
  `SpecID` varchar(10) DEFAULT NULL,
  `PackageNum` double DEFAULT NULL,
  `ItemFlag` varchar(10) DEFAULT NULL,
  `SaleTax` double DEFAULT NULL,
  `SendPlace` varchar(100) DEFAULT NULL,
  `ParentID` varchar(50) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `SalePrice` double DEFAULT NULL,
  `TotalMoney` double DEFAULT NULL,
  `TotalDiscount` double DEFAULT NULL,
  `SaleOverage` double DEFAULT NULL,
  `PayOverage` double DEFAULT NULL,
  `IsPoint` varchar(10) DEFAULT NULL,
  `PointRate` double DEFAULT NULL,
  `CurPoint` double DEFAULT NULL,
  `OldStoreID` varchar(20) DEFAULT NULL,
  `OldPosID` varchar(20) DEFAULT NULL,
  `OldInvoiceID` bigint(20) DEFAULT NULL,
  `DiscountItemCount` int(11) DEFAULT NULL,
  `PayItemCount` int(11) DEFAULT NULL,
  `Memo` varchar(1000) DEFAULT NULL,
  `Str1` varchar(1000) DEFAULT NULL,
  `Str2` varchar(2000) DEFAULT NULL,
  `Str3` varchar(3000) DEFAULT NULL,
  `Str4` varchar(4000) DEFAULT NULL,
  `Str5` varchar(5000) DEFAULT NULL,
  `Num1` double DEFAULT NULL,
  `Num2` double DEFAULT NULL,
  `Num3` double DEFAULT NULL,
  `Num4` double DEFAULT NULL,
  `Num5` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_storeId_posId_invoiceId_rowNo` (`StoreID`,`PosID`,`InvoiceID`,`RowNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13798024 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hs_ordergoodsdiscount
-- ----------------------------
DROP TABLE IF EXISTS `hs_ordergoodsdiscount`;
CREATE TABLE `hs_ordergoodsdiscount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `StoreID` varchar(20) DEFAULT NULL,
  `PosID` varchar(20) NOT NULL,
  `InvoiceID` bigint(20) NOT NULL,
  `ItemRowNo` int(11) NOT NULL,
  `RowNo` int(11) NOT NULL,
  `DiscountType` varchar(20) DEFAULT NULL,
  `DiscountName` varchar(100) DEFAULT NULL,
  `DiscountMoney` double DEFAULT NULL,
  `DiscountRate` double DEFAULT NULL,
  `DiscountShareRate` double DEFAULT NULL,
  `DiscountBillno` varchar(40) DEFAULT NULL,
  `GrantID` varchar(20) DEFAULT NULL,
  `GrantType` varchar(20) DEFAULT NULL,
  `Memo` varchar(300) DEFAULT NULL,
  `Str1` varchar(300) DEFAULT NULL,
  `Str2` varchar(300) DEFAULT NULL,
  `Str3` varchar(300) DEFAULT NULL,
  `Str4` varchar(300) DEFAULT NULL,
  `Str5` varchar(300) DEFAULT NULL,
  `Num1` double DEFAULT NULL,
  `Num2` double DEFAULT NULL,
  `Num3` double DEFAULT NULL,
  `Num4` double DEFAULT NULL,
  `Num5` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posId_inoviceId_ItemRowNo_rowNo` (`PosID`,`InvoiceID`,`ItemRowNo`,`RowNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8334548 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hs_ordermain
-- ----------------------------
DROP TABLE IF EXISTS `hs_ordermain`;
CREATE TABLE `hs_ordermain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OrderID` bigint(20) DEFAULT NULL,
  `StoreID` varchar(20) NOT NULL DEFAULT '',
  `PosID` varchar(20) NOT NULL,
  `InvoiceID` bigint(20) NOT NULL,
  `OrderType` varchar(10) DEFAULT NULL,
  `PosTimes` varchar(10) DEFAULT NULL,
  `SaleDatetime` varchar(20) DEFAULT NULL,
  `SumStatus` varchar(50) DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `OperID` varchar(20) DEFAULT NULL,
  `MemberID` varchar(40) DEFAULT NULL,
  `MemberCard` varchar(200) DEFAULT NULL,
  `MemberType` varchar(10) DEFAULT NULL,
  `MemberName` varchar(20) DEFAULT NULL,
  `MemberTel` varchar(20) DEFAULT NULL,
  `MemberPhone` varchar(20) DEFAULT NULL,
  `MemberEmail` varchar(100) DEFAULT NULL,
  `MemberTrack` varchar(150) DEFAULT NULL,
  `GrantID` varchar(40) DEFAULT NULL,
  `GrantType` varchar(10) DEFAULT NULL,
  `PayableMoney` double DEFAULT NULL,
  `ActuallyMoney` double DEFAULT NULL,
  `CHANGE` double DEFAULT NULL,
  `SaleOverage` double DEFAULT NULL,
  `PayOverage` double DEFAULT NULL,
  `DeliveryPrice` double DEFAULT NULL,
  `TotalQuantity` double DEFAULT NULL,
  `TotalMoney` double DEFAULT NULL,
  `TotalDiscount` double DEFAULT NULL,
  `GrantDiscount` double DEFAULT NULL,
  `MemberDiscount` double DEFAULT NULL,
  `DmDiscount` double DEFAULT NULL,
  `OtherDiscount` double DEFAULT NULL,
  `TotalPoint` double DEFAULT NULL,
  `CurMemberPoint` double DEFAULT NULL,
  `OrderSource` varchar(60) DEFAULT NULL,
  `OldOrderID` varchar(20) DEFAULT NULL,
  `OldStoreID` varchar(20) DEFAULT NULL,
  `OldPosID` varchar(40) DEFAULT NULL,
  `OldInvoiceID` bigint(20) DEFAULT NULL,
  `WareID` varchar(50) DEFAULT NULL,
  `NeedInvoice` varchar(20) DEFAULT NULL,
  `PrintInvoice` varchar(20) DEFAULT NULL,
  `SplitType` varchar(20) DEFAULT NULL,
  `IsParent` varchar(20) DEFAULT NULL,
  `DirectParentID` bigint(20) DEFAULT NULL,
  `RootParentID` bigint(20) DEFAULT NULL,
  `IsPayed` varchar(10) DEFAULT NULL,
  `PaymentType` varchar(20) DEFAULT NULL,
  `BuyerInfo` varchar(40) DEFAULT NULL,
  `Taxreceipt` varchar(300) DEFAULT NULL,
  `ItemCount` int(11) DEFAULT NULL,
  `PayCount` int(11) DEFAULT NULL,
  `NetFlag` varchar(10) DEFAULT NULL,
  `MQFlag` varchar(10) DEFAULT NULL,
  `PrintCount` int(11) DEFAULT NULL,
  `Memo` varchar(1000) DEFAULT NULL,
  `Str1` varchar(1000) DEFAULT NULL,
  `Str2` varchar(2000) DEFAULT NULL,
  `Str3` varchar(3000) DEFAULT NULL,
  `Str4` varchar(4000) DEFAULT NULL,
  `Str5` varchar(5000) DEFAULT NULL,
  `Num1` double DEFAULT NULL,
  `Num2` double DEFAULT NULL,
  `Num3` double DEFAULT NULL,
  `Num4` double DEFAULT NULL,
  `Num5` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_storeId_posId_InvoiceId` (`StoreID`,`PosID`,`InvoiceID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6018536 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hs_orderpay
-- ----------------------------
DROP TABLE IF EXISTS `hs_orderpay`;
CREATE TABLE `hs_orderpay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `StoreID` varchar(20) NOT NULL DEFAULT '',
  `PosID` varchar(20) NOT NULL,
  `InvoiceID` bigint(20) NOT NULL,
  `RowNo` int(11) NOT NULL,
  `PayID` varchar(10) DEFAULT NULL,
  `PayName` varchar(40) DEFAULT NULL,
  `ShortPayID` varchar(10) DEFAULT NULL,
  `PayFlag` varchar(10) DEFAULT NULL,
  `OrginMoney` double DEFAULT NULL,
  `ExchgRate` double DEFAULT NULL,
  `TotalMoney` double DEFAULT NULL,
  `PayOverage` double DEFAULT NULL,
  `IsChangeOver` varchar(10) DEFAULT NULL,
  `PayCardNO` varchar(512) DEFAULT NULL,
  `PayIDNO` varchar(40) DEFAULT NULL,
  `Batch` varchar(40) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `Trace` varchar(40) DEFAULT NULL,
  `IsPoint` varchar(10) DEFAULT NULL,
  `PointRate` double DEFAULT NULL,
  `PreBalance` double DEFAULT NULL,
  `Memo` varchar(1000) DEFAULT NULL,
  `Str1` varchar(1000) DEFAULT NULL,
  `Str2` varchar(2000) DEFAULT NULL,
  `Str3` varchar(3000) DEFAULT NULL,
  `Str4` varchar(4000) DEFAULT NULL,
  `Str5` varchar(5000) DEFAULT NULL,
  `Num1` double DEFAULT NULL,
  `Num2` double DEFAULT NULL,
  `Num3` double DEFAULT NULL,
  `Num4` double DEFAULT NULL,
  `Num5` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_storeId_posId_invoiceId_rowNo` (`StoreID`,`PosID`,`InvoiceID`,`RowNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7095748 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hs_orderpayitem
-- ----------------------------
DROP TABLE IF EXISTS `hs_orderpayitem`;
CREATE TABLE `hs_orderpayitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `StoreID` varchar(20) NOT NULL DEFAULT '',
  `PosID` varchar(20) NOT NULL,
  `InvoiceID` bigint(20) NOT NULL,
  `ItemRowNo` int(11) NOT NULL,
  `PayRowNo` int(11) NOT NULL,
  `RowNo` int(11) NOT NULL DEFAULT '0',
  `GoodsMoney` double DEFAULT NULL,
  `OrginMoney` double DEFAULT NULL,
  `ExchgRate` double DEFAULT NULL,
  `TotalMoney` double DEFAULT NULL,
  `Overage` double DEFAULT NULL,
  `Memo` varchar(300) DEFAULT NULL,
  `Str1` varchar(300) DEFAULT NULL,
  `Str2` varchar(300) DEFAULT NULL,
  `Str3` varchar(300) DEFAULT NULL,
  `Str4` varchar(300) DEFAULT NULL,
  `Str5` varchar(300) DEFAULT NULL,
  `Num1` double DEFAULT NULL,
  `Num2` double DEFAULT NULL,
  `Num3` double DEFAULT NULL,
  `Num4` double DEFAULT NULL,
  `Num5` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_storeId_posId_invoiceId_itemRowNo_payRowNo_rowNo` (`StoreID`,`PosID`,`InvoiceID`,`ItemRowNo`,`PayRowNo`,`RowNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6042388 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_addr_key_word
-- ----------------------------
DROP TABLE IF EXISTS `oms_addr_key_word`;
CREATE TABLE `oms_addr_key_word` (
  `key_word_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关键字id',
  `key_word_content` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '关键字内容',
  `province_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '省名称',
  `city_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '市名称',
  `area_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '区名称',
  `create_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `addr_prof` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '地址属性：SJC：世纪城',
  PRIMARY KEY (`key_word_id`),
  KEY `idx_key_word_content` (`key_word_content`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='OMS地址关键字';

-- ----------------------------
-- Table structure for oms_check_record
-- ----------------------------
DROP TABLE IF EXISTS `oms_check_record`;
CREATE TABLE `oms_check_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `coupons_id` bigint(20) DEFAULT NULL COMMENT '卷批次',
  `coupons_name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `is_goods_coupons` tinyint(1) DEFAULT '0' COMMENT '商品卷是否作废0:未作废1:作废;',
  `is_transport_coupons` tinyint(1) DEFAULT '0' COMMENT '商品卷是否作废0:未作废1:作废;',
  `ip_address` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `register_phone` varchar(16) DEFAULT NULL COMMENT ' 注册手机号',
  `phone_zone` varchar(16) DEFAULT NULL COMMENT '手机号码归属地',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `op_date` datetime DEFAULT NULL COMMENT '操作时间',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `operator` varchar(64) DEFAULT NULL COMMENT '操作人',
  `op_desc` varchar(128) DEFAULT NULL COMMENT '审核意见',
  `op_content` varchar(128) DEFAULT NULL COMMENT '操作详情',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户登录id',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66952 DEFAULT CHARSET=utf8 COMMENT='人工审单表';

-- ----------------------------
-- Table structure for oms_customer
-- ----------------------------
DROP TABLE IF EXISTS `oms_customer`;
CREATE TABLE `oms_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(32) DEFAULT NULL COMMENT '客户编码',
  `name` varchar(64) DEFAULT NULL COMMENT '客户名称',
  `type` smallint(6) DEFAULT '0' COMMENT '客户类型',
  `status` smallint(6) DEFAULT '0' COMMENT '客户状态',
  `source` smallint(6) NOT NULL DEFAULT '1' COMMENT '1.企销渠道 2.callin客户 3.其他渠道',
  `is_valid` smallint(6) DEFAULT '0' COMMENT '是否启用',
  `contact_name` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `contact_title` varchar(64) DEFAULT NULL COMMENT '联系人职务',
  `contact_mail` varchar(64) DEFAULT NULL COMMENT '联系邮箱',
  `contact_addr` varchar(128) DEFAULT NULL COMMENT '联系地址',
  `is_contract` smallint(6) DEFAULT '0' COMMENT '是否框架合同',
  `contract_no` varchar(32) DEFAULT NULL COMMENT '合同号',
  `contract_start_date` datetime DEFAULT NULL COMMENT '生效日期',
  `contract_end_date` datetime DEFAULT NULL COMMENT '失效日期',
  `reconciliation_days` int(11) DEFAULT '0' COMMENT '对账账期',
  `is_ship_fee` smallint(6) DEFAULT '0' COMMENT '是否启用运费',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `ship_fee` varchar(32) DEFAULT '' COMMENT '运费',
  `sale_user_id` bigint(20) DEFAULT '0' COMMENT '销售专员ID',
  `sale_user_name` varchar(64) DEFAULT '' COMMENT '销售专员名称',
  `sale_user_mobile` varchar(32) DEFAULT '' COMMENT '销售专员电话',
  `direct_dept_id` bigint(20) DEFAULT NULL COMMENT '销售专员直属部门ID',
  `invoice_title` varchar(128) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `invoice_taxno` varchar(128) NOT NULL DEFAULT '' COMMENT '公司发票税号',
  `sign_company_id` bigint(20) NOT NULL DEFAULT '101' COMMENT '签约公司id',
  `sign_company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '签约公司名称',
  `order_source_code` int(4) NOT NULL DEFAULT '1' COMMENT '订单来源编码',
  `order_source_name` varchar(32) NOT NULL DEFAULT 'PC' COMMENT '订单来源简称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4740 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_front_ware_order_detail_rpt
-- ----------------------------
DROP TABLE IF EXISTS `oms_front_ware_order_detail_rpt`;
CREATE TABLE `oms_front_ware_order_detail_rpt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cover_front_ware_id` int(11) NOT NULL COMMENT '覆盖前置仓',
  `cover_front_ware_name` varchar(64) NOT NULL DEFAULT '' COMMENT '覆盖前置仓名称',
  `ware_id` int(11) NOT NULL COMMENT '发货仓',
  `ware_name` varchar(64) NOT NULL DEFAULT '' COMMENT '实际发货仓库名称',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `payment_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '支付时间',
  `cust_address` varchar(128) NOT NULL DEFAULT '' COMMENT '用户地址',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'sku名',
  `sku_num` int(11) NOT NULL DEFAULT '-1' COMMENT 'sku数量',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `county_id` int(11) NOT NULL DEFAULT '0' COMMENT '县区',
  `area_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '四级地址id',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '市',
  `county` varchar(64) NOT NULL DEFAULT '' COMMENT '县区',
  `area_name` varchar(64) NOT NULL DEFAULT '' COMMENT '四级地址名',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  `order_source` int(10) NOT NULL DEFAULT '0' COMMENT '订单来源 0默认 1PC 2微信 3IOS 4Android 1006零售仓 1007饿了么 1008线下零售店 ',
  `order_direct_source` int(10) NOT NULL DEFAULT '0' COMMENT '订单根来源 0默认 1PC 2微信 3IOS 4Android 1006零售仓 1007饿了么 1008线下零售店 ',
  PRIMARY KEY (`id`),
  KEY `idx_payment_date` (`payment_date`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29269756 DEFAULT CHARSET=utf8;

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
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `data_source` varchar(32) DEFAULT NULL,
  `is_twin` tinyint(2) DEFAULT '0' COMMENT '是否并行0否',
  `give_ripe` tinyint(2) unsigned DEFAULT '0' COMMENT '赠送时机0随单赠',
  `gift_explain` varchar(255) DEFAULT NULL COMMENT '商品说明',
  `gift_site` varchar(255) DEFAULT '0' COMMENT '适用站点',
  `give_type` tinyint(2) DEFAULT '0' COMMENT '赠品类型--商品：0，商品券：1',
  `real_order_amount` decimal(16,4) DEFAULT NULL COMMENT '本次客单价',
  `relate_activities` varchar(255) DEFAULT NULL COMMENT '关联的活动',
  `is_only_sms` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-否，1-是',
  `customer_type` varchar(16) DEFAULT '0' COMMENT '客户类型',
  `give_object` tinyint(2) DEFAULT '0' COMMENT '赠品对象--春播用户：0，第三方用户：1',
  `start_bind_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '开始赠券时间',
  `finish_bind_date` datetime NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '结束赠券时间',
  `bind_status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'binding status: 0 new, 1 running, 2 finished',
  `imported_candidate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否完成候选用户导入：0否， 1 是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_idx` (`code`) USING HASH,
  KEY `start_date_idx` (`start_date`) USING BTREE,
  KEY `end_date_idx` (`end_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单附赠活动';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附赠候选客户';

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
  PRIMARY KEY (`condition_id`),
  KEY `activity_id_idx` (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附赠条件表';

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
  PRIMARY KEY (`id`),
  KEY `a_id_idx` (`activity_id`) USING BTREE,
  KEY `c_id_idx` (`cust_id`) USING BTREE,
  KEY `order_i_idx` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附赠记录';

-- ----------------------------
-- Table structure for oms_gift_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_gift_info`;
CREATE TABLE `oms_gift_info` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '赠品id,主键自增',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_name` varchar(64) DEFAULT NULL,
  `gift_num` int(11) DEFAULT NULL COMMENT '赠品数量',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(2) unsigned DEFAULT '0' COMMENT '删除标记，默认0使用中',
  PRIMARY KEY (`gift_id`),
  KEY `activity_id_idx` (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附赠库存预警';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_saled_num4sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_saled_num4sku`;
CREATE TABLE `oms_saled_num4sku` (
  `sku_id` bigint(20) NOT NULL,
  `sales_num` int(11) DEFAULT '0',
  `create_datetime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sku销售统计信息表';

-- ----------------------------
-- Table structure for oms_sale_plan
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan`;
CREATE TABLE `oms_sale_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_order_id` varchar(32) NOT NULL COMMENT '销售计划编码',
  `order_channel` int(11) DEFAULT NULL COMMENT '订单类型(5:企销  6:第三方)',
  `is_primary_order` smallint(6) DEFAULT '0' COMMENT '是否主计划，0：否，1：是',
  `primary_order_id` varchar(32) DEFAULT NULL COMMENT '主计划编码',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `plan_order_num` int(11) DEFAULT '0' COMMENT '计划订单数目',
  `real_order_num` int(11) DEFAULT '0' COMMENT '实发订单数目',
  `plan_sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '计划销售额',
  `already_delivery_num` int(11) DEFAULT '0' COMMENT '已配送次数',
  `real_sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '实收金额',
  `ship_fee` decimal(16,4) DEFAULT '0.0000' COMMENT '运费总金额',
  `dept_name` varchar(32) DEFAULT NULL COMMENT '下单部门',
  `status` smallint(6) DEFAULT '0' COMMENT '计划状态',
  `is_pay` smallint(6) DEFAULT '0' COMMENT '是否已付款，0：未付款，1：已付款',
  `book_date` datetime DEFAULT NULL COMMENT '期望收货日期',
  `is_circle_delivery` smallint(6) DEFAULT '0' COMMENT '是否循环配送，0：非循环配送，1：循环配送',
  `circle_id` bigint(20) DEFAULT NULL COMMENT '循环配送id',
  `is_print_price` smallint(6) DEFAULT '0' COMMENT '清单上打印价格，0：不打印价格，1：打印价格',
  `invoice_type` smallint(6) DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(128) DEFAULT NULL COMMENT '发票抬头',
  `invoice_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `sale_user_id` bigint(20) DEFAULT NULL COMMENT '销售专员',
  `sale_user_name` varchar(32) DEFAULT NULL COMMENT '销售专员名称',
  `sale_user_mobile` varchar(32) DEFAULT NULL COMMENT '销售专员电话',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `third_order_id` varchar(32) DEFAULT NULL COMMENT '第三方id',
  `direct_dept_id` bigint(20) DEFAULT NULL COMMENT '销售专员直属部门id',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '下单部门id',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  `version` int(4) NOT NULL DEFAULT '1',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plan_order_id_UNIQUE` (`plan_order_id`) USING BTREE,
  KEY `primary_oi_idx` (`primary_order_id`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `third_oi_unidx` (`third_order_id`),
  KEY `idx_create_name` (`create_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4630866 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_sale_plan_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_address`;
CREATE TABLE `oms_sale_plan_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_order_id` varchar(32) DEFAULT NULL COMMENT '销售计划编码',
  `third_order_id` varchar(64) DEFAULT NULL COMMENT '第三方单号',
  `order_way` int(11) NOT NULL DEFAULT '1' COMMENT '下单方式(1:自动拉单，2:手动下单)',
  `consignee` varchar(32) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(32) DEFAULT NULL COMMENT '收货人手机',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '县（区）',
  `area_name` varchar(64) DEFAULT NULL COMMENT '环路信息',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '县区',
  `area_id` varchar(32) DEFAULT NULL COMMENT '四级地址id',
  `address` varchar(128) DEFAULT NULL COMMENT '详细地址',
  `book_date` datetime DEFAULT NULL COMMENT '期望收货日期',
  `is_generate_order` smallint(6) DEFAULT '0' COMMENT '是否生单，0：未生单，1：已生单',
  `real_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '实收金额',
  `order_id` bigint(20) DEFAULT NULL COMMENT '销售订单编码',
  `chunbo_coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '春播优惠金额(春播承认的)',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分,2-工商银行积分',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方优惠金额(第三方承认的)',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额支付金额',
  `total_product_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方商品总金额(不包含运费)',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  `order_source` int(10) NOT NULL DEFAULT '0' COMMENT '订单来源 9当当订单 1001下厨房订单1004民生订单1005工商订单1007饿了么订单',
  `pay_money` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '应付现金金额',
  `third_service_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '三方平台服务费',
  `chunbo_income` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '春播店铺实际收入',
  `third_shop_id` varchar(32) NOT NULL DEFAULT '' COMMENT '三方店铺id,如外卖店铺id等',
  `expect_ware_id` int(10) NOT NULL DEFAULT '0' COMMENT '期望发货仓库',
  `real_cust_name` varchar(32) NOT NULL DEFAULT '' COMMENT '实际提货人名称',
  `real_cust_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '实际提货人手机号',
  `third_parent_id` varchar(64) NOT NULL DEFAULT '' COMMENT '三方父单号:(eg悦店团购单号)',
  `shipment_type` smallint(6) NOT NULL DEFAULT '3' COMMENT '是否自提 3:不自提 6:自提',
  `is_special_car` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否使用专车 0 不使用 1 使用',
  `latitude` varchar(64) NOT NULL DEFAULT '0' COMMENT '地址坐标-纬度',
  `longitude` varchar(64) NOT NULL DEFAULT '0' COMMENT '地址坐标-经度',
  `mapProducer` varchar(2) NOT NULL DEFAULT '0' COMMENT '地图供应商 1:高德，2:百度，3:腾讯',
  `traffic_source` varchar(32) NOT NULL DEFAULT '' COMMENT '订单流量来源',
  `packageFee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '包装费',
  `community_id` int(11) DEFAULT NULL COMMENT '社区团ID',
  `community_name` varchar(128) DEFAULT NULL COMMENT '社区团名称',
  PRIMARY KEY (`address_id`),
  KEY `idx_plan_order_id` (`plan_order_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_third_order_id` (`third_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5543812 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_sale_plan_cancel
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_cancel`;
CREATE TABLE `oms_sale_plan_cancel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `third_order_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方订单号',
  `plan_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '销售计划号',
  `chunbo_order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '春播订单号',
  `order_source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源',
  `third_cust_id` varchar(64) NOT NULL DEFAULT '' COMMENT '三方系统客户编号',
  `refund_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '申请退款金额',
  `total_order_fee` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '订单总费用',
  `is_finish` smallint(11) NOT NULL DEFAULT '0' COMMENT '0:未完成 1:已完成',
  `finish_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '取消操作完成时间',
  `cancel_status` smallint(11) NOT NULL DEFAULT '0' COMMENT '0.新建 1.申请单创建失败 2.申请单创建成功  3.取消失败 4.取消成功',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '本记录创建时间',
  `cust_name` varchar(64) NOT NULL DEFAULT '' COMMENT '退款申请人',
  `cust_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '申请人电话',
  `cust_address` varchar(128) NOT NULL DEFAULT '' COMMENT '申请退回地址',
  `third_refund_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方申请退款单id',
  `push_is_success` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推送成功:0失败,1成功',
  `cancel_order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '取消状态0:默认，1：已插入，2：已推送。（美团可能调用取消和退款两个接口使用）',
  `refund_order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款状态0:默认，1：已插入，2：已推送。（美团可能调用取消和退款两个接口使用）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_third_order_id` (`third_order_id`) USING BTREE,
  KEY `idx_plan_order_id` (`plan_order_id`) USING BTREE,
  KEY `idx_third_cust_id` (`third_cust_id`) USING BTREE,
  KEY `idx_order_id` (`chunbo_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_sale_plan_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_coupon`;
CREATE TABLE `oms_sale_plan_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_order_id` varchar(64) DEFAULT '' COMMENT '销售计划编码',
  `third_order_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方订单号',
  `coupon_id` varchar(64) NOT NULL DEFAULT '',
  `coupon_type` smallint(6) NOT NULL COMMENT '1001优惠券,1002代金券,1003礼品卡,1004商品券',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠金额',
  `coupon_content` varchar(64) DEFAULT '' COMMENT '优惠内容',
  `coupon_owner` varchar(32) DEFAULT '' COMMENT '优惠券所属账号',
  `coupon_source` varchar(32) DEFAULT '' COMMENT '优惠券所属:第三方,春播',
  `create_date` timestamp NULL DEFAULT '1970-10-01 00:00:00',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品券sku',
  `other_params` varchar(64) DEFAULT '' COMMENT '优惠券扩展字段',
  PRIMARY KEY (`id`),
  KEY `tid_idx` (`third_order_id`),
  KEY `pid_idx` (`plan_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5333140 DEFAULT CHARSET=utf8 COMMENT='第三方订单优惠信息';

-- ----------------------------
-- Table structure for oms_sale_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_detail`;
CREATE TABLE `oms_sale_plan_detail` (
  `plan_order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '计划明细id',
  `plan_order_id` varchar(32) DEFAULT NULL COMMENT '销售计划编码',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku编码',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `UPC` varchar(32) DEFAULT NULL COMMENT 'UPC',
  `sku_num` int(11) DEFAULT '0' COMMENT '销售数量',
  `site_sale_price` decimal(16,4) DEFAULT '0.0000' COMMENT '网站售价',
  `sale_price` decimal(16,4) DEFAULT '0.0000' COMMENT '本次售价',
  `cash_coupon` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '三方承认优惠金额-直接写入订单明细, 不再分摊',
  `sale_type` int(11) DEFAULT '1' COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `ware_id` int(11) DEFAULT NULL COMMENT '出货仓库',
  `weight_cost_price` decimal(16,4) DEFAULT '0.0000' COMMENT '加权成本价',
  `expect_profit` decimal(16,4) DEFAULT NULL,
  `avail_sale_qty` int(11) DEFAULT '0' COMMENT '可卖数',
  `purchase_on_road` int(11) DEFAULT '0' COMMENT '采购在途',
  `book_date` timestamp NULL DEFAULT NULL COMMENT '期望收货时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `expect_ware_id` int(10) NOT NULL DEFAULT '0' COMMENT '期望发货仓库',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '明细状态:1-正常,-1-删除',
  `delete_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '删除时间',
  `src_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源单据明细ID来源:plan_order_detail_id',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipment_type` smallint(6) NOT NULL DEFAULT '3' COMMENT '配送类型:1-工作日送货,2-节假日,3-随时,4-定时达,5-极速达',
  `shipment_start_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '极速达,定时达:开始配送时间',
  `shipment_end_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '极速达,定时达:截止配送时间',
  `is_weight` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为称重品 0否 1是',
  `sku_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '称重品重量 0否 1是',
  `is_gift` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为赠品 0非赠品 1 赠品',
  `third_sku_order_id` varchar(64) DEFAULT NULL COMMENT '三方商品订单号（三方子订单号）',
  PRIMARY KEY (`plan_order_detail_id`),
  KEY `idx_plan_order_id` (`plan_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14128868 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_sale_plan_encrypt
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_encrypt`;
CREATE TABLE `oms_sale_plan_encrypt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `plan_order_id` varchar(32) DEFAULT NULL COMMENT '销售计划编号',
  `encrypt_detail` varchar(660) DEFAULT NULL COMMENT '详细地址密文',
  `encrypt_post_tel` varchar(550) DEFAULT NULL COMMENT '收件人电话密文',
  `encrypt_post_receiver` varchar(550) DEFAULT NULL COMMENT '收件人姓名密文',
  `sensitive_detail` varchar(200) DEFAULT NULL COMMENT '脱敏详细地址',
  `sensitive_post_tel` varchar(50) DEFAULT NULL COMMENT '脱敏收件人电话',
  `sensitive_post_receiver` varchar(100) DEFAULT NULL COMMENT '脱敏收件人姓名',
  `third_order_id` varchar(100) DEFAULT NULL COMMENT '三方订单号',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3126 DEFAULT CHARSET=utf8 COMMENT='销售计划脱敏表';

-- ----------------------------
-- Table structure for oms_sale_plan_notice
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_notice`;
CREATE TABLE `oms_sale_plan_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_order_id` varchar(32) NOT NULL COMMENT '销售计划编码',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '重试类型NoticeTypeEnum',
  `process_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '处理状态，0-待处理，1-处理成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `catch_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '抓取时间',
  `msg_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '消息发送时机',
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE,
  KEY `plan_order_id` (`plan_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5888374 DEFAULT CHARSET=utf8 COMMENT='销售计划公共通知表';

-- ----------------------------
-- Table structure for oms_sale_plan_operation
-- ----------------------------
DROP TABLE IF EXISTS `oms_sale_plan_operation`;
CREATE TABLE `oms_sale_plan_operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plan_order_id` varchar(32) DEFAULT NULL COMMENT '销售计划编码',
  `operation_code` varchar(32) DEFAULT NULL COMMENT '操作代码',
  `operator` varchar(32) DEFAULT NULL COMMENT '操作人',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_plan_order` (`plan_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4990074 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_third_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_order_detail`;
CREATE TABLE `oms_third_order_detail` (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称',
  `ware_id` int(11) DEFAULT NULL COMMENT '库房id',
  `sku_num` int(11) DEFAULT NULL COMMENT 'sku数量',
  `sku_price` decimal(16,4) DEFAULT NULL COMMENT 'sku价格',
  `promation_price` decimal(16,4) DEFAULT '0.0000' COMMENT '促销金额',
  `sale_price` decimal(16,4) DEFAULT '0.0000' COMMENT '销售价',
  `total_sale_price` decimal(10,4) DEFAULT '0.0000' COMMENT '销售价*数量,悦店可能不一样,所以保存原始数据',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `member_points` int(11) DEFAULT NULL COMMENT '客户积分',
  `member_points_price` decimal(16,4) DEFAULT NULL COMMENT '客户积分金额',
  `pay_money` decimal(16,4) DEFAULT NULL COMMENT '应付金额',
  `is_gift` smallint(6) DEFAULT NULL COMMENT '是否赠品',
  `promotion_id` varchar(32) DEFAULT NULL COMMENT '促销活动编号',
  `promation_origin` varchar(32) DEFAULT NULL COMMENT '促销来源',
  `gift_num` int(11) DEFAULT NULL COMMENT '赠品数量',
  `sale_type` smallint(6) DEFAULT NULL COMMENT '1:普通商品 2:预售商品',
  `sku_remark` varchar(256) DEFAULT NULL COMMENT '附加信息',
  `delivery_price` decimal(16,4) DEFAULT NULL,
  `sku_type` int(11) DEFAULT NULL COMMENT '类似零元购，加价购',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼券价格',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `paid_amount` decimal(16,4) DEFAULT NULL COMMENT '实付金额',
  `src_sku_id` varchar(50) DEFAULT NULL,
  `book_date` datetime DEFAULT NULL,
  `is_short_wait` smallint(6) DEFAULT NULL COMMENT '是否缺货等待 1 等待 0 不等待(抛异常)',
  `gift_type` smallint(6) DEFAULT NULL COMMENT '赠品类型,1 促销赠品 2市场赠品',
  `other_params` varchar(255) DEFAULT NULL COMMENT '扩展参数',
  `shipment_type` int(11) DEFAULT '0' COMMENT '配送方式：3随时，4定时达，5极速达',
  `shipment_start_time` datetime DEFAULT NULL COMMENT '定时达，极速达开始时间',
  `shipment_end_time` datetime DEFAULT NULL COMMENT '定时达，极速达截止时间',
  PRIMARY KEY (`order_detail_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=10692694 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Table structure for oms_third_order_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_order_log`;
CREATE TABLE `oms_third_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `order_source` smallint(6) DEFAULT NULL,
  `log_type` smallint(6) DEFAULT NULL COMMENT '日志类型',
  `content` mediumtext COMMENT '内容',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20342818 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oms_third_order_main
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_order_main`;
CREATE TABLE `oms_third_order_main` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL COMMENT '订单号',
  `order_type` int(11) DEFAULT NULL COMMENT '1:正向订单 2:退货单 3:换货取货单 4:换货配送单 5:漏发补发单 6:不退补发单 7:有货先发订单 100:取消订单 ',
  `order_source` int(11) DEFAULT NULL COMMENT '订单平台来源 1:PC 2:微信 3:移动客户端-IOS 4:移动客户端-ANDROID 5:WAP,',
  `cust_account` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `cust_telephone` varchar(32) DEFAULT NULL COMMENT '用户电话',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `cust_email` varchar(64) DEFAULT NULL COMMENT '客户邮箱',
  `pay_money` decimal(16,4) DEFAULT '0.0000' COMMENT '应付金额',
  `total_price` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `coupon_price` decimal(16,4) DEFAULT '0.0000' COMMENT '优惠价格',
  `delivery_price` decimal(16,4) DEFAULT '0.0000' COMMENT '运费',
  `member_points` decimal(16,4) DEFAULT '0.0000' COMMENT '积分',
  `order_date` datetime DEFAULT NULL COMMENT '第三方系统下单时间',
  `giftcard_price` decimal(16,4) DEFAULT '0.0000' COMMENT '礼品卡金额',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `book_date` datetime DEFAULT NULL COMMENT '预约送货日期',
  `province_id` int(11) DEFAULT NULL COMMENT '省（跟网站商量直接存名称）',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '县区',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮编',
  `cust_address` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `need_invoice` smallint(6) DEFAULT NULL COMMENT '1:需要发票 0:不需要发票',
  `is_payed` smallint(6) DEFAULT NULL COMMENT '1:已支付 0:未支付',
  `payment_type` smallint(6) DEFAULT NULL COMMENT '支付方式：1:在线支付 2:货到付款',
  `payment_channel` varchar(32) DEFAULT NULL COMMENT '支付渠道',
  `parent_payment_channel` varchar(32) DEFAULT NULL COMMENT '父支付渠道',
  `payment_account` varchar(32) DEFAULT NULL COMMENT '支付帐号',
  `paid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已付金额',
  `shipment_type` smallint(6) DEFAULT NULL COMMENT '履约类型:工作日送货，节假日',
  `order_flag` varchar(64) DEFAULT NULL COMMENT '订单标示（待用字段）',
  `shipment_start_time` datetime DEFAULT NULL COMMENT '送货开始时间',
  `shipment_end_time` datetime DEFAULT NULL COMMENT '送货结束时间',
  `weigth` decimal(12,4) DEFAULT NULL COMMENT '总重量',
  `member_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '积分金额',
  `delivery_type` smallint(6) DEFAULT NULL COMMENT '配送方式:1:快递,2:邮寄',
  `payment_date` datetime DEFAULT NULL COMMENT '支付时间',
  `finish_date` datetime DEFAULT NULL COMMENT '完成时间',
  `create_date` datetime DEFAULT NULL COMMENT '本系统创建时间',
  `cash_coupon` decimal(16,4) DEFAULT '0.0000' COMMENT '代金券',
  `account_money` decimal(16,4) DEFAULT '0.0000' COMMENT '帐户余额',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户登录id',
  `order_remark` varchar(256) DEFAULT NULL COMMENT '订单附加信息',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `traffic_source` varchar(256) DEFAULT NULL COMMENT '订单流量来源 1:CPS等平台 2:导航网站等 \n\n  3:特定广告等（跟踪码）4:域名直接访问',
  `session_id` varchar(64) DEFAULT NULL COMMENT '用户登录sessionid',
  `delivery_area_id` int(11) DEFAULT NULL COMMENT '配送区域id',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `county` varchar(64) DEFAULT NULL COMMENT '区',
  `trade_type` int(11) DEFAULT '1' COMMENT '三方传递交易类型',
  `business_type` int(11) DEFAULT NULL COMMENT '1-普通商品购买 2-他人代付',
  `chunbo_order_id` bigint(20) DEFAULT NULL COMMENT '春播订单id',
  `invoice_type` varchar(64) DEFAULT NULL,
  `invoice_title` varchar(64) DEFAULT NULL,
  `invoice_content` varchar(255) DEFAULT NULL,
  `freight_type` int(11) DEFAULT '0' COMMENT '运费类型 0 无运费 1 普通 2 满减 3 运费券',
  `real_cust_name` varchar(32) NOT NULL DEFAULT '' COMMENT '实际提货人名称',
  `real_cust_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '实际提货人手机号',
  `third_parent_id` varchar(64) NOT NULL DEFAULT '' COMMENT '三方父单号:(eg悦店团购单号)',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '三方指定仓库',
  `plan_order_id` varchar(64) NOT NULL DEFAULT '' COMMENT '销售计划ID（悦店订单需要提前生成销售计划号）',
  `is_special_car` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否使用专车 0 不使用 1 使用',
  `latitude` varchar(64) NOT NULL DEFAULT '0' COMMENT '地址坐标-纬度',
  `longitude` varchar(64) NOT NULL DEFAULT '0' COMMENT '地址坐标-经度',
  `mapProducer` varchar(2) NOT NULL DEFAULT '0' COMMENT '地图供应商 1:高德，2:百度，3:腾讯',
  `community_id` int(11) DEFAULT NULL COMMENT '社区团ID',
  `community_name` varchar(128) DEFAULT NULL COMMENT '社区团名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_oms_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3426084 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Table structure for oms_third_order_process
-- ----------------------------
DROP TABLE IF EXISTS `oms_third_order_process`;
CREATE TABLE `oms_third_order_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `order_source` smallint(6) DEFAULT NULL COMMENT '订单来源',
  `order_state` int(11) DEFAULT NULL COMMENT '订单状态 1 正向 100取消',
  `status` varchar(45) DEFAULT NULL COMMENT '0 新建 1 处理成功 -1 失败',
  `version` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `order_channel` tinyint(4) DEFAULT '0' COMMENT '订单来源渠道',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidx_oms_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4273230 DEFAULT CHARSET=utf8 COMMENT='第三方订单处理表';

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `id` int(4) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `ware_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库编号',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域id',
  `ware_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库名称',
  `postal_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '邮政编号',
  `ware_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库地址',
  `ware_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '仓库类型  0：自有仓库；1：供应商仓库',
  `contact_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库联系人',
  `contact_phone_no` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '联系人电话',
  `is_valid` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属分公司id',
  `org_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '所属分公司名称',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库所在省',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库所在省ID',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库所在市',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库所在市ID',
  `county` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库所在区',
  `parentWare` varchar(32) DEFAULT '' COMMENT '父仓库',
  PRIMARY KEY (`ware_id`),
  KEY `warehouseI1` (`ware_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

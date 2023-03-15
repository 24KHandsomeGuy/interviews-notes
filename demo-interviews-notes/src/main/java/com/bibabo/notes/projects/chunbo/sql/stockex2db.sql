/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - stockex2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stockex2` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `address_point_tt` */

CREATE TABLE `address_point_tt` (
  `cust_id` bigint(20) DEFAULT NULL,
  `city` text,
  `province` text,
  `county` text,
  `custaddress` longtext,
  `min_create_date` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `deliver_address` */

CREATE TABLE `deliver_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `consignee` varchar(64) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `delivery_id` varchar(20) NOT NULL COMMENT '四级地址',
  `address` varchar(128) NOT NULL,
  `address_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '地址详情',
  `mobile` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记 0:未删除 1:删除',
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `address_type` varchar(20) DEFAULT NULL COMMENT '地址分类',
  `remark` text COMMENT '备注',
  `tag_type` tinyint(4) DEFAULT '0' COMMENT '标签类型 1:家 2:公司 3:自定义',
  `tag_content` varchar(50) DEFAULT '' COMMENT '标签内容',
  `disabled_incubator` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁用保温箱 1:禁用 0:不禁用',
  `lat` varchar(255) NOT NULL COMMENT '维度',
  `lng` varchar(255) NOT NULL COMMENT '经度',
  `map_type` tinyint(4) DEFAULT '0' COMMENT '地图类型（1：高德，2：百度，3：腾讯）',
  `bd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '百度经纬度',
  `gd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '高德经纬度',
  `diff_distance` int(11) NOT NULL DEFAULT '0' COMMENT '相差距离',
  `diff_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '原因',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4152758 DEFAULT CHARSET=utf8;

/*Table structure for table `deliver_address_tmp` */

CREATE TABLE `deliver_address_tmp` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `consignee` varchar(64) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `delivery_id` varchar(20) NOT NULL COMMENT '四级地址',
  `address` varchar(128) NOT NULL,
  `address_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '地址详情',
  `mobile` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记 0:未删除 1:删除',
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `address_type` varchar(20) DEFAULT NULL COMMENT '地址分类',
  `remark` text COMMENT '备注',
  `tag_type` tinyint(4) DEFAULT '0' COMMENT '标签类型 1:家 2:公司 3:自定义',
  `tag_content` varchar(50) DEFAULT '' COMMENT '标签内容',
  `disabled_incubator` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁用保温箱 1:禁用 0:不禁用',
  `lat` varchar(255) NOT NULL COMMENT '维度',
  `lng` varchar(255) NOT NULL COMMENT '经度',
  `map_type` tinyint(4) DEFAULT '0' COMMENT '地图类型（1：高德，2：百度，3：腾讯）',
  `bd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '百度经纬度',
  `gd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '高德经纬度',
  `diff_distance` int(11) NOT NULL DEFAULT '0' COMMENT '相差距离',
  `diff_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '原因',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4152758 DEFAULT CHARSET=utf8;

/*Table structure for table `deliver_address_tmp_1` */

CREATE TABLE `deliver_address_tmp_1` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `consignee` varchar(64) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `delivery_id` varchar(20) NOT NULL COMMENT '四级地址',
  `address` varchar(128) NOT NULL,
  `address_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '地址详情',
  `mobile` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标记 0:未删除 1:删除',
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `address_type` varchar(20) DEFAULT NULL COMMENT '地址分类',
  `remark` text COMMENT '备注',
  `tag_type` tinyint(4) DEFAULT '0' COMMENT '标签类型 1:家 2:公司 3:自定义',
  `tag_content` varchar(50) DEFAULT '' COMMENT '标签内容',
  `disabled_incubator` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁用保温箱 1:禁用 0:不禁用',
  `lat` varchar(255) NOT NULL COMMENT '维度',
  `lng` varchar(255) NOT NULL COMMENT '经度',
  `map_type` tinyint(4) DEFAULT '0' COMMENT '地图类型（1：高德，2：百度，3：腾讯）',
  `bd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '百度经纬度',
  `gd_lng_lat` varchar(64) NOT NULL DEFAULT '' COMMENT '高德经纬度',
  `diff_distance` int(11) NOT NULL DEFAULT '0' COMMENT '相差距离',
  `diff_reason` varchar(128) NOT NULL DEFAULT '' COMMENT '原因',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4152758 DEFAULT CHARSET=utf8;

/*Table structure for table `dictionary` */

CREATE TABLE `dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `elec_fence_grid` */

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

/*Table structure for table `elec_fence_grid_point` */

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

/*Table structure for table `elec_fence_marker` */

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='电子围栏站点标记';

/*Table structure for table `elec_fence_opt_log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='电子围栏操作日志';

/*Table structure for table `elec_fence_point` */

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
) ENGINE=InnoDB AUTO_INCREMENT=178416 DEFAULT CHARSET=utf8 COMMENT='电子围栏 经纬度点集合';

/*Table structure for table `elec_fence_station` */

CREATE TABLE `elec_fence_station` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '站定名称',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222334 DEFAULT CHARSET=utf8 COMMENT='电子围栏站点信息';

/*Table structure for table `id_generator` */

CREATE TABLE `id_generator` (
  `id_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'ID英文缩写',
  `step` int(11) DEFAULT NULL COMMENT '步长',
  `current_id` bigint(20) DEFAULT NULL COMMENT '当前ID',
  `descreption` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID简介',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  UNIQUE KEY `Id_generatorI1` (`id_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ID generator';

/*Table structure for table `inv_tran` */

CREATE TABLE `inv_tran` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `trans_id` bigint(20) NOT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '主事务所在仓库',
  `loc_id_2nd` int(11) DEFAULT NULL COMMENT '发货事务：收货仓库， 收货事务：发货仓库',
  `owner_id` int(11) DEFAULT NULL,
  `inv_type` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `trans_qty` decimal(10,4) DEFAULT '0.0000',
  `origin_num` int(11) DEFAULT '0' COMMENT '原始单据数',
  `left_num` int(11) DEFAULT '0' COMMENT '剩余数',
  `dest_system` int(11) DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_type` int(11) DEFAULT NULL,
  `src_bill_id` bigint(20) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `return_code` int(11) DEFAULT NULL,
  `return_reason` varchar(128) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `return_datetime` datetime DEFAULT NULL,
  `from_receipt` bigint(20) DEFAULT NULL,
  `from_receipt_code` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_tranIunique` (`trans_id`) USING BTREE,
  KEY `inv_tranI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `inv_tranI3` (`entry_datetime`) USING BTREE,
  KEY `inv_tranI4` (`src_bill_id`) USING BTREE,
  KEY `inv_tranI1` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=513443 DEFAULT CHARSET=utf8;

/*Table structure for table `inv_tran_tmp` */

CREATE TABLE `inv_tran_tmp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仅作为表复制使用',
  `trans_id` bigint(20) NOT NULL,
  `loc_id` int(11) DEFAULT NULL COMMENT '主事务所在仓库',
  `loc_id_2nd` int(11) DEFAULT NULL COMMENT '发货事务：收货仓库， 收货事务：发货仓库',
  `owner_id` int(11) DEFAULT NULL,
  `inv_type` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `lot` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `trans_qty` decimal(10,4) DEFAULT '0.0000',
  `origin_num` int(11) DEFAULT '0' COMMENT '原始单据数',
  `left_num` int(11) DEFAULT '0' COMMENT '剩余数',
  `dest_system` int(11) DEFAULT NULL,
  `src_order_id` bigint(20) DEFAULT NULL,
  `src_order_no` varchar(32) DEFAULT NULL,
  `src_order_type` int(11) DEFAULT NULL,
  `src_bill_id` bigint(20) DEFAULT NULL,
  `src_bill_no` varchar(32) DEFAULT NULL,
  `return_code` int(11) DEFAULT NULL,
  `return_reason` varchar(128) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `return_datetime` datetime DEFAULT NULL,
  `from_receipt` bigint(20) DEFAULT NULL,
  `from_receipt_code` varchar(32) DEFAULT NULL,
  `entry_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_tranIunique` (`trans_id`) USING BTREE,
  KEY `inv_tranI2` (`sku_id`,`lot`,`expire_date`) USING BTREE,
  KEY `inv_tranI3` (`entry_datetime`) USING BTREE,
  KEY `inv_tranI4` (`src_bill_id`) USING BTREE,
  KEY `inv_tranI1` (`src_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032790 DEFAULT CHARSET=utf8;

/*Table structure for table `jsd_candinate_address` */

CREATE TABLE `jsd_candinate_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(255) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `jingdu` varchar(100) DEFAULT NULL COMMENT '经度',
  `weidu` varchar(100) DEFAULT NULL COMMENT '维度',
  `la_type` smallint(255) DEFAULT NULL COMMENT '经纬度类型',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(255) NOT NULL DEFAULT '0' COMMENT '用来计算坐标，0新增， 1 计算成功， -1计算失败',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '当日达ware_id',
  `drd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '控制计算是否是胡家园的状态，0新增， 1 已计算， -2失败不再重试',
  `jsd_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '极速达wareId',
  `jsd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '极速达wareId计算控制：0新增， 1 已计算， -2失败不再重试',
  PRIMARY KEY (`id`),
  KEY `idx_updatetime` (`update_time`),
  KEY `idx_address` (`cust_address`)
) ENGINE=InnoDB AUTO_INCREMENT=735521 DEFAULT CHARSET=utf8;

/*Table structure for table `jsd_candinate_address2` */

CREATE TABLE `jsd_candinate_address2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(255) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `county` varchar(32) DEFAULT NULL,
  `jingdu` varchar(100) DEFAULT NULL COMMENT '经度',
  `weidu` varchar(100) DEFAULT NULL COMMENT '维度',
  `la_type` smallint(255) DEFAULT NULL COMMENT '经纬度类型',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(255) NOT NULL DEFAULT '0' COMMENT '用来计算坐标，0新增， 1 计算成功， -1计算失败',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '当日达ware_id',
  `drd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '控制计算是否是胡家园的状态，0新增， 1 已计算， -2失败不再重试',
  `jsd_ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '极速达wareId',
  `jsd_status` smallint(255) NOT NULL DEFAULT '0' COMMENT '极速达wareId计算控制：0新增， 1 已计算， -2失败不再重试',
  PRIMARY KEY (`id`),
  KEY `idx_updatetime` (`update_time`),
  KEY `idx_address` (`cust_address`)
) ENGINE=InnoDB AUTO_INCREMENT=735521 DEFAULT CHARSET=utf8;

/*Table structure for table `odometer` */

CREATE TABLE `odometer` (
  `odo_type` varchar(10) NOT NULL COMMENT '前缀',
  `length` int(11) NOT NULL COMMENT '编号数字部分长度',
  `current_no` int(11) NOT NULL COMMENT '编号当前数字部分',
  `date_flag` date DEFAULT NULL COMMENT '日期， 如果为空表示编号不按照日期排列',
  `comments` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '简介',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `pre_fix` varchar(8) NOT NULL DEFAULT '' COMMENT '前缀',
  PRIMARY KEY (`odo_type`),
  UNIQUE KEY `fid_UNIQUE` (`odo_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编号生成器';

/*Table structure for table `oms_order_detail` */

CREATE TABLE `oms_order_detail` (
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单明细号',
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
  PRIMARY KEY (`order_detail_id`),
  KEY `oms_order_detail_idx` (`order_id`) USING BTREE,
  KEY `idx_book_date` (`book_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

/*Table structure for table `oms_order_main` */

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
  `third_order_id` varchar(32) DEFAULT NULL COMMENT '第三方订单id',
  `freight_type` int(11) DEFAULT '0' COMMENT '运费类型 0 无运费 1 普通 2 满减 3 运费券',
  `third_cust_id` varchar(64) DEFAULT '' COMMENT '第三方系统客户编号',
  `third_points` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分',
  `third_points_price` decimal(16,4) DEFAULT '0.0000' COMMENT '第三方系统积分的金额',
  `third_points_type` smallint(6) DEFAULT '0' COMMENT '第三方系统积分类型，0-不使用第三方系统积分，1-宝钢兜礼积分',
  `payment_serial_number` varchar(32) DEFAULT '' COMMENT '支付流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`) USING BTREE,
  KEY `custid_index` (`cust_id`) USING BTREE,
  KEY `idx_root_pid` (`root_parent_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_direct_parent_id` (`direct_parent_id`) USING BTREE,
  KEY `idx_third_order_id` (`third_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17350616 DEFAULT CHARSET=utf8 COMMENT='订单主表';

/*Table structure for table `oms_order_status` */

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17332204 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

/*Table structure for table `order_assign_station` */

CREATE TABLE `order_assign_station` (
  `order_id` bigint(20) NOT NULL COMMENT '订单ID(商家订单号)',
  `order_type` int(11) DEFAULT NULL COMMENT '0普通订单，1上门换货，2上门退货',
  `station_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点ID',
  `station_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '站点名称',
  `lng` double NOT NULL DEFAULT '0' COMMENT '经度',
  `lat` double NOT NULL DEFAULT '0' COMMENT '维度',
  `baidu_addr_type` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '百度地址属性',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期， 接单日期',
  UNIQUE KEY `dms_assign_addr_hI1` (`order_id`) USING BTREE,
  KEY `dms_assign_addr_hI2` (`entry_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分单主表';

/*Table structure for table `out_status_upload_wdm_que` */

CREATE TABLE `out_status_upload_wdm_que` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '调拨出单据ID',
  `order_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '调拨出单据编号',
  `status` int(6) DEFAULT NULL COMMENT '调拨出单据状态：1',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_datetime` timestamp NOT NULL COMMENT '创建时间',
  `response_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '响应时间',
  `return_status` int(11) DEFAULT '0' COMMENT '返回状态',
  `error_code` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '错误信息',
  `last_send_time` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '最后响应时间',
  PRIMARY KEY (`id`),
  KEY `upload_wdm_queI1` (`order_id`) USING BTREE,
  KEY `upload_wdm_queI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出上传委外系统队列表';

/*Table structure for table `sku_main_bak` */

CREATE TABLE `sku_main_bak` (
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `sku_code` varchar(32) DEFAULT NULL COMMENT 'sku编码',
  `sku_status` smallint(6) DEFAULT NULL COMMENT 'sku状态',
  `sku_type` smallint(6) DEFAULT NULL COMMENT 'sku类型',
  `sku_title` varchar(128) DEFAULT NULL COMMENT '商品副标题',
  `sku_short_name` varchar(32) DEFAULT NULL COMMENT '助记码',
  `is_raw_material` smallint(6) DEFAULT NULL COMMENT '是否原材料 1:是 0:否',
  `sku_attr` smallint(6) DEFAULT NULL COMMENT '商品属性 1:自营 2:虚拟 3:预售',
  `length` decimal(12,4) DEFAULT NULL COMMENT '长',
  `width` decimal(12,4) DEFAULT NULL COMMENT '宽',
  `height` decimal(16,4) DEFAULT NULL COMMENT '高',
  `weight` decimal(12,4) DEFAULT NULL COMMENT '毛重',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位',
  `is_expire_flag` smallint(6) DEFAULT NULL COMMENT '1:有效期标示 0:非有效期',
  `valid_days` int(11) DEFAULT NULL COMMENT '有效期天数',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `is_serial` smallint(6) DEFAULT NULL COMMENT '1:序列号管理 0:非序列号管理',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `country_code_id` int(11) DEFAULT NULL COMMENT '商品产地',
  `is_air_forbid` smallint(6) DEFAULT NULL COMMENT '1:航空禁运 0:航空不禁运',
  `is_precious` smallint(6) DEFAULT NULL COMMENT '1:贵重物品 0:普通品',
  `is_liquid` smallint(6) DEFAULT NULL COMMENT '液体标示 1:液体 0:非液体',
  `delivery_type` smallint(6) DEFAULT NULL COMMENT '配送类型 1:无限制 2:海运',
  `is_open_check` smallint(6) DEFAULT '0' COMMENT '1:开箱检查 0:不开箱',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '一般纳税税码',
  `is_seasonal` smallint(6) DEFAULT NULL COMMENT '1:季节性商品 2:非季节性商品',
  `is_virtual` smallint(6) DEFAULT '0' COMMENT '1:虚拟商品 0:非虚拟商品',
  `is_lot` smallint(6) DEFAULT '1' COMMENT '1:批次管理 0:非批次管理',
  `seasonal_start_date` datetime DEFAULT NULL COMMENT '季节开始时间',
  `seasonal_end_date` datetime DEFAULT NULL COMMENT '季节结束时间',
  `temp_area_id` int(11) NOT NULL COMMENT '温区id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '促销价',
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `price` decimal(16,4) DEFAULT NULL COMMENT '标价',
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类',
  `province_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `is_import` smallint(11) DEFAULT NULL COMMENT '1:进口商品,2:非进口商品',
  `sale_tax_code_id` int(11) DEFAULT NULL COMMENT '销项税',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息表';

/*Table structure for table `suggest` */

CREATE TABLE `suggest` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `narrative` varchar(500) NOT NULL DEFAULT '' COMMENT '叙述',
  `priority` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` varchar(1) NOT NULL DEFAULT 'N' COMMENT '删除标识',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'email',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `source_path` varchar(200) NOT NULL DEFAULT '' COMMENT '建议源路径',
  `type` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '建议分类',
  PRIMARY KEY (`id`),
  KEY `suggest_i_phone` (`phone`) USING BTREE,
  KEY `suggest_i_entryId` (`entry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集表';

/*Table structure for table `suggest_image` */

CREATE TABLE `suggest_image` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `description` varchar(100) DEFAULT NULL COMMENT '详细描述',
  PRIMARY KEY (`id`),
  KEY `suggest_image_i_sid` (`suggest_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集图片表';

/*Table structure for table `suggest_log` */

CREATE TABLE `suggest_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_code` varchar(50) NOT NULL DEFAULT '' COMMENT '操作编码',
  `entry_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志生成时间',
  `execute_time` int(11) NOT NULL DEFAULT '0' COMMENT '执行时间',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '详细描述',
  `request_param` varchar(500) NOT NULL DEFAULT '' COMMENT '请求参数',
  PRIMARY KEY (`id`),
  KEY `suggest_log_I_entryId` (`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日录资料表';

/*Table structure for table `suggest_message_board` */

CREATE TABLE `suggest_message_board` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `message` varchar(200) NOT NULL DEFAULT '' COMMENT '叙述',
  `type` char(1) NOT NULL DEFAULT '0' COMMENT '消息类型',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `suggest_mb_i_sid` (`suggest_id`) USING BTREE,
  KEY `suggest_mb_i_entryName` (`entry_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息建议留言表';

/*Table structure for table `suggest_state` */

CREATE TABLE `suggest_state` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `suggest_id` int(9) NOT NULL COMMENT '建议ID',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `entry_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `entry_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `suggest_state_i_sid` (`suggest_id`) USING BTREE,
  KEY `suggest_state_i_entryName` (`entry_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息建议收集状态表';

/*Table structure for table `temp_opt` */

CREATE TABLE `temp_opt` (
  `trans_qty` int(11) NOT NULL,
  `trans_type` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tr_auto_audit_process` */

CREATE TABLE `tr_auto_audit_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '调拨申请单ID',
  `status` smallint(4) NOT NULL DEFAULT '0' COMMENT '状态: 0新增, -1失败, 1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COMMENT='调拨申请自动审核表';

/*Table structure for table `tr_in_detail` */

CREATE TABLE `tr_in_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `plan_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '计划调入数量--调出单计划调出数量---创建时直接生成',
  `order_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '应该调入数量， 实际出库数量---创建时直接生成',
  `rec_qty1` decimal(10,4) DEFAULT '0.0000' COMMENT '实际收货数量正品-实际收货时反写',
  `rec_qty2` decimal(10,4) DEFAULT '0.0000' COMMENT '实际收货数量残品-实际收货时反写',
  `discrep_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '差异数量-实际收货时反写(plan_qty-rec_qty1-rec_qty2)',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `loss_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '丢失货数量',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  PRIMARY KEY (`id`),
  KEY `tr_in_detailI1` (`order_id`) USING BTREE,
  KEY `tr_in_detaill2` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1321004 DEFAULT CHARSET=utf8 COMMENT='调拨ru明细表';

/*Table structure for table `tr_in_lot_inv` */

CREATE TABLE `tr_in_lot_inv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨ru单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型1：正品， 2：产品',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `rec_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传汇总反写',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `loss_flag` smallint(2) DEFAULT '0' COMMENT '丢失标识：0，没有丢失；1，丢失',
  PRIMARY KEY (`id`),
  KEY `tr_in_lot_invI1` (`order_id`) USING BTREE,
  KEY `tr_in_lot_invl2` (`sku_id`,`lot`,`mfg_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523654 DEFAULT CHARSET=utf8 COMMENT='调拨入收货库存批次明细表';

/*Table structure for table `tr_in_order` */

CREATE TABLE `tr_in_order` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `order_code` varchar(32) NOT NULL COMMENT '调拨入单据编号',
  `request_id` bigint(20) NOT NULL COMMENT '来源调拨申请单ID',
  `request_no` varchar(32) NOT NULL COMMENT '来源调拨申请单编号',
  `from_loc_id` int(11) NOT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态 0:待入库 1：已入库',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `temp_group_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `temp_group_name` varchar(32) DEFAULT NULL COMMENT '配送温区名称',
  `cross_dock` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否中转调拨，1是，0否',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `p_order_id` bigint(20) DEFAULT NULL COMMENT '关联采购单ID',
  `sku_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '订单数量',
  `rec_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '正品收货数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '订单品种数量',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注--创建时带入',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间--创建时带入',
  `rec_datetime` datetime DEFAULT NULL COMMENT '实际收货时间--实际收货时反写',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间--创建时带入',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人--创建时带入',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间--创建时带入',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称--创建时直接生成',
  `ship_datetime` datetime DEFAULT NULL COMMENT '实际出库时间--创建时直接生成',
  `rec_qty2` decimal(10,4) DEFAULT '0.0000' COMMENT '残品收货数量',
  `loss_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '丢失货数量',
  `use_type` smallint(6) DEFAULT '48' COMMENT '调拨类型 48:正常调拨 49:委外调拨',
  UNIQUE KEY `tr_out_orderI1` (`order_id`) USING BTREE,
  KEY `tr_in_orderI2` (`order_code`) USING BTREE,
  KEY `tr_in_orderI3` (`request_id`) USING BTREE,
  KEY `tr_in_orderI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨入单据';

/*Table structure for table `tr_in_status` */

CREATE TABLE `tr_in_status` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨入单id',
  `status` smallint(11) DEFAULT NULL COMMENT '状态 0:待入库 1：已入库',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  KEY `tr_out_statusI2` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨入状态表';

/*Table structure for table `tr_order_request` */

CREATE TABLE `tr_order_request` (
  `request_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请单ID',
  `request_no` varchar(32) DEFAULT NULL COMMENT '调拨出单据编号',
  `from_loc_id` int(11) DEFAULT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:新增 1:送审 2:审核通过 3:驳回 4:作废',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '申请数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `apply_name` varchar(32) DEFAULT NULL COMMENT '送审人名称',
  `apply_datetime` datetime DEFAULT NULL COMMENT '送审时间',
  `refuse_name` varchar(255) DEFAULT NULL COMMENT '驳回人',
  `refuse_datetime` datetime DEFAULT NULL COMMENT '驳回时间',
  `total_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '总成本',
  `src_request_id` varchar(32) DEFAULT '' COMMENT '来源单据ID, 判重使用-拼接来源系统和单据号',
  `use_type` smallint(5) unsigned DEFAULT '48' COMMENT '48:正常调拨 49:委外调拨 1015:悦店商品调拨',
  `total_out_qty` decimal(10,2) DEFAULT '0.00' COMMENT '实际出库数量',
  PRIMARY KEY (`request_id`),
  KEY `tr_order_requestI2` (`request_no`) USING BTREE,
  KEY `tr_order_requesti3` (`entry_datetime`) USING BTREE,
  KEY `tr_order_requesti4` (`approve_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47094 DEFAULT CHARSET=utf8 COMMENT='调拨申请单';

/*Table structure for table `tr_order_request_detail` */

CREATE TABLE `tr_order_request_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL COMMENT '申请单ID',
  `request_line_no` int(11) DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) DEFAULT '0' COMMENT '商品编号',
  `plan_qty` decimal(10,2) DEFAULT '0.00' COMMENT '计划调拨数量',
  `total_out_qty` decimal(10,2) DEFAULT '0.00' COMMENT '原始调拨出的数量',
  `available_qty` decimal(14,4) DEFAULT '0.0000' COMMENT '创建时：调出仓可卖数，只为support使用',
  `intran_in_qty` decimal(10,2) DEFAULT '0.00' COMMENT '创建时：采购在途数量，只为support使用',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `erp_qty` decimal(10,2) DEFAULT '0.00' COMMENT '创建时：残品库存数量，只为support使用',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `temp_area_id` int(11) NOT NULL COMMENT '温区id',
  `sku_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品成本',
  `first_class_name` varchar(24) NOT NULL DEFAULT '' COMMENT '商品一级分类',
  `store_temperature` varchar(24) NOT NULL DEFAULT '' COMMENT '商品存储温区',
  `shelf_days` int(11) NOT NULL DEFAULT '0' COMMENT '保质期天数',
  `purchase_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品采购价格',
  `sales_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品销售价格',
  `yesteryday_sales` int(11) NOT NULL DEFAULT '0' COMMENT '商品昨天销售',
  `seven_day_avg_sales` int(11) NOT NULL DEFAULT '0' COMMENT '商品过去7天均销',
  `dest_ware_available_qty` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '门店库存:调入仓的可卖数',
  PRIMARY KEY (`id`),
  KEY `tr_order_request_detaili3` (`entry_datetime`) USING BTREE,
  KEY `tr_order_request_detaili4` (`sku_id`) USING BTREE,
  KEY `tr_order_request_detailI1` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1942458 DEFAULT CHARSET=utf8 COMMENT='调拨申请单表体';

/*Table structure for table `tr_order_request_que` */

CREATE TABLE `tr_order_request_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `request_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请单ID',
  `task_type` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型',
  `que_status` int(11) NOT NULL DEFAULT '0' COMMENT '0失败1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_request_id` (`request_id`,`task_type`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4348 DEFAULT CHARSET=utf8 COMMENT='调拨申请单队列记录异步处理的任务';

/*Table structure for table `tr_order_request_status` */

CREATE TABLE `tr_order_request_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL COMMENT '申请单ID',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:新增 1:送审 2:审核通过 3:驳回 4:作废',
  `status_name` varchar(32) DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198905 DEFAULT CHARSET=utf8 COMMENT='调拨申请单状态流水';

/*Table structure for table `tr_out_detail` */

CREATE TABLE `tr_out_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `order_qty` decimal(10,2) DEFAULT '0.00' COMMENT '订单商品数量（通知数量）',
  `available_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '创建时：调出仓可卖数，只为support/报表展示使用',
  `intran_in_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '创建时：采购在途数量，只为support/报表展示使用',
  `ship_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传反写',
  `discrep_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '差异数量',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  `update_datetime` datetime DEFAULT NULL COMMENT '进更新时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `version` int(11) DEFAULT '0' COMMENT '乐观锁',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `sku_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '商品成本',
  PRIMARY KEY (`id`),
  KEY `tr_out_detailI1` (`order_id`) USING BTREE,
  KEY `tr_out_detaill2` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1326702 DEFAULT CHARSET=utf8 COMMENT='调拨出明细表';

/*Table structure for table `tr_out_issue_que` */

CREATE TABLE `tr_out_issue_que` (
  `loc_id` int(11) DEFAULT NULL COMMENT 'warehuse ID， 下发仓库ID',
  `order_id` bigint(20) NOT NULL COMMENT '调拨出orderID',
  `status` int(11) DEFAULT '0' COMMENT '0 已下发, 1 未下发',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建日期',
  `issue_datetime` datetime DEFAULT NULL COMMENT '下发日期',
  UNIQUE KEY `tr_out_issue_queI1` (`order_id`) USING BTREE,
  KEY `tr_out_issue_queI2` (`expect_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨系统-调拨订单下发WMS队列';

/*Table structure for table `tr_out_lot_inv` */

CREATE TABLE `tr_out_lot_inv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `inv_type` int(11) DEFAULT NULL COMMENT '库存类型1：正品， 2：产品',
  `mfg_date` date DEFAULT NULL COMMENT '生产日期',
  `shelf_life_days` int(20) DEFAULT NULL COMMENT '保质期天数',
  `expire_date` date DEFAULT NULL COMMENT '保质期截止日期',
  `lot` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `ship_qty` decimal(10,4) DEFAULT '0.0000' COMMENT '发出数量 -- 出库数据上传汇总反写',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) DEFAULT NULL COMMENT '制单人',
  PRIMARY KEY (`id`),
  KEY `tr_out_lot_invI1` (`order_id`) USING BTREE,
  KEY `tr_out_lot_invl2` (`sku_id`,`lot`,`mfg_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1367081 DEFAULT CHARSET=utf8 COMMENT='调拨出出库库存批次明细表';

/*Table structure for table `tr_out_order` */

CREATE TABLE `tr_out_order` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `order_code` varchar(32) NOT NULL COMMENT '调拨出单据编号',
  `request_id` bigint(20) NOT NULL COMMENT '来源调拨申请单ID',
  `request_no` varchar(32) NOT NULL COMMENT '来源调拨申请单编号',
  `from_loc_id` int(11) NOT NULL COMMENT '发货仓库ID',
  `from_loc_name` varchar(32) DEFAULT NULL COMMENT '发货仓库名称',
  `to_loc_id` int(32) DEFAULT NULL COMMENT '收货仓库id',
  `to_loc_name` varchar(32) DEFAULT NULL COMMENT '收货仓库名称',
  `status` smallint(6) DEFAULT NULL COMMENT '状态0:未下发 1：待出库2：已出库 8：已取消',
  `lot_type` smallint(11) DEFAULT NULL COMMENT '调拨商品批次规则，0最新批次1冻结批次2随机批次',
  `owner_id` int(1) DEFAULT NULL COMMENT '货主id',
  `owner_name` varchar(32) DEFAULT NULL COMMENT '货主名称',
  `temp_group_id` int(11) DEFAULT NULL COMMENT '配送温区ID',
  `temp_group_name` varchar(32) DEFAULT NULL COMMENT '配送温区名称',
  `cross_dock` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否中转调拨，1是，0否',
  `inv_type` int(11) DEFAULT NULL COMMENT '调拨类型1正品2残品',
  `p_order_id` bigint(20) DEFAULT NULL COMMENT '关联采购单ID',
  `sku_qty` decimal(10,2) DEFAULT '0.00' COMMENT '申请数量',
  `ship_qty` decimal(10,2) DEFAULT '0.00' COMMENT '出库数量',
  `sku_cnt` int(11) DEFAULT NULL COMMENT '申请品种数量',
  `ship_cnt` int(11) DEFAULT NULL COMMENT '出库品种数量',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注--创建时带入',
  `in_wms_date` datetime DEFAULT NULL COMMENT '进入WMS时间-- 下发时反写',
  `expect_datetime` datetime DEFAULT NULL COMMENT '期望出库时间--创建时带入',
  `expect_rec_datetime` datetime DEFAULT NULL COMMENT '期望收货时间',
  `entry_name` varchar(255) DEFAULT NULL COMMENT '创建人--创建时带入',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间--创建时带入',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `approve_name` varchar(32) DEFAULT NULL COMMENT '审核人--创建时带入',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间--创建时带入',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '出库操作人名称--回传状态反写',
  `ship_datetime` datetime DEFAULT NULL COMMENT '出库时间--回传状态反写',
  `track_no` varchar(50) DEFAULT NULL COMMENT '物流运单号',
  `use_type` smallint(6) DEFAULT '48' COMMENT '调拨类型 48:正常调拨 49:委外调拨',
  UNIQUE KEY `tr_out_orderI1` (`order_id`) USING BTREE,
  KEY `tr_out_orderI2` (`order_code`) USING BTREE,
  KEY `tr_out_orderI3` (`request_id`) USING BTREE,
  KEY `tr_out_orderI4` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨出单据';

/*Table structure for table `tr_out_status` */

CREATE TABLE `tr_out_status` (
  `order_id` bigint(20) NOT NULL COMMENT '调拨出单id',
  `status` int(11) DEFAULT NULL COMMENT '调拨出单据状态：1',
  `status_desc` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '状态描述',
  `entry_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名称',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  KEY `tr_out_statusI2` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

/*Table structure for table `tr_relations` */

CREATE TABLE `tr_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_order_id` bigint(20) NOT NULL COMMENT '调拨出id',
  `to_order_id` bigint(20) NOT NULL COMMENT '调拨入id',
  `entry_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `entry_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '制单人',
  PRIMARY KEY (`id`),
  KEY `tr_relationsI1` (`from_order_id`) USING BTREE,
  KEY `tr_relationsI2` (`to_order_id`) USING BTREE,
  KEY `tr_relationsI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303298 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调拨出状态表';

/*Table structure for table `transfer_in_hand_over_header` */

CREATE TABLE `transfer_in_hand_over_header` (
  `hand_over_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '由调拨出导入时生成',
  `hand_over_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '批次交接单编号: 由调拨出导入时生成',
  `loc_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `waybill_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  `STATUS` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0, 新增 1 交接完成',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '包裹总数量',
  `real_box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '实收包裹总数量',
  `total_weight` decimal(32,8) NOT NULL DEFAULT '0.00000000' COMMENT '总重量',
  `hand_over_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交接批次日期',
  `hand_over_name` varchar(32) NOT NULL,
  `entry_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `entry_name` varchar(32) NOT NULL DEFAULT '',
  `print_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '打印时间',
  `print_name` varchar(32) NOT NULL DEFAULT '' COMMENT '打印人',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递名称',
  `courier` varchar(32) NOT NULL DEFAULT '' COMMENT '快递交接人',
  `carrier_car_license` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
  PRIMARY KEY (`hand_over_id`),
  KEY `tr_in_hand_over_hI1` (`hand_over_no`) USING BTREE,
  KEY `tr_in_hand_over_hI2` (`hand_over_date`) USING BTREE,
  KEY `tr_in_hand_over_hI3` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨入批次交接表头';

/*Table structure for table `tttttt` */

CREATE TABLE `tttttt` (
  `cust_id` bigint(20) DEFAULT NULL,
  `city` text,
  `province` text,
  `county` text,
  `custaddress` longtext,
  `min_create_date` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ware121` */

CREATE TABLE `ware121` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40819 DEFAULT CHARSET=utf8;

/*Table structure for table `warehouse` */

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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

/*Table structure for table `warehouse_bak` */

CREATE TABLE `warehouse_bak` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

/*Table structure for table `work_alloc_inv_que` */

CREATE TABLE `work_alloc_inv_que` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工单id',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `alloc_status` int(11) NOT NULL DEFAULT '0' COMMENT '占用状态1成功',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加工库存占用队列';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
Navicat MySQL Data Transfer

Source Server         : wms-fukuixiang
Source Server Version : 50730
Source Host           : birdb-wms.prod.chunbo.com:3309
Source Database       : wmsorderdb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2023-02-20 15:54:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rwms_box_detail
-- ----------------------------
DROP TABLE IF EXISTS `rwms_box_detail`;
CREATE TABLE `rwms_box_detail` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单id',
  `box_item_seq` int(11) NOT NULL DEFAULT '0' COMMENT '包件单明细分录号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU',
  `sku_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品名称',
  `qc_qty` int(20) NOT NULL DEFAULT '0' COMMENT '质检数量',
  `sku_type` int(11) NOT NULL DEFAULT '0',
  `sku_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT 'sku价格',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '订单sku数量',
  `order_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单商品重量',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '称重标识：1称重 0不称重',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `is_gift` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为赠品',
  `gift_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '赠品类型 赠品类型 0:普通品(非赠品) 1:促销赠品 2:市场赠品',
  `order_line_no` int(6) NOT NULL DEFAULT '0' COMMENT '订单明细分录号',
  `kit_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟组套套装商品ID',
  `kit_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟组套套装商品ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`,`box_item_seq`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1269290 DEFAULT CHARSET=utf8 COMMENT='订单包件单明细表';

-- ----------------------------
-- Table structure for rwms_box_header
-- ----------------------------
DROP TABLE IF EXISTS `rwms_box_header`;
CREATE TABLE `rwms_box_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包件单ID',
  `box_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '包件单编号',
  `box_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '当前订单包裹数量',
  `box_sequence` int(11) NOT NULL DEFAULT '0' COMMENT '当前包裹序号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '定单ID',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '货主ID',
  `track_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '运单号',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '包件单状态: 0初始化, 1新增包裹, 5质检确认, 6订单称重, 7 批次交接出库 ',
  `sku_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '商品品种数',
  `sku_qty` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `actual_weight` decimal(16,2) NOT NULL DEFAULT '0.00',
  `last_package` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单下最后一个包裹标识 1,是 0 否',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_box_id` (`box_id`) USING BTREE,
  UNIQUE KEY `idx_box_no` (`box_no`) USING BTREE,
  KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168616 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单包件单表头';

-- ----------------------------
-- Table structure for rwms_order_async_tasks
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_async_tasks`;
CREATE TABLE `rwms_order_async_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '订单id',
  `task_type` smallint(6) NOT NULL DEFAULT '-1' COMMENT '任务类型',
  `async_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '同步时间',
  `async_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '同步状态 0:new, -1:failed, 1:success',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`task_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1206190 DEFAULT CHARSET=utf8 COMMENT='订单同步队列表';

-- ----------------------------
-- Table structure for rwms_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_cancel`;
CREATE TABLE `rwms_order_cancel` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS 订单ID',
  `parent_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS拆单之前的订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0:新增,1,确定(OMS确认可以取消)',
  `cancel_type` int(11) NOT NULL DEFAULT '-1' COMMENT '0: 系统报缺, 1 实物报缺, 3. OMS取消',
  `cancel_source` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '取消来源',
  `cancel_cause` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '取消原因',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `return_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '通知dms订单取消返回状态:1-成功,0-失败',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '取消通知dms最后上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104986 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 订单取消表';

-- ----------------------------
-- Table structure for rwms_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_delivery`;
CREATE TABLE `rwms_order_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '仓库名称',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `track_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  `freight` decimal(32,8) NOT NULL DEFAULT '0.00000000' COMMENT '运费',
  `service_id` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '使用配送服务ID（SF, HG, RFD）',
  `ship_to_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人',
  `ship_to_account` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人账号',
  `ship_to_phone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货人手机',
  `ship_to_tel` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '''收货人座机''',
  `ship_to_addr` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货地址',
  `ship_to_province` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货省名称',
  `ship_to_city` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货市 名称',
  `ship_to_district` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货区名称',
  `ship_to_fourthaddr` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '收货4级地址名称',
  `shipment_spot_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送站id-助记码',
  `shipment_spot_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送站名称',
  `delivery_requirement` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '送货要求',
  `delivery_type` int(11) NOT NULL DEFAULT '3' COMMENT '配送方式：1：工作日3随时送（次日达） 4定时达 5极速达 ',
  `delivery_from_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送开始时间',
  `delivery_to_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送结束时间',
  `book_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '预约送货日期',
  `cod_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '货到付款',
  `freight_type` char(1) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '是否有运费',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建时间',
  `phone_area_code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '电话区号',
  `carrier_account` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递月结卡号',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `total_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单总重',
  `direction` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '方位',
  `line_distance` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '直线距离',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8438034 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单配送信息';

-- ----------------------------
-- Table structure for rwms_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_detail`;
CREATE TABLE `rwms_order_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'WMS 订单ID',
  `order_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '订单明细分录号',
  `kit_line_no` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟组套商品所在的行号',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品skuid',
  `upc_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品upc码',
  `sku_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT 'sku价格',
  `kit_sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟组套商品skuid',
  `sku_type` int(11) NOT NULL DEFAULT '1' COMMENT '类似零元购，加价购商品类型：1正常品， 2虚拟商品，3虚拟子商品',
  `order_qty` int(11) NOT NULL DEFAULT '0' COMMENT '订单数量-包含赠品数量',
  `order_weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '订单商品重量',
  `qc_qty` int(11) NOT NULL DEFAULT '0' COMMENT '质检数量',
  `remarks` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '客户定制-备注信息',
  `is_gift` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否赠品  1是0否',
  `gift_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '赠品类型 赠品类型 0:普通品(非赠品) 1:促销赠品 2:市场赠品',
  `weight_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '称重标识：1称重 2不称重',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建时间',
  `update_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '更新时间',
  `update_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23947222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 订单明细表';

-- ----------------------------
-- Table structure for rwms_order_exception
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_exception`;
CREATE TABLE `rwms_order_exception` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS order ID',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT 'order type',
  `exception_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '异常类型:12:系统报缺9.实物报缺',
  `exception` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '异常信息',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `need_sync` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否上传 0:不上传 1：上传',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '''返回状态: 1 成功, 0 失败'',',
  `error_code` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '返回:错误原因',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后一次发送时间',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15678 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单异常信息 上传CS';

-- ----------------------------
-- Table structure for rwms_order_header
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_header`;
CREATE TABLE `rwms_order_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT 'OMS订单类型 1正向订单',
  `parent_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS未拆单前订单ID',
  `sale_type` int(11) NOT NULL DEFAULT '1' COMMENT '销售类型 1:正常 2:宅配 3:闪购 4:预售 5:极致新鲜',
  `order_channel` smallint(6) NOT NULL DEFAULT '1' COMMENT '订单类型 1:自营 2:供应商订单 3:虚拟',
  `order_source` int(11) NOT NULL DEFAULT '1' COMMENT '订单来源：1:网站 2:手机 3:平板',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `total_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '订单商品总种类',
  `total_qty` int(11) NOT NULL DEFAULT '0' COMMENT '订单商品总数量',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单下发wms时间.',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前台下单时间',
  `total_order` decimal(32,8) NOT NULL DEFAULT '0.00000000' COMMENT '订单总金额',
  `payment_type` smallint(10) NOT NULL DEFAULT '1' COMMENT '支付方式 1:在线支付 2货到付款',
  `price_hide_flag` smallint(6) NOT NULL DEFAULT '1' COMMENT '清单金额标识：1, 隐藏, 0, 显示',
  `payment_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '支付时间',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '出库时间',
  `is_short_wait` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否缺货等待 1是0否',
  `box_cnt` int(6) NOT NULL DEFAULT '0' COMMENT '订单包裹数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_parent_order_id` (`parent_order_id`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8451844 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 订单表头';

-- ----------------------------
-- Table structure for rwms_order_import_tms_que
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_import_tms_que`;
CREATE TABLE `rwms_order_import_tms_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID, 为复制使用',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT 'warehuse ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 未出库, 1 已出库',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建日期',
  `import_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '导入日期',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168110 DEFAULT CHARSET=utf8 COMMENT='订单同步到TMS队列表';

-- ----------------------------
-- Table structure for rwms_order_opt
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_opt`;
CREATE TABLE `rwms_order_opt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL COMMENT 'OMS 订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT 'OMS订单类型 1正向订单',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单下发wms时间.',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前台下单时间',
  `short_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '实物报缺时间',
  `short_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作实物报缺人名称',
  `print_list_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '打印清单时间',
  `print_list_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '清单打印人',
  `qc_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '质检日期',
  `qc_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '质检人名字',
  `cancel_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '订单取消日期',
  `ship_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '出库时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁版本控制',
  `pick_start_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '拣货开始时间',
  `pick_end_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '拣货结束时间',
  `pick_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '拣货人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_ship_date` (`ship_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8438034 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单操作表--做更新使用';

-- ----------------------------
-- Table structure for rwms_order_print_list_task
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_print_list_task`;
CREATE TABLE `rwms_order_print_list_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'WMS 订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `task_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '任务状态：0：未打印 1：已打印',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `delivery_type` int(11) NOT NULL DEFAULT '3' COMMENT '配送方式：1：工作日3随时送（次日达） 4定时达 5极速达 ',
  `ship_to_addr` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '收货地址',
  `book_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '预约送货日期-期望收货时间',
  `delivery_from_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送开始时间',
  `delivery_to_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送结束时间',
  `in_wms_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入wms的时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务完成时间',
  `finish_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务完成人',
  `order_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前台下单时间',
  `direction` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '方位',
  `line_distance` float(7,2) NOT NULL DEFAULT '0.00' COMMENT '直线距离',
  `priority` int(2) NOT NULL DEFAULT '2' COMMENT '订单优先级 1:低，2:普通，3:高',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1351110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 清单打印任务表';

-- ----------------------------
-- Table structure for rwms_order_profiles
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_profiles`;
CREATE TABLE `rwms_order_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `order_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `prof_cat` varchar(32) NOT NULL DEFAULT '' COMMENT '属性分类',
  `prof_type` varchar(64) NOT NULL DEFAULT '' COMMENT '属性类型',
  `prof_i` bigint(20) NOT NULL DEFAULT '0' COMMENT '整型属性值',
  `prof_c` varchar(255) NOT NULL DEFAULT '' COMMENT '字符型属性值',
  `prof_d` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '日期型属性值',
  `prof_m` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额型属性值',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4210044 DEFAULT CHARSET=utf8 COMMENT='订单属性表';

-- ----------------------------
-- Table structure for rwms_order_qc_task
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_qc_task`;
CREATE TABLE `rwms_order_qc_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(11) NOT NULL DEFAULT '0' COMMENT 'WMS 订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `task_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '任务状态：0：未打印 1：已打印',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递id',
  `carrier_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `delivery_type` int(11) NOT NULL DEFAULT '3' COMMENT '配送方式：1：工作日3随时送（次日达） 4定时达 5极速达 ',
  `ship_to_addr` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '收货地址',
  `book_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '预约送货日期-期望收货时间',
  `delivery_from_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送开始时间',
  `delivery_to_time` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '配送结束时间',
  `in_wms_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '进入wms的时间',
  `print_list_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '打印清单时间',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '记录创建时间',
  `finish_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '任务完成时间',
  `finish_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务完成人',
  `direction` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '方位',
  `line_distance` float(7,2) NOT NULL DEFAULT '0.00' COMMENT '直线距离',
  `create_name` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务创建人',
  `pick_start_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '拣货开始时间',
  `pick_end_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '拣货结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_print_list_date` (`print_list_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1342830 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 清单打印任务表';

-- ----------------------------
-- Table structure for rwms_order_ship_que
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_ship_que`;
CREATE TABLE `rwms_order_ship_que` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'OMS 订单ID',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '仓库类型',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `error_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '错误原因',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `message_id` varchar(48) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'mq出库messageid',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8425556 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='WMS 订单出库表';

-- ----------------------------
-- Table structure for rwms_order_status
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_status`;
CREATE TABLE `rwms_order_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT 'OMS订单类型',
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房id',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'OMS订单状态',
  `status_desc` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `create_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `return_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '返回状态: 1 成功, 0 失败',
  `error_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '错误原因',
  `last_send_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '最后上传, 响应时间',
  `need_sync` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否需要上传: 1需要, 0不需要',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '重试次数',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17298218 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单状态表';

-- ----------------------------
-- Table structure for rwms_order_tracks
-- ----------------------------
DROP TABLE IF EXISTS `rwms_order_tracks`;
CREATE TABLE `rwms_order_tracks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `track_no` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运单号',
  `status` tinyint(2) DEFAULT '0' COMMENT '0:新建 1：使用',
  `create_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '创建时间',
  `box_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '包裹ID',
  `print_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '运单打印时间',
  `print_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '运单打印人',
  `logistics_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '逻辑订单号',
  PRIMARY KEY (`id`),
  KEY `idx_create_date` (`create_date`) USING BTREE,
  KEY `idx_box_id` (`box_id`) USING BTREE,
  KEY `idx_track_no` (`track_no`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167592 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='运单信息';

-- ----------------------------
-- Table structure for sku_main
-- ----------------------------
DROP TABLE IF EXISTS `sku_main`;
CREATE TABLE `sku_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `plu_no` varchar(6) NOT NULL DEFAULT '0' COMMENT '称重码',
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
  `temp_area_id` int(11) DEFAULT '0' COMMENT '温区id',
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
  `purchase_mode` smallint(6) DEFAULT NULL COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT NULL COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT NULL COMMENT '保质期年月日',
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名',
  `sku_component` varchar(128) NOT NULL DEFAULT '' COMMENT 'sku主要成分',
  `is_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '称重标识 2-不称重，1-称重',
  `product_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品三级分类名称',
  `first_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `first_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  `is_eating` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:非生食,1:生食商品,2:熟食',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_mainI1` (`sku_id`) USING BTREE,
  KEY `sku_mainI2` (`sku_name`) USING BTREE,
  KEY `sku_mainI3` (`upc_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136116 DEFAULT CHARSET=utf8;

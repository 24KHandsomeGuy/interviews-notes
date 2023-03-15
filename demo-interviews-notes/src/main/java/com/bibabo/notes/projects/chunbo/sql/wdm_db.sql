/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - wdm_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wdm_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `app_inv_shortage_monitor` */

CREATE TABLE `app_inv_shortage_monitor` (
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '库房ID，  仓库id,为0时可能是配送区域有问题',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `sale_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '销售类型',
  `is_have_presell` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `sale_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预售发放形式 1-天量 0-总量',
  `stock_num` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT ' 可卖数',
  `stock_num_list` varchar(128) NOT NULL DEFAULT '' COMMENT ' 预售天量库存',
  `now_date` timestamp NOT NULL DEFAULT '1970-01-01 08:00:01' COMMENT '前端传过来的当前时间',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bom` */

CREATE TABLE `bom` (
  `bom_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'bom 表id',
  `bom_name` varchar(134) DEFAULT NULL COMMENT 'BOM表名称',
  `bom_code` varchar(18) DEFAULT NULL COMMENT 'bom 编号',
  `sku_id` int(11) DEFAULT NULL COMMENT '产成品sku id',
  `bom_type` smallint(6) DEFAULT NULL COMMENT 'bom表类型，0：一原料一成品 1：多成品合装',
  `use_carton` int(3) NOT NULL DEFAULT '0' COMMENT '是否使用纸箱包装，0：不用，1使用',
  `product_number` decimal(11,2) DEFAULT NULL COMMENT '成品数量',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效， 0：无效  1：有效',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前登录人信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当前登陆人信息',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `pull_off_shelf_multiply` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT '原料下架倍量',
  `if_one_material` smallint(6) DEFAULT NULL COMMENT '是否单原料商品 0:否，1：是',
  PRIMARY KEY (`bom_id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98306 DEFAULT CHARSET=utf8 COMMENT='BOM基本信息表';

/*Table structure for table `bom_sku_rel` */

CREATE TABLE `bom_sku_rel` (
  `bom_sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'bom与sku关系id',
  `bom_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT 'sku id',
  `url_one` varchar(256) DEFAULT NULL COMMENT '加工工艺图片路径1',
  `url_two` varchar(256) DEFAULT NULL COMMENT '加工工艺图片路径2',
  `url_three` varchar(256) DEFAULT NULL COMMENT '加工工艺图片3',
  `url_four` varchar(256) DEFAULT NULL COMMENT '加工工艺图片4',
  `url_five` varchar(256) DEFAULT NULL COMMENT '加工工艺图片5',
  `lot_number` decimal(11,4) DEFAULT NULL COMMENT '原料数量',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前登录人信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当前登录人信息',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `work_process_desc` text COMMENT '加工工艺描述',
  `material_type` smallint(6) DEFAULT NULL COMMENT '原料类型 1:原料2:包材',
  PRIMARY KEY (`bom_sku_id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_bom_id` (`bom_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=673276 DEFAULT CHARSET=utf8 COMMENT='产品与bom表关系';

/*Table structure for table `check_items` */

CREATE TABLE `check_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(64) DEFAULT NULL COMMENT '检测项名称',
  `item_code` varchar(32) DEFAULT NULL COMMENT '检测项编号',
  `item_type` varchar(32) DEFAULT NULL COMMENT '检测类型 暂时不用，如：自营蔬菜，代销蔬菜，预包装食品',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='检测项目';

/*Table structure for table `check_items_num` */

CREATE TABLE `check_items_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) DEFAULT NULL COMMENT '检测项id',
  `check_num` varchar(32) DEFAULT NULL COMMENT '检测项目数',
  `check_unit` varchar(32) DEFAULT NULL COMMENT '检测项目数单位',
  `check_name` varchar(100) DEFAULT NULL COMMENT '检测项名称',
  `report_type` int(11) DEFAULT NULL COMMENT '报告类型 0 品控  1 BEST',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='检测项目数';

/*Table structure for table `company` */

CREATE TABLE `company` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增 公司编号',
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `credit_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '信用证代码',
  `registration_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '注册号',
  `organization_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '组织机构代码证',
  `registration_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '注册时间',
  `registration_authority` varchar(64) NOT NULL DEFAULT '' COMMENT '登记机关',
  `registration_region` varchar(32) NOT NULL DEFAULT '110000' COMMENT '注册地点',
  `management_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '经营状态',
  `legal_person` varchar(32) NOT NULL DEFAULT '' COMMENT '法人',
  `creation_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(16) DEFAULT '' COMMENT '修改者',
  `last_changed_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `company_code` smallint(6) DEFAULT '0',
  `company_code21` smallint(6) DEFAULT '0',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='公司基础信息表';

/*Table structure for table `company_finan_rel` */

CREATE TABLE `company_finan_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公司编号',
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `parent_company_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '财务上级公司编号',
  `parent_company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '财务上级公司名称',
  `ware_id_belong_company` int(11) NOT NULL DEFAULT '0' COMMENT '当前公司下属仓库ID',
  `ware_name_belong_company` varchar(128) NOT NULL DEFAULT '' COMMENT '当前公司下属仓库名称',
  `record_person` varchar(16) NOT NULL DEFAULT '' COMMENT '录入人',
  `record_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '录入时间',
  `creation_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(16) DEFAULT '' COMMENT '修改者',
  `last_changed_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8 COMMENT='公司财务关系表';

/*Table structure for table `company_orgnization` */

CREATE TABLE `company_orgnization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_org_id` int(11) DEFAULT NULL COMMENT '父组织结构',
  `org_name` varchar(128) DEFAULT NULL COMMENT '公司组织结构名',
  `org_addr` varchar(128) DEFAULT NULL COMMENT '组织地址',
  `org_person` varchar(64) DEFAULT NULL COMMENT '公司法人',
  `org_telephone` varchar(16) DEFAULT NULL COMMENT '办工电话',
  `org_mobile` varchar(16) DEFAULT NULL COMMENT '手机',
  `org_email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `is_valid` varchar(45) DEFAULT NULL COMMENT '是否生效 1:有效 0:无效',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `org_short_name` varchar(16) DEFAULT NULL COMMENT '部门所属地拼音简写',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公司组织机构表';

/*Table structure for table `deliveryarea` */

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
  `timing_arrival_flag` int(4) DEFAULT '0' COMMENT '定时达标志 1是 0非',
  PRIMARY KEY (`deliveryarea_id`),
  KEY `r_id_idx` (`region_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6178 DEFAULT CHARSET=utf8;

/*Table structure for table `deliveryarea_bak` */

CREATE TABLE `deliveryarea_bak` (
  `deliveryarea_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送区域id',
  `region_id` int(11) DEFAULT NULL COMMENT '行政区域id (从行政区域表中取)',
  `delivery_code` varchar(32) DEFAULT NULL COMMENT '配送区域编号',
  `delivery_name` varchar(128) DEFAULT NULL COMMENT '配送区域名称',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `timing_arrival_flag` int(4) DEFAULT '0' COMMENT '定时达标志 1是 0非'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `group_delivery_rel` */

CREATE TABLE `group_delivery_rel` (
  `group_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `deliveryarea_id` int(11) DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  PRIMARY KEY (`group_area_id`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_deliveryarea_id` (`deliveryarea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=987659 DEFAULT CHARSET=utf8 COMMENT='分组信息与配送区域关系表';

/*Table structure for table `group_information` */

CREATE TABLE `group_information` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `group_name` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `group_code` varchar(32) DEFAULT NULL COMMENT '分组编号',
  `group_type` varchar(128) DEFAULT NULL COMMENT '分组类型',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='分组信息表';

/*Table structure for table `inspection_report` */

CREATE TABLE `inspection_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_code` varchar(32) DEFAULT NULL COMMENT '报告编号',
  `report_name` varchar(64) DEFAULT NULL COMMENT '报告名称',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'UPC码',
  `box_std` varchar(32) DEFAULT NULL COMMENT '包装规格',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位id',
  `unit_name` varchar(32) DEFAULT NULL COMMENT '单位名称',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `shelf_life_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `product_date` datetime DEFAULT NULL COMMENT '生产日期',
  `expire_date` datetime DEFAULT NULL COMMENT '过期时间',
  `comments` varchar(2000) DEFAULT NULL COMMENT '备注',
  `report_status` smallint(6) DEFAULT NULL COMMENT '状态 0:作废 1新建 2审核通过 3审核不通过',
  `img_url` varchar(3000) DEFAULT '' COMMENT '报告图片路径',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `audit_by` varchar(64) DEFAULT NULL COMMENT '审核人',
  `report_type` int(11) DEFAULT NULL,
  `is_lot` int(11) DEFAULT '1' COMMENT '0 不按照批次上传，1 按批次上传',
  `laboratory_id` int(11) DEFAULT NULL COMMENT '化验室id',
  PRIMARY KEY (`id`),
  KEY `index_skuid_lot` (`sku_id`,`sku_lot`) USING BTREE,
  KEY `index_laboratory` (`laboratory_id`) USING BTREE,
  KEY `index_audit_date` (`audit_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=543198 DEFAULT CHARSET=utf8 COMMENT='质检报告';

/*Table structure for table `laboratory_info` */

CREATE TABLE `laboratory_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `laboratory_name` varchar(128) DEFAULT NULL COMMENT '化验室名称',
  `contact_name` varchar(64) DEFAULT NULL COMMENT '联系人姓名',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='化验室信息';

/*Table structure for table `laboratory_relation` */

CREATE TABLE `laboratory_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_type` int(11) DEFAULT NULL COMMENT '化验室关联类型表 1:化验室与仓库的关系  2:化验室与网站站点的关系',
  `laboratory_id` int(11) DEFAULT NULL COMMENT '化验室id',
  `associated_id` varchar(32) DEFAULT NULL COMMENT '被关联者id',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='实验室的关联信息表';

/*Table structure for table `no_report` */

CREATE TABLE `no_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `types` varchar(64) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(45) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='无需品检报告信息';

/*Table structure for table `os_allocate_virtual_in` */

CREATE TABLE `os_allocate_virtual_in` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `os_order_id` varchar(32) DEFAULT '' COMMENT '委外订单号',
  `outstock_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '委外出库单id',
  `allocate_out_id` varchar(32) DEFAULT '' COMMENT '调出单号',
  `allocate_in_id` varchar(32) DEFAULT '' COMMENT '调入单号',
  `supplier_id` bigint(20) DEFAULT '0' COMMENT '加工商编号',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `ware_out_id` bigint(20) DEFAULT '0' COMMENT '发货仓',
  `ware_out_name` varchar(128) DEFAULT '' COMMENT '发货仓名称',
  `ware_in_id` bigint(20) DEFAULT '0' COMMENT '收货虚拟仓',
  `ware_in_name` varchar(255) DEFAULT '' COMMENT '收货虚拟仓名称',
  `status` smallint(2) DEFAULT '0' COMMENT '调出单状态1-新建2-已下发仓库3-已出库4-已收货5-取消',
  `sku_id` bigint(20) DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `sku_unit_id` bigint(20) DEFAULT '0' COMMENT '商品单位id',
  `sku_unit_name` varchar(255) DEFAULT '' COMMENT '商品单位',
  `allocate_out_num` decimal(12,2) DEFAULT '0.00' COMMENT '调出数量(仓库回传)',
  `plan_num` decimal(12,2) DEFAULT '0.00' COMMENT '计划调出数量',
  `received_num` decimal(12,2) DEFAULT '0.00' COMMENT '已收数量',
  `receive_num` decimal(12,2) DEFAULT '0.00' COMMENT '本次收货数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `create_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间,默认为系统时间',
  `update_by` varchar(32) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='委外调拨虚入表';

/*Table structure for table `os_allocate_virtual_in_test` */

CREATE TABLE `os_allocate_virtual_in_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `os_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '委外订单号',
  `outstock_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '委外出库单id',
  `allocate_out_id` varchar(32) DEFAULT '' COMMENT '调出单号',
  `allocate_in_id` varchar(32) DEFAULT '' COMMENT '调入单号',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工商编号',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `ware_out_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '发货仓',
  `ware_out_name` varchar(128) DEFAULT '' COMMENT '发货仓名称',
  `ware_in_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '收货虚拟仓',
  `ware_in_name` varchar(255) DEFAULT '' COMMENT '收货虚拟仓名称',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '调出单状态1-新建2-已下发仓库3-已出库4-已收货5-取消',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `sku_unit_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品单位id',
  `sku_unit_name` varchar(255) DEFAULT '' COMMENT '商品单位',
  `allocate_out_num` decimal(12,2) DEFAULT '0.00' COMMENT '调出数量(仓库回传)',
  `plan_num` decimal(12,2) DEFAULT '0.00' COMMENT '计划调出数量',
  `received_num` decimal(12,2) DEFAULT '0.00' COMMENT '已收数量',
  `receive_num` decimal(12,2) DEFAULT '0.00' COMMENT '本次收货数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `create_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间,默认为系统时间',
  `update_by` varchar(32) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='委外调拨虚入表';

/*Table structure for table `os_allocate_virtual_in_test01` */

CREATE TABLE `os_allocate_virtual_in_test01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `os_order_id` varchar(32) DEFAULT '' COMMENT '委外订单号',
  `outstock_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '委外出库单id',
  `allocate_out_id` varchar(32) DEFAULT '' COMMENT '调出单号',
  `allocate_in_id` varchar(32) DEFAULT '' COMMENT '调入单号',
  `supplier_id` bigint(20) DEFAULT '0' COMMENT '加工商编号',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `ware_out_id` bigint(20) DEFAULT '0' COMMENT '发货仓',
  `ware_out_name` varchar(128) DEFAULT '' COMMENT '发货仓名称',
  `ware_in_id` bigint(20) DEFAULT '0' COMMENT '收货虚拟仓',
  `ware_in_name` varchar(255) DEFAULT '' COMMENT '收货虚拟仓名称',
  `status` smallint(2) DEFAULT '0' COMMENT '调出单状态1-新建2-已下发仓库3-已出库4-已收货5-取消',
  `sku_id` bigint(20) DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `sku_unit_id` bigint(20) DEFAULT '0' COMMENT '商品单位id',
  `sku_unit_name` varchar(255) DEFAULT '' COMMENT '商品单位',
  `allocate_out_num` decimal(12,2) DEFAULT '0.00' COMMENT '调出数量(仓库回传)',
  `plan_num` decimal(12,2) DEFAULT '0.00' COMMENT '计划调出数量',
  `received_num` decimal(12,2) DEFAULT '0.00' COMMENT '已收数量',
  `receive_num` decimal(12,2) DEFAULT '0.00' COMMENT '本次收货数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `create_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间,默认为系统时间',
  `update_by` varchar(32) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='委外调拨虚入表';

/*Table structure for table `os_cost_type` */

CREATE TABLE `os_cost_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_id` int(4) NOT NULL DEFAULT '0' COMMENT '费用类型id',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '费用类型名称',
  `created_by` varchar(32) DEFAULT '',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `updated_by` varchar(32) DEFAULT '',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间,默认为系统时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='委外费用类型表';

/*Table structure for table `os_instock` */

CREATE TABLE `os_instock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instock_id` varchar(32) NOT NULL COMMENT '委外入库单号',
  `bom_code` varchar(18) NOT NULL DEFAULT '' COMMENT 'bom编号',
  `porder_sn` varchar(45) NOT NULL DEFAULT '' COMMENT '采购单号',
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '委外订单号',
  `ware_id` bigint(20) NOT NULL COMMENT '入库仓库',
  `ware_name` varchar(128) DEFAULT '' COMMENT '仓库名称',
  `status` int(6) NOT NULL COMMENT '入库单状态 1-新建 2-下发仓库 3-仓库收货 4-收货完成 5-已取消',
  `receive_start` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货开始时间',
  `receive_end` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货结束时间',
  `supplier_id` bigint(20) DEFAULT '0' COMMENT '加工商',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_need_pic_up` int(4) NOT NULL DEFAULT '0' COMMENT '是否自提，1-自提,0-不自提',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1154 DEFAULT CHARSET=utf8 COMMENT='委外入库单';

/*Table structure for table `os_instock_cost` */

CREATE TABLE `os_instock_cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instock_id` varchar(32) NOT NULL COMMENT '委外入库单号',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '费用承担供应商',
  `cost_type` int(11) DEFAULT '0' COMMENT '费用类型，1-加工费 2-材料费',
  `cost_type_name` varchar(128) DEFAULT '' COMMENT '类型名称',
  `cost` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '费用',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='委外入库费用表';

/*Table structure for table `os_instock_picup` */

CREATE TABLE `os_instock_picup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instock_id` varchar(32) NOT NULL,
  `pic_up_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '自提日期',
  `pic_up_addr` varchar(128) NOT NULL DEFAULT '0' COMMENT '自提地址',
  `contact_man` varchar(64) NOT NULL DEFAULT '0' COMMENT '自提联系人',
  `contact_pho` varchar(64) NOT NULL DEFAULT '0' COMMENT '自提联系人电话',
  `created_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `instock_id` (`instock_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;

/*Table structure for table `os_instock_sku` */

CREATE TABLE `os_instock_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instock_id` varchar(32) NOT NULL COMMENT '委外入库单号',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名称',
  `sku_unit_name` varchar(16) DEFAULT '' COMMENT '商品单位',
  `plan_num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '预计计划入库量',
  `instock_num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '入库数量',
  `actual_num` decimal(12,2) DEFAULT '0.00' COMMENT '实际入库数量',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1154 DEFAULT CHARSET=utf8 COMMENT='入库单商品表';

/*Table structure for table `os_instock_sku_detail` */

CREATE TABLE `os_instock_sku_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instock_id` varchar(32) NOT NULL COMMENT '入库单号',
  `instock_sku_id` bigint(20) NOT NULL COMMENT '入库单对应成品',
  `material_sku_id` bigint(20) NOT NULL COMMENT 'sku',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名称',
  `sku_unit_name` varchar(16) DEFAULT '' COMMENT '商品单位',
  `use_num` decimal(12,2) DEFAULT '0.00' COMMENT '使用数量',
  `purchase_num` decimal(12,2) DEFAULT '0.00' COMMENT '从加工商采购数量',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2494 DEFAULT CHARSET=utf8 COMMENT='入库单商品详情表';

/*Table structure for table `os_order` */

CREATE TABLE `os_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL COMMENT '委外订单编号',
  `status` int(6) NOT NULL COMMENT '状态 1-新建 2-待审核 3-审核通过 4-审核驳回 5-取消',
  `supplier_id` bigint(20) NOT NULL COMMENT '加工商id',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `check_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `contact_back_date` date DEFAULT '0000-00-00' COMMENT '合同返回日期',
  `check_by` varchar(32) DEFAULT '' COMMENT '审核人',
  `deliver_time` date NOT NULL COMMENT '计划到货日期',
  `delivery_address` varchar(255) NOT NULL COMMENT '收货地址',
  `requirement` varchar(512) DEFAULT '' COMMENT '产品技术要求',
  `standard` varchar(512) DEFAULT '' COMMENT '验收标准',
  `freight_supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '费用承担商1春播科技2加工商',
  `freight_supplier_name` varchar(255) DEFAULT '' COMMENT '费用承担商名称',
  `delivery_method` varchar(255) DEFAULT '' COMMENT '交货方式',
  `other` varchar(512) DEFAULT '' COMMENT '其他要求',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `category_dept_id` bigint(20) DEFAULT '0' COMMENT '商品一级分类对应的最低部门id',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `submit_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '送审时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 COMMENT='委外订单主表';

/*Table structure for table `os_order_sku` */

CREATE TABLE `os_order_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL COMMENT '委外订单id',
  `bom_id` bigint(20) NOT NULL COMMENT 'bom_id',
  `bom_code` varchar(255) DEFAULT '' COMMENT 'bom_code',
  `bom_name` varchar(128) DEFAULT '' COMMENT 'bom名称',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名称',
  `sku_unit_name` varchar(16) DEFAULT '' COMMENT '商品单位',
  `plan_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预计成品量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '每单位成品的加工单价',
  `price_memo` varchar(255) DEFAULT '' COMMENT '单价备注',
  `deviations` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交货数量偏差',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8 COMMENT='委外订单商品表';

/*Table structure for table `os_order_sku_detail` */

CREATE TABLE `os_order_sku_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) NOT NULL COMMENT '委外订单编号',
  `order_sku_id` bigint(20) NOT NULL COMMENT '委外订单对应成品sku',
  `material_sku_id` bigint(20) NOT NULL COMMENT '原料sku',
  `sku_name` varchar(128) DEFAULT '' COMMENT '原料sku名称',
  `sku_unit_name` varchar(16) DEFAULT '' COMMENT '单位',
  `use_num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单位成品使用量',
  `pick_num` decimal(12,2) DEFAULT '0.00' COMMENT '领用量',
  `outed_num` decimal(10,2) DEFAULT '0.00' COMMENT '已出库数量',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `total_actual_num` decimal(10,2) DEFAULT '0.00' COMMENT '累计实际出库数量',
  `total_pick_num` decimal(10,2) DEFAULT '0.00' COMMENT '累计计划出库量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8 COMMENT='委外订单商品详情表';

/*Table structure for table `os_outstock_order` */

CREATE TABLE `os_outstock_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `outstock_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '出库单id -OEMO+5位流水',
  `os_order_id` varchar(32) NOT NULL COMMENT '委外订单id',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '出库单状态 0新建 1推送领用申请 2申请成功',
  `ware_id` bigint(20) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) DEFAULT '' COMMENT '仓库名称',
  `supplier_id` bigint(20) NOT NULL COMMENT '加工商id',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `delivery_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `delivery_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `delivery_mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '收货人电话',
  `plan_date` date NOT NULL COMMENT '计划出库日期',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='委外出库单表';

/*Table structure for table `os_outstock_order_detail` */

CREATE TABLE `os_outstock_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outstock_order_id` varchar(32) NOT NULL COMMENT '出库单id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名称',
  `sku_unit_name` varchar(32) DEFAULT '' COMMENT '单位',
  `plan_num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '计划出库数量',
  `out_num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '出库数量',
  `actual_num` decimal(12,2) DEFAULT '0.00' COMMENT '实际出库数量',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='委外出库单详情表';

/*Table structure for table `pcr_qc_sku_list` */

CREATE TABLE `pcr_qc_sku_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `ware_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '库房ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `order_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '订单类型：1:采购单,2:销退单,28:加工单',
  `sku_id` int(11) DEFAULT '0' COMMENT 'sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `lot` varchar(30) DEFAULT '' COMMENT 'sku批次',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '之间状态：0:新增,1:之间成功,2:免检',
  `qc_cyc` tinyint(4) DEFAULT '0' COMMENT '检测周期',
  `acct_id` int(50) NOT NULL DEFAULT '0' COMMENT '供应商id',
  `acct_name` varchar(200) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `rec_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '仓库到货时间',
  `create_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `operator_name` varchar(30) DEFAULT '' COMMENT '操作人姓名',
  `operator_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '操作时间',
  `free_qc_reason` tinyint(4) DEFAULT '0' COMMENT '免检原因',
  `comment` varchar(250) DEFAULT '' COMMENT '免检备注',
  `lab_id` int(11) DEFAULT '0' COMMENT '操作的实验室id',
  `order_status` tinyint(4) DEFAULT '0' COMMENT '退单状态',
  `qc_flag` smallint(6) DEFAULT '0' COMMENT '确认收到标识(0:未确认收到,1:已确认收到)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_id_lot` (`sku_id`,`lot`,`ware_id`,`order_type`) USING BTREE,
  KEY `idx_create_date` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61815 DEFAULT CHARSET=utf8;

/*Table structure for table `process_sku` */

CREATE TABLE `process_sku` (
  `process_sku_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '加工单原料表id',
  `process_id` bigint(11) DEFAULT NULL COMMENT '加工单id',
  `bom_sku_id` int(11) DEFAULT NULL COMMENT '物料清单bom原料表id',
  `sku_number` decimal(11,4) DEFAULT '0.0000' COMMENT '原料用量',
  `real_sku_num` decimal(11,4) DEFAULT '0.0000' COMMENT '实际原料用量，由仓库回传得到',
  `purchase_id` int(11) DEFAULT NULL COMMENT '采购单id',
  `purchase_code` varchar(32) DEFAULT NULL COMMENT '原料采购订单号',
  `sku_lot` varchar(32) DEFAULT NULL COMMENT '原料批次号',
  `waste_number` decimal(11,2) DEFAULT NULL COMMENT '废料数',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前的登录人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当前登录人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`process_sku_id`),
  KEY `process_id_idx` (`process_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1959047 DEFAULT CHARSET=utf8 COMMENT='加工单，加工时所用原料信息';

/*Table structure for table `process_sku_bak` */

CREATE TABLE `process_sku_bak` (
  `process_sku_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '加工单原料表id',
  `process_id` bigint(11) DEFAULT NULL COMMENT '加工单id',
  `bom_sku_id` int(11) DEFAULT NULL COMMENT '物料清单bom原料表id',
  `sku_number` int(11) DEFAULT NULL COMMENT '原料用量',
  `real_sku_num` int(11) DEFAULT NULL COMMENT '实际原料用量，由仓库回传得到',
  `purchase_id` int(11) DEFAULT NULL COMMENT '采购单id',
  `purchase_code` varchar(32) DEFAULT NULL COMMENT '原料采购订单号',
  `sku_lot` varchar(32) DEFAULT NULL COMMENT '原料批次号',
  `waste_number` decimal(11,2) DEFAULT NULL COMMENT '废料数',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前的登录人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当前登录人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `productcontrol` */

CREATE TABLE `productcontrol` (
  `procontrol_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL COMMENT '商品（sku） id',
  `user_id` int(11) DEFAULT NULL COMMENT '质检员id',
  `procontrol_indexes` text COMMENT '质控指标信息',
  `url_one` varchar(256) DEFAULT NULL COMMENT '合格品图片路径一',
  `url_two` varchar(256) DEFAULT NULL COMMENT '合格品图片路径二',
  `url_three` varchar(256) DEFAULT NULL COMMENT '合格品图片路径三',
  `url_four` varchar(256) DEFAULT NULL COMMENT '合格品图片路径四',
  `url_five` varchar(256) DEFAULT NULL COMMENT '合格品图片路径五',
  `remark` text COMMENT '备注信息',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效，1：有效，0：无效',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前的登陆人员工编号',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当时登陆人的员工编号',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`procontrol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品控信息表';

/*Table structure for table `qc_crtmanager_imgs` */

CREATE TABLE `qc_crtmanager_imgs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crt_id` bigint(20) NOT NULL COMMENT '证书ID',
  `url` varchar(500) NOT NULL COMMENT '证书图片关联地址',
  `status` int(11) NOT NULL COMMENT '证书图片状态 0-失效 1-有效',
  `created_by` varchar(50) NOT NULL COMMENT '创建者',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_changed_date` datetime DEFAULT NULL COMMENT '最后一次这条明细被修改的时间',
  `changed_by` varchar(50) DEFAULT NULL COMMENT '修改者',
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37433 DEFAULT CHARSET=utf8;

/*Table structure for table `qc_crtmanager_info` */

CREATE TABLE `qc_crtmanager_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crt_id` bigint(20) NOT NULL COMMENT '证书数据ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID（关联商品表）',
  `product_name` varchar(128) NOT NULL COMMENT '商品名称',
  `product_class_id` int(11) NOT NULL COMMENT '商品一级分类ID',
  `product_class_name` varchar(64) NOT NULL COMMENT '商品一级分类名称',
  `qc_inspector_id` int(11) DEFAULT NULL COMMENT '质检员id',
  `qc_inspector` varchar(50) NOT NULL COMMENT '质检员',
  `crt_starttime` datetime NOT NULL COMMENT '证书有效期起始时间',
  `crt_endtime` datetime NOT NULL COMMENT '证书有效期终止时间',
  `crt_status` int(255) NOT NULL COMMENT '证书状态 0-失效 1-有效',
  `comments` varchar(500) DEFAULT NULL COMMENT '备注',
  `crt_type` int(11) NOT NULL COMMENT '证书类型（关联接口方标签ID）',
  `crt_type_name` varchar(255) NOT NULL COMMENT '证书品类名称',
  `is_upload` int(4) NOT NULL COMMENT '证书是否上传 1-上传 0-未上传',
  `created_by` varchar(50) NOT NULL COMMENT '创建者',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_changed_date` datetime DEFAULT NULL COMMENT '最后一次这条明细被修改的时间',
  `changed_by` varchar(50) CHARACTER SET armscii8 DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5974 DEFAULT CHARSET=utf8;

/*Table structure for table `quality_inspector` */

CREATE TABLE `quality_inspector` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(64) DEFAULT NULL,
  `phone_no` varchar(16) DEFAULT NULL COMMENT '联系方式',
  `phone_mobile` varchar(16) DEFAULT NULL COMMENT '电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '1:有效;0:无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='质检员表';

/*Table structure for table `report_check_items` */

CREATE TABLE `report_check_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_id` bigint(20) DEFAULT NULL COMMENT '品鉴报告id',
  `check_items` varchar(2000) DEFAULT NULL COMMENT '检测项信息 数据格式：[{"itemName":"农残","itemNum":"165项","checkResult":"未超标"},{"itemName":"兽残","itemNum":"155项","checkResult":"未检出"}]',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_col_report_id` (`report_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=515319 DEFAULT CHARSET=utf8 COMMENT='检测报告检测项目信息';

/*Table structure for table `report_order_rel` */

CREATE TABLE `report_order_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) DEFAULT NULL,
  `sku_id` varchar(64) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `sku_lot` varchar(64) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_info` varchar(1024) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品检报告与订单关系';

/*Table structure for table `report_order_rel_worker` */

CREATE TABLE `report_order_rel_worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `sku_id` varchar(64) DEFAULT NULL COMMENT '商品id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `sku_lot` varchar(64) DEFAULT NULL COMMENT '商品批次',
  `make_rel_time` int(11) DEFAULT '1' COMMENT '关联次数',
  `mail_time` int(11) DEFAULT '0' COMMENT '邮件提醒次数',
  `status` int(11) DEFAULT '0' COMMENT '任务状态：0 新建 -1 失败 1成功',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `comments` varchar(128) DEFAULT NULL COMMENT '备注',
  `out_ware_date` datetime DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联订单和品检报告任务表';

/*Table structure for table `seckill` */

CREATE TABLE `seckill` (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
  `name` varchar(120) NOT NULL COMMENT '商品名称',
  `number` int(11) NOT NULL COMMENT '库存数量',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '秒杀开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '秒杀结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

/*Table structure for table `sku_attr_value` */

CREATE TABLE `sku_attr_value` (
  `sku_attr_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_attr_id` int(11) DEFAULT NULL,
  `sku_attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `sku_attr_value` varchar(32) DEFAULT NULL COMMENT '属性值',
  `attr_value_desc` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`sku_attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19498 DEFAULT CHARSET=utf8 COMMENT='属性对应值';

/*Table structure for table `sku_attribute` */

CREATE TABLE `sku_attribute` (
  `sku_attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_attr_name` varchar(64) DEFAULT NULL COMMENT '属性名称',
  `sku_attr_code` varchar(32) DEFAULT NULL,
  `is_mutex` smallint(6) DEFAULT NULL COMMENT '1:互斥 0:兼容',
  `sku_attr_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `unit_id` int(11) DEFAULT NULL COMMENT '属性单位',
  `manage_flag` int(11) DEFAULT '0' COMMENT '1:管理标签 0:非管理标签',
  PRIMARY KEY (`sku_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

/*Table structure for table `sku_attribute_rel` */

CREATE TABLE `sku_attribute_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `sku_attr_value_id` int(11) NOT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省份名称',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `city_name` varchar(20) DEFAULT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`),
  KEY `sku_id_index` (`sku_id`) USING BTREE,
  KEY `sku_attr_value_id` (`sku_attr_value_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129194 DEFAULT CHARSET=utf8 COMMENT='商品属性关系表';

/*Table structure for table `sku_life_config` */

CREATE TABLE `sku_life_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的过期时间达到预警的配置表id',
  `config_name` varchar(20) DEFAULT NULL COMMENT '商品的过期时间达到预警的名称',
  `config_min` int(11) DEFAULT NULL COMMENT '保质期天数的最小天数(保质期计算区间)',
  `config_max` int(11) DEFAULT NULL COMMENT '保质期天数的最大天数(保质期计算区间)',
  `sale_period` int(11) DEFAULT NULL COMMENT '销售期',
  `risk_type` int(11) DEFAULT NULL COMMENT '风险期类型 1:只取分子的值 2:通过分子分母计算',
  `risk_numerator` int(11) DEFAULT NULL COMMENT '风险期：分子的值  或是常量',
  `risk_denominator` int(6) DEFAULT NULL COMMENT '风险期：分母的值',
  `freezing_type` int(11) DEFAULT NULL COMMENT '冻结期类型 1:只取分子的值 2:通过分子分母计算',
  `freezing_numerator` int(11) DEFAULT NULL COMMENT '冻结期：分子的值  或是常量',
  `freezing_denominator` int(6) DEFAULT NULL COMMENT '冻结期：分母的值',
  `end_type` int(11) DEFAULT NULL COMMENT '报废期类型 1:只取分子的值 2:通过分子分母计算',
  `end_numerator` int(11) DEFAULT NULL COMMENT '报废期:分子的值   或常量',
  `end_denominator` int(6) DEFAULT NULL COMMENT '报废期:分母的值',
  PRIMARY KEY (`config_id`),
  KEY `config_index` (`config_min`,`config_max`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品的过期时间达到预警的配置表';

/*Table structure for table `sku_main` */

CREATE TABLE `sku_main` (
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
  `temp_area_id` int(11) DEFAULT NULL COMMENT '温区id',
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
  `if_material_pull` smallint(6) DEFAULT '0' COMMENT '是否参与原料拉动 0：否 1：是',
  `sale_mode` smallint(6) DEFAULT '0' COMMENT '销售模式 1自营 2三方',
  `to_c` smallint(6) DEFAULT '0' COMMENT 'toC',
  `new_sku_date` datetime DEFAULT NULL COMMENT '新品日期',
  `plu_no` int(8) NOT NULL DEFAULT '0' COMMENT 'plu码',
  `is_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '称重标识 2-不称重，1-称重',
  `sku_component` varchar(128) NOT NULL DEFAULT '' COMMENT 'sku主要成分',
  `product_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品三级分类名称',
  `first_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `first_class_name` varchar(64) NOT NULL DEFAULT '' COMMENT '三级分类名称',
  PRIMARY KEY (`sku_id`),
  KEY `idx_plu` (`plu_no`) USING BTREE,
  KEY `idx_upc` (`upc_no`(12)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息表';

/*Table structure for table `sku_qc_conf` */

CREATE TABLE `sku_qc_conf` (
  `conf_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT '0' COMMENT '配置sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT '商品名称',
  `sku_type` int(11) DEFAULT '0' COMMENT '商品类型',
  `upc_no` varchar(32) DEFAULT '' COMMENT 'upcno',
  `product_class_id` int(11) DEFAULT '0' COMMENT '商品三级分类',
  `need_test` tinyint(4) DEFAULT '0' COMMENT '是否需要检测：0、未知 1、是 2、否',
  `is_lab` char(1) DEFAULT 'N' COMMENT '是否指定实验室',
  `lab_id` int(11) DEFAULT '0' COMMENT '实验室id',
  `lab_name` varchar(50) DEFAULT '' COMMENT '实验室名称',
  `test_cyc` tinyint(4) DEFAULT '0' COMMENT '检测周期',
  `cyc_days` smallint(4) DEFAULT '0' COMMENT '周期天数',
  `entry_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '添加时间',
  `entry_name` varchar(32) DEFAULT '' COMMENT '添加人姓名',
  `conf_name` varchar(32) DEFAULT '' COMMENT '设置人姓名',
  `conf_datetime` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '设置时间',
  PRIMARY KEY (`conf_id`),
  UNIQUE KEY `sku_idindex` (`sku_id`) USING BTREE,
  KEY `upc_noindex` (`upc_no`) USING BTREE,
  KEY `sku_typeindexz` (`sku_type`) USING BTREE,
  KEY `product_class_idindex` (`product_class_id`) USING BTREE,
  KEY `need_testindex` (`need_test`) USING BTREE,
  KEY `test_cycindex` (`test_cyc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131430 DEFAULT CHARSET=utf8 COMMENT='品控工作台sku配置表';

/*Table structure for table `stock_sale_earlywarning_log` */

CREATE TABLE `stock_sale_earlywarning_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'skuå',
  `sale_num` int(11) DEFAULT NULL COMMENT 'é”€å”®æ—¥æœŸå½“å¤©é”€å”®æ•°é‡',
  `lv1_class` bigint(20) NOT NULL COMMENT 'å•†å“ä¸€çº§åˆ†ç±»',
  `lv2_class` bigint(20) NOT NULL COMMENT 'å•†å“äºŒçº§åˆ†ç±»',
  `lv3_class` bigint(20) NOT NULL COMMENT 'å•†å“ä¸‰çº§åˆ†ç±»',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'è®°å½•åˆ›å»ºæ—¥æœŸYyyymmdd hhmmss',
  `sale_date` timestamp NULL DEFAULT NULL COMMENT 'é”€å”®æ—¥æœŸyyyymmdd',
  PRIMARY KEY (`id`),
  KEY `sku_id_idx` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1684472 DEFAULT CHARSET=utf8 COMMENT='åŠ¨é”€è¡¨';

/*Table structure for table `success_killed` */

CREATE TABLE `success_killed` (
  `seckill_id` bigint(20) NOT NULL COMMENT '秒杀商品ID',
  `user_phone` bigint(20) NOT NULL COMMENT '用户手机号',
  `state` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标识:-1:无效 0:成功 1:已付款 2:已发货',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`,`user_phone`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

/*Table structure for table `temperature_area` */

CREATE TABLE `temperature_area` (
  `temp_area_id` int(11) NOT NULL,
  `temp_area_name` varchar(64) DEFAULT NULL COMMENT '温区标示',
  `start_temp` float DEFAULT NULL COMMENT '起始温度',
  `end_temp` float DEFAULT NULL COMMENT '结束温度',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  PRIMARY KEY (`temp_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='温区维表';

/*Table structure for table `unit` */

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名',
  `unit_code` varchar(16) DEFAULT NULL COMMENT '英文编码',
  `unit_num` float DEFAULT NULL COMMENT '计算值',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位';

/*Table structure for table `warehouse` */

CREATE TABLE `warehouse` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `ware_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仓库编号',
  `region_id` int(11) DEFAULT NULL COMMENT '行政区域id',
  `ware_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仓库名称',
  `postal_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编号',
  `ware_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仓库地址',
  `ware_type` smallint(6) DEFAULT NULL COMMENT '仓库类型  0：自有仓库；1：供应商虚拟仓 2：虚拟仓 3：春播超市 4：委派加工虚拟仓 5：前置仓 6：家佳果蔬',
  `container_sn` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '魔盒货柜号',
  `contact_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone_no` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `ware_addr1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ware_addr2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL COMMENT '所属分公司id',
  `org_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属分公司名称',
  `timing_arrival_flag` int(4) DEFAULT '0' COMMENT '定时达标志1是 0非',
  `offline_sales_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '线下销售账号',
  `parent_ware` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '父仓库',
  PRIMARY KEY (`ware_id`),
  KEY `ind_ware_name` (`ware_name`(64))
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `warehouse_carrier_rel` */

CREATE TABLE `warehouse_carrier_rel` (
  `ware_carrier_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商编号',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '承运商名称',
  PRIMARY KEY (`ware_carrier_rel_id`),
  KEY `fk_carrier_ware_idx` (`ware_id`) USING BTREE,
  CONSTRAINT `warehouse_carrier_rel_ibfk_1` FOREIGN KEY (`ware_id`) REFERENCES `warehouse` (`ware_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Table structure for table `warehouse_delivery_rel` */

CREATE TABLE `warehouse_delivery_rel` (
  `ware_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL,
  `deliveryarea_id` int(11) DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  PRIMARY KEY (`ware_area_id`),
  KEY `i_ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19076 DEFAULT CHARSET=utf8;

/*Table structure for table `warehouse_delivery_rel_bak` */

CREATE TABLE `warehouse_delivery_rel_bak` (
  `ware_area_id` int(11) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `deliveryarea_id` int(11) DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `warehouse_supplier_rel` */

CREATE TABLE `warehouse_supplier_rel` (
  `ware_supplier_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库编号',
  `supplier_id` int(11) NOT NULL COMMENT '供应商编号',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 0：无效 1：有效',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`ware_supplier_rel_id`),
  UNIQUE KEY `uk_ware_supplier` (`ware_id`,`supplier_id`) USING BTREE,
  CONSTRAINT `warehouse_supplier_rel_ibfk_1` FOREIGN KEY (`ware_id`) REFERENCES `warehouse` (`ware_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `work_process` */

CREATE TABLE `work_process` (
  `process_id` bigint(11) NOT NULL COMMENT '加工单id',
  `process_name` varchar(128) DEFAULT NULL COMMENT '加工单名称',
  `src_process_id` varchar(32) DEFAULT '' COMMENT '来源加工单id',
  `process_code` varchar(32) DEFAULT NULL COMMENT '加工单编号',
  `bom_id` int(11) DEFAULT NULL COMMENT '物料清单bom  id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `plan_work_date` datetime DEFAULT NULL COMMENT '计划生产日期',
  `is_lot` smallint(6) DEFAULT NULL COMMENT '是否指定批次',
  `use_sku_type` smallint(6) DEFAULT NULL COMMENT '加工单原料使用类型 0：按原料计划生产\r\n1：按成品计划生产，补料\r\n2：按成品计划生产，不补料',
  `process_type` smallint(6) DEFAULT '1' COMMENT '(作废)加工单类型，0：单一品加工；1：多成品合装',
  `product_number` int(11) DEFAULT NULL COMMENT '生产成品数量',
  `real_product_num` int(11) DEFAULT NULL COMMENT '实际生产成品数量，由仓库回传得到',
  `total_process_num` int(11) DEFAULT '0' COMMENT '累计加工数',
  `process_state` smallint(6) DEFAULT NULL COMMENT '加工单状态，有仓库回传得到,0:新建  1：加工中 2：加工完成',
  `work_id` int(11) DEFAULT NULL COMMENT '加工人id',
  `work_by` varchar(64) DEFAULT NULL COMMENT '加工人，有仓库回传过来',
  `work_date` datetime DEFAULT NULL COMMENT '建工中时间',
  `work_end_date` datetime DEFAULT NULL COMMENT '加工完成时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者，当前登录人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者，当前登录人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `cancel_cause` text COMMENT '取消原因',
  `sku_type` int(11) DEFAULT NULL COMMENT '成品类型   1：实体组套；2：虚拟组套',
  `inv_type` smallint(6) DEFAULT NULL COMMENT '1:正品;2:次品',
  `produce_type` int(11) DEFAULT '1' COMMENT ' 加工类型   1：组合；2 ：拆分',
  `pull_off_shelf_multiply` decimal(10,4) NOT NULL DEFAULT '1.0000' COMMENT '原料下架倍量',
  `cancel_user` varchar(64) DEFAULT NULL COMMENT '取消人',
  `work_type` smallint(6) DEFAULT '0' COMMENT '0：手动下加工单1：自动下加工单',
  `deliver_date` datetime DEFAULT NULL COMMENT '客户期望送达日期',
  `is_book_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否占可买',
  `is_lock` int(4) NOT NULL DEFAULT '0' COMMENT '是否被锁，0：未锁，1：锁定',
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加工单管理表';

/*Table structure for table `work_process_job` */

CREATE TABLE `work_process_job` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `job_flag` int(11) DEFAULT NULL COMMENT 'job 标志  0 新建  1成功',
  `process_flag` int(11) DEFAULT NULL COMMENT '加工标志  0需要计算成本  1 推送数据给采销',
  `process_id` bigint(20) DEFAULT NULL COMMENT '加工单编号',
  `bom_id` int(11) DEFAULT NULL COMMENT '物料清单id',
  `comments` varchar(64) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_process_id` (`process_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1235072 DEFAULT CHARSET=utf8 COMMENT='加工单加工完成后的相关job';

/*Table structure for table `work_product_cost` */

CREATE TABLE `work_product_cost` (
  `cost_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_id` bigint(20) DEFAULT NULL COMMENT '加工单号',
  `process_name` varchar(128) DEFAULT NULL COMMENT '加工单名称',
  `process_code` varchar(32) DEFAULT NULL COMMENT '加工单编号',
  `bom_id` int(11) DEFAULT NULL COMMENT '物料清单id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `process_type` smallint(6) DEFAULT NULL COMMENT '加工单类型',
  `real_product_num` int(11) DEFAULT NULL COMMENT '实际加工成品数',
  `product_cost` decimal(11,4) DEFAULT NULL COMMENT '加工成品成本单价',
  `total_cost` decimal(11,4) DEFAULT NULL COMMENT '加工成品成本总价',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `unit_id` int(11) DEFAULT NULL COMMENT '单位id',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商Id',
  PRIMARY KEY (`cost_id`),
  KEY `process_id_idx` (`process_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=418460 DEFAULT CHARSET=utf8 COMMENT='加工完成后，加工成品的成本';

/* Function  structure for function  `Num_char_extract` */

DELIMITER $$

/*!50003 CREATE DEFINER=`stock`@`172.16.%.%` FUNCTION `Num_char_extract`(Varstring VARCHAR(100)CHARSET utf8, flag INT) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE len INT DEFAULT 0;
	DECLARE Tmp VARCHAR(100) DEFAULT '';
	SET len=CHAR_LENGTH(Varstring);
	IF flag = 0 
	THEN
		WHILE len > 0 DO
		IF MID(Varstring,len,1)REGEXP'[0-9]' THEN
		SET Tmp=CONCAT(Tmp,MID(Varstring,len,1));
		END IF;
		SET len = len - 1;
		END WHILE;
	ELSEIF flag=1
	THEN
		WHILE len > 0 DO
		IF (MID(Varstring,len,1)REGEXP '[a-zA-Z]') 
		THEN
		SET Tmp=CONCAT(Tmp,MID(Varstring,len,1));
		END IF;
		SET len = len - 1;
		END WHILE;
	ELSEIF flag=2
	THEN
		WHILE len > 0 DO
		IF ( (MID(Varstring,len,1)REGEXP'[0-9]')
		OR (MID(Varstring,len,1)REGEXP '[a-zA-Z]') ) 
		THEN
		SET Tmp=CONCAT(Tmp,MID(Varstring,len,1));
		END IF;
		SET len = len - 1;
		END WHILE;
	ELSEIF flag=3
	THEN
		WHILE len > 0 DO
		IF NOT (MID(Varstring,len,1)REGEXP '^[u0391-uFFE5]')
		THEN
		SET Tmp=CONCAT(Tmp,MID(Varstring,len,1));
		END IF;
		SET len = len - 1;
		END WHILE;
	ELSE 
		SET Tmp = 'Error: The second paramter should be in (0,1,2,3)';
		RETURN Tmp;
	END IF;
	RETURN REVERSE(Tmp);
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

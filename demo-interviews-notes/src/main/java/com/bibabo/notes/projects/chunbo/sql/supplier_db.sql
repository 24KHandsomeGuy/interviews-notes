/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - supplier_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`supplier_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `bank_code` */

CREATE TABLE `bank_code` (
  `bank_code_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '银行编码id',
  `bank_code` varchar(16) DEFAULT NULL COMMENT '银行编码',
  `bank_name` varchar(128) DEFAULT NULL COMMENT '银行名',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '1:有效 0:无效',
  `bank_country_code_id` int(11) DEFAULT NULL,
  `bank_country_name` varchar(16) DEFAULT '' COMMENT '国家名称',
  `bank_of_class` varchar(50) NOT NULL DEFAULT '' COMMENT '行别',
  `province_id` int(11) DEFAULT '0' COMMENT '省id',
  `province_name` varchar(50) DEFAULT '' COMMENT '省',
  `city_id` int(11) DEFAULT '0' COMMENT '市id',
  `city_name` varchar(50) DEFAULT '' COMMENT '市',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(16) DEFAULT 'SYSTEM' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(16) DEFAULT 'SYSTEM' COMMENT '更新人',
  PRIMARY KEY (`bank_code_id`),
  KEY `fk_bank_code_country` (`bank_country_code_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2804 DEFAULT CHARSET=utf8 COMMENT='银行编码';

/*Table structure for table `book` */

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `brand` */

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(32) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3278 DEFAULT CHARSET=utf8 COMMENT='品牌维表';

/*Table structure for table `brand1` */

CREATE TABLE `brand1` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(32) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌维表';

/*Table structure for table `brand2` */

CREATE TABLE `brand2` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(32) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌维表';

/*Table structure for table `calendar` */

CREATE TABLE `calendar` (
  `datelist` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `card_apply` */

CREATE TABLE `card_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL COMMENT '计划编号',
  `apply_name` varchar(64) DEFAULT NULL COMMENT '计划申请名称',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商编号',
  `supplier_name` varchar(64) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `purchase_user` varchar(64) DEFAULT NULL COMMENT '销售人员',
  `status` tinyint(4) DEFAULT NULL COMMENT '计划状态',
  `purchase_type` tinyint(4) DEFAULT NULL COMMENT '采购类型',
  `quantity` decimal(16,4) DEFAULT NULL COMMENT '采购数量',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购单价',
  `order_amount` decimal(16,4) DEFAULT NULL COMMENT '采购总金额',
  `plan_type` tinyint(4) DEFAULT NULL COMMENT '计划类型',
  `ware_id` tinyint(4) DEFAULT NULL COMMENT '仓库ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `add_by` varchar(64) DEFAULT NULL COMMENT '申请人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) DEFAULT NULL,
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审批时间',
  `audit_by` varchar(64) DEFAULT NULL COMMENT '审批人',
  `card_type` tinyint(4) DEFAULT NULL,
  `card_name` varchar(64) DEFAULT NULL,
  `card_name_show` varchar(64) DEFAULT NULL,
  `card_value` decimal(16,4) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `card_num` decimal(16,4) DEFAULT NULL,
  `is_more` tinyint(4) DEFAULT NULL,
  `card_sku` int(11) DEFAULT NULL,
  `card_sku_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `card_apply_detail` */

CREATE TABLE `card_apply_detail` (
  `card_apply_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `sku_name` varchar(64) DEFAULT NULL,
  `sku_alias_name` varchar(64) DEFAULT NULL,
  `delivery_desc` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `class_dept` */

CREATE TABLE `class_dept` (
  `class_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`class_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='创建分类和部分的对应表 (初始化权限用的临时表，请忽略 )';

/*Table structure for table `contract_agreement_files` */

CREATE TABLE `contract_agreement_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cm_agreement_id` varchar(64) NOT NULL COMMENT '合同/协议编码',
  `file_url` varchar(255) NOT NULL COMMENT '合同/协议文件url',
  `f_type` smallint(2) DEFAULT '1' COMMENT '1-合同 2-补充协议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

/*Table structure for table `contract_file` */

CREATE TABLE `contract_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '上传文件名称',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '上传文件地址',
  `file_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文件类别1-合同正本，2-补充协议',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created_by` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_by` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='上传文件';

/*Table structure for table `contract_info` */

CREATE TABLE `contract_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `agreement_id` varchar(255) NOT NULL DEFAULT '' COMMENT '补充协议编号',
  `contract_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '合同编码',
  `sign_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '签订日期',
  `contract_type_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '合同类型',
  `manager` varchar(255) NOT NULL DEFAULT '' COMMENT '经办人',
  `effective_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '合同日期（起）',
  `expiry_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '合同日期（止）',
  `created_by` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_by` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `multifile` varchar(255) DEFAULT '' COMMENT '合同上传ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='合同信息表';

/*Table structure for table `contract_management` */

CREATE TABLE `contract_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cm_id` varchar(64) NOT NULL COMMENT '合同编码',
  `c_object` bigint(20) NOT NULL COMMENT '签约对象',
  `sign_subject` varchar(64) NOT NULL DEFAULT '' COMMENT '签约主体',
  `cm_type` int(4) DEFAULT '1' COMMENT '合同类型',
  `purchase_group` int(4) DEFAULT '1' COMMENT '采购组-对应一级分类',
  `tax_type` int(4) DEFAULT '1' COMMENT '纳税类型',
  `department` varchar(64) NOT NULL COMMENT '经办部门',
  `is_return` smallint(2) DEFAULT '1' COMMENT '是允许否退货 1-退 0-不退',
  `return_policy` varchar(255) DEFAULT '' COMMENT '退货说明',
  `no_return_compensation` decimal(5,2) DEFAULT '0.00' COMMENT '不退货补偿',
  `freight_support` decimal(5,2) DEFAULT '0.00' COMMENT '运费支持',
  `damage_compensation_rate` decimal(5,2) DEFAULT '0.00' COMMENT '残损补偿率',
  `gross_compensation` smallint(2) DEFAULT '1' COMMENT '是否毛利补偿',
  `settle_method` smallint(2) DEFAULT '1' COMMENT '结算方式',
  `vendor_account` smallint(2) DEFAULT '1' COMMENT '供应商账期',
  `porder_create` decimal(5,2) DEFAULT '0.00' COMMENT '采购单创建 -- 预付款时机',
  `arrival_registration` decimal(5,2) DEFAULT '0.00' COMMENT '到货登记 -- 预付款时机',
  `receiving_completed` decimal(5,2) DEFAULT '0.00' COMMENT '收货完成 -- 预付款时机',
  `settle_object` bigint(20) DEFAULT NULL COMMENT '关联结算对象',
  `delivery_method` smallint(2) DEFAULT '1' COMMENT '交货方式',
  `manager` varchar(64) NOT NULL COMMENT '经办人',
  `effective_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效日期',
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效日期',
  `contract_file` smallint(2) NOT NULL COMMENT '合同文件上传 1-上传 0-未上传',
  `circulation_license_expiry` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '流通许可证失效日期',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `income_pay_type` smallint(2) DEFAULT '1' COMMENT '收入/支出类型',
  `income_pay_money` decimal(10,2) DEFAULT '0.00' COMMENT '收入/支出金额',
  `income_pay_memo` varchar(255) DEFAULT '' COMMENT '收入/支出备注',
  `advance_payment_ratio` decimal(5,2) DEFAULT NULL COMMENT '预付款比例',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `contract_status` int(4) DEFAULT '0' COMMENT '合同状态',
  `is_agreement` smallint(6) DEFAULT '0' COMMENT '是否有补充协议 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

/*Table structure for table `contract_return` */

CREATE TABLE `contract_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `contract_id` varchar(255) NOT NULL DEFAULT '',
  `return_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '返回换类型 1-月返，2-季返，3-年返，4-与账期一致',
  `return_mode` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '返点方式 1-固定额度，2-阶梯全额，3-阶梯超额 , 4-固定比率 ， 5-固定金额',
  `amount` decimal(15,4) DEFAULT '-1.0000' COMMENT '到达金额',
  `amount1` decimal(15,4) DEFAULT '-1.0000' COMMENT '返还金额',
  `is_valid` tinyint(4) NOT NULL DEFAULT '1',
  `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态  0-审核中 1-审核通过',
  `created_by` varchar(255) DEFAULT '',
  `created_date` timestamp NULL DEFAULT '1970-10-01 00:00:00',
  `update_by` varchar(255) DEFAULT '',
  `update_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='合同采购返点详情表';

/*Table structure for table `country_code` */

CREATE TABLE `country_code` (
  `country_code_id` int(11) NOT NULL,
  `country_code` varchar(16) DEFAULT NULL,
  `country_name` varchar(128) DEFAULT NULL COMMENT '国家名',
  PRIMARY KEY (`country_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国家编码';

/*Table structure for table `currency_type` */

CREATE TABLE `currency_type` (
  `currency_type_id` int(11) NOT NULL COMMENT '币种id',
  `currency_type_name` varchar(32) DEFAULT NULL COMMENT '币种名',
  `currency_type_code` varchar(16) DEFAULT NULL COMMENT '币种编码',
  `bank_country_code_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`currency_type_id`),
  KEY `fk_country_currency` (`bank_country_code_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='币种表\r\n';

/*Table structure for table `date_range` */

CREATE TABLE `date_range` (
  `sku_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `gross_retrurn_type` */

CREATE TABLE `gross_retrurn_type` (
  `gross_retrurn_type_id` int(11) NOT NULL,
  `gross_retrurn_type_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`gross_retrurn_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='毛利补偿方式';

/*Table structure for table `num` */

CREATE TABLE `num` (
  `i` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `order_site_assignment` */

CREATE TABLE `order_site_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型 1正常，2宅配，3闪购，4预售，5极致新鲜',
  `site_type` smallint(6) DEFAULT NULL COMMENT '站点类型 1仓库，2 原产地',
  `site_id` bigint(20) DEFAULT NULL COMMENT '站点 id(仓库id或原发地id)',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '规则生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '规则结束时间',
  `stop_time` timestamp NULL DEFAULT NULL COMMENT '规则提前停止时间',
  `valid` smallint(6) DEFAULT NULL COMMENT '有效性 1有效，2无效',
  `comments` varchar(100) DEFAULT NULL COMMENT '备注',
  `priority` smallint(6) DEFAULT NULL COMMENT '优先级 1为最地级，依次为较高优先级',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(38) DEFAULT NULL,
  `update_by` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_time_valid` (`valid`)
) ENGINE=InnoDB AUTO_INCREMENT=111108 DEFAULT CHARSET=utf8 COMMENT='订单站点分配规则';

/*Table structure for table `os_outstock_order` */

CREATE TABLE `os_outstock_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outstock_order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '出库单id -OEMO+5位流水',
  `os_order_id` varchar(32) NOT NULL COMMENT '委外订单id',
  `collar_order_id` varchar(128) DEFAULT '' COMMENT '领用单号',
  `status` tinyint(3) DEFAULT '0' COMMENT '出库单状态0新建1推送领用申请2申请成功',
  `ware_id` bigint(20) NOT NULL COMMENT '仓库id',
  `ware_name` varchar(128) DEFAULT '' COMMENT '仓库名称',
  `supplier_id` bigint(20) NOT NULL COMMENT '加工商id',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名称',
  `delivery_address` varchar(255) NOT NULL COMMENT '收货地址',
  `plan_date` date NOT NULL COMMENT '计划出库日期',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `os_outstock_order_detail` */

CREATE TABLE `os_outstock_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outstock_order_id` varchar(32) NOT NULL COMMENT '出库单id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `p_apply_detail` */

CREATE TABLE `p_apply_detail` (
  `p_apply_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_apply_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku编号',
  `is_raw_material` smallint(6) DEFAULT NULL COMMENT '1:原材料 0:成品',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `on_sale` smallint(6) DEFAULT NULL COMMENT '是否促销',
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `ware_name` varchar(128) DEFAULT NULL,
  `sku_code` varchar(32) DEFAULT NULL COMMENT 'sku编码',
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '促销价',
  `tax_price` decimal(16,4) DEFAULT NULL COMMENT '正常采购价',
  `price` decimal(16,4) unsigned zerofill DEFAULT NULL COMMENT '当前采购价',
  `upc_no` varchar(32) DEFAULT NULL COMMENT 'upc编码',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码编号',
  `tax_code_name` varchar(32) DEFAULT NULL COMMENT '税码名',
  `tax_code_value` decimal(16,4) DEFAULT NULL COMMENT '税码编号',
  `quantity` decimal(16,4) DEFAULT NULL COMMENT '采购数量',
  `suggest_num` int(11) DEFAULT NULL COMMENT '建议数量',
  `stock_num` int(11) DEFAULT NULL COMMENT '库存数量',
  `no_tax_price` decimal(16,4) DEFAULT NULL COMMENT '未税进价',
  `unit` varchar(32) DEFAULT NULL COMMENT '计量单位',
  `goods_amount` decimal(16,4) DEFAULT NULL COMMENT '总金额',
  `is_gift` smallint(6) DEFAULT '0' COMMENT '是否赠品，0非赠品，1赠品',
  `box_std` varchar(32) DEFAULT NULL COMMENT '规格',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `sale_tax_code_id` int(11) DEFAULT NULL,
  `sale_tax_code_name` varchar(32) DEFAULT NULL,
  `sale_tax_code_value` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`p_apply_detail_id`),
  KEY `idx_apply_id` (`p_apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1047007 DEFAULT CHARSET=utf8 COMMENT='采购申请单详情表';

/*Table structure for table `p_apply_info` */

CREATE TABLE `p_apply_info` (
  `p_apply_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_apply_sn` varchar(32) DEFAULT NULL COMMENT '采购申请单号',
  `status` smallint(6) DEFAULT NULL COMMENT '采购单状态 1:待审批 2:审批通过 7:采购申请单拆分完成 -1:驳回 -2:撤销 -3:作废',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商编号',
  `supplier_name` varchar(256) DEFAULT NULL COMMENT '供应商名称',
  `employee_id` int(11) DEFAULT NULL COMMENT '采购人员id(purchase_employee表)',
  `predict_date` varchar(32) DEFAULT NULL COMMENT '预计送达日期',
  `order_date` varchar(32) DEFAULT NULL COMMENT '期望下单时间',
  `comments` varchar(500) DEFAULT NULL,
  `order_keep_days` int(11) DEFAULT NULL COMMENT '订单保留天数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `employee_name` varchar(64) DEFAULT NULL COMMENT '采购员姓名',
  `employee_phone` varchar(16) DEFAULT NULL COMMENT '采购员电话',
  `employee_email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `approv_time` timestamp NULL DEFAULT NULL COMMENT '审批日期',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  `create_by` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '采购类型',
  `is_valid` smallint(6) DEFAULT '0' COMMENT '是否关闭',
  `p_apply_type` int(11) DEFAULT '0' COMMENT '0正常采购单申请，1预售采购单申请，2极致鲜鲜申请',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `supplier_pay_duration` int(11) DEFAULT NULL COMMENT '供应商账期',
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id',
  `is_need_pickup` smallint(6) DEFAULT NULL COMMENT ' 是否需要提货 1- 是 0- 否 ',
  `supplier_contacts` varchar(64) DEFAULT NULL COMMENT ' 供应商联系人 ',
  `supplier_tel` varchar(16) DEFAULT NULL COMMENT ' 供应商联系电话 ',
  `pickup_address_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_apply_id`),
  KEY `cdi_idx` (`category_dept_id`,`is_valid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=272932 DEFAULT CHARSET=utf8 COMMENT='采购单申请表';

/*Table structure for table `p_apply_ware_detail_bak` */

CREATE TABLE `p_apply_ware_detail_bak` (
  `p_apply_ware_detail_id` bigint(20) NOT NULL DEFAULT '0',
  `p_apply_detail_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `quantity` int(11) DEFAULT NULL COMMENT '采购数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `p_apply_ware_transfer` */

CREATE TABLE `p_apply_ware_transfer` (
  `p_apply_ware_transfer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dest_ware_id` int(11) DEFAULT NULL COMMENT '到货仓id',
  `transfer_ware_id` int(11) DEFAULT NULL COMMENT '中转仓id',
  `predict_date` varchar(32) DEFAULT NULL COMMENT '预计交货日期',
  `p_apply_id` bigint(20) DEFAULT NULL COMMENT '采购申请单id',
  PRIMARY KEY (`p_apply_ware_transfer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=318496 DEFAULT CHARSET=utf8 COMMENT='采购申请单中转仓库表';

/*Table structure for table `p_apply_ware_transfer_bak` */

CREATE TABLE `p_apply_ware_transfer_bak` (
  `p_apply_ware_transfer_id` bigint(20) NOT NULL DEFAULT '0',
  `dest_ware_id` int(11) DEFAULT NULL COMMENT '到货仓id',
  `transfer_ware_id` int(11) DEFAULT NULL COMMENT '中转仓id',
  `predict_date` varchar(32) DEFAULT NULL COMMENT '预计交货日期',
  `p_apply_id` bigint(20) DEFAULT NULL COMMENT '采购申请单id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `p_order` */

CREATE TABLE `p_order` (
  `porder_id` bigint(20) NOT NULL,
  `porder_sn` varchar(45) DEFAULT NULL COMMENT '采购单号',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商',
  `order_type` smallint(6) DEFAULT NULL COMMENT '订单类型0：正常1：虚拟2退货',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `status` smallint(6) DEFAULT NULL COMMENT '采购单状态',
  `goods_amount` decimal(16,4) DEFAULT NULL COMMENT '商品金额',
  `ship_amount` decimal(16,4) DEFAULT NULL COMMENT '配送费',
  `order_amount` decimal(16,4) DEFAULT NULL COMMENT '订单金额',
  `postscript` varchar(500) DEFAULT NULL,
  `ship_date` timestamp NULL DEFAULT NULL COMMENT '预计送货时间',
  `finished_time` timestamp NULL DEFAULT NULL COMMENT '订单完成时间',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '生成时间',
  `employee_name` varchar(45) DEFAULT NULL COMMENT '采购员',
  `employ_phone` varchar(45) DEFAULT NULL COMMENT '采购员电话',
  `employ_id` int(11) DEFAULT NULL,
  `order_keep_days` int(11) DEFAULT NULL COMMENT '订单保留天数',
  `purchasing_term_id` int(11) DEFAULT NULL COMMENT '采购组id',
  `purchasing_term` varchar(45) DEFAULT NULL COMMENT '采购组',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '1:加锁 0:未加锁',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码',
  `p_apply_id` bigint(20) DEFAULT NULL COMMENT '原申请单号/退货单的订单号',
  `ship` varchar(32) DEFAULT NULL COMMENT '配送方式',
  `create_by` varchar(32) DEFAULT NULL COMMENT '录入员',
  `p_apply_sn` varchar(32) DEFAULT NULL COMMENT '原申请单号/退货单的订单号',
  `transfer_ware_id` varchar(32) DEFAULT NULL COMMENT '中转仓id',
  `is_transfer` smallint(6) DEFAULT '0' COMMENT '是否中转，0否，1是',
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id',
  `porder_type` smallint(6) DEFAULT '0' COMMENT '0:手动建采购单1自动建生采购',
  `supplier_name` varchar(128) DEFAULT NULL,
  `ware_name` varchar(128) DEFAULT NULL,
  `is_need_pickup` smallint(6) DEFAULT NULL COMMENT ' 是否需要提货 1- 是 0- 否 ',
  `supplier_contacts` varchar(64) DEFAULT NULL COMMENT ' 供应商联系人 ',
  `supplier_tel` varchar(16) DEFAULT NULL COMMENT ' 供应商联系电话 ',
  `pickup_address_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`porder_id`),
  KEY `idx_status_porder_id` (`status`,`supplier_id`,`ware_id`,`porder_id`),
  KEY `idx_sn_order` (`order_type`,`p_apply_sn`),
  KEY `idx_apply_id` (`transfer_ware_id`,`order_type`,`category_dept_id`),
  KEY `idx_p_apply_id` (`p_apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单';

/*Table structure for table `p_price_action` */

CREATE TABLE `p_price_action` (
  `price_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `his_price` decimal(16,2) DEFAULT NULL COMMENT '修改之前价格',
  `now_price` decimal(16,2) DEFAULT NULL COMMENT '现在价格',
  `is_gross` smallint(6) DEFAULT NULL COMMENT '是否毛利补偿0：否1：是',
  `gross_type` smallint(6) DEFAULT NULL COMMENT '毛利补偿方式1：库存2：销量',
  `is_process` smallint(6) DEFAULT '0' COMMENT '是否处理',
  `end_time` timestamp NULL DEFAULT NULL,
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '价格生效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `create_by` varchar(32) DEFAULT NULL,
  `is_lock` smallint(6) DEFAULT '0' COMMENT '1:加锁 0:未加锁',
  `price_type` smallint(6) DEFAULT '0' COMMENT '价格类型0：正常价1：促销价',
  `ware_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`price_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96686 DEFAULT CHARSET=utf8 COMMENT='调价动作表';

/*Table structure for table `pay_type` */

CREATE TABLE `pay_type` (
  `pay_type_id` int(11) NOT NULL,
  `pay_type_name` varchar(32) DEFAULT NULL COMMENT '付款类型',
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款类型维表';

/*Table structure for table `porder_goods` */

CREATE TABLE `porder_goods` (
  `porder_goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_order_id` bigint(11) DEFAULT NULL,
  `sku_id` bigint(11) DEFAULT NULL,
  `sku_code` varchar(45) DEFAULT NULL COMMENT 'sku编号',
  `sku_name` varchar(256) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(16,4) DEFAULT NULL COMMENT '采购价',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `quantity` decimal(16,4) DEFAULT NULL COMMENT '数量',
  `upc` varchar(45) DEFAULT NULL COMMENT 'upc码',
  `no_tax_price` decimal(16,4) DEFAULT NULL,
  `sku_lot` varchar(32) DEFAULT NULL COMMENT '退货明细批次',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `tax_total` decimal(16,4) DEFAULT '0.0000',
  `inventory_type` smallint(6) DEFAULT '1' COMMENT '库存类型-1正品0残品',
  `modify_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `tax_code` varchar(10) DEFAULT NULL COMMENT '税码',
  `tax_code_value` decimal(16,4) DEFAULT NULL COMMENT '税码值',
  `sale_tax_code_id` int(11) DEFAULT '-1' COMMENT '销项税ID',
  `sale_tax_code_name` varchar(10) NOT NULL DEFAULT '',
  `sale_tax_code_value` decimal(16,4) NOT NULL DEFAULT '-1.0000',
  `c_price` decimal(16,4) DEFAULT '-1.0000' COMMENT '地采商品春播售卖给开霖加价5%',
  `c_price1` decimal(16,4) DEFAULT '-1.0000' COMMENT '地采商品春播售卖给开霖加价5%',
  PRIMARY KEY (`porder_goods_id`),
  KEY `p_order_id_index` (`p_order_id`,`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6571043 DEFAULT CHARSET=utf8 COMMENT='采购单商品';

/*Table structure for table `porder_receive` */

CREATE TABLE `porder_receive` (
  `porder_receive_id` bigint(20) NOT NULL COMMENT '采购单',
  `porder_id` int(11) DEFAULT NULL COMMENT '订单号',
  `invoice_no` varchar(32) DEFAULT NULL COMMENT '发货单号',
  `consignee` varchar(64) DEFAULT NULL COMMENT '收货人',
  `predict_date` date DEFAULT NULL COMMENT '送货时间',
  `region_name` varchar(128) DEFAULT NULL COMMENT '收货地区',
  `address` varchar(128) DEFAULT NULL COMMENT '收货地址',
  `zipcode` varchar(16) DEFAULT NULL COMMENT '邮编',
  `phone_tel` varchar(16) DEFAULT NULL COMMENT '座机',
  `phone_mob` varchar(16) DEFAULT NULL COMMENT '手机',
  `shipping_name` varchar(64) DEFAULT NULL COMMENT '运输方式',
  `shipping_fee` decimal(16,4) DEFAULT NULL COMMENT '运输费用',
  PRIMARY KEY (`porder_receive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单的扩展信息';

/*Table structure for table `porder_receive_detail` */

CREATE TABLE `porder_receive_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `porder_receive_id` bigint(20) NOT NULL COMMENT '库房生成的收货号',
  `porder_id` bigint(20) NOT NULL COMMENT '采购单id',
  `porder_sn` varchar(32) DEFAULT NULL COMMENT '采购单编号',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_lot` varchar(45) DEFAULT NULL COMMENT '商品批次',
  `number` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `receive_date` datetime DEFAULT NULL COMMENT '收货日期',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `inventory_type` smallint(6) DEFAULT '1' COMMENT '库存类型-1正品0残品',
  `created_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_user` varchar(64) DEFAULT '' COMMENT '更新人',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工商',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_porder_receive_unique` (`porder_id`,`porder_receive_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4988765 DEFAULT CHARSET=utf8 COMMENT='采购收货明细表';

/*Table structure for table `porder_receive_detail_bk_20180209` */

CREATE TABLE `porder_receive_detail_bk_20180209` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `porder_receive_id` bigint(20) NOT NULL COMMENT '库房生成的收货号',
  `porder_id` bigint(20) NOT NULL COMMENT '采购单id',
  `porder_sn` varchar(32) DEFAULT NULL COMMENT '采购单编号',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_lot` varchar(45) DEFAULT NULL COMMENT '商品批次',
  `number` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `receive_date` datetime DEFAULT NULL COMMENT '收货日期',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `inventory_type` smallint(6) DEFAULT '1' COMMENT '库存类型-1正品0残品',
  `created_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(64) DEFAULT '' COMMENT '更新人',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工商',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_porder_receive_unique` (`porder_id`,`porder_receive_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=327928 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='采购收货明细表';

/*Table structure for table `porder_receive_detail_bk_20180704` */

CREATE TABLE `porder_receive_detail_bk_20180704` (
  `porder_receive_id` bigint(20) NOT NULL,
  `porder_id` bigint(20) NOT NULL COMMENT '采购单id',
  `porder_sn` varchar(32) DEFAULT NULL COMMENT '采购单编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_lot` varchar(45) DEFAULT NULL COMMENT '商品批次',
  `number` decimal(11,4) DEFAULT '0.0000' COMMENT '数量',
  `receive_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `inventory_type` smallint(6) DEFAULT '1' COMMENT '库存类型-1正品0残品',
  `created_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `update_user` varchar(64) DEFAULT '' COMMENT '更新人',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '加工商',
  PRIMARY KEY (`porder_receive_id`,`porder_id`),
  KEY `index_porder_id` (`porder_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购收货明细表';

/*Table structure for table `porder_tms_cost` */

CREATE TABLE `porder_tms_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) DEFAULT NULL COMMENT '采购单号',
  `order_type` smallint(4) DEFAULT NULL COMMENT '订单类型',
  `cost` decimal(16,4) DEFAULT NULL COMMENT '成本值',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(45) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47238 DEFAULT CHARSET=utf8 COMMENT='tms回传提货成本表';

/*Table structure for table `presaledetail_apply` */

CREATE TABLE `presaledetail_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `presale_detail_id` bigint(20) DEFAULT NULL COMMENT '预售订单ID',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '采购申请单ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `convert_time` datetime DEFAULT NULL COMMENT '生单时间',
  `hour` int(11) DEFAULT NULL COMMENT '延迟小时数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=601922 DEFAULT CHARSET=utf8 COMMENT='预售订单-采购申请单关系表';

/*Table structure for table `product_class` */

CREATE TABLE `product_class` (
  `product_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_class_name` varchar(64) DEFAULT NULL,
  `parent_product_class_id` int(11) DEFAULT NULL COMMENT '父分类',
  `class_level` smallint(6) DEFAULT NULL COMMENT '分类级别',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '进项税码编号',
  `sale_tax_code_id` int(11) DEFAULT NULL COMMENT '销项税编码',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tax_type_id` varchar(32) DEFAULT NULL COMMENT '进项税码编号',
  PRIMARY KEY (`product_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=400103473 DEFAULT CHARSET=utf8 COMMENT='商品三级分类表';

/*Table structure for table `product_class_bak` */

CREATE TABLE `product_class_bak` (
  `product_class_id` int(11) NOT NULL,
  `product_class_name` varchar(64) DEFAULT NULL,
  `parent_product_class_id` int(11) DEFAULT NULL COMMENT '父分类',
  `class_level` smallint(6) DEFAULT NULL COMMENT '分类级别',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `tax_code_id` int(11) DEFAULT NULL COMMENT '进项税码编号',
  `sale_tax_code_id` int(11) DEFAULT NULL COMMENT '销项税编码',
  PRIMARY KEY (`product_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `product_main` */

CREATE TABLE `product_main` (
  `product_id` bigint(20) NOT NULL COMMENT 'id',
  `product_name` varchar(128) DEFAULT NULL COMMENT '名称',
  `product_content` varchar(256) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='product主表';

/*Table structure for table `product_sku_relation` */

CREATE TABLE `product_sku_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23880 DEFAULT CHARSET=utf8;

/*Table structure for table `purchase_employee` */

CREATE TABLE `purchase_employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(64) DEFAULT NULL COMMENT '采购人员',
  `domain_name` varchar(64) DEFAULT NULL COMMENT '采购人员',
  `term_position` smallint(6) DEFAULT NULL COMMENT '职位信息',
  `position_level` smallint(6) DEFAULT NULL COMMENT '职位级别',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '0:无效 1:有效',
  `employee_mail` varchar(64) DEFAULT NULL COMMENT '采购员邮箱',
  `employee_tel` varchar(16) DEFAULT NULL COMMENT '采购人员联系电话',
  `employee_mobile` varchar(16) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购人员表';

/*Table structure for table `purchase_order_directsend` */

CREATE TABLE `purchase_order_directsend` (
  `purchase_order_directsend_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `p_order_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `p_apply_id` bigint(20) NOT NULL COMMENT '采购申请单id',
  `s_order_id` bigint(20) NOT NULL COMMENT '订单id',
  `erp_in_json` text COMMENT 'erp虚拟入库json数据',
  `erp_in_status` int(11) DEFAULT '0' COMMENT 'erp虚拟入库状态，0新建，1待入库，2成功，3失败，4直接关闭',
  `erp_in_date` timestamp NULL DEFAULT NULL COMMENT 'erp虚拟入库时间',
  `erp_out_json` text COMMENT 'erp虚拟出库json数据',
  `erp_out_status` int(11) DEFAULT '0' COMMENT 'erp虚拟出库状态，0新建，1待出库，2成功，3失败，4直接关闭',
  `erp_out_date` timestamp NULL DEFAULT NULL COMMENT 'erp虚拟出库时间',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `convert_time` datetime DEFAULT NULL COMMENT '生单时间',
  `hour` int(11) DEFAULT NULL COMMENT '延迟小时数',
  PRIMARY KEY (`purchase_order_directsend_id`),
  KEY `s_order_id_index` (`s_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34578 DEFAULT CHARSET=utf8 COMMENT='porder原产地直发';

/*Table structure for table `purchase_receive_virtual` */

CREATE TABLE `purchase_receive_virtual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `porder_id` bigint(20) NOT NULL COMMENT '采购单号',
  `porder_sn` varchar(32) DEFAULT '' COMMENT '采购单sn',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名称',
  `sku_unit_name` varchar(16) DEFAULT '' COMMENT '单位',
  `sku_lot` varchar(32) DEFAULT '' COMMENT '批次',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `receive_quantity` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '收货数量',
  `order_quantity` decimal(12,2) DEFAULT '0.00' COMMENT '订单数量',
  `receive_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货日期',
  `supplier_id` bigint(20) NOT NULL COMMENT '加工商',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '加工商名',
  `created_by` varchar(32) DEFAULT '' COMMENT '记录创建人',
  `creation_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `changed_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `last_changed_date` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=852 DEFAULT CHARSET=utf8 COMMENT='虚拟收货表';

/*Table structure for table `purchase_return` */

CREATE TABLE `purchase_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cm_agreement_id` varchar(64) NOT NULL COMMENT '合同/协议编码',
  `ca_type` smallint(2) DEFAULT NULL COMMENT '1-合同 2-补充协议',
  `return_cycle` int(4) DEFAULT '1' COMMENT '返还周期',
  `return_type` int(4) DEFAULT '1' COMMENT '返还类型',
  `return_quota` decimal(15,4) DEFAULT '0.0000' COMMENT '返还金额',
  `amount_from` decimal(15,2) DEFAULT '0.00' COMMENT '采购金额从',
  `amount_to` decimal(15,2) DEFAULT '0.00' COMMENT '采购金额到',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;

/*Table structure for table `purchaseing_term_rel` */

CREATE TABLE `purchaseing_term_rel` (
  `purchaseing_term_rel_id` int(11) NOT NULL,
  `purchasing_term_id` int(11) NOT NULL COMMENT '采购组',
  `employee_id` int(11) NOT NULL COMMENT '采购人员',
  PRIMARY KEY (`purchaseing_term_rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购人员所属组关系';

/*Table structure for table `purchasing_department` */

CREATE TABLE `purchasing_department` (
  `purchasing_department_id` int(11) NOT NULL,
  `org_id` int(11) DEFAULT NULL COMMENT '所属部门',
  `purchasing_department_name` varchar(128) DEFAULT NULL COMMENT '采购部门名',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '1:有效 0:无效',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`purchasing_department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购部门维表';

/*Table structure for table `purchasing_term` */

CREATE TABLE `purchasing_term` (
  `purchasing_term_id` int(11) NOT NULL,
  `purchasing_term` varchar(128) DEFAULT NULL,
  `purchasing_department_id` int(11) DEFAULT NULL COMMENT '采购部门',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '1:有效 0:无效',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`purchasing_term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购组表';

/*Table structure for table `push_by_time` */

CREATE TABLE `push_by_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_code` bigint(20) NOT NULL COMMENT 'sku编码',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始推送时间',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `is_lock` int(11) DEFAULT '0' COMMENT '是否加锁',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '处理时间',
  `operation_type` int(11) DEFAULT '0' COMMENT '推送对象',
  `bussiness_type` int(11) DEFAULT '0' COMMENT '业务对象',
  `cause` varbinary(64) DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114338 DEFAULT CHARSET=utf8 COMMENT='根据推送时间推送';

/*Table structure for table `push_log` */

CREATE TABLE `push_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '类型1:采购单2：预售信息',
  `b_id` bigint(11) DEFAULT NULL COMMENT '业务id',
  `b_sn` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `service_method` varchar(50) DEFAULT NULL COMMENT '业务方法',
  `status` int(11) DEFAULT '1' COMMENT '0:成功1新建2失败404:对方服务异常',
  `content` text COMMENT 'json串',
  `bussiness_type` int(11) DEFAULT NULL COMMENT '业务类型100:新建采购单101:新建虚拟103:销量毛利200：关闭采购单300：更新采购单400：采购收货',
  `operation_type` int(11) DEFAULT NULL COMMENT '推送对象0:供应商平台1:财务2:库房3：erp库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(50) DEFAULT NULL COMMENT '备注',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`log_id`),
  KEY `idx_lock_sta_send` (`is_lock`,`status`,`send_time`),
  KEY `idx_b_id` (`b_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=13392343 DEFAULT CHARSET=utf8 COMMENT='数据推送表';

/*Table structure for table `push_log_bk_20170828` */

CREATE TABLE `push_log_bk_20170828` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '类型1:采购单2：预售信息',
  `b_id` bigint(11) DEFAULT NULL COMMENT '业务id',
  `b_sn` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `service_method` varchar(50) DEFAULT NULL COMMENT '业务方法',
  `status` int(11) DEFAULT '1' COMMENT '0:成功1新建2失败404:对方服务异常',
  `content` text COMMENT 'json串',
  `bussiness_type` int(11) DEFAULT NULL COMMENT '业务类型100:新建采购单101:新建虚拟103:销量毛利200：关闭采购单300：更新采购单400：采购收货',
  `operation_type` int(11) DEFAULT NULL COMMENT '推送对象0:供应商平台1:财务2:库房3：erp库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(50) DEFAULT NULL COMMENT '备注',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3429610 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='数据推送表';

/*Table structure for table `push_log_copy` */

CREATE TABLE `push_log_copy` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '类型1:采购单2：预售信息',
  `b_id` bigint(11) DEFAULT NULL COMMENT '业务id',
  `b_sn` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `service_method` varchar(50) DEFAULT NULL COMMENT '业务方法',
  `status` int(11) DEFAULT '1' COMMENT '0:成功1新建2失败404:对方服务异常',
  `content` text COMMENT 'json串',
  `bussiness_type` int(11) DEFAULT NULL COMMENT '业务类型100:新建采购单101:新建虚拟103:销量毛利200：关闭采购单300：更新采购单400：采购收货',
  `operation_type` int(11) DEFAULT NULL COMMENT '推送对象0:供应商平台1:财务2:库房3：erp库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(50) DEFAULT NULL COMMENT '备注',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3429610 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='数据推送表';

/*Table structure for table `push_log_his` */

CREATE TABLE `push_log_his` (
  `log_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT '0' COMMENT '类型1:采购单2：预售信息',
  `b_id` bigint(11) DEFAULT NULL COMMENT '业务id',
  `b_sn` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `service_method` varchar(50) DEFAULT NULL COMMENT '业务方法',
  `status` int(11) DEFAULT '1' COMMENT '0:成功1新建2失败404:对方服务异常',
  `content` text COMMENT 'json串',
  `bussiness_type` int(11) DEFAULT NULL COMMENT '业务类型100:新建采购单101:新建虚拟103:销量毛利200：关闭采购单300：更新采购单400：采购收货',
  `operation_type` int(11) DEFAULT NULL COMMENT '推送对象0:供应商平台1:财务2:库房3：erp库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(50) DEFAULT NULL COMMENT '备注',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推送数据历史表';

/*Table structure for table `push_sku_chenge_log` */

CREATE TABLE `push_sku_chenge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `ware_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '推送状态：1-推送成功，2-不满足条件满足不需推送，0-推送失败需要重推',
  `message` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1257355 DEFAULT CHARSET=utf8;

/*Table structure for table `region` */

CREATE TABLE `region` (
  `region_id` varchar(16) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间',
  PRIMARY KEY (`region_id`),
  KEY `region_type_id_idx` (`region_level_id`) USING BTREE,
  KEY `parent_region_id` (`parent_region_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域维表';

/*Table structure for table `region_1` */

CREATE TABLE `region_1` (
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

/*Table structure for table `region_bak` */

CREATE TABLE `region_bak` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `region_bak0925` */

CREATE TABLE `region_bak0925` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `region_bak_2` */

CREATE TABLE `region_bak_2` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `region_level` */

CREATE TABLE `region_level` (
  `region_level_id` int(11) NOT NULL COMMENT '区域级别id',
  `region_level_name` varchar(64) DEFAULT NULL COMMENT '区域级别:1:省,2:市,3:县',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '国家名',
  PRIMARY KEY (`region_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域级别表';

/*Table structure for table `region_mapping_yuedian` */

CREATE TABLE `region_mapping_yuedian` (
  `district_id` int(11) NOT NULL COMMENT '悦店传入的三级地址',
  `chunbo_district_id` int(11) NOT NULL COMMENT '对应春播数据库的三级地址',
  `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `is_valid` tinyint(4) unsigned NOT NULL COMMENT '是否有效',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `retail_catalog_detail` */

CREATE TABLE `retail_catalog_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` bigint(20) DEFAULT NULL COMMENT 'sku_retail_catalog_main的catalog_id',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品id',
  `sku_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `status` smallint(6) DEFAULT '0' COMMENT '商品状态1有效8无效9新建',
  `shelf_num` varchar(180) DEFAULT '' COMMENT '货架号',
  `shelf_layer` int(11) DEFAULT '0' COMMENT '货架层',
  `shelf_seq` int(11) DEFAULT '0' COMMENT '货位顺序',
  `facing` int(11) DEFAULT '0' COMMENT '排面',
  `degree` int(11) DEFAULT '0' COMMENT '深度',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注（可以为空）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新人',
  `remark1` varchar(255) DEFAULT NULL COMMENT '注释1',
  PRIMARY KEY (`id`),
  KEY `idx_sku_catelogid` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1354 DEFAULT CHARSET=utf8 COMMENT='新商品经营目录明细表';

/*Table structure for table `retail_catalog_main` */

CREATE TABLE `retail_catalog_main` (
  `catalog_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '区域id',
  `region_name` varchar(255) DEFAULT '' COMMENT '区域名称',
  `first_class_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `first_class_name` varchar(255) DEFAULT NULL COMMENT '一级分类名称',
  `class_scale_id` smallint(6) NOT NULL DEFAULT '0' COMMENT '品类规模id1大型店2中性店3大型店',
  `class_scale_name` varchar(255) DEFAULT NULL COMMENT '品类规模名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`catalog_id`),
  UNIQUE KEY `retail_id` (`region_id`,`first_class_id`,`class_scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='新商品经营目录主表';

/*Table structure for table `retail_catalog_store` */

CREATE TABLE `retail_catalog_store` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `ware_name` varchar(255) DEFAULT NULL COMMENT '仓库名称',
  `catalog_id` bigint(20) unsigned DEFAULT '0' COMMENT 'sku_retail_catalog_main的id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ware_id` (`ware_id`,`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COMMENT='新商品经营目录店信息';

/*Table structure for table `site_address_rel` */

CREATE TABLE `site_address_rel` (
  `site_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province_code` varchar(20) DEFAULT '' COMMENT '省级地址ID',
  `province_name` varchar(128) DEFAULT '' COMMENT '省级地址名称',
  `city_code` varchar(128) DEFAULT '' COMMENT '市级地址ID',
  `city_name` varchar(128) DEFAULT '' COMMENT '市级地址名称',
  `area_code` varchar(128) DEFAULT '' COMMENT '三级地址编码',
  `area_name` varchar(128) DEFAULT '' COMMENT '三级地址名称',
  `site_code` varchar(20) DEFAULT '' COMMENT '站点编号',
  `site_name` varchar(128) DEFAULT '' COMMENT '站点名称',
  `is_valid` varchar(2) DEFAULT '' COMMENT '是否有效 0：无效；1：有效',
  `create_by` varchar(64) DEFAULT '',
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT '',
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`site_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='站点与地址对应关系表';

/*Table structure for table `sku_apply_age` */

CREATE TABLE `sku_apply_age` (
  `sku_apply_id` int(11) NOT NULL,
  `sku_apply_name` varchar(32) DEFAULT NULL COMMENT '适用人群',
  `sku_age_region` varchar(32) DEFAULT NULL COMMENT '年龄区间',
  PRIMARY KEY (`sku_apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku适用人群表';

/*Table structure for table `sku_apply_age_rel` */

CREATE TABLE `sku_apply_age_rel` (
  `sku_id` bigint(11) NOT NULL DEFAULT '0',
  `sku_apply_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku适用人群关系表';

/*Table structure for table `sku_attr_value` */

CREATE TABLE `sku_attr_value` (
  `sku_attr_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_attr_id` int(11) DEFAULT NULL,
  `sku_attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `sku_attr_value` varchar(32) DEFAULT NULL COMMENT '属性值',
  `attr_value_desc` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`sku_attr_value_id`),
  KEY `index_id_attr` (`sku_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18685 DEFAULT CHARSET=utf8 COMMENT='属性对应值';

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

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
) ENGINE=InnoDB AUTO_INCREMENT=201337 DEFAULT CHARSET=utf8 COMMENT='商品属性关系表';

/*Table structure for table `sku_change_push_retail` */

CREATE TABLE `sku_change_push_retail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` smallint(8) NOT NULL DEFAULT '0' COMMENT '状态：0-默认',
  `send_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uk_skuId` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22866 DEFAULT CHARSET=utf8 COMMENT='sku信息新增修改，售价修改，库存修改推送pos台，电子称，电子价签依据表';

/*Table structure for table `sku_change_push_retail1` */

CREATE TABLE `sku_change_push_retail1` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` smallint(8) NOT NULL DEFAULT '0' COMMENT '状态：0-默认',
  `send_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息新增修改，售价修改，库存修改推送pos台，电子称，电子价签依据表';

/*Table structure for table `sku_district` */

CREATE TABLE `sku_district` (
  `sku_district_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配送区域id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `wareid` int(11) DEFAULT NULL COMMENT '仓库id',
  `is_valid` tinyint(2) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `is_defaul_dist` tinyint(2) DEFAULT '1' COMMENT '是否取默认配送区域 0：不取；1：取默认',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '删除标记 0未删除，1已删除',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sku_district_id`),
  KEY `sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143932 DEFAULT CHARSET=utf8 COMMENT='商品配送区域主表';

/*Table structure for table `sku_district_copy` */

CREATE TABLE `sku_district_copy` (
  `sku_district_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配送区域id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
  `wareid` int(11) DEFAULT NULL COMMENT '仓库id',
  `is_valid` tinyint(2) DEFAULT NULL COMMENT '是否有效 0：无效；1：有效',
  `is_defaul_dist` tinyint(2) DEFAULT '1' COMMENT '是否取默认配送区域 0：不取；1：取默认',
  `is_del` tinyint(2) DEFAULT '0' COMMENT '删除标记 0未删除，1已删除',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sku_district_id`),
  KEY `sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25987 DEFAULT CHARSET=utf8 COMMENT='商品配送区域主表';

/*Table structure for table `sku_district_group_rel` */

CREATE TABLE `sku_district_group_rel` (
  `sku_district_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_district_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(10) DEFAULT NULL COMMENT '分组表主键',
  `group_code` varchar(32) DEFAULT NULL COMMENT '分组编号',
  `group_name` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`sku_district_group_id`),
  KEY `sku_idx` (`sku_district_id`) USING BTREE,
  KEY `group_idx` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81810 DEFAULT CHARSET=utf8 COMMENT='商品配送区域分组关系表';

/*Table structure for table `sku_district_group_rel_bak_201704` */

CREATE TABLE `sku_district_group_rel_bak_201704` (
  `sku_district_group_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_district_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(10) DEFAULT NULL COMMENT '分组表主键',
  `group_code` varchar(32) DEFAULT NULL COMMENT '分组编号',
  `group_name` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_district_group_rel_copy` */

CREATE TABLE `sku_district_group_rel_copy` (
  `sku_district_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_district_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(10) DEFAULT NULL COMMENT '分组表主键',
  `group_code` varchar(32) DEFAULT NULL COMMENT '分组编号',
  `group_name` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`sku_district_group_id`),
  KEY `sku_idx` (`sku_district_id`),
  KEY `group_idx` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8 COMMENT='商品配送区域分组关系表';

/*Table structure for table `sku_district_rel` */

CREATE TABLE `sku_district_rel` (
  `sku_district_rel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_district_id` bigint(20) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `delivery_code` varchar(32) DEFAULT NULL,
  `delivery_name` varchar(128) DEFAULT NULL,
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`sku_district_rel_id`),
  KEY `sku_idx` (`sku_district_id`) USING BTREE,
  KEY `region_idx` (`region_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13543980 DEFAULT CHARSET=utf8 COMMENT='商品配送区域地址关系表';

/*Table structure for table `sku_district_rel_bak` */

CREATE TABLE `sku_district_rel_bak` (
  `sku_district_rel_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_district_id` bigint(20) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `delivery_code` varchar(32) DEFAULT NULL,
  `delivery_name` varchar(128) DEFAULT NULL,
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) DEFAULT NULL COMMENT '更新人',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_district_rel_tmp` */

CREATE TABLE `sku_district_rel_tmp` (
  `sku_district_rel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_district_id` bigint(20) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `delivery_code` varchar(32) DEFAULT NULL,
  `delivery_name` varchar(128) DEFAULT NULL,
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效',
  PRIMARY KEY (`sku_district_rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4513233 DEFAULT CHARSET=utf8 COMMENT='商品配送区域地址关系表临时导入模板';

/*Table structure for table `sku_district_rel_tmp_bak` */

CREATE TABLE `sku_district_rel_tmp_bak` (
  `sku_district_rel_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_district_id` bigint(20) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `delivery_code` varchar(32) DEFAULT NULL,
  `delivery_name` varchar(128) DEFAULT NULL,
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否有效 0：无效；1：有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_extend` */

CREATE TABLE `sku_extend` (
  `sku_extend_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_recommend_title` varchar(128) DEFAULT NULL,
  `sku_recommend_content` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`sku_extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品扩展属性';

/*Table structure for table `sku_front_push` */

CREATE TABLE `sku_front_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `push_type` varchar(10) DEFAULT NULL COMMENT '推送类型,add update',
  `status` smallint(6) DEFAULT NULL COMMENT '推送状态 0 NEW 1 成功 2 失败',
  `push_date` datetime DEFAULT NULL COMMENT '推送日期',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `ret_message` varchar(100) DEFAULT NULL COMMENT '推送返回信息',
  `ret_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240569 DEFAULT CHARSET=utf8 COMMENT='商品推送到前端网站';

/*Table structure for table `sku_function` */

CREATE TABLE `sku_function` (
  `sku_function_id` int(11) NOT NULL,
  `sku_function_name` varchar(64) DEFAULT NULL COMMENT '功能名',
  PRIMARY KEY (`sku_function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku功能表';

/*Table structure for table `sku_function_rel` */

CREATE TABLE `sku_function_rel` (
  `sku_id` bigint(20) NOT NULL,
  `sku_function_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku功能关系表';

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
  `if_material_pull` smallint(6) DEFAULT '0' COMMENT '是否参与原料拉动 0：否 1：是',
  `sale_mode` smallint(6) DEFAULT '0' COMMENT '销售模式 1自营 2三方 3联营',
  `to_c` smallint(6) DEFAULT '0' COMMENT 'toC',
  `new_sku_date` datetime DEFAULT NULL COMMENT '新品日期',
  `plu_no` int(8) NOT NULL DEFAULT '0' COMMENT 'plu码',
  `is_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '称重标识 2-不称重，1-称重',
  `sku_component` varchar(128) NOT NULL DEFAULT '' COMMENT 'sku主要成分',
  `kl_sale_tax_code_id` int(11) DEFAULT NULL COMMENT '开磷销项税',
  `tax_is_check` tinyint(4) DEFAULT '0' COMMENT '税率是否已阅 1-已阅',
  `associate_supplier_id` int(32) DEFAULT NULL COMMENT '关联供应商ID',
  `base_point` decimal(10,2) DEFAULT '0.00' COMMENT '基础扣点',
  `is_eating` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否生食 1-是 0-否',
  `is_send_scale` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否下发电子秤0-否 1-是',
  `tax_type_id` varchar(32) DEFAULT NULL COMMENT '税收编码',
  `tax_type_id1` varchar(32) DEFAULT NULL COMMENT '税收编码',
  PRIMARY KEY (`sku_id`),
  KEY `idx_plu` (`plu_no`) USING BTREE,
  KEY `idx_upc` (`upc_no`(12)) USING BTREE,
  KEY `idx_tax_unit` (`tax_code_id`,`unit_id`),
  KEY `idx_sku_area_class` (`sku_id`,`temp_area_id`,`product_class_id`),
  KEY `idx_sku_tax_unit_country_brand_temp_class` (`sku_id`,`tax_code_id`,`unit_id`,`country_code_id`,`brand_id`,`temp_area_id`,`sale_tax_code_id`,`product_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sku信息表';

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
  `purchase_mode` smallint(6) DEFAULT NULL COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT NULL COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT NULL COMMENT '保质期年月日',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_main_bak_1` */

CREATE TABLE `sku_main_bak_1` (
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
  `purchase_mode` smallint(6) DEFAULT NULL COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT NULL COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT NULL COMMENT '保质期年月日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_main_bak_2` */

CREATE TABLE `sku_main_bak_2` (
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
  `purchase_mode` smallint(6) DEFAULT NULL COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT NULL COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT NULL COMMENT '保质期年月日',
  `if_material_pull` smallint(6) DEFAULT '0' COMMENT '是否参与原料拉动 0：否 1：是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_main_modify_flow` */

CREATE TABLE `sku_main_modify_flow` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `modify_col` varchar(64) DEFAULT '' COMMENT '更新的列名',
  `origin_value` varchar(128) DEFAULT '' COMMENT '原始值',
  `updated_value` varchar(128) DEFAULT '' COMMENT '新值',
  `snap_sku_main_origin_id` int(11) DEFAULT '-1' COMMENT '快照表更新前数据的id',
  `snap_sku_main_updated_id` int(11) DEFAULT '-1' COMMENT '快照表更新后数据的id',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=utf8 COMMENT='sku信息修改记录表';

/*Table structure for table `sku_main_modify_snapshot` */

CREATE TABLE `sku_main_modify_snapshot` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `sku_name` varchar(128) DEFAULT '' COMMENT 'sku名',
  `sku_type` smallint(6) DEFAULT '-1' COMMENT 'sku类型',
  `sku_short_name` varchar(32) DEFAULT '' COMMENT '助记码',
  `is_raw_material` smallint(6) DEFAULT '-1' COMMENT '是否原材料 1:是 0:否',
  `length` decimal(12,4) DEFAULT '-1.0000' COMMENT '长',
  `width` decimal(12,4) DEFAULT '-1.0000' COMMENT '宽',
  `height` decimal(16,4) DEFAULT '-1.0000' COMMENT '高',
  `weight` decimal(12,4) DEFAULT '-1.0000' COMMENT '毛重',
  `upc_no` varchar(32) DEFAULT '' COMMENT 'upc码',
  `unit_id` int(11) DEFAULT '-1' COMMENT '单位',
  `is_expire_flag` smallint(6) DEFAULT '-1' COMMENT '保质期管理 1:有效期标示 0:非有效期  ',
  `box_std` varchar(32) DEFAULT '' COMMENT '包装规格',
  `is_serial` smallint(6) DEFAULT '-1' COMMENT '1:序列号管理 0:非序列号管理',
  `brand_id` int(11) DEFAULT '-1' COMMENT '品牌',
  `is_air_forbid` smallint(6) DEFAULT '-1' COMMENT '1:航空禁运 0:航空不禁运',
  `is_precious` smallint(6) DEFAULT '-1' COMMENT '1:贵重物品 0:普通品',
  `is_liquid` smallint(6) DEFAULT '-1' COMMENT '液体标示 1:液体 0:非液体',
  `delivery_type` smallint(6) DEFAULT '-1' COMMENT '配送类型 1:无限制 2:海运',
  `is_open_check` smallint(6) DEFAULT '-1' COMMENT '1:开箱检查 0:不开箱',
  `tax_code_id` int(11) DEFAULT '-1' COMMENT '一般纳税税码',
  `is_seasonal` smallint(6) DEFAULT '-1' COMMENT '1:季节性商品 2:非季节性商品',
  `is_virtual` smallint(6) DEFAULT '-1' COMMENT '1:虚拟商品 0:非虚拟商品',
  `is_lot` smallint(6) DEFAULT '-1' COMMENT '1:批次管理 0:非批次管理',
  `seasonal_start_date` datetime DEFAULT '1970-01-01 08:00:01' COMMENT '季节开始时间',
  `seasonal_end_date` datetime DEFAULT '1970-01-01 08:00:01' COMMENT '季节结束时间',
  `price` decimal(16,4) DEFAULT '-1.0000' COMMENT '市场价,-1表示修改为空值',
  `product_class3` int(11) DEFAULT '-1' COMMENT '商品三级分类',
  `province_id` int(11) DEFAULT '-1' COMMENT '省',
  `city_id` int(11) DEFAULT '-1' COMMENT '市',
  `country_id` int(11) DEFAULT '-1' COMMENT '国家',
  `is_import` smallint(11) DEFAULT '-1' COMMENT '1:进口商品,2:非进口商品',
  `purchase_mode` smallint(6) DEFAULT '-1' COMMENT '采购模式',
  `expire_days` smallint(6) DEFAULT '-1' COMMENT '保质期天数与年月日关联使用',
  `expire_type` smallint(6) DEFAULT '-1' COMMENT '保质期年月日',
  `if_material_pull` smallint(6) DEFAULT '-1' COMMENT '是否参与原料拉动 0：否 1：是',
  `sale_mode` smallint(6) DEFAULT '-1' COMMENT '销售模式 1自营 2三方',
  `to_c` smallint(6) DEFAULT '-1' COMMENT 'toC',
  `new_sku_date` datetime DEFAULT '1970-01-01 08:00:01' COMMENT '新品日期',
  `plu_no` int(8) DEFAULT '-1' COMMENT 'plu码',
  `is_weight` smallint(6) DEFAULT '-1' COMMENT '称重标识 2-不称重，1-称重',
  `sku_component` varchar(128) DEFAULT '' COMMENT 'sku主要成分',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COMMENT='sku信息记录表';

/*Table structure for table `sku_pic` */

CREATE TABLE `sku_pic` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `sku_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'sku名',
  `sku_code` varchar(32) NOT NULL DEFAULT '' COMMENT 'sku编码',
  `burden_pic` varchar(255) DEFAULT '' COMMENT '配料图片',
  `exterior_pic` varchar(255) DEFAULT '' COMMENT '外观图片',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间,默认为系统时间',
  `created_by` varchar(128) DEFAULT '' COMMENT '创建人',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间,默认为系统时间',
  `updated_by` varchar(128) DEFAULT '' COMMENT '更新人',
  `is_upload_pic` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否上传图片0否1是',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5257 DEFAULT CHARSET=utf8 COMMENT='sku图片表';

/*Table structure for table `sku_point` */

CREATE TABLE `sku_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商编号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '扣点状态 1-生效 0-审核中 2-废除',
  `point_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '扣点类型 1-正常扣点 2-促销扣点',
  `point_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '返点方式 0-固定金额 1-固定百分比',
  `point_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '扣点值',
  `begin_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '扣点开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '扣点结束时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_by` varchar(128) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00',
  `update_by` varchar(128) NOT NULL DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `approve_by` varchar(128) NOT NULL DEFAULT '' COMMENT '审核人',
  `approve_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '审批时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_pre_sale` */

CREATE TABLE `sku_pre_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_code` varchar(32) DEFAULT NULL,
  `sku_name` varchar(100) DEFAULT NULL,
  `pre_sale_code` varchar(32) DEFAULT NULL COMMENT '预售编号',
  `pre_sale_name` varchar(50) DEFAULT NULL COMMENT '预售名称',
  `sale_begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deliver_begin_time` timestamp NULL DEFAULT NULL,
  `deliver_end_time` timestamp NULL DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库',
  `quantity` int(11) DEFAULT NULL COMMENT '可销售数量',
  `sale_quantity` int(11) DEFAULT NULL COMMENT '销售数量',
  `sale_prom_title` varchar(128) DEFAULT NULL COMMENT '促销广告语',
  `sale_type` int(11) DEFAULT '0' COMMENT '0:预售1:极致新鲜',
  `sale_way` int(11) DEFAULT NULL COMMENT '可卖数控制方式0：总数量1：每天数量',
  `deliver_day` int(11) DEFAULT NULL COMMENT '可选送达天数',
  `comments` varchar(128) DEFAULT NULL COMMENT '备注',
  `valid` int(11) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `fresh_days` int(11) DEFAULT NULL COMMENT '新鲜天数',
  `ealry_end_time` timestamp NULL DEFAULT NULL COMMENT '提前终止时间',
  `cut_off_time` varchar(10) DEFAULT NULL COMMENT '截单时间',
  `cycle` smallint(6) DEFAULT NULL COMMENT '循环：1是 0否',
  `number_of_cycles` int(11) DEFAULT NULL COMMENT '循环天数',
  `sale_stop_date` timestamp NULL DEFAULT NULL COMMENT '终止日期',
  `fastest_delivery_day` int(11) DEFAULT NULL COMMENT '最早配送天数',
  `display` smallint(6) DEFAULT NULL COMMENT '前台展示：1是  0否',
  `automatic_purchase` smallint(6) DEFAULT NULL COMMENT '自动下采购申请',
  `shortage_wait` smallint(6) DEFAULT NULL COMMENT '缺货等待：1是  0否',
  `is_audit` int(11) DEFAULT '0' COMMENT '采购申请单自动审核',
  `ware_type` smallint(6) DEFAULT NULL COMMENT '仓库类型  0：自有仓库；1：供应商仓库 2：虚拟仓',
  `supplier_id` bigint(11) DEFAULT NULL COMMENT '供应商id',
  `supplier_address_id` bigint(11) DEFAULT NULL COMMENT '供应商地址id',
  `county_name` varchar(32) DEFAULT NULL COMMENT '国家名称',
  `province_name` varchar(32) DEFAULT NULL COMMENT '省名称',
  `city_name` varchar(32) DEFAULT NULL COMMENT '市名称',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区县名称',
  `address` varchar(256) DEFAULT NULL COMMENT '发货详细地址',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `tel_phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(32) DEFAULT NULL COMMENT '移动电话',
  `employee_id` int(11) DEFAULT NULL,
  `employee_name` varchar(64) DEFAULT NULL,
  `employee_mobile` varchar(16) DEFAULT NULL,
  `employee_mail` varchar(64) DEFAULT NULL,
  `ware_name` varchar(128) DEFAULT NULL COMMENT '仓库名',
  `auto_process` smallint(6) DEFAULT NULL COMMENT '是否自动下加工单',
  `bom_id` varchar(18) DEFAULT NULL COMMENT 'BOM单编号',
  `process_cut_off_time` varchar(10) DEFAULT NULL COMMENT '截单时间',
  `if_one_material` smallint(6) DEFAULT NULL COMMENT '是否单原料商品 0:否;1:是;',
  `material_sku_id` bigint(20) DEFAULT NULL COMMENT '原料skuId',
  `material_qty` float DEFAULT NULL COMMENT '原料数量 对应bom_sku_rel的lot_number字段',
  `pickup` smallint(6) DEFAULT '0' COMMENT '是否自提 1-是 0-否',
  `hold_value` int(11) DEFAULT '0' COMMENT '预售数量',
  `msg_type` smallint(6) DEFAULT '0' COMMENT '短信推送方式',
  `msg_type1` smallint(6) DEFAULT '0' COMMENT '短信推送方式',
  PRIMARY KEY (`id`),
  KEY `idx_sku` (`sku_code`),
  KEY `idx_ware` (`ware_id`),
  KEY `idx_sku_ware` (`sku_code`,`ware_id`),
  KEY `idx_time` (`sale_stop_date`),
  KEY `idx_end_time` (`sale_end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=268484 DEFAULT CHARSET=utf8 COMMENT='商品预售';

/*Table structure for table `sku_pre_sale_detail` */

CREATE TABLE `sku_pre_sale_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pre_sale_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(32) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `ware_name` varchar(50) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL COMMENT '销售日期',
  `deliver_date` datetime DEFAULT NULL COMMENT '送货时间',
  `deliver_time` varchar(32) DEFAULT NULL COMMENT '送货时间段',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `receive_address` varchar(200) DEFAULT NULL COMMENT '收货地址(二级地址名称)',
  `receive_time` datetime DEFAULT NULL COMMENT '接收时间',
  `convert_status` tinyint(4) DEFAULT '0' COMMENT '生成申请单状态(0:未处理;1:处理成功;2:处理失败;)',
  `convert_count` tinyint(4) DEFAULT NULL COMMENT '生成申请单次数',
  `convert_msg` varchar(500) DEFAULT NULL COMMENT '生成申请单信息',
  `convert_time` datetime DEFAULT NULL COMMENT '生成申请单时间',
  `process_convert_status` tinyint(4) DEFAULT '0' COMMENT '生成加工单状态(0:未处理;1:处理成功;2:处理失败;)',
  `src_skuId` varchar(32) DEFAULT NULL COMMENT 'BOM父skuID',
  `src_skuId_num` int(11) DEFAULT NULL COMMENT 'BOM父skuID订单数量',
  `process_convert_count` tinyint(4) DEFAULT NULL COMMENT '生成加工单次数',
  `process_convert_msg` varchar(500) DEFAULT NULL COMMENT '生成加工单信息',
  `process_convert_time` datetime DEFAULT NULL COMMENT '生成加工单时间',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '交易单',
  `modify_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `timing_arrival_flag` tinyint(4) DEFAULT '0' COMMENT '配送时效 1-定时,2-隔日',
  PRIMARY KEY (`id`),
  KEY `index_pre_sale_id` (`pre_sale_id`) USING BTREE,
  KEY `idx_sku_order_id` (`parent_order_id`,`order_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_msg` (`process_convert_msg`(255))
) ENGINE=InnoDB AUTO_INCREMENT=7466470 DEFAULT CHARSET=utf8 COMMENT='预售销售明细表';

/*Table structure for table `sku_price` */

CREATE TABLE `sku_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_id` bigint(20) NOT NULL,
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `price_type` smallint(6) DEFAULT NULL COMMENT '1:正常价 2:促销价 3:团购价 4:抢购价',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT '1' COMMENT '是否有效0：否，1：是',
  `audit_status` smallint(6) DEFAULT '0' COMMENT '0：待审核，1：审核通过，2审核未通过',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `prom_code` varchar(32) DEFAULT NULL COMMENT '促销编码',
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id',
  PRIMARY KEY (`id`),
  KEY `idx_skuId` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92328 DEFAULT CHARSET=utf8 COMMENT='价格表(自动改价系统)';

/*Table structure for table `sku_price_bak` */

CREATE TABLE `sku_price_bak` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_id` bigint(20) NOT NULL,
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `price_type` smallint(6) DEFAULT NULL COMMENT '1:正常价 2:促销价 3:团购价 4:抢购价',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT '1' COMMENT '是否有效0：否，1：是',
  `audit_status` smallint(6) DEFAULT '0' COMMENT '0：待审核，1：审核通过，2审核未通过',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `prom_code` varchar(32) DEFAULT NULL COMMENT '促销编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_price_bak_1` */

CREATE TABLE `sku_price_bak_1` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_id` bigint(20) NOT NULL,
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `price_type` smallint(6) DEFAULT NULL COMMENT '1:正常价 2:促销价 3:团购价 4:抢购价',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT '1' COMMENT '是否有效0：否，1：是',
  `audit_status` smallint(6) DEFAULT '0' COMMENT '0：待审核，1：审核通过，2审核未通过',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `prom_code` varchar(32) DEFAULT NULL COMMENT '促销编码',
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_price_his` */

CREATE TABLE `sku_price_his` (
  `sku_id` bigint(20) NOT NULL,
  `sale_price` decimal(16,4) DEFAULT NULL COMMENT '销售价',
  `cb_price` decimal(16,4) DEFAULT NULL COMMENT '春播价',
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格历史表';

/*Table structure for table `sku_price_push` */

CREATE TABLE `sku_price_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_code` varchar(64) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL COMMENT '春播价',
  `price_type` int(11) DEFAULT '1' COMMENT '1:销售价',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT '0' COMMENT '0:新建1：成功-1：失败',
  `cause` varchar(128) DEFAULT NULL COMMENT '失败原因',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '推送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90103 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_price_push_bak` */

CREATE TABLE `sku_price_push_bak` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_code` varchar(64) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL COMMENT '春播价',
  `price_type` int(11) DEFAULT '1' COMMENT '1:销售价',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT '0' COMMENT '0:新建1：成功-1：失败',
  `cause` varchar(128) DEFAULT NULL COMMENT '失败原因',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '推送时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_price_push_his` */

CREATE TABLE `sku_price_push_his` (
  `id` bigint(20) NOT NULL,
  `region_id` varchar(32) DEFAULT NULL COMMENT '二级区域id',
  `sku_code` varchar(64) DEFAULT NULL,
  `price` decimal(16,2) DEFAULT NULL COMMENT '春播价',
  `price_type` int(11) DEFAULT '1' COMMENT '1:销售价',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT '0' COMMENT '0:新建1：成功-1：失败',
  `cause` varchar(128) DEFAULT NULL COMMENT '失败原因',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `send_time` datetime DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_prom` */

CREATE TABLE `sku_prom` (
  `promotion_id` bigint(20) NOT NULL,
  `promotion_desc` varchar(256) DEFAULT NULL,
  `sku_id` varchar(32) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='促销信息';

/*Table structure for table `sku_retail_manage_catalog` */

CREATE TABLE `sku_retail_manage_catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_id',
  `ware_id` smallint(8) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sale_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '销售价',
  `sale_status` smallint(8) NOT NULL DEFAULT '1' COMMENT '销售状态：1-正常经营,2-不经营',
  `purchase_status` smallint(8) NOT NULL DEFAULT '1' COMMENT '采购状态：1-未设置,2-调拨,3-自采',
  `send_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '上一次推送时间',
  `update_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ware_sku_unique` (`ware_id`,`sku_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18542 DEFAULT CHARSET=utf8 COMMENT='零售商品经营管理表';

/*Table structure for table `sku_retail_price` */

CREATE TABLE `sku_retail_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'sku名称',
  `upc_code` varchar(32) DEFAULT '' COMMENT 'upc码',
  `sku_status` smallint(6) DEFAULT '0' COMMENT 'sku状态 1:审核通过、当前售价 2:待审核 3:审核不通过',
  `sku_type` smallint(6) DEFAULT '0' COMMENT 'sku类别',
  `retail_price` decimal(16,4) DEFAULT NULL COMMENT '零售仓sku售价',
  `audit_price` decimal(16,4) DEFAULT '0.0000' COMMENT '审核售价',
  `unit_id` smallint(16) DEFAULT '0' COMMENT '单位',
  `sale_tax_code_id` int(11) DEFAULT '0' COMMENT '税率',
  `retail_ware_id` int(11) DEFAULT '0',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `create_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '修改人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2535 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_retail_price_his` */

CREATE TABLE `sku_retail_price_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `status` smallint(6) DEFAULT '0' COMMENT 'sku状态 1 历史售价  2 审核不通过',
  `his_price` decimal(16,4) DEFAULT '0.0000' COMMENT '历史修改价格',
  `update_by` varchar(64) DEFAULT '' COMMENT '修改人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  `pass_by` varchar(64) DEFAULT '' COMMENT '审核人',
  `pass_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6442 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_retail_price_his1` */

CREATE TABLE `sku_retail_price_his1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `status` smallint(6) DEFAULT '0' COMMENT 'sku状态 1 历史售价  2 审核不通过',
  `his_price` decimal(16,4) DEFAULT '0.0000' COMMENT '历史修改价格',
  `update_by` varchar(64) DEFAULT '' COMMENT '修改人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '修改时间',
  `pass_by` varchar(64) DEFAULT '' COMMENT '审核人',
  `pass_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_scale` */

CREATE TABLE `sku_scale` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `promote_price` decimal(16,4) DEFAULT NULL COMMENT '促销价',
  `promote_status` tinyint(4) DEFAULT '2' COMMENT '促销状态： 1-促销商品，2-促销结束、非促销商品',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_skuId_wareId` (`sku_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2868066 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_scale_push` */

CREATE TABLE `sku_scale_push` (
  `id` int(11) NOT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `sku_name` varchar(255) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `price` decimal(16,4) NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sku_site_status` */

CREATE TABLE `sku_site_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku_site` varchar(32) NOT NULL DEFAULT '' COMMENT '站点',
  `sku_site_name` varchar(64) NOT NULL DEFAULT '' COMMENT '站点名称',
  `sku_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '商品状态',
  `is_valid` smallint(6) DEFAULT '0' COMMENT '是否有效0：否，1：是',
  `product_class_id` bigint(20) DEFAULT '0' COMMENT 'sku对应三级分类',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT '1970-10-01 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(64) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_site_unique` (`sku_id`,`sku_site`) USING BTREE,
  KEY `idx_status` (`sku_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=321139 DEFAULT CHARSET=utf8 COMMENT='sku状态分站点维护表';

/*Table structure for table `sku_site_status01` */

CREATE TABLE `sku_site_status01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuId',
  `sku_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商品名称',
  `sku_site` varchar(32) NOT NULL DEFAULT '' COMMENT '站点',
  `sku_site_name` varchar(64) NOT NULL DEFAULT '' COMMENT '站点名称',
  `sku_status` smallint(6) DEFAULT '0' COMMENT '商品状态',
  `is_valid` smallint(6) DEFAULT '0' COMMENT '是否有效0：否，1：是',
  `product_class_id` bigint(20) DEFAULT '0' COMMENT 'sku对应三级分类',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT '' COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(64) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sku_site_unique` (`sku_id`,`sku_site`),
  KEY `idx_status` (`sku_status`)
) ENGINE=InnoDB AUTO_INCREMENT=224710 DEFAULT CHARSET=utf8 COMMENT='sku状态分站点维护表';

/*Table structure for table `sku_supplier_push` */

CREATE TABLE `sku_supplier_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `push_type` varchar(10) DEFAULT NULL COMMENT '推送类型,add update',
  `status` smallint(6) DEFAULT NULL COMMENT '推送状态 0 NEW 1 成功 2 失败',
  `push_date` datetime DEFAULT NULL COMMENT '推送日期',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `ret_message` varchar(100) DEFAULT NULL COMMENT '推送返回信息',
  `ret_code` varchar(10) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_sku_status` (`sku_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=34236550 DEFAULT CHARSET=utf8 COMMENT='商品推送供应商平台';

/*Table structure for table `sku_ware_config` */

CREATE TABLE `sku_ware_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_group` varchar(50) DEFAULT NULL COMMENT '参数分组',
  `param_name` varchar(50) DEFAULT NULL COMMENT '参数名称',
  `ware_config_type` int(11) DEFAULT NULL COMMENT '参数值',
  `param_contact` varchar(128) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_warning_days` */

CREATE TABLE `sku_warning_days` (
  `sku_id` bigint(20) NOT NULL,
  `sku_name` varchar(255) DEFAULT NULL,
  `valid_days` int(11) DEFAULT NULL COMMENT '保质期天数',
  `warning_days` int(11) DEFAULT '1' COMMENT '距离冻结期预警天数',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(60) DEFAULT NULL,
  `update_by` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŠ¨é”€è¡¨';

/*Table structure for table `stock_sale_earlywarning_report` */

CREATE TABLE `stock_sale_earlywarning_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0',
  `ware_id` int(11) DEFAULT NULL,
  `sku_name` varchar(128) DEFAULT NULL COMMENT 'sku名',
  `sale_num` int(11) DEFAULT NULL COMMENT '动销期内销售总量',
  `lv1_class` bigint(20) NOT NULL COMMENT '商品一级分类',
  `lv2_class` bigint(20) NOT NULL COMMENT '商品二级分类',
  `lv3_class` bigint(20) NOT NULL COMMENT '商品三级分类',
  `earlywarning_threshold` int(11) DEFAULT NULL COMMENT '预警阈值',
  `sale_average_num` int(11) DEFAULT NULL COMMENT '动销均值',
  `sku_num` int(11) DEFAULT NULL COMMENT '当前可卖数量',
  `earlywarning_num` int(11) DEFAULT NULL COMMENT '预警可卖数量',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '记录创建Yyyymmdd hhmmss',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推送业务用预警报表';

/*Table structure for table `supp` */

CREATE TABLE `supp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku_id',
  `ware_id` smallint(8) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sale_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '销售价',
  `sale_status` smallint(8) NOT NULL DEFAULT '1' COMMENT '销售状态：1-正常经营,2-不经营',
  `purchase_status` smallint(8) NOT NULL DEFAULT '1' COMMENT '采购状态：1-未设置,2-调拨,3-自采',
  `send_time` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '上一次推送时间',
  `update_by` varchar(32) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ware_sku_unique` (`ware_id`,`sku_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16262 DEFAULT CHARSET=utf8 COMMENT='零售商品经营管理表';

/*Table structure for table `supplementary_agreement` */

CREATE TABLE `supplementary_agreement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agreement_id` varchar(64) NOT NULL COMMENT '协议编码',
  `cm_id` varchar(64) NOT NULL COMMENT '合同编码',
  `c_object` bigint(20) NOT NULL COMMENT '签约对象',
  `sign_subject` varchar(64) NOT NULL COMMENT '签约主体',
  `cm_type` int(4) DEFAULT '1' COMMENT '合同类型',
  `purchase_group` int(4) DEFAULT '1' COMMENT '采购组-一级分类',
  `tax_type` int(4) DEFAULT '1' COMMENT '纳税类型',
  `department` varchar(64) NOT NULL COMMENT '经办部门',
  `is_return` smallint(2) DEFAULT '1' COMMENT '是允许否退货 1-退 0-不退',
  `return_policy` varchar(255) DEFAULT '' COMMENT '退货说明',
  `no_return_compensation` decimal(5,2) DEFAULT '0.00' COMMENT '不退货补偿',
  `freight_support` decimal(5,2) DEFAULT '0.00' COMMENT '运费支持',
  `damage_compensation_rate` decimal(5,2) DEFAULT '0.00' COMMENT '残损补偿率',
  `gross_compensation` smallint(2) DEFAULT '1' COMMENT '是否毛利补偿',
  `settle_method` smallint(2) DEFAULT '1' COMMENT '结算方式',
  `vendor_account` smallint(2) DEFAULT '1' COMMENT '供应商账期',
  `settle_object` bigint(20) DEFAULT NULL COMMENT '关联结算对象',
  `delivery_method` smallint(2) DEFAULT '1' COMMENT '交货方式',
  `manager` varchar(64) NOT NULL DEFAULT '' COMMENT '经办人',
  `effective_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效日期',
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效日期',
  `agreement_file` smallint(2) NOT NULL DEFAULT '0' COMMENT '协议文件上传 1-上传 0-未上传',
  `circulation_license_expiry` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '流通许可证失效日期',
  `agreement_status` int(4) DEFAULT '0',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `porder_create` decimal(5,2) DEFAULT '0.00' COMMENT '采购单创建 -- 预付款百分比',
  `arrival_registration` decimal(5,2) DEFAULT '0.00' COMMENT '到货登记 -- 预付款百分比',
  `receiving_completed` decimal(5,2) DEFAULT '0.00' COMMENT '收货完成 -- 预付款百分比',
  `effect_man` varchar(64) DEFAULT '' COMMENT '协议生效人',
  `effect_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '协议生效时间（协议状态改为生效的时间）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_account_type` */

CREATE TABLE `supplier_account_type` (
  `supplier_account_type_id` int(11) NOT NULL,
  `supplier_account_type_name` varchar(64) DEFAULT NULL COMMENT '供应商账户类型',
  PRIMARY KEY (`supplier_account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商账户组维表';

/*Table structure for table `supplier_address` */

CREATE TABLE `supplier_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `county_id` int(11) DEFAULT NULL COMMENT '国家id',
  `county_name` varchar(32) DEFAULT NULL COMMENT '国家名称',
  `province_id` int(11) DEFAULT NULL COMMENT '省id',
  `province_name` varchar(32) DEFAULT NULL COMMENT '省名称',
  `city_id` int(11) DEFAULT NULL COMMENT '市id',
  `city_name` varchar(32) DEFAULT NULL COMMENT '市名称',
  `area_id` int(11) DEFAULT NULL COMMENT '区县id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区县名称',
  `address` varchar(256) DEFAULT NULL COMMENT '发货详细地址',
  `priority_level` int(11) DEFAULT NULL COMMENT '优先级，1为最低，递增，优先级更高',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否有效 1有效，0无效',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `tel_phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(32) DEFAULT NULL COMMENT '移动电话',
  `address_type` int(11) DEFAULT NULL COMMENT '地址类型 1送货地址，2收货地址 等',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1996 DEFAULT CHARSET=utf8 COMMENT='供应商发货地址';

/*Table structure for table `supplier_bussiness_type` */

CREATE TABLE `supplier_bussiness_type` (
  `supplier_bussiness_type_id` int(11) NOT NULL,
  `supplier_bussiness_type_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`supplier_bussiness_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商行业类型';

/*Table structure for table `supplier_contact` */

CREATE TABLE `supplier_contact` (
  `supplier_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(64) DEFAULT NULL,
  `contact_address` varchar(256) DEFAULT NULL,
  `contact_email` varchar(64) DEFAULT NULL,
  `contact_telephone` varchar(24) DEFAULT NULL,
  `contact_mobile` varchar(24) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `supplier_purchase_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `contact_weChat` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人微信',
  PRIMARY KEY (`supplier_contact_id`),
  KEY `fk_supp_cont_purc` (`supplier_id`,`supplier_purchase_id`,`supplier_contact_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4439 DEFAULT CHARSET=utf8 COMMENT='供应商联系人表';

/*Table structure for table `supplier_enabled_status` */

CREATE TABLE `supplier_enabled_status` (
  `enabled_status` varchar(32) DEFAULT NULL COMMENT '1 未启用 2启用  3已驳回',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '有效状态 1有效 0无效',
  `supplier_enabled_status_id` int(11) NOT NULL COMMENT '1 未启用 2启用  3已驳回',
  PRIMARY KEY (`supplier_enabled_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_main` */

CREATE TABLE `supplier_main` (
  `supplier_id` int(11) NOT NULL COMMENT '供应商id',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名',
  `is_chunbo` smallint(6) DEFAULT NULL COMMENT '1:春播 0:其他',
  `supplier_account_type_id` int(11) DEFAULT NULL COMMENT '账户类型',
  `associate_supplier_id` int(32) DEFAULT NULL COMMENT '关联供应商编码',
  `supplier_address` varchar(256) DEFAULT NULL COMMENT '供应商地址',
  `postal_code` varchar(16) DEFAULT NULL COMMENT '邮政编码',
  `supplier_region_type_id` tinyint(4) DEFAULT NULL COMMENT '供应商类型1',
  `supplier_bussiness_type_id` tinyint(4) DEFAULT NULL COMMENT '供应商类型2',
  `fax` varchar(24) DEFAULT NULL COMMENT '传真',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `plan_deliver_day` int(11) DEFAULT NULL COMMENT '预计送达天数',
  `region_id` int(11) DEFAULT NULL,
  `supplier_status_id` int(11) DEFAULT '1' COMMENT '1:正常 2:禁止订货 3:禁止付款 4:禁止订货付款 5:清户 6：送审 7：驳回',
  `create_by` varchar(64) DEFAULT NULL COMMENT '添加人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `company_code` smallint(6) DEFAULT '1',
  `company_name` varchar(64) NOT NULL DEFAULT '北京春播科技有限公司' COMMENT '公司名称',
  `audit_by` varchar(64) DEFAULT '' COMMENT '审核人',
  `audit_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `is_contract` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否签订合同  1-是 0-否',
  PRIMARY KEY (`supplier_id`),
  KEY `idx_supplier_name` (`supplier_name`) USING BTREE,
  KEY `fk_supplier_region` (`region_id`) USING BTREE,
  KEY `fk_supplier_status` (`supplier_status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商主表';

/*Table structure for table `supplier_modify_flow` */

CREATE TABLE `supplier_modify_flow` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键、自增',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0',
  `modify_col` varchar(64) NOT NULL DEFAULT '' COMMENT '更新的列名',
  `origin_value` varchar(128) DEFAULT '' COMMENT '原始值',
  `updated_value` varchar(128) DEFAULT '' COMMENT '更新值',
  `snap_sku_main_origin_id` int(11) NOT NULL DEFAULT '-1' COMMENT '快照表更新前数据的id',
  `snap_sku_main_updated_id` int(11) NOT NULL DEFAULT '-1' COMMENT '快照表更新后数据的id',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2915 DEFAULT CHARSET=utf8 COMMENT='supplier信息修改记录表';

/*Table structure for table `supplier_pay_duration` */

CREATE TABLE `supplier_pay_duration` (
  `supplier_pay_duration_id` int(11) NOT NULL,
  `pay_duration` int(11) DEFAULT NULL COMMENT '供应商帐期',
  PRIMARY KEY (`supplier_pay_duration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商帐期维表';

/*Table structure for table `supplier_purchase` */

CREATE TABLE `supplier_purchase` (
  `supplier_purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `prepay_rate1` decimal(6,4) DEFAULT NULL COMMENT '预防比例一',
  `prepay_rate2` decimal(6,4) DEFAULT NULL COMMENT '预付比例二',
  `prepay_rate3` decimal(6,4) DEFAULT NULL COMMENT '预付比例三',
  `supplier_pay_duration_id` int(11) DEFAULT NULL COMMENT '供应商帐期',
  `pay_type_id` int(11) DEFAULT NULL COMMENT '付款类型',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `purchasing_term_id` int(11) DEFAULT NULL COMMENT '采购组',
  `purchasing_term` varchar(128) DEFAULT NULL,
  `damage_compensate` decimal(16,4) DEFAULT NULL COMMENT '残损补偿率(比例存小数)',
  `rental` decimal(16,4) NOT NULL DEFAULT '-1.0000' COMMENT '租金',
  `manage_cost` decimal(16,4) NOT NULL DEFAULT '-1.0000' COMMENT '管理费',
  `bank_account` varchar(64) DEFAULT '' COMMENT '银行帐户',
  `account_holder` varchar(64) DEFAULT NULL COMMENT '帐户持有人',
  `noreturn_purchase_rate` decimal(16,4) DEFAULT NULL COMMENT '不退货补偿(比例存小数)',
  `deliver_fee_support_rate` decimal(8,4) DEFAULT NULL COMMENT '配送费支持比率(比例存小数)',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '1:有效 0:无效',
  `supplier_tax_no` varchar(32) DEFAULT NULL COMMENT '供应商税号',
  `tax_payer_type_id` int(11) NOT NULL DEFAULT '1',
  `country_code_id` int(11) DEFAULT NULL,
  `bank_code_id` int(11) DEFAULT '-1' COMMENT '银行编号',
  `currency_type_id` int(11) NOT NULL,
  `purchasing_department_id` int(11) NOT NULL,
  `is_grossprofit_return` smallint(2) DEFAULT NULL COMMENT '是否毛利补偿;1:是, 0:否',
  `right_mail` varchar(128) DEFAULT NULL COMMENT '授权电子邮箱',
  `retrun_pay_type` smallint(6) DEFAULT NULL COMMENT '返点支付方式 1:帐扣,2:电子汇款',
  `gross_retrurn_type_id` int(11) NOT NULL,
  `month_rate` decimal(6,4) DEFAULT NULL COMMENT '月返比例',
  `quarter_rate` decimal(6,4) DEFAULT NULL COMMENT '季返比例',
  `year_rate` decimal(6,4) DEFAULT NULL COMMENT '年返比例',
  `month_pay_duration` int(11) DEFAULT '0' COMMENT '月付周期',
  `modify_by` varchar(40) DEFAULT '' COMMENT '修改人',
  `country_id` int(11) NOT NULL COMMENT '银行国家ID',
  `province_id` int(11) DEFAULT '-1' COMMENT '银行省份Id',
  `city_id` int(11) DEFAULT '-1' COMMENT '银行城市Id',
  `country_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行国家',
  `province_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行省份',
  `city_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行城市',
  `bank_address` varchar(255) NOT NULL DEFAULT '' COMMENT '银行详细地址',
  `is_gross` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-商品进价降低给予补偿,2-商品促销数量给予补偿',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商供应品类',
  `is_gross1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-商品进价降低给予补偿,2-商品促销数量给予补偿',
  `category1` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商供应品类',
  PRIMARY KEY (`supplier_purchase_id`),
  KEY `purchasing_term_id_index` (`supplier_id`,`purchasing_term_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4439 DEFAULT CHARSET=utf8 COMMENT='供应商采购关系表';

/*Table structure for table `supplier_region_type` */

CREATE TABLE `supplier_region_type` (
  `supplier_region_type_id` int(11) NOT NULL,
  `supplier_region_type_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`supplier_region_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商区域类型';

/*Table structure for table `supplier_send_range` */

CREATE TABLE `supplier_send_range` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `supplier_id` bigint(11) DEFAULT NULL COMMENT '供应商id',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '是否生效:1 有效 0 失效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7262 DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_sku` */

CREATE TABLE `supplier_sku` (
  `supplier_sku_id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku主键',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商主键',
  `ware_id` int(11) NOT NULL DEFAULT '0',
  `is_valid` smallint(6) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT NULL,
  `no_tax_price` decimal(16,4) DEFAULT NULL,
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `tax_value` decimal(16,4) DEFAULT NULL,
  `tax_code` varchar(32) DEFAULT NULL,
  `main_supplier` smallint(4) DEFAULT NULL COMMENT '是否主供应商0:否1：是',
  `no_tax` smallint(4) DEFAULT NULL COMMENT '是否免税',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id',
  `is_return` smallint(6) DEFAULT '0' COMMENT '是否可以退货',
  PRIMARY KEY (`supplier_sku_id`),
  UNIQUE KEY `idx_sku_sup_ware` (`sku_id`,`supplier_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104487 DEFAULT CHARSET=utf8 COMMENT='供应商sku关联表';

/*Table structure for table `supplier_sku_bak` */

CREATE TABLE `supplier_sku_bak` (
  `supplier_sku_id` int(11) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku主键',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商主键',
  `ware_id` int(11) NOT NULL DEFAULT '0',
  `is_valid` smallint(6) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT NULL,
  `no_tax_price` decimal(16,4) DEFAULT NULL,
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `tax_value` decimal(16,4) DEFAULT NULL,
  `tax_code` varchar(32) DEFAULT NULL,
  `main_supplier` smallint(4) DEFAULT NULL COMMENT '是否主供应商0:否1：是',
  `no_tax` smallint(4) DEFAULT NULL COMMENT '是否免税',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_sku_bak_1` */

CREATE TABLE `supplier_sku_bak_1` (
  `supplier_sku_id` int(11) NOT NULL DEFAULT '0',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'sku主键',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商主键',
  `ware_id` int(11) NOT NULL DEFAULT '0',
  `is_valid` smallint(6) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT NULL,
  `no_tax_price` decimal(16,4) DEFAULT NULL,
  `tax_code_id` int(11) DEFAULT NULL COMMENT '税码id',
  `tax_value` decimal(16,4) DEFAULT NULL,
  `tax_code` varchar(32) DEFAULT NULL,
  `main_supplier` smallint(4) DEFAULT NULL COMMENT '是否主供应商0:否1：是',
  `no_tax` smallint(4) DEFAULT NULL COMMENT '是否免税',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `category_dept_id` bigint(20) DEFAULT NULL COMMENT '商品一级分类对应的最低级部门id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_sku_price-废弃` */

CREATE TABLE `supplier_sku_price-废弃` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(11) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `price` decimal(16,0) DEFAULT NULL,
  `no_tax_price` decimal(16,0) DEFAULT NULL,
  `is_valid` smallint(6) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_sku_prom_price` */

CREATE TABLE `supplier_sku_prom_price` (
  `sku_prom_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_sku_id` int(11) DEFAULT NULL COMMENT '供应商商品id',
  `sale_price` decimal(10,4) DEFAULT NULL COMMENT '采购促销含税进价',
  `no_tax_sale_price` decimal(10,4) DEFAULT NULL,
  `gross_type` int(11) DEFAULT NULL COMMENT '毛利补偿方式0：无，1：库存2：销量',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '促销开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '促销结束时间',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(45) DEFAULT NULL,
  `update_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sku_prom_price_id`),
  KEY `fk_supplier_sku_id` (`supplier_sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8 COMMENT='供应商商品促销采购价';

/*Table structure for table `supplier_status` */

CREATE TABLE `supplier_status` (
  `supplier_status_id` int(11) NOT NULL COMMENT '供应商状态id',
  `supplier_status` varchar(32) DEFAULT NULL COMMENT '供应商状态',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '1:生效 0:失效',
  PRIMARY KEY (`supplier_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商状态维表';

/*Table structure for table `supplier_update_flow` */

CREATE TABLE `supplier_update_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `is_contract` tinyint(4) DEFAULT NULL COMMENT '是否签订合同',
  `supplier_region_type_id` int(11) DEFAULT NULL COMMENT '供应商类型1',
  `supplier_bussiness_type_id` int(11) DEFAULT NULL COMMENT '供应商类型2',
  `account_type_id` int(11) DEFAULT NULL COMMENT '经营模式',
  `company_id` tinyint(4) DEFAULT NULL COMMENT '签约公司ID',
  `right_mail` varchar(255) DEFAULT NULL COMMENT '供应商邮箱',
  `noreturn_purchase_rate` decimal(10,4) DEFAULT NULL COMMENT '不退货补偿',
  `damage_compensate` decimal(10,4) DEFAULT NULL COMMENT '残损补偿',
  `is_gross` tinyint(4) DEFAULT NULL COMMENT '是否毛利补偿',
  `rental` decimal(16,4) DEFAULT NULL COMMENT '租金',
  `manage_cost` decimal(16,4) DEFAULT NULL COMMENT '管理费',
  `return_type` varchar(255) DEFAULT NULL COMMENT '返点类型',
  `return_mode` varchar(255) DEFAULT NULL COMMENT '返点方式',
  `amount` decimal(16,4) DEFAULT '-1.0000' COMMENT '到达金额',
  `amount1` decimal(16,4) DEFAULT '-1.0000' COMMENT '返还金额',
  `tax_payer_type_id` int(11) DEFAULT NULL COMMENT '纳税人类型',
  `bank_address` varchar(255) DEFAULT NULL COMMENT '银行地址',
  `country_id` int(11) DEFAULT NULL COMMENT '国家ID',
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `currency_type_id` int(11) DEFAULT NULL COMMENT '结算币种',
  `pay_type_id` int(11) DEFAULT NULL COMMENT '结算方式',
  `manager` varchar(64) DEFAULT NULL COMMENT '我方授权代表人',
  `sign_date` timestamp NULL DEFAULT NULL COMMENT '签订日期',
  `effective_date` timestamp NULL DEFAULT NULL COMMENT '生效日期',
  `expiry_date` timestamp NULL DEFAULT NULL COMMENT '期满日',
  `contract_id` varchar(64) DEFAULT NULL COMMENT '是否上传合同',
  `agreement_id` varchar(64) DEFAULT NULL COMMENT '是否上传补充协议',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '联系人地址',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `type_id` tinyint(4) DEFAULT NULL COMMENT ' 已修改待审核 -2， 审核成功 -3 ',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '银行账号',
  `tax_no` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `multifile` tinyint(4) DEFAULT NULL COMMENT '是否上传合同',
  `multifile1` tinyint(4) DEFAULT NULL COMMENT '是否上传补充协议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_ware_bak` */

CREATE TABLE `supplier_ware_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8;

/*Table structure for table `supplier_ware_bar` */

CREATE TABLE `supplier_ware_bar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT NULL,
  `ware_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;

/*Table structure for table `tax_code` */

CREATE TABLE `tax_code` (
  `tax_code_id` int(11) NOT NULL COMMENT '税码id',
  `tax_code_name` varchar(32) DEFAULT NULL COMMENT '税码名',
  `tax_code_value` decimal(16,4) DEFAULT NULL COMMENT '税码值',
  `tax_type` smallint(6) DEFAULT '1' COMMENT '1:进项税 2:销项税',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '1:有效 0:无效',
  `relate_code_value` decimal(16,4) DEFAULT '0.0000' COMMENT '关联计算税率',
  `tax_code` varchar(10) DEFAULT NULL COMMENT '税码',
  PRIMARY KEY (`tax_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='税码表';

/*Table structure for table `tax_payer_type` */

CREATE TABLE `tax_payer_type` (
  `tax_payer_type_id` int(11) NOT NULL,
  `tax_payer_type` varchar(32) DEFAULT NULL COMMENT '纳税人类型',
  PRIMARY KEY (`tax_payer_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='纳税人类型';

/*Table structure for table `temperature_area` */

CREATE TABLE `temperature_area` (
  `temp_area_id` int(11) NOT NULL,
  `temp_area_name` varchar(64) DEFAULT NULL COMMENT '温区标示',
  `start_temp` float DEFAULT NULL COMMENT '起始温度',
  `end_temp` float DEFAULT NULL COMMENT '结束温度',
  `is_valid` smallint(6) DEFAULT NULL COMMENT '1:有效 0:无效',
  PRIMARY KEY (`temp_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='温区维表';

/*Table structure for table `test` */

CREATE TABLE `test` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id_year` (`id`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `test_id` */

CREATE TABLE `test_id` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trans_code` */

CREATE TABLE `trans_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `item_type` tinyint(4) NOT NULL COMMENT '项目类别',
  `trans_code_date` datetime NOT NULL COMMENT '期望转码日期',
  `responsible_person` varchar(64) NOT NULL COMMENT '负责人',
  `sku_id` bigint(11) NOT NULL COMMENT '原始sku',
  `sku_num` decimal(16,4) NOT NULL COMMENT '转码数量',
  `tc_sku_id` bigint(11) NOT NULL COMMENT '转码sku',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime NOT NULL COMMENT '申请时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '申请人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `accept_date` datetime DEFAULT NULL COMMENT '受理时间',
  `accept_by` varchar(64) DEFAULT NULL COMMENT '受理人',
  `ware_id` int(11) NOT NULL COMMENT '仓库Id',
  `purchase_remark` varchar(255) DEFAULT NULL COMMENT '采购备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Table structure for table `trans_code1` */

CREATE TABLE `trans_code1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(64) DEFAULT NULL COMMENT '项目名称',
  `item_type` tinyint(4) NOT NULL COMMENT '项目类别',
  `trans_code_date` datetime NOT NULL COMMENT '期望转码日期',
  `responsible_person` varchar(64) NOT NULL COMMENT '负责人',
  `sku_id` bigint(11) NOT NULL COMMENT '原始sku',
  `sku_num` decimal(16,4) NOT NULL COMMENT '转码数量',
  `tc_sku_id` bigint(11) NOT NULL COMMENT '转码sku',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '申请时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '申请人',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `accept_date` datetime DEFAULT NULL COMMENT '受理时间',
  `accept_by` varchar(64) DEFAULT NULL COMMENT '受理人',
  `ware_id` int(11) NOT NULL COMMENT '仓库Id',
  `purchase_remark` varchar(255) DEFAULT NULL COMMENT '采购备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trans_code_detail` */

CREATE TABLE `trans_code_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_no` int(11) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `apply_num` int(11) NOT NULL COMMENT '转码数量',
  `cause` varchar(255) DEFAULT NULL COMMENT '返回信息',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转码详情表';

/*Table structure for table `trans_code_detail23` */

CREATE TABLE `trans_code_detail23` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `task_no` int(11) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `apply_num` int(11) NOT NULL COMMENT '转码数量',
  `cause` varchar(255) DEFAULT NULL COMMENT '返回信息',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转码详情表';

/*Table structure for table `unit` */

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(16) DEFAULT NULL COMMENT '单位名',
  `unit_code` varchar(16) DEFAULT NULL COMMENT '英文编码',
  `unit_num` float DEFAULT NULL COMMENT '计算值',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位';

/*Table structure for table `workprocess_sku_multiply` */

CREATE TABLE `workprocess_sku_multiply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '成品skuID',
  `product_name` varchar(100) DEFAULT NULL COMMENT '成品名称',
  `ware_id` int(11) DEFAULT NULL COMMENT '仓库',
  `on_hand_qty` int(11) DEFAULT NULL COMMENT '在库数',
  `wip_qty` int(11) DEFAULT NULL COMMENT '在制品数',
  `noprocess_qty` int(11) DEFAULT NULL COMMENT '未生加工单数',
  `deliver_qty0` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date)',
  `deliver_qty1` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+1)',
  `deliver_qty2` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+2)',
  `deliver_qty3` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+3)',
  `deliver_qty4` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+4)',
  `deliver_qty5` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+5)',
  `deliver_qty6` int(11) DEFAULT NULL COMMENT '收货数量(fresh_date+6)',
  `product_multiply` float DEFAULT NULL COMMENT '成品倍量',
  `presale_ids` varchar(100) DEFAULT NULL COMMENT '对应的预售ID列表(用，号隔开)',
  `material_sku_id` bigint(20) DEFAULT NULL COMMENT '原料skuID(如果对应多个预售，则取最近的一个对应的material_sku_id)',
  `material_multiply` float DEFAULT NULL COMMENT '原料倍量(如果对应多个预售，则取最近的一个对应的material_multiply)',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `fresh_date` date DEFAULT NULL COMMENT '刷新日期',
  `fresh_time` datetime DEFAULT NULL COMMENT '刷新时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  `material_yield` float DEFAULT NULL COMMENT '原料出成率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8 COMMENT='商品加工成品倍量表';

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

/* Procedure structure for procedure `pro_initCategoryForTradingEntity` */

DELIMITER $$

/*!50003 CREATE DEFINER=`stock`@`%` PROCEDURE `pro_initCategoryForTradingEntity`()
begin
    declare district_id int;
    declare b int default 0;    /*是否达到记录的末尾控制变量*/    
    DECLARE cur_1 CURSOR FOR   select a.sku_district_id as district_id from  sku_district a  left JOIN sku_district_rel b on a.sku_district_id=b.sku_district_id where  a.is_defaul_dist=0 and a.is_valid=1 and a.is_del=0  and b.delivery_code in ('320506-001'); 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
    OPEN cur_1;
    FETCH cur_1 INTO district_id; /*获取第一条记录*/
    while b<>1 do           
 INSERT INTO sku_district_rel (sku_district_id,region_id,delivery_code,delivery_name,is_valid,create_date,create_user)
		values (district_id,320500,'320510','工业园区',1,NOW(),'zhaojinpeng'),
						(district_id,320500,'320511','高新区',1,NOW(),'zhaojinpeng');

INSERT INTO sku_district_rel (sku_district_id,region_id,delivery_code,delivery_name,is_valid,create_date,create_user)
		values (district_id,320510,'320510-001','工业园区*',1,NOW(),'zhaojinpeng'),
						(district_id,320511,'320511-001','高新区*',1,NOW(),'zhaojinpeng');

        FETCH cur_1 INTO district_id; /*取下一条记录*/
    end while;
    close cur_1;       
end */$$
DELIMITER ;

/* Procedure structure for procedure `sku_district_insert` */

DELIMITER $$

/*!50003 CREATE DEFINER=`stock`@`%` PROCEDURE `sku_district_insert`()
begin
    declare district_id int;
    declare b int default 0;    /*是否达到记录的末尾控制变量*/    
    DECLARE cur_1 CURSOR FOR   SELECT sku_district_id from sku_district_rel WHERE is_valid = 1 AND delivery_name like '吴中区%' and region_id = 320506 and sku_district_id  not in (21189,24373,24375,24381,24383,24385,24387,
24389,24391,24393,24395,24397,24399,24401,24403,24405,24407,24409,24411,24413,24415,24417,24419,24421,24423,23579,24473,22201,22763,16687,23927,23047,22949,24527,24529,24531,
24533,24535,24537,24545,24547,24551,24553,24555,24557,24559,24561,24563,24565,24567,24597,24599,24591,23587,24621,24623,24627,24629,24607,22415,24663,24697,24699,24701,24703,
24707,24767,24811,22497,23025,22499,23497,23583,24005,19207,19209,19211,18981,18979,18973,18971,18969,18975,18967,8997,9047,15939,15941,13917,13905,15641,16071,13911,15651,
11421,11445,11429,13287,11423,12367,13527,13519,13537,13515,13529,13525,13449,12099,12385,12127,12125,12083,12085,12383,12087,12097,12095,12091,12101,12387,12109,12107,12389,
12119,12117,12113,12115,12089,12123,12121,11379,11365,11367,11363,11359,11369,11361,11381,11383,11371,11373,10337,18983,12455,12459,12451,12453,12457,17275,13151,10309,10299,
14571,14569,10327,10325,18981,18979,18973,18971,18969,18975,18967,18357,10293,14573,10605,10607,10609,11303,11309,11311,11305,10289,11463,11461,10367,16685,11337,12469,14607,
16527,11301,17271,13979,17273,13455,13453,16525,10269,16345,16349,16337,10619,10617,10615,16353,16335,10277,10613,10611,10267,16339,15485,16347,16351,16341,10599,12461,10341
,10347,12443,10353,11329,11333,10345,11321,11315,12447,12445,16975,11331,11323,12449,10591,10593,10601,13609,11481,11487,10603,11473,11475,11477,11479,11483,11485,11489,11491
,14523,10587,10585,12473,10373,10375,10381,10377,10379,11507,11495,11497,11499,11503,10629,10625,10627,14183,14185,10575,10577,10579,13989,10423,10637,10635,10643,10411,10415
,10407,11535,11533,13159,10595,10597,10623,10631,10633,10387,10401,10389,11519,11517,13981,12067,13183,12069,14611,14619,12955,12957,11521,11525,13987,14525,11511,11513,14615
,13985,12063,10649,10589,10645,10647,12333,10383,11465,13983,11469,12475,12479,19207,9801,12053,9809,9811,9815,9817,19209,10073,19211,12897,10219,15287,10061,10057,10053,10047
,10045,10043,17149,10695,14267,14721,14729,16107,10723,14727,10203,10155,10151,10157,12907,12911,16695,16699,16697,16701,14187,14189,12307,10195,13645,10721,10693,11617,11619,
10245,10243,10241,10171,10169,10165,10251,10249,10177,10175,10217,10215,10213,10207,10209,10127,10025,10023,10131,10193,10191,10189,10187,10185,10181,10179,12349,11211,10019,
10009,10135,10137,12437,10703,10727,10729,10731,15841,15843,16099,14147,11345,11351,11353,11355,11347,11349,11357,15885,15883,12545,12547,12549,12551,14153,14149,15875,15873,
15877,16809,15879,15881,12309,10121,10109,10107,10105,10103,10101,9961,9959,9957,9955,16999,17001,10233,10231,14867,14869,14541,9999,9997,9995,9993,9991,9951,9953,9987,9985,
9989,9983,9981,9979,9977,9975,9973,9969,9967,9965,9963,16997,9939,15097,10229,10227,10097,10145,10143,10141,10139,11195,11197,13947,13945,10163,10161,10091,10089,10087,10093,
10095,8749,8751,8745,8747,13357,13359,13361,10715,10717,10029,15123,15125,10745,9309,9663,9675,9305,9289,11245,11167,11163,11161,11159,11157,11155,11127,11125,11115,9085,9087,
16399,16401,16403,12251,14311,9119,12257,12253,12235,12241,12233,12237,11265,11151,11137,9907,12281,12279,9685,12025,16629,15607,15605,12725,17711,8825,17291,17867,17119,18233,
18213,17871,10349,19243,19245,19255,19263,19265,19253,10273,18839,10271,10399,11523,12959,19307,11339,12965,13187,13177,12147,12497,12481,10741,10739,10743,19379,19381,19383,
19385,19387,19389,19391,19393,19395,19397,19399,19401,19403,19419,14593,14163,16787,13153,9257,12913,10037,10167,19471,19473,19475,19541,19543,19545,19547,19549,19553,19561,19595,
19597,19599,19601,19603,19607,19435,19643,19645,19647,19989,19991,11621,19667,19675,19677,19683,20001,20041,20093,20095,20097,20099,20101,20103,20105,20107,20109,20115,20117,20129,
20131,20165,19581,20253,20277,20281,19441,20349,20351,20357,20359,20333,19219,19221,20091,12483,12485,20475,10055,11193,20645,20185,13909,13913,21447,21477,12135,12133,13869,13875,
13877,21865,20857,21985,22093,22123,22127,22193,22227,22413,22417,10065,10063,15593,21813,21953,22135,9475,9419,9423,22751,22753,12167,12173,13349,12177,12175,12179,22755,22757,22759,
22761,22767,22791,22799,22801,22803,22805,22813,22817,9531,22843,18977,22871,22463,22557,17305,16879,17753,19873,21725,23199,23215,15025,23025,23079,23085,23087,23093,23095,23097,23107,
23109,23111,12161,8991,23325,23357,23359,23361,23363,23397,23395,23393,23391,23387,23421,21901,12137,19551,10079,10581,23457,23365,23497,23577,23583,23521,23249,23251,23255,23259,23257,
23261,23263,23265,23267,23747,23793,23843,23863,23299,23851,23241,23875,23879,23891,21521,22451,22459,20907,23895,23297,23587,20207,23907,21987,23937,23939,24011,24013,23295,23237,24023,
24051,10365,9117,24037,20775,23475,11537,11467,21789,19145,19147,19141,19143,21783,21785,21781,21791,19129,19131,19133,19139,19135,24063,23687,23689,22967,24093,10257,23471,23647,23691,
23693,23695,19119,23697,19121,19125,19123,19127,19161,19163,23469,10301,23713,23699,23703,23705,23473,23709,23711,23707,23701,24095,23911,10321,10307,10317,10297,15673,24109,11949,22985
,23189,24119,23809,14135,24137,22165,24145,24147,24149,24151,24153,23849,22279,23143,23145,24117,23499,22845,22851,24009,22105,24171,22993,23813,24185,24187,22981,22727,22941,22021,21439,
21441,13143,22789,22793,22771,22787,20635,21589,19429,22815,22725,22573,22605,17431,22601,22091,13039,22879,22657,24163,10261,24231,9209,24249,24251,9221,24253,24255,19417,24257,24121,
21909,21195,23459,22107,21189,24373,24375,24381,24383,24385,24387,24389,24391,24393,24395,24397,24399,24401,24403,24405,24407,24409,24411,24413,24415,24417,24419,24421,24423,23579,20659,
24083,24473,22201,22763,23119,16687,23927,23047,22949,23043,20563,24527,24529,24531,24533,24535,24537,24545,24547,24551,24553,24555,24557,24559,24561,24563,24565,24567,14571,24597,24599,
22657,24591,24591,23587,24621,24623,24627,24629,24607,24663,23119,24697,24699,24701,24703,24707,24767,22985,20207,24815,24827,24831,24833,22409,23311,24853,24861,24857,24859,21197,24939
,24941,23991,23105,9519,23969,11241,20011,20013,20007,20009,23099,23101,23103,23113,23549,23083,23115,22023,23537,23539,23541,23543,23547,23545,21535,20005,18431,23729,22175,23435,21951,
23943,23941,9563,9621,9619,9535,9543,9463,9467,9469,9425,9677,9679,9681,9683,9431,10687,12249,11273,11271,9631,9645,9643,9653,9635,9637,9657,9659,9665,9669,9673,9909,19261,9567,9569,9573
,9571,9575,12243,9565,21759,11169,11171,9443,9453,9445,9451,12275,12273,12277,9493,9497,9499,9321,9323,9387,9391,9389,9395,9393,12247,12245,21931,10563,8743,10569,19247,10565,19249,17605,
10559,19301,21607,19257,15653,24971,19777,16575,21991,24987,24989,24991,24993,24995,20263,24379,24679,25027,24181,9429,23355,15173,25071,23313,25127,19259,23353,9485,9487,23935,23745,21727,
12979,22085,22087,25187,25191,25243,25217,25219,25221,25223,25225,25227,25229,25231,25119,25083,25163,25123,25379,25381,25385,25387,25389,25391,25407,25409,25413,25415,25417,15469,15473,15471,
25117,25419,25421,25423,25425,25427,25115,17301,23799,12735,22189,12969,12925,20773,22811,22821,22809,22819,10463,17483,24427,17123,23123,17133,24803,20651,24785,22897,22669,12729,22765,25165,
22991,25175,24669,12731,13241,24923,24983,24981,11239,21851,25513,22025,20243,24163); 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
    OPEN cur_1;
    FETCH cur_1 INTO district_id; /*获取第一条记录*/
    while b<>1 do           
 INSERT INTO sku_district_rel (sku_district_id,region_id,delivery_code,delivery_name,is_valid,create_date,create_user)
		values (district_id,320500,'320510','工业园区',1,NOW(),'zhaojinpeng'),
						(district_id,320500,'320511','高新区',1,NOW(),'zhaojinpeng');

INSERT INTO sku_district_rel (sku_district_id,region_id,delivery_code,delivery_name,is_valid,create_date,create_user)
		values (district_id,320510,'320510-001','工业园区*',1,NOW(),'zhaojinpeng'),
						(district_id,320511,'320511-001','高新区*',1,NOW(),'zhaojinpeng');

        FETCH cur_1 INTO district_id; /*取下一条记录*/
    end while;
    close cur_1;       
end */$$
DELIMITER ;

/*Table structure for table `view_product_class` */

DROP TABLE IF EXISTS `view_product_class`;

/*!50001 CREATE TABLE  `view_product_class`(
 `level1_id` int(11) ,
 `level1_name` varchar(64) ,
 `level2_id` int(11) ,
 `level2_name` varchar(64) ,
 `level3_id` int(11) ,
 `level3_name` varchar(64) 
)*/;

/*Table structure for table `view_region` */

DROP TABLE IF EXISTS `view_region`;

/*!50001 CREATE TABLE  `view_region`(
 `county_region_id` varchar(16) ,
 `county_parent_region_id` int(11) ,
 `county_region_name` varchar(128) ,
 `county_region_level_id` int(11) ,
 `county_region_code` varchar(32) ,
 `county_is_valid` tinyint(4) ,
 `county_invalid_begin_date` datetime ,
 `city_region_id` varchar(16) ,
 `city_parent_region_id` int(11) ,
 `city_region_name` varchar(128) ,
 `city_region_level_id` int(11) ,
 `city_region_code` varchar(32) ,
 `city_is_valid` tinyint(4) ,
 `city_invalid_begin_date` datetime ,
 `province_region_id` varchar(16) ,
 `province_parent_region_id` int(11) ,
 `province_region_name` varchar(128) ,
 `province_region_level_id` int(11) ,
 `province_region_code` varchar(32) ,
 `province_is_valid` tinyint(4) ,
 `province_invalid_begin_date` datetime 
)*/;

/*View structure for view view_product_class */

/*!50001 DROP TABLE IF EXISTS `view_product_class` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`stock`@`172.16.%.%` SQL SECURITY DEFINER VIEW `view_product_class` AS (select `parent`.`parent_product_class_id` AS `level1_id`,`class1`.`product_class_name` AS `level1_name`,`child`.`parent_product_class_id` AS `level2_id`,`parent`.`product_class_name` AS `level2_name`,`child`.`product_class_id` AS `level3_id`,`child`.`product_class_name` AS `level3_name` from ((`product_class` `child` left join `product_class` `parent` on((`child`.`parent_product_class_id` = `parent`.`product_class_id`))) left join `product_class` `class1` on((`parent`.`parent_product_class_id` = `class1`.`product_class_id`))) where ((`child`.`class_level` = 3) and (`child`.`is_valid` = 1) and (`parent`.`is_valid` = 1))) */;

/*View structure for view view_region */

/*!50001 DROP TABLE IF EXISTS `view_region` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`stock`@`localhost` SQL SECURITY DEFINER VIEW `view_region` AS select `county`.`region_id` AS `county_region_id`,`county`.`parent_region_id` AS `county_parent_region_id`,`county`.`region_name` AS `county_region_name`,`county`.`region_level_id` AS `county_region_level_id`,`county`.`region_code` AS `county_region_code`,`county`.`is_valid` AS `county_is_valid`,`county`.`invalid_begin_date` AS `county_invalid_begin_date`,`city`.`region_id` AS `city_region_id`,`city`.`parent_region_id` AS `city_parent_region_id`,`city`.`region_name` AS `city_region_name`,`city`.`region_level_id` AS `city_region_level_id`,`city`.`region_code` AS `city_region_code`,`city`.`is_valid` AS `city_is_valid`,`city`.`invalid_begin_date` AS `city_invalid_begin_date`,`province`.`region_id` AS `province_region_id`,`province`.`parent_region_id` AS `province_parent_region_id`,`province`.`region_name` AS `province_region_name`,`province`.`region_level_id` AS `province_region_level_id`,`province`.`region_code` AS `province_region_code`,`province`.`is_valid` AS `province_is_valid`,`province`.`invalid_begin_date` AS `province_invalid_begin_date` from ((`region` `county` left join `region` `city` on((`county`.`parent_region_id` = `city`.`region_id`))) left join `region` `province` on((`city`.`parent_region_id` = `province`.`region_id`))) where ((`city`.`region_level_id` = 2) and (`province`.`region_level_id` = 1) and (`county`.`region_level_id` = 3)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

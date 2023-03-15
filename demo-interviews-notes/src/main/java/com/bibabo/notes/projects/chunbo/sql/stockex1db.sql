/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - stockex1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stockex1` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `order_sku_sale` */

CREATE TABLE `order_sku_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `sale_num` int(10) DEFAULT NULL,
  `op_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sku_id_index` (`sku_id`),
  KEY `op_date_index` (`op_date`)
) ENGINE=InnoDB AUTO_INCREMENT=279940 DEFAULT CHARSET=utf8;

/*Table structure for table `sku_sale_stock` */

CREATE TABLE `sku_sale_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品编号 order_detail',
  `ware_id` int(10) DEFAULT NULL COMMENT '库房号',
  `sku_name` varchar(128) DEFAULT NULL COMMENT '商品名称 sku_main',
  `sku_status` smallint(6) DEFAULT NULL COMMENT '商品状态 sku_main',
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品三级分类 sku_main',
  `level1_id` int(11) DEFAULT NULL COMMENT '商品一级分类',
  `level2_id` int(11) DEFAULT NULL COMMENT '商品二级分类',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商编号 supplier_sku',
  `supplier_name` varchar(128) DEFAULT NULL COMMENT '供应商名称 supplier_main',
  `stock_num` int(11) DEFAULT '0' COMMENT '库存 stock_inventory',
  `order_book_num` int(11) DEFAULT '0' COMMENT '订单预占 stock_inventory',
  `on_order_qty` int(11) DEFAULT '0' COMMENT '采购在途 stock_erp_inventory',
  `plan_deliver_day` int(11) DEFAULT NULL COMMENT '计划交货天数 supplier_main',
  `op_date` date DEFAULT NULL COMMENT '统计日期',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `sku_id_index` (`sku_id`),
  KEY `op_date_index` (`op_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2323346 DEFAULT CHARSET=utf8;

/*Table structure for table `sms_process` */

CREATE TABLE `sms_process` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `mobile` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `status` smallint(6) DEFAULT '0' COMMENT '0:新建1：成功-1，失败',
  `waybill_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `process_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '处理时间',
  `company` varchar(256) DEFAULT NULL,
  `deliver_time` varchar(64) DEFAULT NULL COMMENT '配送时间(扩展字段)',
  `extend1` varchar(1024) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `other_params` varchar(500) DEFAULT NULL COMMENT '扩展字段',
  `versionNo` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=399810906 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='短信发送处理';

/*Table structure for table `sms_process_his` */

CREATE TABLE `sms_process_his` (
  `id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单号',
  `mobile` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `status` smallint(6) DEFAULT '0' COMMENT '0:新建1：成功-1，失败',
  `waybill_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `is_lock` smallint(6) DEFAULT '0' COMMENT '是否加锁',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `process_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '处理时间',
  `company` varchar(256) DEFAULT NULL,
  `deliver_time` varchar(64) DEFAULT NULL COMMENT '配送时间(扩展字段)',
  `extend1` varchar(1024) DEFAULT NULL,
  `cust_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `other_params` varchar(500) DEFAULT NULL COMMENT '扩展字段',
  `versionNo` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送处理历史';

/*Table structure for table `sms_templet` */

CREATE TABLE `sms_templet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `sms_content` text COMMENT '短信模板内容',
  `email_content` text COMMENT '邮件模板内容',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '0:无效1：有效',
  `over_time` int(11) DEFAULT NULL COMMENT '超出时间分钟',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='短信模板';

/*Table structure for table `sms_type` */

CREATE TABLE `sms_type` (
  `type_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型编码',
  `type_value` varchar(32) DEFAULT NULL COMMENT '类型值',
  `is_valid` smallint(6) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='短信类型';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

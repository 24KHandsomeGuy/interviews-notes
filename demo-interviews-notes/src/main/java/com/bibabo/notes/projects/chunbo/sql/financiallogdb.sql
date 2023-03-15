/*
SQLyog Ultimate v10.51 
MySQL - 5.6.37-log : Database - financiallogdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`financiallogdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `electronic_invoice_log` */

CREATE TABLE `electronic_invoice_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT '' COMMENT '源id',
  `operate_type` int(11) DEFAULT '0' COMMENT '操作类型',
  `operate_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operate_by` varchar(50) DEFAULT '' COMMENT '操作人',
  `operate_desc` varchar(150) DEFAULT '' COMMENT '操作描述',
  `operate_detail` text COMMENT '操作数据',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(50) DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8411 DEFAULT CHARSET=utf8 COMMENT='电子发票操作日志表';

/*Table structure for table `electronic_invoice_order_rel` */

CREATE TABLE `electronic_invoice_order_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(50) DEFAULT '' COMMENT '发票代码',
  `invoice_num` varchar(50) DEFAULT '' COMMENT '发票号码',
  `order_id` varchar(200) NOT NULL DEFAULT '' COMMENT '订单号',
  `parent_invoice_id` varchar(50) DEFAULT '' COMMENT '父发票id',
  `fpqqlsh` varchar(50) DEFAULT '' COMMENT '流水号',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型0：蓝票，1红票',
  `electronicinvoice_url` varchar(300) DEFAULT '' COMMENT 'URL路径',
  `electronicinvoice_pic_url` varchar(255) DEFAULT '' COMMENT '发票图片url',
  `is_valid` varchar(4) DEFAULT '' COMMENT '是否可用 0不可以 1可用',
  `pic_assemble` tinyint(1) DEFAULT '0' COMMENT '是否已拼接图片',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建人',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '修改人',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_id` (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_parent_id` (`parent_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365564 DEFAULT CHARSET=utf8 COMMENT='电子发票发票代码与订单关系表';

/*Table structure for table `financial_operate_log` */

CREATE TABLE `financial_operate_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_date` datetime DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `operate_desc` varchar(500) DEFAULT NULL,
  `operate_detail` text,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96420287 DEFAULT CHARSET=utf8;

/*Table structure for table `invoice_operate_log` */

CREATE TABLE `invoice_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(128) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  `operate_date` datetime DEFAULT NULL,
  `operate_by` varchar(50) DEFAULT NULL,
  `operate_desc` varchar(500) DEFAULT NULL,
  `operate_detail` text,
  `creation_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1350592 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

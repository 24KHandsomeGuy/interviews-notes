-- Export Tools
-- Time: 2024-04-16 15:41:05
-- Service: s3511i.jxq.db.dmall.com:3511   Database: dmall_promise
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = capacity_range_config   */
/******************************************/
CREATE TABLE `capacity_range_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `config_id` bigint(20) NOT NULL COMMENT '运力规则id',
  `business_type` int(5) DEFAULT NULL,
  `delivery_type` int(5) NOT NULL COMMENT '配送方式 1:配送 2:自提',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_type` (`delivery_type`,`store_id`,`business_type`) USING BTREE,
  KEY `idx_config_id` (`config_id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=876962 DEFAULT CHARSET=utf8mb4 COMMENT='运力商家门店配置表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = fulfillment_rule   */
/******************************************/
CREATE TABLE `fulfillment_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int(11) NOT NULL COMMENT '规则类型',
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `begin_time` datetime NOT NULL COMMENT '生效开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '生效结束时间',
  `rule_config` json NOT NULL COMMENT '规则配置内容',
  `state` tinyint(4) NOT NULL COMMENT '规则状态',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `overall` int(11) DEFAULT '1' COMMENT '是否是全局兜底规则  1: 正常规则   -1：兜底规则',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '规则version',
  PRIMARY KEY (`id`),
  KEY `idx_xxx` (`business_type`,`end_time`,`begin_time`,`shipment_type`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_business_type_yn` (`overall`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=653962 DEFAULT CHARSET=utf8 COMMENT='履约规则表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = fulfillment_rule_bac   */
/******************************************/
CREATE TABLE `fulfillment_rule_bac` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int(11) NOT NULL COMMENT '规则类型',
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `begin_time` datetime NOT NULL COMMENT '生效开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '生效结束时间',
  `rule_config` json NOT NULL COMMENT '规则配置内容',
  `state` tinyint(4) NOT NULL COMMENT '规则状态',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '规则version',
  PRIMARY KEY (`id`),
  KEY `idx_xxx` (`business_type`,`end_time`,`begin_time`,`shipment_type`),
  KEY `idx_end_time` (`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10253 DEFAULT CHARSET=utf8 COMMENT='履约规则表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = fulfillment_rule_effect   */
/******************************************/
CREATE TABLE `fulfillment_rule_effect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id',
  `selector_id` int(11) NOT NULL,
  `dimension_ref_id` bigint(20) NOT NULL COMMENT '对应维度类型所指向的id',
  `dimension_ref_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `dimension_type` int(11) NOT NULL COMMENT '维度类型',
  `performance_type` int(11) NOT NULL DEFAULT '0' COMMENT '履约类型',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `rule_version` int(11) NOT NULL DEFAULT '1' COMMENT '规则version',
  `base_vendor_tag` int(5) DEFAULT NULL COMMENT '基础规则商家基础时段标志位 1:商家基础时段',
  PRIMARY KEY (`id`),
  KEY `index_rule_id` (`rule_id`),
  KEY `index_dimension_ref_id_dimension_type` (`dimension_ref_id`,`dimension_type`),
  KEY `idx_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50424122 DEFAULT CHARSET=utf8 COMMENT='规则关系表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = operate_log   */
/******************************************/
CREATE TABLE `operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `source_id` varchar(50) NOT NULL COMMENT '数据id',
  `operate_name` varchar(20) NOT NULL COMMENT '操作名称',
  `content` longtext COMMENT '操作内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `function_type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2575842 DEFAULT CHARSET=utf8 COMMENT='操作日志表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = promise_config   */
/******************************************/
CREATE TABLE `promise_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `vendor_name` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL COMMENT 'ERP门店ID',
  `store_type` int(4) DEFAULT NULL COMMENT '店铺类型',
  `store_name` varchar(255) DEFAULT NULL,
  `config_type` int(4) DEFAULT NULL COMMENT '配置类型：1，时段模板；',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `config_name` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `config_key` varchar(100) NOT NULL COMMENT '配置KEY',
  `config_value` json NOT NULL COMMENT '配置VALUE',
  `created` datetime DEFAULT NULL COMMENT '记录创建时间',
  `create_user` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL COMMENT '记录更新时间',
  `modify_user` varchar(100) DEFAULT NULL COMMENT '修改人',
  `yn` int(4) NOT NULL DEFAULT '1' COMMENT '有效性：1，正常；2，无效',
  PRIMARY KEY (`id`),
  KEY `idx_store_busi_key` (`store_id`,`business_type`,`config_key`) USING BTREE COMMENT '配置查询索引'
) ENGINE=InnoDB AUTO_INCREMENT=3282 DEFAULT CHARSET=utf8 COMMENT='promise配置表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = realtime_capacity_result   */
/******************************************/
CREATE TABLE `realtime_capacity_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店Id',
  `trade_type` bigint(20) NOT NULL DEFAULT '1' COMMENT 'è®¢å•ç±»åž‹',
  `shipment_type` int(4) DEFAULT NULL COMMENT '配送方式（\n1：配送\n 2：自提）',
  `shipment_date` date DEFAULT NULL COMMENT '订单履约日期',
  `shipment_time` varchar(40) DEFAULT NULL COMMENT '订单履约时段，格式为HH:mm-HH:mm',
  `pending_order_amount` bigint(20) DEFAULT NULL COMMENT '待履约订单量',
  `max_capacity` bigint(20) DEFAULT NULL COMMENT '最大运力',
  `capacity_factor` decimal(20,2) GENERATED ALWAYS AS ((`pending_order_amount` / `max_capacity`)) VIRTUAL COMMENT '运力系数',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后更新时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1=有效，-1=无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_erp_store_id_trade_type_shipment_type_data_time` (`erp_store_id`,`trade_type`,`shipment_type`,`shipment_date`,`shipment_time`) USING BTREE,
  KEY `realtime_capacity_result_erp_store_id_idx` (`erp_store_id`) USING BTREE,
  KEY `realtime_capacity_result_created_idx` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33289728 DEFAULT CHARSET=utf8 COMMENT='实时运力计算结果';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = realtime_capacity_result_archive   */
/******************************************/
CREATE TABLE `realtime_capacity_result_archive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店Id',
  `trade_type` bigint(20) NOT NULL DEFAULT '1' COMMENT 'è®¢å•ç±»åž‹',
  `shipment_type` int(4) DEFAULT NULL COMMENT '配送方式（\n1：配送\n 2：自提）',
  `shipment_date` date DEFAULT NULL COMMENT '订单履约日期',
  `shipment_time` varchar(40) DEFAULT NULL COMMENT '订单履约时段，格式为HH:mm-HH:mm',
  `pending_order_amount` bigint(20) DEFAULT NULL COMMENT '待履约订单量',
  `max_capacity` bigint(20) DEFAULT NULL COMMENT '最大运力',
  `capacity_factor` decimal(20,2) GENERATED ALWAYS AS ((`pending_order_amount` / `max_capacity`)) VIRTUAL COMMENT '运力系数',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后更新时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1=有效，-1=无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_erp_store_id_trade_type_shipment_type_date_time` (`erp_store_id`,`trade_type`,`shipment_type`,`shipment_date`,`shipment_time`) USING BTREE,
  KEY `realtime_capacity_result_erp_store_id_idx` (`erp_store_id`) USING BTREE,
  KEY `realtime_capacity_result_created_idx` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7317385 DEFAULT CHARSET=utf8 COMMENT='实时运力计算结果';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = store_o2o_immediate_config   */
/******************************************/
CREATE TABLE `store_o2o_immediate_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `content` json NOT NULL COMMENT '模板内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(255) DEFAULT NULL COMMENT '最后操作人',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='门店O2O立即送配置';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = store_o2o_immediate_timerange_id   */
/******************************************/
CREATE TABLE `store_o2o_immediate_timerange_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `sort` int(10) NOT NULL COMMENT '排序',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20043 DEFAULT CHARSET=utf8 COMMENT='门店O2O立即送时段id表  20000 <= id < 30000';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = store_o2o_time_range_relation   */
/******************************************/
CREATE TABLE `store_o2o_time_range_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `content` json NOT NULL COMMENT '模板内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(255) DEFAULT NULL COMMENT '最后操作人',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='下单时间和配送时间关系表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = store_presale_config   */
/******************************************/
CREATE TABLE `store_presale_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `content` json NOT NULL COMMENT '模板内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `modify_user` varchar(255) DEFAULT NULL COMMENT '最后操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='预售配置表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = store_takeout_config   */
/******************************************/
CREATE TABLE `store_takeout_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `takeout_config` json NOT NULL COMMENT '便当时段配置',
  `takeout_config_yn` int(2) NOT NULL COMMENT '便当时段配置yn',
  `tpx_config` json DEFAULT NULL COMMENT '便当T+x配置',
  `tpx_config_yn` int(2) DEFAULT NULL COMMENT '便当T+x配置yn',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(255) DEFAULT NULL COMMENT '最后操作人',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='门店便当配置表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = tpx_filter_rule   */
/******************************************/
CREATE TABLE `tpx_filter_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `range_type` int(4) DEFAULT NULL COMMENT '规则范围',
  `begin_time` datetime NOT NULL COMMENT '生效开始时间',
  `end_time` datetime NOT NULL COMMENT '生效结束时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `config` json NOT NULL COMMENT '规则内容',
  `state` int(4) DEFAULT NULL COMMENT '规则状态',
  `created` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `yn` int(4) DEFAULT NULL COMMENT '有效性',
  `store_count` int(10) DEFAULT NULL COMMENT '适用门店数',
  `type` int(4) DEFAULT NULL COMMENT '规则类型',
  `group_id` bigint(40) DEFAULT NULL COMMENT '规则组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = vendor_config   */
/******************************************/
CREATE TABLE `vendor_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `vendor_name` varchar(45) NOT NULL COMMENT '商家名称',
  `config` json NOT NULL COMMENT '配置内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `name` varchar(50) DEFAULT NULL COMMENT '规则名称',
  `range_type` int(5) DEFAULT '1' COMMENT '适用范围 1:商家 2:门店',
  `delivery_type` int(5) DEFAULT '1' COMMENT '配送方式 1:配送 2:自提',
  `business_type` int(5) DEFAULT NULL COMMENT '业态类型',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=261162 DEFAULT CHARSET=utf8 COMMENT='商家配置表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = vendor_presale_config   */
/******************************************/
CREATE TABLE `vendor_presale_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `content` json NOT NULL COMMENT '模板内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user` varchar(255) DEFAULT NULL COMMENT '最后操作人',
  `yn` int(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商家预售配置';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = vendor_rule   */
/******************************************/
CREATE TABLE `vendor_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) NOT NULL COMMENT '配送方式',
  `rule_config` json NOT NULL COMMENT '规则配置内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家履约规则表';


/******************************************/
/*   DatabaseName = dmall_promise   */
/*   TableName = version2_0_comparison   */
/******************************************/
CREATE TABLE `version2_0_comparison` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `business_type` bigint(20) DEFAULT NULL,
  `api_name` varchar(100) NOT NULL,
  `request_param` json DEFAULT NULL,
  `version1_result` json DEFAULT NULL,
  `version2_result` json DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4766912 DEFAULT CHARSET=utf8 COMMENT='数据对比表';


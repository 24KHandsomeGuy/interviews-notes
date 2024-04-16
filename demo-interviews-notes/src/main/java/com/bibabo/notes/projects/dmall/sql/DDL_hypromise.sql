-- Export Tools
-- Time: 2024-04-16 15:24:08
-- Service: s4102i.yz.db.inner-dmall.com:4102   Database: dmall_hypromise
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_area   */
/******************************************/
CREATE TABLE `hy_capacity_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pool_id` bigint(20) NOT NULL COMMENT 'pool表id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `capacity_type` int(11) DEFAULT NULL COMMENT '运力类型：1，拣货；2，配送',
  `capacity` tinyint(4) DEFAULT NULL COMMENT '原始运力值*100， 不做扣减，只作为比较值',
  `push_capacity` int(11) DEFAULT NULL COMMENT '生产系统推送的运力*100',
  `data_source` int(11) DEFAULT NULL COMMENT '数据来源（1：人工修改；2：人工应用推送；3：导入）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  `area_id` bigint(20) NOT NULL COMMENT '路区id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pool_store` (`pool_id`,`store_id`,`capacity_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211482 DEFAULT CHARSET=utf8 COMMENT='运力池（生产自动化）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_factor   */
/******************************************/
CREATE TABLE `hy_capacity_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `factor_type` int(11) DEFAULT '1' COMMENT '规则类型：1，拣货、2，配送',
  `factor_business` int(11) DEFAULT NULL COMMENT '规则类型业态，如 factor_type=1 时 o2o普通、全球精选、o2oT+30、o2oT+60',
  `coefficient` int(11) DEFAULT NULL COMMENT '运力扣减系数',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '适用商品skuid',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '适用商品名称',
  `data_source` int(11) DEFAULT NULL COMMENT '数据来源（1：生产推送，2：导入，3:人工）',
  `desc` varchar(255) DEFAULT NULL COMMENT '场景、业态描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8 COMMENT='运力池规则（扣减系数等，生产自动化）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_peak   */
/******************************************/
CREATE TABLE `hy_capacity_peak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `business_small_type` int(11) DEFAULT NULL COMMENT '业务小类',
  `rule_status` tinyint(4) DEFAULT NULL COMMENT '规则状态：开启，关闭。',
  `deduction_type` int(11) DEFAULT NULL COMMENT '扣减方式:依次扣减、随机扣减',
  `rule` json DEFAULT NULL COMMENT '配置详情',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx` (`store_id`,`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21882 DEFAULT CHARSET=utf8 COMMENT='运力峰值比例';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_pool   */
/******************************************/
CREATE TABLE `hy_capacity_pool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `capacity_date` date DEFAULT NULL COMMENT '日期',
  `capacity_type` int(11) DEFAULT NULL COMMENT '运力类型：1，配送；2，拣货',
  `time_node` int(11) DEFAULT NULL COMMENT '运力时段，如2对应01:00-01:30',
  `capacity` int(11) DEFAULT NULL COMMENT '原始运力值*100， 不做扣减，只作为比较值',
  `push_capacity` int(11) DEFAULT NULL COMMENT '生产系统推送的运力*100',
  `peak_level` int(11) DEFAULT NULL COMMENT '峰值分级',
  `push_peak_level` int(11) DEFAULT NULL COMMENT '生产系统推送的峰值分级',
  `special_tag` json DEFAULT NULL COMMENT '特殊标记：1，大促；',
  `data_source` int(11) DEFAULT NULL COMMENT '数据来源（1：人工修改；2：人工应用推送；3：导入）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_capacity` (`store_id`,`capacity_date`,`capacity_type`,`time_node`),
  KEY `idx` (`store_id`,`capacity_date`,`time_node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1485935122 DEFAULT CHARSET=utf8 COMMENT='运力池（生产自动化）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_record   */
/******************************************/
CREATE TABLE `hy_capacity_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `capacity_date` datetime DEFAULT NULL COMMENT '日期',
  `capacity_type` int(11) DEFAULT NULL COMMENT '运力类型：1拣货；2，配送',
  `delivery_time` int(11) DEFAULT NULL COMMENT '配送运力时段，如2对应01:00-01:30',
  `pick_time` int(11) DEFAULT NULL COMMENT '拣货扣减运力运力时段，如2对应01:00-01:30',
  `delivery_capacity` int(11) DEFAULT NULL COMMENT '配送扣减运力',
  `pick_capacity` int(11) DEFAULT NULL COMMENT '拣货扣减运力',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `operation_type` tinyint(4) DEFAULT '1' COMMENT '操作类型1.回滚2.扣减',
  `remarks` varchar(1024) DEFAULT NULL COMMENT '请求数据全量数据',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  KEY `idx` (`store_id`,`capacity_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=731969362 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='运力池扣减记录';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_rule   */
/******************************************/
CREATE TABLE `hy_capacity_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则 hy_period_rule.id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `date` date DEFAULT NULL COMMENT '运力日期，如 2020-02-02',
  `period` varchar(50) DEFAULT NULL COMMENT '运力时段，如 10:00 -12:00',
  `used_capacity` int(11) DEFAULT '0' COMMENT '占用运力（POP会归档，若为空，从redis取）',
  `data_source` int(11) DEFAULT NULL COMMENT '数据来源（1：生产推送，2：导入，3:人工）',
  `status` int(11) DEFAULT NULL COMMENT '状态：1，生效中；2，已失效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `v_sku` (`sku_id`,`date`,`period`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=9602 DEFAULT CHARSET=utf8 COMMENT='运力规则（POP等）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_toggle   */
/******************************************/
CREATE TABLE `hy_capacity_toggle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `shipment_type` int(11) DEFAULT '1' COMMENT '规则类型：1，拣货、2，配送',
  `factor_business` int(11) DEFAULT NULL COMMENT '业态，如单品单结、茅台预购等',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '适用商品skuid',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '适用商品名称',
  `toggle` int(11) DEFAULT NULL COMMENT '是否扣减运力',
  `toggle_delivery` int(11) DEFAULT '1' COMMENT '是否扣减配送运力',
  `toggle_pickup` int(11) DEFAULT '1' COMMENT '是否扣减拣货运力',
  `desc` varchar(255) DEFAULT NULL COMMENT '场景、业态描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33562 DEFAULT CHARSET=utf8 COMMENT='运力开关（生产自动化）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_capacity_warning   */
/******************************************/
CREATE TABLE `hy_capacity_warning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `shipment_type` int(11) DEFAULT '1' COMMENT '规则类型：1，配送、2，自提',
  `factor_business` int(11) DEFAULT NULL COMMENT '业态，如单品单结、茅台预购等',
  `warning_type` tinyint(4) DEFAULT NULL COMMENT '预警类型：1，全天剩余单量预警 2,时段运力紧张预警',
  `percentage` int(11) DEFAULT NULL COMMENT '剩余运力预警百分比',
  `surplus` int(11) DEFAULT NULL COMMENT '剩余运力量预警',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38042 DEFAULT CHARSET=utf8 COMMENT='运力值预警（生产自动化）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_config   */
/******************************************/
CREATE TABLE `hy_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `vendor_name` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL COMMENT 'ERP门店ID',
  `store_name` varchar(255) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `title` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `config_type` int(4) NOT NULL COMMENT '配置类型',
  `config_value` json NOT NULL COMMENT '配置VALUE',
  `created` datetime DEFAULT NULL COMMENT '记录创建时间',
  `create_user` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL COMMENT '记录更新时间',
  `modify_user` varchar(100) DEFAULT NULL COMMENT '修改人',
  `yn` int(4) NOT NULL DEFAULT '1' COMMENT '有效性：1，正常；2，无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='promise配置表';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_log   */
/******************************************/
CREATE TABLE `hy_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `tern_id` bigint(20) DEFAULT NULL COMMENT '围栏id',
  `tern_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `log_title` varchar(20) NOT NULL COMMENT '操作名称',
  `log_key` int(11) NOT NULL COMMENT '日志key',
  `log_type` int(11) NOT NULL COMMENT '日志类型：1，时效；2，运力；3，运营',
  `business_time` date DEFAULT NULL COMMENT '业务时间',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `source_id` varchar(50) DEFAULT NULL COMMENT '数据id',
  `content` json DEFAULT NULL COMMENT '操作内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx` (`vendor_id`,`log_key`,`source_id`) USING BTREE,
  KEY `sourceidx` (`source_id`),
  KEY `logidx` (`log_type`,`log_key`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5582244002 DEFAULT CHARSET=utf8 COMMENT='时效日志';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_opration   */
/******************************************/
CREATE TABLE `hy_opration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `source_id` varchar(50) DEFAULT NULL COMMENT '数据id',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `shipment_type` tinyint(4) DEFAULT NULL COMMENT '配送方式（1-配送，2-自提）',
  `log_title` varchar(20) DEFAULT NULL COMMENT '操作名称',
  `log_key` int(11) DEFAULT NULL COMMENT '日志key',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态（0-已作废，1-已预警，2-已执行）',
  `content` json DEFAULT NULL COMMENT '操作内容',
  `notice_time` datetime DEFAULT NULL COMMENT '日期（预警发生日期）',
  `created` datetime DEFAULT NULL COMMENT '创建时间（通知时间）',
  `modified` datetime DEFAULT NULL COMMENT '修改时间（操作时间）',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人（作废或者执行）',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idex_warn` (`vendor_id`,`store_id`,`log_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37679562 DEFAULT CHARSET=utf8 COMMENT='操作（截单、通知等）';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_log   */
/******************************************/
CREATE TABLE `hy_period_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `tern_id` bigint(20) DEFAULT NULL COMMENT '围栏id',
  `tern_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `log_title` varchar(50) NOT NULL COMMENT '操作名称',
  `log_key` int(11) NOT NULL COMMENT '日志key',
  `log_type` int(11) NOT NULL COMMENT '日志类型：1，时效；2，运力；3，运营',
  `business_time` date DEFAULT NULL COMMENT '业务时间',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `performance_type` varchar(50) DEFAULT NULL COMMENT '履约类型',
  `source_id` varchar(50) DEFAULT NULL COMMENT '数据id',
  `content` json DEFAULT NULL COMMENT '操作内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `sourceid_IDX` (`source_id`) USING BTREE,
  KEY `vendor_logtype_IDX` (`vendor_id`,`store_id`,`log_type`,`log_key`,`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1008242 DEFAULT CHARSET=utf8 COMMENT='时效日志，原hy_log仅记录运力';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_msg   */
/******************************************/
CREATE TABLE `hy_period_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL,
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `performance_type` varchar(50) NOT NULL DEFAULT ' ' COMMENT '履约类型',
  `page_type` int(11) DEFAULT NULL COMMENT '规则类型：1，全部；2，商品详情页; 3,购物车; 4, 结算页',
  `config` json NOT NULL COMMENT '配置详情',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `v_b` (`vendor_id`,`page_type`,`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='时效文案';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_rule   */
/******************************************/
CREATE TABLE `hy_period_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '规则类型',
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `rule_type` int(11) DEFAULT NULL COMMENT '规则类型：1，门店；2，围栏',
  `config` json NOT NULL COMMENT '配置详情',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `v_b` (`vendor_id`,`type`,`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163202 DEFAULT CHARSET=utf8 COMMENT='时段规则';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_shipment   */
/******************************************/
CREATE TABLE `hy_period_shipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(6) NOT NULL COMMENT '配送方式',
  `performance_type` varchar(50) DEFAULT NULL COMMENT '履约类型',
  `status` tinyint(4) NOT NULL COMMENT '状态：1，开启；2,关闭',
  `defaults` tinyint(4) NOT NULL COMMENT '默认：1：是；2：否',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_STORE` (`vendor_id`,`store_id`) USING BTREE,
  KEY `IDX_BUSINESS` (`business_type`) USING BTREE,
  KEY `IDX_SHIPMENT` (`shipment_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41682 DEFAULT CHARSET=utf8 COMMENT='配送方式开关';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_store   */
/******************************************/
CREATE TABLE `hy_period_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `tern_id` bigint(20) DEFAULT NULL COMMENT '围栏id',
  `tern_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) NOT NULL COMMENT '配送方式',
  `performance_type` varchar(50) NOT NULL DEFAULT ' ' COMMENT '履约类型',
  `rule_type` int(11) NOT NULL COMMENT '规则类型：1，门店；2，围栏（可以多个）',
  `interval_type` int(11) NOT NULL COMMENT '类型：1，临时；2，兜底',
  `start` datetime NOT NULL COMMENT '开始时间',
  `end` datetime NOT NULL COMMENT '结束时间',
  `rule_id` bigint(20) NOT NULL COMMENT '规则ID',
  `rule_name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `properties` json DEFAULT NULL COMMENT '扩展字段',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_STORE` (`store_id`,`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=729162 DEFAULT CHARSET=utf8 COMMENT='门店时段';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_template   */
/******************************************/
CREATE TABLE `hy_period_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `times` json DEFAULT NULL COMMENT '时间段集合',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人 ',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor` (`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8 COMMENT='时段模板';


/******************************************/
/*   DatabaseName = dmall_hypromise   */
/*   TableName = hy_period_ware   */
/******************************************/
CREATE TABLE `hy_period_ware` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则 hy_period_rule.id',
  `rule_name` varchar(128) DEFAULT NULL COMMENT '规则名称',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `vender_id` bigint(50) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(50) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，2无效',
  PRIMARY KEY (`id`),
  KEY `idex` (`rule_id`,`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4682 DEFAULT CHARSET=utf8 COMMENT='POP商品绑定时效规则';


-- Export Tools
-- Time: 2024-04-16 15:24:31
-- Service: s4467i.tc.db.inner-dmall.com:4467   Database: hyathena
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = hyathena   */
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='athena配置表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_expense_discount_rule   */
/******************************************/
CREATE TABLE `hy_expense_discount_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) DEFAULT NULL,
  `rule_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '减免规则名称',
  `discount_freight` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '减免金额',
  `token_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '令牌id',
  `member_level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员等级 多个逗号分隔',
  `week_day` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期 多个逗号分隔',
  `skus` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku 多个逗号分隔',
  `mark_str` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标识',
  `limit_type_switch` tinyint(4) DEFAULT NULL COMMENT '订单减免类型 1不限 2自定义门槛',
  `limit_order_amount` int(11) DEFAULT NULL COMMENT '订单减免门槛',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数',
  `use_times` int(5) DEFAULT NULL COMMENT '限制次数',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `use_time_start_time` datetime DEFAULT NULL COMMENT '自定义时间限制 开始时间',
  `use_time_end_time` datetime DEFAULT NULL COMMENT '自定义时间限制 结束时间',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100881 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_expense_log   */
/******************************************/
CREATE TABLE `hy_expense_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `tern_id` bigint(20) DEFAULT NULL COMMENT '围栏id',
  `tern_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `log_title` varchar(50) NOT NULL COMMENT '操作名称',
  `log_key` int(11) NOT NULL COMMENT '日志key',
  `log_type` int(11) NOT NULL COMMENT '日志类型',
  `business_time` date DEFAULT NULL COMMENT '业务时间',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `source_id` varchar(50) DEFAULT NULL COMMENT '数据id',
  `content` json DEFAULT NULL COMMENT '操作内容',
  `created` datetime NOT NULL COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx` (`vendor_id`,`log_key`,`source_id`) USING BTREE,
  KEY `logidx` (`log_type`,`log_key`,`store_id`) USING BTREE,
  KEY `sourceidx` (`source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=309201 DEFAULT CHARSET=utf8 COMMENT='运费日志';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_expense_relation_log   */
/******************************************/
CREATE TABLE `hy_expense_relation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `rule_id` bigint(20) NOT NULL COMMENT '基础规则id',
  `relation_id` bigint(20) NOT NULL COMMENT '操作规则id',
  `oper_type` int(11) NOT NULL COMMENT '1.新增 2修改 3删除',
  `before_content` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作前内容',
  `after_content` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relation_id_index` (`relation_id`),
  KEY `rule_id_index` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5561 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_expense_rule   */
/******************************************/
CREATE TABLE `hy_expense_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '规则类型',
  `name` varchar(255) NOT NULL COMMENT '规则名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) DEFAULT NULL COMMENT '配送方式',
  `rule_type` int(11) DEFAULT NULL COMMENT '规则类型：1，门店；2，围栏（赞废弃）',
  `config` json NOT NULL COMMENT '配置详情',
  `relation_config` json DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(50) NOT NULL COMMENT '创建人',
  `modify_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `v_b` (`vendor_id`,`type`,`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8161 DEFAULT CHARSET=utf8 COMMENT='运费规则';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_expense_store   */
/******************************************/
CREATE TABLE `hy_expense_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `tern_id` bigint(20) DEFAULT NULL COMMENT '围栏id',
  `tern_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `business_type` int(11) NOT NULL COMMENT '业态类型',
  `shipment_type` int(11) NOT NULL COMMENT '配送方式',
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
  `performance_type` varchar(32) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`),
  KEY `IDX_STORE` (`store_id`,`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=800161 DEFAULT CHARSET=utf8 COMMENT='门店时段';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation   */
/******************************************/
CREATE TABLE `hy_rule_limitation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_000   */
/******************************************/
CREATE TABLE `hy_rule_limitation_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_001   */
/******************************************/
CREATE TABLE `hy_rule_limitation_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2921 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_002   */
/******************************************/
CREATE TABLE `hy_rule_limitation_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2121 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_003   */
/******************************************/
CREATE TABLE `hy_rule_limitation_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_004   */
/******************************************/
CREATE TABLE `hy_rule_limitation_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1401 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_005   */
/******************************************/
CREATE TABLE `hy_rule_limitation_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_006   */
/******************************************/
CREATE TABLE `hy_rule_limitation_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_007   */
/******************************************/
CREATE TABLE `hy_rule_limitation_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_008   */
/******************************************/
CREATE TABLE `hy_rule_limitation_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_009   */
/******************************************/
CREATE TABLE `hy_rule_limitation_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_010   */
/******************************************/
CREATE TABLE `hy_rule_limitation_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2201 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_011   */
/******************************************/
CREATE TABLE `hy_rule_limitation_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1721 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_012   */
/******************************************/
CREATE TABLE `hy_rule_limitation_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_013   */
/******************************************/
CREATE TABLE `hy_rule_limitation_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2441 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_014   */
/******************************************/
CREATE TABLE `hy_rule_limitation_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_015   */
/******************************************/
CREATE TABLE `hy_rule_limitation_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_016   */
/******************************************/
CREATE TABLE `hy_rule_limitation_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1481 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_017   */
/******************************************/
CREATE TABLE `hy_rule_limitation_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1921 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_018   */
/******************************************/
CREATE TABLE `hy_rule_limitation_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_019   */
/******************************************/
CREATE TABLE `hy_rule_limitation_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_020   */
/******************************************/
CREATE TABLE `hy_rule_limitation_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_021   */
/******************************************/
CREATE TABLE `hy_rule_limitation_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_022   */
/******************************************/
CREATE TABLE `hy_rule_limitation_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_023   */
/******************************************/
CREATE TABLE `hy_rule_limitation_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_024   */
/******************************************/
CREATE TABLE `hy_rule_limitation_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_025   */
/******************************************/
CREATE TABLE `hy_rule_limitation_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_026   */
/******************************************/
CREATE TABLE `hy_rule_limitation_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_027   */
/******************************************/
CREATE TABLE `hy_rule_limitation_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_028   */
/******************************************/
CREATE TABLE `hy_rule_limitation_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1561 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_029   */
/******************************************/
CREATE TABLE `hy_rule_limitation_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1441 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_030   */
/******************************************/
CREATE TABLE `hy_rule_limitation_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_031   */
/******************************************/
CREATE TABLE `hy_rule_limitation_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_032   */
/******************************************/
CREATE TABLE `hy_rule_limitation_032` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_033   */
/******************************************/
CREATE TABLE `hy_rule_limitation_033` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_034   */
/******************************************/
CREATE TABLE `hy_rule_limitation_034` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=7041 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_035   */
/******************************************/
CREATE TABLE `hy_rule_limitation_035` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_036   */
/******************************************/
CREATE TABLE `hy_rule_limitation_036` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_037   */
/******************************************/
CREATE TABLE `hy_rule_limitation_037` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_038   */
/******************************************/
CREATE TABLE `hy_rule_limitation_038` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2241 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_039   */
/******************************************/
CREATE TABLE `hy_rule_limitation_039` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_040   */
/******************************************/
CREATE TABLE `hy_rule_limitation_040` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_041   */
/******************************************/
CREATE TABLE `hy_rule_limitation_041` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1881 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_042   */
/******************************************/
CREATE TABLE `hy_rule_limitation_042` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_043   */
/******************************************/
CREATE TABLE `hy_rule_limitation_043` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2521 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_044   */
/******************************************/
CREATE TABLE `hy_rule_limitation_044` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_045   */
/******************************************/
CREATE TABLE `hy_rule_limitation_045` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_046   */
/******************************************/
CREATE TABLE `hy_rule_limitation_046` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_047   */
/******************************************/
CREATE TABLE `hy_rule_limitation_047` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_048   */
/******************************************/
CREATE TABLE `hy_rule_limitation_048` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_049   */
/******************************************/
CREATE TABLE `hy_rule_limitation_049` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_050   */
/******************************************/
CREATE TABLE `hy_rule_limitation_050` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1761 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_051   */
/******************************************/
CREATE TABLE `hy_rule_limitation_051` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_052   */
/******************************************/
CREATE TABLE `hy_rule_limitation_052` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_053   */
/******************************************/
CREATE TABLE `hy_rule_limitation_053` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_054   */
/******************************************/
CREATE TABLE `hy_rule_limitation_054` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_055   */
/******************************************/
CREATE TABLE `hy_rule_limitation_055` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_056   */
/******************************************/
CREATE TABLE `hy_rule_limitation_056` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_057   */
/******************************************/
CREATE TABLE `hy_rule_limitation_057` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1761 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_058   */
/******************************************/
CREATE TABLE `hy_rule_limitation_058` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_059   */
/******************************************/
CREATE TABLE `hy_rule_limitation_059` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_060   */
/******************************************/
CREATE TABLE `hy_rule_limitation_060` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1761 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_061   */
/******************************************/
CREATE TABLE `hy_rule_limitation_061` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_062   */
/******************************************/
CREATE TABLE `hy_rule_limitation_062` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_063   */
/******************************************/
CREATE TABLE `hy_rule_limitation_063` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_064   */
/******************************************/
CREATE TABLE `hy_rule_limitation_064` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_065   */
/******************************************/
CREATE TABLE `hy_rule_limitation_065` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_066   */
/******************************************/
CREATE TABLE `hy_rule_limitation_066` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_067   */
/******************************************/
CREATE TABLE `hy_rule_limitation_067` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_068   */
/******************************************/
CREATE TABLE `hy_rule_limitation_068` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_069   */
/******************************************/
CREATE TABLE `hy_rule_limitation_069` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_070   */
/******************************************/
CREATE TABLE `hy_rule_limitation_070` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_071   */
/******************************************/
CREATE TABLE `hy_rule_limitation_071` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_072   */
/******************************************/
CREATE TABLE `hy_rule_limitation_072` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_073   */
/******************************************/
CREATE TABLE `hy_rule_limitation_073` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_074   */
/******************************************/
CREATE TABLE `hy_rule_limitation_074` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_075   */
/******************************************/
CREATE TABLE `hy_rule_limitation_075` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1521 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_076   */
/******************************************/
CREATE TABLE `hy_rule_limitation_076` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_077   */
/******************************************/
CREATE TABLE `hy_rule_limitation_077` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_078   */
/******************************************/
CREATE TABLE `hy_rule_limitation_078` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1521 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_079   */
/******************************************/
CREATE TABLE `hy_rule_limitation_079` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1521 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_080   */
/******************************************/
CREATE TABLE `hy_rule_limitation_080` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_081   */
/******************************************/
CREATE TABLE `hy_rule_limitation_081` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1561 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_082   */
/******************************************/
CREATE TABLE `hy_rule_limitation_082` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_083   */
/******************************************/
CREATE TABLE `hy_rule_limitation_083` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_084   */
/******************************************/
CREATE TABLE `hy_rule_limitation_084` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2161 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_085   */
/******************************************/
CREATE TABLE `hy_rule_limitation_085` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_086   */
/******************************************/
CREATE TABLE `hy_rule_limitation_086` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_087   */
/******************************************/
CREATE TABLE `hy_rule_limitation_087` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_088   */
/******************************************/
CREATE TABLE `hy_rule_limitation_088` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_089   */
/******************************************/
CREATE TABLE `hy_rule_limitation_089` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_090   */
/******************************************/
CREATE TABLE `hy_rule_limitation_090` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_091   */
/******************************************/
CREATE TABLE `hy_rule_limitation_091` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2441 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_092   */
/******************************************/
CREATE TABLE `hy_rule_limitation_092` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_093   */
/******************************************/
CREATE TABLE `hy_rule_limitation_093` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_094   */
/******************************************/
CREATE TABLE `hy_rule_limitation_094` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_095   */
/******************************************/
CREATE TABLE `hy_rule_limitation_095` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_096   */
/******************************************/
CREATE TABLE `hy_rule_limitation_096` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_097   */
/******************************************/
CREATE TABLE `hy_rule_limitation_097` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1481 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_098   */
/******************************************/
CREATE TABLE `hy_rule_limitation_098` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=1281 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


/******************************************/
/*   DatabaseName = hyathena   */
/*   TableName = hy_rule_limitation_099   */
/******************************************/
CREATE TABLE `hy_rule_limitation_099` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `count` int(5) NOT NULL DEFAULT '0' COMMENT '已经使用的限购次数',
  `rollback_count` int(5) DEFAULT '0' COMMENT '回滚的次数',
  `version` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  `use_times_limit_type` tinyint(4) DEFAULT NULL COMMENT '单用户减免次数类型 1不限制 2限制次数 3按时间限制次数 4自定义时间限制次数 ',
  `use_times_type` tinyint(4) DEFAULT NULL COMMENT '时间限制次数类型 1天 2周',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `effected` datetime DEFAULT NULL COMMENT '生效时间',
  `expired` datetime DEFAULT NULL COMMENT '失效时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1有效，-1无效',
  `unique_id` varchar(50) DEFAULT NULL COMMENT '约束key:rule_id-user_id-effected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `rule_id_index` (`rule_id`),
  KEY `user_id_index` (`user_id`),
  KEY `count_index` (`count`),
  KEY `created_index` (`created`),
  KEY `modified_index` (`modified`),
  KEY `expired_index` (`expired`),
  KEY `effected_index` (`effected`)
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=utf8mb4 COMMENT='用户限购表';


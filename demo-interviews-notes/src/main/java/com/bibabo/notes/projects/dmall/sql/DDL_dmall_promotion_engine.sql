-- Export Tools
-- Time: 2024-04-16 15:30:13
-- Service: s4063i.yz.db.inner-dmall.com:4063   Database: dmall_promotion_engine
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = dmall_line_price   */
/******************************************/
CREATE TABLE `dmall_line_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品skuId',
  `line_price` bigint(10) DEFAULT NULL COMMENT '最大值，精确到分',
  `last_update_time` datetime DEFAULT NULL COMMENT '定时任务更新时间',
  `version` int(11) DEFAULT '1' COMMENT '版本',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133458402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = dmall_line_price_cofig   */
/******************************************/
CREATE TABLE `dmall_line_price_cofig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `config_type` int(4) NOT NULL COMMENT '配置类型，1:黑名单、2、人工锁价',
  `item_type` int(4) NOT NULL COMMENT '参与元素类型，1:指定SKU，2、前台三级分类，3：商品后台分类，4：排除sku',
  `item_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与元素编码',
  `item_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参与元素名称',
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '批次',
  `status` int(4) NOT NULL COMMENT '状态：1：生效中，-1删除，-2手动录入，-3批量录入 -4清空',
  `creator` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `operator` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(4) NOT NULL DEFAULT '1' COMMENT '有效标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2887722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='划线价配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = dmall_line_price_cofig_log   */
/******************************************/
CREATE TABLE `dmall_line_price_cofig_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `config_type` int(4) NOT NULL COMMENT '配置类型，1:黑名单、2、人工锁价',
  `content` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作内容',
  `creator` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(4) NOT NULL DEFAULT '1' COMMENT '有效标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='划线价配置日志';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_apply   */
/******************************************/
CREATE TABLE `proengine_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `apply_type` tinyint(4) NOT NULL COMMENT '适用类型，1:平台,2:用户等级,3:渠道,4:用户令牌，5：结算类型，6：业务类型，7：会员标签',
  `apply_value` int(11) NOT NULL COMMENT '适用类型值',
  `apply_weight` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_APPLY_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_APPLY_TYPE` (`apply_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3408326602 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销方案适用配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_apply_item   */
/******************************************/
CREATE TABLE `proengine_apply_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_id` bigint(20) NOT NULL COMMENT '促销ID',
  `pro_apply_id` bigint(20) NOT NULL COMMENT '促销适用方案ID，apply表的id',
  `item_code` varchar(50) NOT NULL COMMENT '促销适用方案子项唯一标识',
  `item_type` tinyint(4) NOT NULL COMMENT '促销适用方案子项类型',
  `item_value` text NOT NULL COMMENT '促销适用方案子项对应值集合',
  `item_scope` tinyint(4) NOT NULL COMMENT '促销适用方案子项 范围 1.指定  2.排除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_APPLY_ITEM_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_APPLY_ITEM_APPLY_ID` (`pro_apply_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=445172642 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_audit   */
/******************************************/
CREATE TABLE `proengine_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_voucher` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务标识Key（任务系统关联）',
  `audit_type` tinyint(4) NOT NULL COMMENT '审批类型',
  `change_detail` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更详情(json)',
  `audit_status` tinyint(4) NOT NULL COMMENT '审批状态',
  `sponsor_id` bigint(20) NOT NULL COMMENT '发起人id',
  `sponsor_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发起人名称',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `proengine_audit_business_voucher_uindex` (`business_voucher`),
  KEY `proengine_audit_vender_id_index` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='促销审批';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_audit_item   */
/******************************************/
CREATE TABLE `proengine_audit_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `audit_id` bigint(20) DEFAULT NULL COMMENT '审批id',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '促销id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `proengine_audit_item_pro_id_index` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16860482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='促销审批明细';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_base_info   */
/******************************************/
CREATE TABLE `proengine_base_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `pro_batch_num` varchar(50) DEFAULT NULL COMMENT '促销批次号',
  `pro_schedule` varchar(50) DEFAULT NULL COMMENT '促销档期',
  `pro_code` varchar(100) DEFAULT NULL COMMENT '促销编号,仅创建来源为线下促销或线上沃尔玛商家才有',
  `pro_vender_type` varchar(100) DEFAULT NULL COMMENT '商家促销类型',
  `pro_create_source` int(10) NOT NULL COMMENT '促销创建来源. 1：ERP创建, 2：ERP线下同步，101：来客平台，102：来客线下，201:档期系统，202:出清系统',
  `pro_create_vender` varchar(5000) DEFAULT NULL COMMENT '创建的商家ID,多个商家逗号隔开',
  `pro_channel` tinyint(4) DEFAULT NULL COMMENT '促销渠道.1:所有渠道，2：线上，3：线下',
  `pro_name` varchar(50) NOT NULL COMMENT '促销名称',
  `pro_type` tinyint(4) NOT NULL COMMENT '促销类型， 1：单品，2：单品买赠，3：条件，4：整单',
  `pro_sub_type` smallint(6) NOT NULL COMMENT '促销子类型',
  `pro_main_body` tinyint(4) NOT NULL COMMENT '促销主体，1：多点，2：商家',
  `pro_status` int(10) NOT NULL COMMENT '促销状态',
  `pro_cache_status` tinyint(4) NOT NULL COMMENT '促销缓存状态',
  `pro_detail` varchar(500) DEFAULT NULL COMMENT '促销详情,保存时根据规则生成',
  `pro_remark` varchar(50) DEFAULT NULL COMMENT '促销备注',
  `pro_creater_id` bigint(20) NOT NULL COMMENT '促销创建人id',
  `pro_creater_name` varchar(30) NOT NULL COMMENT '促销创建人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `source_id` varchar(100) DEFAULT NULL COMMENT '原始促销id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_PRO_SUB_TYPE` (`pro_sub_type`,`yn`) USING BTREE,
  KEY `IDX_PRO_STATUS` (`pro_status`,`yn`) USING BTREE,
  KEY `IDX_PRO_CODE_BATCH_NUM` (`pro_batch_num`,`pro_code`) USING BTREE,
  KEY `IDX_PRO_CACHE_STATUS_STATUS` (`pro_cache_status`,`pro_status`) USING BTREE,
  KEY `IDX_PRO_SCHEDULE` (`pro_schedule`,`yn`) USING BTREE,
  KEY `IDX_PRO_CREATE_DATE` (`create_time`,`yn`) USING BTREE,
  KEY `IDX_PRO_CREATER_NAME` (`pro_creater_name`,`yn`) USING BTREE,
  KEY `idx_pro_code` (`pro_code`),
  KEY `IDX_PRO_SOURCE_ID` (`source_id`,`yn`) USING BTREE,
  KEY `IDX_PRO_CREATER_SOURCE` (`pro_create_source`,`yn`),
  KEY `IDX_PRO_ID_CREATE_SOURCE` (`pro_id`,`pro_create_source`,`yn`),
  KEY `IDX_PRO_STATUS_CREATER_SOURCE_CREATE_TIME` (`pro_status`,`pro_create_source`,`create_time`,`yn`),
  KEY `IDX_CREATER_SOURCE_CREATE_TIME` (`pro_create_source`,`create_time`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=492048562 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销基础信息表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_batch_opt_log   */
/******************************************/
CREATE TABLE `proengine_batch_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_batch_num` varchar(50) NOT NULL COMMENT '批次号',
  `opt_type` tinyint(4) NOT NULL COMMENT '操作类型，0:创建，1：修改',
  `opt_user_id` bigint(20) NOT NULL COMMENT '操作用户id',
  `opt_user_name` varchar(50) NOT NULL COMMENT '操作用户名称',
  `opt_time` datetime NOT NULL COMMENT '操作时间',
  `opt_remark` varchar(50) NOT NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_OPT_PRO_BATCH_NUM` (`pro_batch_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29472442 DEFAULT CHARSET=utf8 COMMENT='批次限购日志操作表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_calc_scheme   */
/******************************************/
CREATE TABLE `proengine_calc_scheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID，为空表示默认值，指定商家ID单独处理',
  `calc_scope` tinyint(4) NOT NULL COMMENT '1：促销来源 2：促销类型',
  `scope_value` int(11) DEFAULT NULL COMMENT '具体的促销来源或促销类型',
  `sequence` varchar(255) DEFAULT NULL COMMENT '计算的顺序值',
  `stop_here` int(4) DEFAULT NULL COMMENT '命中该维度是否就停止往下计算 1：是， -1和空：否',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_APPLY_TYPE` (`calc_scope`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销计算全局规则';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_config   */
/******************************************/
CREATE TABLE `proengine_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `config_type` tinyint(3) DEFAULT '0' COMMENT '配置类型',
  `create_time` datetime DEFAULT NULL,
  `yn` tinyint(2) DEFAULT '1' COMMENT '是否删除：1正常-1删除',
  `creater_id` bigint(20) DEFAULT NULL,
  `creater_name` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1562 DEFAULT CHARSET=utf8mb4 COMMENT='配置主表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_config_item   */
/******************************************/
CREATE TABLE `proengine_config_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT '' COMMENT '字段定义名称',
  `code` varchar(20) DEFAULT '' COMMENT '字段编码',
  `name` varchar(20) DEFAULT '' COMMENT '字段展示名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父级id',
  `default_value` tinyint(2) DEFAULT '0' COMMENT '字段开关值：1开启,0关闭',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述，注释',
  `yn` tinyint(2) DEFAULT '1' COMMENT '是否删除：-1删除，1正常',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `is_multi` tinyint(2) DEFAULT '1' COMMENT '值是单个还是多个：1单个，2多个',
  `target_key` varchar(50) DEFAULT NULL COMMENT '属性key的定义',
  `is_check` tinyint(2) DEFAULT '0' COMMENT '是否被选中:0未被选中1被选中',
  `field_key` varchar(50) DEFAULT '' COMMENT '子级字段的选项统一名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1522 DEFAULT CHARSET=utf8mb4 COMMENT='配置主字段表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_config_item_option   */
/******************************************/
CREATE TABLE `proengine_config_item_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT '' COMMENT '字段定义名称，不同key对应不同的选项列表',
  `code` varchar(20) DEFAULT '' COMMENT '字段编码',
  `name` varchar(20) DEFAULT '' COMMENT '字段展示名称',
  `value` int(5) DEFAULT '0' COMMENT '选项的值',
  `is_check` tinyint(2) DEFAULT NULL COMMENT '是否默认选中:1是，0不是',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级id',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `yn` tinyint(2) DEFAULT '1' COMMENT '是否删除：1正常,-1删除',
  `target_key` varchar(50) DEFAULT NULL COMMENT '属性key的定义',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3282 DEFAULT CHARSET=utf8mb4 COMMENT='配置选项字段表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_config_value   */
/******************************************/
CREATE TABLE `proengine_config_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '配置id,和relation表的主键id对应',
  `config_key` varchar(50) NOT NULL COMMENT '配置字段',
  `config_value` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `yn` tinyint(2) DEFAULT '1' COMMENT '是否有效:1有效-1无效',
  PRIMARY KEY (`id`),
  KEY `IDX_VALUE_CONFIG_ID_AND_KEY` (`config_id`,`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1127802 DEFAULT CHARSET=utf8mb4 COMMENT='配置具体规则表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_config_vender   */
/******************************************/
CREATE TABLE `proengine_config_vender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_vender_value` bigint(20) DEFAULT NULL COMMENT '配置形式的值，如果是商家则是商家id,如果是商家类型，则是商家类型的值',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `yn` tinyint(2) DEFAULT NULL COMMENT '是否删除：1正常，-1删除',
  `config_id` bigint(20) DEFAULT NULL COMMENT '配置id，relation表的id',
  PRIMARY KEY (`id`),
  KEY `IDX_VENDER_CONFIG_ID` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22322 DEFAULT CHARSET=utf8mb4 COMMENT='商家或商家类型配置关联表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_dept_cost_bear   */
/******************************************/
CREATE TABLE `proengine_dept_cost_bear` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '费用承担ID-自增主键',
  `pro_id` bigint(20) NOT NULL COMMENT '促销ID',
  `apportion_type_id` bigint(20) NOT NULL COMMENT '营销类别id',
  `apportion_type_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营销类别编码',
  `apportion_type_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '营销类别名称',
  `payer_id` bigint(20) NOT NULL COMMENT '费用承担部门id',
  `payer_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '费用承担部门编码',
  `payer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '费用承担部门名称',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '记录适用商家id',
  `percentage` decimal(10,2) NOT NULL COMMENT '承担比例百分比',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效:1有效0无效',
  PRIMARY KEY (`id`),
  KEY `proengine_dept_cost_bear_pro_id_index` (`pro_id`),
  KEY `proengine_dept_cost_bear_vender_id_index` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=502242 DEFAULT CHARSET=utf8mb4 COMMENT='促销部门费用承担';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_enjoy_condition   */
/******************************************/
CREATE TABLE `proengine_enjoy_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `action_group` int(11) NOT NULL DEFAULT '1' COMMENT '作用于哪一组join_item的商品，即对应item_group，100表示所有',
  `enjoy_trigger_scope` tinyint(4) NOT NULL COMMENT '触发维度，1：相同商品，2:任意商品，5：不同商品',
  `enjoy_price` tinyint(4) DEFAULT NULL COMMENT '计算的原金额，1.原价，2.单品促销价等,默认为空表示单品促销价',
  `enjoy_reward_mode` tinyint(4) NOT NULL COMMENT '优惠维度，1：触发商品，2：所有商品',
  `enjoy_reward_scope` tinyint(4) DEFAULT NULL COMMENT '优惠触发方式：1相同商品，2任意商品，5不同商品',
  `condition_priority` tinyint(4) DEFAULT NULL COMMENT '触发条件判断顺序，为空表示没顺序',
  `condition_mode` tinyint(4) DEFAULT NULL COMMENT '触发条件关系，且，或，非等',
  `condition_id` bigint(20) DEFAULT NULL COMMENT '条件ID，与另一个触发条件的关系的',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_TSCHEME_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_ACTION_GROUP` (`action_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=492396122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销触发的条件规则，可以多个\r\n';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_enjoy_item   */
/******************************************/
CREATE TABLE `proengine_enjoy_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `enjoy_item_group` int(11) DEFAULT '1' COMMENT '对应enjoy_value表的item_group字段',
  `item_type` tinyint(4) NOT NULL COMMENT '参与元素类型，1:指定SKU、2、三级分类，3:品牌、4:mc/商家品类、5、供应商，7：商品后台分类，10：全部商品，11：订单维度  12：物料编码',
  `item_code` varchar(50) NOT NULL COMMENT '参与元素编码',
  `item_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `max_item_num` int(11) DEFAULT NULL COMMENT '最多可换购商品数量',
  `item_price` int(11) DEFAULT NULL COMMENT '换购金额，特价金额，直降金额，折扣值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_JOIN_ITEM_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_JOIN_ITEM_CODE` (`item_code`) USING BTREE,
  KEY `IDX_JOIN_ITEM_CODETYPE` (`item_type`,`item_code`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10776300922 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销优惠商品具体的信息';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_enjoy_value   */
/******************************************/
CREATE TABLE `proengine_enjoy_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `pro_condition_id` bigint(20) NOT NULL COMMENT '促销触发条件方案ID',
  `step_value` tinyint(4) NOT NULL DEFAULT '1' COMMENT '触发优惠值顺序，即阶梯顺序',
  `trigger_value` int(11) NOT NULL COMMENT '标品触发值，金额，件数等,标品阶梯本字段存储',
  `reward_type` tinyint(4) NOT NULL COMMENT '优惠方式：金额，折扣，商品',
  `reward_value` int(11) NOT NULL COMMENT '优惠值，金额，折扣值，商品件数',
  `enjoy_item_group` int(11) DEFAULT '1' COMMENT '优惠方式为商品时，为优惠商品表的ID',
  `reward_max_value` int(11) DEFAULT NULL COMMENT '最大优惠金额，数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `reward_num` int(11) DEFAULT NULL COMMENT '优惠件数（满件指定件时有值）',
  `trigger_bulk_value` varchar(10) DEFAULT NULL COMMENT '散卖品触发值,  公斤等,散卖阶梯本字段存储',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_TRIGGER_VALUE_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_CONDITION_ID` (`pro_condition_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=492718362 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销触发条件对应的具体值';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_exec_date   */
/******************************************/
CREATE TABLE `proengine_exec_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK，自增',
  `pro_id` bigint(20) NOT NULL COMMENT '促销ID',
  `date_type` tinyint(4) NOT NULL COMMENT '执行时间类型，1:指定日期，2:按天，3:按星期，4:按月',
  `start_date_scope` datetime NOT NULL COMMENT '开始时间',
  `end_date_scope` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_EXEC_DATE_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_START_DATE` (`start_date_scope`,`yn`) USING BTREE,
  KEY `IDX_PRO_ID_START_DATE` (`pro_id`,`start_date_scope`,`yn`) USING BTREE,
  KEY `INX_PRO_ID_END_DATE` (`pro_id`,`end_date_scope`,`yn`) USING BTREE,
  KEY `IDX_END_DATE` (`end_date_scope`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=492563842 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='促销时间表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_exec_date_action   */
/******************************************/
CREATE TABLE `proengine_exec_date_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK，自增',
  `pro_id` bigint(20) NOT NULL COMMENT '促销ID',
  `action_type` tinyint(4) NOT NULL COMMENT '促销时间作用方式，1：提前开始，2：提前结束',
  `action_scope` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：样板店 2：指定门店',
  `action_store_id` varchar(5000) DEFAULT NULL COMMENT '指定门店时不能为空，作用的门店ID，逗号分隔',
  `action_value` int(11) DEFAULT NULL COMMENT '作用时间，以小时为单位',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_EXEC_DATE_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4057482 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='促销时间作用特殊规则表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_exec_time   */
/******************************************/
CREATE TABLE `proengine_exec_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `date_value` varchar(50) DEFAULT NULL COMMENT '具体哪一天，按每天则为空',
  `start_time_scope` time NOT NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `end_time_scope` time NOT NULL DEFAULT '23:59:59' COMMENT '结束时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '数据有效性',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_EXEC_TIME_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=886322 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销时段表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_expense_rule   */
/******************************************/
CREATE TABLE `proengine_expense_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `dept_id1` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '一级部门id',
  `dept_name1` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '一级部门名称',
  `dept_id2` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '二级部门id',
  `dept_name2` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '二级部门名称',
  `dept_id3` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '三级部门id',
  `dept_name3` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '三级部门名称',
  `dept_id4` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '四级部门id',
  `dept_name4` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '四级部门名称',
  `payer_id` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '费用归属id',
  `payer_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '费用归属名称',
  `payer_type` tinyint(4) NOT NULL COMMENT '1:多点部门;2:商家;3:供应商',
  `payer_percent` int(10) DEFAULT NULL COMMENT '所占比例%',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_PROID` (`pro_id`) USING BTREE,
  KEY `IDX_PAYER_ID` (`payer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=492439202 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='费用分摊表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_exstatus_info   */
/******************************************/
CREATE TABLE `proengine_exstatus_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `status_type` tinyint(4) NOT NULL COMMENT '1：推送价签系统状态，2：销补状态，3：商品池生成状态',
  `status_value` int(11) NOT NULL COMMENT '状态值',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `status_remark` varchar(100) DEFAULT NULL COMMENT '状态备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_TYPE_VALUE` (`status_type`,`status_value`) USING BTREE,
  KEY `IDX_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=942163002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销其它附加状态信息';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_join_executor   */
/******************************************/
CREATE TABLE `proengine_join_executor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `join_type` tinyint(4) NOT NULL COMMENT '商家参与方式,1:全部商家，2：指定商家',
  `join_behavior` tinyint(4) NOT NULL COMMENT '商家行为：1：参与，2：不参与',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id，全部商家时可能为空',
  `store_join_type` tinyint(4) NOT NULL COMMENT '门店参与方式,1:全部门店，2：指定门店',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_VENDER_IDS` (`vender_id`) USING BTREE,
  KEY `IDX_CREATE_DATE` (`create_time`) USING BTREE,
  KEY `IDX_VENDER_IDS_JOIN_BEHAVIOR` (`vender_id`,`join_behavior`,`store_join_type`) USING BTREE,
  KEY `IDX_PRO_ID_VENDER_JOIN_TYPE` (`pro_id`,`vender_id`,`store_join_type`) USING BTREE,
  KEY `IDX_VENDER_CREATE_TIME` (`vender_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=504371682 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销执行商家';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_join_item   */
/******************************************/
CREATE TABLE `proengine_join_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `item_type` tinyint(4) NOT NULL COMMENT '参与元素类型，1:指定SKU、2、三级分类，3:品牌、4:mc/商家品类、5、供应商，7：商品后台分类，10：全部商品，11：订单维度，12：物料编码',
  `item_group` int(11) NOT NULL DEFAULT '1' COMMENT '参与的商品组号',
  `item_code` varchar(50) DEFAULT NULL COMMENT '参与元素编码',
  `item_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品，分类，品牌等的状态，1：有效，2：无效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_JOIN_ITEM_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_JOIN_ITEM_CODE` (`item_code`) USING BTREE,
  KEY `IDX_JOIN_ITEM_CODETYPE` (`item_type`,`item_code`,`yn`) USING BTREE,
  KEY `IDX_CREATE_DATE_ITEM_CODE` (`create_time`,`item_code`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11776984602 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销参与元素\r\n一个促销对应N个joIn_item';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_join_item_attach   */
/******************************************/
CREATE TABLE `proengine_join_item_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `attach_style` tinyint(4) NOT NULL COMMENT '排除，指定',
  `item_type` tinyint(4) NOT NULL COMMENT '商品，分类，品牌，黑名单',
  `attach_values` mediumtext COMMENT '指定或排除的具体值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '数据有效性',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_EXCLUDE_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=609042 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销排除元素参与';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_join_scheme   */
/******************************************/
CREATE TABLE `proengine_join_scheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `join_type` tinyint(4) NOT NULL COMMENT '参与方式：1:商品编码录入，2:品类&品牌，3:全部商品',
  `join_scheme` tinyint(4) DEFAULT NULL COMMENT '品类和品牌配置方式，1:交集，2:并集',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '数据是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `PRO_ID_INDEX` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=491909082 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_join_store   */
/******************************************/
CREATE TABLE `proengine_join_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `join_behavior` tinyint(4) NOT NULL COMMENT '门店行为：1：参与，2：不参与',
  `join_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '门店的状态：1.有效，2：无效',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `join_value` bigint(20) DEFAULT NULL COMMENT '门店ID或门店组ID，全部门店时可能为空',
  `group_id` bigint(20) DEFAULT NULL COMMENT '门店组ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_JOIN_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_JOIN_VENDER_ID` (`vender_id`) USING BTREE,
  KEY `IDX_PRO_ID_VENDER_JOIN_VALUE` (`pro_id`,`vender_id`,`join_value`) USING BTREE,
  KEY `IDX_GROUP_ID` (`group_id`,`pro_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=40457414482 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销执行门店';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_limit_scheme   */
/******************************************/
CREATE TABLE `proengine_limit_scheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `pro_batch_num` varchar(50) DEFAULT NULL COMMENT '批次编号',
  `limit_scope` tinyint(4) NOT NULL COMMENT '限制维度，1：所有门店一致，2：所有门店共享，3：按具体门店设置，4：所有用户一致,5:所有用户共享',
  `limit_mode` tinyint(4) NOT NULL COMMENT '限制方式，1:促销期间,2:每天,3:每单',
  `limit_area` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:所有商品,2:每个商品',
  `limit_remark` varchar(50) DEFAULT NULL COMMENT '限制备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_SCHEME_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_SCHEME_BATCH_NUM` (`pro_batch_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143811122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销限购方式配置，1个促销可以有n个(n>=0)个限购方式';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_limit_value   */
/******************************************/
CREATE TABLE `proengine_limit_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '促销id，为批次限购时无值',
  `pro_limit_scheme_id` bigint(20) NOT NULL COMMENT '限制方案id',
  `limit_on_item_code` varchar(50) DEFAULT NULL COMMENT '当限制类型是指定门店时,存放门店id',
  `limit_value` int(11) NOT NULL COMMENT '限制值',
  `limit_unit` int(11) NOT NULL COMMENT '限购的单位，1：次数个数，2：克',
  `enjoy_item_group` int(11) DEFAULT NULL COMMENT '对应enjoy_value表的item_group字段',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_LIMIT_VALUE_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_LIMIT_SCHEME_ID` (`pro_limit_scheme_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143938282 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销限购值，1个限购方案可以有n个(n>=1)限购值';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_mix_rule   */
/******************************************/
CREATE TABLE `proengine_mix_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `set_scope` tinyint(4) NOT NULL COMMENT '设置维度,11：按排除设置的促销类型、子类型、id,12：按设置的促销类型排除自己',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `pro_sub_type` smallint(6) NOT NULL COMMENT '促销子类型',
  `reject_pro_type` tinyint(4) DEFAULT NULL COMMENT '不可叠加父类型',
  `reject_pro_sub_type` smallint(6) DEFAULT NULL COMMENT '不可叠加子类型',
  `reject_pro_id` bigint(20) DEFAULT NULL COMMENT '不可叠加促销id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_MIX_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_REJECT_TYPE` (`reject_pro_type`) USING BTREE,
  KEY `IDX_REJECT_SUB_TYPE` (`reject_pro_sub_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103036682 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销叠加规则，1个促销可以设置多个维度的叠加规则';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_notify_group   */
/******************************************/
CREATE TABLE `proengine_notify_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `group_type` tinyint(4) NOT NULL COMMENT '消息通知组类型,2:华北物美,3:华东物美',
  `dep_id` varchar(40) NOT NULL COMMENT '费用承担部门ID',
  `dep_name` varchar(50) NOT NULL COMMENT '费用承担部门名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='促销消息通知分组设置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_notify_group_user   */
/******************************************/
CREATE TABLE `proengine_notify_group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `group_id` bigint(20) NOT NULL COMMENT '通知分组ID',
  `notifier` varchar(32) NOT NULL COMMENT '通知人',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱号',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `modify_time` datetime NOT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='促销消息通知组用户';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_opt_log   */
/******************************************/
CREATE TABLE `proengine_opt_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `opt_type` tinyint(4) NOT NULL COMMENT '操作类型，0:新建，1：审核通过，2：审核拒绝，3：作废，4：强制结束',
  `opt_user_id` bigint(20) NOT NULL COMMENT '操作用户id',
  `opt_user_name` varchar(50) NOT NULL COMMENT '操作用户名称',
  `opt_time` datetime NOT NULL COMMENT '操作时间',
  `opt_remark` text NOT NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `opt_desc` varchar(200) NOT NULL COMMENT '操作描述，使用opt_type对应的desc',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_OPT_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_OPT_TYPE` (`opt_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2028730562 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销日志操作表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_outer_info   */
/******************************************/
CREATE TABLE `proengine_outer_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `pro_outer_type` tinyint(4) NOT NULL COMMENT '促销外围业务类型',
  `pro_outer_sub_type` int(11) NOT NULL DEFAULT '0' COMMENT '促销外围业务子类型',
  `pro_outer_code` varchar(50) DEFAULT NULL COMMENT '促销外围业务code',
  `pro_outer_info` text COMMENT '外围业务信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_OUTER_TYPE` (`pro_id`,`pro_outer_type`,`pro_outer_sub_type`),
  KEY `IDX_OUTER_CODE` (`pro_id`,`pro_outer_code`),
  KEY `IDX_OUTER_CODE_2` (`pro_outer_code`,`pro_outer_type`,`pro_outer_sub_type`)
) ENGINE=InnoDB AUTO_INCREMENT=177810442 DEFAULT CHARSET=utf8 COMMENT='促销外围业务数据';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_priority_config   */
/******************************************/
CREATE TABLE `proengine_priority_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `vender_name` varchar(64) NOT NULL COMMENT '商家名称',
  `priority_name` varchar(64) NOT NULL COMMENT '优先级名称',
  `priority_value` int(11) NOT NULL COMMENT '优先级值',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人id',
  `creater_name` varchar(32) NOT NULL COMMENT '创建人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间（暂不允许修改，值和创建时间一致）',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `create_source` tinyint(2) DEFAULT '2' COMMENT '创建来源：1erp2来客',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_PRIORITY_VENDER_ID` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3882 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_priority_value   */
/******************************************/
CREATE TABLE `proengine_priority_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `priority_type` tinyint(4) NOT NULL COMMENT '1：促销等级',
  `type_value` int(11) DEFAULT NULL COMMENT '具体的促销等级值',
  `weight` int(11) NOT NULL DEFAULT '1' COMMENT '优先级的权重',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_APPLY_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_APPLY_TYPE` (`priority_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=491908442 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销方案适用配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_risk_control   */
/******************************************/
CREATE TABLE `proengine_risk_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `risk_type` tinyint(4) NOT NULL COMMENT '风险控制类型，1:控制最大优惠金额，2：控制优惠金额和原始金额比，3：控制优惠价不能大于原始价格',
  `risk_value` varchar(50) DEFAULT NULL COMMENT '风险控制值',
  `risk_deal_scheme` tinyint(4) NOT NULL COMMENT '风险处理方案，1=按最大优惠,2：不优惠',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_RISK_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=443442042 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销风险控制，针对优惠方案上的控制\r\n1个促销最多1个风险控制';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_rule_condition   */
/******************************************/
CREATE TABLE `proengine_rule_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_value_id` bigint(20) NOT NULL COMMENT 'rule_value的id',
  `condition_type` tinyint(4) NOT NULL COMMENT '规则条件类型  1-促销类型 2-促销子类型  3-门店',
  `condition_value` varchar(255) NOT NULL COMMENT '规则条件的值，多个用逗号分隔',
  `extend` varchar(255) DEFAULT NULL COMMENT '扩展字段，暂时不用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_RULE_VALUE_ID` (`rule_value_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5562 DEFAULT CHARSET=utf8mb4 COMMENT='促销规则条件表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_rule_info   */
/******************************************/
CREATE TABLE `proengine_rule_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_name` varchar(64) NOT NULL COMMENT '规则名称',
  `rule_code` varchar(64) NOT NULL COMMENT '规则的唯一标识码',
  `default_value` tinyint(4) NOT NULL COMMENT '默认值',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人',
  `creater_name` varchar(32) NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_INFO_RULE_CODE` (`rule_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='促销规则元信息表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_rule_item   */
/******************************************/
CREATE TABLE `proengine_rule_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人',
  `creater_name` varchar(32) NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5482 DEFAULT CHARSET=utf8mb4 COMMENT='促销规则配置表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_rule_value   */
/******************************************/
CREATE TABLE `proengine_rule_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_item_id` bigint(20) NOT NULL COMMENT '关联rule_item的id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `vender_name` varchar(64) NOT NULL COMMENT '商家名称',
  `rule_code` varchar(64) NOT NULL COMMENT '规则唯一标识',
  `rule_value` tinyint(4) NOT NULL COMMENT '规则的值',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人id',
  `creater_name` varchar(64) NOT NULL COMMENT '创建人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `IDX_RULE_ITEM_ID` (`rule_item_id`) USING BTREE,
  KEY `IDX_VENDER_RULE_CODE` (`vender_id`,`rule_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26242 DEFAULT CHARSET=utf8mb4 COMMENT='促销规则商家配置表';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_settle_rule   */
/******************************************/
CREATE TABLE `proengine_settle_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `settle_type` tinyint(4) NOT NULL COMMENT '适用类型，1:加权分摊（默认）2：指定比例 3：指定金额',
  `item_group` int(11) DEFAULT '1' COMMENT '所在商品组',
  `settle_rule` text COMMENT '指定的比例(百分比)或者指定的金额(分)',
  `reward_settle` tinyint(4) NOT NULL COMMENT '主品是否分摊；1：分摊，2：不分摊 默认参与分摊',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `gift_settle` tinyint(4) NOT NULL COMMENT '赠品/换购品是否参与分摊  1.参与分摊  2.不分摊 默认参与分摊',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_APPLY_PRO_ID` (`pro_id`) USING BTREE,
  KEY `IDX_APPLY_TYPE` (`settle_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3495602 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销分摊规则配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_show_info   */
/******************************************/
CREATE TABLE `proengine_show_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `show_channel` tinyint(4) NOT NULL COMMENT '全渠道，线上渠道，线下渠道，默认全渠道',
  `show_tag` varchar(50) NOT NULL COMMENT '展示标签',
  `show_slogan` varchar(200) NOT NULL COMMENT '展示标语',
  `show_limit_desc` varchar(128) DEFAULT NULL COMMENT '展示限购描述',
  `ac_name` varchar(100) DEFAULT NULL COMMENT '促销关联活动链接名称',
  `ac_id` varchar(100) DEFAULT NULL COMMENT '促销关联活动id',
  `ac_url` varchar(256) DEFAULT NULL COMMENT '促销关联活动链接',
  `script` text,
  `remark` varchar(100) DEFAULT NULL COMMENT '备注信息',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL,
  `pro_must_show` tinyint(4) DEFAULT '1' COMMENT '未命中促销强制显示，1:否，2:是',
  `tag_type` tinyint(4) DEFAULT '1' COMMENT '标签类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDS_PRO_ID` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=491913682 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销展示信息配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_sign_info   */
/******************************************/
CREATE TABLE `proengine_sign_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) NOT NULL COMMENT '促销id',
  `sign_type` tinyint(4) NOT NULL COMMENT '1：是否记入负金额商品，2：是否是爆品直降，3：促销参与商品是否自动生成黑名单，4：价签是否展示促销，5：促销聚合业态，6：促销商品规格，7：不可叠加的优惠券类型',
  `sign_value` int(11) NOT NULL COMMENT '标记具体的值',
  `sign_remark` varchar(100) DEFAULT NULL COMMENT '标记备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_PRO_ID_TYPE` (`pro_id`,`sign_type`,`sign_value`) USING BTREE,
  KEY `IDX_TYPE` (`sign_type`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=1362527082 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销各种标记信息';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_store_template   */
/******************************************/
CREATE TABLE `proengine_store_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `vender_name` varchar(64) NOT NULL COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(64) NOT NULL COMMENT '门店名称',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人id',
  `creater_name` varchar(64) NOT NULL COMMENT '创建人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_VENDER_ID` (`vender_id`,`yn`) USING BTREE,
  KEY `IDX_STORE_ID` (`store_id`,`yn`) USING BTREE,
  KEY `IDX_VENDER_STORE` (`vender_id`,`store_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='样板店';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_threshold_config   */
/******************************************/
CREATE TABLE `proengine_threshold_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pro_type` tinyint(4) NOT NULL COMMENT '促销父类型',
  `pro_sub_type` smallint(6) NOT NULL COMMENT '促销子类型',
  `threshold_value` int(11) NOT NULL COMMENT '阀值,以1000作为分母',
  `deal_scheme` tinyint(4) NOT NULL COMMENT '超过阀值处理方案，1=不可创建,2：进入运营审核',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_PRO_TYPE` (`pro_type`) USING BTREE,
  KEY `IDX_PRO_SUB_TYPE` (`pro_sub_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='促销阀值控制配置';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_tmp381   */
/******************************************/
CREATE TABLE `proengine_tmp381` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '促销id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `item_code` varchar(128) DEFAULT NULL COMMENT '商品码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_proId_venderId_storeId_itemCode` (`pro_id`,`vender_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_proId_storeId_itemCode` (`pro_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_venderId_storeId_itemCode` (`vender_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_storeId_itemCode` (`store_id`,`item_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=979777962 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='临时表_促销381';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_tmp382   */
/******************************************/
CREATE TABLE `proengine_tmp382` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '促销id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `item_code` varchar(128) DEFAULT NULL COMMENT '商品码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_proId_venderId_storeId_itemCode` (`pro_id`,`vender_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_proId_storeId_itemCode` (`pro_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_venderId_storeId_itemCode` (`vender_id`,`store_id`,`item_code`) USING BTREE,
  KEY `IDX_storeId_itemCode` (`store_id`,`item_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69985842 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='临时表_出清382';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_tmp383   */
/******************************************/
CREATE TABLE `proengine_tmp383` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id,无业务意义',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `item_code` varchar(128) DEFAULT NULL COMMENT '商品码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_storeId_itemCode` (`store_id`,`item_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195940642 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='临时表_促销381_去重店品';


/******************************************/
/*   DatabaseName = dmall_promotion_engine   */
/*   TableName = proengine_upload_file   */
/******************************************/
CREATE TABLE `proengine_upload_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `upload_type` tinyint(4) NOT NULL COMMENT '上传类型,10-导入更新 20-导入创建',
  `vender_id` bigint(4) NOT NULL COMMENT '商家id',
  `exec_start_time` datetime NOT NULL COMMENT '预期执行开始时间',
  `exec_complete_time` datetime DEFAULT NULL COMMENT '实际执行结束时间',
  `file_key` varchar(64) NOT NULL COMMENT '文件的fileKey',
  `file_name` varchar(128) NOT NULL COMMENT '文件名称',
  `file_size` bigint(20) NOT NULL COMMENT '文件大小,单位:字节',
  `file_hash` varchar(64) DEFAULT NULL COMMENT '文件内容的MD5码',
  `total_row_num` int(11) DEFAULT NULL COMMENT '文件总行数',
  `success_row_num` int(11) DEFAULT NULL COMMENT '执行成功的行数',
  `exec_status` tinyint(4) NOT NULL COMMENT '执行状态,0-待执行 10-正在执行 20-执行完成 30-执行取消 100-执行异常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `uploader_id` bigint(20) NOT NULL COMMENT '导入人id',
  `uploader_name` varchar(64) NOT NULL COMMENT '导入人名称',
  `extend` varchar(512) DEFAULT NULL COMMENT '扩展字段',
  `operate_log` json NOT NULL COMMENT '操作日志',
  `extra_json` json DEFAULT NULL COMMENT '业务附加JSON',
  PRIMARY KEY (`id`),
  KEY `IDX_VENDER_ID_CREATE_TIME` (`vender_id`,`create_time`) USING BTREE,
  KEY `IDX_EXEC_STATUS_START_TIME` (`exec_status`,`exec_start_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66962 DEFAULT CHARSET=utf8mb4 COMMENT='促销上传文件表';


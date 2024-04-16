-- Export Tools
-- Time: 2024-04-16 16:58:13
-- Service: s3306s-coupon.tc.db.inner-dmall.com:3306   Database: dmall_coupon
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = apportion_coup_config   */
/******************************************/
CREATE TABLE `apportion_coup_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `coup_batch_id` bigint(20) DEFAULT NULL COMMENT '优惠券批次id',
  `apportion_type_id` bigint(20) DEFAULT NULL COMMENT '券费用承担类型id',
  `payer_id` bigint(20) DEFAULT NULL COMMENT '承担方id',
  `payer_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方name\n',
  `ratio` decimal(10,2) DEFAULT NULL COMMENT '承担比例',
  `max` decimal(10,2) DEFAULT NULL COMMENT '最大承担费用',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1',
  `payer_type` int(4) DEFAULT '2' COMMENT '承担方类型：2商家 7供应商 8三方公司',
  `payer_id_str` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方ID/供应商编号/三方公司ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2745481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券费用承担配置';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = apportion_payer   */
/******************************************/
CREATE TABLE `apportion_payer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方类型（如内部；外部）',
  `payer_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方名字',
  `payer_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方编号',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '记录适用商家id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '记录适用集团id',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1',
  `payer_status` int(4) DEFAULT '1' COMMENT '承担方状态：1正常 -1停用',
  `payer_type` int(4) DEFAULT '2' COMMENT '承担方类型：2商家 7供应商 8三方公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='费用承担方';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = apportion_payer_log   */
/******************************************/
CREATE TABLE `apportion_payer_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `apportion_payer_id` bigint(20) NOT NULL COMMENT '费用承担方ID',
  `operate_content` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作内容',
  `operator` varchar(128) DEFAULT NULL COMMENT '操作人',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8mb4 COMMENT='费用承担方日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = apportion_type_config   */
/******************************************/
CREATE TABLE `apportion_type_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '券类别名',
  `code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '券类别编号',
  `group_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '券类别分组',
  `group_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '券类别分组编号',
  `payer_id_array` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方id，逗号分隔',
  `payer_name_array` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方name，逗号分隔',
  `fixed_payer` tinyint(4) DEFAULT NULL COMMENT '是否固定承担方',
  `into_performance` tinyint(4) DEFAULT NULL COMMENT '是否纳入业绩',
  `status` tinyint(4) DEFAULT NULL COMMENT '数据状态',
  `show_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '记录适用商家id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '记录适用集团id',
  `company_payer_id` bigint(20) DEFAULT NULL COMMENT '第三方公司承担ID',
  `company_payer_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '第三方公司名称',
  `supplier_payer_id` bigint(20) DEFAULT NULL COMMENT '供应商承担ID',
  `supplier_payer_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='费用分摊类型配置';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = apportion_type_config_log   */
/******************************************/
CREATE TABLE `apportion_type_config_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type_id` bigint(20) NOT NULL COMMENT '分摊类型配置ID',
  `group_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '券类型分组名',
  `payer_id_array` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方id',
  `payer_name_array` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '承担方名',
  `fixed_payer` tinyint(4) DEFAULT NULL COMMENT '是否固定承担方',
  `into_performance` tinyint(4) DEFAULT NULL COMMENT '是否纳入业绩',
  `show_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `operator_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人name',
  `status` tinyint(4) DEFAULT NULL COMMENT '券类型配置数据状态',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12561 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='费用承担类型配置修改日志';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = audit_apply_detail   */
/******************************************/
CREATE TABLE `audit_apply_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '审核批次详情编号',
  `business_voucher` varchar(30) NOT NULL COMMENT '业务凭证',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `edit_attr_list` varchar(100) DEFAULT NULL COMMENT '变更字段集合',
  `edit_content` longtext COMMENT '修改内容对象',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creator_name` varchar(30) DEFAULT NULL COMMENT '创建人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据有效性：-1-无效，1-有效',
  `concurrent_version` bigint(20) NOT NULL DEFAULT '1' COMMENT '当前数据版本号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_apply_id` (`apply_id`) USING BTREE,
  KEY `idx_business_voucher` (`business_voucher`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37203 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审核批次详情表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = audit_apply_limit_goods   */
/******************************************/
CREATE TABLE `audit_apply_limit_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `business_voucher` varchar(30) NOT NULL COMMENT '业务凭证',
  `limit_goods_type` tinyint(4) NOT NULL COMMENT '商品限制[1:部分品类可用 -1:部分品类不可用 2-限商品 sku 3-限商品物料编码 5-限白名单 6-限品牌 99-限品类列外商品]',
  `limit_goods_id` varchar(100) DEFAULT NULL COMMENT '具体的限制商品ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据有效性：-1-无效，1-有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_apply_id` (`apply_id`) USING BTREE,
  KEY `idx_business_voucher` (`business_voucher`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='修改批次限制商品记录表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = audit_jurisdiction_log   */
/******************************************/
CREATE TABLE `audit_jurisdiction_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jurisdiction_id` int(10) NOT NULL COMMENT '权限ID',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `create_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='来客商家审核权限修改日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = audit_task   */
/******************************************/
CREATE TABLE `audit_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '审核任务编号',
  `business_voucher` varchar(30) NOT NULL COMMENT '业务凭证',
  `operate_type` tinyint(3) unsigned NOT NULL COMMENT '操作类型：1-创建，2-修改，3-中止',
  `audit_state` tinyint(3) unsigned NOT NULL COMMENT '当前审批状态：1-审批中，2-通过，3-驳回',
  `complete_time` datetime DEFAULT NULL COMMENT '审批完成时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creator_name` varchar(30) DEFAULT NULL COMMENT '创建人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据有效性：-1-无效，1-有效',
  `concurrent_version` bigint(20) NOT NULL DEFAULT '1' COMMENT '当前数据版本号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_business_voucher` (`business_voucher`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17683 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='审核任务表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = audit_vender_jurisdiction   */
/******************************************/
CREATE TABLE `audit_vender_jurisdiction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT 'erp用户ID',
  `user_name` varchar(128) NOT NULL COMMENT 'erp用户名称',
  `vender_ids` varchar(1024) NOT NULL DEFAULT '' COMMENT '具有审批权限的商家ID',
  `vender_names` varchar(1024) NOT NULL COMMENT '具有审批权限的商家名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1 启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = base_apply_stock   */
/******************************************/
CREATE TABLE `base_apply_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `activity_type` int(11) NOT NULL COMMENT '活动类型枚举：\n- 1:微信商家券\n- 2:支付宝商家券\n- 3:秒杀券\n- 4:其他',
  `activity_id` bigint(20) NOT NULL COMMENT '外部活动ID(支付有礼等等)',
  `stock_sign` varchar(50) NOT NULL COMMENT '库存身份标志',
  `apply_nums` bigint(20) NOT NULL COMMENT '申请总数量',
  `remain_nums` bigint(20) NOT NULL COMMENT '剩余数量',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `apply_id` (`apply_id`) USING BTREE,
  KEY `activity_id` (`activity_id`) USING BTREE,
  KEY `stock_sign` (`stock_sign`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21441 DEFAULT CHARSET=utf8 COMMENT='标准商家券库存表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = base_apply_stock_log   */
/******************************************/
CREATE TABLE `base_apply_stock_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_sign` varchar(50) NOT NULL COMMENT '库存身份',
  `opt_type` int(11) NOT NULL COMMENT '操作类型枚举\n-1: 新增\n- 2:增加\n- 3:减少\n- 4:发放\n-5:释放\n-6:回滚',
  `opt_nums` bigint(20) NOT NULL COMMENT '操作数量',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) DEFAULT NULL COMMENT '申请人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `stock_sign` (`stock_sign`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200919081 DEFAULT CHARSET=utf8 COMMENT='标准商家券库存操作日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity   */
/******************************************/
CREATE TABLE `coup_activity` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '活动编号',
  `name` varchar(100) NOT NULL COMMENT '活动名称',
  `proposer_id` int(11) DEFAULT NULL COMMENT '申请人id',
  `proposer_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `provider_id` int(11) NOT NULL COMMENT '发放主体id',
  `provider_name` varchar(100) DEFAULT NULL COMMENT '发放主体名称',
  `dept_id1` varchar(50) DEFAULT NULL COMMENT '一级部门id',
  `dept_name1` varchar(100) DEFAULT NULL COMMENT '一级部门名称',
  `dept_id2` varchar(50) DEFAULT NULL COMMENT '二级部门id',
  `dept_name2` varchar(100) DEFAULT NULL COMMENT '二级部门名称',
  `dept_id3` varchar(50) DEFAULT NULL COMMENT '三级部门id',
  `dept_name3` varchar(100) DEFAULT NULL COMMENT '三级部门名称',
  `dept_id4` varchar(50) DEFAULT NULL COMMENT '四级部门id',
  `dept_name4` varchar(100) DEFAULT NULL COMMENT '四级部门名称',
  `payer_id` varchar(11) NOT NULL COMMENT '费用归属id',
  `payer_name` varchar(100) NOT NULL COMMENT '费用归属名称',
  `biz_type_fir_code` varchar(20) NOT NULL COMMENT '一级发券业务类型编号',
  `biz_type_sec_code` varchar(20) DEFAULT NULL COMMENT '二级发券业务类型编号',
  `provide_mode_code` varchar(20) DEFAULT NULL COMMENT '发放形式编号',
  `start_date` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '活动结束时间',
  `is_apply_coupon` tinyint(4) NOT NULL COMMENT '是否已申请优惠券',
  `third_party` varchar(100) DEFAULT NULL COMMENT '第三方平台',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `collar_limit_count` int(11) DEFAULT NULL,
  `collar_limit_type` tinyint(4) DEFAULT NULL,
  `received_app_msg` varchar(200) DEFAULT NULL COMMENT 'APP到账提醒消息内容',
  `mobile_msg_flag` tinyint(2) DEFAULT '0' COMMENT '0:不进行短消息提醒，1:短消息提醒',
  `received_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到账短消息提醒消息内容',
  `expired_warn_flag` tinyint(2) DEFAULT '0' COMMENT '0:不进行到期预警提醒，1:到期预警提醒',
  `expired_warn_hours` int(4) DEFAULT NULL COMMENT '预警时间(小时)',
  `expired_warn_app_enable` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_app_msg` varchar(200) DEFAULT NULL COMMENT '到期提醒APP消息内容',
  `expired_warn_mobile_enable` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到期提醒短消息的消息内容',
  `received_app_msg_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否appPush消息',
  `source` tinyint(2) DEFAULT '1' COMMENT '1:erp，2:来客',
  `belongs_vender` bigint(11) DEFAULT NULL COMMENT '信息所属商家ID',
  `activity_type` tinyint(2) DEFAULT '1' COMMENT '活动类型 1-营销计费 2-积分兑券',
  `allow_refund` bigint(2) DEFAULT '0' COMMENT '0-不允许退款 1-允许退款',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code`) USING BTREE,
  KEY `code` (`code`),
  KEY `proposer_id` (`proposer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114892 DEFAULT CHARSET=utf8 COMMENT='活动表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_cus   */
/******************************************/
CREATE TABLE `coup_activity_cus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `from_file_code` varchar(32) NOT NULL DEFAULT '' COMMENT '人员名单文件的code',
  `cus_tel` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `cus_reg_channel` int(11) DEFAULT NULL COMMENT '用户注册渠道',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_yn` (`activity_id`,`yn`),
  KEY `idx_FILE_CODE` (`from_file_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`),
  KEY `idx_users_apple_code_activity_id_yn_id` (`users_apply_code`,`activity_id`,`yn`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动上传用户表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_cus_20170105_backup   */
/******************************************/
CREATE TABLE `coup_activity_cus_20170105_backup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `from_file_code` varchar(32) NOT NULL DEFAULT '' COMMENT '人员名单文件的code',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_yn` (`activity_id`,`yn`),
  KEY `idx_APPLY_TO_USERS` (`users_apply_code`),
  KEY `idx_FILE_CODE` (`from_file_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动上传用户表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_cus_201703022   */
/******************************************/
CREATE TABLE `coup_activity_cus_201703022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `from_file_code` varchar(32) NOT NULL DEFAULT '' COMMENT '人员名单文件的code',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_yn` (`activity_id`,`yn`),
  KEY `idx_APPLY_TO_USERS` (`users_apply_code`),
  KEY `idx_FILE_CODE` (`from_file_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动上传用户表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_cus_20170608   */
/******************************************/
CREATE TABLE `coup_activity_cus_20170608` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `from_file_code` varchar(32) NOT NULL DEFAULT '' COMMENT '人员名单文件的code',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_yn` (`activity_id`,`yn`),
  KEY `idx_FILE_CODE` (`from_file_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`),
  KEY `idx_users_apply_code_activity_id` (`users_apply_code`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动上传用户表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_cus_result   */
/******************************************/
CREATE TABLE `coup_activity_cus_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `from_file_code` varchar(32) NOT NULL DEFAULT '' COMMENT '人员名单文件的code',
  `cus_tel` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `cus_reg_channel` int(11) DEFAULT NULL COMMENT '用户注册渠道',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_yn` (`activity_id`,`yn`),
  KEY `idx_FILE_CODE` (`from_file_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`),
  KEY `idx_users_apply_code_activity_id` (`users_apply_code`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动上传用户表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_activity_expense_rule   */
/******************************************/
CREATE TABLE `coup_activity_expense_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activity_id` bigint(20) NOT NULL COMMENT '优惠券活动id',
  `payer_type` tinyint(4) NOT NULL COMMENT '1:多点部门;2:商家;3:供应商',
  `payer_id` varchar(1000) CHARACTER SET utf8 NOT NULL COMMENT '费用归属id',
  `payer_name` varchar(2000) CHARACTER SET utf8 NOT NULL COMMENT '费用归属名称',
  `payer_percent` int(10) DEFAULT NULL COMMENT '所占比例%',
  `dept_id1` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '一级部门id',
  `dept_name1` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '一级部门名称',
  `dept_id2` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '二级部门id',
  `dept_name2` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '二级部门名称',
  `dept_id3` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '三级部门id',
  `dept_name3` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '三级部门名称',
  `dept_id4` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '四级部门id',
  `dept_name4` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '四级部门名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次id',
  `payer_amount` int(11) DEFAULT NULL COMMENT '承担金额 单位分 (固定金额模式/可变金额模式[可变一方为0])',
  `max` decimal(10,2) DEFAULT NULL COMMENT '最大承担费用',
  PRIMARY KEY (`id`),
  KEY `IDX_ACTIVITYID` (`activity_id`) USING BTREE,
  KEY `idx_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19303281 DEFAULT CHARSET=utf8mb4 COMMENT='coup_activity_expense_rule';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_amount_config   */
/******************************************/
CREATE TABLE `coup_amount_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动ID',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次ID',
  `mj` int(11) DEFAULT NULL COMMENT '满减券优惠力度',
  `cash` int(11) DEFAULT NULL COMMENT '现金券最大面值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人',
  `create_name` varchar(255) DEFAULT NULL,
  `update_name` varchar(255) DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT '50' COMMENT '折扣限制值',
  `vender_id` bigint(11) DEFAULT NULL COMMENT '所属商家ID',
  `freight_fee` int(11) DEFAULT NULL COMMENT '运费限额',
  `mj_alarm` int(11) DEFAULT NULL COMMENT '满减券报警比例',
  `cash_alarm` int(11) DEFAULT NULL COMMENT '现金券报警金额',
  `discount_alarm` int(11) DEFAULT '50' COMMENT '折扣券报警折扣',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_update_time` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券金额配置表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_append   */
/******************************************/
CREATE TABLE `coup_apply_append` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `amount` int(10) NOT NULL COMMENT '追加数量',
  `proposer_id` int(11) NOT NULL COMMENT '申请人ID',
  `proposer_name` varchar(100) DEFAULT NULL COMMENT '申请人名称',
  `proposer_time` datetime NOT NULL COMMENT '申请人时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:1初始 2待审核 3审核通过 4审批不通过',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '逻辑删除 1为有效 0代表被逻辑删除',
  `coup_type` tinyint(4) DEFAULT '1' COMMENT '券类型[1-交易券 2-支付券]',
  `budget_use_amount` int(11) DEFAULT NULL COMMENT '预算使用金额[单位:分/折扣]',
  PRIMARY KEY (`id`),
  KEY `idx_apply` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35001 DEFAULT CHARSET=utf8 COMMENT='批次数量追加记录表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_base_info   */
/******************************************/
CREATE TABLE `coup_apply_base_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '批次ID-主键  2.0之前以老表生成id插入 2.0以后再切换',
  `code` varchar(50) DEFAULT NULL COMMENT '批次编号',
  `name` varchar(100) DEFAULT NULL COMMENT '批次名称',
  `group_id` bigint(20) NOT NULL COMMENT '活动id',
  `coup_type` tinyint(11) DEFAULT NULL COMMENT '券类型[1-交易券 2-支付券]',
  `provider_id` int(11) NOT NULL COMMENT '发放主体id[301-多点 302-商家 303-品牌]',
  `provider_name` varchar(100) DEFAULT NULL COMMENT '发放主体名称 301-多点 302-商家id+具体商家名称 303-品牌ID+具体的品牌名称',
  `charge_type` tinyint(4) DEFAULT '1' COMMENT '计费类型 1-营销计费 2-积分兑券 对应原活动表activity_type',
  `front_display_name` varchar(100) DEFAULT NULL COMMENT '前端展示名称',
  `limit_remark` varchar(2500) DEFAULT NULL COMMENT '批次限制说明',
  `out_activity_link` varchar(1024) DEFAULT NULL COMMENT '外部系统的活动链接地址',
  `logo_link` varchar(1024) DEFAULT NULL COMMENT '品牌logo链接',
  `label` varchar(50) DEFAULT NULL COMMENT '描述文案-标签',
  `coup_use_type` tinyint(4) NOT NULL COMMENT '优惠券使用类型[1,"现金券" 2,"满减券" 3,"减免运费券" 4,"折扣券"]',
  `coup_amount` int(11) NOT NULL COMMENT '优惠券金额[单位:分/折扣]',
  `coupon_threshold` int(11) DEFAULT NULL COMMENT '限额-门槛[单位:分]',
  `coup_max_amount` int(11) DEFAULT '0' COMMENT '最大优惠金额 折扣券场景',
  `limit_scene` tinyint(4) DEFAULT '1' COMMENT '使用场景限制 0:全部 1:线上 2:线下 （默认 1:线上）',
  `limit_superimpose` tinyint(4) NOT NULL DEFAULT '0' COMMENT '叠加限制 0-不可叠加 1-可叠加',
  `limit_trade_mode` varchar(800) DEFAULT NULL COMMENT '交易模式 业务类型+使用平台 组合',
  `limit_pay_channels` varchar(2000) DEFAULT '' COMMENT '使用支付渠道限制 [微信 支付宝 银联云闪付]',
  `limit_merchant` tinyint(4) NOT NULL COMMENT '商家限制[0:不限 1:部分商家可用 -1:部分商家不可用]',
  `limit_merchant_list` text COMMENT '限制商家ID集合，逗号隔开',
  `limit_store` tinyint(4) NOT NULL COMMENT '门店限制[0:不限 1:部分门店可用 -1:部分门店不可用]',
  `limit_store_list` text COMMENT '限制门店ID集合，逗号隔开',
  `limit_goods` tinyint(4) NOT NULL COMMENT '商品限制[0:不限 1:部分品类可用 -1:部分品类不可用 2-限商品 5-限白名单 6-限品牌  ]',
  `limit_blacklist` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批次的黑名单限制,0表示不限制;1表示限制.',
  `limit_blacklist_ids` varchar(500) DEFAULT NULL COMMENT '指定限制黑名单ID列表',
  `limit_delivery_type` varchar(20) NOT NULL DEFAULT '' COMMENT '配送方式限制(配送,自提)',
  `valid_date_type` tinyint(4) NOT NULL COMMENT '有效期类型[1:绝对时间 2:相对时间]',
  `valid_days` int(11) DEFAULT NULL COMMENT '相对时间-领券后有效天数',
  `delay_days` int(11) DEFAULT '0' COMMENT '相对时间-生效延期(天)',
  `start_date` datetime DEFAULT NULL COMMENT '绝对时间-起始时间',
  `end_date` datetime DEFAULT NULL COMMENT '绝对时间-结束时间',
  `expired_delay_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '券回滚场景-优惠券批次过期延期天数,目前业务要求只能是0到3的整数,包括边界值在内',
  `provide_type` int(11) NOT NULL COMMENT '发放方式[201:定向 202:非定向]',
  `receive_start_date` datetime DEFAULT NULL COMMENT '非定向-可领券-起始时间',
  `receive_end_date` datetime DEFAULT NULL COMMENT '非定向-可领券-结束时间',
  `receive_entrance_limit` int(11) DEFAULT NULL COMMENT '非定向-领券入口限制',
  `access_key` varchar(100) DEFAULT NULL COMMENT '接入key',
  `secret_key` varchar(100) DEFAULT NULL COMMENT '接入秘钥',
  `apply_nums` int(11) NOT NULL COMMENT '申请数量',
  `first_apply_nums` int(11) DEFAULT NULL COMMENT '初次申请数量',
  `remain_nums` int(11) NOT NULL COMMENT '剩余数量',
  `used_nums` int(11) DEFAULT '0' COMMENT '使用数量',
  `warning_remain_nums` int(11) DEFAULT '0' COMMENT '预警剩余数量',
  `belongs_vender` bigint(20) DEFAULT NULL COMMENT '信息所属商家ID-来客端创建赋值',
  `source` tinyint(4) DEFAULT NULL COMMENT '1:erp，2:来客，3-营销一体化erp(潘多拉) 4-营销一体化来客',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `dept_id1` varchar(50) DEFAULT NULL COMMENT '申请一级部门id',
  `dept_name1` varchar(100) DEFAULT NULL COMMENT '申请一级部门名称',
  `dept_id2` varchar(50) DEFAULT NULL COMMENT '申请二级部门id',
  `dept_name2` varchar(100) DEFAULT NULL COMMENT '申请二级部门名称',
  `dept_id3` varchar(50) DEFAULT NULL COMMENT '申请三级部门id',
  `dept_name3` varchar(100) DEFAULT NULL COMMENT '申请三级部门名称',
  `dept_id4` varchar(50) DEFAULT NULL COMMENT '申请四级部门id',
  `dept_name4` varchar(100) DEFAULT NULL COMMENT '申请四级部门名称',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `coupon_threshold_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '门槛限制类型 0不限制 1整单 2与使用商品相同',
  `ware_limit_option` tinyint(4) DEFAULT NULL COMMENT '商品配置选项  0-全商品 1-商品编码录入 2-品类&品牌',
  `ware_compute_mode` tinyint(4) DEFAULT NULL COMMENT '品类&品牌配置方式 1-品类品牌交集 2-品类品牌并集',
  `limit_goods_detail` varchar(100) DEFAULT NULL COMMENT '将多种商品指定、排除信息聚合以逗号隔开',
  `superimpose_body` varchar(255) DEFAULT NULL COMMENT '叠加主体',
  `brand_superimpose` tinyint(11) DEFAULT NULL COMMENT '是否可与同品牌的其他券叠加使用',
  `limit_time_range` tinyint(2) DEFAULT '0' COMMENT '1：时间段限制，0：不限制',
  `time_range_type` int(2) DEFAULT NULL COMMENT '1: 相同时段，2:周期时段',
  `time_ranges` varchar(1000) DEFAULT NULL COMMENT '时间段配置',
  `single_use_num` int(11) DEFAULT '1' COMMENT '同一批次可用优惠券数量',
  `limit_pay` tinyint(4) DEFAULT '1' COMMENT '是否限制支付渠道 0 不限制 1 限制',
  `limit_doubling` tinyint(1) DEFAULT '0' COMMENT '翻倍限制',
  `use_times` int(11) DEFAULT '2' COMMENT '即发即用满减券使用倍数',
  `user_type` int(2) DEFAULT '1' COMMENT '即发即用券使用对象',
  `use_all_num` int(11) DEFAULT NULL COMMENT '每人总使用次数',
  `every_day_use_num` int(11) DEFAULT NULL COMMENT '每人每天使用次数',
  `limit_use_num` tinyint(1) DEFAULT '0' COMMENT '限制使用次数',
  `finance_record_type` tinyint(4) DEFAULT '0' COMMENT '财务记账配置：0-计入，1-不计入',
  `special_mark` varchar(50) DEFAULT NULL COMMENT '批次特殊标记：如000000，每位代表一个标记',
  `audit_task_state` tinyint(4) DEFAULT '0' COMMENT '审批流程标记：0-无，1-未开始，2-流转中，3-流转结束',
  `enlarge_rule` varchar(2000) DEFAULT NULL COMMENT '优惠券扩大规则明细，JSON格式的字符串,参考对象：EnlargeRuleDto',
  `limit_trade_mode_source` text COMMENT 'JSON格式：key = trade_mode,value = trade_mode可用的端，比如 交易类型为O2O的微信商城的 可用端为 [普通H商城,招商银行H商城]',
  `ad_type` tinyint(4) DEFAULT NULL COMMENT '折让方式：1:普通折让 2:虚拟商品退损',
  `ad_enter_type` tinyint(4) DEFAULT NULL COMMENT '折让录入方式：1：手动录入，2：批量录入',
  `assume_mode` tinyint(4) DEFAULT '1' COMMENT '费用承担模式 1-按比例 2-固定金额 3-可变金额 4-关联品牌活动',
  `inflation_type` tinyint(4) DEFAULT '0' COMMENT '是否膨胀券 0-否 1-是',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`) USING BTREE,
  KEY `idx_create_user` (`created_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4512521 DEFAULT CHARSET=utf8 COMMENT='优惠券申请信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_contract_info   */
/******************************************/
CREATE TABLE `coup_apply_contract_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `contract_code` varchar(100) NOT NULL COMMENT '合同编号',
  `contract_link` varchar(1024) DEFAULT NULL COMMENT '合同图片链接',
  `collect_type` tinyint(4) NOT NULL COMMENT '收取方式 1-账扣 2-电汇',
  `open_invoice` tinyint(4) NOT NULL COMMENT '是否对公开票 0-是 1-否',
  `settlement_node` tinyint(4) NOT NULL COMMENT '结算节点 1-发放 2-结算',
  `account_period` tinyint(4) DEFAULT NULL COMMENT '账期 1-半月度 2-月度 3-季度 4-自定义天',
  `account_period_day` int(11) DEFAULT '0' COMMENT '账期类型为4时 记录具体天数',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `cooperate_type` tinyint(4) DEFAULT NULL COMMENT '合作方式：1 先收款后发券 2 先发券后收款',
  PRIMARY KEY (`id`),
  KEY `index_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2531001 DEFAULT CHARSET=utf8 COMMENT='批次合同信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_expand_info   */
/******************************************/
CREATE TABLE `coup_apply_expand_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `charge_type` tinyint(4) DEFAULT NULL COMMENT '计费类型 1-营销计费 2-积分兑券 3-异业合作',
  `official_partner_id` varchar(100) DEFAULT NULL COMMENT '异业合作商ID',
  `official_partner_name` varchar(100) DEFAULT NULL COMMENT '异业合作商名称',
  `budget_start_date` datetime DEFAULT NULL COMMENT '预算起始时间',
  `budget_end_date` datetime DEFAULT NULL COMMENT '预算结束时间',
  `budget_use_rate` int(11) DEFAULT NULL COMMENT '预算使用率0-100之间的正整数',
  `budget_use_num` int(11) DEFAULT NULL COMMENT '预算使用数量',
  `budget_use_amount` int(11) DEFAULT NULL COMMENT '预算使用金额[单位:分/折扣]',
  `budget_type` int(11) DEFAULT NULL COMMENT '预算类型',
  `budget_type_name` varchar(100) DEFAULT NULL COMMENT '预算类型名称',
  `apply_use_nums` int(11) DEFAULT '0' COMMENT '批次用券数量',
  `apply_recover_nums` int(11) DEFAULT '0' COMMENT '批次回滚券数量',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `initiate_dept` tinyint(4) DEFAULT NULL COMMENT '发起部门类型：1-采销部，2-市场部，3-采销和市场部',
  `under_budget` tinyint(4) DEFAULT NULL COMMENT '是否超预算： 0-预算内， 1-超出预算，2-未创建预算',
  `coupon_apply_uuid` varchar(100) DEFAULT NULL COMMENT '优惠券关联外部券码唯一标识',
  `same_source_store` tinyint(4) DEFAULT NULL COMMENT '下单门店是否与核销门店一致,0-否， 1-是',
  `external_biz_codes` varchar(200) DEFAULT '0' COMMENT '托管的外部业务系统编码 如:品牌系统活动ID',
  `sample_store_early_start` tinyint(1) DEFAULT NULL COMMENT '样本店提前开始',
  `sample_store_early_end` tinyint(1) DEFAULT NULL COMMENT '样本店提前结束',
  PRIMARY KEY (`id`),
  KEY `index_apply_id` (`apply_id`) USING BTREE,
  KEY `index-coupon_apply_uuid` (`coupon_apply_uuid`) USING BTREE,
  KEY `index-extbizcode` (`external_biz_codes`)
) ENGINE=InnoDB AUTO_INCREMENT=7570081 DEFAULT CHARSET=utf8 COMMENT='批次扩展信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_group   */
/******************************************/
CREATE TABLE `coup_apply_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID-主键',
  `name` varchar(100) NOT NULL COMMENT '活动名称',
  `schedule_code` varchar(100) DEFAULT NULL COMMENT '活动档期编号',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `coup_type` tinyint(4) DEFAULT '1' COMMENT '券类型[1-交易券 2-支付券]',
  `company_group_name` varchar(100) DEFAULT NULL COMMENT '集团公司名称',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '创建者归属商家',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '创建者归属商家名称',
  `apply_group_type` tinyint(4) DEFAULT NULL COMMENT '优惠券活动类型1-多点活动 2-商家活动',
  `company_group_id` bigint(20) DEFAULT NULL COMMENT '集团公司ID 商家活动场景存在',
  PRIMARY KEY (`id`),
  KEY `idx_created_id` (`created_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1137881 DEFAULT CHARSET=utf8 COMMENT='活动信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_limit_goods   */
/******************************************/
CREATE TABLE `coup_apply_limit_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `limit_goods_type` tinyint(4) NOT NULL COMMENT '商品限制[1:部分品类可用 98:部分品类可用下的不可用商品SKU -1:部分品类不可用 99:部分品类不可用下的可用商品SKU 2:限SKU商品 3:限商品物料编码 4:限SKU白名单 5:限物料编码白名单 6:限品牌 ]',
  `limit_goods_id` varchar(100) NOT NULL COMMENT '具体的限制商品ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`) USING BTREE,
  KEY `index_applyId_goodstype` (`apply_id`,`limit_goods_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22300472161 DEFAULT CHARSET=utf8 COMMENT='优惠券通知消息配置表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_msg_config   */
/******************************************/
CREATE TABLE `coup_apply_msg_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `received_app_msg_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否appPush消息',
  `received_app_msg` varchar(512) DEFAULT NULL COMMENT 'APP到账提醒消息内容',
  `mobile_msg_flag` tinyint(4) DEFAULT '0' COMMENT '0:不进行短消息提醒，1:短消息提醒',
  `received_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到账短消息提醒消息内容',
  `expired_warn_flag` tinyint(4) DEFAULT '0' COMMENT '0:不进行到期预警提醒，1:到期预警提醒',
  `expired_warn_hours` int(11) DEFAULT NULL COMMENT '预警时间(小时)',
  `expired_warn_app_enable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_app_msg` varchar(512) DEFAULT NULL COMMENT 'APP到期提醒消息内容',
  `expired_warn_mobile_enable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到期提醒短消息的消息内容',
  `received_mobile_url` varchar(128) DEFAULT NULL COMMENT '到账短信链接',
  `received_mobile_channel` int(10) DEFAULT NULL COMMENT '到账短信渠道',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `expired_warn_mobile_channel` int(11) DEFAULT NULL COMMENT '到期提醒短信渠道',
  `arrival_medusa_id` bigint(20) DEFAULT NULL COMMENT '非定向券到账提醒美杜莎活动id',
  `expired_medusa_id` bigint(20) DEFAULT NULL COMMENT '非定向券到期提醒美杜莎活动id',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4879481 DEFAULT CHARSET=utf8 COMMENT='优惠券通知消息配置表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_template   */
/******************************************/
CREATE TABLE `coup_apply_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次主键',
  `custom_param` text COMMENT '页面模板结构(后端单纯存储)',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='优惠券页面模板结构表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_threshold_goods   */
/******************************************/
CREATE TABLE `coup_apply_threshold_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `limit_goods_type` tinyint(4) NOT NULL COMMENT '商品类型 LimitGoodsTypeEnum',
  `limit_goods_id` varchar(100) NOT NULL COMMENT '具体的限制商品ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `applyId` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9070481 DEFAULT CHARSET=utf8 COMMENT='门槛商品表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_token   */
/******************************************/
CREATE TABLE `coup_apply_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `token_id` bigint(20) NOT NULL COMMENT '令牌活动ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unx_apply` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_apply_warning   */
/******************************************/
CREATE TABLE `coup_apply_warning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_code` varchar(50) NOT NULL COMMENT '优惠券批次编码',
  `apply_id` bigint(20) NOT NULL COMMENT '批次id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_code` varchar(50) NOT NULL COMMENT '优惠券活动编码',
  `activity_name` varchar(100) NOT NULL COMMENT '优惠券活动名称',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券批次申请发券数量',
  `warning_amount` int(11) DEFAULT '0' COMMENT '优惠券批次预警数量值',
  `warning_time` datetime DEFAULT NULL COMMENT '预警时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40561 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_biz_apply_rel   */
/******************************************/
CREATE TABLE `coup_biz_apply_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `biz_type` varchar(30) DEFAULT NULL COMMENT '优惠券业态类型[100:全部 101:百货 102:电器 103:商超]',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7961 DEFAULT CHARSET=utf8 COMMENT='券批次业态类型关系表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_common_log   */
/******************************************/
CREATE TABLE `coup_common_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_id` int(11) NOT NULL COMMENT '操作人',
  `operator_name` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作信息',
  `log_type` varchar(255) NOT NULL DEFAULT '' COMMENT '操作类型: 1: 人员离职日志',
  `target_id` int(11) NOT NULL COMMENT '操作目标ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_operator` (`operator_id`),
  KEY `idx_target` (`operator_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14671 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon   */
/******************************************/
CREATE TABLE `coup_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式[1:定向 2:非定向]',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `coupon_apply_id` (`coupon_apply_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_00   */
/******************************************/
CREATE TABLE `coup_coupon_00` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_00_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_00_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5722240521 DEFAULT CHARSET=utf8 COMMENT='优惠券表00';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_01   */
/******************************************/
CREATE TABLE `coup_coupon_01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_01_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_01_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5730669481 DEFAULT CHARSET=utf8 COMMENT='优惠券表01';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_02   */
/******************************************/
CREATE TABLE `coup_coupon_02` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_02_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_02_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5709488561 DEFAULT CHARSET=utf8 COMMENT='优惠券表02';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_03   */
/******************************************/
CREATE TABLE `coup_coupon_03` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_03_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_03_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729457921 DEFAULT CHARSET=utf8 COMMENT='优惠券表03';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_04   */
/******************************************/
CREATE TABLE `coup_coupon_04` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_04_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_04_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5737740161 DEFAULT CHARSET=utf8 COMMENT='优惠券表04';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_05   */
/******************************************/
CREATE TABLE `coup_coupon_05` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_05_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_05_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712972121 DEFAULT CHARSET=utf8 COMMENT='优惠券表05';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_06   */
/******************************************/
CREATE TABLE `coup_coupon_06` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_06_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_06_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5716144401 DEFAULT CHARSET=utf8 COMMENT='优惠券表06';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_07   */
/******************************************/
CREATE TABLE `coup_coupon_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_07_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_07_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5746387921 DEFAULT CHARSET=utf8 COMMENT='优惠券表07';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_08   */
/******************************************/
CREATE TABLE `coup_coupon_08` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_08_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_08_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5726031121 DEFAULT CHARSET=utf8 COMMENT='优惠券表08';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_09   */
/******************************************/
CREATE TABLE `coup_coupon_09` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_09_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_09_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5714519361 DEFAULT CHARSET=utf8 COMMENT='优惠券表09';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_10   */
/******************************************/
CREATE TABLE `coup_coupon_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_10_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_10_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5716639001 DEFAULT CHARSET=utf8 COMMENT='优惠券表10';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_11   */
/******************************************/
CREATE TABLE `coup_coupon_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_11_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_11_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5719336361 DEFAULT CHARSET=utf8 COMMENT='优惠券表11';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_12   */
/******************************************/
CREATE TABLE `coup_coupon_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_12_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_12_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5719892681 DEFAULT CHARSET=utf8 COMMENT='优惠券表12';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_13   */
/******************************************/
CREATE TABLE `coup_coupon_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_13_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_13_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5723723521 DEFAULT CHARSET=utf8 COMMENT='优惠券表13';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_14   */
/******************************************/
CREATE TABLE `coup_coupon_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_14_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_14_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5735100321 DEFAULT CHARSET=utf8 COMMENT='优惠券表14';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_15   */
/******************************************/
CREATE TABLE `coup_coupon_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_15_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_15_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5717086521 DEFAULT CHARSET=utf8 COMMENT='优惠券表15';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_16   */
/******************************************/
CREATE TABLE `coup_coupon_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_16_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_16_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5709232081 DEFAULT CHARSET=utf8 COMMENT='优惠券表16';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_17   */
/******************************************/
CREATE TABLE `coup_coupon_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_17_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_17_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5732452361 DEFAULT CHARSET=utf8 COMMENT='优惠券表17';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_18   */
/******************************************/
CREATE TABLE `coup_coupon_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_18_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_18_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5751227121 DEFAULT CHARSET=utf8 COMMENT='优惠券表18';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_19   */
/******************************************/
CREATE TABLE `coup_coupon_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_19_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_19_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5689461641 DEFAULT CHARSET=utf8 COMMENT='优惠券表19';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_20   */
/******************************************/
CREATE TABLE `coup_coupon_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_20_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_20_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5711880681 DEFAULT CHARSET=utf8 COMMENT='优惠券表20';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_21   */
/******************************************/
CREATE TABLE `coup_coupon_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_21_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_21_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5708029081 DEFAULT CHARSET=utf8 COMMENT='优惠券表21';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_22   */
/******************************************/
CREATE TABLE `coup_coupon_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_22_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_22_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5724382601 DEFAULT CHARSET=utf8 COMMENT='优惠券表22';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_23   */
/******************************************/
CREATE TABLE `coup_coupon_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_23_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_23_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5715460441 DEFAULT CHARSET=utf8 COMMENT='优惠券表23';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_24   */
/******************************************/
CREATE TABLE `coup_coupon_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_24_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_24_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5702582001 DEFAULT CHARSET=utf8 COMMENT='优惠券表24';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_25   */
/******************************************/
CREATE TABLE `coup_coupon_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_25_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_25_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5707446721 DEFAULT CHARSET=utf8 COMMENT='优惠券表25';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_26   */
/******************************************/
CREATE TABLE `coup_coupon_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_26_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_26_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5700574321 DEFAULT CHARSET=utf8 COMMENT='优惠券表26';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_27   */
/******************************************/
CREATE TABLE `coup_coupon_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_27_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_27_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5733150241 DEFAULT CHARSET=utf8 COMMENT='优惠券表27';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_28   */
/******************************************/
CREATE TABLE `coup_coupon_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_28_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_28_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5737196441 DEFAULT CHARSET=utf8 COMMENT='优惠券表28';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_29   */
/******************************************/
CREATE TABLE `coup_coupon_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_29_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_29_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5723734641 DEFAULT CHARSET=utf8 COMMENT='优惠券表29';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_30   */
/******************************************/
CREATE TABLE `coup_coupon_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_30_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_30_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5699716721 DEFAULT CHARSET=utf8 COMMENT='优惠券表30';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_31   */
/******************************************/
CREATE TABLE `coup_coupon_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_31_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_31_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5714273481 DEFAULT CHARSET=utf8 COMMENT='优惠券表31';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_32   */
/******************************************/
CREATE TABLE `coup_coupon_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_32_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_32_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5727748921 DEFAULT CHARSET=utf8 COMMENT='优惠券表32';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_33   */
/******************************************/
CREATE TABLE `coup_coupon_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_33_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_33_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5716121681 DEFAULT CHARSET=utf8 COMMENT='优惠券表33';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_34   */
/******************************************/
CREATE TABLE `coup_coupon_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_34_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_34_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5699778961 DEFAULT CHARSET=utf8 COMMENT='优惠券表34';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_35   */
/******************************************/
CREATE TABLE `coup_coupon_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_35_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_35_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5719883321 DEFAULT CHARSET=utf8 COMMENT='优惠券表35';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_36   */
/******************************************/
CREATE TABLE `coup_coupon_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_36_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_36_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729175401 DEFAULT CHARSET=utf8 COMMENT='优惠券表36';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_37   */
/******************************************/
CREATE TABLE `coup_coupon_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_37_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_37_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5726926961 DEFAULT CHARSET=utf8 COMMENT='优惠券表37';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_38   */
/******************************************/
CREATE TABLE `coup_coupon_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_38_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_38_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5692159921 DEFAULT CHARSET=utf8 COMMENT='优惠券表38';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_39   */
/******************************************/
CREATE TABLE `coup_coupon_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_39_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_39_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5718130081 DEFAULT CHARSET=utf8 COMMENT='优惠券表39';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_40   */
/******************************************/
CREATE TABLE `coup_coupon_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_40_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_40_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5697862881 DEFAULT CHARSET=utf8 COMMENT='优惠券表40';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_41   */
/******************************************/
CREATE TABLE `coup_coupon_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_41_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_41_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5704668361 DEFAULT CHARSET=utf8 COMMENT='优惠券表41';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_42   */
/******************************************/
CREATE TABLE `coup_coupon_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_42_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_42_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729776761 DEFAULT CHARSET=utf8 COMMENT='优惠券表42';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_43   */
/******************************************/
CREATE TABLE `coup_coupon_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_43_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_43_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5724882881 DEFAULT CHARSET=utf8 COMMENT='优惠券表43';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_44   */
/******************************************/
CREATE TABLE `coup_coupon_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_44_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_44_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712117121 DEFAULT CHARSET=utf8 COMMENT='优惠券表44';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_45   */
/******************************************/
CREATE TABLE `coup_coupon_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_45_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_45_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5721129881 DEFAULT CHARSET=utf8 COMMENT='优惠券表45';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_46   */
/******************************************/
CREATE TABLE `coup_coupon_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_46_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_46_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728956401 DEFAULT CHARSET=utf8 COMMENT='优惠券表46';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_47   */
/******************************************/
CREATE TABLE `coup_coupon_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_47_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_47_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5718288921 DEFAULT CHARSET=utf8 COMMENT='优惠券表47';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_48   */
/******************************************/
CREATE TABLE `coup_coupon_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_48_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_48_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5721937001 DEFAULT CHARSET=utf8 COMMENT='优惠券表48';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_49   */
/******************************************/
CREATE TABLE `coup_coupon_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_49_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_49_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5733362761 DEFAULT CHARSET=utf8 COMMENT='优惠券表49';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_50   */
/******************************************/
CREATE TABLE `coup_coupon_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_50_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_50_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5702814361 DEFAULT CHARSET=utf8 COMMENT='优惠券表50';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_51   */
/******************************************/
CREATE TABLE `coup_coupon_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_51_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_51_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5746742521 DEFAULT CHARSET=utf8 COMMENT='优惠券表51';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_52   */
/******************************************/
CREATE TABLE `coup_coupon_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_52_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_52_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5714241081 DEFAULT CHARSET=utf8 COMMENT='优惠券表52';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_53   */
/******************************************/
CREATE TABLE `coup_coupon_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_53_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_53_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5703747801 DEFAULT CHARSET=utf8 COMMENT='优惠券表53';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_54   */
/******************************************/
CREATE TABLE `coup_coupon_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_54_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_54_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5711467361 DEFAULT CHARSET=utf8 COMMENT='优惠券表54';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_55   */
/******************************************/
CREATE TABLE `coup_coupon_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_55_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_55_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728922041 DEFAULT CHARSET=utf8 COMMENT='优惠券表55';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_56   */
/******************************************/
CREATE TABLE `coup_coupon_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_56_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_56_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5706772121 DEFAULT CHARSET=utf8 COMMENT='优惠券表56';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_57   */
/******************************************/
CREATE TABLE `coup_coupon_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_57_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_57_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5717136361 DEFAULT CHARSET=utf8 COMMENT='优惠券表57';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_58   */
/******************************************/
CREATE TABLE `coup_coupon_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_58_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_58_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729128281 DEFAULT CHARSET=utf8 COMMENT='优惠券表58';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_59   */
/******************************************/
CREATE TABLE `coup_coupon_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_59_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_59_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5735655521 DEFAULT CHARSET=utf8 COMMENT='优惠券表59';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_60   */
/******************************************/
CREATE TABLE `coup_coupon_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_60_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_60_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712774081 DEFAULT CHARSET=utf8 COMMENT='优惠券表60';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_61   */
/******************************************/
CREATE TABLE `coup_coupon_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_61_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_61_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5717403681 DEFAULT CHARSET=utf8 COMMENT='优惠券表61';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_62   */
/******************************************/
CREATE TABLE `coup_coupon_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_62_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_62_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5710308761 DEFAULT CHARSET=utf8 COMMENT='优惠券表62';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_63   */
/******************************************/
CREATE TABLE `coup_coupon_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_63_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_63_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5735462041 DEFAULT CHARSET=utf8 COMMENT='优惠券表63';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_64   */
/******************************************/
CREATE TABLE `coup_coupon_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_64_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_64_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5694017481 DEFAULT CHARSET=utf8 COMMENT='优惠券表64';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_65   */
/******************************************/
CREATE TABLE `coup_coupon_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_65_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_65_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5732491641 DEFAULT CHARSET=utf8 COMMENT='优惠券表65';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_66   */
/******************************************/
CREATE TABLE `coup_coupon_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_66_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_66_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5715868001 DEFAULT CHARSET=utf8 COMMENT='优惠券表66';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_67   */
/******************************************/
CREATE TABLE `coup_coupon_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_67_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_67_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5726461961 DEFAULT CHARSET=utf8 COMMENT='优惠券表67';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_68   */
/******************************************/
CREATE TABLE `coup_coupon_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_68_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_68_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5720529601 DEFAULT CHARSET=utf8 COMMENT='优惠券表68';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_69   */
/******************************************/
CREATE TABLE `coup_coupon_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_69_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_69_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5720942561 DEFAULT CHARSET=utf8 COMMENT='优惠券表69';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_70   */
/******************************************/
CREATE TABLE `coup_coupon_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_70_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_70_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5720363841 DEFAULT CHARSET=utf8 COMMENT='优惠券表70';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_71   */
/******************************************/
CREATE TABLE `coup_coupon_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_71_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_71_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5720224481 DEFAULT CHARSET=utf8 COMMENT='优惠券表71';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_72   */
/******************************************/
CREATE TABLE `coup_coupon_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_72_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_72_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712071281 DEFAULT CHARSET=utf8 COMMENT='优惠券表72';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_73   */
/******************************************/
CREATE TABLE `coup_coupon_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_73_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_73_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5701793161 DEFAULT CHARSET=utf8 COMMENT='优惠券表73';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_74   */
/******************************************/
CREATE TABLE `coup_coupon_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_74_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_74_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5727215681 DEFAULT CHARSET=utf8 COMMENT='优惠券表74';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_75   */
/******************************************/
CREATE TABLE `coup_coupon_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_75_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_75_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712067561 DEFAULT CHARSET=utf8 COMMENT='优惠券表75';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_76   */
/******************************************/
CREATE TABLE `coup_coupon_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_76_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_76_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729221041 DEFAULT CHARSET=utf8 COMMENT='优惠券表76';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_77   */
/******************************************/
CREATE TABLE `coup_coupon_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_77_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_77_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5714792521 DEFAULT CHARSET=utf8 COMMENT='优惠券表77';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_78   */
/******************************************/
CREATE TABLE `coup_coupon_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_78_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_78_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728612321 DEFAULT CHARSET=utf8 COMMENT='优惠券表78';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_79   */
/******************************************/
CREATE TABLE `coup_coupon_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_79_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_79_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5721931961 DEFAULT CHARSET=utf8 COMMENT='优惠券表79';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_80   */
/******************************************/
CREATE TABLE `coup_coupon_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_80_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_80_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5702559561 DEFAULT CHARSET=utf8 COMMENT='优惠券表80';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_81   */
/******************************************/
CREATE TABLE `coup_coupon_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_81_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_81_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5707941961 DEFAULT CHARSET=utf8 COMMENT='优惠券表81';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_82   */
/******************************************/
CREATE TABLE `coup_coupon_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_82_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_82_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5719261201 DEFAULT CHARSET=utf8 COMMENT='优惠券表82';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_83   */
/******************************************/
CREATE TABLE `coup_coupon_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_83_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_83_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5716564561 DEFAULT CHARSET=utf8 COMMENT='优惠券表83';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_84   */
/******************************************/
CREATE TABLE `coup_coupon_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_84_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_84_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5709254641 DEFAULT CHARSET=utf8 COMMENT='优惠券表84';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_85   */
/******************************************/
CREATE TABLE `coup_coupon_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_85_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_85_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728550121 DEFAULT CHARSET=utf8 COMMENT='优惠券表85';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_86   */
/******************************************/
CREATE TABLE `coup_coupon_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_86_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_86_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5741291521 DEFAULT CHARSET=utf8 COMMENT='优惠券表86';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_87   */
/******************************************/
CREATE TABLE `coup_coupon_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_87_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_87_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5713537761 DEFAULT CHARSET=utf8 COMMENT='优惠券表87';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_88   */
/******************************************/
CREATE TABLE `coup_coupon_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_88_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_88_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5700236241 DEFAULT CHARSET=utf8 COMMENT='优惠券表88';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_89   */
/******************************************/
CREATE TABLE `coup_coupon_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_89_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_89_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5729592721 DEFAULT CHARSET=utf8 COMMENT='优惠券表89';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_90   */
/******************************************/
CREATE TABLE `coup_coupon_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_90_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_90_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5704607281 DEFAULT CHARSET=utf8 COMMENT='优惠券表90';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_91   */
/******************************************/
CREATE TABLE `coup_coupon_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_91_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_91_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5724321321 DEFAULT CHARSET=utf8 COMMENT='优惠券表91';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_92   */
/******************************************/
CREATE TABLE `coup_coupon_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_92_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_92_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712186881 DEFAULT CHARSET=utf8 COMMENT='优惠券表92';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_93   */
/******************************************/
CREATE TABLE `coup_coupon_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_93_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_93_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5720635361 DEFAULT CHARSET=utf8 COMMENT='优惠券表93';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_94   */
/******************************************/
CREATE TABLE `coup_coupon_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_94_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_94_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728118961 DEFAULT CHARSET=utf8 COMMENT='优惠券表94';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_95   */
/******************************************/
CREATE TABLE `coup_coupon_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_95_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_95_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5712778601 DEFAULT CHARSET=utf8 COMMENT='优惠券表95';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_96   */
/******************************************/
CREATE TABLE `coup_coupon_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_96_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_96_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5704236201 DEFAULT CHARSET=utf8 COMMENT='优惠券表96';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_97   */
/******************************************/
CREATE TABLE `coup_coupon_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_97_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_97_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5718614801 DEFAULT CHARSET=utf8 COMMENT='优惠券表97';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_98   */
/******************************************/
CREATE TABLE `coup_coupon_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_98_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_98_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5728513121 DEFAULT CHARSET=utf8 COMMENT='优惠券表98';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_99   */
/******************************************/
CREATE TABLE `coup_coupon_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `passwd` varchar(100) NOT NULL COMMENT '密码',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `is_used` tinyint(4) NOT NULL COMMENT '是否已使用',
  `is_past` tinyint(4) NOT NULL COMMENT '是否已过期',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `start_date` datetime NOT NULL COMMENT '生效时间',
  `end_date` datetime NOT NULL COMMENT '失效时间',
  `create_date` datetime NOT NULL COMMENT '生成日期',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `use_date` datetime DEFAULT NULL COMMENT '使用时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `visible_time` datetime DEFAULT NULL COMMENT '优惠券可见时间',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券子批次ID',
  `receive_channel` int(11) DEFAULT NULL COMMENT '领取渠道',
  `track_code` text COMMENT '追踪码',
  `exchange_type` tinyint(4) DEFAULT NULL COMMENT '兑券方式：1-RMB，2-积分',
  `exchange_amount` bigint(20) DEFAULT NULL COMMENT '兑券价值（分）',
  `exchange_uuid` varchar(50) DEFAULT NULL COMMENT '兑券唯一标识：如买券订单号',
  `can_use_num` int(11) DEFAULT NULL COMMENT '可使用次数',
  `order_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店编号',
  `inflation_num` int(11) DEFAULT NULL COMMENT '膨胀次数',
  `extend1` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `extend2` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `extend3` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  `extend4` varchar(20) DEFAULT NULL COMMENT '扩展字段4',
  `extend5` varchar(20) DEFAULT NULL COMMENT '扩展字段5',
  `extend6` varchar(20) DEFAULT NULL COMMENT '扩展字段6',
  `extend7` varchar(20) DEFAULT NULL COMMENT '扩展字段7',
  `content` varchar(5000) DEFAULT NULL COMMENT 'JSON扩展字段',
  PRIMARY KEY (`id`),
  KEY `coup_coupon_99_idx_code` (`code`) USING BTREE,
  KEY `coup_coupon_99_idx_coupon_apply_id` (`coupon_apply_id`) USING BTREE,
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5701970641 DEFAULT CHARSET=utf8 COMMENT='优惠券表99';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_apply   */
/******************************************/
CREATE TABLE `coup_coupon_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) DEFAULT NULL COMMENT '批次编号',
  `proposer_id` int(11) DEFAULT NULL COMMENT '申请人id',
  `proposer_name` varchar(100) DEFAULT NULL COMMENT '申请人名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_code` varchar(50) DEFAULT NULL COMMENT '活动编号',
  `type_main_code` varchar(20) NOT NULL COMMENT '优惠券主体类型编号',
  `type_use_code` varchar(20) NOT NULL COMMENT '优惠券使用类型编号',
  `amount` int(11) NOT NULL COMMENT '申请数量',
  `remain_amount` int(11) NOT NULL COMMENT '剩余数量',
  `per_amount` int(11) NOT NULL COMMENT '单次发放数量',
  `warning_amount` int(11) DEFAULT '0' COMMENT '预警数量',
  `value` int(11) NOT NULL COMMENT '优惠券金额[单位:分]',
  `total_value` bigint(20) NOT NULL COMMENT '优惠券总金额[单位:分]',
  `quota` int(11) DEFAULT NULL COMMENT '限额[单位:分]',
  `limit_remark` varchar(5000) DEFAULT NULL,
  `limit_goods` tinyint(4) NOT NULL COMMENT '商品限制[0:不限 1:部分商品可用 -1:部分商品不可用]',
  `limit_goods_list` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `limit_goods_except` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `limit_ware_list` text COMMENT '商品列表',
  `limit_merchant` tinyint(4) NOT NULL COMMENT '商家限制[0:不限 1:部分商家可用 -1:部分商家不可用]',
  `limit_merchant_list` varchar(5000) CHARACTER SET latin1 DEFAULT NULL,
  `limit_store` tinyint(4) NOT NULL COMMENT '门店限制[0:不限 1:部分门店可用 -1:部分门店不可用]',
  `limit_store_list` varchar(5000) CHARACTER SET latin1 DEFAULT NULL,
  `limit_platform` varchar(20) NOT NULL DEFAULT '' COMMENT '使用平台限制(APP,M页,微商)',
  `limit_delivery_type` varchar(20) NOT NULL DEFAULT '' COMMENT '配送方式限制(配送,自提)',
  `limit_sales_type` varchar(50) DEFAULT NULL,
  `valid_date_type` tinyint(4) NOT NULL COMMENT '有效期类型[1:绝对时间 2:相对时间]',
  `valid_days` int(11) DEFAULT NULL COMMENT '有效天数',
  `delay_days` int(11) DEFAULT '0' COMMENT '延期天数',
  `start_date` datetime DEFAULT NULL COMMENT '起始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `access_key` varchar(100) DEFAULT NULL COMMENT '接入key',
  `secret_key` varchar(100) DEFAULT NULL COMMENT '接入秘钥',
  `style` varchar(500) DEFAULT NULL COMMENT '样式',
  `status_code` varchar(20) NOT NULL COMMENT '状态代码',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `limit_blacklist` tinyint(4) NOT NULL DEFAULT '0' COMMENT '批次的黑名单限制,0表示不限制;1表示限制.',
  `expired_delay_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券批次过期延期天数,目前业务要求只能是0到3的整数,包括边界值在内',
  `team_coup_type` int(11) DEFAULT NULL COMMENT '表示优惠券的拼团类型,如果批次没有限制拼团销售类型,此属性为null,如果限制了多种销售类型其中包括拼团,则此属性为1,表示通用券',
  `out_activity_link` varchar(1024) DEFAULT NULL COMMENT '外部系统的活动链接地址',
  `limit_blacklist_ids` varchar(500) DEFAULT NULL COMMENT '黑名单ID列表',
  `limit_whitelist_ids` varchar(500) DEFAULT NULL COMMENT '白名单ID列表',
  `max_value` int(11) DEFAULT '0' COMMENT '最大优惠金额',
  `limit_scene` tinyint(2) DEFAULT '1' COMMENT '使用场景限制 0:全部 1:线上 2:线下 （默认 1:线上）',
  `limit_superimpose` tinyint(2) NOT NULL DEFAULT '0' COMMENT '叠加限制 1 可叠加 0 不可叠加 默认0',
  `name` varchar(100) DEFAULT NULL COMMENT '批次名称',
  `received_app_msg_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否appPush消息',
  `received_app_msg` varchar(512) DEFAULT NULL COMMENT 'APP到账提醒消息内容',
  `mobile_msg_flag` tinyint(2) DEFAULT '0' COMMENT '0:不进行短消息提醒，1:短消息提醒',
  `received_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到账短消息提醒消息内容',
  `expired_warn_flag` tinyint(2) DEFAULT '0' COMMENT '0:不进行到期预警提醒，1:到期预警提醒',
  `expired_warn_hours` int(4) DEFAULT NULL COMMENT '预警时间(小时)',
  `expired_warn_app_enable` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_app_msg` varchar(200) DEFAULT NULL COMMENT '到期提醒APP消息内容',
  `expired_warn_mobile_enable` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:否，1:是',
  `expired_warn_mobile_msg` varchar(100) DEFAULT NULL COMMENT '到期提醒短消息的消息内容',
  `source` tinyint(2) DEFAULT '1' COMMENT '1:erp，2:来客',
  `belongs_vender` bigint(11) DEFAULT NULL COMMENT '信息所属商家ID',
  `first_amount` int(11) DEFAULT NULL COMMENT '初次申请数量',
  `ware_page_flag` tinyint(2) DEFAULT '0' COMMENT '是否潘多拉创建标志 0-优惠券系统 1-潘多拉系统',
  `label` varchar(10) DEFAULT NULL COMMENT '描述文案',
  `front_display_name` varchar(100) DEFAULT NULL COMMENT '前端展示名称',
  `limit_brand_list` varchar(5000) CHARACTER SET latin1 DEFAULT NULL COMMENT '品牌限制列表',
  `logo_link` varchar(1024) DEFAULT NULL COMMENT '品牌logo链接',
  `receive_entrance_limit` tinyint(2) DEFAULT NULL COMMENT '领券入口限制',
  `limit_rf_list` text COMMENT '物料编码列表',
  `received_mobile_url` varchar(128) DEFAULT NULL COMMENT '到账短信链接',
  `received_mobile_channel` int(10) DEFAULT NULL COMMENT '到账短信渠道',
  `coup_type` tinyint(4) DEFAULT '1' COMMENT '券类型[1-交易券 2-支付券]',
  `coupon_threshold_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '门槛限制类型 0不限制 1整单 2与使用商品相同',
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `activity_code` (`activity_code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`)
) ENGINE=InnoDB AUTO_INCREMENT=122432 DEFAULT CHARSET=utf8 COMMENT='优惠券申请表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_cus_record   */
/******************************************/
CREATE TABLE `coup_coupon_cus_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unuse_cus_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '-1' COMMENT '是否有效',
  `activity_id` bigint(20) DEFAULT '-1' COMMENT '对应的定向发券活动id',
  `file_name` varchar(100) DEFAULT '-1' COMMENT '上传用户文件的原始名称',
  `op_user_id` int(11) DEFAULT '-1' COMMENT '上传定向发券用户列表的erp操作用户id',
  `op_user_name` varchar(200) DEFAULT '' COMMENT '上传定向发券用户列表的erp操作用户名称',
  `from_file_code` varchar(32) DEFAULT '' COMMENT '上传用户文件的唯一编码',
  `amount` int(11) DEFAULT '0' COMMENT '上传用户文件对应的用户数量',
  `black_count` int(11) DEFAULT '0' COMMENT '上传用户文件对应的黑名单用户数量',
  `process_count` int(11) DEFAULT NULL COMMENT '美杜莎用户数',
  `exclude_count` int(11) DEFAULT NULL COMMENT '上传用户文件对应的排除商家用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9731 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_seq   */
/******************************************/
CREATE TABLE `coup_coupon_seq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coup_coupon_seq_idx_stub` (`stub`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18790133 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_sub_apply   */
/******************************************/
CREATE TABLE `coup_coupon_sub_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_apply_id` bigint(20) NOT NULL COMMENT '申请的批次上级ID',
  `users_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `sub_status_code` varchar(20) NOT NULL COMMENT '批次状态，和上级批次状态保持一致',
  `user_amount` int(11) NOT NULL DEFAULT '1' COMMENT '单用户发放数量',
  `wait_amount` int(11) DEFAULT '0' COMMENT '待发放数量，即单次申请数量',
  `sended_amount` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '已发放数量',
  `sended_users` int(11) DEFAULT '0' COMMENT '已发放用户数',
  `sub_start_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开始发放时间',
  `sub_end_date` datetime DEFAULT NULL COMMENT '结束发放时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `send_type` int(11) DEFAULT '0' COMMENT '0表示即时发券,1表示定时发券',
  `timing_send_date` datetime DEFAULT NULL COMMENT '如果send_type为1则此字段表示定时执行的时间点',
  `medusa_id` bigint(20) DEFAULT NULL COMMENT '美杜莎活动id',
  PRIMARY KEY (`id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_modify_time` (`modify_time`)
) ENGINE=InnoDB AUTO_INCREMENT=34762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_coupon_unuse_cus   */
/******************************************/
CREATE TABLE `coup_coupon_unuse_cus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unuse_cus_apply_code` varchar(32) NOT NULL DEFAULT '' COMMENT '与用户关联的唯一标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `activity_id` bigint(20) DEFAULT '-1' COMMENT '对应的定向发券活动id',
  `file_name` varchar(100) DEFAULT '' COMMENT '上传用户文件的原始名称',
  `op_user_id` int(11) DEFAULT '-1' COMMENT '上传定向发券用户列表的erp操作用户id',
  `op_user_name` varchar(100) DEFAULT '' COMMENT '上传定向发券用户列表的erp操作用户名称',
  `from_file_code` varchar(32) DEFAULT '' COMMENT '上传用户文件的唯一编码',
  `amount` int(11) DEFAULT '0' COMMENT '上传用户文件对应的用户数量',
  `black_count` int(11) DEFAULT '0' COMMENT '上传用户文件对应的黑名单用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36272 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_data_dict   */
/******************************************/
CREATE TABLE `coup_data_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` varchar(20) NOT NULL COMMENT '类型代码',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `code` varchar(20) NOT NULL COMMENT '字典代码',
  `parent_code` varchar(20) DEFAULT NULL COMMENT '父级字典代码',
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `order` smallint(6) DEFAULT NULL COMMENT '序号',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updator` varchar(20) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `type_code` (`type_code`),
  KEY `code` (`code`),
  KEY `idx_create_date` (`create_date`),
  KEY `idx_update_date` (`update_date`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='数据字典表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_export_task   */
/******************************************/
CREATE TABLE `coup_export_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_type` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `biz_desc` varchar(255) DEFAULT NULL COMMENT '业务描述',
  `context` text COMMENT '业务上下文',
  `status` varchar(50) DEFAULT NULL COMMENT '状态',
  `attach_url` varchar(255) DEFAULT NULL COMMENT '导出文件URL',
  `opt_user_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `opt_user_name` varchar(255) DEFAULT NULL COMMENT '操作人名称',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `fail_reason` varchar(3000) DEFAULT NULL COMMENT '执行失败原因',
  `finish_time` datetime DEFAULT NULL COMMENT '任务完成时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28921 DEFAULT CHARSET=utf8 COMMENT='优惠券导出任务相关';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_feature_apply_cfg   */
/******************************************/
CREATE TABLE `coup_feature_apply_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version_id` bigint(20) NOT NULL COMMENT '版本ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `vender_type` int(11) NOT NULL DEFAULT '0' COMMENT '商家类型：1-商家，2-集团',
  `apply_feature_items` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '批次特征配置项目列表，JSON字符串',
  `create_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `creater_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `update_id` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电商配置化—批次特征表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_feature_common_log   */
/******************************************/
CREATE TABLE `coup_feature_common_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `log_type` int(11) DEFAULT NULL COMMENT '1-版本特征表 2-批次特征表 3-商家特征表',
  `opt_type` int(11) DEFAULT NULL COMMENT '1-新建 2-修改 3-删除  等',
  `biz_id` bigint(20) DEFAULT NULL COMMENT '业务ID',
  `opt_detail` text COLLATE utf8mb4_unicode_ci COMMENT '"自定义记录信息字段(json格式字符串)\n"',
  `create_id` bigint(20) DEFAULT NULL,
  `creater_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电商配置化-日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_feature_vender_cfg   */
/******************************************/
CREATE TABLE `coup_feature_vender_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(11) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家名称',
  `vender_feature_items` text COLLATE utf8mb4_unicode_ci COMMENT '商家特征配置项目，JSON字符串',
  `create_id` bigint(11) NOT NULL,
  `creater_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_id` bigint(20) DEFAULT NULL,
  `update_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电商配置化—商家版本关联表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_feature_version_cfg   */
/******************************************/
CREATE TABLE `coup_feature_version_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本名称',
  `version_desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '版本描述',
  `version_feature_items` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '当前版本配置特征项',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `updater_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性，1：有效；-1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='保存不同商家的优惠券建券页面的配置';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_give_manual   */
/******************************************/
CREATE TABLE `coup_give_manual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `activity_id` bigint(20) NOT NULL COMMENT '优惠券活动id',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请批次id',
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编码',
  `give_date` datetime DEFAULT NULL COMMENT '发券时间',
  `op_user_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) DEFAULT NULL COMMENT '操作人',
  `give_reason` varchar(900) DEFAULT NULL COMMENT '发券原因',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id` (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78645001 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_giveout_fail   */
/******************************************/
CREATE TABLE `coup_giveout_fail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `coupon_apply_id` bigint(20) DEFAULT NULL COMMENT '优惠券申请单号',
  `coupon_sub_apply_id` bigint(20) DEFAULT '0' COMMENT '子批次ID',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT '优惠券编号',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `fail_type` tinyint(4) NOT NULL COMMENT '失败类型',
  `provide_type` int(11) NOT NULL COMMENT '发放方式',
  `provide_date` datetime NOT NULL COMMENT '发放日期',
  `err_msg` varchar(100) DEFAULT NULL COMMENT '错误信息',
  `re_times` int(11) NOT NULL DEFAULT '0' COMMENT '重发次数',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `cusid` (`cus_id`),
  KEY `coupon_apply_id` (`coupon_apply_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65171 DEFAULT CHARSET=utf8 COMMENT='优惠券发放失败表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_limit_store   */
/******************************************/
CREATE TABLE `coup_limit_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次主键',
  `store_name` varchar(100) DEFAULT NULL COMMENT '门店名称',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家编号',
  `vender_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `yn` int(11) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `index_apply_id` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267401081 DEFAULT CHARSET=utf8 COMMENT='优惠券门店限制表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_limit_vender   */
/******************************************/
CREATE TABLE `coup_limit_vender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次主键',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `yn` int(11) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `index_apply_id` (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22258601 DEFAULT CHARSET=utf8 COMMENT='优惠券商家限制表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_apply_append   */
/******************************************/
CREATE TABLE `coup_log_apply_append` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_append_id` bigint(20) NOT NULL COMMENT '批次数量追加申请ID',
  `op_type` tinyint(4) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `apply_append_status` tinyint(1) NOT NULL COMMENT '申请状态',
  `create_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102441 DEFAULT CHARSET=utf8 COMMENT='优惠券数量追加申请日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_apply   */
/******************************************/
CREATE TABLE `coup_log_coupon_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_apply_id` bigint(20) NOT NULL COMMENT '优惠券申请单号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_apply_status` varchar(100) NOT NULL COMMENT '申请状态',
  `create_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `before_apply_info` text COMMENT '优惠券批次日志中保存的修改前的批次信息',
  `after_apply_info` text COMMENT '优惠券批次日志中保存的修改后的批次信息',
  PRIMARY KEY (`id`),
  KEY `coupon_apply_id` (`coupon_apply_id`),
  KEY `idx_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=18768081 DEFAULT CHARSET=utf8 COMMENT='优惠券申请日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` bigint(20) NOT NULL COMMENT '优惠券id',
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_00   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_00` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_00_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_00_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表00';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_01   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_01_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_01_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表01';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_02   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_02` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_02_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_02_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表02';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_03   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_03` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_03_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_03_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表03';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_04   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_04` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_04_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_04_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表04';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_05   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_05` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_05_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_05_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表05';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_06   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_06` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_06_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_06_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表06';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_07   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_07_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_07_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表07';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_08   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_08` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_08_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_08_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表08';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_09   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_09` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_09_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_09_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表09';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_10   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_10_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_10_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表10';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_11   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_11_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_11_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表11';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_12   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_12_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_12_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表12';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_13   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_13_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_13_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表13';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_14   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_14_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_14_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表14';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_15   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_15_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_15_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表15';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_16   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_16_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_16_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表16';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_17   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_17_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_17_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表17';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_18   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_18_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_18_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表18';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_19   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_19_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_19_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表19';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_20   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_20_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_20_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表20';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_21   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_21_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_21_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表21';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_22   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_22_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_22_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表22';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_23   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_23_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_23_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表23';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_24   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_24_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_24_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表24';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_25   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_25_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_25_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表25';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_26   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_26_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_26_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表26';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_27   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_27_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_27_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表27';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_28   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_28_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_28_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表28';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_29   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_29_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_29_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表29';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_30   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_30_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_30_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表30';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_31   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_31_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_31_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表31';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_32   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_32_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_32_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表32';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_33   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_33_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_33_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表33';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_34   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_34_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_34_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表34';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_35   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_35_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_35_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表35';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_36   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_36_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_36_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表36';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_37   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_37_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_37_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表37';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_38   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_38_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_38_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表38';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_39   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_39_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_39_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表39';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_40   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_40_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_40_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表40';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_41   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_41_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_41_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表41';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_42   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_42_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_42_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表42';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_43   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_43_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_43_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表43';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_44   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_44_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_44_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表44';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_45   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_45_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_45_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表45';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_46   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_46_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_46_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表46';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_47   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_47_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_47_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表47';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_48   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_48_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_48_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表48';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_49   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_49_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_49_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表49';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_50   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_50_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_50_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表50';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_51   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_51_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_51_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表51';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_52   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_52_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_52_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表52';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_53   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_53_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_53_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表53';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_54   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_54_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_54_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表54';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_55   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_55_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_55_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表55';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_56   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_56_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_56_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表56';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_57   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_57_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_57_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表57';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_58   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_58_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_58_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表58';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_59   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_59_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_59_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表59';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_60   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_60_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_60_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表60';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_61   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_61_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_61_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表61';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_62   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_62_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_62_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表62';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_63   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_63_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_63_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表63';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_64   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_64_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_64_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表64';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_65   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_65_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_65_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表65';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_66   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_66_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_66_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表66';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_67   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_67_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_67_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表67';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_68   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_68_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_68_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表68';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_69   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_69_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_69_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表69';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_70   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_70_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_70_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表70';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_71   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_71_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_71_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表71';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_72   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_72_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_72_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表72';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_73   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_73_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_73_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表73';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_74   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_74_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_74_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表74';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_75   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_75_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_75_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表75';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_76   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_76_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_76_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表76';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_77   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_77_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_77_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表77';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_78   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_78_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_78_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表78';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_79   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_79_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_79_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表79';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_80   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_80_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_80_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表80';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_81   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_81_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_81_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表81';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_82   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_82_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_82_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表82';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_83   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_83_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_83_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表83';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_84   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_84_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_84_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表84';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_85   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_85_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_85_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表85';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_86   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_86_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_86_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表86';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_87   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_87_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_87_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表87';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_88   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_88_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_88_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表88';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_89   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_89_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_89_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表89';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_90   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_90_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_90_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表90';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_91   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_91_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_91_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表91';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_92   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_92_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_92_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表92';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_93   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_93_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_93_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表93';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_94   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_94_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_94_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表94';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_95   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_95_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_95_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表95';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_96   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_96_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_96_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表96';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_97   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_97_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_97_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表97';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_98   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_98_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_98_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表98';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_99   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(50) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  KEY ` coup_log_coupon_flow_99_coupon_id` (`coupon_id`),
  KEY ` coup_log_coupon_flow_99_coupon_code` (`coupon_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券流程跟踪表99';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_seq   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_seq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stub` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coup_log_coupon_flow_seq_idx_stub` (`stub`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55081386 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_member   */
/******************************************/
CREATE TABLE `coup_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exit_erp_account` varchar(255) NOT NULL DEFAULT '' COMMENT '离职人erp账号',
  `exit_erp_account_name` varchar(255) NOT NULL DEFAULT '' COMMENT '离职人erp姓名',
  `exit_erp_account_id` bigint(20) unsigned NOT NULL COMMENT '离职人erpID',
  `handover_erp_account` varchar(255) NOT NULL DEFAULT '' COMMENT '交接人erp账号',
  `handover_erp_account_name` varchar(255) NOT NULL DEFAULT '' COMMENT '交接人erp姓名',
  `handover_erp_account_id` bigint(20) unsigned NOT NULL COMMENT '离职人erpID',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT NULL COMMENT '审批状态',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_modify_date_task   */
/******************************************/
CREATE TABLE `coup_modify_date_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `name` varchar(512) NOT NULL COMMENT '任务名称',
  `apply_id` bigint(20) NOT NULL,
  `sub_apply_id` bigint(20) DEFAULT NULL COMMENT '定向发券子任务ID或者潘多拉活动ID',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `end_date` datetime NOT NULL COMMENT '结束时间',
  `status` tinyint(4) NOT NULL COMMENT '状态: 1:处理中，2:失败, 3:成功',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `num` int(11) DEFAULT NULL COMMENT '需要处理的数量',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
  `create_name` varchar(100) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `apply_id` (`apply_id`) USING BTREE,
  KEY `sub_apply_id` (`sub_apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12201 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_product_ad   */
/******************************************/
CREATE TABLE `coup_product_ad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_type` tinyint(4) DEFAULT NULL COMMENT '1:SKU,2:物料',
  `product` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品（SKU/物料）',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `allow_and_discount_mode` tinyint(4) DEFAULT NULL COMMENT '折让类型 ：AllowAndDiscountModeEnum',
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '折让比例/折让金额',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `ApplyIdAndProduct` (`apply_id`,`product`) USING BTREE,
  KEY `Product` (`product`) USING BTREE,
  KEY `ProductName` (`product_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='批次商品折让信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_serial   */
/******************************************/
CREATE TABLE `coup_serial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sign` varchar(20) DEFAULT NULL COMMENT '标识',
  `growth` bigint(20) NOT NULL DEFAULT '0' COMMENT '增长值',
  PRIMARY KEY (`id`),
  KEY `sign` (`sign`)
) ENGINE=InnoDB AUTO_INCREMENT=11721 DEFAULT CHARSET=utf8 COMMENT='优惠券生成序号表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_third_company   */
/******************************************/
CREATE TABLE `coup_third_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '三方公司主键ID',
  `company_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '三方公司名称',
  `company_status` int(4) DEFAULT '1' COMMENT '状态：1正常 -1停用',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COMMENT='三方公司表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_third_company_log   */
/******************************************/
CREATE TABLE `coup_third_company_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` bigint(20) NOT NULL COMMENT '三方公司ID',
  `operate_content` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作内容',
  `operator` varchar(128) DEFAULT NULL COMMENT '操作人',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(4) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 COMMENT='三方公司日志表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_vender_config   */
/******************************************/
CREATE TABLE `coup_vender_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_type` tinyint(1) NOT NULL COMMENT '配置形式 1-指定商家 2-商家类型',
  `item_id` bigint(11) NOT NULL COMMENT '配置项ID 商家ID或者商家类型ID',
  `item_name` varchar(100) NOT NULL COMMENT '配置项名称 商家名称或者商家类型名称',
  `config_range` tinyint(1) NOT NULL COMMENT '配置范围 0-全局固定 1-用户指定批次',
  `exclude_charge_type` varchar(50) DEFAULT '' COMMENT '排除的计费类型 字符串逗号隔离 1-营销计费 2-积分兑券 3-合作售券 4-异业兑券',
  `income` tinyint(1) NOT NULL COMMENT '配置形式 0-优惠券不计入收入 1-优惠券计入收入',
  `front_show` tinyint(1) NOT NULL COMMENT '前端是否显示 0-不显示 1-显示',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `update_name` varchar(100) DEFAULT NULL COMMENT '更新人名称',
  `dynamic_extend_attr` varchar(1000) DEFAULT NULL COMMENT '动态扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqx_item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家优惠券配置表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_vender_store_apply_rel   */
/******************************************/
CREATE TABLE `coup_vender_store_apply_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(100) NOT NULL COMMENT '缓存key',
  `apply_ids` text COMMENT '批次ID集合，逗号隔开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqx_cache_key` (`cache_key`)
) ENGINE=InnoDB AUTO_INCREMENT=230361 DEFAULT CHARSET=utf8 COMMENT='商家门店可领券批次关系表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_ware_apply_rel   */
/******************************************/
CREATE TABLE `coup_ware_apply_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(64) NOT NULL COMMENT '缓存key',
  `apply_ids` text COMMENT '批次ID集合',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqx_cache_key` (`cache_key`)
) ENGINE=InnoDB AUTO_INCREMENT=92961 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coupon_amount_item   */
/******************************************/
CREATE TABLE `coupon_amount_item` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(50) DEFAULT NULL COMMENT '优惠券编码',
  `item_id` bigint(19) DEFAULT NULL COMMENT '优惠项ID',
  `item_type` int(10) DEFAULT NULL COMMENT '优惠项类型 [1-券, 2-促销]',
  `item_source` int(10) DEFAULT NULL COMMENT '优惠项来源 [1-商家内部, 2-商家外部, 3-平台]',
  `item_value` bigint(19) DEFAULT NULL COMMENT '优惠金额；单位 分',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `coupon_code` (`coupon_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13200961 DEFAULT CHARSET=utf8 COMMENT='券价值明细';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coupon_cache   */
/******************************************/
CREATE TABLE `coupon_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '缓存内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `yn` tinyint(4) NOT NULL COMMENT '有效?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279083 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coupon_superimpose_body   */
/******************************************/
CREATE TABLE `coupon_superimpose_body` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body_name` varchar(64) DEFAULT NULL COMMENT '主体名',
  `body_idx` int(11) DEFAULT NULL COMMENT '显示顺序',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '是否是有效记录 1有效 -1无效',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '集团id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8 COMMENT='叠加主体表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coupon_use_record   */
/******************************************/
CREATE TABLE `coupon_use_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT '优惠券码',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '批次编号',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家编号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `use_time` datetime DEFAULT NULL COMMENT '核销时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用券用户id',
  `operator_erp` varchar(100) DEFAULT NULL COMMENT '核销优惠券人员erp',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据有效性：-1-无效，1-有效',
  `concurrent_version` bigint(20) NOT NULL DEFAULT '1' COMMENT '当前数据版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_coupon_code` (`coupon_code`) USING BTREE,
  KEY `idx_apply_id` (`apply_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40439121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='核销记录表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = laike_vender_permission   */
/******************************************/
CREATE TABLE `laike_vender_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(11) DEFAULT NULL COMMENT '商家ID',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `permission_ids` varchar(100) DEFAULT NULL COMMENT '商家权限ID集合',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `update_name` varchar(255) DEFAULT NULL COMMENT '申请人名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_id` (`vender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='来客平台商家权限表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = message_send_record   */
/******************************************/
CREATE TABLE `message_send_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '发送的消息记录id',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `cus_id` bigint(20) NOT NULL COMMENT '发送消息关联的用户id',
  `send_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人id',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `IDX_TASK_ID` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = message_send_task   */
/******************************************/
CREATE TABLE `message_send_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_name` varchar(200) NOT NULL COMMENT '任务名称',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_code` varchar(50) NOT NULL COMMENT '优惠券活动编码',
  `activity_name` varchar(100) NOT NULL COMMENT '优惠券活动名称',
  `task_status` int(20) NOT NULL COMMENT '任务状态，1初始，2待发放，3发放中，4发放完毕，5作废，6强制结束',
  `task_send_type` int(20) NOT NULL COMMENT '发送方式：0全部发送，1app消息发送，2短信消息发送',
  `app_message` varchar(1024) DEFAULT NULL COMMENT 'app信息',
  `mobile_message` varchar(1024) DEFAULT NULL COMMENT '短信信息',
  `task_start_time` datetime NOT NULL COMMENT '任务启动时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人id',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `apply_ids` varchar(100) DEFAULT NULL COMMENT '需要发送消息的批次id集合',
  `source` tinyint(2) DEFAULT '1' COMMENT '1:erp，2:来客',
  `belongs_vender` bigint(11) DEFAULT NULL COMMENT '信息所属商家ID',
  `mobile_url` varchar(128) DEFAULT NULL COMMENT '短信长链接',
  `mobile_url_short` varchar(32) DEFAULT NULL COMMENT '短信短链接',
  `mobile_channel` int(11) DEFAULT NULL COMMENT '短信渠道',
  `medusa_id` bigint(20) DEFAULT NULL COMMENT '美杜莎活动id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6861 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = no_vip_code   */
/******************************************/
CREATE TABLE `no_vip_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `task_id` int(11) NOT NULL COMMENT '导出任务ID',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生成的条形码',
  `code_encry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加密后的条形码',
  `encry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密因子',
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券券码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_encry` (`code_encry`) USING BTREE COMMENT '根据加密码查询数据',
  KEY `code` (`code`) USING BTREE COMMENT '根据原始码查询数据',
  KEY `taskIdAndApplyId` (`apply_id`,`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52921203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = no_vip_code_bak   */
/******************************************/
CREATE TABLE `no_vip_code_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `task_id` int(11) NOT NULL COMMENT '导出任务ID',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生成的条形码',
  `code_encry` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '加密后的条形码',
  `encry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密因子',
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券券码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_encry` (`code_encry`) USING BTREE COMMENT '根据加密码查询数据',
  KEY `code` (`code`) USING BTREE COMMENT '根据原始码查询数据',
  KEY `taskIdAndApplyId` (`apply_id`,`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74622401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = no_vip_export_task   */
/******************************************/
CREATE TABLE `no_vip_export_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `created` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modified` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '1:有效，-1:无效',
  `status` tinyint(4) NOT NULL COMMENT '0:新建任务,1:生成数据中,2:上传数据中,3:处理成功,4:处理失败',
  `type` tinyint(4) NOT NULL COMMENT '1:券码,2:条形码,3:短链接',
  `export_num` bigint(20) NOT NULL COMMENT '导出数量',
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道名称',
  `download_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接地址',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '申请人名称',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE COMMENT '根据任务名称查询',
  KEY `create_name` (`created_name`) USING BTREE COMMENT '根据创建者名称查询',
  KEY `created` (`created`) USING BTREE COMMENT '创建时间',
  KEY `apply_id` (`apply_id`) USING BTREE COMMENT '批次ID查询'
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = no_vip_token   */
/******************************************/
CREATE TABLE `no_vip_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求的token',
  `coupon_codes` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '券码以逗号隔开',
  `type` tinyint(4) DEFAULT '1' COMMENT '1:非会员用券请求token',
  `status` tinyint(4) NOT NULL COMMENT '1：表示核销成功  -1：回滚成功',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_token` (`token`) COMMENT 'token索引'
) ENGINE=InnoDB AUTO_INCREMENT=10000643 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='非会员用券订单维度的token记录表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = scattered_provide_sub_task   */
/******************************************/
CREATE TABLE `scattered_provide_sub_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scattered_task_id` bigint(20) NOT NULL COMMENT '零散发券任务id',
  `send_main_id` bigint(20) DEFAULT NULL COMMENT '定向发放主任务id',
  `status` tinyint(4) DEFAULT '0' COMMENT '发放状态：0-待发放，1-发放异常，2-发放完成',
  `status_desc` varchar(100) DEFAULT NULL COMMENT '用户异常状态说明-如风控拦截',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`scattered_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62361 DEFAULT CHARSET=utf8 COMMENT='零散发券子任务表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = scattered_provide_task   */
/******************************************/
CREATE TABLE `scattered_provide_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键-主任务ID',
  `task_name` varchar(100) NOT NULL COMMENT '发放任务名称',
  `status_code` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务状态 1-初始 2-待发放 4-发放中止 8-发放中 16-发放完毕 32-发放异常 64-发放批次已经过期',
  `status_desc` varchar(200) DEFAULT NULL COMMENT '任务状态描述 特别是发放失败时的异常描述 如批次已过期，批次剩余数量不足等',
  `send_total_users` int(11) DEFAULT '0' COMMENT '总发放用户数',
  `send_total_coupons` int(11) DEFAULT '0' COMMENT '预计发放优惠券总数',
  `sended_total_coupons` int(11) DEFAULT '0' COMMENT '实际发放优惠券总数',
  `main_start_date` datetime DEFAULT NULL COMMENT '开始发放时间',
  `main_end_date` datetime DEFAULT NULL COMMENT '结束发放时间',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效 -1无效 1有效',
  `task_type` tinyint(4) DEFAULT '1' COMMENT '活动类型：1-多点活动，2-商家活动',
  `company_id` bigint(20) DEFAULT NULL COMMENT '创建人所属公司集团编号',
  `company_name` varchar(100) DEFAULT NULL COMMENT '创建人所属公司集团名称',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '创建人所属商家编号',
  `vendor_name` varchar(100) DEFAULT NULL COMMENT '创建人所属商家名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4921 DEFAULT CHARSET=utf8 COMMENT='零散发券任务表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = scattered_provide_user   */
/******************************************/
CREATE TABLE `scattered_provide_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scattered_task_id` bigint(20) NOT NULL COMMENT '零散发券任务id',
  `sub_task_id` bigint(20) NOT NULL COMMENT '零散发券子任务id',
  `main_task_cus_code` varchar(32) NOT NULL COMMENT '主任务与用户关联的唯一标识UUID',
  `batch_id` bigint(20) DEFAULT NULL COMMENT '批次ID',
  `send_num` int(11) DEFAULT NULL COMMENT '发券数量',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `cus_tel` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`scattered_task_id`,`sub_task_id`),
  KEY `idx_main_code` (`main_task_cus_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16446561 DEFAULT CHARSET=utf8 COMMENT='零散发券用户明细表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_coupon_cus_info   */
/******************************************/
CREATE TABLE `send_coupon_cus_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_record_id` bigint(20) NOT NULL COMMENT '优惠券上传发放用户记录ID',
  `main_task_cus_code` varchar(32) NOT NULL COMMENT '主任务与用户关联的唯一标识UUID',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  `cus_account` varchar(100) DEFAULT NULL COMMENT '客户账号',
  `cus_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `cus_group` int(11) DEFAULT NULL COMMENT '分组ID',
  `cus_tel` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `cus_reg_channel` int(11) DEFAULT NULL COMMENT '用户注册渠道',
  `cus_status` tinyint(4) DEFAULT '0' COMMENT '用户状态 0-正常 1-注册渠道异常 2-黑名单用户',
  `cus_status_desc` varchar(100) DEFAULT NULL COMMENT '用户异常状态说明-如风控拦截',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_query_page` (`id`,`cus_record_id`,`main_task_cus_code`,`cus_status`) USING BTREE,
  KEY `index_query_page_1` (`main_task_cus_code`,`cus_record_id`,`cus_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=371454087801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券发放用户信息表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_coupon_cus_record   */
/******************************************/
CREATE TABLE `send_coupon_cus_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_task_id` bigint(20) DEFAULT NULL COMMENT '主任务ID',
  `main_task_cus_code` varchar(32) NOT NULL COMMENT '主任务与用户关联的唯一标识UUID',
  `collect_user_type` tinyint(4) DEFAULT '0' COMMENT '采集用户方式 1-上传用户清单,2-美杜莎用户群,3-单个用户',
  `users_status_code` varchar(20) NOT NULL COMMENT '采集状态 1-待采集 2-采集中 3-采集完成 4-采集中止 5-采集异常 6-发放完毕 7-备份成功',
  `collect_user_source` varchar(100) DEFAULT '' COMMENT '采集用户的来源 用户清单名称或者美杜莎用户组ID',
  `user_group_name` varchar(50) DEFAULT NULL COMMENT '采集用户群名',
  `medusa_task_id` varchar(50) DEFAULT NULL COMMENT '美杜莎采集任务ID',
  `actual_user_count` int(11) DEFAULT NULL COMMENT '实际采集用户数',
  `collect_user_count` int(11) DEFAULT '0' COMMENT '采集用户数',
  `black_count` int(11) DEFAULT '0' COMMENT '上传用户文件对应的黑名单用户数量',
  `exclude_count` int(11) DEFAULT '0' COMMENT '上传用户文件对应的排除商家用户数量',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效1-有效 -1 无效',
  PRIMARY KEY (`id`),
  KEY `index_main_task_cus_code` (`main_task_cus_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2227641 DEFAULT CHARSET=utf8 COMMENT='优惠券上传发放用户记录表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_coupon_main_task   */
/******************************************/
CREATE TABLE `send_coupon_main_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键-主任务ID',
  `main_task_name` varchar(100) NOT NULL COMMENT '发放主任务名称',
  `upload_user_type` tinyint(4) DEFAULT '0' COMMENT '上传用户方式 1-上传用户清单,2-用户群,3-单个用户',
  `send_type` tinyint(4) DEFAULT '0' COMMENT '发放方式 0-及时发券,1-定时发券,2-预发放券',
  `send_date` datetime DEFAULT NULL COMMENT '定时发券时间或者预发券可见时间',
  `main_status_code` varchar(20) NOT NULL COMMENT '任务状态 1-初始 2-待发放 4-发放中止 8-发放中 16-发放完毕 32-发放异常 64-发放批次已经过期',
  `main_status_desc` varchar(500) DEFAULT NULL COMMENT '任务状态描述 特别是发放失败时的异常描述 如批次已过期，批次剩余数量不足等',
  `send_apply_ids` varchar(100) DEFAULT NULL COMMENT '需要发送的批次id集合',
  `send_total_users` int(11) DEFAULT '0' COMMENT '总发放用户数',
  `send_total_coupons` int(11) DEFAULT '0' COMMENT '预计发放优惠券总数',
  `sended_total_coupons` int(11) DEFAULT '0' COMMENT '实际发放优惠券总数',
  `main_start_date` datetime DEFAULT NULL COMMENT '主任务开始发放时间',
  `main_end_date` datetime DEFAULT NULL COMMENT '主任务结束发放时间',
  `msg_flag` tinyint(4) DEFAULT '0' COMMENT '是否有消息需要发送',
  `loop_parent_id` bigint(20) DEFAULT NULL COMMENT '循环子主任务时存在该值 为父主任务ID',
  `send_loop` tinyint(4) DEFAULT '0' COMMENT '是否为循环发券任务 0-否 1-是',
  `send_loop_count` tinyint(4) DEFAULT '0' COMMENT '循环次数',
  `send_loop_interval` tinyint(4) DEFAULT '0' COMMENT '循环间隔',
  `send_loop_start_date` datetime DEFAULT NULL COMMENT '循环开始时间(第一次发放时间)',
  `send_loop_end_date` datetime DEFAULT NULL COMMENT '循环结束时间(第一次发放时间往后推移 循环次数*循环间隔 天数）',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效 -1无效 1有效',
  `task_type` tinyint(4) DEFAULT '1' COMMENT '活动类型：1-多点活动，2-商家活动',
  `company_id` bigint(20) DEFAULT NULL COMMENT '创建人所属公司集团编号',
  `company_name` varchar(100) DEFAULT NULL COMMENT '创建人所属公司集团名称',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '创建人所属商家编号',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '创建人所属商家名称',
  `risk_control` int(4) DEFAULT NULL COMMENT '风控黑名单过滤方式：0-不过滤， 1-风控黑名单新接口',
  `task_flag` tinyint(4) DEFAULT '0' COMMENT '任务类型：0-默认，1-零散发券',
  `secret_safe` tinyint(4) DEFAULT '0' COMMENT '过滤隐私保护用户(v9)：0-不过滤， 1-过滤',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_send_apply_ids` (`send_apply_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1866801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券发放主任务表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_coupon_sub_task   */
/******************************************/
CREATE TABLE `send_coupon_sub_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键-子任务ID',
  `sub_task_name` varchar(100) DEFAULT NULL COMMENT '发放子任务名称',
  `main_task_id` bigint(20) DEFAULT NULL COMMENT '主任务ID',
  `send_apply_ids` varchar(100) DEFAULT NULL COMMENT '子任务需要发送的批次id集合',
  `send_scale` int(11) NOT NULL COMMENT '发放比例 如20%',
  `send_user_nums` int(11) NOT NULL DEFAULT '1' COMMENT '单用户发放数量',
  `send_users` int(11) DEFAULT '0' COMMENT '发放用户数',
  `wait_coupons` int(11) DEFAULT '0' COMMENT '待发放优惠券数',
  `sended_coupons` int(11) DEFAULT '0' COMMENT '已发放优惠券数',
  `sub_status_code` varchar(20) NOT NULL COMMENT '任务状态 1-初始 2-待发放 4-发放中止 8-发放中 16-发放完毕 32-发放异常 64-发放批次已经过期',
  `sub_status_desc` varchar(100) DEFAULT NULL COMMENT '任务状态描述 特别是发放失败时的异常描述 如批次已过期，批次剩余数量不足等',
  `sub_start_date` datetime DEFAULT NULL COMMENT '开始发放时间',
  `sub_end_date` datetime DEFAULT NULL COMMENT '结束发放时间',
  `received_app_msg_flag` tinyint(4) DEFAULT '1' COMMENT '是否appPush消息',
  `received_app_msg` varchar(1024) DEFAULT NULL COMMENT 'APP到账提醒消息内容JSON格式',
  `mobile_msg_flag` tinyint(4) DEFAULT '0' COMMENT '0:不进行短消息提醒，1:短消息提醒',
  `received_mobile_msg` varchar(1024) DEFAULT NULL COMMENT '到账短消息提醒消息内容JSON格式',
  `medusa_id` bigint(20) DEFAULT NULL COMMENT '全局美杜莎活动id 当该字段存在时，忽略下面的美杜莎ID集合',
  `send_apply_medusa_ids` varchar(500) DEFAULT NULL COMMENT '批次ID 美杜莎iD map的json格式',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_send_apply_id` (`send_apply_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2089441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券发放子任务表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_message_main_task   */
/******************************************/
CREATE TABLE `send_message_main_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主任务id',
  `main_task_name` varchar(200) NOT NULL COMMENT '任务名称',
  `apply_ids` varchar(100) NOT NULL COMMENT '需要发送消息的批次id集合',
  `task_status_code` varchar(20) NOT NULL COMMENT '任务状态 1-初始 2-待发放 4-发放中 8-发放结束 16-发放中止 32-发放异常',
  `task_status_desc` varchar(100) DEFAULT NULL COMMENT '任务状态描述 特别是发放失败时的异常描述 ',
  `main_start_date` datetime DEFAULT NULL COMMENT '子任务开始发放时间',
  `main_end_date` datetime DEFAULT NULL COMMENT '子任务结束发放时间',
  `task_send_type` tinyint(4) NOT NULL COMMENT '发送方式：0全部发送，1app消息发送，2短信消息发送',
  `app_message` varchar(1024) DEFAULT NULL COMMENT 'app信息',
  `mobile_message` varchar(1024) DEFAULT NULL COMMENT '短信信息',
  `mobile_url` varchar(128) DEFAULT NULL COMMENT '短信长链接',
  `mobile_url_short` varchar(32) DEFAULT NULL COMMENT '短信短链接',
  `mobile_channel` int(11) DEFAULT NULL COMMENT '短信渠道',
  `task_start_time` datetime NOT NULL COMMENT '任务启动时间',
  `medusa_id` bigint(20) DEFAULT NULL COMMENT '美杜莎活动id',
  `send_total_msgs` int(11) DEFAULT '0' COMMENT '发放推送消息总数',
  `created_id` int(11) NOT NULL COMMENT '申请人id',
  `created_name` varchar(100) NOT NULL COMMENT '申请人名称',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_name` varchar(100) DEFAULT NULL COMMENT '修改人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效',
  `owner_type` tinyint(4) DEFAULT NULL COMMENT '任务类型1-多点任务 2-商家任务',
  `company_group_id` bigint(20) DEFAULT NULL COMMENT '集团公司ID 商家任务才有',
  `task_type` tinyint(4) DEFAULT NULL COMMENT '消息任务类型：1-到账提醒 2-到期提醒 3-用券提醒',
  `coupon_sub_apply_id` bigint(20) DEFAULT NULL COMMENT '定向发券子任务ID 到期提醒场景使用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_applyId_status_time` (`apply_ids`,`task_status_code`,`task_start_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=521521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='优惠券消息发送任务主表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_third_coupon_sub_task   */
/******************************************/
CREATE TABLE `send_third_coupon_sub_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thrid_task_id` bigint(20) DEFAULT NULL COMMENT '发券主表ID',
  `cus_ids` text COLLATE utf8mb4_unicode_ci COMMENT '发券用户ID， 逗号分隔',
  `status_code` int(11) DEFAULT NULL COMMENT '任务状态:1-初始，2-发放中，4-发放完毕，8-发放异常',
  `error_msg` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_third_task_id` (`thrid_task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = send_third_coupon_task   */
/******************************************/
CREATE TABLE `send_third_coupon_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_uuid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '发券任务ID',
  `channel` int(11) NOT NULL COMMENT '发券渠道',
  `apply_id` bigint(20) NOT NULL COMMENT '批次ID',
  `task_status` int(11) NOT NULL DEFAULT '0' COMMENT '任务状态:1-初始，2-发放中，4-发放完毕，8-发放异常',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '发券总量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modity_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = user_authority   */
/******************************************/
CREATE TABLE `user_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account` varchar(64) NOT NULL COMMENT '账号',
  `account_name` varchar(64) NOT NULL COMMENT '人员名称',
  `role` int(11) NOT NULL,
  `dept_user_flag` tinyint(4) DEFAULT NULL COMMENT '按部门or按人员 1部门 2人员',
  `authority_dept` text COMMENT '部门权限',
  `authority_user` text COMMENT '用户权限',
  `vender_flag` tinyint(4) DEFAULT NULL COMMENT '商家权限 0全部商家  1指定商家',
  `authority_vender` text COMMENT '商家权限',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `update_name` varchar(100) DEFAULT NULL COMMENT '更新人名称',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25681 DEFAULT CHARSET=utf8 COMMENT='用户权限表';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = vender_asset_config   */
/******************************************/
CREATE TABLE `vender_asset_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_mode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商家模式 0 全部商家 1 指定商家',
  `vender_id` bigint(11) DEFAULT NULL COMMENT '商家ID 全部商家指定商家ID为0',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `business_mode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '业务模式 0 全部销售类型 1 指定销售类型',
  `business_type_list` varchar(100) DEFAULT NULL COMMENT '业务类型集合',
  `vender_coupon_usable` tinyint(4) NOT NULL COMMENT '商家券是否可用 (-1 不可用 1 可用)',
  `vender_coupon_describe` varchar(100) DEFAULT NULL COMMENT '商家券文案',
  `dm_vender_coupon_usable` tinyint(4) NOT NULL COMMENT '多点商家券是否可用(-1 不可用 1 可用)',
  `dm_vender_coupon_describe` varchar(100) DEFAULT NULL COMMENT '多点商家券文案',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1 启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `create_name` varchar(100) DEFAULT NULL COMMENT '创建人名称',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `update_name` varchar(100) DEFAULT NULL COMMENT '更新人名称',
  `dynamic_extend_attr` varchar(1000) DEFAULT NULL COMMENT '动态扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='商家资产开关配置表';


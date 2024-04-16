-- Export Tools
-- Time: 2024-04-16 15:41:35
-- Service: s3631s.jxq.db.dmall.com:3631   Database: dmall_collage
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_activity   */
/******************************************/
CREATE TABLE `cg_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) unsigned NOT NULL COMMENT '活动商家ID',
  `activity_name` varchar(100) NOT NULL DEFAULT '' COMMENT '活动名称',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `activity_rule_url` varchar(200) NOT NULL COMMENT '活动规则url',
  `activity_type` tinyint(4) DEFAULT NULL COMMENT '活动类型枚举：1：销售额推广奖；2：订单量推广奖；3：下单用户数推广奖; 4: 新下单用户数',
  `reward_rules` mediumtext COMMENT '奖励规则 JSON',
  `group_scope_type` tinyint(4) DEFAULT NULL COMMENT '团范围枚举：1：不限；2：限定团；3：排除团；4：限定团分组；5：排除团分组',
  `group_scope_value` varchar(500) DEFAULT NULL COMMENT '团范围值',
  `single_amount_type` tinyint(4) DEFAULT NULL COMMENT '单笔金额枚举：1：不限；2：限定实付金额',
  `single_money` varchar(20) DEFAULT NULL COMMENT '单笔金额值',
  `order_num_type` tinyint(4) DEFAULT NULL COMMENT '订单数量枚举：1：不限；2：限定订单数量',
  `order_num` bigint(10) DEFAULT NULL COMMENT '订单数据值',
  `user_num_type` tinyint(4) DEFAULT NULL COMMENT '用户下单数量枚举：1：不限；2：限定下单用户数',
  `user_num` bigint(10) DEFAULT NULL COMMENT '用户下单数量',
  `sales_amount_type` tinyint(4) DEFAULT NULL COMMENT '销售额（实付）：1：不限；2：限定销售额',
  `sales_amount` varchar(20) DEFAULT NULL COMMENT '销售金额',
  `activity_status` tinyint(4) DEFAULT NULL COMMENT '活动状态 1：待生效  2：已生效；3：进行中；4：已结束；5：已终止',
  `stop_time` datetime DEFAULT NULL COMMENT '活动终止时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `creater` varchar(20) NOT NULL COMMENT '创建人',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  `at_activity_group` mediumtext COMMENT '参加该活动的团',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8mb4 COMMENT='活动表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_activity_dimension_statistics   */
/******************************************/
CREATE TABLE `cg_activity_dimension_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `activity_id` bigint(20) NOT NULL COMMENT '活动ID',
  `statistic_date` varchar(20) NOT NULL DEFAULT '' COMMENT '统计日期',
  `activity_name` varchar(100) NOT NULL DEFAULT '' COMMENT '活动名称',
  `activity_status` tinyint(4) DEFAULT NULL COMMENT '活动状态 1：待生效  2：已生效；3：进行中；4：已结束；5：已终止',
  `activity_type` tinyint(4) DEFAULT NULL COMMENT '活动类型枚举：1：销售额推广奖；2：订单量推广奖；3：下单用户数推广奖; 4: 新下单用户数',
  `activity_group_count` int(5) NOT NULL COMMENT '参与团数',
  `activity_standard_group_count` int(5) NOT NULL COMMENT '达标参与团数',
  `acitvity_award_totalmoney` bigint(10) DEFAULT NULL COMMENT '活动实际奖励发放总额（分）',
  `activity_upstandard_order_totalprice` bigint(20) NOT NULL COMMENT '活动达标销售额（分）',
  `activity_upstandard_ordercount` int(5) NOT NULL COMMENT '活动达标订单量',
  `upstandard_order_usercount` int(5) NOT NULL COMMENT '达标下单用户数（去重）',
  `activity_total_money` varchar(30) DEFAULT NULL COMMENT '活动期间销售总额',
  `activity_total_order` bigint(20) NOT NULL COMMENT '活动期间订单量',
  `activity_total_user` bigint(20) NOT NULL COMMENT '活动期间下单用户数',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `activity_created_time` datetime NOT NULL COMMENT '活动创建时间',
  PRIMARY KEY (`id`),
  KEY `index_activity_name` (`activity_name`) USING BTREE COMMENT '活动名称索引',
  KEY `index_activity_id` (`activity_id`) USING BTREE COMMENT '活动ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2442 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='活动维度数据统计表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_activity_encourage_award   */
/******************************************/
CREATE TABLE `cg_activity_encourage_award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `activity_id` bigint(20) NOT NULL COMMENT '活动ID 防止重复计算活动',
  `activity_type` tinyint(4) DEFAULT NULL COMMENT '活动类型枚举：1：销售额推广奖；2：订单量推广奖；3：下单用户数推广奖; 4: 新下单用户数',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `cg_encourage_award` bigint(10) DEFAULT NULL COMMENT '活动实际奖励发放总额（分）',
  `commission_date` date DEFAULT NULL COMMENT '佣金统计日期',
  `award_status` tinyint(4) DEFAULT NULL COMMENT '该活动的奖励是否发放 0：未发放 1：已发放，发放统计到group表中',
  `created` date DEFAULT NULL COMMENT '创建时间',
  `modified` date DEFAULT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_activity_id` (`activity_id`) USING BTREE COMMENT '活动ID索引',
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_act_group_id` (`group_id`,`activity_id`) USING BTREE COMMENT '团ID和活动索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='激励奖励发放表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_advance_group   */
/******************************************/
CREATE TABLE `cg_advance_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aw_id` bigint(20) NOT NULL COMMENT '预售商品主键ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `new_time` datetime NOT NULL COMMENT '成团时间',
  `todo_time` datetime DEFAULT NULL COMMENT '下发生产时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
  `group_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '成团状态（1-成团等待中，2-已下发生产，3-下发取消，4-订单取消）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `ware_num` bigint(20) NOT NULL DEFAULT '1' COMMENT '商品数',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_aw_id` (`aw_id`) USING BTREE COMMENT '预约商品ID索引',
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预售组团表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_advance_sku   */
/******************************************/
CREATE TABLE `cg_advance_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint(20) NOT NULL COMMENT '商品SKU',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型（0-普通商品，1-预售商品）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品SKU索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品SKU类型表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_advance_ware   */
/******************************************/
CREATE TABLE `cg_advance_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint(20) NOT NULL COMMENT '商品SKU_ID',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名',
  `start_time` datetime NOT NULL COMMENT '预售开始时间',
  `end_time` datetime NOT NULL COMMENT '预售结束时间',
  `delivery_date` date NOT NULL COMMENT '送货日期',
  `one_real_num` int(11) NOT NULL COMMENT '单团真实起售数量',
  `one_fictitious_num` int(11) NOT NULL COMMENT '单团虚拟起售数量',
  `all_real_num` int(11) NOT NULL COMMENT '全团真实起售数量',
  `all_fictitious_num` int(11) NOT NULL COMMENT '全团虚拟起售数量',
  `advance_type` tinyint(2) NOT NULL COMMENT '预售类型（1-全团，2-单团，3-团组）',
  `type_id` bigint(20) DEFAULT NULL COMMENT '团ID/团组ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `ad_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '预售状态（0-等待组团下发，1-组团全下发成功，2-组团全下发取消，3-部分下发部分取消）',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT 'skuId索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预售商品表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_all_encourage_order   */
/******************************************/
CREATE TABLE `cg_all_encourage_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型（1-普通订单，2-预售订单，3-直供订单）',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户电话',
  `order_status` int(1) NOT NULL COMMENT '订单状态',
  `ware_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `real_price` int(11) NOT NULL DEFAULT '0' COMMENT '实付价(分)',
  `box_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '箱码',
  `order_create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `order_wares` mediumtext COMMENT '订单商品JSON数据',
  `use_coupon` int(11) DEFAULT NULL COMMENT '优惠劵金额（分）',
  `promotion_price` int(11) DEFAULT NULL COMMENT '促销金额（分）',
  `total_price` int(11) DEFAULT NULL COMMENT '商品原始总价（分）',
  `total_weight` double(20,2) DEFAULT NULL COMMENT '商品总重量（kg）',
  `order_complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `payment_type` int(10) DEFAULT NULL COMMENT '订单支付类型',
  `order_rmark` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `ware_comsi_ratios` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有商品佣金比例',
  `new_comsi_price` bigint(10) DEFAULT NULL COMMENT '下单时拉新佣金（分）',
  `sorting_way` tinyint(4) DEFAULT NULL COMMENT '分拣方式，1：按订单分拣；2：按团分拣',
  `delivery_way` tinyint(4) DEFAULT NULL COMMENT '配送类型，1：配送；2：自提',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型',
  `take_way` tinyint(4) DEFAULT NULL COMMENT '收货方式：1.团长确认，2.用户确认，3.系统确认',
  `store_id` bigint(20) DEFAULT NULL COMMENT '履约门店ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '履约门店名称',
  `fake_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店ID',
  `fake_store_name` varchar(255) DEFAULT NULL COMMENT '下单门店名称',
  `vender_id` bigint(20) DEFAULT NULL,
  `user_phone_reverse` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号反转',
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`) COMMENT '订单ID索引',
  KEY `index_store_id` (`store_id`),
  KEY `index_fake_store_id` (`fake_store_id`),
  KEY `union_index_yn_time` (`group_id`,`order_create_time`,`order_status`,`yn`) USING BTREE,
  KEY `index_group_yn_status` (`group_id`,`yn`,`order_status`,`user_phone_reverse`) USING BTREE,
  KEY `index_vender_id` (`vender_id`,`order_create_time`,`yn`) USING BTREE,
  KEY `idx_group_com_time` (`group_id`,`order_complete_time`,`order_status`,`yn`) USING BTREE COMMENT '团id完成时间索引',
  KEY `idx_order_status` (`order_status`) USING BTREE,
  KEY `idx_order_create_time` (`order_create_time`),
  KEY `idx_user_phone` (`user_phone`),
  KEY `index_user_id` (`user_id`,`order_status`,`yn`) USING BTREE COMMENT '用户id索引'
) ENGINE=InnoDB AUTO_INCREMENT=929682 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_auto_withdraw   */
/******************************************/
CREATE TABLE `cg_auto_withdraw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` bigint(20) NOT NULL COMMENT '提现申请ID',
  `apply_time` datetime NOT NULL COMMENT '发起提现时间',
  `apply_status` tinyint(1) DEFAULT NULL COMMENT '提现状态：1-发起申请成功，2-发起申请失败，3-提现成功，4-提现失败，5-取消支付',
  `apply_desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述信息(失败原因等)',
  `unify_orderId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '付款平台返回的提现申请单号',
  `third_ref` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方结算系统流水',
  `pay_amount` bigint(20) DEFAULT NULL COMMENT '付款金额（单位：分）',
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apply_id` (`apply_id`) USING BTREE COMMENT '提现申请ID索引',
  KEY `index_unify_orderId` (`unify_orderId`) USING BTREE COMMENT 'unify_orderId索引',
  KEY `index_third_ref` (`third_ref`) USING BTREE COMMENT 'third_ref索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1690562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自动提现记录表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_balance_flow   */
/******************************************/
CREATE TABLE `cg_balance_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `group_id` bigint(20) DEFAULT NULL COMMENT '团id',
  `flow_type` int(1) DEFAULT NULL COMMENT '流水类型：1-提现，2-佣金到账',
  `flow_amount` bigint(10) DEFAULT NULL COMMENT '金额，单位分',
  `create_time` datetime DEFAULT NULL COMMENT '流水产生时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '提现申请id',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) COMMENT '团ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=240395362 DEFAULT CHARSET=utf8mb4 COMMENT='金额流水表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_banner   */
/******************************************/
CREATE TABLE `cg_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `banner_name` varchar(100) NOT NULL DEFAULT '' COMMENT '轮播图名称',
  `effective_time` datetime NOT NULL COMMENT '生效时间',
  `expiry_time` datetime NOT NULL COMMENT '失效时间',
  `diredict_url` varchar(500) DEFAULT NULL COMMENT '跳转URL',
  `img_url` varchar(100) DEFAULT NULL COMMENT '轮播图片',
  `jump_link` varchar(200) DEFAULT NULL COMMENT '跳转链接',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COMMENT='团长轮播图表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_bd_user   */
/******************************************/
CREATE TABLE `cg_bd_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'bd的id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `badge_no` varchar(64) DEFAULT NULL COMMENT '员工号',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `onboard` datetime DEFAULT NULL COMMENT '入职时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `invite_url` varchar(500) DEFAULT NULL COMMENT '推广码图片链接',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '数据有效性',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_colonel_course   */
/******************************************/
CREATE TABLE `cg_colonel_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `course_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程标题',
  `course_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程链接',
  `course_img_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程图片',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效：1-有效；-1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团长课程表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_commission_cfg   */
/******************************************/
CREATE TABLE `cg_commission_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ctg_id` bigint(20) NOT NULL COMMENT '团分组ID',
  `new_cmsi_price` bigint(20) NOT NULL COMMENT '团拉新佣金（分）',
  `ware_cmsi_ratio` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '商品默认佣金比例',
  `opt_user` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最近操作人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_ctg_id` (`ctg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='佣金配置表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_commission_cfg_cron   */
/******************************************/
CREATE TABLE `cg_commission_cfg_cron` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '团佣金配置定时管理',
  `group_ctg_id` bigint(20) unsigned NOT NULL COMMENT '团分组id',
  `new_cmsi_price` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '团拉新佣金（分）',
  `ware_cmsi_ratio` float(8,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '商品默认佣金比例',
  `effect_time` datetime NOT NULL COMMENT '生效时间',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0:未生效 ，1:已生效',
  `operate_time` datetime NOT NULL COMMENT '最近操作时间',
  `operate_user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最近操作人Id',
  `operate_user_name` varchar(60) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '最近操作人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_ctg_id` (`group_ctg_id`) USING BTREE,
  KEY `index_effect_time` (`effect_time`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_ctg_id` (`group_ctg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_commission_manage   */
/******************************************/
CREATE TABLE `cg_commission_manage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '佣金导入批次ID',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '佣金类型:1.奖励发放',
  `rows` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '佣金总记录数',
  `total` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '总金额(分)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '奖励说明',
  `grant_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发放时间',
  `grant_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '发放人ID',
  `grant_user_name` varchar(50) DEFAULT '' COMMENT '发放人名称',
  `check_user_id` bigint(20) unsigned DEFAULT NULL COMMENT '审核人ID',
  `check_user_name` varchar(50) DEFAULT NULL COMMENT '审核人名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:待审核后,1:审核通过,2:审核失败)',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `effect_time` datetime DEFAULT NULL COMMENT '生效时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效  -1 无效 1 有效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_grant_time` (`grant_time`) USING BTREE,
  KEY `index_check_time` (`check_time`) USING BTREE,
  KEY `index_effect_time` (`effect_time`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6762 DEFAULT CHARSET=utf8mb4 COMMENT='佣金发放管理表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_commission_summary   */
/******************************************/
CREATE TABLE `cg_commission_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `group_id` bigint(20) NOT NULL COMMENT '团id',
  `commission_sale` bigint(10) NOT NULL DEFAULT '0' COMMENT '销售佣金（分）',
  `commission_new` bigint(10) NOT NULL DEFAULT '0' COMMENT '拉新佣金(分)',
  `commission_date` date NOT NULL COMMENT '佣金统计日期',
  `created` datetime DEFAULT NULL COMMENT '数据创建时间',
  `modified` datetime DEFAULT NULL COMMENT '数据修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 -1 无效 1 有效',
  `commission_type` tinyint(2) DEFAULT NULL COMMENT '佣金计算类型（1为新佣金计算结果，2为老佣金计算结果）',
  `commission_reward` bigint(10) NOT NULL DEFAULT '0' COMMENT '奖励佣金',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团id',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64369842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团佣金一览表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_comsi_new   */
/******************************************/
CREATE TABLE `cg_comsi_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `comsi_type` int(2) NOT NULL DEFAULT '1' COMMENT '佣金类型（1-拉新佣金）',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID（父订单）',
  `order_create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_complete_time` datetime DEFAULT NULL COMMENT '提货时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `user_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号',
  `comsi_price` bigint(20) NOT NULL COMMENT '佣金（分）',
  `commission_date` date NOT NULL COMMENT '佣金统计日期',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拉新佣金明细表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_comsi_order   */
/******************************************/
CREATE TABLE `cg_comsi_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `comsi_type` int(2) NOT NULL DEFAULT '1' COMMENT '佣金类型（1-订单佣金）',
  `order_pid` bigint(20) DEFAULT NULL COMMENT '父订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `comsi_price` bigint(20) NOT NULL COMMENT '佣金（分）',
  `commission_date` date NOT NULL COMMENT '佣金统计日期',
  `sku_details` text COLLATE utf8mb4_unicode_ci COMMENT '商品佣金详情JSON',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_group_id` (`group_id`,`commission_date`,`yn`) USING BTREE COMMENT '团id,date索引'
) ENGINE=InnoDB AUTO_INCREMENT=266083962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单佣金总览表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_comsi_reward   */
/******************************************/
CREATE TABLE `cg_comsi_reward` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` bigint(20) unsigned NOT NULL COMMENT '团ID',
  `reward_amount` bigint(20) unsigned NOT NULL COMMENT '奖励金额',
  `reward_notes` varchar(255) DEFAULT NULL COMMENT '奖励说明',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作者',
  `grant_time` datetime DEFAULT NULL COMMENT '发放时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0:待审核后,1:审核通过(),2:审核失败)',
  `comsi_manage_id` bigint(20) unsigned DEFAULT NULL COMMENT '奖励佣金审核管理ID',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_grant` (`group_id`,`grant_time`) USING BTREE,
  KEY `index_comsi_manage_id` (`comsi_manage_id`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25282 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_comsi_sale   */
/******************************************/
CREATE TABLE `cg_comsi_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `comsi_type` int(2) NOT NULL DEFAULT '1' COMMENT '佣金类型（1-销售佣金）',
  `order_pid` bigint(20) DEFAULT NULL COMMENT '父订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品SKU_ID',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名',
  `sku_num` int(10) DEFAULT NULL COMMENT '商品数量',
  `sku_price` bigint(20) DEFAULT NULL COMMENT '商品原单价（分）',
  `sku_total_price` bigint(20) DEFAULT NULL COMMENT '商品总售价（分）',
  `comsi_ratio` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金比例',
  `comsi_price` bigint(20) NOT NULL COMMENT '佣金（分）',
  `commission_date` date NOT NULL COMMENT '佣金统计日期',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  `comsi_refund_amount` bigint(20) DEFAULT '0' COMMENT '总佣金退款金额（分）',
  `ware_refund_amount` bigint(20) DEFAULT '0' COMMENT '商品总退款金额（分）',
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品SKU_ID索引',
  KEY `index_vender_id` (`vender_id`,`order_create_time`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=331584402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售佣金明细表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_dfc_store_id   */
/******************************************/
CREATE TABLE `cg_dfc_store_id` (
  `id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `vender_id` bigint(20) NOT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `yn` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='DFC商家门店ID';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_district   */
/******************************************/
CREATE TABLE `cg_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地区主键',
  `name` varchar(200) NOT NULL COMMENT '地区名称',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '父级ID',
  `parent_name` varchar(200) DEFAULT NULL COMMENT '父级名称',
  `type` tinyint(4) NOT NULL COMMENT '地区类型，1-省，2-市，3-县/区',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4420002 DEFAULT CHARSET=utf8mb4 COMMENT='省市区字典表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_encourage_group_comsi_statistics   */
/******************************************/
CREATE TABLE `cg_encourage_group_comsi_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `commission_date` date NOT NULL COMMENT '佣金统计日期',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `activity_id` bigint(20) NOT NULL COMMENT '活动ID',
  `comsi_type` int(2) NOT NULL DEFAULT '1' COMMENT '佣金类型 1:销售额推广奖；2:订单量推广奖；3:下单用户推广奖；4:新下单用户推广奖',
  `upstandard_order_total_price` bigint(20) NOT NULL COMMENT '达标订单总销售额（分）',
  `upstandard_order_count` int(5) NOT NULL COMMENT '达标订单数量',
  `upstandard_order_usercount` int(5) NOT NULL COMMENT '达标下单用户数（去重）',
  `comsi_price` bigint(20) NOT NULL COMMENT '佣金（分）',
  `vender_id` bigint(20) unsigned NOT NULL COMMENT '商家ID',
  `upstandard_order_newusercount` int(5) NOT NULL COMMENT '达标新用下单用户数（去重）',
  `activity_order_total_price` bigint(20) NOT NULL COMMENT '活动期间订单总销售额（分）',
  `activity_order_count` int(5) NOT NULL COMMENT '活动期间订单数量',
  `activity_order_usercount` int(5) NOT NULL COMMENT '活动期间下单用户数（去重）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index_commission_date` (`commission_date`) USING BTREE COMMENT '统计日期索引',
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_activity_id` (`activity_id`) USING BTREE COMMENT '活动ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=5922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团长激励计算表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_encourage_order   */
/******************************************/
CREATE TABLE `cg_encourage_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `order_pid` bigint(20) DEFAULT NULL COMMENT '父订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `place_order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `order_status` int(1) NOT NULL COMMENT '订单状态',
  `order_wares` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '订单商品JSON数据',
  `amount_standard` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '订单金额是否达标激励规则JSON数据',
  `order_create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `promotion_price` int(11) DEFAULT NULL COMMENT '促销金额（分）',
  `total_price` int(11) DEFAULT NULL COMMENT '商品原始总价（分）',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `new_user_order` tinyint(2) DEFAULT '0' COMMENT '是否新用户订单; 1:新用户订单；0：非新用户订单',
  `real_price` int(11) NOT NULL DEFAULT '0' COMMENT '实付价(分)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_order_complete_time` (`order_complete_time`) USING BTREE COMMENT '订单完成时间',
  KEY `index_order_create_time` (`order_create_time`) USING BTREE COMMENT '订单创建时间',
  KEY `index_new_user_order` (`new_user_order`) USING BTREE COMMENT '是否是新用户订单索引',
  KEY `index_group_id` (`group_id`,`yn`) USING BTREE COMMENT '团id,yn索引'
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='激励活动订单表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group   */
/******************************************/
CREATE TABLE `cg_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `group_name` varchar(200) DEFAULT NULL COMMENT '团名称',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '团长微信昵称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `profession` varchar(50) DEFAULT NULL COMMENT '职业',
  `village` varchar(200) DEFAULT NULL COMMENT '商圈/社区',
  `province` varchar(40) DEFAULT NULL COMMENT '省',
  `city` varchar(40) DEFAULT NULL COMMENT '城市',
  `district` varchar(40) DEFAULT NULL COMMENT '区/县',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `id_card` varchar(40) DEFAULT NULL COMMENT '身份证号',
  `bank_card` varchar(40) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '开户行名称',
  `real_bank_name` varchar(100) DEFAULT NULL COMMENT '开户支行名称',
  `id_card_image_front` varchar(200) DEFAULT NULL COMMENT '身份证正面照',
  `id_card_image_back` varchar(200) DEFAULT NULL COMMENT '身份证背面',
  `bank_card_image` varchar(200) DEFAULT NULL COMMENT '银行卡正面照片',
  `bank_back_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡反面',
  `longitude` varchar(40) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(40) DEFAULT NULL COMMENT '纬度',
  `user_coverd` int(10) DEFAULT NULL COMMENT '覆盖人数',
  `lowest_cashes` bigint(10) DEFAULT NULL COMMENT '最低提现金额',
  `commission_rule` varchar(1000) DEFAULT NULL COMMENT '佣金规则',
  `vender_id` int(10) DEFAULT NULL COMMENT '履约商家',
  `vender_name` varchar(255) DEFAULT NULL COMMENT '履约商家名称',
  `store_id` varchar(20) DEFAULT NULL COMMENT '履约门店',
  `store_name` varchar(255) DEFAULT NULL COMMENT '履约门店名称',
  `fake_store_id` varchar(20) DEFAULT NULL COMMENT '虚拟门店',
  `fake_store_name` varchar(255) DEFAULT NULL COMMENT '虚拟门店名称',
  `commission_yestoday` bigint(10) DEFAULT NULL COMMENT '昨日佣金',
  `commission_total` bigint(10) DEFAULT NULL COMMENT '总佣金',
  `balance_money` bigint(10) DEFAULT NULL COMMENT '余额',
  `order_count_yestoday` int(10) DEFAULT NULL COMMENT '昨日订单数量',
  `order_count_total` int(10) DEFAULT NULL COMMENT '总订单量',
  `order_amount_yestoday` bigint(10) DEFAULT NULL COMMENT '昨日销售额',
  `order_amount_total` bigint(10) DEFAULT NULL COMMENT '总销售额',
  `status` int(3) DEFAULT NULL COMMENT '团长状态 1 上线  -1 下线',
  `sale_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '团销售状态（1-正常，2-停止）',
  `frozen` int(3) NOT NULL DEFAULT '1' COMMENT '团长状态：1-正常；-1-被冻结',
  `code_url` varchar(255) DEFAULT NULL COMMENT '推荐二维码图片url',
  `logistics_distance` double(20,2) DEFAULT NULL COMMENT '物流距离（km）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效  -1 无效 1 有效',
  `union_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信unionId',
  `common_name` varchar(200) DEFAULT NULL COMMENT '团长常用名',
  `apply_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '申请来源：1-自主申请；2-BD推荐；3-海报申请',
  `recommender_id` bigint(20) unsigned DEFAULT NULL COMMENT '推荐人编号',
  `shipment_time_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-9：00-11:00;2-15:00-17:00',
  `express_company` varchar(255) DEFAULT NULL COMMENT '物流公司名称',
  `sorting_way` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分拣方式，1：按订单分拣；2：按团分拣',
  `delivery_way` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配送类型，1：配送；2：自提',
  `open_time` datetime DEFAULT NULL COMMENT '仅用于记录团正式开团时间，不做任何团操作！',
  `invite_url` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `recommender_name` varchar(255) DEFAULT NULL COMMENT '推荐人姓名',
  `recommender_phone` varchar(255) DEFAULT NULL COMMENT '推荐人电话',
  `distribution` tinyint(4) DEFAULT '1' COMMENT '配送方式',
  `regionalWarehouse` varchar(10) DEFAULT NULL COMMENT '是否是区域仓',
  `regionalWarehouseName` varchar(255) DEFAULT NULL COMMENT '区域仓名称',
  `regionalWarehouseCode` varchar(255) DEFAULT NULL COMMENT '区域仓id',
  `regionalWarehouseFlag` tinyint(4) DEFAULT NULL COMMENT '区域仓下线标记',
  `tradeTypeFlag` tinyint(4) DEFAULT '-1' COMMENT '业态配置开关,1开启,-1关闭',
  `o2otrade_type_code` int(10) DEFAULT NULL COMMENT 'o2o业态code',
  `globaltrade_type_code` int(10) DEFAULT NULL COMMENT '全球精选业态code',
  `poptrade_type_code` int(10) DEFAULT NULL COMMENT 'pop业态code',
  `o2otrade_type_name` varchar(255) DEFAULT NULL COMMENT 'o2o业态名称',
  `globaltrade_type_name` varchar(255) DEFAULT NULL COMMENT '全球精选业态名称',
  `poptrade_type_name` varchar(255) DEFAULT NULL COMMENT 'pop业态名称',
  `take_delivery_way` tinyint(4) DEFAULT '5' COMMENT '用户提货方式，5：用户自提；6：团长配送',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`) COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) COMMENT '商家ID索引',
  KEY `index_fake_store_id` (`fake_store_id`) COMMENT '虚拟门店ID索引',
  KEY `index_store_id` (`store_id`) COMMENT '履约门店索引'
) ENGINE=InnoDB AUTO_INCREMENT=232482 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='团信息表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_apply   */
/******************************************/
CREATE TABLE `cg_group_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `user_id` bigint(20) NOT NULL COMMENT '多点用户ID',
  `union_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信UnionId',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别 1：男 2：女',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `profession` varchar(50) DEFAULT NULL COMMENT '职业',
  `village` varchar(200) DEFAULT NULL COMMENT '商圈/社区',
  `province` varchar(40) DEFAULT NULL COMMENT '省',
  `city` varchar(40) DEFAULT NULL COMMENT '城市',
  `district` varchar(40) DEFAULT NULL COMMENT '区/县',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '审核说明',
  `status` int(3) DEFAULT NULL COMMENT '团长状态 1:待审核 2:申请通过 3:申请驳回 4:已开团',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效  -1 无效 1 有效',
  `apply_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '申请来源：1-自主申请；2-BD推荐',
  `recommender_id` bigint(20) DEFAULT NULL COMMENT '推荐人编号',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '团长微信昵称',
  `common_name` varchar(200) DEFAULT NULL COMMENT '团长常用名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '微信头像链接',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`) COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=606762 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='团信息表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_auth   */
/******************************************/
CREATE TABLE `cg_group_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `head_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '授权状态（0-待授权，1-已授权）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团登录授权表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_cron_job   */
/******************************************/
CREATE TABLE `cg_group_cron_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `managed_type` tinyint(2) DEFAULT NULL COMMENT '操作团：1-所有团；2-团分组；3-单个团',
  `managed_id` bigint(20) DEFAULT NULL COMMENT '操作对象（团id/团分组id）',
  `job_type` tinyint(2) DEFAULT NULL COMMENT '任务类型：1-团上线、2-团下线、3-开启销售、4-停止销售',
  `job_status` tinyint(2) DEFAULT NULL COMMENT '任务状态：1-任务创建，2-任务执行中，3-任务执行完成，4-任务执行出错',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT NULL COMMENT '是否有效：1-有效；2-无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_managed_id` (`managed_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84722 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_ctg   */
/******************************************/
CREATE TABLE `cg_group_ctg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '团分组名称',
  `ctg_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '分组类别（1-商品管理，2-财务管理，3-活动管理）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  `store_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '履约门店',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '履约门店名称',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团分组表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_dimension_statistics   */
/******************************************/
CREATE TABLE `cg_group_dimension_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `activity_id` bigint(20) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(100) NOT NULL DEFAULT '' COMMENT '活动名称',
  `activity_status` tinyint(4) DEFAULT NULL COMMENT '活动状态 1：待生效  2：已生效；3：进行中；4：已结束；5：已终止',
  `group_id` bigint(20) NOT NULL COMMENT '团id',
  `group_name` varchar(100) NOT NULL DEFAULT '' COMMENT '团名称',
  `colonel_id` bigint(20) NOT NULL COMMENT '团长id',
  `colonel_name` varchar(100) NOT NULL DEFAULT '' COMMENT '团长姓名',
  `cg_upstandard_order_count` int(5) NOT NULL COMMENT '团达标订单数量',
  `real_amount` int(11) NOT NULL DEFAULT '0' COMMENT '团达标实付总额(分)',
  `cg_upstandard_order_usercount` int(5) NOT NULL COMMENT '团达标下单用户数（去重）',
  `cg_upstandard_order_newusercount` int(5) NOT NULL COMMENT '团达标新下单用户数（去重）',
  `cg_award_money` bigint(10) DEFAULT NULL COMMENT '团奖励发放金额（分）',
  `cg_activity_total_money` bigint(20) NOT NULL COMMENT '团活动期间销售额（分）',
  `cg_activity_total_order` bigint(20) NOT NULL COMMENT '团活动期间订单量',
  `cg_activity_total_user` bigint(20) NOT NULL COMMENT '团活动期间下单用户数',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `statistic_date` varchar(20) NOT NULL DEFAULT '' COMMENT '统计日期',
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_activity_id` (`activity_id`) USING BTREE COMMENT '活动ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3882 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='团维度数据统计表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_relation   */
/******************************************/
CREATE TABLE `cg_group_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ctg_id` bigint(20) NOT NULL COMMENT '团分组ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_ctg_id` (`ctg_id`) USING BTREE,
  KEY `index_ctg_id_yn` (`ctg_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=149364962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团分组关联关系表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_sku   */
/******************************************/
CREATE TABLE `cg_group_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `group_id` bigint(20) NOT NULL COMMENT '团长ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKU ID',
  `base_count` int(11) DEFAULT NULL COMMENT '基础值',
  `sale_count` int(11) DEFAULT NULL COMMENT '该SKU在该团销售数量',
  `last_purchaser` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最近购买用户昵称',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(3) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) COMMENT 'skuid索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_group_id` (`group_id`,`sku_id`) USING BTREE COMMENT '团id索引'
) ENGINE=InnoDB AUTO_INCREMENT=48549242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团商品表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_user   */
/******************************************/
CREATE TABLE `cg_group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `group_id` bigint(20) NOT NULL COMMENT '团id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `img_url` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户头像',
  `order_count` bigint(10) NOT NULL DEFAULT '0' COMMENT '订单数',
  `total_amount` bigint(10) DEFAULT NULL COMMENT '消费总额',
  `recommend_new` int(10) DEFAULT '0' COMMENT '拉新人数',
  `recommend_consume` int(10) DEFAULT '0' COMMENT '消费人数',
  `last_order_time` datetime DEFAULT NULL COMMENT '最近一次下单时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) COMMENT '团ID索引',
  KEY `index_user_id` (`user_id`) COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15038402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='团用户关联表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_group_ware   */
/******************************************/
CREATE TABLE `cg_group_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `ware_sku` bigint(20) NOT NULL COMMENT '商品SKU',
  `group_id` bigint(20) NOT NULL COMMENT '团id',
  `ware_alias_name` varchar(100) DEFAULT '' COMMENT '拼团商品别名，默认为商品名称',
  `ware_subtitle` varchar(100) DEFAULT NULL COMMENT '拼团商品副标题',
  `ware_video_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品视频播放地址',
  `ware_img_url` varchar(1000) DEFAULT NULL COMMENT '拼团商品列表图片',
  `share_title` varchar(100) DEFAULT '' COMMENT '分享标题',
  `share_img_url` varchar(100) DEFAULT NULL COMMENT '分享图片url',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_ware_id` (`ware_sku`) USING BTREE COMMENT '商品ID索引',
  KEY `idx_group_id_ware_sku_yn` (`group_id`,`ware_sku`,`yn`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2710454522 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='团商品信息表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_join_detail   */
/******************************************/
CREATE TABLE `cg_join_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jw_id` bigint(20) NOT NULL COMMENT '拼购配置ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '社区团ID',
  `jg_id` bigint(20) NOT NULL COMMENT '拼购团ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_nick` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `user_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `jd_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（1-等待下发，2-正常下发，3-正常取消，4-用户自身取消）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '0:待支付，1：已支付,2:已取消',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jw_id` (`jw_id`) USING BTREE COMMENT '配置ID索引',
  KEY `index_jg_id` (`jg_id`) USING BTREE COMMENT '拼购团ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '社区团ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=617963 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼购团详情表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_join_group   */
/******************************************/
CREATE TABLE `cg_join_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jw_id` bigint(20) NOT NULL COMMENT '拼购商品配置ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '社区拼团团ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_nick` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `user_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `start_time` datetime DEFAULT NULL COMMENT '拼购开团时间',
  `end_time` datetime DEFAULT NULL COMMENT '拼购结束时间',
  `todo_time` datetime DEFAULT NULL COMMENT '下发或自动取消执行时间',
  `jg_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '拼购团状态（1-拼团中，2-成功并结束，3-失败并结束）',
  `status_desc` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态描述',
  `user_num` int(11) NOT NULL COMMENT '还需用户数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_jw_id` (`jw_id`) USING BTREE COMMENT '配置ID索引',
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_time` (`end_time`,`start_time`,`jg_status`)
) ENGINE=InnoDB AUTO_INCREMENT=437003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼购团信息表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_join_ware   */
/******************************************/
CREATE TABLE `cg_join_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动名称',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名',
  `join_price` int(11) NOT NULL COMMENT '拼购价格（分）',
  `join_num` int(11) NOT NULL COMMENT '拼购人数',
  `join_time` int(11) NOT NULL COMMENT '组团时间（1-24小时）',
  `start_time` datetime NOT NULL COMMENT '拼购开始时间',
  `end_time` datetime NOT NULL COMMENT '拼购结束时间',
  `limit_num` int(11) NOT NULL DEFAULT '9999' COMMENT '限购件数（9999-无限制）',
  `join_type` tinyint(2) NOT NULL COMMENT '拼购类型（1-普通团，2-全新人团，3-老带新）',
  `join_auto` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '是否自动成团（-1-否，1-是）',
  `act_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '活动状态（-1-已停止，1-未停止）',
  `share_img` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图url',
  `share_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标题',
  `opt_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最近操作人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品sku索引',
  KEY `union_index_time` (`start_time`,`end_time`,`act_status`,`yn`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='拼购商品表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_key_value   */
/******************************************/
CREATE TABLE `cg_key_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '唯一标识KEY',
  `value` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '团ID',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注释',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='键值对配置表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_money_apply   */
/******************************************/
CREATE TABLE `cg_money_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `get_time` datetime DEFAULT NULL COMMENT '提现时间',
  `get_status` tinyint(1) DEFAULT NULL COMMENT '提现状态：1-提现待审核，2-审核失败，3-待打款，4-提现成功',
  `get_money` int(11) DEFAULT NULL COMMENT '提现金额(分)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  `payment_way` tinyint(4) DEFAULT NULL COMMENT '打款方式：1.手动打款，2.自动打款',
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) COMMENT '团ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1729882 DEFAULT CHARSET=utf8mb4 COMMENT='提现申请表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_money_flow   */
/******************************************/
CREATE TABLE `cg_money_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `apply_id` bigint(20) DEFAULT NULL COMMENT '提现申请ID',
  `acc_type` int(2) DEFAULT NULL COMMENT '账单类型：1-提现；2-佣金',
  `amount` bigint(20) DEFAULT NULL COMMENT '金额',
  `deal_time` datetime DEFAULT NULL COMMENT '交易日期',
  `acc_time` datetime DEFAULT NULL COMMENT '账单时间',
  `deal_code` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易单号',
  `status_type` int(2) DEFAULT NULL COMMENT '状态类型：0-佣金，1-提现待审核，2-审核失败，3-待打款，4-提现成功',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_apply_id` (`apply_id`),
  KEY `index_group_id` (`group_id`,`acc_type`,`yn`,`deal_time`) USING BTREE COMMENT '团id索引'
) ENGINE=InnoDB AUTO_INCREMENT=267876362 DEFAULT CHARSET=utf8mb4 COMMENT='账户明细流水表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_opt_log   */
/******************************************/
CREATE TABLE `cg_opt_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作对象业务Id',
  `log_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日志类型: 1-商家配置操作日志',
  `opt_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型',
  `opt_type_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '操作名称',
  `opt_time` datetime NOT NULL COMMENT '操作时间',
  `opt_user_id` bigint(20) NOT NULL,
  `opt_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo` mediumtext COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `vender_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_business_id` (`business_id`) USING BTREE,
  KEY `index_log_type` (`log_type`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台操作日志';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_opt_record   */
/******************************************/
CREATE TABLE `cg_opt_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(11) NOT NULL COMMENT '操作类型',
  `type_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型名',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `user_ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户IP',
  `opt_res` tinyint(2) NOT NULL DEFAULT '1' COMMENT '操作结果（1_成功，-1_失败）',
  `opt_desc` text COLLATE utf8mb4_unicode_ci COMMENT '操作描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_type_id` (`type_id`) USING BTREE COMMENT '类型ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=2664402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社区拼团操作日志表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_order   */
/******************************************/
CREATE TABLE `cg_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型（1-普通订单，2-预售订单，3-直供订单）',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户电话',
  `order_status` int(1) NOT NULL COMMENT '订单状态',
  `ware_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `real_price` int(11) NOT NULL DEFAULT '0' COMMENT '实付价(分)',
  `box_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '箱码',
  `order_create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `order_wares` mediumtext COMMENT '订单商品JSON数据',
  `use_coupon` int(11) DEFAULT NULL COMMENT '优惠劵金额（分）',
  `promotion_price` int(11) DEFAULT NULL COMMENT '促销金额（分）',
  `total_price` int(11) DEFAULT NULL COMMENT '商品原始总价（分）',
  `total_weight` double(20,2) DEFAULT NULL COMMENT '商品总重量（kg）',
  `order_complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `payment_type` int(10) DEFAULT NULL COMMENT '订单支付类型',
  `order_rmark` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `ware_comsi_ratios` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有商品佣金比例',
  `new_comsi_price` bigint(10) DEFAULT NULL COMMENT '下单时拉新佣金（分）',
  `sorting_way` tinyint(4) DEFAULT NULL COMMENT '分拣方式，1：按订单分拣；2：按团分拣',
  `delivery_way` tinyint(4) DEFAULT NULL COMMENT '配送类型，1：配送；2：自提',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型',
  `take_way` tinyint(4) DEFAULT NULL COMMENT '收货方式：1.团长确认，2.用户确认，3.系统确认',
  `store_id` bigint(20) DEFAULT NULL COMMENT '履约门店ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '履约门店名称',
  `fake_store_id` bigint(20) DEFAULT NULL COMMENT '下单门店ID',
  `fake_store_name` varchar(255) DEFAULT NULL COMMENT '下单门店名称',
  `vender_id` bigint(20) DEFAULT NULL,
  `user_phone_reverse` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号反转',
  `delivery_address` text COMMENT '用户收货地址',
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`) COMMENT '订单ID索引',
  KEY `index_store_id` (`store_id`),
  KEY `index_fake_store_id` (`fake_store_id`),
  KEY `union_index_yn_time` (`group_id`,`order_create_time`,`order_status`,`yn`) USING BTREE,
  KEY `index_group_yn_status` (`group_id`,`yn`,`order_status`,`user_phone_reverse`) USING BTREE,
  KEY `index_vender_id` (`vender_id`,`order_create_time`,`yn`) USING BTREE,
  KEY `idx_group_com_time` (`group_id`,`order_complete_time`,`order_status`,`yn`) USING BTREE COMMENT '团id完成时间索引',
  KEY `idx_order_status` (`order_status`) USING BTREE,
  KEY `idx_order_create_time` (`order_create_time`),
  KEY `idx_user_phone` (`user_phone`),
  KEY `index_user_id` (`user_id`,`order_status`,`yn`) USING BTREE COMMENT '用户id索引'
) ENGINE=InnoDB AUTO_INCREMENT=282414162 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_order_3pl   */
/******************************************/
CREATE TABLE `cg_order_3pl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '团id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `exp_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递公司名称',
  `exp_num` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `exp_status` int(1) DEFAULT NULL COMMENT '快递状态：1-配送中，2-团长已收货',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) USING BTREE COMMENT '团ID索引',
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引',
  KEY `index_exp_num` (`exp_num`) USING BTREE COMMENT '快递单号索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=174733 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='直供订单三方物流表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_order_ware   */
/******************************************/
CREATE TABLE `cg_order_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品SKU_ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_order_id` (`order_id`) USING BTREE COMMENT '订单ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=7214082 DEFAULT CHARSET=utf8mb4 COMMENT='订单商品一览表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_popup   */
/******************************************/
CREATE TABLE `cg_popup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `popup_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '弹窗标题',
  `user_type` tinyint(4) DEFAULT NULL COMMENT '用户类型：1-全体用户；2-社区拼团新用户；3-社区拼团老用户',
  `popup_type` tinyint(4) DEFAULT NULL COMMENT '弹窗类型：1-发放奖励；2-活动页',
  `popup_content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '弹窗内容：type=1，存任务id；type=2，存跳转地址',
  `popup_img_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '弹窗图片',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `expiry_time` datetime DEFAULT NULL COMMENT '失效时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `group_scope` tinyint(4) NOT NULL DEFAULT '1' COMMENT '团范围：1-所有团；2-团分组；3-单个团',
  `scope_id` bigint(20) DEFAULT NULL COMMENT '团范围id：2-团分组id，3-团id',
  `scope_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '范围名称：团分组名称或团名称',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='首页弹窗表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_schedule   */
/******************************************/
CREATE TABLE `cg_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '排期名称',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `ctg_id` bigint(20) NOT NULL COMMENT '团分组ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inde_ctg_id` (`ctg_id`) USING BTREE COMMENT '团分组ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品排期表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_schedule_detail   */
/******************************************/
CREATE TABLE `cg_schedule_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `schedule_id` bigint(20) NOT NULL COMMENT '排期ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku',
  `ware_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `ware_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品副标题',
  `share_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享标题',
  `main_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品主图',
  `main_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品主视频',
  `share_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图片',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_schedule_id` (`schedule_id`) USING BTREE COMMENT '排期ID索引',
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品SKU索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品排期详情表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_secskill_notice   */
/******************************************/
CREATE TABLE `cg_secskill_notice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT '提醒用户',
  `start_time` datetime NOT NULL COMMENT '秒杀开始时间',
  `sku_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'skuId',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `end_time` datetime NOT NULL COMMENT '秒杀结束时间',
  `sku_price` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品价格',
  `secskill_price` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '秒杀价',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  `push_time` datetime DEFAULT NULL COMMENT '推送时间：null未推送',
  `yn` tinyint(4) NOT NULL COMMENT '1.存在，-1：不存在',
  `activity_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '秒杀活动ID',
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序跳转链接',
  `vender_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '商家Id',
  PRIMARY KEY (`id`),
  KEY `idx_start_time` (`start_time`,`user_id`,`sku_id`,`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='秒杀提醒';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_share_activity   */
/******************************************/
CREATE TABLE `cg_share_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_name` varchar(20) NOT NULL DEFAULT '' COMMENT '活动名称',
  `activity_type` tinyint(1) DEFAULT NULL COMMENT '活动类型：1-订单分享；2-团分享；3-收藏小程序',
  `task_id` int(20) DEFAULT NULL COMMENT '潘多拉任务id，允许为空',
  `status` tinyint(1) DEFAULT NULL COMMENT '收藏小程序活动开关：0-打开；1-关闭',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '失效时间',
  `share_title` varchar(100) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_introduction` varchar(100) DEFAULT NULL COMMENT '分享引导（订单分享用）',
  `img_url` varchar(200) DEFAULT NULL COMMENT '分享图片url',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL,
  `share_intr_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_url` varchar(200) DEFAULT NULL COMMENT '分享链接（支付成功页活动）',
  `share_url_type` char(1) DEFAULT NULL COMMENT '分享链接类型 1 团首页，2 活动页，3 自定义（支付成功页活动）',
  `activity_id` int(20) DEFAULT NULL COMMENT '营销活动ID，允许为空',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8mb4 COMMENT='分享活动表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_sku_sale   */
/******************************************/
CREATE TABLE `cg_sku_sale` (
  `id` bigint(11) NOT NULL COMMENT 'sku id',
  `last_purchaser` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最近购买用户昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '头像',
  `sale_count` int(11) DEFAULT NULL COMMENT '累计销售量',
  `base_count` int(11) NOT NULL COMMENT '销售基础值',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 - 1 无效  1 有效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品销量表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_sku_type   */
/******************************************/
CREATE TABLE `cg_sku_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品SKU',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名',
  `store_id` bigint(20) DEFAULT NULL COMMENT 'sku真实所属门店ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '团ID',
  `sku_type` tinyint(2) NOT NULL COMMENT '商品类别（1-POP商品）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品sku索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12658 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品类型表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_store_manage   */
/******************************************/
CREATE TABLE `cg_store_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) NOT NULL,
  `vender_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '履约门店ID',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '履约门店名称',
  `fake_store_names` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '履约门店展示',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店管理';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_store_rela   */
/******************************************/
CREATE TABLE `cg_store_rela` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) unsigned NOT NULL COMMENT '履约门店ID',
  `fake_store_id` bigint(20) unsigned NOT NULL COMMENT '下单门店ID',
  `fake_store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下单门店名称',
  `yn` tinyint(4) NOT NULL COMMENT '1',
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_store_id` (`store_id`) USING BTREE,
  KEY `index_fk_store_id` (`fake_store_id`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=710082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_take_exception   */
/******************************************/
CREATE TABLE `cg_take_exception` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) NOT NULL COMMENT '团ID',
  `take_time` datetime NOT NULL COMMENT '收货时间',
  `exception_info` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '异常说明',
  `imgs` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '异常图片集',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_id` (`group_id`) COMMENT '团ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收货异常表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_vender_activity_config   */
/******************************************/
CREATE TABLE `cg_vender_activity_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) unsigned NOT NULL COMMENT '商家ID',
  `activity_switch` tinyint(4) unsigned NOT NULL COMMENT '商家活动开关',
  `activity_img_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序主图url',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `common_problem` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '常见问题',
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_vender_name` (`vender_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家活动配置';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_vender_config   */
/******************************************/
CREATE TABLE `cg_vender_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) unsigned NOT NULL COMMENT '商家ID',
  `vender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家名称',
  `cg_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家拼团名称',
  `apply_service_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `group_share_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '团分享配置底图',
  `group_recruit_intro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '团长招募图',
  `qualifications_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商家资质图片',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `payment_way` tinyint(4) NOT NULL DEFAULT '3' COMMENT '打款方式：1.手动打款，2：自动打款，3：手动，自动',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_vender_name` (`vender_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家配置';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_ware_category   */
/******************************************/
CREATE TABLE `cg_ware_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `ware_ids` text COMMENT '该分类下的团商品id，用“,”分割',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：0-上线；1-下线；默认为下线',
  `sort` int(11) DEFAULT NULL COMMENT '排序，从1开始递增',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团商品分类表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_ware_comsi   */
/******************************************/
CREATE TABLE `cg_ware_comsi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ctg_id` bigint(20) NOT NULL COMMENT '团分组ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku_id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '后台二级类目id',
  `third_category_id` bigint(20) DEFAULT NULL COMMENT '后台三级类目id',
  `sku_cmsi_ratio` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '商品佣金比例',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品SKU_ID索引',
  KEY `index_vender_id` (`vender_id`) USING BTREE,
  KEY `index_ctg_id` (`ctg_id`,`sku_id`,`yn`) USING BTREE COMMENT '团分组id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1395407242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品佣金表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_ware_comsi_cron   */
/******************************************/
CREATE TABLE `cg_ware_comsi_cron` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cron_id` bigint(20) unsigned NOT NULL COMMENT '佣金配置定时Id',
  `ctg_id` bigint(20) NOT NULL COMMENT '团分组ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku_id',
  `sku_cmsi_ratio` float(8,4) NOT NULL DEFAULT '0.0000' COMMENT '商品佣金比例',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ctg_id` (`ctg_id`) USING BTREE COMMENT '团分组ID索引',
  KEY `index_sku_id` (`sku_id`) USING BTREE COMMENT '商品SKU_ID索引',
  KEY `index_cron_id` (`cron_id`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=537456762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品佣金表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = cg_ware_info   */
/******************************************/
CREATE TABLE `cg_ware_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `ware_id` int(11) NOT NULL COMMENT '商品id',
  `ware_sku` int(11) NOT NULL COMMENT '商品SKU',
  `bar_code` int(11) NOT NULL COMMENT '国条码',
  `vender_id` int(11) NOT NULL COMMENT '履约商家id',
  `shop_id` int(11) NOT NULL COMMENT '履约门店id',
  `group_id` int(11) NOT NULL COMMENT '团id',
  `category_ids` text COMMENT '该商品所属分类id，用“,”分割',
  `ware_alias_name` varchar(100) NOT NULL DEFAULT '' COMMENT '拼团商品别名，默认为商品名称',
  `ware_subtitle` varchar(100) DEFAULT NULL COMMENT '拼团商品副标题',
  `ware_img_url` varchar(1000) DEFAULT NULL COMMENT '拼团商品列表图片',
  `share_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分享信息是否打开：0-打开；1-关闭。默认为关闭',
  `share_title` varchar(100) NOT NULL DEFAULT '' COMMENT '分享标题',
  `share_img_url` varchar(100) DEFAULT NULL COMMENT '分享图片url',
  `sale_num` int(11) DEFAULT NULL COMMENT '团商品已售数量',
  `visurl_num` int(11) DEFAULT NULL COMMENT '团商品基础售卖数量',
  `current_customer` varchar(100) DEFAULT NULL COMMENT '最近购买该商品的客户昵称',
  `sort` int(11) DEFAULT NULL COMMENT '商品排序，从1开始递增',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ware_id` (`ware_id`) COMMENT '商品ID索引',
  KEY `index_vender_id` (`vender_id`) COMMENT '商家ID索引',
  KEY `index_shop_id` (`shop_id`) COMMENT '门店ID索引',
  KEY `index_group_id` (`group_id`) COMMENT '团ID索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团商品信息表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = data_bussi_performance   */
/******************************************/
CREATE TABLE `data_bussi_performance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统计日期',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `store_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名',
  `order_pay_num` int(10) DEFAULT '0' COMMENT '下单数',
  `order_complete_num` int(10) DEFAULT '0' COMMENT '妥投订单数',
  `order_cancel_num` int(10) DEFAULT '0' COMMENT '订单取消数',
  `cancel_numerator` int(10) DEFAULT '0' COMMENT '订单取消率分子',
  `cancel_denominator` int(10) DEFAULT '0' COMMENT '订单取消率分母',
  `picking_numerator` int(10) DEFAULT '0' COMMENT '拣货及时率分子',
  `picking_denominator` int(10) DEFAULT '0' COMMENT '拣货及时率分母',
  `shortage_numerator` int(10) DEFAULT '0' COMMENT '缺货率分子',
  `shortage_denominator` int(10) DEFAULT '0' COMMENT '缺货率分母',
  `nogoods_numerator` int(10) DEFAULT '0' COMMENT '全天无货率分子',
  `nogoods_denominator` int(10) DEFAULT '0' COMMENT '全天无货率分母',
  `order_complete_numerator` int(10) DEFAULT '0' COMMENT '妥投及时率分子',
  `order_complete_denominator` int(10) DEFAULT '0' COMMENT '妥投及时率分母',
  `refund_numerator` int(10) DEFAULT '0' COMMENT '退货率分子',
  `refund_denominator` int(10) DEFAULT '0' COMMENT '退货率分母',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_vander_id` (`vender_id`) USING BTREE COMMENT '商家ID索引',
  KEY `index_store_id` (`store_id`) USING BTREE COMMENT '门店ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=16611922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='履约业务数据表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = data_core_daily   */
/******************************************/
CREATE TABLE `data_core_daily` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统计日期',
  `dau_num` int(10) DEFAULT '0' COMMENT '日活跃人数',
  `new_user_num` int(10) DEFAULT '0' COMMENT '新注册用户数',
  `visit_num` int(10) DEFAULT '0' COMMENT '访问次数',
  `share_num` int(10) DEFAULT '0' COMMENT '分享次数',
  `share_order_num` int(10) DEFAULT '0' COMMENT '订单分享次数',
  `share_ware_num` int(10) DEFAULT '0' COMMENT '商品分享次数',
  `share_open_ratio` double(8,4) DEFAULT '0.0000' COMMENT '分享打开率',
  `share_buy_ratio` double(8,4) DEFAULT '0.0000' COMMENT '分享后购买率',
  `order_num` int(10) DEFAULT '0' COMMENT '订单数',
  `gmv_day` bigint(20) DEFAULT '0' COMMENT '每日GMV（分）',
  `customer_unit_price` int(10) DEFAULT '0' COMMENT '客单价（分）',
  `order_user_num` int(10) DEFAULT '0' COMMENT '下单用户数',
  `order_nuser_num` int(10) DEFAULT '0' COMMENT '新增下单用户数',
  `order_complete_ratio` double(8,4) DEFAULT '0.0000' COMMENT '妥投及时率',
  `picking_ratio` double(8,4) DEFAULT '0.0000' COMMENT '拣货及时率',
  `refund_ratio` double(8,4) DEFAULT '0.0000' COMMENT '退款率',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='核心每日观测数据表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = data_core_group   */
/******************************************/
CREATE TABLE `data_core_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统计日期',
  `group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '团ID',
  `group_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '团名称',
  `days_gmv1` int(10) DEFAULT '0' COMMENT '连续7天销售额（分）',
  `days_user_num1` int(10) DEFAULT '0' COMMENT '连续7天购买用户数',
  `days_gmv2` int(10) DEFAULT '0' COMMENT '连续14天销售额（分）',
  `days_user_num2` int(10) DEFAULT '0' COMMENT '连续14天购买用户数',
  `is_warn` tinyint(2) DEFAULT '0' COMMENT '预警团（0-否，1-是）',
  `is_close` tinyint(2) DEFAULT '0' COMMENT '建议关闭团（0-否，1-是）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78345562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='核心团运营数据表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = data_core_total   */
/******************************************/
CREATE TABLE `data_core_total` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dt` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '统计日期',
  `order_complete_num` bigint(20) DEFAULT '0' COMMENT '妥投订单数',
  `total_gmv` bigint(20) DEFAULT '0' COMMENT 'GMV（分）',
  `user_complete_num` int(10) DEFAULT '0' COMMENT '妥投用户数',
  `customer_unit_price` int(10) DEFAULT '0' COMMENT '客单价（分）',
  `total_user_num` int(10) DEFAULT '0' COMMENT '总用户数',
  `new_user_num` int(10) DEFAULT '0' COMMENT '新用户数',
  `open_group_num` int(10) DEFAULT '0' COMMENT '开团数',
  `relation_store_num` int(10) DEFAULT '0' COMMENT '关联门店数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='核心累计数据表';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = order_mq_detail   */
/******************************************/
CREATE TABLE `order_mq_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息ID',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '消息内容',
  `topic` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MQ的topic',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态: 0初始化 1处理完成 2处理失败',
  `handle_count` int(11) NOT NULL DEFAULT '0' COMMENT '处理次数',
  `result` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '结果信息',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `i_mid_topic` (`msg_id`,`topic`)
) ENGINE=InnoDB AUTO_INCREMENT=238679522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单MQ消息详情';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = report_group_leader   */
/******************************************/
CREATE TABLE `report_group_leader` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `dt` varchar(20) DEFAULT NULL COMMENT '统计日期',
  `leader_name` varchar(50) DEFAULT NULL COMMENT '团长姓名',
  `group_name` varchar(50) DEFAULT NULL COMMENT '团名称',
  `vender_id` varchar(20) DEFAULT NULL COMMENT '所属商家',
  `store_id` varchar(20) DEFAULT NULL COMMENT '所属门店',
  `order_cnt` bigint(20) NOT NULL COMMENT '订单数量',
  `order_gmv` bigint(20) NOT NULL COMMENT '销售额',
  `order_pct` bigint(20) NOT NULL COMMENT '均价',
  `commission_total` bigint(20) NOT NULL COMMENT '团长佣金',
  `member_num` bigint(20) NOT NULL COMMENT '用户数量',
  `new_member_num` bigint(20) NOT NULL COMMENT '新用户数量',
  `ware_num` bigint(20) NOT NULL COMMENT '销售商品数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 - 1 无效  1 有效',
  `group_id` int(10) DEFAULT NULL COMMENT '团id',
  `vender_name` varchar(20) DEFAULT NULL COMMENT '商家名称',
  `store_name` varchar(15) DEFAULT NULL COMMENT '门店名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_dt_grouo_id` (`dt`,`group_id`) USING BTREE,
  KEY `index_dt` (`dt`) USING BTREE,
  KEY `index_leader_name` (`leader_name`) USING BTREE,
  KEY `index_group_name` (`group_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21972762 DEFAULT CHARSET=utf8mb4 COMMENT='业务报表-团长销售';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = report_member   */
/******************************************/
CREATE TABLE `report_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `dt` varchar(20) DEFAULT NULL COMMENT '统计日期',
  `user_id` bigint(20) NOT NULL COMMENT '会员id',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员名称',
  `user_nick` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员昵称',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `regist_time` datetime NOT NULL COMMENT '注册时间',
  `group_name` varchar(100) DEFAULT NULL COMMENT '最近下单团名称',
  `vender_id` varchar(20) DEFAULT NULL COMMENT '所属商家',
  `store_id` varchar(20) DEFAULT NULL COMMENT '所属门店',
  `order_cnt` bigint(20) NOT NULL COMMENT '拼团订单数',
  `order_gmv` bigint(20) NOT NULL COMMENT '拼团订单总额',
  `order_pct` bigint(20) NOT NULL COMMENT '拼团客单价',
  `recommend_new` bigint(20) NOT NULL COMMENT '拼团拉新人数',
  `register_src` varchar(20) DEFAULT NULL COMMENT '注册端来源',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 - 1 无效  1 有效',
  `vender_name` varchar(20) DEFAULT NULL COMMENT '商家名',
  `store_name` varchar(20) DEFAULT NULL COMMENT '门店名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE,
  KEY `index_dt` (`dt`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=325213432 DEFAULT CHARSET=utf8mb4 COMMENT='业务报表-会员';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = report_operate_result   */
/******************************************/
CREATE TABLE `report_operate_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dt` varchar(20) DEFAULT NULL COMMENT '统计日期',
  `group_id` bigint(20) DEFAULT NULL COMMENT '团id',
  `group_name` varchar(100) DEFAULT NULL COMMENT '团名称',
  `register` bigint(20) DEFAULT NULL COMMENT '注册用户数',
  `total_pv` bigint(20) DEFAULT NULL COMMENT '总pv',
  `total_uv` bigint(20) DEFAULT NULL COMMENT '总uv',
  `home_pv` bigint(20) DEFAULT NULL COMMENT '首页pv',
  `home_uv` bigint(20) DEFAULT NULL COMMENT '首页uv',
  `total_order_num` bigint(20) DEFAULT NULL COMMENT '总单数',
  `total_order_user_num` bigint(20) DEFAULT NULL COMMENT '下单用户数',
  `total_sale_amount` bigint(20) DEFAULT NULL COMMENT '总销金额',
  `coupon_amount` bigint(20) DEFAULT NULL COMMENT '优惠券金额',
  `promotion_amount` bigint(20) DEFAULT NULL COMMENT '促销补贴费用',
  `total_share_user_num` bigint(20) DEFAULT NULL COMMENT '总分享人数',
  `total_share_num` bigint(20) DEFAULT NULL COMMENT '总分享次数',
  `home_share_user_num` bigint(20) DEFAULT NULL COMMENT '首页分享人数',
  `home_share_num` bigint(20) DEFAULT NULL COMMENT '首页分享次数',
  `ware_detail_share_user_num` bigint(20) DEFAULT NULL COMMENT '商品详情页分享人数',
  `ware_detail_share_num` bigint(20) DEFAULT NULL COMMENT '商品详情页分享次数',
  `pay_complete_share_user_num` bigint(20) DEFAULT NULL COMMENT '支付完成分享人数',
  `pay_complete_share_num` bigint(20) DEFAULT NULL COMMENT '支付完成分享次数',
  `new_user_pv` bigint(20) DEFAULT NULL COMMENT '新客PV',
  `new_user_order_num` bigint(20) DEFAULT NULL COMMENT '新客单量',
  `new_user_buy_num` bigint(20) DEFAULT NULL COMMENT '新客购买用户数',
  `new_user_buy_money` bigint(20) DEFAULT NULL COMMENT '新客销售金额',
  `new_user_coupon_money` bigint(20) DEFAULT NULL COMMENT '新客优惠券金额',
  `new_user_promotion_money` bigint(20) DEFAULT NULL COMMENT '新客促销补贴费用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效，1 有效，-1 无效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_dt_group_id` (`dt`,`group_id`) USING BTREE,
  KEY `index_dt` (`dt`) USING BTREE,
  KEY `index_group_name` (`group_name`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16735282 DEFAULT CHARSET=utf8 COMMENT='社区拼团小程序后台管理系统运营数据分析模块';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = report_shop   */
/******************************************/
CREATE TABLE `report_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `dt` varchar(20) DEFAULT NULL COMMENT '统计日期',
  `vender_id` varchar(20) DEFAULT NULL COMMENT '所属商家',
  `store_id` varchar(20) DEFAULT NULL COMMENT '所属门店',
  `group_num` bigint(20) NOT NULL COMMENT '团数量',
  `order_cnt` bigint(20) NOT NULL COMMENT '订单数量',
  `order_gmv` bigint(20) NOT NULL COMMENT '销售额',
  `order_pct` bigint(20) NOT NULL COMMENT '均价',
  `commission_total` bigint(20) NOT NULL COMMENT '团长佣金',
  `member_num` bigint(20) NOT NULL COMMENT '用户数量',
  `new_member_num` bigint(20) NOT NULL COMMENT '新用户数量',
  `ware_num` bigint(20) NOT NULL COMMENT '销售商品数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 - 1 无效  1 有效',
  `vender_name` varchar(20) DEFAULT NULL COMMENT '商家名称',
  `store_name` varchar(20) DEFAULT NULL COMMENT '门店名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_dt_vender_id_store_id` (`dt`,`vender_id`,`store_id`) USING BTREE,
  KEY `index_dt` (`dt`) USING BTREE,
  KEY `index_store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7115122 DEFAULT CHARSET=utf8mb4 COMMENT='业务报表-门店销售';


/******************************************/
/*   DatabaseName = dmall_collage   */
/*   TableName = report_ware   */
/******************************************/
CREATE TABLE `report_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `dt` varchar(20) DEFAULT NULL COMMENT '统计日期',
  `sku_id` bigint(50) NOT NULL COMMENT '商品SKU',
  `item_num` varchar(50) DEFAULT NULL COMMENT '国际码',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `ware_num` bigint(20) NOT NULL COMMENT '销量',
  `order_cnt` bigint(20) NOT NULL COMMENT '订单数量',
  `order_gmv` bigint(20) NOT NULL COMMENT '销售额',
  `order_pct` bigint(20) NOT NULL COMMENT '均价',
  `max_ware_price` bigint(20) NOT NULL COMMENT '最高售价',
  `min_ware_price` bigint(20) NOT NULL COMMENT '最低售价',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 - 1 无效  1 有效',
  `vender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_dt_sku_id` (`dt`,`sku_id`) USING BTREE,
  KEY `index_dt` (`dt`) USING BTREE,
  KEY `index_sku` (`sku_id`) USING BTREE,
  KEY `index_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31254722 DEFAULT CHARSET=utf8mb4 COMMENT='业务报表-商品销售';


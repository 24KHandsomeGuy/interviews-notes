-- Export Tools
-- Time: 2024-04-16 16:49:58
-- Service: s3407i.jxq.db.dmall.com:3407   Database: dmall_rate
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_application   */
/******************************************/
CREATE TABLE `config_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application` varchar(50) NOT NULL COMMENT '应用名称',
  `owner` varchar(50) DEFAULT NULL COMMENT '负责人的邮箱',
  `token` varchar(100) DEFAULT NULL COMMENT '应用的token',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建应用的erp账户',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价接入应用表';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_biz   */
/******************************************/
CREATE TABLE `config_biz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL COMMENT '业务类型code',
  `name` varchar(50) NOT NULL COMMENT '业务名称',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建者erp账户',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_upload_img` int(11) DEFAULT '1' COMMENT '启用上传图片；1:是;0:否',
  `is_message` int(11) DEFAULT '1' COMMENT '是否启用客户留言.1:启用;0:不启用',
  `star_type` int(11) DEFAULT '5' COMMENT '星级配置：3:三星;5:五星',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='评价业务配置表';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_norm   */
/******************************************/
CREATE TABLE `config_norm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(20) DEFAULT NULL COMMENT '业务类型编码',
  `type_name` varchar(20) DEFAULT NULL COMMENT '业务名称',
  `norm_name` varchar(20) DEFAULT NULL COMMENT '指标名称',
  `reply_template` varchar(150) DEFAULT NULL COMMENT '回复模版',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `tips` varchar(1024) DEFAULT NULL COMMENT '指标描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3281 DEFAULT CHARSET=utf8 COMMENT='指标配置';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_privileges   */
/******************************************/
CREATE TABLE `config_privileges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '授权的应用',
  `biz_type` varchar(30) NOT NULL COMMENT '业务类型的code',
  `privileges` int(11) NOT NULL DEFAULT '0' COMMENT '接入的权限',
  `creator` bigint(20) DEFAULT NULL COMMENT '建创者的erp账户',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价接入鉴权表';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_star   */
/******************************************/
CREATE TABLE `config_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(20) DEFAULT NULL COMMENT '业务类型编码',
  `type_name` varchar(20) DEFAULT NULL COMMENT '业务名称',
  `score` int(11) DEFAULT NULL COMMENT '星级分数',
  `star_name` varchar(10) DEFAULT NULL COMMENT '星级名称',
  `is_upload_img` tinyint(1) DEFAULT NULL COMMENT '是否需要上传图片',
  `is_message` tinyint(1) DEFAULT NULL COMMENT '是否需要留言',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_score_typeCode` (`score`,`type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='星级配置';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = config_star_norm   */
/******************************************/
CREATE TABLE `config_star_norm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `norm_id` int(11) DEFAULT NULL COMMENT '引用指标管理表主键',
  `star_id` int(11) DEFAULT NULL COMMENT '引用星级管理表主键',
  PRIMARY KEY (`id`),
  KEY `idx_star_id` (`star_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168161 DEFAULT CHARSET=utf8 COMMENT='星级和指标关联中间表';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = negative_word   */
/******************************************/
CREATE TABLE `negative_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `vendor_id` int(11) NOT NULL COMMENT '商家ID',
  `keyword` varchar(32) NOT NULL COMMENT '关键字',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_vendor_id` int(11) DEFAULT NULL COMMENT '创建数据商家id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_negative_word` (`vendor_id`,`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=48921 DEFAULT CHARSET=utf8mb4 COMMENT='负向词库';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = negative_word_last_update   */
/******************************************/
CREATE TABLE `negative_word_last_update` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `vendor_id` int(11) NOT NULL COMMENT '商家ID',
  `update_type` int(2) DEFAULT NULL COMMENT '修改类型 1:词库 2:评论',
  `last_update` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_negative_word_last_update` (`vendor_id`,`update_type`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COMMENT='负向词最后更新时间';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = operate_log   */
/******************************************/
CREATE TABLE `operate_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `norm_id` bigint(20) DEFAULT NULL COMMENT 'norm_id',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `detail_msg` varchar(150) DEFAULT NULL COMMENT '详情',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `operator_id` bigint(1) DEFAULT NULL COMMENT '操作人ID',
  `log_type` int(11) DEFAULT '1' COMMENT '日志类型:1:配置数据;2:用户数据',
  `operate_type` int(11) DEFAULT NULL COMMENT '操作类型：1：商品图片审核；2：全部显示商品评价；3：全部隐藏商品评价；4：更新差评回复主体',
  `type_code` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `data_id` varchar(255) DEFAULT NULL COMMENT '数据ID',
  `yn` int(11) DEFAULT NULL COMMENT '数据有效性;1:有效;-1:无效',
  PRIMARY KEY (`id`),
  KEY `idx_type_code_data_id_operate_type` (`type_code`,`data_id`,`operate_type`),
  KEY `data_id` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=381961 DEFAULT CHARSET=utf8 COMMENT='操作日志';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = rate_check   */
/******************************************/
CREATE TABLE `rate_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erp_user_id` int(11) DEFAULT NULL COMMENT 'erp用户ID',
  `type_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论类型',
  `rating_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论ID',
  `expired_time` datetime DEFAULT NULL COMMENT '过期时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_type_code_erp_user_rating` (`type_code`,`erp_user_id`,`rating_id`,`yn`),
  KEY `idx_expired_time` (`expired_time`)
) ENGINE=InnoDB AUTO_INCREMENT=167602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论审核';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = rate_content   */
/******************************************/
CREATE TABLE `rate_content` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `content_type` int(11) DEFAULT NULL COMMENT '内容类型',
  `interact_type` int(11) NOT NULL DEFAULT '1' COMMENT '类型.1:评论;2:回复',
  `biz_type` varchar(20) DEFAULT NULL COMMENT '业务类型',
  `obj_id` varchar(50) NOT NULL DEFAULT '' COMMENT '评论对象',
  `obj_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对象标签',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `out_biz_id` varchar(50) DEFAULT NULL COMMENT '关联外部业务ID',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `is_show` int(11) DEFAULT '1' COMMENT '是否显示:1:是;0:否',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '审核状态(0:待审核；1:审核通过；2:审核不通过)',
  `tags` varchar(2048) DEFAULT NULL COMMENT '扩展字段',
  `parent_id` bigint(1) DEFAULT NULL COMMENT '父ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `attachments` varchar(512) DEFAULT NULL COMMENT '附件JSON',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `ip` varchar(15) DEFAULT NULL COMMENT '客户端ip',
  `ip_address` varchar(100) DEFAULT NULL COMMENT 'ip所属地',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`),
  KEY `idex_biz_content_interact_type_obj_id_user_id` (`biz_type`,`content_type`,`interact_type`,`obj_id`,`user_id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1619041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='内容评论表。记录内容评论的评论内容和回复';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = rate_order_pickup   */
/******************************************/
CREATE TABLE `rate_order_pickup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` varchar(255) DEFAULT NULL COMMENT '评论对象的id',
  `out_biz_id` varchar(50) DEFAULT NULL COMMENT '关联外部业务ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `content_length` int(11) DEFAULT NULL COMMENT '评论内容长度',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `attachments` varchar(1024) DEFAULT NULL COMMENT '附件',
  `score` int(11) DEFAULT NULL COMMENT '分数',
  `tags` varchar(512) DEFAULT NULL COMMENT '扩展字段',
  `is_show` int(11) DEFAULT NULL COMMENT '是否显示.1: 是;0:否',
  `priority` int(11) DEFAULT NULL COMMENT '显示顺序的优先级，越低的越靠前',
  `status` int(11) DEFAULT NULL COMMENT '审核状态(0:待审核；1:审核通过；2:审核不通过)',
  `is_exist_pic` int(11) DEFAULT NULL COMMENT '是否有图片；1： 是;0:否',
  `is_exist_reply` int(11) DEFAULT NULL COMMENT '是否存在回复 1：是；０：否',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `anonymous` int(11) DEFAULT NULL COMMENT '是否是匿名;1:是;0:否',
  `order_submit_time` datetime DEFAULT NULL COMMENT '订单提交时间',
  `employee_id` varchar(50) DEFAULT NULL COMMENT '员工编码',
  `employee_name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_created_order_submit_time` (`created`,`order_submit_time`),
  KEY `idx_obj_id` (`obj_id`),
  KEY `idx_out_biz_id` (`out_biz_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25235161 DEFAULT CHARSET=utf8 COMMENT='自提评论';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = rate_order_station   */
/******************************************/
CREATE TABLE `rate_order_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` varchar(255) DEFAULT NULL COMMENT '评论对象的id',
  `out_biz_id` varchar(50) DEFAULT NULL COMMENT '关联外部业务ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `content_length` int(11) DEFAULT NULL COMMENT '评论内容长度',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `attachments` varchar(1024) DEFAULT NULL COMMENT '附件',
  `score` int(11) DEFAULT NULL COMMENT '分数',
  `tags` varchar(512) DEFAULT NULL COMMENT '扩展字段',
  `is_show` int(11) DEFAULT NULL COMMENT '是否显示.1: 是;0:否',
  `priority` int(11) DEFAULT NULL COMMENT '显示顺序的优先级，越低的越靠前',
  `status` int(11) DEFAULT NULL COMMENT '审核状态(0:待审核；1:审核通过；2:审核不通过)',
  `is_exist_pic` int(11) DEFAULT NULL COMMENT '是否有图片；1： 是;0:否',
  `is_exist_reply` int(11) DEFAULT NULL COMMENT '是否存在回复 1：是；０：否',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `anonymous` int(11) DEFAULT NULL COMMENT '是否是匿名;1:是;0:否',
  `order_submit_time` datetime DEFAULT NULL COMMENT '订单提交时间',
  `employee_id` varchar(50) DEFAULT NULL COMMENT '员工编码',
  `employee_name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`),
  KEY `idx_obj_id` (`obj_id`),
  KEY `idx_out_biz_id` (`out_biz_id`),
  KEY `idx_created_order_submit_time` (`created`,`order_submit_time`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121722 DEFAULT CHARSET=utf8 COMMENT='提货站评论';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = rate_takeaway   */
/******************************************/
CREATE TABLE `rate_takeaway` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_source` int(2) NOT NULL COMMENT '渠道来源（饿了么-1，京东到家-3，美团-4）',
  `vendor_id` int(11) NOT NULL COMMENT '商家id',
  `vendor_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家名称',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店名称',
  `comment_id` bigint(20) NOT NULL COMMENT '评论id',
  `order_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `third_order_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '三方订单号',
  `comment_time` datetime DEFAULT NULL COMMENT '评论时间',
  `comment_content` text COLLATE utf8mb4_unicode_ci COMMENT '评论内容',
  `reply_status` int(2) NOT NULL DEFAULT '0' COMMENT '回复状态（0-未回复，1-审核中，2-回复成功，3-回复失败）',
  `can_edit_reply` int(2) NOT NULL DEFAULT '0' COMMENT '能否编辑回复（0-不可以，1-可以）',
  `delivery_comment_score` int(2) DEFAULT NULL COMMENT '配送评价分数',
  `delivery_tags` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送服务标签文字',
  `delivery_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送服务文字内容',
  `ship_time` int(5) DEFAULT NULL COMMENT '配送时间（分钟）',
  `vender_comment_score` int(2) DEFAULT NULL COMMENT '商品服务评价分数',
  `vender_tags` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品服务标签文字',
  `vender_content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品服务文字内容',
  `order_comment_score` int(2) DEFAULT NULL COMMENT '质量评价分数',
  `packing_score` int(2) DEFAULT NULL COMMENT '包装评价分数',
  `comment_pictures` text COLLATE utf8mb4_unicode_ci COMMENT '评价图片',
  `goods_details` text COLLATE utf8mb4_unicode_ci COMMENT '商品评价列表',
  `reply_pin` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '回复人账号',
  `reply_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复人名称',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `reply_content` text COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `add_comment_time` datetime DEFAULT NULL COMMENT '追评时间',
  `add_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '追评内容',
  `rate_type` int(1) NOT NULL COMMENT '评价类型（1-差评，2-中评，3-好评）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(1) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_commentId_channel` (`comment_id`,`channel_source`) USING BTREE,
  KEY `idx_replyStatus_rateType` (`reply_status`,`rate_type`) USING BTREE,
  KEY `idx_channel_vendor_store` (`channel_source`,`vendor_id`,`store_id`) USING BTREE,
  KEY `idx_orderId` (`order_id`) USING BTREE,
  KEY `idx_vendor_rateType_store` (`vendor_id`,`rate_type`,`store_id`) USING BTREE,
  KEY `idx_rateType_commentTime` (`rate_type`,`comment_time`)
) ENGINE=InnoDB AUTO_INCREMENT=77146521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='外卖平台评价';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = reply_subject   */
/******************************************/
CREATE TABLE `reply_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vendor_id` int(11) NOT NULL COMMENT '商家id',
  `dmall_subject` int(11) NOT NULL DEFAULT '0' COMMENT '多点平台回复主体（0：多点客服，1：商家客服）',
  `takeaway_subject` int(11) NOT NULL DEFAULT '0' COMMENT '外卖平台回复主体（0：多点客服，1：商家客服）',
  `creator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(1) NOT NULL DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_vendorId` (`vendor_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='评论主体配置';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = sensitive_word   */
/******************************************/
CREATE TABLE `sensitive_word` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(30) NOT NULL COMMENT '敏感词',
  `creator` bigint(20) DEFAULT NULL COMMENT '建创者的erp账户',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1723 DEFAULT CHARSET=utf8 COMMENT='敏感词';


/******************************************/
/*   DatabaseName = dmall_rate   */
/*   TableName = user_praise   */
/******************************************/
CREATE TABLE `user_praise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `obj_id` varchar(100) DEFAULT NULL,
  `type_code` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT '1' COMMENT '数据标识：1：正常;-1:删除',
  `parent_obj_id` varchar(50) DEFAULT NULL COMMENT '被点赞对象的上一级的对象ID',
  `sub_type` int(11) DEFAULT NULL COMMENT '业务子类型',
  PRIMARY KEY (`id`),
  KEY `idx_obj_type_user` (`obj_id`,`type_code`,`user_id`),
  KEY `idx_type_code_parent_obj_id` (`type_code`,`parent_obj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27594761 DEFAULT CHARSET=utf8 COMMENT='用户点赞表';


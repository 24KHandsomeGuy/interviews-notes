-- Export Tools
-- Time: 2024-04-16 16:44:41
-- Service: s3440i.jxq.db.dmall.com:3440   Database: dmall_token
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_cache   */
/******************************************/
CREATE TABLE `token_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '缓存内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `yn` tinyint(4) NOT NULL COMMENT '有效?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182803 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_message   */
/******************************************/
CREATE TABLE `token_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `task_id` bigint(20) DEFAULT NULL COMMENT '任务id',
  `task_name` varchar(50) NOT NULL COMMENT '任务名称',
  `push_start_time` datetime NOT NULL COMMENT '开始推送消息的时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务状态,0:待创建到美杜莎；1：待推送；2：正在推送；3：推送完成；4：取消任务；5：创建出错；6：推送出错',
  `operator_id` bigint(20) NOT NULL COMMENT '操作人id',
  `operator_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `receiver_type` tinyint(4) NOT NULL COMMENT '推送对象人群，1：数量大于某值；2：未使用过；3使用过',
  `receiver_type_value` int(11) DEFAULT NULL COMMENT '筛选推送对象人群时用的值',
  `sms_need` tinyint(4) NOT NULL COMMENT '是否发送短信，0：否；1：是',
  `sms_content` varchar(50) DEFAULT NULL COMMENT '内容',
  `sms_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `sms_channel` int(11) DEFAULT NULL COMMENT '发短信渠道，',
  `department_id` varchar(20) DEFAULT NULL COMMENT '推送方的部门id',
  `department_name` varchar(500) DEFAULT NULL COMMENT '推送方的部门名称',
  `app_push_need` tinyint(4) NOT NULL COMMENT '是否推送app push，0：否；1：是',
  `app_push_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `app_push_content` varchar(100) DEFAULT NULL COMMENT '内容',
  `app_push_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `created` datetime(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4),
  `modified` datetime(4) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(4),
  `yn` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `stop_push_date` datetime DEFAULT NULL COMMENT '停止推送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4041 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_message_record   */
/******************************************/
CREATE TABLE `token_message_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `push_id` bigint(20) NOT NULL COMMENT '对应token_message中的主键id',
  `operation` varchar(10) NOT NULL,
  `operator_id` bigint(20) NOT NULL,
  `operator_name` varchar(10) NOT NULL,
  `operate_time` datetime NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10361 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_000   */
/******************************************/
CREATE TABLE `token_operation_log_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17143538201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_001   */
/******************************************/
CREATE TABLE `token_operation_log_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17245622841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_002   */
/******************************************/
CREATE TABLE `token_operation_log_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17275913321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_003   */
/******************************************/
CREATE TABLE `token_operation_log_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17291937841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_004   */
/******************************************/
CREATE TABLE `token_operation_log_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17255284401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_005   */
/******************************************/
CREATE TABLE `token_operation_log_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17295752681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_006   */
/******************************************/
CREATE TABLE `token_operation_log_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17436057961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_007   */
/******************************************/
CREATE TABLE `token_operation_log_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17458536161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_008   */
/******************************************/
CREATE TABLE `token_operation_log_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17444714481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_operation_log_009   */
/******************************************/
CREATE TABLE `token_operation_log_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `token_id` int(11) NOT NULL COMMENT '令牌id',
  `operation` varchar(10) NOT NULL COMMENT '操作类型',
  `detail` varchar(16) NOT NULL COMMENT '操作详情',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户令牌的状态，1：有效；0：失效',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid_tokenid` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_operation_time` (`operation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17450966761 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_origin   */
/******************************************/
CREATE TABLE `token_origin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '令牌名称',
  `activity_name` varchar(200) DEFAULT NULL COMMENT '相关的活动名称',
  `type` varchar(50) NOT NULL COMMENT '令牌使用类别,1.多点卡系统,2.促销系统,3.任务系统',
  `status` tinyint(4) NOT NULL COMMENT '令牌状态,1.初始,2.有效,3.失效,4.作废',
  `receive_form` tinyint(4) NOT NULL COMMENT '令牌发放领取的形式,是1.定向发放,还是2.非定向领取',
  `start_time` datetime NOT NULL COMMENT '令牌领取的有效开始时间',
  `end_time` datetime NOT NULL COMMENT '令牌领取的有效结束时间',
  `amount_type` tinyint(4) DEFAULT NULL COMMENT '令牌领取总数限制的类型,1为不限制,2为限制',
  `amount` int(11) DEFAULT NULL COMMENT '令牌领取总数',
  `remain_amount` int(11) DEFAULT NULL COMMENT '令牌领取总数的剩余数量',
  `use_amount_type` tinyint(4) NOT NULL COMMENT '使用令牌的次数类型,1.无限制,2.固定次数,3.累加次数',
  `use_amount` int(11) DEFAULT NULL COMMENT '当选择为固定次数时,固定的次数值存入此字段',
  `invalid_type` tinyint(4) DEFAULT '0' COMMENT '令牌失效方式,1手动失效,2自动失效',
  `invalid_time` datetime DEFAULT NULL COMMENT '自动失效时,指定的失效截止时间',
  `valid_time_type` tinyint(4) DEFAULT NULL COMMENT '用户持有令牌的有效时间类型,1.无限制,2.相对时长,3.绝对时长',
  `valid_day_num` int(11) DEFAULT NULL COMMENT '当为相对时长时的有效天数',
  `user_start_time` datetime DEFAULT NULL COMMENT '用户有效绝对时间的开始时间',
  `user_end_time` datetime DEFAULT NULL COMMENT '用户有效绝对时间的结束时间',
  `proposer_id` int(11) DEFAULT NULL COMMENT '令牌创建人id',
  `proposer_name` varchar(100) DEFAULT NULL COMMENT '令牌创建人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `is_nature_day` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:24小时制/1:自然日制',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家id',
  `source_platform` tinyint(4) DEFAULT NULL COMMENT '创建平台枚举，1：erp，2：营销erp，3：来客，4：营销来客',
  `vender_name` varchar(20) DEFAULT NULL COMMENT '商家名字',
  `activity_type` tinyint(4) DEFAULT NULL COMMENT '活动类型，1：多点令牌；2：商家令牌',
  `valid_time_unit` tinyint(4) DEFAULT NULL COMMENT '独立有效期的时间单位，1：天：2：月',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253201 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_origin_log   */
/******************************************/
CREATE TABLE `token_origin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_origin_id` bigint(20) NOT NULL COMMENT '令牌id',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `token_origin_status` varchar(100) NOT NULL COMMENT '令牌当前状态',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  PRIMARY KEY (`id`),
  KEY `token_origin_id` (`token_origin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=612241 DEFAULT CHARSET=utf8 COMMENT='令牌管理日志表';


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_transfer   */
/******************************************/
CREATE TABLE `token_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL,
  `token_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配置需要转移到独立会员id上的令牌id';


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user   */
/******************************************/
CREATE TABLE `token_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `arr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_arr` (`arr`)
) ENGINE=InnoDB AUTO_INCREMENT=44339011 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_0   */
/******************************************/
CREATE TABLE `token_user_0` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=680741881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_1   */
/******************************************/
CREATE TABLE `token_user_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684103401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_10   */
/******************************************/
CREATE TABLE `token_user_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683085441 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_11   */
/******************************************/
CREATE TABLE `token_user_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682881241 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_12   */
/******************************************/
CREATE TABLE `token_user_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=685072201 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_13   */
/******************************************/
CREATE TABLE `token_user_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684662041 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_14   */
/******************************************/
CREATE TABLE `token_user_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684675321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_15   */
/******************************************/
CREATE TABLE `token_user_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682389081 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_16   */
/******************************************/
CREATE TABLE `token_user_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689045001 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_17   */
/******************************************/
CREATE TABLE `token_user_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=690471401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_18   */
/******************************************/
CREATE TABLE `token_user_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=690562681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_19   */
/******************************************/
CREATE TABLE `token_user_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687310161 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_2   */
/******************************************/
CREATE TABLE `token_user_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684010721 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_20   */
/******************************************/
CREATE TABLE `token_user_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681878721 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_21   */
/******************************************/
CREATE TABLE `token_user_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682629601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_22   */
/******************************************/
CREATE TABLE `token_user_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683755321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_23   */
/******************************************/
CREATE TABLE `token_user_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684866121 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_24   */
/******************************************/
CREATE TABLE `token_user_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=680727921 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_25   */
/******************************************/
CREATE TABLE `token_user_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681531961 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_26   */
/******************************************/
CREATE TABLE `token_user_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=688153761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_27   */
/******************************************/
CREATE TABLE `token_user_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691794481 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_28   */
/******************************************/
CREATE TABLE `token_user_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689061521 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_29   */
/******************************************/
CREATE TABLE `token_user_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689082481 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_3   */
/******************************************/
CREATE TABLE `token_user_3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686379521 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_30   */
/******************************************/
CREATE TABLE `token_user_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=678676201 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_31   */
/******************************************/
CREATE TABLE `token_user_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=685781121 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_32   */
/******************************************/
CREATE TABLE `token_user_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684201721 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_33   */
/******************************************/
CREATE TABLE `token_user_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684698681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_34   */
/******************************************/
CREATE TABLE `token_user_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681039801 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_35   */
/******************************************/
CREATE TABLE `token_user_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=681481681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_36   */
/******************************************/
CREATE TABLE `token_user_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=692705881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_37   */
/******************************************/
CREATE TABLE `token_user_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689916361 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_38   */
/******************************************/
CREATE TABLE `token_user_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684550081 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_39   */
/******************************************/
CREATE TABLE `token_user_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689959921 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_4   */
/******************************************/
CREATE TABLE `token_user_4` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=685221401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_40   */
/******************************************/
CREATE TABLE `token_user_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=678967601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_41   */
/******************************************/
CREATE TABLE `token_user_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683221521 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_42   */
/******************************************/
CREATE TABLE `token_user_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686736241 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_43   */
/******************************************/
CREATE TABLE `token_user_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683731961 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_44   */
/******************************************/
CREATE TABLE `token_user_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682821401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_45   */
/******************************************/
CREATE TABLE `token_user_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684843321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_46   */
/******************************************/
CREATE TABLE `token_user_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=690739041 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_47   */
/******************************************/
CREATE TABLE `token_user_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687293641 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_48   */
/******************************************/
CREATE TABLE `token_user_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689396921 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_49   */
/******************************************/
CREATE TABLE `token_user_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=688315761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_5   */
/******************************************/
CREATE TABLE `token_user_5` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683252801 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_50   */
/******************************************/
CREATE TABLE `token_user_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=680859681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_51   */
/******************************************/
CREATE TABLE `token_user_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684326801 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_52   */
/******************************************/
CREATE TABLE `token_user_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683194321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_53   */
/******************************************/
CREATE TABLE `token_user_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=680715641 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_54   */
/******************************************/
CREATE TABLE `token_user_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683452281 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_55   */
/******************************************/
CREATE TABLE `token_user_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687159281 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_56   */
/******************************************/
CREATE TABLE `token_user_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687612761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_57   */
/******************************************/
CREATE TABLE `token_user_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=688668321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_58   */
/******************************************/
CREATE TABLE `token_user_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=690059761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_59   */
/******************************************/
CREATE TABLE `token_user_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689799121 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_6   */
/******************************************/
CREATE TABLE `token_user_6` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686042081 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_60   */
/******************************************/
CREATE TABLE `token_user_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682435081 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_61   */
/******************************************/
CREATE TABLE `token_user_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683151041 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_62   */
/******************************************/
CREATE TABLE `token_user_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684275761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_63   */
/******************************************/
CREATE TABLE `token_user_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686609801 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_64   */
/******************************************/
CREATE TABLE `token_user_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=679264241 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_65   */
/******************************************/
CREATE TABLE `token_user_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684601441 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_66   */
/******************************************/
CREATE TABLE `token_user_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687553361 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_67   */
/******************************************/
CREATE TABLE `token_user_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691042441 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_68   */
/******************************************/
CREATE TABLE `token_user_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687131561 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_69   */
/******************************************/
CREATE TABLE `token_user_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689301881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_7   */
/******************************************/
CREATE TABLE `token_user_7` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=692066761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_70   */
/******************************************/
CREATE TABLE `token_user_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682056201 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_71   */
/******************************************/
CREATE TABLE `token_user_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684984241 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_72   */
/******************************************/
CREATE TABLE `token_user_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684630521 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_73   */
/******************************************/
CREATE TABLE `token_user_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683301481 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_74   */
/******************************************/
CREATE TABLE `token_user_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683316721 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_75   */
/******************************************/
CREATE TABLE `token_user_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683614441 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_76   */
/******************************************/
CREATE TABLE `token_user_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691019601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_77   */
/******************************************/
CREATE TABLE `token_user_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687486481 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_78   */
/******************************************/
CREATE TABLE `token_user_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=690781401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_79   */
/******************************************/
CREATE TABLE `token_user_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=691208601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_8   */
/******************************************/
CREATE TABLE `token_user_8` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=688612881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_80   */
/******************************************/
CREATE TABLE `token_user_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=679840961 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_81   */
/******************************************/
CREATE TABLE `token_user_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687148761 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_82   */
/******************************************/
CREATE TABLE `token_user_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=683737841 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_83   */
/******************************************/
CREATE TABLE `token_user_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686224121 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_84   */
/******************************************/
CREATE TABLE `token_user_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682340121 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_85   */
/******************************************/
CREATE TABLE `token_user_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684137081 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_86   */
/******************************************/
CREATE TABLE `token_user_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=692048481 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_87   */
/******************************************/
CREATE TABLE `token_user_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689869801 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_88   */
/******************************************/
CREATE TABLE `token_user_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686275641 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_89   */
/******************************************/
CREATE TABLE `token_user_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689261721 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_9   */
/******************************************/
CREATE TABLE `token_user_9` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=689935041 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_90   */
/******************************************/
CREATE TABLE `token_user_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682150041 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_91   */
/******************************************/
CREATE TABLE `token_user_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684345001 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_92   */
/******************************************/
CREATE TABLE `token_user_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684383241 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_93   */
/******************************************/
CREATE TABLE `token_user_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686144561 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_94   */
/******************************************/
CREATE TABLE `token_user_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=684149881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_95   */
/******************************************/
CREATE TABLE `token_user_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=682519681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_96   */
/******************************************/
CREATE TABLE `token_user_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687457601 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_97   */
/******************************************/
CREATE TABLE `token_user_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687157321 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_98   */
/******************************************/
CREATE TABLE `token_user_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686928881 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_99   */
/******************************************/
CREATE TABLE `token_user_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '持有的令牌id',
  `status` tinyint(4) NOT NULL COMMENT '用户持有的令牌的有效状态,1.有效,0.无效',
  `remain_amount` int(11) DEFAULT NULL COMMENT '用户持有令牌的剩余使用次数',
  `start_time` datetime DEFAULT NULL COMMENT '用户令牌有效开始时间',
  `end_time` datetime NOT NULL COMMENT '用户令牌有效结束时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `used_amount` int(11) NOT NULL DEFAULT '0' COMMENT '已经使用的次数',
  `tdc` varchar(200) DEFAULT NULL COMMENT '一码到底追踪码',
  PRIMARY KEY (`id`),
  KEY `idx_cus_id_yn` (`cus_id`,`yn`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_status_yn_end_time` (`status`,`yn`,`end_time`),
  KEY `ix_token_origin_id` (`token_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=687427521 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_0   */
/******************************************/
CREATE TABLE `token_user_event_0` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1911681 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_1   */
/******************************************/
CREATE TABLE `token_user_event_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1958841 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_10   */
/******************************************/
CREATE TABLE `token_user_event_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899721 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_11   */
/******************************************/
CREATE TABLE `token_user_event_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1888121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_12   */
/******************************************/
CREATE TABLE `token_user_event_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1916801 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_13   */
/******************************************/
CREATE TABLE `token_user_event_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1935281 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_14   */
/******************************************/
CREATE TABLE `token_user_event_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1921881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_15   */
/******************************************/
CREATE TABLE `token_user_event_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1901281 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_16   */
/******************************************/
CREATE TABLE `token_user_event_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1893961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_17   */
/******************************************/
CREATE TABLE `token_user_event_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1906961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_18   */
/******************************************/
CREATE TABLE `token_user_event_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1893681 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_19   */
/******************************************/
CREATE TABLE `token_user_event_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1951961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_2   */
/******************************************/
CREATE TABLE `token_user_event_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1883801 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_20   */
/******************************************/
CREATE TABLE `token_user_event_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1911401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_21   */
/******************************************/
CREATE TABLE `token_user_event_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1908521 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_22   */
/******************************************/
CREATE TABLE `token_user_event_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1926401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_23   */
/******************************************/
CREATE TABLE `token_user_event_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1935761 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_24   */
/******************************************/
CREATE TABLE `token_user_event_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1911361 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_25   */
/******************************************/
CREATE TABLE `token_user_event_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1896601 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_26   */
/******************************************/
CREATE TABLE `token_user_event_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1890641 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_27   */
/******************************************/
CREATE TABLE `token_user_event_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1932761 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_28   */
/******************************************/
CREATE TABLE `token_user_event_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1984121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_29   */
/******************************************/
CREATE TABLE `token_user_event_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2034561 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_3   */
/******************************************/
CREATE TABLE `token_user_event_3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1900001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_30   */
/******************************************/
CREATE TABLE `token_user_event_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_31   */
/******************************************/
CREATE TABLE `token_user_event_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1998281 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_32   */
/******************************************/
CREATE TABLE `token_user_event_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1923321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_33   */
/******************************************/
CREATE TABLE `token_user_event_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1950161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_34   */
/******************************************/
CREATE TABLE `token_user_event_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1953881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_35   */
/******************************************/
CREATE TABLE `token_user_event_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1931921 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_36   */
/******************************************/
CREATE TABLE `token_user_event_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1946201 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_37   */
/******************************************/
CREATE TABLE `token_user_event_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1924161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_38   */
/******************************************/
CREATE TABLE `token_user_event_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1948921 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_39   */
/******************************************/
CREATE TABLE `token_user_event_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1869001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_4   */
/******************************************/
CREATE TABLE `token_user_event_4` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1915081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_40   */
/******************************************/
CREATE TABLE `token_user_event_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1877081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_41   */
/******************************************/
CREATE TABLE `token_user_event_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1903561 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_42   */
/******************************************/
CREATE TABLE `token_user_event_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1894601 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_43   */
/******************************************/
CREATE TABLE `token_user_event_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1905121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_44   */
/******************************************/
CREATE TABLE `token_user_event_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1894521 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_45   */
/******************************************/
CREATE TABLE `token_user_event_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1883281 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_46   */
/******************************************/
CREATE TABLE `token_user_event_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1917241 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_47   */
/******************************************/
CREATE TABLE `token_user_event_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1939161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_48   */
/******************************************/
CREATE TABLE `token_user_event_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1934921 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_49   */
/******************************************/
CREATE TABLE `token_user_event_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1923361 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_5   */
/******************************************/
CREATE TABLE `token_user_event_5` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1892121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_50   */
/******************************************/
CREATE TABLE `token_user_event_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1967801 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_51   */
/******************************************/
CREATE TABLE `token_user_event_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1901081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_52   */
/******************************************/
CREATE TABLE `token_user_event_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1905241 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_53   */
/******************************************/
CREATE TABLE `token_user_event_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1920441 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_54   */
/******************************************/
CREATE TABLE `token_user_event_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1914961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_55   */
/******************************************/
CREATE TABLE `token_user_event_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1907201 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_56   */
/******************************************/
CREATE TABLE `token_user_event_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1910041 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_57   */
/******************************************/
CREATE TABLE `token_user_event_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1912961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_58   */
/******************************************/
CREATE TABLE `token_user_event_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1890561 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_59   */
/******************************************/
CREATE TABLE `token_user_event_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1915481 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_6   */
/******************************************/
CREATE TABLE `token_user_event_6` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1914321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_60   */
/******************************************/
CREATE TABLE `token_user_event_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1900681 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_61   */
/******************************************/
CREATE TABLE `token_user_event_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1879601 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_62   */
/******************************************/
CREATE TABLE `token_user_event_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1897361 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_63   */
/******************************************/
CREATE TABLE `token_user_event_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2013081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_64   */
/******************************************/
CREATE TABLE `token_user_event_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1884241 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_65   */
/******************************************/
CREATE TABLE `token_user_event_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1937321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_66   */
/******************************************/
CREATE TABLE `token_user_event_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1883881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_67   */
/******************************************/
CREATE TABLE `token_user_event_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1906481 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_68   */
/******************************************/
CREATE TABLE `token_user_event_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1885481 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_69   */
/******************************************/
CREATE TABLE `token_user_event_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1906441 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_7   */
/******************************************/
CREATE TABLE `token_user_event_7` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1881841 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_70   */
/******************************************/
CREATE TABLE `token_user_event_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1910361 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_71   */
/******************************************/
CREATE TABLE `token_user_event_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1930921 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_72   */
/******************************************/
CREATE TABLE `token_user_event_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1904121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_73   */
/******************************************/
CREATE TABLE `token_user_event_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1910161 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_74   */
/******************************************/
CREATE TABLE `token_user_event_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1953481 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_75   */
/******************************************/
CREATE TABLE `token_user_event_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1924681 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_76   */
/******************************************/
CREATE TABLE `token_user_event_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1936761 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_77   */
/******************************************/
CREATE TABLE `token_user_event_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1913401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_78   */
/******************************************/
CREATE TABLE `token_user_event_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1964881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_79   */
/******************************************/
CREATE TABLE `token_user_event_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1887961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_8   */
/******************************************/
CREATE TABLE `token_user_event_8` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1911001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_80   */
/******************************************/
CREATE TABLE `token_user_event_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1919001 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_81   */
/******************************************/
CREATE TABLE `token_user_event_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1921081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_82   */
/******************************************/
CREATE TABLE `token_user_event_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1898081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_83   */
/******************************************/
CREATE TABLE `token_user_event_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1869521 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_84   */
/******************************************/
CREATE TABLE `token_user_event_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1934881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_85   */
/******************************************/
CREATE TABLE `token_user_event_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1876201 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_86   */
/******************************************/
CREATE TABLE `token_user_event_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1921081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_87   */
/******************************************/
CREATE TABLE `token_user_event_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1878521 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_88   */
/******************************************/
CREATE TABLE `token_user_event_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1867321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_89   */
/******************************************/
CREATE TABLE `token_user_event_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1903401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_9   */
/******************************************/
CREATE TABLE `token_user_event_9` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1897881 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_90   */
/******************************************/
CREATE TABLE `token_user_event_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1924321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_91   */
/******************************************/
CREATE TABLE `token_user_event_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1918961 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_92   */
/******************************************/
CREATE TABLE `token_user_event_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1956681 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_93   */
/******************************************/
CREATE TABLE `token_user_event_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899121 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_94   */
/******************************************/
CREATE TABLE `token_user_event_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1907481 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_95   */
/******************************************/
CREATE TABLE `token_user_event_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1907801 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_96   */
/******************************************/
CREATE TABLE `token_user_event_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1880321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_97   */
/******************************************/
CREATE TABLE `token_user_event_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1866321 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_98   */
/******************************************/
CREATE TABLE `token_user_event_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2058081 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_event_99   */
/******************************************/
CREATE TABLE `token_user_event_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token_user_id` bigint(20) DEFAULT NULL COMMENT '关联的token_user 表的id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `start_time` datetime DEFAULT NULL COMMENT '用户持有的该令牌的有效期的开始时间',
  `end_time` datetime NOT NULL COMMENT '用户持有的该令牌的有效期的结束时间',
  `amount` int(4) NOT NULL COMMENT '本次事件操作令牌的数量',
  `event_type` tinyint(2) DEFAULT NULL COMMENT '关联事件的类型',
  `event_key` varchar(64) DEFAULT NULL COMMENT '令牌领取、使用等事件的时候可以传入一个关联的事件的key',
  `event_desc` varchar(64) DEFAULT NULL COMMENT '关联事件的描述',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效；-1：无效',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(2) NOT NULL DEFAULT '1',
  `order_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userId_tokenId` (`user_id`,`token_id`) USING BTREE,
  KEY `idx_endTime` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1904921 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_file   */
/******************************************/
CREATE TABLE `token_user_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(100) NOT NULL COMMENT '上传的文件名',
  `status` tinyint(4) NOT NULL COMMENT '上传用户文件的状态,1.准备上传,2.上传中,3.上传完毕,4.上传异常',
  `token_origin_id` bigint(20) NOT NULL COMMENT '待发放令牌id',
  `user_count_white` int(11) NOT NULL COMMENT '上传的用户数（白名单）',
  `user_count_black` int(11) NOT NULL COMMENT '上传的用户数（黑名单）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64681 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_group   */
/******************************************/
CREATE TABLE `token_user_group` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '用户组Id',
  `group_name` varchar(64) NOT NULL COMMENT '用户组名称',
  `user_count` int(11) NOT NULL COMMENT '用户数量',
  `black_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '黑名单用户数量',
  `last_calculate_time` datetime NOT NULL COMMENT '上次计算时间',
  `operator_id` bigint(20) NOT NULL COMMENT '创建人id',
  `operator_name` varchar(64) NOT NULL COMMENT '创建人名',
  `token_id` bigint(20) NOT NULL COMMENT '令牌id',
  `task_id` varchar(64) NOT NULL DEFAULT '' COMMENT '拉取任务id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户组状态，1：待拉取，2：拉取中，3：拉取完毕，4：拉取异常，11：发放中，12：发放完毕，12:发放异常，21：删除中，22：删除完毕，23：删除异常',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77401 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_record   */
/******************************************/
CREATE TABLE `token_user_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '多点用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '令牌id',
  `token_user_send_result_id` bigint(20) DEFAULT NULL COMMENT '与发放结果关联的id，用户被发放令牌之后此属性会被赋值',
  `token_user_file_id` bigint(20) NOT NULL COMMENT '上传文件id',
  `status` tinyint(4) NOT NULL COMMENT '用户记录发放状态,0.为发放,1.成功,2.失败',
  `remark` varchar(100) DEFAULT NULL COMMENT '当status为2失败时，描述异常原因',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `proposer_id` int(11) DEFAULT NULL COMMENT '令牌发放人用户id',
  `proposer_name` varchar(100) DEFAULT NULL COMMENT '令牌发放人用户名称',
  `ajust_amount` int(11) DEFAULT NULL COMMENT '指定发放数量',
  `phone` varchar(16) DEFAULT NULL COMMENT '发放用户电话',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `file_id_yn_idx` (`token_user_file_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=36149646281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_record_back   */
/******************************************/
CREATE TABLE `token_user_record_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_id` bigint(20) NOT NULL COMMENT '多点用户id',
  `token_origin_id` bigint(20) NOT NULL COMMENT '令牌id',
  `token_user_send_result_id` bigint(20) DEFAULT NULL COMMENT '与发放结果关联的id，用户被发放令牌之后此属性会被赋值',
  `token_user_file_id` bigint(20) NOT NULL COMMENT '上传文件id',
  `status` tinyint(4) NOT NULL COMMENT '用户记录发放状态,0.为发放,1.成功,2.失败',
  `remark` varchar(100) DEFAULT NULL COMMENT '当status为2失败时，描述异常原因',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `proposer_id` int(11) DEFAULT NULL COMMENT '令牌发放人用户id',
  `proposer_name` varchar(100) DEFAULT NULL COMMENT '令牌发放人用户名称',
  PRIMARY KEY (`id`),
  KEY `idx_origin_file_id` (`token_origin_id`,`token_user_file_id`),
  KEY `idx_file_id` (`token_user_file_id`) USING BTREE,
  KEY `user_result_count` (`token_user_send_result_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72625656 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_user_send_result   */
/******************************************/
CREATE TABLE `token_user_send_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_send_time` datetime DEFAULT NULL COMMENT '发放令牌任务的开始时间',
  `end_send_time` datetime DEFAULT NULL COMMENT '发放令牌任务的结束时间',
  `status` tinyint(4) NOT NULL COMMENT '定向发放令牌的状态,1.待发放,2.发放总,3.发放完毕,4.发放异常',
  `remark` varchar(500) DEFAULT NULL COMMENT '发放情况说明信息',
  `token_origin_id` bigint(20) NOT NULL COMMENT '发放的令牌id',
  `token_origin_name` varchar(50) NOT NULL COMMENT '发放的令牌名称',
  `send_user_amount` int(11) NOT NULL DEFAULT '0' COMMENT '令牌发放的用户总数',
  `fail_user_amount` int(11) NOT NULL DEFAULT '0' COMMENT '令牌发放的失败的用户总数',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效的标记字段',
  `source_id` bigint(20) DEFAULT NULL COMMENT 'user_id 来源file id或group fetch id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108361 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_token   */
/*   TableName = token_vender   */
/******************************************/
CREATE TABLE `token_vender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token_id` bigint(20) NOT NULL,
  `privileged_vender_id` int(11) NOT NULL,
  `created` timestamp(4) NULL DEFAULT CURRENT_TIMESTAMP(4),
  `modified` timestamp(4) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(4),
  `yn` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `token_id_idx` (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=507401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


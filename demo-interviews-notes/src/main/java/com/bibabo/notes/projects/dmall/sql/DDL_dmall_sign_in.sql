-- Export Tools
-- Time: 2024-04-16 15:27:03
-- Service: s4543i.tc.db.inner-dmall.com:4543   Database: dmall_sign_in
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_activity   */
/******************************************/
CREATE TABLE `check_in_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '活动名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `type` smallint(6) DEFAULT NULL COMMENT '活动类型',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(10) DEFAULT NULL COMMENT '端',
  `status` smallint(6) DEFAULT NULL COMMENT '活动状态 0-创建未开始 4-进行中 8-已结束 ',
  `switch_on` tinyint(1) DEFAULT '1' COMMENT '启动状态',
  `creator` varchar(200) DEFAULT NULL COMMENT '推送内容',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人ERP ID',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `medusa_config` varchar(1024) DEFAULT NULL COMMENT '[ {''label'':''第一优先级人群'',''priority'':''1'',"medusaId",''name'':'''',''number'':''人群用户数'',''creator'':''人群创建人'',''type'':''1''} ]',
  `yn` smallint(6) DEFAULT '1',
  `jump_link` varchar(2048) DEFAULT NULL COMMENT '跳转链接',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `source` int(11) DEFAULT '1' COMMENT '系统来源(1:ERP, 2:来客)',
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id_platform_activity` (`tenant_id`,`platform`,`status`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=5561 DEFAULT CHARSET=utf8 COMMENT='签到活动';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_activity_rule   */
/******************************************/
CREATE TABLE `check_in_activity_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `type` smallint(6) DEFAULT NULL COMMENT '类型(1:普通签到，2：连续签到)',
  `require_times` int(11) DEFAULT NULL COMMENT '签到次数（针对连续签到)',
  `reward_way` smallint(6) DEFAULT NULL COMMENT '发放方式',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉任务ID',
  `reward_info` json DEFAULT NULL COMMENT '奖励配置',
  `user_group_priority` int(11) DEFAULT NULL COMMENT '人群优先级',
  `vendor_group` int(11) DEFAULT NULL COMMENT '商家组',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `creator` varchar(200) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_activity_vendor_type` (`activity_id`,`type`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=70401 DEFAULT CHARSET=utf8 COMMENT='签到活动规则';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_config   */
/******************************************/
CREATE TABLE `check_in_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `check_in_type` smallint(6) DEFAULT NULL COMMENT '签到类型（1：按端,2:按租户）',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_check_in_config_tenant` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_invite_act   */
/******************************************/
CREATE TABLE `check_in_invite_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '活动名称',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `type` smallint(6) DEFAULT NULL COMMENT '类型',
  `title` varchar(40) DEFAULT NULL COMMENT '活动标题',
  `rules` varchar(255) DEFAULT NULL COMMENT '活动规则',
  `share_title` varchar(40) DEFAULT NULL COMMENT '分享标题',
  `share_img` varchar(255) DEFAULT NULL,
  `invite_max` int(11) NOT NULL COMMENT '最大邀请人数',
  `status` smallint(6) DEFAULT NULL COMMENT '活动状态',
  `token_switch` smallint(6) DEFAULT NULL COMMENT '口令开关',
  `invite_prompt` varchar(120) DEFAULT NULL COMMENT '邀请好友弹窗文案',
  `token_prompt` varchar(120) DEFAULT NULL COMMENT '识别口令弹窗文案',
  `token_message` text CHARACTER SET utf8mb4 COMMENT '口令文案',
  `access_key` varchar(40) DEFAULT NULL COMMENT '潘多拉积分任务ID',
  `point_act_name` varchar(40) DEFAULT NULL COMMENT '潘多拉积分活动名称',
  `min_point` int(11) DEFAULT NULL COMMENT '最少积分数量',
  `avg_point` int(11) DEFAULT NULL COMMENT '平均积分数量',
  `max_point` int(11) DEFAULT NULL COMMENT '最大积分数量',
  `pandora_task` int(11) DEFAULT NULL COMMENT '潘多拉任务ID',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modified` datetime DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `platform` varchar(20) DEFAULT NULL COMMENT '端',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_post   */
/******************************************/
CREATE TABLE `check_in_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_info` json DEFAULT NULL COMMENT '签到公告配置',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  `platform` varchar(32) DEFAULT NULL COMMENT '平台',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='签到公告配置';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_reminder   */
/******************************************/
CREATE TABLE `check_in_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `push_time` varchar(20) DEFAULT NULL COMMENT '个推推送时间',
  `offline_push_time` varchar(20) DEFAULT NULL COMMENT '本地推送时间',
  `push_title` varchar(50) DEFAULT NULL COMMENT '推送标题',
  `push_content` varchar(150) DEFAULT NULL COMMENT '推送内容',
  `push_icon` varchar(150) DEFAULT NULL COMMENT '推送图标',
  `push_url` varchar(200) DEFAULT NULL COMMENT '签到页面地址',
  `title` varchar(50) DEFAULT NULL COMMENT '功能标题',
  `content` varchar(150) DEFAULT NULL COMMENT '功能文案',
  `switch_info` varchar(100) DEFAULT NULL COMMENT '开关提示信息',
  `status` tinyint(4) DEFAULT NULL COMMENT '功能开关',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='签到推送配置';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_reward_item   */
/******************************************/
CREATE TABLE `check_in_reward_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '奖励名称',
  `reward_type` smallint(6) DEFAULT NULL COMMENT '奖励类型',
  `total_stock` int(11) DEFAULT NULL COMMENT '奖励总量',
  `remain_stock` int(11) DEFAULT NULL COMMENT '剩余总量',
  `reward_info` varchar(64) DEFAULT NULL COMMENT '奖励信息',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `creator` varchar(200) DEFAULT NULL,
  `modifier` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4441 DEFAULT CHARSET=utf8 COMMENT='签到奖池配置';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = check_in_vendor_group   */
/******************************************/
CREATE TABLE `check_in_vendor_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '商家组名称',
  `vendor_list` json DEFAULT NULL COMMENT '门店列表',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '端',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx__tenant_id_platform` (`tenant_id`,`platform`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8 COMMENT='商家组配置';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_accepter   */
/******************************************/
CREATE TABLE `user_check_in_accepter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_id` int(11) DEFAULT NULL COMMENT '签到群组ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '被邀请人',
  `invite_act_id` int(11) DEFAULT NULL COMMENT '邀请活动ID',
  `status` smallint(6) DEFAULT NULL COMMENT '绑定状态(1:初始, 2:绑定成功)',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_invite_accepter_act` (`invite_act_id`) USING BTREE,
  KEY `idx_invite_accepter_grp` (`invite_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79877201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_inviter   */
/******************************************/
CREATE TABLE `user_check_in_inviter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_act_id` int(11) DEFAULT NULL COMMENT '邀请活动ID',
  `invite_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `inviter` bigint(20) DEFAULT NULL COMMENT '活动发起人',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_invite_inviter_code` (`invite_code`) USING BTREE,
  KEY `idx_invite_user_id` (`inviter`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80872601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_000   */
/******************************************/
CREATE TABLE `user_check_in_progress_000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10196601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_001   */
/******************************************/
CREATE TABLE `user_check_in_progress_001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10195921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_002   */
/******************************************/
CREATE TABLE `user_check_in_progress_002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10273321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_003   */
/******************************************/
CREATE TABLE `user_check_in_progress_003` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10288601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_004   */
/******************************************/
CREATE TABLE `user_check_in_progress_004` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10315121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_005   */
/******************************************/
CREATE TABLE `user_check_in_progress_005` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10241441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_006   */
/******************************************/
CREATE TABLE `user_check_in_progress_006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10152961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_007   */
/******************************************/
CREATE TABLE `user_check_in_progress_007` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10259041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_008   */
/******************************************/
CREATE TABLE `user_check_in_progress_008` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10303081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_009   */
/******************************************/
CREATE TABLE `user_check_in_progress_009` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10252401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_010   */
/******************************************/
CREATE TABLE `user_check_in_progress_010` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10246401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_011   */
/******************************************/
CREATE TABLE `user_check_in_progress_011` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10170121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_012   */
/******************************************/
CREATE TABLE `user_check_in_progress_012` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10301681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_013   */
/******************************************/
CREATE TABLE `user_check_in_progress_013` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10323321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_014   */
/******************************************/
CREATE TABLE `user_check_in_progress_014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10295481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_015   */
/******************************************/
CREATE TABLE `user_check_in_progress_015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10195121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_016   */
/******************************************/
CREATE TABLE `user_check_in_progress_016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10245281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_017   */
/******************************************/
CREATE TABLE `user_check_in_progress_017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10266401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_018   */
/******************************************/
CREATE TABLE `user_check_in_progress_018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10202361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_019   */
/******************************************/
CREATE TABLE `user_check_in_progress_019` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10215041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_020   */
/******************************************/
CREATE TABLE `user_check_in_progress_020` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10284201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_021   */
/******************************************/
CREATE TABLE `user_check_in_progress_021` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10199441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_022   */
/******************************************/
CREATE TABLE `user_check_in_progress_022` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10272841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_023   */
/******************************************/
CREATE TABLE `user_check_in_progress_023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10211081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_024   */
/******************************************/
CREATE TABLE `user_check_in_progress_024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10127161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_025   */
/******************************************/
CREATE TABLE `user_check_in_progress_025` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10189521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_026   */
/******************************************/
CREATE TABLE `user_check_in_progress_026` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10309161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_027   */
/******************************************/
CREATE TABLE `user_check_in_progress_027` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10366961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_028   */
/******************************************/
CREATE TABLE `user_check_in_progress_028` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10267001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_029   */
/******************************************/
CREATE TABLE `user_check_in_progress_029` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10209081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_030   */
/******************************************/
CREATE TABLE `user_check_in_progress_030` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10146041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_031   */
/******************************************/
CREATE TABLE `user_check_in_progress_031` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10246321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_032   */
/******************************************/
CREATE TABLE `user_check_in_progress_032` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10243401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_033   */
/******************************************/
CREATE TABLE `user_check_in_progress_033` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10212041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_034   */
/******************************************/
CREATE TABLE `user_check_in_progress_034` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10284441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_035   */
/******************************************/
CREATE TABLE `user_check_in_progress_035` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10186081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_036   */
/******************************************/
CREATE TABLE `user_check_in_progress_036` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10386841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_037   */
/******************************************/
CREATE TABLE `user_check_in_progress_037` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10231601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_038   */
/******************************************/
CREATE TABLE `user_check_in_progress_038` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10179401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_039   */
/******************************************/
CREATE TABLE `user_check_in_progress_039` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10314521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_040   */
/******************************************/
CREATE TABLE `user_check_in_progress_040` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10198361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_041   */
/******************************************/
CREATE TABLE `user_check_in_progress_041` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10123361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_042   */
/******************************************/
CREATE TABLE `user_check_in_progress_042` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10352441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_043   */
/******************************************/
CREATE TABLE `user_check_in_progress_043` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10166121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_044   */
/******************************************/
CREATE TABLE `user_check_in_progress_044` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10204921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_045   */
/******************************************/
CREATE TABLE `user_check_in_progress_045` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10238521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_046   */
/******************************************/
CREATE TABLE `user_check_in_progress_046` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10256601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_047   */
/******************************************/
CREATE TABLE `user_check_in_progress_047` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10186881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_048   */
/******************************************/
CREATE TABLE `user_check_in_progress_048` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10221201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_049   */
/******************************************/
CREATE TABLE `user_check_in_progress_049` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10222001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_050   */
/******************************************/
CREATE TABLE `user_check_in_progress_050` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10191201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_051   */
/******************************************/
CREATE TABLE `user_check_in_progress_051` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10242921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_052   */
/******************************************/
CREATE TABLE `user_check_in_progress_052` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10241201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_053   */
/******************************************/
CREATE TABLE `user_check_in_progress_053` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10168961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_054   */
/******************************************/
CREATE TABLE `user_check_in_progress_054` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10236721 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_055   */
/******************************************/
CREATE TABLE `user_check_in_progress_055` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10300561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_056   */
/******************************************/
CREATE TABLE `user_check_in_progress_056` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10154841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_057   */
/******************************************/
CREATE TABLE `user_check_in_progress_057` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10276321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_058   */
/******************************************/
CREATE TABLE `user_check_in_progress_058` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10199961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_059   */
/******************************************/
CREATE TABLE `user_check_in_progress_059` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10174881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_060   */
/******************************************/
CREATE TABLE `user_check_in_progress_060` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10262921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_061   */
/******************************************/
CREATE TABLE `user_check_in_progress_061` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10211881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_062   */
/******************************************/
CREATE TABLE `user_check_in_progress_062` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10186441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_063   */
/******************************************/
CREATE TABLE `user_check_in_progress_063` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10221601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_064   */
/******************************************/
CREATE TABLE `user_check_in_progress_064` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10148281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_065   */
/******************************************/
CREATE TABLE `user_check_in_progress_065` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10323201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_066   */
/******************************************/
CREATE TABLE `user_check_in_progress_066` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10244201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_067   */
/******************************************/
CREATE TABLE `user_check_in_progress_067` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10232001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_068   */
/******************************************/
CREATE TABLE `user_check_in_progress_068` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10105521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_069   */
/******************************************/
CREATE TABLE `user_check_in_progress_069` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10137601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_070   */
/******************************************/
CREATE TABLE `user_check_in_progress_070` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10195281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_071   */
/******************************************/
CREATE TABLE `user_check_in_progress_071` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10294281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_072   */
/******************************************/
CREATE TABLE `user_check_in_progress_072` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10155561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_073   */
/******************************************/
CREATE TABLE `user_check_in_progress_073` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10271601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_074   */
/******************************************/
CREATE TABLE `user_check_in_progress_074` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10267241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_075   */
/******************************************/
CREATE TABLE `user_check_in_progress_075` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10191241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_076   */
/******************************************/
CREATE TABLE `user_check_in_progress_076` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10340161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_077   */
/******************************************/
CREATE TABLE `user_check_in_progress_077` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10245521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_078   */
/******************************************/
CREATE TABLE `user_check_in_progress_078` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10228201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_079   */
/******************************************/
CREATE TABLE `user_check_in_progress_079` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10305601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_080   */
/******************************************/
CREATE TABLE `user_check_in_progress_080` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10124441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_081   */
/******************************************/
CREATE TABLE `user_check_in_progress_081` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10381521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_082   */
/******************************************/
CREATE TABLE `user_check_in_progress_082` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10299801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_083   */
/******************************************/
CREATE TABLE `user_check_in_progress_083` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10255321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_084   */
/******************************************/
CREATE TABLE `user_check_in_progress_084` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10135561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_085   */
/******************************************/
CREATE TABLE `user_check_in_progress_085` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10305681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_086   */
/******************************************/
CREATE TABLE `user_check_in_progress_086` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10253561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_087   */
/******************************************/
CREATE TABLE `user_check_in_progress_087` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10230841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_088   */
/******************************************/
CREATE TABLE `user_check_in_progress_088` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10161201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_089   */
/******************************************/
CREATE TABLE `user_check_in_progress_089` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10214281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_090   */
/******************************************/
CREATE TABLE `user_check_in_progress_090` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10222401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_091   */
/******************************************/
CREATE TABLE `user_check_in_progress_091` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10220241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_092   */
/******************************************/
CREATE TABLE `user_check_in_progress_092` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10223001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_093   */
/******************************************/
CREATE TABLE `user_check_in_progress_093` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10190001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_094   */
/******************************************/
CREATE TABLE `user_check_in_progress_094` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10246841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_095   */
/******************************************/
CREATE TABLE `user_check_in_progress_095` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10196561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_096   */
/******************************************/
CREATE TABLE `user_check_in_progress_096` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10147281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_097   */
/******************************************/
CREATE TABLE `user_check_in_progress_097` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10108801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_098   */
/******************************************/
CREATE TABLE `user_check_in_progress_098` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10138921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_progress_099   */
/******************************************/
CREATE TABLE `user_check_in_progress_099` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `progress_bar` int(11) DEFAULT NULL COMMENT '签到进度',
  `last_time` datetime DEFAULT NULL COMMENT '最近签到时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_progress` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10219601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_000   */
/******************************************/
CREATE TABLE `user_check_in_records_000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78140961 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_001   */
/******************************************/
CREATE TABLE `user_check_in_records_001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78543001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_002   */
/******************************************/
CREATE TABLE `user_check_in_records_002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79739801 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_003   */
/******************************************/
CREATE TABLE `user_check_in_records_003` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79928441 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_004   */
/******************************************/
CREATE TABLE `user_check_in_records_004` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79996401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_005   */
/******************************************/
CREATE TABLE `user_check_in_records_005` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78580761 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_006   */
/******************************************/
CREATE TABLE `user_check_in_records_006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76101401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_007   */
/******************************************/
CREATE TABLE `user_check_in_records_007` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78278481 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_008   */
/******************************************/
CREATE TABLE `user_check_in_records_008` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79188641 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_009   */
/******************************************/
CREATE TABLE `user_check_in_records_009` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79488561 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_010   */
/******************************************/
CREATE TABLE `user_check_in_records_010` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77662041 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_011   */
/******************************************/
CREATE TABLE `user_check_in_records_011` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77071841 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_012   */
/******************************************/
CREATE TABLE `user_check_in_records_012` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78463721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_013   */
/******************************************/
CREATE TABLE `user_check_in_records_013` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79718241 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_014   */
/******************************************/
CREATE TABLE `user_check_in_records_014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79076161 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_015   */
/******************************************/
CREATE TABLE `user_check_in_records_015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77821361 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_016   */
/******************************************/
CREATE TABLE `user_check_in_records_016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77655161 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_017   */
/******************************************/
CREATE TABLE `user_check_in_records_017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78985081 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_018   */
/******************************************/
CREATE TABLE `user_check_in_records_018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77364361 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_019   */
/******************************************/
CREATE TABLE `user_check_in_records_019` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78072721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_020   */
/******************************************/
CREATE TABLE `user_check_in_records_020` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78929121 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_021   */
/******************************************/
CREATE TABLE `user_check_in_records_021` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77252281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_022   */
/******************************************/
CREATE TABLE `user_check_in_records_022` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77606481 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_023   */
/******************************************/
CREATE TABLE `user_check_in_records_023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79624481 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_024   */
/******************************************/
CREATE TABLE `user_check_in_records_024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77676401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_025   */
/******************************************/
CREATE TABLE `user_check_in_records_025` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77784281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_026   */
/******************************************/
CREATE TABLE `user_check_in_records_026` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78745681 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_027   */
/******************************************/
CREATE TABLE `user_check_in_records_027` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81041201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_028   */
/******************************************/
CREATE TABLE `user_check_in_records_028` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79310081 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_029   */
/******************************************/
CREATE TABLE `user_check_in_records_029` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78005561 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_030   */
/******************************************/
CREATE TABLE `user_check_in_records_030` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77058401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_031   */
/******************************************/
CREATE TABLE `user_check_in_records_031` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78394041 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_032   */
/******************************************/
CREATE TABLE `user_check_in_records_032` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78790281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_033   */
/******************************************/
CREATE TABLE `user_check_in_records_033` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78308201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_034   */
/******************************************/
CREATE TABLE `user_check_in_records_034` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78086001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_035   */
/******************************************/
CREATE TABLE `user_check_in_records_035` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76747201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_036   */
/******************************************/
CREATE TABLE `user_check_in_records_036` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80245361 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_037   */
/******************************************/
CREATE TABLE `user_check_in_records_037` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78108001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_038   */
/******************************************/
CREATE TABLE `user_check_in_records_038` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77986601 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_039   */
/******************************************/
CREATE TABLE `user_check_in_records_039` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80067001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_040   */
/******************************************/
CREATE TABLE `user_check_in_records_040` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77410521 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_041   */
/******************************************/
CREATE TABLE `user_check_in_records_041` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77963001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_042   */
/******************************************/
CREATE TABLE `user_check_in_records_042` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79207441 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_043   */
/******************************************/
CREATE TABLE `user_check_in_records_043` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77830721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_044   */
/******************************************/
CREATE TABLE `user_check_in_records_044` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78130681 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_045   */
/******************************************/
CREATE TABLE `user_check_in_records_045` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79299721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_046   */
/******************************************/
CREATE TABLE `user_check_in_records_046` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79747001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_047   */
/******************************************/
CREATE TABLE `user_check_in_records_047` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77864921 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_048   */
/******************************************/
CREATE TABLE `user_check_in_records_048` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78566761 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_049   */
/******************************************/
CREATE TABLE `user_check_in_records_049` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77952201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_050   */
/******************************************/
CREATE TABLE `user_check_in_records_050` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77937841 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_051   */
/******************************************/
CREATE TABLE `user_check_in_records_051` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77864321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_052   */
/******************************************/
CREATE TABLE `user_check_in_records_052` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77766321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_053   */
/******************************************/
CREATE TABLE `user_check_in_records_053` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76862441 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_054   */
/******************************************/
CREATE TABLE `user_check_in_records_054` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79123881 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_055   */
/******************************************/
CREATE TABLE `user_check_in_records_055` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79865601 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_056   */
/******************************************/
CREATE TABLE `user_check_in_records_056` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76862521 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_057   */
/******************************************/
CREATE TABLE `user_check_in_records_057` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78864721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_058   */
/******************************************/
CREATE TABLE `user_check_in_records_058` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78834201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_059   */
/******************************************/
CREATE TABLE `user_check_in_records_059` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78161561 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_060   */
/******************************************/
CREATE TABLE `user_check_in_records_060` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79572321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_061   */
/******************************************/
CREATE TABLE `user_check_in_records_061` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78281801 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_062   */
/******************************************/
CREATE TABLE `user_check_in_records_062` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77818921 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_063   */
/******************************************/
CREATE TABLE `user_check_in_records_063` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78854761 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_064   */
/******************************************/
CREATE TABLE `user_check_in_records_064` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76257201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_065   */
/******************************************/
CREATE TABLE `user_check_in_records_065` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79895401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_066   */
/******************************************/
CREATE TABLE `user_check_in_records_066` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77568321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_067   */
/******************************************/
CREATE TABLE `user_check_in_records_067` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78760161 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_068   */
/******************************************/
CREATE TABLE `user_check_in_records_068` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76626281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_069   */
/******************************************/
CREATE TABLE `user_check_in_records_069` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76666721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_070   */
/******************************************/
CREATE TABLE `user_check_in_records_070` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78614881 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_071   */
/******************************************/
CREATE TABLE `user_check_in_records_071` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80018241 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_072   */
/******************************************/
CREATE TABLE `user_check_in_records_072` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77567321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_073   */
/******************************************/
CREATE TABLE `user_check_in_records_073` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78755961 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_074   */
/******************************************/
CREATE TABLE `user_check_in_records_074` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79299561 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_075   */
/******************************************/
CREATE TABLE `user_check_in_records_075` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78305441 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_076   */
/******************************************/
CREATE TABLE `user_check_in_records_076` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79656841 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_077   */
/******************************************/
CREATE TABLE `user_check_in_records_077` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78344201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_078   */
/******************************************/
CREATE TABLE `user_check_in_records_078` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78782481 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_079   */
/******************************************/
CREATE TABLE `user_check_in_records_079` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79502561 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_080   */
/******************************************/
CREATE TABLE `user_check_in_records_080` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77309281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_081   */
/******************************************/
CREATE TABLE `user_check_in_records_081` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81578401 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_082   */
/******************************************/
CREATE TABLE `user_check_in_records_082` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79147881 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_083   */
/******************************************/
CREATE TABLE `user_check_in_records_083` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78438801 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_084   */
/******************************************/
CREATE TABLE `user_check_in_records_084` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77540241 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_085   */
/******************************************/
CREATE TABLE `user_check_in_records_085` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78516081 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_086   */
/******************************************/
CREATE TABLE `user_check_in_records_086` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79442041 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_087   */
/******************************************/
CREATE TABLE `user_check_in_records_087` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78753361 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_088   */
/******************************************/
CREATE TABLE `user_check_in_records_088` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77429961 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_089   */
/******************************************/
CREATE TABLE `user_check_in_records_089` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77587761 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_090   */
/******************************************/
CREATE TABLE `user_check_in_records_090` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78891041 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_091   */
/******************************************/
CREATE TABLE `user_check_in_records_091` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78295001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_092   */
/******************************************/
CREATE TABLE `user_check_in_records_092` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79395361 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_093   */
/******************************************/
CREATE TABLE `user_check_in_records_093` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78199521 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_094   */
/******************************************/
CREATE TABLE `user_check_in_records_094` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78941201 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_095   */
/******************************************/
CREATE TABLE `user_check_in_records_095` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77836001 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_096   */
/******************************************/
CREATE TABLE `user_check_in_records_096` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76664161 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_097   */
/******************************************/
CREATE TABLE `user_check_in_records_097` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76093441 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_098   */
/******************************************/
CREATE TABLE `user_check_in_records_098` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76247161 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_records_099   */
/******************************************/
CREATE TABLE `user_check_in_records_099` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '用户签到商家',
  `vendor_name` varchar(32) DEFAULT NULL COMMENT '签到商家名称',
  `vendor_group` int(11) DEFAULT NULL COMMENT '签到商家组',
  `daily_rank` int(11) DEFAULT NULL COMMENT '签到排行',
  `check_in_date` datetime DEFAULT NULL COMMENT '签到时间',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '签到的端',
  `yn` smallint(6) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_sign_record` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77827721 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_reminder   */
/******************************************/
CREATE TABLE `user_check_in_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `config_id` int(11) DEFAULT NULL COMMENT '对应的配置id',
  `switch_on` tinyint(1) DEFAULT NULL COMMENT '开关状态(1:开启)',
  `creator` varchar(150) DEFAULT NULL COMMENT '创建人',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_reminder_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3644201 DEFAULT CHARSET=utf8mb4 COMMENT='签到小管家订阅用户';


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_000   */
/******************************************/
CREATE TABLE `user_check_in_rewards_000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117378841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_001   */
/******************************************/
CREATE TABLE `user_check_in_rewards_001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118310561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_002   */
/******************************************/
CREATE TABLE `user_check_in_rewards_002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120658401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_003   */
/******************************************/
CREATE TABLE `user_check_in_rewards_003` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119777201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_004   */
/******************************************/
CREATE TABLE `user_check_in_rewards_004` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119952681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_005   */
/******************************************/
CREATE TABLE `user_check_in_rewards_005` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117769161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_006   */
/******************************************/
CREATE TABLE `user_check_in_rewards_006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114417161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_007   */
/******************************************/
CREATE TABLE `user_check_in_rewards_007` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117325841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_008   */
/******************************************/
CREATE TABLE `user_check_in_rewards_008` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118884081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_009   */
/******************************************/
CREATE TABLE `user_check_in_rewards_009` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119389081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_010   */
/******************************************/
CREATE TABLE `user_check_in_rewards_010` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116610081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_011   */
/******************************************/
CREATE TABLE `user_check_in_rewards_011` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116240361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_012   */
/******************************************/
CREATE TABLE `user_check_in_rewards_012` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117400921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_013   */
/******************************************/
CREATE TABLE `user_check_in_rewards_013` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120453561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_014   */
/******************************************/
CREATE TABLE `user_check_in_rewards_014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119125761 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_015   */
/******************************************/
CREATE TABLE `user_check_in_rewards_015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117340041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_016   */
/******************************************/
CREATE TABLE `user_check_in_rewards_016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117062801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_017   */
/******************************************/
CREATE TABLE `user_check_in_rewards_017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118753601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_018   */
/******************************************/
CREATE TABLE `user_check_in_rewards_018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116246481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_019   */
/******************************************/
CREATE TABLE `user_check_in_rewards_019` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117437201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_020   */
/******************************************/
CREATE TABLE `user_check_in_rewards_020` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118091641 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_021   */
/******************************************/
CREATE TABLE `user_check_in_rewards_021` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115195121 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_022   */
/******************************************/
CREATE TABLE `user_check_in_rewards_022` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116382001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_023   */
/******************************************/
CREATE TABLE `user_check_in_rewards_023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119552681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_024   */
/******************************************/
CREATE TABLE `user_check_in_rewards_024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116624881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_025   */
/******************************************/
CREATE TABLE `user_check_in_rewards_025` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116294481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_026   */
/******************************************/
CREATE TABLE `user_check_in_rewards_026` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118342841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_027   */
/******************************************/
CREATE TABLE `user_check_in_rewards_027` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121762721 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_028   */
/******************************************/
CREATE TABLE `user_check_in_rewards_028` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118699361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_029   */
/******************************************/
CREATE TABLE `user_check_in_rewards_029` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116558241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_030   */
/******************************************/
CREATE TABLE `user_check_in_rewards_030` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115610521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_031   */
/******************************************/
CREATE TABLE `user_check_in_rewards_031` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117095961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_032   */
/******************************************/
CREATE TABLE `user_check_in_rewards_032` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118475681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_033   */
/******************************************/
CREATE TABLE `user_check_in_rewards_033` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116929921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_034   */
/******************************************/
CREATE TABLE `user_check_in_rewards_034` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117185481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_035   */
/******************************************/
CREATE TABLE `user_check_in_rewards_035` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114955241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_036   */
/******************************************/
CREATE TABLE `user_check_in_rewards_036` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120307321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_037   */
/******************************************/
CREATE TABLE `user_check_in_rewards_037` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116545361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_038   */
/******************************************/
CREATE TABLE `user_check_in_rewards_038` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116556361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_039   */
/******************************************/
CREATE TABLE `user_check_in_rewards_039` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120747401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_040   */
/******************************************/
CREATE TABLE `user_check_in_rewards_040` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116326361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_041   */
/******************************************/
CREATE TABLE `user_check_in_rewards_041` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116750321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_042   */
/******************************************/
CREATE TABLE `user_check_in_rewards_042` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119001401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_043   */
/******************************************/
CREATE TABLE `user_check_in_rewards_043` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116755481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_044   */
/******************************************/
CREATE TABLE `user_check_in_rewards_044` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117194361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_045   */
/******************************************/
CREATE TABLE `user_check_in_rewards_045` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119266881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_046   */
/******************************************/
CREATE TABLE `user_check_in_rewards_046` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119369521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_047   */
/******************************************/
CREATE TABLE `user_check_in_rewards_047` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117018561 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_048   */
/******************************************/
CREATE TABLE `user_check_in_rewards_048` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118501281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_049   */
/******************************************/
CREATE TABLE `user_check_in_rewards_049` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116669641 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_050   */
/******************************************/
CREATE TABLE `user_check_in_rewards_050` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116820201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_051   */
/******************************************/
CREATE TABLE `user_check_in_rewards_051` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116828761 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_052   */
/******************************************/
CREATE TABLE `user_check_in_rewards_052` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116297441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_053   */
/******************************************/
CREATE TABLE `user_check_in_rewards_053` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115230801 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_054   */
/******************************************/
CREATE TABLE `user_check_in_rewards_054` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118310321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_055   */
/******************************************/
CREATE TABLE `user_check_in_rewards_055` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119828321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_056   */
/******************************************/
CREATE TABLE `user_check_in_rewards_056` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115451601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_057   */
/******************************************/
CREATE TABLE `user_check_in_rewards_057` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118374681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_058   */
/******************************************/
CREATE TABLE `user_check_in_rewards_058` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118572601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_059   */
/******************************************/
CREATE TABLE `user_check_in_rewards_059` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116889161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_060   */
/******************************************/
CREATE TABLE `user_check_in_rewards_060` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119602081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_061   */
/******************************************/
CREATE TABLE `user_check_in_rewards_061` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117276881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_062   */
/******************************************/
CREATE TABLE `user_check_in_rewards_062` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117205841 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_063   */
/******************************************/
CREATE TABLE `user_check_in_rewards_063` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118533441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_064   */
/******************************************/
CREATE TABLE `user_check_in_rewards_064` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113890241 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_065   */
/******************************************/
CREATE TABLE `user_check_in_rewards_065` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120268681 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_066   */
/******************************************/
CREATE TABLE `user_check_in_rewards_066` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116552441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_067   */
/******************************************/
CREATE TABLE `user_check_in_rewards_067` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118441961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_068   */
/******************************************/
CREATE TABLE `user_check_in_rewards_068` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115094041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_069   */
/******************************************/
CREATE TABLE `user_check_in_rewards_069` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115135001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_070   */
/******************************************/
CREATE TABLE `user_check_in_rewards_070` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118174401 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_071   */
/******************************************/
CREATE TABLE `user_check_in_rewards_071` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120047761 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_072   */
/******************************************/
CREATE TABLE `user_check_in_rewards_072` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115996001 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_073   */
/******************************************/
CREATE TABLE `user_check_in_rewards_073` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117970521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_074   */
/******************************************/
CREATE TABLE `user_check_in_rewards_074` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118713641 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_075   */
/******************************************/
CREATE TABLE `user_check_in_rewards_075` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118079081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_076   */
/******************************************/
CREATE TABLE `user_check_in_rewards_076` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119798281 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_077   */
/******************************************/
CREATE TABLE `user_check_in_rewards_077` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117569361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_078   */
/******************************************/
CREATE TABLE `user_check_in_rewards_078` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118959881 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_079   */
/******************************************/
CREATE TABLE `user_check_in_rewards_079` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119985601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_080   */
/******************************************/
CREATE TABLE `user_check_in_rewards_080` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116486601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_081   */
/******************************************/
CREATE TABLE `user_check_in_rewards_081` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122517361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_082   */
/******************************************/
CREATE TABLE `user_check_in_rewards_082` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118512961 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_083   */
/******************************************/
CREATE TABLE `user_check_in_rewards_083` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117926321 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_084   */
/******************************************/
CREATE TABLE `user_check_in_rewards_084` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115751201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_085   */
/******************************************/
CREATE TABLE `user_check_in_rewards_085` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117294041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_086   */
/******************************************/
CREATE TABLE `user_check_in_rewards_086` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119433481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_087   */
/******************************************/
CREATE TABLE `user_check_in_rewards_087` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117847201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_088   */
/******************************************/
CREATE TABLE `user_check_in_rewards_088` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116000161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_089   */
/******************************************/
CREATE TABLE `user_check_in_rewards_089` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116299361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_090   */
/******************************************/
CREATE TABLE `user_check_in_rewards_090` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118389161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_091   */
/******************************************/
CREATE TABLE `user_check_in_rewards_091` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116867041 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_092   */
/******************************************/
CREATE TABLE `user_check_in_rewards_092` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119069521 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_093   */
/******************************************/
CREATE TABLE `user_check_in_rewards_093` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118092721 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_094   */
/******************************************/
CREATE TABLE `user_check_in_rewards_094` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118445081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_095   */
/******************************************/
CREATE TABLE `user_check_in_rewards_095` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116720201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_096   */
/******************************************/
CREATE TABLE `user_check_in_rewards_096` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114604921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_097   */
/******************************************/
CREATE TABLE `user_check_in_rewards_097` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114866361 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_098   */
/******************************************/
CREATE TABLE `user_check_in_rewards_098` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114569641 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_check_in_rewards_099   */
/******************************************/
CREATE TABLE `user_check_in_rewards_099` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '签到活动ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pandora_id` int(11) DEFAULT NULL COMMENT '潘多拉奖励ID',
  `reward_status` smallint(6) DEFAULT NULL COMMENT '奖励状态',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_sign_rewards` (`user_id`) USING BTREE,
  KEY `idx_reward_created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116859481 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_sign_in   */
/*   TableName = user_main_task   */
/******************************************/
CREATE TABLE `user_main_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `platform` varchar(20) DEFAULT NULL COMMENT '平台',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `progress` int(11) DEFAULT NULL COMMENT '主线任务进度(1~7)',
  `last_time` datetime DEFAULT NULL COMMENT '上一次签到时间',
  `user_group` json DEFAULT NULL COMMENT '用户人群',
  `rewards` json DEFAULT NULL COMMENT '主线任务奖励',
  `activity_progress` int(11) DEFAULT NULL COMMENT '活动签到进度',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_main_task_rewards` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254518921 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


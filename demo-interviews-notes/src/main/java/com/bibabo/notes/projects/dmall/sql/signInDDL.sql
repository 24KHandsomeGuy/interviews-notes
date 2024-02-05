##商家组--
create table check_in_vendor_group
(
	id int auto_increment,
	name varchar(20) null comment '商家组名称',
	vendor_list JSON null comment '门店组列表
[{
"vendorId":1,
"vendorName":"北京物美"
}]',
	tenant_id int null comment '租户ID',
	platform varchar(20) null comment '端',
	properties varchar(200) null comment '扩展属性',
	created datetime default now() null,
	modified datetime default now() null,
	yn smallint default 1 null,
	constraint check_in_vendor_group_pk
		primary key (id),
	index idx_tenant_id_platform(tenant_id, platform, yn)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '商家组配置';




##签到奖池配置--
create table check_in_reward_item
(
	id int auto_increment,
	name varchar(20) null comment '奖励名称',
	reward_type smallint null comment '奖励类型',
	total_stock int null comment '奖励总量',
	remain_stock int null comment '剩余总量',
	reward_info varchar(64) null comment '奖励配置',
	properties varchar(200) null comment '扩展属性',
	creator varchar(200) null,
  modifier varchar(200) null,
	created datetime default now() null,
	modified datetime default now() null,
	yn smallint default 1 null,
	constraint check_in_reward_item_pk
		primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '签到奖池配置';




##签到公告配置--
create table check_in_post
(
	`id` int auto_increment,
	`post_info` json null comment '签到公告配置',
	`tenant_id` INT null comment '租户ID',
	`platform` varchar(32) null comment '平台',
	`properties` varchar(200) null comment '扩展属性',
	`created` datetime default now() null,
	`modified` datetime default now() null,
	`yn` smallint default 1 null,
	constraint check_in_post_pk
		primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '签到公告配置';





##签到推送配置--
create table check_in_reminder
(
	id int auto_increment,
	push_time varchar(20) null comment '个推推送时间',
	offline_push_time varchar(20) null comment '本地推送时间',
	push_title varchar(50) null comment '推送标题',
	push_content varchar(150) null comment '推送内容',
	push_icon varchar(150) null comment '推送图标',
	push_url varchar(200) null comment '签到页面地址',
	title varchar(50) null comment '功能标题',
	content varchar(150) null comment '功能文案',
	switch_info varchar(100) null comment '开关提示信息',
	status tinyint null comment '功能开关',
  properties varchar(200) null comment '扩展属性',
	created datetime default now() null,
	modified datetime default now() null,
	yn smallint default 1 null,
	constraint check_in_reminder_pk
		primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '签到推送配置';


##签到小管家订阅用户--
create table user_check_in_reminder
(
	id int auto_increment,
	user_id int null comment '用户ID',
	config_id int null comment '对应的配置id',
	switch_on tinyint(1)  null comment '开关状态(1:开启)',
	creator varchar(150) charset utf8mb4  null comment '创建人' ,
  properties varchar(200) null comment '扩展属性',
	created datetime default now() null,
	modified datetime default now() null,
	yn smallint default 1 null,
	constraint check_in_reminder_pk
		primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '签到小管家订阅用户';



##签到活动--
create table check_in_activity
(
	id int auto_increment,
	name varchar(40) null comment '活动名称',
	start_time datetime null comment '开始时间',
	end_time datetime null comment '结束时间',
	type smallint null comment '活动类型',
  tenant_id int null comment '租户ID',
	platform VARCHAR(10) null comment '端',
	status smallint null comment '活动状态 0-创建未开始 4-进行中 8-已结束 ',
	switch_on tinyint(1) default 1 null comment '启动状态',
	creator varchar(200) null comment '推送内容',
	creator_id int null comment '创建人ERP ID',
  properties varchar(200) null comment '扩展属性',
	created datetime default now() null,
	modified datetime default now() null,
  medusa_config varchar(1024) null comment '[ {''label'':''第一优先级人群'',''priority'':''1'',"medusaId",''name'':'''',''number'':''人群用户数'',''creator'':''人群创建人'',''type'':''1''} ]',
	yn smallint default 1 null,
  jump_link varchar(2048) null comment '跳转链接',
	constraint check_in_activity_pk
		primary key (id),
	index idx_tenant_id_platform_activity(tenant_id, platform,status, yn)
)ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '签到活动';




##签到活动规则--
create table check_in_activity_rule
(
	id int auto_increment,
	activity_id int null comment '活动ID',
	type smallint null comment '类型(1:普通签到，2：连续签到)',
	require_times int null comment '签到次数（针对连续签到)',
	reward_way SMALLINT null comment '发放方式',
	pandora_id int null comment '潘多拉任务ID',
	reward_info JSON NULL COMMENT '奖励配置',
	user_group_priority int null comment '人群优先级',
	vendor_group int null comment '商家组',
	properties varchar(200) null comment '扩展属性',
	creator varchar(200) null  comment '创建人',
	created datetime default now() null,
	modified datetime default now() null,
	yn smallint default 1 null,
	constraint check_in_activity_rule_pk
		primary key (id),
	index idx_activity_vendor_type(activity_id,type, yn)
)ENGINE=InnoDB DEFAULT CHARSET=utf8  comment '签到活动规则';




-- 签到邀请活动
create table check_in_invite_act
(
	id             int auto_increment
		primary key,
	name           varchar(40)                           null comment '活动名称',
	platform       varchar(20)                           null comment '端',
	start_time     datetime                              null comment '开始时间',
	end_time       datetime                              null comment '结束时间',
	title          varchar(40)                           null comment '活动标题',
	rules          varchar(255)                          null comment '活动规则',
	share_title    varchar(40)                           null comment '分享标题',
	share_img      varchar(255)                          null comment '分享图片',
	invite_max     int                                   null comment '最大参与人数',
	status         smallint(6)                           null comment '活动状态',
	access_key     varchar(40)                           null comment '积分密钥',
	point_act_name varchar(40)                           null comment '积分活动名称',
	min_point      int                                   null comment '最少积分数量',
	avg_point      int                                   null comment '平均积分数量',
	max_point      int                                   null comment '最大积分数量',
	pandora_task   int                                   null comment '潘多拉任务ID',
	modifier       varchar(200)                          null comment '推送内容',
	creator        varchar(200)                          null comment '推送内容',
	properties     varchar(200)                          null comment '扩展属性',
	created        datetime    default CURRENT_TIMESTAMP null,
	modified       datetime    default CURRENT_TIMESTAMP null,
	yn             smallint(6) default 1                 null
)
	comment '签到邀请活动' charset = utf8;



create table user_check_in_records_000
(
	id int auto_increment,
	user_id int null comment '用户ID',
	vendor_id int null comment '用户签到商家',
	vendor_name varchar(32) null comment '签到商家名称',
	vendor_group int null comment '签到商家组',
	daily_rank int null comment '签到排行',
	check_in_date datetime null comment '签到时间',
	tenant_id int null comment '租户ID',
	platform int null comment '签到的端',
	yn smallint null,
	creator varchar(32) null comment '创建人',
	created datetime default now() null,
	constraint user_check_in_records_pk
		primary key (id)
)
	comment '用户签到记录';




CREATE TABLE `user_check_in_inviter` (
																			 `id` int(11) NOT NULL AUTO_INCREMENT,
																			 `invite_act_id` int(11) DEFAULT NULL COMMENT '邀请活动ID',
																			 `invite_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
																			 `inviter` bigint(20) DEFAULT NULL COMMENT '活动发起人',
																			 `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
																			 `created` datetime DEFAULT NULL COMMENT '创建时间',
																			 `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
																			 PRIMARY KEY (`id`) USING BTREE,
																			 KEY `idx_invite_inviter_code` (`invite_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `check_in_config` (
																 `id` int(11) NOT NULL AUTO_INCREMENT,
																 `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
																 `check_in_type` smallint(6) DEFAULT NULL COMMENT '签到类型（1：按端,2:按租户）',
																 `yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
																 `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
																 `created` datetime DEFAULT NULL COMMENT '创建时间',
																 PRIMARY KEY (`id`) USING BTREE,
																 KEY `idx_check_in_config_tenant` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `user_main_task` (
																`id` int(11) NOT NULL AUTO_INCREMENT,
																`user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
																`tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
																`platform` varchar(20) DEFAULT NULL COMMENT '平台',
																`progress` int(11) DEFAULT NULL COMMENT '主线任务进度(1~7)',
																`last_time` datetime DEFAULT NULL COMMENT '上一次签到时间',
																`user_group` JSON DEFAULT NULL COMMENT '用户人群',
																`rewards` JSON DEFAULT NULL COMMENT '主线任务奖励',
																`yn` smallint(6) DEFAULT NULL COMMENT '是否有效',
																`creator` varchar(20) DEFAULT NULL COMMENT '创建人',
																`created` datetime DEFAULT NULL COMMENT '创建时间',
																PRIMARY KEY (`id`) USING BTREE,
																KEY `idx_user_main_task_rewards` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
																					 KEY `idx_user_sign_rewards` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE  TABLE  `user_check_in_rewards_001` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_002` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_003` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_004` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_005` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_006` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_007` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_008` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_009` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_010` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_011` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_012` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_013` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_014` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_015` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_016` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_017` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_018` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_019` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_020` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_021` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_022` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_023` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_024` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_025` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_026` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_027` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_028` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_029` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_030` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_031` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_032` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_033` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_034` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_035` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_036` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_037` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_038` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_039` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_040` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_041` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_042` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_043` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_044` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_045` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_046` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_047` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_048` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_049` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_050` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_051` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_052` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_053` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_054` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_055` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_056` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_057` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_058` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_059` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_060` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_061` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_062` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_063` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_064` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_065` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_066` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_067` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_068` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_069` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_070` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_071` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_072` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_073` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_074` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_075` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_076` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_077` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_078` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_079` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_080` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_081` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_082` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_083` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_084` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_085` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_086` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_087` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_088` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_089` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_090` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_091` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_092` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_093` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_094` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_095` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_096` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_097` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_098` like user_check_in_rewards_000;
CREATE  TABLE  `user_check_in_rewards_099` like user_check_in_rewards_000;

CREATE  TABLE  `user_check_in_records_001` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_002` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_003` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_004` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_005` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_006` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_007` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_008` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_009` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_010` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_011` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_012` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_013` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_014` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_015` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_016` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_017` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_018` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_019` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_020` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_021` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_022` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_023` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_024` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_025` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_026` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_027` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_028` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_029` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_030` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_031` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_032` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_033` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_034` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_035` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_036` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_037` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_038` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_039` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_040` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_041` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_042` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_043` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_044` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_045` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_046` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_047` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_048` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_049` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_050` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_051` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_052` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_053` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_054` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_055` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_056` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_057` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_058` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_059` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_060` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_061` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_062` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_063` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_064` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_065` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_066` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_067` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_068` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_069` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_070` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_071` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_072` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_073` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_074` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_075` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_076` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_077` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_078` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_079` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_080` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_081` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_082` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_083` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_084` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_085` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_086` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_087` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_088` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_089` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_090` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_091` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_092` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_093` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_094` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_095` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_096` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_097` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_098` like user_check_in_records_000;
CREATE  TABLE  `user_check_in_records_099` like user_check_in_records_000;

CREATE  TABLE  `user_check_in_progress_001` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_002` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_003` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_004` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_005` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_006` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_007` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_008` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_009` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_010` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_011` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_012` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_013` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_014` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_015` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_016` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_017` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_018` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_019` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_020` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_021` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_022` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_023` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_024` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_025` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_026` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_027` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_028` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_029` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_030` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_031` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_032` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_033` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_034` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_035` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_036` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_037` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_038` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_039` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_040` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_041` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_042` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_043` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_044` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_045` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_046` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_047` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_048` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_049` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_050` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_051` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_052` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_053` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_054` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_055` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_056` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_057` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_058` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_059` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_060` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_061` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_062` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_063` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_064` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_065` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_066` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_067` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_068` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_069` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_070` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_071` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_072` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_073` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_074` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_075` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_076` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_077` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_078` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_079` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_080` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_081` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_082` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_083` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_084` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_085` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_086` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_087` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_088` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_089` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_090` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_091` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_092` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_093` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_094` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_095` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_096` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_097` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_098` like user_check_in_progress_000;
CREATE  TABLE  `user_check_in_progress_099` like user_check_in_progress_000;




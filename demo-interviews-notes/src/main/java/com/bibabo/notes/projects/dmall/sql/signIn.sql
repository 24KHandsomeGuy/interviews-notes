---#签到活动
---##签到配置表，记录用户是按租户维度还是端维度进行签到
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
---表数据
SELECT * FROM `check_in_config` LIMIT 20;

---##签到商家组，目前只有erp使用
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
---表数据
INSERT INTO `check_in_vendor_group` (`id`,`name`,`vendor_list`,`tenant_id`,`platform`,`properties`,`created`,`modified`,`yn`) VALUES (1,"全部商家","[{\"vendorId\": -1}]",1,null,null,"2021-08-13 01:35:34","2021-08-25 19:28:41",1);
INSERT INTO `check_in_vendor_group` (`id`,`name`,`vendor_list`,`tenant_id`,`platform`,`properties`,`created`,`modified`,`yn`) VALUES (161,"华东物美","[{\"vendorId\": 2}, {\"vendorId\": 13842}]",1,null,null,"2022-05-31 13:33:57","2022-05-31 13:33:57",1);
INSERT INTO `check_in_vendor_group` (`id`,`name`,`vendor_list`,`tenant_id`,`platform`,`properties`,`created`,`modified`,`yn`) VALUES (281,"重百商家","[{\"vendorId\": 69}, {\"vendorId\": 6482}, {\"vendorId\": 8202}]",1,null,null,"2023-09-15 17:11:19","2023-10-09 10:39:46",1);

---##签到活动主表，medusa_config字段记录人群信息
---SELECT * FROM `check_in_activity` where `id` = 5401;
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
) ENGINE=InnoDB AUTO_INCREMENT=5521 DEFAULT CHARSET=utf8 COMMENT='签到活动';
---表数据
INSERT INTO `check_in_activity` (`id`,`name`,`start_time`,`end_time`,`type`,`tenant_id`,`platform`,`status`,`switch_on`,`creator`,`creator_id`,`properties`,`created`,`modified`,`medusa_config`,`yn`,`jump_link`,`vendor_id`,`source`) VALUES (5401,"2023年11月签到活动","2023-11-01 00:00:00","2023-11-30 23:59:59",1,1,"1",8,1,"卢文锦",null,null,"2023-10-31 21:11:22","2023-12-01 00:00:03","[{\"label\":\"普通人群(第一人群)\",\"priority\":1,\"type\":1},{\"label\":\"未启用(第二人群)\",\"priority\":2,\"type\":0},{\"label\":\"未启用(第三人群)\",\"priority\":3,\"type\":0}]",1,"https://a.dmall.com/act/Ra3otq5Bw8TMly.html?nopos=0&tpc=a_244562",null,1);


---##签到规则表，含奖励信息，pandora_id为奖励的潘多拉任务id（该任务为启用签到活动时调用潘多拉系统自动创建）
---##之前是如果潘多拉任务创建失败，会有job定时重试，现在改为直接抛异常了
---##reward_info字段为奖励配置，rewardItemId为check_in_reward_item主键id
---SELECT * FROM `check_in_activity_rule` where `activity_id` = 5401;
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
) ENGINE=InnoDB AUTO_INCREMENT=69801 DEFAULT CHARSET=utf8 COMMENT='签到活动规则';
---表数据
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68001,5401,1,0,1,2814641,"{\"rewardName\": \"天天抽奖令牌\", \"rewardType\": 3, \"rewardCount\": \"1\", \"rewardItemId\": 641}",1,1,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68081,5401,2,1,1,2814721,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68161,5401,2,2,1,2814801,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68241,5401,2,3,1,2814881,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68321,5401,2,4,1,2814961,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68401,5401,2,5,1,2815041,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68481,5401,2,6,1,2815121,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);
INSERT INTO `check_in_activity_rule` (`id`,`activity_id`,`type`,`require_times`,`reward_way`,`pandora_id`,`reward_info`,`user_group_priority`,`vendor_group`,`properties`,`creator`,`created`,`modified`,`yn`) VALUES (68561,5401,2,7,1,2815201,"{\"rewardName\": \"2023年11月签到积分奖励（华东物美）\", \"rewardType\": 2, \"rewardCount\": \"1\", \"rewardItemId\": 4201}",1,161,null,"卢文锦","2023-10-31 21:11:22","2023-10-31 21:11:22",1);


---##奖励明细配置表
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
) ENGINE=InnoDB AUTO_INCREMENT=4401 DEFAULT CHARSET=utf8 COMMENT='签到奖池配置';
---表数据
INSERT INTO `check_in_reward_item` (`id`,`name`,`reward_type`,`total_stock`,`remain_stock`,`reward_info`,`properties`,`creator`,`modifier`,`created`,`modified`,`yn`) VALUES (641,"天天抽奖令牌",3,null,null,"6785",null,"王绍鹏","王绍鹏","2021-08-28 16:22:38","2021-08-28 16:22:38",1);
INSERT INTO `check_in_reward_item` (`id`,`name`,`reward_type`,`total_stock`,`remain_stock`,`reward_info`,`properties`,`creator`,`modifier`,`created`,`modified`,`yn`) VALUES (4201,"2023年11月签到积分奖励（华东物美）",2,null,1000000,"b206e563b39a702e1cfbaffb47a12b6b",null,"卢文锦","卢文锦","2023-10-31 21:08:56","2023-10-31 21:08:56",1);


---#C端用户表
---##每一个用户的每一个签到活动为一条记录，progress_bar签到进度为当前用户在该活动下，连续签到的天数
---SELECT * FROM `user_check_in_progress_039` where `user_id` = 613574039;
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
) ENGINE=InnoDB AUTO_INCREMENT=9959601 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
---表数据
INSERT INTO `user_check_in_progress_039` (`id`,`activity_id`,`user_id`,`progress_bar`,`last_time`,`yn`,`creator`,`created`) VALUES (3851961,3601,613574039,1,"2022-08-30 00:00:00",1,null,"2022-08-30 15:03:05");
INSERT INTO `user_check_in_progress_039` (`id`,`activity_id`,`user_id`,`progress_bar`,`last_time`,`yn`,`creator`,`created`) VALUES (9011361,5401,613574039,2,"2023-11-07 00:00:00",1,null,"2023-11-06 17:46:24");

---##用户签到记录表
---SELECT * FROM `user_check_in_records_039` where `user_id` = 613574039;
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
) ENGINE=InnoDB AUTO_INCREMENT=77784321 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';
---表数据
INSERT INTO `user_check_in_records_039` (`id`,`user_id`,`vendor_id`,`vendor_name`,`vendor_group`,`daily_rank`,`check_in_date`,`tenant_id`,`platform`,`yn`,`creator`,`created`) VALUES (44957081,613574039,1,"北京物美",1,104762,"2022-08-30 00:00:00",1,"1",1,null,"2022-08-30 15:03:05");
INSERT INTO `user_check_in_records_039` (`id`,`user_id`,`vendor_id`,`vendor_name`,`vendor_group`,`daily_rank`,`check_in_date`,`tenant_id`,`platform`,`yn`,`creator`,`created`) VALUES (71811961,613574039,1,"北京物美",1,85453,"2023-11-06 00:00:00",1,"1",1,null,"2023-11-06 17:46:24");
INSERT INTO `user_check_in_records_039` (`id`,`user_id`,`vendor_id`,`vendor_name`,`vendor_group`,`daily_rank`,`check_in_date`,`tenant_id`,`platform`,`yn`,`creator`,`created`) VALUES (71851321,613574039,1,"北京物美",1,61794,"2023-11-07 00:00:00",1,"1",1,null,"2023-11-07 10:10:39");


---##用户签到奖励
---SELECT * FROM `user_check_in_rewards_039` where `user_id` = 613574039;
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
) ENGINE=InnoDB AUTO_INCREMENT=74804281 DEFAULT CHARSET=utf8 COMMENT='用户签到记录';
---表数据
INSERT INTO `user_check_in_rewards_039` (`id`,`activity_id`,`user_id`,`pandora_id`,`reward_status`,`yn`,`creator`,`created`) VALUES (85017681,3601,613574039,1344241,1,1,null,"2022-08-30 15:03:05");
INSERT INTO `user_check_in_rewards_039` (`id`,`activity_id`,`user_id`,`pandora_id`,`reward_status`,`yn`,`creator`,`created`) VALUES (112541961,5401,613574039,2814641,1,1,null,"2023-11-06 17:46:24");
INSERT INTO `user_check_in_rewards_039` (`id`,`activity_id`,`user_id`,`pandora_id`,`reward_status`,`yn`,`creator`,`created`) VALUES (112581321,5401,613574039,2814641,1,1,null,"2023-11-07 10:10:39");


---##主线任务表，主线7天为一个任务，progress为7时会置为0
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
) ENGINE=InnoDB AUTO_INCREMENT=249622081 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
---表数据
INSERT INTO `user_main_task` (`id`,`user_id`,`tenant_id`,`platform`,`activity_id`,`progress`,`last_time`,`user_group`,`rewards`,`activity_progress`,`yn`,`creator`,`created`) VALUES (143060321,613574039,1,"1",5401,2,"2023-11-07 00:00:00","{\"activityId\": 5401, \"groupPriority\": 1}","[{\"uuid\": \"2023-11-06_613574039\", \"progress\": 1, \"received\": true, \"taskList\": [2814641, 2814681]}, {\"uuid\": \"2023-11-07_613574039\", \"progress\": 2, \"received\": true, \"taskList\": [2814641, 2814761]}, {\"progress\": 3, \"received\": false, \"taskList\": [2814641, 2814841]}, {\"progress\": 4, \"received\": false, \"taskList\": [2814641, 2814921]}, {\"progress\": 5, \"received\": false, \"taskList\": [2814641, 2815001]}, {\"progress\": 6, \"received\": false, \"taskList\": [2814641, 2815081]}, {\"progress\": 7, \"received\": false, \"taskList\": [2814641, 2815161]}]",2,1,null,"2022-08-30 15:03:05");
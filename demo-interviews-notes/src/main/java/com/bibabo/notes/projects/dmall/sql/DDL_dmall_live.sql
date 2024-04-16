-- Export Tools
-- Time: 2024-04-16 15:29:44
-- Service: s4065i.yz.db.inner-dmall.com:4065   Database: dmall_live
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = admin_user   */
/******************************************/
CREATE TABLE `admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `role_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色：10超级管理员 20系统管理员 30 直播间管理员 40 主播',
  `nick_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播昵称',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  `partner_user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_activity   */
/******************************************/
CREATE TABLE `live_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播活动名称',
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `tenant_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '0全部 1多点 2 麦德龙',
  `real_start_time` datetime DEFAULT NULL COMMENT '实际开播时间',
  `real_end_time` datetime DEFAULT NULL COMMENT '实际停播时间',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `play_back` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启回放  0关闭 1 开启',
  `template_id` bigint(20) DEFAULT NULL COMMENT '录制模板id',
  `back_im_group_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回放直播聊天室id',
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动二维码',
  `im_group_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IM 聊天室id',
  `mini_push_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序云直播推流地址',
  `push_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '云直播推流地址',
  `web_push_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'h5云直播推流地址',
  `mini_pull_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序-云直播拉流地址',
  `pull_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '云直播拉流地址',
  `web_pull_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'h5云直播拉流地址',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动介绍',
  `live_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播样式图',
  `banner_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通栏样式图',
  `prew_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '预告图',
  `prew_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预告视频',
  `share_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分享图片',
  `activity_theme` text COLLATE utf8mb4_unicode_ci COMMENT '活动主题',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '活动范围类型 1 定位门店  2 指定门店',
  `range_vendor` longtext COLLATE utf8mb4_unicode_ci COMMENT '商家信息',
  `range_store_type` tinyint(4) DEFAULT NULL COMMENT '门店类别 1 全部门店 2 部分门店参与 3 部分门店不参与',
  `range_store` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店信息',
  `range_visible` tinyint(4) NOT NULL COMMENT '超出范围 1可见  2不可见',
  `flow_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悬浮活动',
  `flow_icon_display` tinyint(4) NOT NULL DEFAULT '1' COMMENT '悬浮活动是否展示 1 展示 2 不展示',
  `app_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'App 链接',
  `mini_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '小程序链接',
  `anchor` bigint(20) NOT NULL COMMENT '主播id',
  `comment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用评论 1 启用 2关闭',
  `push_content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播推送公告内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '活动状态：1待审核、2被驳回、3审核通过、4预热中、5进行中、6已结束 7 关停',
  `enable_switch` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1 启用 2 关闭',
  `activity_log` longtext COLLATE utf8mb4_unicode_ci COMMENT '活动操作日志',
  `prew_init_nums` bigint(20) DEFAULT NULL COMMENT '预告初始值',
  `prew_min_factor` int(11) DEFAULT NULL COMMENT '预告最小系数',
  `prew_max_factor` int(11) DEFAULT NULL COMMENT '预告最大系数',
  `playing_init_nums` bigint(20) DEFAULT NULL COMMENT '直播初始值',
  `playing_min_factor` int(11) DEFAULT NULL COMMENT '直播最小系数',
  `playing_max_factor` int(11) DEFAULT NULL COMMENT '直播最大系数',
  `sys_version` bigint(20) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=275122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_activity_audit   */
/******************************************/
CREATE TABLE `live_activity_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动ID',
  `audit_apply_user_id` bigint(20) NOT NULL COMMENT '提交审核人ID',
  `audit_apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交审核时间',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人ID',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核意见',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_activity_play_back   */
/******************************************/
CREATE TABLE `live_activity_play_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `start_time` bigint(20) DEFAULT NULL COMMENT '录制文件起始时间戳',
  `end_time` bigint(20) DEFAULT NULL COMMENT '录制文件结束时间戳',
  `file_id` varchar(64) DEFAULT NULL COMMENT '点播 file ID，在 云点播平台 可以唯一定位一个点播视频文件',
  `file_format` varchar(64) DEFAULT NULL COMMENT 'flv，hls，mp4，aac',
  `duration` bigint(20) DEFAULT NULL COMMENT '录制文件时长，单位秒',
  `file_size` bigint(20) DEFAULT NULL COMMENT '录制文件大小，单位字节',
  `video_url` varchar(256) DEFAULT NULL COMMENT '录制文件下载 URL',
  `sys_version` bigint(20) NOT NULL,
  `record_tasks` mediumtext COMMENT '录制任务',
  `media_complete_tasks` mediumtext COMMENT '视频完成任务',
  `created` datetime NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `create_user` varchar(32) NOT NULL,
  `modify_user` varchar(32) NOT NULL,
  `yn` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57082 DEFAULT CHARSET=utf8 COMMENT='直播活动回放表';


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_activity_store   */
/******************************************/
CREATE TABLE `live_activity_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动ID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '门店类别 1 全部门店 2 部分门店参与 3 部分门店不参与 4 指定门店',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `vender_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家 名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店名称',
  `validate_store` tinyint(4) NOT NULL DEFAULT '0' COMMENT '校验门店 1 是 0 否',
  `sys_version` bigint(20) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12940642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_blacklist_config   */
/******************************************/
CREATE TABLE `live_blacklist_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nick_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `list_type` tinyint(4) DEFAULT '1' COMMENT '名单类型，1，黑名单，2，白名单',
  `live_room_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改者名称',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_phone_num` (`phone_num`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_created` (`created`),
  KEY `idx_modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=81762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='黑名单';


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_comment   */
/******************************************/
CREATE TABLE `live_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `user_avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `business_type` tinyint(4) DEFAULT '1' COMMENT '业务类别: 1 当前观看人数  2 用户发表评论 3 直播活动倒计时',
  `comment` text COLLATE utf8mb4_unicode_ci COMMENT '用户评论',
  `sys_version` int(11) DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16638242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_coupon   */
/******************************************/
CREATE TABLE `live_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `pandora_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '潘多拉id',
  `coupon_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券id',
  `display` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否展示 1 不展示 2 展示',
  `sort` int(8) NOT NULL DEFAULT '1' COMMENT '优惠券顺序',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券类别 1推送券 2购物袋券',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1102802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_data_summary   */
/******************************************/
CREATE TABLE `live_data_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `activity_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播活动名称',
  `live_platform` tinyint(4) NOT NULL COMMENT '直播端 ：1 app 2 小程序',
  `stats_time` datetime NOT NULL COMMENT '数据统计时间',
  `group_id` int(20) NOT NULL COMMENT '分组id',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `pv` bigint(20) DEFAULT NULL,
  `uv` bigint(20) DEFAULT NULL,
  `quit_uv` bigint(20) DEFAULT NULL COMMENT '退出uv',
  `avg_view_time` bigint(20) DEFAULT NULL COMMENT '平均观看时长 s',
  `ware_gmv` bigint(20) DEFAULT NULL COMMENT '商品GMV',
  `order_gmv` bigint(20) DEFAULT NULL COMMENT '订单GMV',
  `live_source` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '直播来源',
  `ware_card_add_nums` bigint(20) DEFAULT NULL COMMENT '商品卡片加购用户数',
  `list_bag_add_nums` bigint(20) DEFAULT NULL COMMENT '购物袋列表加购用户数',
  `ware_info_add_nums` bigint(20) DEFAULT NULL COMMENT '商详加购用户数',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10784362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_000   */
/******************************************/
CREATE TABLE `live_focus_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_001   */
/******************************************/
CREATE TABLE `live_focus_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=620602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_002   */
/******************************************/
CREATE TABLE `live_focus_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_003   */
/******************************************/
CREATE TABLE `live_focus_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_004   */
/******************************************/
CREATE TABLE `live_focus_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_005   */
/******************************************/
CREATE TABLE `live_focus_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=709642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_006   */
/******************************************/
CREATE TABLE `live_focus_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_007   */
/******************************************/
CREATE TABLE `live_focus_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1096642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_008   */
/******************************************/
CREATE TABLE `live_focus_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_009   */
/******************************************/
CREATE TABLE `live_focus_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_010   */
/******************************************/
CREATE TABLE `live_focus_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_011   */
/******************************************/
CREATE TABLE `live_focus_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_012   */
/******************************************/
CREATE TABLE `live_focus_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_013   */
/******************************************/
CREATE TABLE `live_focus_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_014   */
/******************************************/
CREATE TABLE `live_focus_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_015   */
/******************************************/
CREATE TABLE `live_focus_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_016   */
/******************************************/
CREATE TABLE `live_focus_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_017   */
/******************************************/
CREATE TABLE `live_focus_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=771602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_018   */
/******************************************/
CREATE TABLE `live_focus_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_019   */
/******************************************/
CREATE TABLE `live_focus_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_020   */
/******************************************/
CREATE TABLE `live_focus_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_021   */
/******************************************/
CREATE TABLE `live_focus_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_022   */
/******************************************/
CREATE TABLE `live_focus_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_023   */
/******************************************/
CREATE TABLE `live_focus_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_024   */
/******************************************/
CREATE TABLE `live_focus_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_025   */
/******************************************/
CREATE TABLE `live_focus_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_026   */
/******************************************/
CREATE TABLE `live_focus_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_027   */
/******************************************/
CREATE TABLE `live_focus_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_028   */
/******************************************/
CREATE TABLE `live_focus_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_029   */
/******************************************/
CREATE TABLE `live_focus_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_030   */
/******************************************/
CREATE TABLE `live_focus_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_focus_031   */
/******************************************/
CREATE TABLE `live_focus_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 0 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `vendor_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `receive_address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=487242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_lottery   */
/******************************************/
CREATE TABLE `live_lottery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `pandora_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '潘多拉id',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '抽奖活动名称',
  `type` tinyint(4) DEFAULT '1' COMMENT '1 优惠券抽奖 2 实物抽奖',
  `award_nums` bigint(20) DEFAULT NULL COMMENT '奖品发放总量',
  `balance_nums` bigint(20) DEFAULT NULL COMMENT '奖品剩余数量',
  `award_img` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖品图片',
  `sort` int(8) NOT NULL DEFAULT '1' COMMENT '活动顺序',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2882202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_lottery_setting   */
/******************************************/
CREATE TABLE `live_lottery_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lottery_id` bigint(20) NOT NULL COMMENT '抽奖活动id',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '抽奖批次名称',
  `type` tinyint(4) NOT NULL COMMENT '抽奖类型 1 评论 2点赞 3 随机',
  `user_count` bigint(20) NOT NULL COMMENT '奖品发放人数',
  `join_user_count` bigint(20) DEFAULT '0' COMMENT '参与人数',
  `start_time` datetime NOT NULL COMMENT '抽奖开始时间',
  `end_time` datetime NOT NULL COMMENT '抽奖结束时间',
  `statistic_type` tinyint(4) NOT NULL COMMENT '数据统计类别 1: 30s ,2: 1min, 3 :2 min',
  `pandora_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '潘多拉id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抽奖状态1 推送中  2 抽奖中 3 已开奖',
  `need_post` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否要邮寄 1 是 2 否',
  `black_list_switch` tinyint(1) DEFAULT '2' COMMENT '活动黑名单开关：1-启用 2-关闭',
  `sys_version` bigint(4) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_notice   */
/******************************************/
CREATE TABLE `live_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `content` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 普通公告 2开播公告',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_room   */
/******************************************/
CREATE TABLE `live_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间名称',
  `releative_type` tinyint(4) NOT NULL COMMENT '1：POP，2：品牌 ,3：商家',
  `releative` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联主体',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间logo',
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间介绍',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1启用 ，2 停用',
  `live_admin` bigint(20) NOT NULL COMMENT '直播间管理员id',
  `admin_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '管理员指定类型 1 手机号 2 自定义昵称',
  `init_like_times` bigint(20) NOT NULL DEFAULT '0' COMMENT '初始关注数',
  `like_times` bigint(20) NOT NULL DEFAULT '0' COMMENT '真实关注数',
  `live_log` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播间操作日志',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_stats_data   */
/******************************************/
CREATE TABLE `live_stats_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `activity_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播活动名称',
  `live_platform` tinyint(4) NOT NULL COMMENT '直播端 ：1 app 2 小程序',
  `group_id` int(20) NOT NULL COMMENT '分组id',
  `stats_time` datetime NOT NULL COMMENT '数据统计时间',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `remind_users` bigint(20) DEFAULT NULL COMMENT '订阅人数',
  `remind_times` bigint(20) DEFAULT NULL COMMENT '订阅次数',
  `share_users` bigint(20) DEFAULT NULL COMMENT '分享人数',
  `share_times` bigint(20) DEFAULT NULL COMMENT '分享次数',
  `like_users` bigint(20) DEFAULT NULL COMMENT '点赞人数',
  `like_times` bigint(20) DEFAULT NULL COMMENT '点赞次数',
  `rate_users` bigint(20) DEFAULT NULL COMMENT '评论人数',
  `rate_times` bigint(20) DEFAULT NULL COMMENT '评论次数',
  `click_shoppiing_bag_users` bigint(20) DEFAULT NULL COMMENT '点击购物袋人数',
  `click_shoppiing_bag_times` bigint(20) DEFAULT NULL COMMENT '点击购物袋次数',
  `click_ware_card_users` bigint(20) DEFAULT NULL COMMENT '点击商品卡片人数',
  `click_ware_card_times` bigint(20) DEFAULT NULL COMMENT '点击商品卡片次数',
  `add_cart_users` bigint(20) DEFAULT NULL COMMENT '加购人数',
  `add_cart_wares` bigint(20) DEFAULT NULL COMMENT '加购商品数',
  `order_users` bigint(20) DEFAULT NULL COMMENT '下单人数',
  `order_nums` bigint(20) DEFAULT NULL COMMENT '下单单量',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2038402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_000   */
/******************************************/
CREATE TABLE `live_user_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_001   */
/******************************************/
CREATE TABLE `live_user_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_002   */
/******************************************/
CREATE TABLE `live_user_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_003   */
/******************************************/
CREATE TABLE `live_user_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_004   */
/******************************************/
CREATE TABLE `live_user_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_005   */
/******************************************/
CREATE TABLE `live_user_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_006   */
/******************************************/
CREATE TABLE `live_user_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_007   */
/******************************************/
CREATE TABLE `live_user_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_008   */
/******************************************/
CREATE TABLE `live_user_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_009   */
/******************************************/
CREATE TABLE `live_user_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_010   */
/******************************************/
CREATE TABLE `live_user_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_011   */
/******************************************/
CREATE TABLE `live_user_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_012   */
/******************************************/
CREATE TABLE `live_user_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_013   */
/******************************************/
CREATE TABLE `live_user_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_014   */
/******************************************/
CREATE TABLE `live_user_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_015   */
/******************************************/
CREATE TABLE `live_user_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_016   */
/******************************************/
CREATE TABLE `live_user_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_017   */
/******************************************/
CREATE TABLE `live_user_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_018   */
/******************************************/
CREATE TABLE `live_user_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_019   */
/******************************************/
CREATE TABLE `live_user_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_020   */
/******************************************/
CREATE TABLE `live_user_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_021   */
/******************************************/
CREATE TABLE `live_user_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_022   */
/******************************************/
CREATE TABLE `live_user_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_023   */
/******************************************/
CREATE TABLE `live_user_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_024   */
/******************************************/
CREATE TABLE `live_user_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_025   */
/******************************************/
CREATE TABLE `live_user_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_026   */
/******************************************/
CREATE TABLE `live_user_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_027   */
/******************************************/
CREATE TABLE `live_user_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_028   */
/******************************************/
CREATE TABLE `live_user_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_029   */
/******************************************/
CREATE TABLE `live_user_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_030   */
/******************************************/
CREATE TABLE `live_user_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_031   */
/******************************************/
CREATE TABLE `live_user_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_032   */
/******************************************/
CREATE TABLE `live_user_032` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_033   */
/******************************************/
CREATE TABLE `live_user_033` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_034   */
/******************************************/
CREATE TABLE `live_user_034` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_035   */
/******************************************/
CREATE TABLE `live_user_035` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_036   */
/******************************************/
CREATE TABLE `live_user_036` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_037   */
/******************************************/
CREATE TABLE `live_user_037` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_038   */
/******************************************/
CREATE TABLE `live_user_038` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_039   */
/******************************************/
CREATE TABLE `live_user_039` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_040   */
/******************************************/
CREATE TABLE `live_user_040` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_041   */
/******************************************/
CREATE TABLE `live_user_041` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_042   */
/******************************************/
CREATE TABLE `live_user_042` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_043   */
/******************************************/
CREATE TABLE `live_user_043` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_044   */
/******************************************/
CREATE TABLE `live_user_044` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_045   */
/******************************************/
CREATE TABLE `live_user_045` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_046   */
/******************************************/
CREATE TABLE `live_user_046` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_047   */
/******************************************/
CREATE TABLE `live_user_047` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_048   */
/******************************************/
CREATE TABLE `live_user_048` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_049   */
/******************************************/
CREATE TABLE `live_user_049` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_050   */
/******************************************/
CREATE TABLE `live_user_050` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_051   */
/******************************************/
CREATE TABLE `live_user_051` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_052   */
/******************************************/
CREATE TABLE `live_user_052` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_053   */
/******************************************/
CREATE TABLE `live_user_053` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_054   */
/******************************************/
CREATE TABLE `live_user_054` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_055   */
/******************************************/
CREATE TABLE `live_user_055` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_056   */
/******************************************/
CREATE TABLE `live_user_056` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_057   */
/******************************************/
CREATE TABLE `live_user_057` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_058   */
/******************************************/
CREATE TABLE `live_user_058` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_059   */
/******************************************/
CREATE TABLE `live_user_059` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_060   */
/******************************************/
CREATE TABLE `live_user_060` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_061   */
/******************************************/
CREATE TABLE `live_user_061` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_062   */
/******************************************/
CREATE TABLE `live_user_062` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_063   */
/******************************************/
CREATE TABLE `live_user_063` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_064   */
/******************************************/
CREATE TABLE `live_user_064` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_065   */
/******************************************/
CREATE TABLE `live_user_065` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_066   */
/******************************************/
CREATE TABLE `live_user_066` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_067   */
/******************************************/
CREATE TABLE `live_user_067` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_068   */
/******************************************/
CREATE TABLE `live_user_068` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_069   */
/******************************************/
CREATE TABLE `live_user_069` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_070   */
/******************************************/
CREATE TABLE `live_user_070` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_071   */
/******************************************/
CREATE TABLE `live_user_071` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_072   */
/******************************************/
CREATE TABLE `live_user_072` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_073   */
/******************************************/
CREATE TABLE `live_user_073` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_074   */
/******************************************/
CREATE TABLE `live_user_074` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_075   */
/******************************************/
CREATE TABLE `live_user_075` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_076   */
/******************************************/
CREATE TABLE `live_user_076` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_077   */
/******************************************/
CREATE TABLE `live_user_077` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_078   */
/******************************************/
CREATE TABLE `live_user_078` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_079   */
/******************************************/
CREATE TABLE `live_user_079` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_080   */
/******************************************/
CREATE TABLE `live_user_080` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_081   */
/******************************************/
CREATE TABLE `live_user_081` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_082   */
/******************************************/
CREATE TABLE `live_user_082` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_083   */
/******************************************/
CREATE TABLE `live_user_083` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_084   */
/******************************************/
CREATE TABLE `live_user_084` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_085   */
/******************************************/
CREATE TABLE `live_user_085` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_086   */
/******************************************/
CREATE TABLE `live_user_086` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_087   */
/******************************************/
CREATE TABLE `live_user_087` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_088   */
/******************************************/
CREATE TABLE `live_user_088` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_089   */
/******************************************/
CREATE TABLE `live_user_089` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_090   */
/******************************************/
CREATE TABLE `live_user_090` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_091   */
/******************************************/
CREATE TABLE `live_user_091` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_092   */
/******************************************/
CREATE TABLE `live_user_092` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_093   */
/******************************************/
CREATE TABLE `live_user_093` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_094   */
/******************************************/
CREATE TABLE `live_user_094` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_095   */
/******************************************/
CREATE TABLE `live_user_095` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_096   */
/******************************************/
CREATE TABLE `live_user_096` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_097   */
/******************************************/
CREATE TABLE `live_user_097` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_098   */
/******************************************/
CREATE TABLE `live_user_098` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_099   */
/******************************************/
CREATE TABLE `live_user_099` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_100   */
/******************************************/
CREATE TABLE `live_user_100` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_101   */
/******************************************/
CREATE TABLE `live_user_101` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_102   */
/******************************************/
CREATE TABLE `live_user_102` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_103   */
/******************************************/
CREATE TABLE `live_user_103` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_104   */
/******************************************/
CREATE TABLE `live_user_104` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_105   */
/******************************************/
CREATE TABLE `live_user_105` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_106   */
/******************************************/
CREATE TABLE `live_user_106` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_107   */
/******************************************/
CREATE TABLE `live_user_107` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_108   */
/******************************************/
CREATE TABLE `live_user_108` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_109   */
/******************************************/
CREATE TABLE `live_user_109` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_110   */
/******************************************/
CREATE TABLE `live_user_110` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_111   */
/******************************************/
CREATE TABLE `live_user_111` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_112   */
/******************************************/
CREATE TABLE `live_user_112` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_113   */
/******************************************/
CREATE TABLE `live_user_113` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_114   */
/******************************************/
CREATE TABLE `live_user_114` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_115   */
/******************************************/
CREATE TABLE `live_user_115` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_116   */
/******************************************/
CREATE TABLE `live_user_116` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_117   */
/******************************************/
CREATE TABLE `live_user_117` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_118   */
/******************************************/
CREATE TABLE `live_user_118` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_119   */
/******************************************/
CREATE TABLE `live_user_119` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_120   */
/******************************************/
CREATE TABLE `live_user_120` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_121   */
/******************************************/
CREATE TABLE `live_user_121` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_122   */
/******************************************/
CREATE TABLE `live_user_122` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_123   */
/******************************************/
CREATE TABLE `live_user_123` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_124   */
/******************************************/
CREATE TABLE `live_user_124` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_125   */
/******************************************/
CREATE TABLE `live_user_125` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_126   */
/******************************************/
CREATE TABLE `live_user_126` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_127   */
/******************************************/
CREATE TABLE `live_user_127` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_128   */
/******************************************/
CREATE TABLE `live_user_128` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_129   */
/******************************************/
CREATE TABLE `live_user_129` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_130   */
/******************************************/
CREATE TABLE `live_user_130` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_131   */
/******************************************/
CREATE TABLE `live_user_131` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_132   */
/******************************************/
CREATE TABLE `live_user_132` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_133   */
/******************************************/
CREATE TABLE `live_user_133` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_134   */
/******************************************/
CREATE TABLE `live_user_134` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_135   */
/******************************************/
CREATE TABLE `live_user_135` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_136   */
/******************************************/
CREATE TABLE `live_user_136` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_137   */
/******************************************/
CREATE TABLE `live_user_137` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_138   */
/******************************************/
CREATE TABLE `live_user_138` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_139   */
/******************************************/
CREATE TABLE `live_user_139` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_140   */
/******************************************/
CREATE TABLE `live_user_140` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_141   */
/******************************************/
CREATE TABLE `live_user_141` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_142   */
/******************************************/
CREATE TABLE `live_user_142` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_143   */
/******************************************/
CREATE TABLE `live_user_143` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_144   */
/******************************************/
CREATE TABLE `live_user_144` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_145   */
/******************************************/
CREATE TABLE `live_user_145` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_146   */
/******************************************/
CREATE TABLE `live_user_146` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_147   */
/******************************************/
CREATE TABLE `live_user_147` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_148   */
/******************************************/
CREATE TABLE `live_user_148` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_149   */
/******************************************/
CREATE TABLE `live_user_149` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_150   */
/******************************************/
CREATE TABLE `live_user_150` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_151   */
/******************************************/
CREATE TABLE `live_user_151` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_152   */
/******************************************/
CREATE TABLE `live_user_152` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_153   */
/******************************************/
CREATE TABLE `live_user_153` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_154   */
/******************************************/
CREATE TABLE `live_user_154` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_155   */
/******************************************/
CREATE TABLE `live_user_155` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_156   */
/******************************************/
CREATE TABLE `live_user_156` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_157   */
/******************************************/
CREATE TABLE `live_user_157` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_158   */
/******************************************/
CREATE TABLE `live_user_158` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_159   */
/******************************************/
CREATE TABLE `live_user_159` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_160   */
/******************************************/
CREATE TABLE `live_user_160` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_161   */
/******************************************/
CREATE TABLE `live_user_161` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_162   */
/******************************************/
CREATE TABLE `live_user_162` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_163   */
/******************************************/
CREATE TABLE `live_user_163` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_164   */
/******************************************/
CREATE TABLE `live_user_164` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_165   */
/******************************************/
CREATE TABLE `live_user_165` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_166   */
/******************************************/
CREATE TABLE `live_user_166` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_167   */
/******************************************/
CREATE TABLE `live_user_167` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_168   */
/******************************************/
CREATE TABLE `live_user_168` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_169   */
/******************************************/
CREATE TABLE `live_user_169` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_170   */
/******************************************/
CREATE TABLE `live_user_170` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_171   */
/******************************************/
CREATE TABLE `live_user_171` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_172   */
/******************************************/
CREATE TABLE `live_user_172` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_173   */
/******************************************/
CREATE TABLE `live_user_173` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_174   */
/******************************************/
CREATE TABLE `live_user_174` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_175   */
/******************************************/
CREATE TABLE `live_user_175` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_176   */
/******************************************/
CREATE TABLE `live_user_176` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_177   */
/******************************************/
CREATE TABLE `live_user_177` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_178   */
/******************************************/
CREATE TABLE `live_user_178` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_179   */
/******************************************/
CREATE TABLE `live_user_179` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_180   */
/******************************************/
CREATE TABLE `live_user_180` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_181   */
/******************************************/
CREATE TABLE `live_user_181` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_182   */
/******************************************/
CREATE TABLE `live_user_182` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_183   */
/******************************************/
CREATE TABLE `live_user_183` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_184   */
/******************************************/
CREATE TABLE `live_user_184` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_185   */
/******************************************/
CREATE TABLE `live_user_185` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_186   */
/******************************************/
CREATE TABLE `live_user_186` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_187   */
/******************************************/
CREATE TABLE `live_user_187` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_188   */
/******************************************/
CREATE TABLE `live_user_188` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_189   */
/******************************************/
CREATE TABLE `live_user_189` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_190   */
/******************************************/
CREATE TABLE `live_user_190` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_191   */
/******************************************/
CREATE TABLE `live_user_191` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_192   */
/******************************************/
CREATE TABLE `live_user_192` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_193   */
/******************************************/
CREATE TABLE `live_user_193` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_194   */
/******************************************/
CREATE TABLE `live_user_194` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_195   */
/******************************************/
CREATE TABLE `live_user_195` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_196   */
/******************************************/
CREATE TABLE `live_user_196` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_197   */
/******************************************/
CREATE TABLE `live_user_197` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_198   */
/******************************************/
CREATE TABLE `live_user_198` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_199   */
/******************************************/
CREATE TABLE `live_user_199` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_200   */
/******************************************/
CREATE TABLE `live_user_200` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_201   */
/******************************************/
CREATE TABLE `live_user_201` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_202   */
/******************************************/
CREATE TABLE `live_user_202` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_203   */
/******************************************/
CREATE TABLE `live_user_203` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_204   */
/******************************************/
CREATE TABLE `live_user_204` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_205   */
/******************************************/
CREATE TABLE `live_user_205` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_206   */
/******************************************/
CREATE TABLE `live_user_206` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_207   */
/******************************************/
CREATE TABLE `live_user_207` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_208   */
/******************************************/
CREATE TABLE `live_user_208` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_209   */
/******************************************/
CREATE TABLE `live_user_209` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_210   */
/******************************************/
CREATE TABLE `live_user_210` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_211   */
/******************************************/
CREATE TABLE `live_user_211` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_212   */
/******************************************/
CREATE TABLE `live_user_212` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_213   */
/******************************************/
CREATE TABLE `live_user_213` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_214   */
/******************************************/
CREATE TABLE `live_user_214` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_215   */
/******************************************/
CREATE TABLE `live_user_215` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_216   */
/******************************************/
CREATE TABLE `live_user_216` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_217   */
/******************************************/
CREATE TABLE `live_user_217` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_218   */
/******************************************/
CREATE TABLE `live_user_218` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_219   */
/******************************************/
CREATE TABLE `live_user_219` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_220   */
/******************************************/
CREATE TABLE `live_user_220` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_221   */
/******************************************/
CREATE TABLE `live_user_221` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_222   */
/******************************************/
CREATE TABLE `live_user_222` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_223   */
/******************************************/
CREATE TABLE `live_user_223` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_224   */
/******************************************/
CREATE TABLE `live_user_224` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_225   */
/******************************************/
CREATE TABLE `live_user_225` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_226   */
/******************************************/
CREATE TABLE `live_user_226` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_227   */
/******************************************/
CREATE TABLE `live_user_227` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_228   */
/******************************************/
CREATE TABLE `live_user_228` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_229   */
/******************************************/
CREATE TABLE `live_user_229` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_230   */
/******************************************/
CREATE TABLE `live_user_230` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_231   */
/******************************************/
CREATE TABLE `live_user_231` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_232   */
/******************************************/
CREATE TABLE `live_user_232` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_233   */
/******************************************/
CREATE TABLE `live_user_233` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_234   */
/******************************************/
CREATE TABLE `live_user_234` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_235   */
/******************************************/
CREATE TABLE `live_user_235` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_236   */
/******************************************/
CREATE TABLE `live_user_236` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_237   */
/******************************************/
CREATE TABLE `live_user_237` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_238   */
/******************************************/
CREATE TABLE `live_user_238` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_239   */
/******************************************/
CREATE TABLE `live_user_239` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_240   */
/******************************************/
CREATE TABLE `live_user_240` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_241   */
/******************************************/
CREATE TABLE `live_user_241` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_242   */
/******************************************/
CREATE TABLE `live_user_242` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_243   */
/******************************************/
CREATE TABLE `live_user_243` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_244   */
/******************************************/
CREATE TABLE `live_user_244` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_245   */
/******************************************/
CREATE TABLE `live_user_245` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_246   */
/******************************************/
CREATE TABLE `live_user_246` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45722 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_247   */
/******************************************/
CREATE TABLE `live_user_247` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_248   */
/******************************************/
CREATE TABLE `live_user_248` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_249   */
/******************************************/
CREATE TABLE `live_user_249` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_250   */
/******************************************/
CREATE TABLE `live_user_250` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_251   */
/******************************************/
CREATE TABLE `live_user_251` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_252   */
/******************************************/
CREATE TABLE `live_user_252` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_253   */
/******************************************/
CREATE TABLE `live_user_253` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_254   */
/******************************************/
CREATE TABLE `live_user_254` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_user_255   */
/******************************************/
CREATE TABLE `live_user_255` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `live_room_id` bigint(20) NOT NULL COMMENT '直播间id',
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `notice` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开播提醒 1 提醒 2 不提醒',
  `notice_time` datetime DEFAULT NULL COMMENT '设置提醒时间',
  `focus` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否关注 1 关注 2 未关注',
  `focus_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_ware   */
/******************************************/
CREATE TABLE `live_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `vendor_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家id',
  `vendor_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商家名称',
  `vendor_logo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家logo',
  `store_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_logo` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品清单（只记录sku）',
  `sort` int(8) NOT NULL COMMENT '商品排序',
  `top_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 取消置顶  2 置顶 ',
  `push_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 待推送 2 推送中',
  `push_time` datetime DEFAULT NULL COMMENT '推送时间',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  `pop_sku` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是pop品  0 不是 1 是',
  `config_vendor_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置商家id',
  `item_type` int(2) DEFAULT '1' COMMENT '商品类型 1 O2O 2 券包',
  PRIMARY KEY (`id`),
  KEY `idx_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104456882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = live_ware_data   */
/******************************************/
CREATE TABLE `live_ware_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `activity_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '直播活动名称',
  `live_platform` tinyint(4) NOT NULL COMMENT '直播端 ：1 app 2 小程序',
  `stats_time` datetime NOT NULL COMMENT '数据统计时间',
  `group_id` int(11) NOT NULL COMMENT '分组id',
  `vendor_id` bigint(20) NOT NULL COMMENT '商家id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `sku` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品sku',
  `ware_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `ware_info_pv` bigint(20) DEFAULT NULL COMMENT '商详pv',
  `ware_info_uv` bigint(20) DEFAULT NULL COMMENT '详uv',
  `add_cart_times` bigint(20) DEFAULT NULL COMMENT '加购次数',
  `add_cart_users` bigint(20) DEFAULT NULL COMMENT '加购人数',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_users` bigint(20) DEFAULT NULL COMMENT '下单人数',
  `order_price` bigint(20) DEFAULT NULL COMMENT '订单金额',
  `order_discounts` bigint(20) DEFAULT NULL COMMENT '订单促销金额',
  `order_coupon` bigint(20) DEFAULT NULL COMMENT '订单优惠券价格',
  `sku_total_price` bigint(20) DEFAULT NULL COMMENT 'sku 总的价格',
  `ware_nums` bigint(20) DEFAULT NULL COMMENT '商品售卖个数',
  `ware_discounts` bigint(20) DEFAULT NULL COMMENT '促销金额',
  `ware_coupon` bigint(20) DEFAULT NULL COMMENT '优惠券金额',
  `gmv` bigint(20) DEFAULT NULL COMMENT 'gmv(商品下单金额)',
  `true_gmv` bigint(20) DEFAULT NULL COMMENT 'true_gmv(商品成交金额)',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17989602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = lottery_detail   */
/******************************************/
CREATE TABLE `lottery_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '直播活动id',
  `lottery_id` bigint(20) NOT NULL COMMENT '抽奖活动id',
  `lottery_setting_id` bigint(20) NOT NULL COMMENT '抽奖活动批次id',
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户脱敏手机号',
  `receiver_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人手机号',
  `receiver_address` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`),
  KEY `idx_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3650922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_000   */
/******************************************/
CREATE TABLE `user_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_001   */
/******************************************/
CREATE TABLE `user_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_002   */
/******************************************/
CREATE TABLE `user_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_003   */
/******************************************/
CREATE TABLE `user_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_004   */
/******************************************/
CREATE TABLE `user_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_005   */
/******************************************/
CREATE TABLE `user_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_006   */
/******************************************/
CREATE TABLE `user_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_007   */
/******************************************/
CREATE TABLE `user_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_008   */
/******************************************/
CREATE TABLE `user_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_009   */
/******************************************/
CREATE TABLE `user_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_010   */
/******************************************/
CREATE TABLE `user_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_011   */
/******************************************/
CREATE TABLE `user_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_012   */
/******************************************/
CREATE TABLE `user_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_013   */
/******************************************/
CREATE TABLE `user_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_014   */
/******************************************/
CREATE TABLE `user_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_015   */
/******************************************/
CREATE TABLE `user_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_016   */
/******************************************/
CREATE TABLE `user_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_017   */
/******************************************/
CREATE TABLE `user_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_018   */
/******************************************/
CREATE TABLE `user_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_019   */
/******************************************/
CREATE TABLE `user_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_020   */
/******************************************/
CREATE TABLE `user_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_021   */
/******************************************/
CREATE TABLE `user_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_022   */
/******************************************/
CREATE TABLE `user_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_023   */
/******************************************/
CREATE TABLE `user_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_024   */
/******************************************/
CREATE TABLE `user_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_025   */
/******************************************/
CREATE TABLE `user_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_026   */
/******************************************/
CREATE TABLE `user_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_027   */
/******************************************/
CREATE TABLE `user_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_028   */
/******************************************/
CREATE TABLE `user_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_029   */
/******************************************/
CREATE TABLE `user_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_030   */
/******************************************/
CREATE TABLE `user_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_live   */
/*   TableName = user_031   */
/******************************************/
CREATE TABLE `user_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '脱敏手机号',
  `sys_version` int(20) NOT NULL DEFAULT '0' COMMENT '系统版本',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据库自己维护',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间，数据库自己维护',
  `create_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `modify_user` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Export Tools
-- Time: 2024-04-16 15:36:15
-- Service: s3939i.yz.db.inner-dmall.com:3939   Database: dmall_pre_sale
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_config   */
/******************************************/
CREATE TABLE `activity_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `purchase_prepare_days` int(11) DEFAULT NULL COMMENT '订货准备时间',
  `start_time` datetime DEFAULT NULL COMMENT '预约开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '预约结束时间',
  `shipment_start_date` date DEFAULT NULL,
  `shipment_end_date` date DEFAULT NULL,
  `share_title` varchar(50) DEFAULT NULL COMMENT '分享标题',
  `share_content` varchar(250) DEFAULT NULL COMMENT '分享内容',
  `share_image` varchar(250) DEFAULT NULL COMMENT '分享缩略图',
  `switch_on` tinyint(1) DEFAULT NULL COMMENT '是否开启',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL COMMENT '活动主图',
  `vendor` int(11) DEFAULT NULL COMMENT '参与商家',
  `rule_detail` text COMMENT '预约配置说明',
  `auto_ship` tinyint(1) DEFAULT '0' COMMENT '是否自动提货',
  `business_type` int(11) DEFAULT '2' COMMENT '1-茅台预售 2-常规预约',
  `trade_template_id` varchar(1024) DEFAULT NULL COMMENT '结算模板ID',
  `enable_front_end` tinyint(1) DEFAULT '1' COMMENT '是否打开前端配置',
  `ware_suffix` varchar(64) DEFAULT NULL COMMENT '商品前缀',
  `syn_ware_status` tinyint(1) DEFAULT '0' COMMENT '同步商品系统状态 0-未同步 1-同步成功 2-同步失败 3-回滚成功 4-回滚失败',
  `promise_time_type` tinyint(1) DEFAULT NULL COMMENT '履约方式 1-绝对时间 2-相对时间',
  `shipment_date_time_list` varchar(1024) DEFAULT NULL,
  `date_list` varchar(1024) DEFAULT NULL COMMENT '绝对时间',
  `promise_rule_id` varchar(64) DEFAULT NULL COMMENT '履约规则id',
  `store_shipment_date_list` varchar(1024) DEFAULT NULL COMMENT '门店履约时间',
  `promise_dead_line` varchar(8) DEFAULT NULL COMMENT '截单时间 HH:MM',
  `enable_sync_order_cancel` tinyint(1) DEFAULT '0' COMMENT '是否同步截单时间为订单可取消时间',
  `order_cancel_time` datetime DEFAULT NULL COMMENT '可取消时间',
  `enable_home_pop` tinyint(1) DEFAULT '0' COMMENT '首页弹窗配置开关',
  `home_pop_config` longtext COMMENT '首页弹窗配置内容',
  `shopping_cart_group_name` varchar(20) DEFAULT NULL COMMENT '购物车分组名称',
  `shipment_type` varchar(20) DEFAULT NULL COMMENT '履约方式',
  `assets_use_switch` tinyint(1) DEFAULT NULL COMMENT '资产使用开关',
  `price_bill_code` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308882 DEFAULT CHARSET=utf8 COMMENT='预售活动配置';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_shipment_time   */
/******************************************/
CREATE TABLE `activity_shipment_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `shipment_start_time` varchar(50) DEFAULT NULL COMMENT '提货时间',
  `shipment_end_time` varchar(50) DEFAULT NULL COMMENT '提货时间',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='预售活动提货时间配置';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_store   */
/******************************************/
CREATE TABLE `activity_store` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `vendor` int(11) DEFAULT NULL COMMENT '参与商家',
  `store_id` int(11) DEFAULT NULL COMMENT '参与门店',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT '商品SKU',
  `apply_task_id` int(11) DEFAULT NULL COMMENT '上架申请任务ID',
  PRIMARY KEY (`id`),
  KEY `idx_activityId_vendor_yn` (`activity_id`,`vendor`,`yn`),
  KEY `idx_activityId_storeId_yn` (`activity_id`,`store_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=4953506722 DEFAULT CHARSET=utf8 COMMENT='预售活动商家门店';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_store_temp   */
/******************************************/
CREATE TABLE `activity_store_temp` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(64) DEFAULT NULL COMMENT '批次编码，用于保存时使用',
  `vendor` int(11) DEFAULT NULL COMMENT '参与商家',
  `store_id` int(11) DEFAULT NULL COMMENT '参与门店',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT '商品SKU',
  `apply_task_id` int(11) DEFAULT NULL COMMENT '上架申请任务ID',
  `store_edit` int(11) DEFAULT NULL COMMENT '是否新增的门店',
  PRIMARY KEY (`id`),
  KEY `idx_store_batchid_yn` (`batch_id`,`sku_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=5968836402 DEFAULT CHARSET=utf8 COMMENT='预售活动商家门店临时表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware   */
/******************************************/
CREATE TABLE `activity_ware` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `vendor` int(11) DEFAULT NULL COMMENT '参与商家',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `price` bigint(20) DEFAULT NULL COMMENT '预售价格',
  `count` int(11) DEFAULT NULL COMMENT '预售数量',
  `day_count` int(11) DEFAULT NULL COMMENT '每天预售数量',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `matnr` varchar(64) DEFAULT NULL COMMENT '物料编码',
  `h5_trade_link` varchar(1000) DEFAULT NULL COMMENT 'h5结算链接',
  `mini_trade_link` varchar(1000) DEFAULT NULL COMMENT '小程序结算链接',
  `btn_text` varchar(64) DEFAULT NULL COMMENT '按钮文案',
  `ware_detail` text COMMENT '商详配置',
  `url_type` tinyint(1) DEFAULT '1' COMMENT '1-商详页 2-指定链接',
  `url` varchar(3000) DEFAULT NULL,
  `monthly_qualify` tinyint(1) DEFAULT '0' COMMENT '月度资格',
  `white_list_label` varchar(1024) DEFAULT NULL COMMENT '白名单',
  `day_sale_time` varchar(8) DEFAULT NULL COMMENT '每日预售时间',
  `enable_staff_purchase` tinyint(1) DEFAULT '0' COMMENT '是否允许内部员工购买',
  `ship_confirm_type` varchar(16) DEFAULT NULL COMMENT '提货确认方式 ',
  `trade_banner_text` varchar(64) DEFAULT NULL COMMENT '结算顶部文案',
  `monthly_qualify_url` varchar(3000) DEFAULT NULL,
  `monthly_qualify_rule_content` text COMMENT '月度资格规则说明',
  `white_list_configs` varchar(2048) DEFAULT NULL COMMENT '白名单资格配置',
  `monthly_qualify_configs` varchar(1024) DEFAULT NULL COMMENT '月度资格配置',
  `price_rule_id` varchar(64) DEFAULT NULL COMMENT '锁价ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序值',
  `day_sale_end_time` varchar(8) DEFAULT NULL COMMENT '每日预售截止时间',
  `publicity_file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `publicity_show` tinyint(1) DEFAULT '0' COMMENT '是否展示商品公示量',
  `enable_white_list_label` tinyint(1) DEFAULT '0' COMMENT '是否有白名单资格 默认无',
  `enable_white_label_staff_purchase` tinyint(1) DEFAULT '1' COMMENT '白名单员工黑名单 默认1',
  `ware_edit` int(11) DEFAULT NULL COMMENT '编辑的商品 进行打标、改价、上架',
  PRIMARY KEY (`id`),
  KEY `idx_activity_ware` (`activity_id`,`sku_id`),
  KEY `idx_sku_yn` (`sku_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=61881762 DEFAULT CHARSET=utf8 COMMENT='预售活动商家门店';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware_phase_price   */
/******************************************/
CREATE TABLE `activity_ware_phase_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `ware_id` bigint(11) DEFAULT NULL,
  `phase_range_start` int(11) DEFAULT NULL COMMENT '阶梯范围开始',
  `phase_range_end` int(11) DEFAULT NULL COMMENT '阶梯范围开始',
  `phase_price` bigint(20) DEFAULT NULL COMMENT '阶段价格',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='预售活动商家门店';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware_publicity   */
/******************************************/
CREATE TABLE `activity_ware_publicity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_ware_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `publicity_day` date DEFAULT NULL COMMENT '公示日',
  `count` int(11) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` tinyint(2) DEFAULT '1',
  `vendor_id` int(11) NOT NULL,
  `publicity_show` tinyint(1) DEFAULT '0' COMMENT '是否展示公示量',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`),
  KEY `idx_activity_ware_id_sku` (`activity_ware_id`,`store_id`,`yn`),
  KEY `idx_vendor_sku_activity` (`vendor_id`,`sku_id`,`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7319882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品投放量公示配置';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware_publicity_temp   */
/******************************************/
CREATE TABLE `activity_ware_publicity_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '批次编码，用于保存时使用',
  `activity_ware_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `publicity_day` date DEFAULT NULL COMMENT '公示日',
  `count` int(11) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `yn` tinyint(2) DEFAULT '1',
  `vendor_id` int(11) NOT NULL,
  `publicity_show` tinyint(1) DEFAULT '0' COMMENT '是否展示公示量',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_sku_activity` (`vendor_id`,`sku_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品投放量公示配置临时表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware_retry_record   */
/******************************************/
CREATE TABLE `activity_ware_retry_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL COMMENT '重试次数',
  `reason` text COMMENT '错误日志',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `need_rollback_tag` tinyint(1) DEFAULT '1',
  `need_rollback_suffix` tinyint(1) DEFAULT '1',
  `need_rollback_url` tinyint(1) DEFAULT '1',
  `need_rollback_lock` tinyint(1) DEFAULT '1',
  `lock_id` varchar(64) DEFAULT NULL COMMENT '锁价ID',
  `yn` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='回滚记录表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = activity_ware_temp   */
/******************************************/
CREATE TABLE `activity_ware_temp` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(64) DEFAULT NULL COMMENT '批次编码，用于保存时使用',
  `batch_sort` int(11) DEFAULT NULL COMMENT '批次排序值 同一个批次可能上传过多次',
  `vendor` int(11) DEFAULT NULL COMMENT '参与商家',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `price` bigint(20) DEFAULT NULL COMMENT '预售价格',
  `stores` varchar(3000) DEFAULT NULL COMMENT '门店，逗号分割',
  `count` int(11) DEFAULT NULL COMMENT '预售数量',
  `day_count` int(11) DEFAULT NULL COMMENT '每天预售数量',
  `creator` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `matnr` varchar(64) DEFAULT NULL COMMENT '物料编码',
  `h5_trade_link` varchar(1000) DEFAULT NULL COMMENT 'h5结算链接',
  `mini_trade_link` varchar(1000) DEFAULT NULL COMMENT '小程序结算链接',
  `btn_text` varchar(64) DEFAULT NULL COMMENT '按钮文案',
  `ware_detail` varchar(3000) DEFAULT NULL,
  `url_type` tinyint(1) DEFAULT '1' COMMENT '1-商详页 2-指定链接',
  `url` varchar(3000) DEFAULT NULL,
  `monthly_qualify` tinyint(1) DEFAULT '0' COMMENT '月度资格',
  `white_list_label` varchar(1024) DEFAULT NULL COMMENT '白名单',
  `day_sale_time` varchar(8) DEFAULT NULL COMMENT '每日预售时间',
  `enable_staff_purchase` tinyint(1) DEFAULT '0' COMMENT '是否允许内部员工购买',
  `ship_confirm_type` varchar(16) DEFAULT NULL COMMENT '提货确认文案',
  `trade_banner_text` varchar(64) DEFAULT NULL COMMENT '结算顶部文案',
  `monthly_qualify_url` varchar(3000) DEFAULT NULL,
  `monthly_qualify_rule_content` text,
  `price_rule_id` varchar(64) DEFAULT NULL COMMENT '锁价ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序值',
  `white_list_configs` varchar(2048) DEFAULT NULL,
  `monthly_qualify_configs` varchar(1024) DEFAULT NULL COMMENT '月度资格配置',
  `day_sale_end_time` varchar(8) DEFAULT NULL COMMENT '每日预售截止时间',
  `publicity_file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `publicity_show` tinyint(1) DEFAULT '0' COMMENT '是否展示商品公示量',
  `enable_white_list_label` tinyint(1) DEFAULT '0' COMMENT '是否有白名单资格 默认无',
  `enable_white_label_staff_purchase` tinyint(1) DEFAULT '1' COMMENT '白名单员工黑名单 默认1',
  `fail` int(11) DEFAULT '0' COMMENT '商品验证是否失败',
  `fail_msg` text COMMENT '商品导入失败原因',
  `ware_edit` int(11) DEFAULT NULL COMMENT '编辑的商品 进行打标、改价、上架',
  PRIMARY KEY (`id`),
  KEY `idx_activity_ware` (`sku_id`),
  KEY `idx_sku_yn` (`sku_id`,`yn`),
  KEY `idx_ware_batchid_yn` (`batch_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=70549842 DEFAULT CHARSET=utf8 COMMENT='预售活动商品临时表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_booking_content_config   */
/******************************************/
CREATE TABLE `maotai_booking_content_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `content_config` json DEFAULT NULL COMMENT '内容配置',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_activity` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1362 DEFAULT CHARSET=utf8 COMMENT='预定抽签内容配置';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_booking_draw_reward_user   */
/******************************************/
CREATE TABLE `maotai_booking_draw_reward_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `phase_id` int(11) NOT NULL COMMENT '预定阶段ID',
  `draw_reward_date` varchar(10) DEFAULT NULL COMMENT '抽奖奖励日期，公示展示日期',
  `status` tinyint(2) DEFAULT NULL COMMENT '是否奖励发放令牌',
  `user_id` bigint(20) NOT NULL COMMENT '中奖用户ID',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_activity_phase_date_user` (`activity_id`,`phase_id`,`draw_reward_date`,`user_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=13763682 DEFAULT CHARSET=utf8 COMMENT='预定抽签奖励用户';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_booking_phase_config   */
/******************************************/
CREATE TABLE `maotai_booking_phase_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `phase_name` varchar(30) DEFAULT NULL COMMENT '阶段名称',
  `disable_start_date` datetime DEFAULT NULL COMMENT '禁用抢购开始日期',
  `disable_end_date` datetime DEFAULT NULL COMMENT '禁用抢购结束日期',
  `booking_start_date` datetime DEFAULT NULL COMMENT '预约开始日期',
  `booking_end_date` datetime DEFAULT NULL COMMENT '预约结束日期',
  `booking_start_time` varchar(20) DEFAULT NULL COMMENT '预约开始日期',
  `booking_end_time` varchar(20) DEFAULT NULL COMMENT '预约结束日期',
  `publicity_start_date` datetime DEFAULT NULL COMMENT '公示开始日期',
  `publicity_end_date` datetime DEFAULT NULL COMMENT '公示结束日期',
  `draw_reward_way` tinyint(2) DEFAULT NULL COMMENT '抽签奖励方式',
  `draw_reward_status` tinyint(2) DEFAULT NULL COMMENT '抽签奖励进度(包括回退用户资格)',
  `notarization_img` varchar(100) DEFAULT NULL COMMENT '公证图片',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_activity` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3162 DEFAULT CHARSET=utf8 COMMENT='预定抽签阶段配置';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_booking_qualification_info   */
/******************************************/
CREATE TABLE `maotai_booking_qualification_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `phase_id` int(11) NOT NULL COMMENT '预定阶段ID',
  `user_id` bigint(20) NOT NULL COMMENT '抽签资格用户ID',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phase_id_user_id` (`phase_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129149522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='茅台抽签用户资格表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_booking_user   */
/******************************************/
CREATE TABLE `maotai_booking_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `phase_id` int(11) NOT NULL COMMENT '预定阶段ID',
  `user_id` bigint(20) NOT NULL COMMENT '预约用户ID',
  `qualification_status` tinyint(2) DEFAULT NULL COMMENT '资格状态是否回滚',
  `draw_reward_status` tinyint(2) DEFAULT NULL COMMENT '是否中签',
  `rcs_limit` tinyint(1) DEFAULT NULL COMMENT '是否风险用户',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_activity_phase_user` (`activity_id`,`phase_id`,`user_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=116651482 DEFAULT CHARSET=utf8 COMMENT='预定阶段用户';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_meidou_replenish_qualification_info   */
/******************************************/
CREATE TABLE `maotai_meidou_replenish_qualification_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `remaining_amount` int(11) DEFAULT NULL COMMENT '剩余美豆数量',
  `month_condition` tinyint(1) DEFAULT NULL COMMENT '美豆月度资格条件是否满足',
  `replenish_amount` int(11) DEFAULT NULL COMMENT '补充资格数量',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态，0 1 是否补发资格',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT '1' COMMENT 'yn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_month` (`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=12245330 DEFAULT CHARSET=utf8 COMMENT='茅台美豆资格补充数据';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_order_record   */
/******************************************/
CREATE TABLE `maotai_order_record` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `activity_id` int(20) NOT NULL COMMENT '活动ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sku_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `sku_price` int(11) DEFAULT NULL COMMENT '单个商品价格',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `shipment_date` int(11) DEFAULT NULL,
  `shipment_time` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '状态',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `business_key` varchar(45) DEFAULT NULL COMMENT '业务单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`),
  KEY `idx_vendor_store` (`vendor_id`,`store_id`),
  KEY `idx_business` (`business_key`),
  KEY `vendor_sku_created` (`vendor_id`,`sku_id`,`created`),
  KEY `idx_vendor_user_id` (`vendor_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52374562 DEFAULT CHARSET=utf8 COMMENT='茅台订单记录表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_changed_user_info   */
/******************************************/
CREATE TABLE `maotai_qualification_changed_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT '1' COMMENT 'yn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_month` (`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=4945732 DEFAULT CHARSET=utf8 COMMENT='茅台资格调整资格变化对应用户列表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_info   */
/******************************************/
CREATE TABLE `maotai_qualification_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL COMMENT '商家ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `serial_month` int(2) DEFAULT '0' COMMENT '连续消费月数',
  `serial_category` int(2) DEFAULT '0' COMMENT '连续消费类目数',
  `serial_category_names` varchar(255) DEFAULT NULL COMMENT '连续消费类目名称',
  `exist_to_home_order` tinyint(1) DEFAULT NULL COMMENT '存在到家订单',
  `month_condition` tinyint(1) DEFAULT NULL COMMENT '月度资格条件',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否生效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `p0_month_consume_time` int(2) DEFAULT NULL COMMENT 'p0月度消费次数',
  `p1_month_consume_time` int(2) DEFAULT NULL COMMENT 'p1月度消费次数',
  `p2_month_consume_time` int(2) DEFAULT NULL COMMENT 'p2月度消费次数',
  `np0_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p0月度消费次数',
  `np1_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p1月度消费次数',
  `np2_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p2月度消费次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vendor_user_month` (`vendor_id`,`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=13502381562 DEFAULT CHARSET=utf8 COMMENT='茅台当月资格数据';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_info_test   */
/******************************************/
CREATE TABLE `maotai_qualification_info_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL COMMENT '商家ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `serial_month` int(2) DEFAULT '0' COMMENT '连续消费月数',
  `serial_category` int(2) DEFAULT '0' COMMENT '连续消费类目数',
  `serial_category_names` varchar(255) DEFAULT NULL COMMENT '连续消费类目名称',
  `exist_to_home_order` tinyint(1) DEFAULT NULL COMMENT '存在到家订单',
  `month_condition` tinyint(1) DEFAULT NULL COMMENT '月度资格条件',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否生效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `p0_month_consume_time` int(2) DEFAULT NULL COMMENT 'p0月度消费次数',
  `p1_month_consume_time` int(2) DEFAULT NULL COMMENT 'p1月度消费次数',
  `p2_month_consume_time` int(2) DEFAULT NULL COMMENT 'p2月度消费次数',
  `np0_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p0月度消费次数',
  `np1_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p1月度消费次数',
  `np2_month_consume_time` int(2) DEFAULT NULL COMMENT '非超市p2月度消费次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vendor_user_month` (`vendor_id`,`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=14378402 DEFAULT CHARSET=utf8 COMMENT='茅台当月资格数据测试表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_info_with_channel   */
/******************************************/
CREATE TABLE `maotai_qualification_info_with_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL COMMENT '商家ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `serial_month_to_shop` int(2) DEFAULT '0' COMMENT '连续消费月数到店',
  `serial_category_to_shop` int(2) DEFAULT '0' COMMENT '连续消费类目数到店',
  `serial_category_names_to_shop` varchar(255) DEFAULT NULL COMMENT '连续消费类目名称到店',
  `serial_month_to_home` int(2) DEFAULT '0' COMMENT '连续消费月数到家',
  `serial_category_to_home` int(2) DEFAULT '0' COMMENT '连续消费类目数到家',
  `serial_category_names_to_home` varchar(255) DEFAULT NULL COMMENT '连续消费类目名称到家',
  `p0_consume_time_to_shop` int(2) DEFAULT NULL COMMENT 'p0月度消费次数到店',
  `p1_consume_time_to_shop` int(2) DEFAULT NULL COMMENT 'p1月度消费次数到店',
  `p2_consume_time_to_shop` int(2) DEFAULT NULL COMMENT 'p2月度消费次数到店',
  `p0_consume_time_to_home` int(2) DEFAULT NULL COMMENT 'p0月度消费次数到家',
  `p1_consume_time_to_home` int(2) DEFAULT NULL COMMENT 'p1月度消费次数到家',
  `p2_consume_time_to_home` int(2) DEFAULT NULL COMMENT 'p2月度消费次数到家',
  `month_condition` tinyint(1) DEFAULT NULL COMMENT '月度资格条件',
  `yn` tinyint(2) DEFAULT '1' COMMENT '是否生效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vendor_user_month` (`vendor_id`,`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=1755401922 DEFAULT CHARSET=utf8 COMMENT='茅台资格数据到家到店';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_log   */
/******************************************/
CREATE TABLE `maotai_qualification_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL COMMENT '内容',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家',
  `properties` varchar(100) DEFAULT NULL COMMENT '属性',
  `creator` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `create_name` varchar(50) DEFAULT NULL COMMENT '操作用户名称',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=119242 DEFAULT CHARSET=utf8 COMMENT='茅台资格更新操作日志';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_qualification_update_user   */
/******************************************/
CREATE TABLE `maotai_qualification_update_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month_condition` int(11) NOT NULL COMMENT '月度资格数量',
  `update_status` tinyint(1) DEFAULT NULL COMMENT '是否更新成功 1已更新',
  `creator` varchar(30) DEFAULT NULL COMMENT '更新用户',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_month_creator` (`month`,`creator`)
) ENGINE=InnoDB AUTO_INCREMENT=22494122 DEFAULT CHARSET=utf8 COMMENT='茅台资格更新用户';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_third_order_record   */
/******************************************/
CREATE TABLE `maotai_third_order_record` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sku_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `sku_price` int(11) DEFAULT NULL COMMENT '单个商品价格',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_id` (`order_id`),
  KEY `vendor_sku_created` (`vendor_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='茅台三方订单记录表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_wumart_qualification   */
/******************************************/
CREATE TABLE `maotai_wumart_qualification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `serial_month` int(2) DEFAULT '0' COMMENT '连续消费月数',
  `serial_category` int(2) DEFAULT '0' COMMENT '连续消费类目数',
  `serial_category_names` varchar(255) DEFAULT NULL COMMENT '连续消费类目名称',
  `paid_price` bigint(20) DEFAULT NULL COMMENT '当月实付金额',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态，0 1 是否发送美豆',
  `month_condition` tinyint(1) DEFAULT NULL COMMENT '月度资格条件',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否生效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_month` (`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=313991926 DEFAULT CHARSET=utf8 COMMENT='茅台当月资格数据';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = maotai_wumart_qualification_history   */
/******************************************/
CREATE TABLE `maotai_wumart_qualification_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `month` varchar(10) NOT NULL COMMENT '资格月',
  `serial_month` int(2) DEFAULT NULL COMMENT '连续消费月数',
  `p0` bigint(20) DEFAULT NULL COMMENT '当前实付金额',
  `p1` bigint(20) DEFAULT NULL,
  `p2` bigint(20) DEFAULT NULL,
  `p3` bigint(20) DEFAULT NULL,
  `p4` bigint(20) DEFAULT NULL,
  `p5` bigint(20) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '状态，0 1 是否发送美豆',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT '1' COMMENT 'yn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_month` (`user_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=5629804 DEFAULT CHARSET=utf8 COMMENT='茅台资格历史数据';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = op_history   */
/******************************************/
CREATE TABLE `op_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `op` varchar(35) DEFAULT NULL COMMENT '操作者',
  `created` datetime DEFAULT NULL COMMENT '操作时间',
  `type` varchar(35) DEFAULT NULL COMMENT '操作类型',
  `extra_data` text COMMENT '操作具体数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1356282 DEFAULT CHARSET=utf8 COMMENT='活动操作历史';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = presale_booking_users   */
/******************************************/
CREATE TABLE `presale_booking_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase_id` int(11) DEFAULT NULL COMMENT '阶段ID',
  `booking_users` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8 COMMENT='预约用户信息';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = purchase_note_record   */
/******************************************/
CREATE TABLE `purchase_note_record` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `purchase_date` varchar(20) DEFAULT NULL COMMENT '采购时间',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `purchase_count` bigint(20) DEFAULT NULL COMMENT '采购数量',
  `properties` varchar(300) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单记录';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = user_maotai_info   */
/******************************************/
CREATE TABLE `user_maotai_info` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `vendor_id` bigint(11) NOT NULL COMMENT '商家id',
  `day` varchar(15) DEFAULT NULL COMMENT '资格天/或月',
  `maotai_qualification_count` bigint(11) NOT NULL DEFAULT '0' COMMENT '资格天茅台资格数',
  `process_time` datetime NOT NULL COMMENT '数据处理时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `platform_user_id` varchar(25) DEFAULT NULL COMMENT '渠道用户ID',
  `repaired_user` tinyint(1) DEFAULT NULL COMMENT '是否修复标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vendor_platform_user_day` (`vendor_id`,`platform_user_id`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=1176069442 DEFAULT CHARSET=utf8 COMMENT='用户茅台信息表';


/******************************************/
/*   DatabaseName = dmall_pre_sale   */
/*   TableName = user_order_record   */
/******************************************/
CREATE TABLE `user_order_record` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `source` tinyint(1) DEFAULT '1' COMMENT '渠道来源 1多点预售订单 2美团预售订单',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `ware_id` bigint(11) DEFAULT NULL,
  `order_ware_id` bigint(20) DEFAULT NULL COMMENT '订单商品表id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `sku_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `sku_price` int(11) DEFAULT NULL COMMENT '单个商品价格',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `shipment_date` varchar(20) DEFAULT NULL COMMENT '提货日期',
  `shipment_time` varchar(45) DEFAULT NULL COMMENT '提货时间',
  `properties` varchar(300) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '状态',
  `goods_code` varchar(45) DEFAULT NULL COMMENT '采销对应的商品编码',
  `store_code` varchar(45) DEFAULT NULL COMMENT '采销对应的门店',
  `po_no` varchar(45) DEFAULT NULL COMMENT '采销对应的单号',
  `send_po_date` varchar(45) DEFAULT NULL COMMENT '下发采销单的时间',
  `unit` varchar(20) DEFAULT NULL COMMENT '商品单位',
  `shipment_type` int(11) DEFAULT '2' COMMENT '配送方式 1-配送 2-自提',
  `purchase_category` varchar(200) DEFAULT NULL COMMENT '采购品类',
  `remarks` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_order_order_ware_id` (`order_id`,`order_ware_id`),
  KEY `idx_activity_vendor_store` (`activity_id`,`vendor_id`,`store_id`),
  KEY `idx_sku_send_po_date` (`sku_id`,`send_po_date`),
  KEY `idx_user_activity` (`user_id`,`activity_id`),
  KEY `idx_vendor_created` (`vendor_id`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92919842 DEFAULT CHARSET=utf8 COMMENT='用户订单记录表';


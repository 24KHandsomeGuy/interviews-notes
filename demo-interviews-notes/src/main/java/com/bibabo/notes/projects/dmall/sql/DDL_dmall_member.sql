-- Export Tools
-- Time: 2024-04-16 16:39:18
-- Service: s3463i.jxq.db.dmall.com:3463   Database: dmall_member
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = alipay_marketing_card   */
/******************************************/
CREATE TABLE `alipay_marketing_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) DEFAULT NULL COMMENT 'appId',
  `user_id` bigint(1) DEFAULT NULL,
  `alipay_uid` varchar(100) DEFAULT NULL COMMENT '支付宝用户ID',
  `is_new` int(11) DEFAULT NULL COMMENT '是否是新用户',
  `biz_card_no` varchar(100) DEFAULT NULL COMMENT '支付宝会员卡开卡业务号',
  `opend_date` datetime DEFAULT NULL COMMENT '开卡时间',
  `valid_date` datetime DEFAULT NULL COMMENT '有效截止日期',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `state` int(11) DEFAULT NULL COMMENT '状态;1:开通;2:解绑',
  `extra_data` text COMMENT '扩展数据',
  `syn_time` datetime DEFAULT NULL COMMENT '同步时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_app_id_alip_uid_biz_card_no` (`app_id`,`alipay_uid`,`biz_card_no`),
  KEY `idx_syn_time_state` (`syn_time`,`state`),
  KEY `index_app_id_syn_time` (`app_id`,`syn_time`)
) ENGINE=InnoDB AUTO_INCREMENT=374138722 DEFAULT CHARSET=utf8mb4 COMMENT='支付宝商户会员卡';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = aoboke_update   */
/******************************************/
CREATE TABLE `aoboke_update` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `platform_user_id` varchar(50) DEFAULT NULL COMMENT '三方会员ID',
  `real_name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `credent_no` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `detail_address` varchar(500) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `birth_day` varchar(50) DEFAULT NULL COMMENT '生日',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `sap_store_id` varchar(50) DEFAULT NULL COMMENT '商家门店ID',
  `growth` varchar(50) DEFAULT NULL COMMENT '成长值',
  `pro_state` int(1) DEFAULT '0' COMMENT '0：初始化 1：成功 2：手机号非法失败 3：成长值非法失败 4：门店ID找不到配置失败，默认0',
  `pro_remark` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，0：无效',
  PRIMARY KEY (`id`),
  KEY `idx_platform_user_id` (`platform_user_id`),
  KEY `idx_phone` (`phone`),
  KEY `idx_state` (`pro_state`)
) ENGINE=InnoDB AUTO_INCREMENT=217608642 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='奥博克迁移表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = auth_vendor_config   */
/******************************************/
CREATE TABLE `auth_vendor_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示平台)',
  `auth_content` varchar(4096) DEFAULT NULL COMMENT '授权内容',
  `remark` varchar(256) DEFAULT NULL COMMENT '初始化数据时备注说明',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='商家授权内容表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = card_status_maintenance   */
/******************************************/
CREATE TABLE `card_status_maintenance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `vendor_id` varchar(128) NOT NULL DEFAULT '' COMMENT '商家',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `tag_status` int(11) DEFAULT NULL COMMENT '3.绑定成功,1.绑定失败,2.取消绑定成功4.初始化创建 0.取消绑定失败',
  `tag_key` int(20) DEFAULT NULL COMMENT '会员绑定标识',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(11) DEFAULT NULL COMMENT '是否有效',
  `properties` varchar(256) DEFAULT NULL COMMENT '配置信息',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1334842 DEFAULT CHARSET=utf8 COMMENT='卡状态维护表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = cetc_health_code_info   */
/******************************************/
CREATE TABLE `cetc_health_code_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `id_no` varchar(255) NOT NULL COMMENT '身份证号',
  `address_code` varchar(128) DEFAULT NULL COMMENT '现居住地⾏政区编码',
  `address_detail` varchar(1024) DEFAULT NULL COMMENT '现居住地详细地址',
  `current_position` varchar(1024) DEFAULT NULL COMMENT '当前位置(定位poi)',
  `arrived_hubei` int(11) DEFAULT NULL COMMENT '是否去过湖北(0:没去过,1:去过)',
  `has_contact` int(11) DEFAULT NULL COMMENT '是否有密切接触(0:没有,1:有,2:未知)',
  `healthy_status` int(11) DEFAULT NULL COMMENT '健康状态(0:不健康,1:健康)',
  `health_info` varchar(11) DEFAULT NULL COMMENT '健康详情(1:发热,2:干咳,3:乏力,4:咽痛,5:流涕,6:呼吸困难)',
  `check_result` varchar(2056) DEFAULT NULL COMMENT '电科云监控反馈结果',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_idx` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2926 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user   */
/******************************************/
CREATE TABLE `composite_user` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`)
) ENGINE=InnoDB AUTO_INCREMENT=24571 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_00   */
/******************************************/
CREATE TABLE `composite_user_00` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_01   */
/******************************************/
CREATE TABLE `composite_user_01` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14963642 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_02   */
/******************************************/
CREATE TABLE `composite_user_02` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB AUTO_INCREMENT=843242 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_03   */
/******************************************/
CREATE TABLE `composite_user_03` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8920802 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_04   */
/******************************************/
CREATE TABLE `composite_user_04` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2753042 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_05   */
/******************************************/
CREATE TABLE `composite_user_05` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_06   */
/******************************************/
CREATE TABLE `composite_user_06` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_07   */
/******************************************/
CREATE TABLE `composite_user_07` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_08   */
/******************************************/
CREATE TABLE `composite_user_08` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_09   */
/******************************************/
CREATE TABLE `composite_user_09` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_10   */
/******************************************/
CREATE TABLE `composite_user_10` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_11   */
/******************************************/
CREATE TABLE `composite_user_11` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_12   */
/******************************************/
CREATE TABLE `composite_user_12` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_13   */
/******************************************/
CREATE TABLE `composite_user_13` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_14   */
/******************************************/
CREATE TABLE `composite_user_14` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_15   */
/******************************************/
CREATE TABLE `composite_user_15` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_16   */
/******************************************/
CREATE TABLE `composite_user_16` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_17   */
/******************************************/
CREATE TABLE `composite_user_17` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_18   */
/******************************************/
CREATE TABLE `composite_user_18` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = composite_user_19   */
/******************************************/
CREATE TABLE `composite_user_19` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT COMMENT '复合会员id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '会员userId',
  `system_code` int(11) DEFAULT NULL COMMENT '复合类型:1:品牌',
  `instance_code` varchar(11) DEFAULT NULL COMMENT '实例编号',
  `instance_name` varchar(255) DEFAULT NULL COMMENT '实例名称',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id(非sapId)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_system_code_instance_code` (`user_id`,`system_code`,`instance_code`),
  KEY `index_system_code_instance_code` (`system_code`,`instance_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='复合会员表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_growth_reward_rule   */
/******************************************/
CREATE TABLE `config_growth_reward_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规则名称',
  `growth_threshold` int(11) DEFAULT '0' COMMENT '成长值阈值',
  `receive_amount` int(11) DEFAULT '0' COMMENT '领取的积分数量',
  `point_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '积分key',
  `validity_start` datetime DEFAULT NULL COMMENT '生效开始时间',
  `validity_end` datetime DEFAULT NULL COMMENT '生效结束时间',
  `status` int(11) DEFAULT '1' COMMENT '规则状态',
  `creator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `base_growth` bigint(1) DEFAULT NULL COMMENT '倍数的基数',
  `odd_multiple_reward_amount` int(11) DEFAULT NULL COMMENT '奇数倍领取奖励数量',
  `even_multiple_reward_amount` int(11) DEFAULT NULL COMMENT '偶数倍领取积分数量',
  `activity_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动链接',
  `valid_day` int(11) DEFAULT NULL COMMENT '领取有效天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_growth_rule   */
/******************************************/
CREATE TABLE `config_growth_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值规则ID',
  `type_id` bigint(20) NOT NULL COMMENT '会员类型ID',
  `level_id` bigint(20) NOT NULL COMMENT '会员等级ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '规则类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '规则名称',
  `validity_start` datetime DEFAULT NULL COMMENT '生效开始时间',
  `validity_end` datetime DEFAULT NULL COMMENT '生效结束时间',
  `content` text COLLATE utf8_bin COMMENT '规则具体内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态(1:启用,0:禁用)',
  `rule_status` tinyint(1) DEFAULT NULL COMMENT '规则状态(0:待审核,1:审核生效,-1:禁用)',
  `creator` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `description` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '成长值规则详情',
  `vendor_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13642 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成长值规则表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_level   */
/******************************************/
CREATE TABLE `config_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员等级ID',
  `type_id` bigint(20) NOT NULL COMMENT '会员类型ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '会员等级',
  `name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认等级(1:是,0:不是)',
  `icon` varchar(600) DEFAULT NULL COMMENT '两类logo url, 使用json格式',
  `validity` int(11) DEFAULT NULL COMMENT '等级有效期',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态(1:启用,0:禁用)',
  `name_color_val` varchar(150) DEFAULT NULL COMMENT '字体颜色色值',
  `background_color_val` varchar(150) DEFAULT NULL COMMENT '背景颜色色值',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示平台)',
  `start_growth` bigint(20) DEFAULT NULL COMMENT '成长值区间下限',
  `end_growth` bigint(20) DEFAULT NULL COMMENT '成长值区间上限',
  `multiple_reward` float(5,1) DEFAULT '1.0' COMMENT '等级成长值翻倍权益',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1642 DEFAULT CHARSET=utf8 COMMENT='会员等级配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_level_rule   */
/******************************************/
CREATE TABLE `config_level_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '等级规则ID',
  `type_id` bigint(20) NOT NULL COMMENT '会员类型ID',
  `name` varchar(50) DEFAULT NULL COMMENT '会员等级规则的名称',
  `effected_time` datetime DEFAULT NULL COMMENT '规则生效时间',
  `expired_time` datetime DEFAULT NULL COMMENT '规则结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态(1:启用,0:禁用)',
  `execute_status` tinyint(1) DEFAULT NULL COMMENT '该值暂时无用 执行状态(0:待执行,1:执行中,2:已结束)',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='等级规则表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_level_rule_detail   */
/******************************************/
CREATE TABLE `config_level_rule_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '等级规则明细ID',
  `level_rule_id` bigint(20) NOT NULL COMMENT '等级规则ID',
  `level_id` bigint(20) NOT NULL COMMENT '会员等级ID',
  `start_point` bigint(20) DEFAULT NULL COMMENT '初始成长值',
  `end_point` bigint(20) DEFAULT NULL COMMENT '结束成长值',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='等级规则明细表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_level_welfare   */
/******************************************/
CREATE TABLE `config_level_welfare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL COMMENT '会员等级id',
  `vendor_id` int(11) NOT NULL COMMENT '商家id',
  `type` int(2) NOT NULL COMMENT '权益类型（3：多倍成长值，4：介绍型权益，5：升级有礼）',
  `welfare` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权益内容',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `receive_type` int(11) DEFAULT NULL COMMENT '触发方式,1：用户自己领取;2:系统自动发放',
  `introduce_short` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权益简介',
  PRIMARY KEY (`id`),
  KEY `idx_levelId_type` (`level_id`,`type`),
  KEY `idx_vendorId` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员权益配置';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_member_tag_key   */
/******************************************/
CREATE TABLE `config_member_tag_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL COMMENT '会员标签key',
  `name` varchar(255) DEFAULT NULL COMMENT '会员标签名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '标签描述',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `type` int(11) DEFAULT '3' COMMENT '操作类型:2:只读;3:读写',
  `properties` varchar(255) DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='会员标记KEY配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_otp_code_channel   */
/******************************************/
CREATE TABLE `config_otp_code_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `platform` int(8) NOT NULL COMMENT '渠道',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `type` tinyint(1) NOT NULL COMMENT '类型，字母卡BIN:1, 数字卡BIN:2',
  `source` int(8) NOT NULL COMMENT '展示卡BIN的系统端,来自表config_opt_code_source',
  `code` varchar(10) NOT NULL COMMENT '卡BIN',
  `pay_second` tinyint(1) DEFAULT NULL COMMENT '是否支持秒付',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态(1:生效,0:禁用)',
  `version` int(11) DEFAULT NULL COMMENT '动态码版本号',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_vendor_code` (`vendor_id`,`code`),
  KEY `idx_verdor_source` (`vendor_id`,`source`),
  KEY `idx_version` (`version`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_otp_code_source   */
/******************************************/
CREATE TABLE `config_otp_code_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '动态码来源名称，如多点APP等',
  `platform` int(8) NOT NULL COMMENT '渠道',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_paid_up_member_base   */
/******************************************/
CREATE TABLE `config_paid_up_member_base` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '付费会员名称',
  `status` int(11) DEFAULT '1' COMMENT '状态：0:失效；1：生效',
  `cycle` int(11) DEFAULT '1' COMMENT '付费会员周期.1:月卡',
  `begin_time` datetime DEFAULT NULL COMMENT '生效开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '生效结束时间',
  `vendor_id` int(11) DEFAULT NULL COMMENT '适用商家ID',
  `vendor_logo` varchar(255) DEFAULT NULL COMMENT '商家LOGO',
  `card_face_img` varchar(255) DEFAULT NULL COMMENT '卡面的图片地址',
  `task_id` int(11) DEFAULT NULL COMMENT '权益任务ID',
  `save_money` bigint(1) DEFAULT '0' COMMENT '周期权益节约单价(分)',
  `share_info` varchar(512) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `slogan` varchar(50) DEFAULT NULL COMMENT '宣传标语',
  `cycle_type` int(11) DEFAULT '1' COMMENT '周期类型：1：单周期;2:多周期',
  `support_auto_renewal` int(11) DEFAULT '1' COMMENT '是否支持自动续费.1:是;0:否',
  `support_union_member` int(11) DEFAULT '0' COMMENT '是否支付联合会员.1:是;0:否',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id_begin_end_time_status` (`vendor_id`,`begin_time`,`end_time`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1842 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员基本配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_paid_up_member_detail   */
/******************************************/
CREATE TABLE `config_paid_up_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` bigint(1) DEFAULT NULL COMMENT '基本配置ID',
  `page_config` text COMMENT '页面配置信息',
  `cycle_price_config` text COMMENT '周期配置',
  `share_config` varchar(618) DEFAULT NULL COMMENT '分享配置信息',
  `welfare_config` text COMMENT '权益配置',
  `union_member_config` text COMMENT '联合会员信息',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `push_config` text COMMENT 'app推送信息',
  PRIMARY KEY (`id`),
  KEY `idx_base_id_yn` (`base_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=1842 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员配置详细信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_paid_up_member_log   */
/******************************************/
CREATE TABLE `config_paid_up_member_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` bigint(1) DEFAULT NULL COMMENT '基础配置ID',
  `content` text COMMENT '日志内容',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_base_id_created_index` (`base_id`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=200522 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员配置日志表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_paid_up_member_price   */
/******************************************/
CREATE TABLE `config_paid_up_member_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` bigint(1) DEFAULT NULL COMMENT '基本配置ID',
  `ware_sku` bigint(1) DEFAULT NULL COMMENT '商品SKU',
  `ware_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `market_price` bigint(1) DEFAULT NULL COMMENT '原价(单位:分)',
  `sale_price` bigint(1) DEFAULT NULL COMMENT '销售价(单位:分)',
  `first_price` bigint(1) DEFAULT NULL COMMENT '首次购买价(单位:分)',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `auto_renewal` int(11) DEFAULT '0' COMMENT '支持自动续费;1:支持;0:不支持',
  `first_auto_renewal_price` bigint(1) DEFAULT NULL COMMENT '首次自动续费价格',
  `auto_renewal_price` bigint(1) DEFAULT NULL COMMENT '自动续费常规价格',
  PRIMARY KEY (`id`),
  KEY `idx_base_id` (`base_id`),
  KEY `idx_ware_sku` (`ware_sku`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员价格配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_paid_up_member_welfare   */
/******************************************/
CREATE TABLE `config_paid_up_member_welfare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_id` bigint(1) DEFAULT NULL COMMENT '基础配置ID',
  `type` int(11) DEFAULT NULL COMMENT '权益类别',
  `name` varchar(50) DEFAULT NULL COMMENT '权益名称',
  `brief` varchar(50) DEFAULT NULL COMMENT '权益简称',
  `description` varchar(255) DEFAULT NULL COMMENT '权益描述',
  `background_img` varchar(255) DEFAULT NULL COMMENT '权益头图',
  `icon` varchar(255) DEFAULT NULL COMMENT '权益icon',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `task_id` int(10) DEFAULT NULL COMMENT '权益兑换任务',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_base_id` (`base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员权益配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_payment   */
/******************************************/
CREATE TABLE `config_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付方式ID',
  `code` int(11) DEFAULT NULL COMMENT '支付方式编码',
  `name` varchar(20) DEFAULT NULL COMMENT '支付方式名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='支付方式配置';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_type   */
/******************************************/
CREATE TABLE `config_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员类型ID',
  `name` varchar(50) DEFAULT NULL COMMENT '会员类型名称',
  `code` varchar(10) DEFAULT NULL COMMENT '会员类型编码',
  `card_length` tinyint(4) DEFAULT NULL COMMENT '会员卡长度',
  `level_cal_fre` tinyint(4) DEFAULT NULL COMMENT '会员等级计算频次',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否有效(1:有效,0:无效)',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员类型配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_welfare   */
/******************************************/
CREATE TABLE `config_welfare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员权益ID',
  `type_id` bigint(20) DEFAULT NULL COMMENT '会员类型ID',
  `name` varchar(50) DEFAULT NULL COMMENT '权益名称',
  `description` varchar(256) DEFAULT NULL COMMENT '权益描述',
  `type` tinyint(4) DEFAULT NULL COMMENT '权益形式',
  `trigger_cond` tinyint(4) DEFAULT NULL COMMENT '触发条件',
  `content` varchar(5000) DEFAULT NULL COMMENT '权益具体内容(包括活动等信息)',
  `validity_start` datetime DEFAULT NULL COMMENT '生效开始时间',
  `validity_end` datetime DEFAULT NULL COMMENT '生效结束时间',
  `rule_status` tinyint(1) DEFAULT NULL COMMENT '权益状态(0:待审核,1:审核生效,-1:禁用)',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `logos` varchar(1024) DEFAULT NULL COMMENT '权益logo',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `received_way` tinyint(1) DEFAULT NULL COMMENT '是否可领取',
  `activity_url` varchar(256) DEFAULT NULL COMMENT '权益落地页URL',
  `activity_subhead` varchar(256) DEFAULT NULL COMMENT '权益落地页副标题',
  `activity_content` varchar(256) DEFAULT NULL COMMENT '权益落地页权益内容',
  `activity_object` varchar(256) DEFAULT NULL COMMENT '权益落地页权益对象',
  `activity_platform` varchar(256) DEFAULT NULL COMMENT '权益落地页使用渠道',
  `activity_banner` varchar(256) DEFAULT NULL COMMENT '权益落地页banner',
  `about_activity` varchar(256) DEFAULT NULL COMMENT '权益默认的介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='会员权益配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = config_welfare_vendor_reward   */
/******************************************/
CREATE TABLE `config_welfare_vendor_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_welfare_id` int(11) DEFAULT NULL COMMENT '会员权益id',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `vendor_name` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `level0_taskId` int(11) DEFAULT NULL COMMENT '普通会员奖励任务id',
  `level1_taskId` int(11) DEFAULT NULL COMMENT '银卡会员任务奖励id',
  `level2_taskId` int(11) DEFAULT NULL COMMENT '金卡会员奖励任务id',
  `level3_taskId` int(11) DEFAULT NULL COMMENT '铂金卡会员任务奖励id',
  `about_welfare` varchar(255) DEFAULT NULL COMMENT '任务奖励描述',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `yn` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `properties` varchar(512) DEFAULT NULL COMMENT '属性字段,存放json字符串',
  PRIMARY KEY (`id`),
  KEY `idx_config_welfare_id_vendor_id` (`config_welfare_id`,`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = experience_card_config   */
/******************************************/
CREATE TABLE `experience_card_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '体验卡id主键',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '体验卡名称',
  `vendor_id` varchar(128) NOT NULL DEFAULT '' COMMENT '商家',
  `status` int(11) NOT NULL COMMENT '1.发布 2.进行中 3未发布 4终止',
  `channel` varchar(36) DEFAULT NULL COMMENT '渠道',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `receive_type` int(11) DEFAULT NULL COMMENT '可领取次数类型',
  `receive_number` int(11) DEFAULT NULL COMMENT '可领取次数',
  `experience_days` int(11) DEFAULT NULL COMMENT '体验卡有效期',
  `use_number` int(11) DEFAULT NULL COMMENT '可使用次数',
  `distribute_type` int(11) DEFAULT NULL COMMENT '发放升级权益类型',
  `received_days` int(11) DEFAULT NULL COMMENT '发放延迟天数',
  `task_id` int(11) DEFAULT NULL COMMENT '潘多拉id',
  `creator` varchar(128) NOT NULL DEFAULT '' COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(11) DEFAULT NULL COMMENT '是否有效',
  `properties` varchar(3000) DEFAULT NULL COMMENT '优惠券配置信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5722 DEFAULT CHARSET=utf8 COMMENT='体验卡管理';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_adjust_apply   */
/******************************************/
CREATE TABLE `growth_adjust_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL COMMENT '商家id',
  `type` int(2) NOT NULL COMMENT '调整类型（0：扣减，1增加）',
  `user_num` int(11) NOT NULL COMMENT '调整人数',
  `status` int(2) NOT NULL COMMENT '调整状态',
  `apply_user_id` bigint(20) NOT NULL COMMENT '申请人id',
  `apply_user_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请人姓名',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `audit_user_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_opinion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核意见',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调整说明',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendorId_type` (`vendor_id`,`type`),
  KEY `idx_vendorId_status` (`vendor_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成长值调整申请';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_adjust_details   */
/******************************************/
CREATE TABLE `growth_adjust_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL COMMENT '调整申请id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户手机号',
  `type` int(2) NOT NULL COMMENT '调整类型（0：扣减，1增加）',
  `result` int(2) DEFAULT NULL COMMENT '调整结果（1成功，-1失败）',
  `amount` int(11) NOT NULL COMMENT '调整数量',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调整说明',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_applyId_result` (`apply_id`,`result`) USING BTREE,
  KEY `idx_applyId_userId` (`apply_id`,`user_id`),
  KEY `idx_applyId_phone` (`apply_id`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成长值调整明细';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill   */
/******************************************/
CREATE TABLE `growth_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_000   */
/******************************************/
CREATE TABLE `growth_bill_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674291322 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_001   */
/******************************************/
CREATE TABLE `growth_bill_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=692985882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_002   */
/******************************************/
CREATE TABLE `growth_bill_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=694028522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_003   */
/******************************************/
CREATE TABLE `growth_bill_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690616642 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_004   */
/******************************************/
CREATE TABLE `growth_bill_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689923802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_005   */
/******************************************/
CREATE TABLE `growth_bill_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669327922 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_006   */
/******************************************/
CREATE TABLE `growth_bill_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669670642 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_007   */
/******************************************/
CREATE TABLE `growth_bill_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671138562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_008   */
/******************************************/
CREATE TABLE `growth_bill_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672805722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_009   */
/******************************************/
CREATE TABLE `growth_bill_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688807842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_010   */
/******************************************/
CREATE TABLE `growth_bill_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=716758362 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_011   */
/******************************************/
CREATE TABLE `growth_bill_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688629842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_012   */
/******************************************/
CREATE TABLE `growth_bill_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688906442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_013   */
/******************************************/
CREATE TABLE `growth_bill_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670274722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_014   */
/******************************************/
CREATE TABLE `growth_bill_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673619242 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_015   */
/******************************************/
CREATE TABLE `growth_bill_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=667980962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_016   */
/******************************************/
CREATE TABLE `growth_bill_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674142682 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_017   */
/******************************************/
CREATE TABLE `growth_bill_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=691722522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_018   */
/******************************************/
CREATE TABLE `growth_bill_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689863322 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_019   */
/******************************************/
CREATE TABLE `growth_bill_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690188082 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_020   */
/******************************************/
CREATE TABLE `growth_bill_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690214882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_021   */
/******************************************/
CREATE TABLE `growth_bill_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668878762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_022   */
/******************************************/
CREATE TABLE `growth_bill_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671576322 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_023   */
/******************************************/
CREATE TABLE `growth_bill_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672719522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_024   */
/******************************************/
CREATE TABLE `growth_bill_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673028842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_025   */
/******************************************/
CREATE TABLE `growth_bill_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=722300122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_026   */
/******************************************/
CREATE TABLE `growth_bill_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689665762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_027   */
/******************************************/
CREATE TABLE `growth_bill_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687978842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_028   */
/******************************************/
CREATE TABLE `growth_bill_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687871442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_029   */
/******************************************/
CREATE TABLE `growth_bill_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668607002 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_030   */
/******************************************/
CREATE TABLE `growth_bill_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673114202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_031   */
/******************************************/
CREATE TABLE `growth_bill_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672009282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_032   */
/******************************************/
CREATE TABLE `growth_bill_032` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669667562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_033   */
/******************************************/
CREATE TABLE `growth_bill_033` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=696069402 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_034   */
/******************************************/
CREATE TABLE `growth_bill_034` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690244122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_035   */
/******************************************/
CREATE TABLE `growth_bill_035` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687724122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_036   */
/******************************************/
CREATE TABLE `growth_bill_036` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=691960202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_037   */
/******************************************/
CREATE TABLE `growth_bill_037` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669597282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_038   */
/******************************************/
CREATE TABLE `growth_bill_038` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672623082 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_039   */
/******************************************/
CREATE TABLE `growth_bill_039` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672823882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_040   */
/******************************************/
CREATE TABLE `growth_bill_040` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670183762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_041   */
/******************************************/
CREATE TABLE `growth_bill_041` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690769242 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_042   */
/******************************************/
CREATE TABLE `growth_bill_042` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689795282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_043   */
/******************************************/
CREATE TABLE `growth_bill_043` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688702082 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_044   */
/******************************************/
CREATE TABLE `growth_bill_044` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=694342802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_045   */
/******************************************/
CREATE TABLE `growth_bill_045` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671021202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_046   */
/******************************************/
CREATE TABLE `growth_bill_046` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670302042 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_047   */
/******************************************/
CREATE TABLE `growth_bill_047` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670013442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_048   */
/******************************************/
CREATE TABLE `growth_bill_048` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669216202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_049   */
/******************************************/
CREATE TABLE `growth_bill_049` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=692085842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_050   */
/******************************************/
CREATE TABLE `growth_bill_050` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688068282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_051   */
/******************************************/
CREATE TABLE `growth_bill_051` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687137442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_052   */
/******************************************/
CREATE TABLE `growth_bill_052` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=684833922 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_053   */
/******************************************/
CREATE TABLE `growth_bill_053` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672288522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_054   */
/******************************************/
CREATE TABLE `growth_bill_054` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673846682 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_055   */
/******************************************/
CREATE TABLE `growth_bill_055` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669629762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_056   */
/******************************************/
CREATE TABLE `growth_bill_056` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671079962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_057   */
/******************************************/
CREATE TABLE `growth_bill_057` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689014562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_058   */
/******************************************/
CREATE TABLE `growth_bill_058` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688480162 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_059   */
/******************************************/
CREATE TABLE `growth_bill_059` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687637362 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_060   */
/******************************************/
CREATE TABLE `growth_bill_060` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688658962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_061   */
/******************************************/
CREATE TABLE `growth_bill_061` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=666777962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_062   */
/******************************************/
CREATE TABLE `growth_bill_062` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668199642 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_063   */
/******************************************/
CREATE TABLE `growth_bill_063` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=664762042 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_064   */
/******************************************/
CREATE TABLE `growth_bill_064` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=666644002 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_065   */
/******************************************/
CREATE TABLE `growth_bill_065` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=683037002 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_066   */
/******************************************/
CREATE TABLE `growth_bill_066` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=685116842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_067   */
/******************************************/
CREATE TABLE `growth_bill_067` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=676770442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_068   */
/******************************************/
CREATE TABLE `growth_bill_068` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=676554162 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_069   */
/******************************************/
CREATE TABLE `growth_bill_069` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674256282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_070   */
/******************************************/
CREATE TABLE `growth_bill_070` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670313482 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_071   */
/******************************************/
CREATE TABLE `growth_bill_071` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669613882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_072   */
/******************************************/
CREATE TABLE `growth_bill_072` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670911082 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_073   */
/******************************************/
CREATE TABLE `growth_bill_073` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687644802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_074   */
/******************************************/
CREATE TABLE `growth_bill_074` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689159642 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_075   */
/******************************************/
CREATE TABLE `growth_bill_075` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687976762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_076   */
/******************************************/
CREATE TABLE `growth_bill_076` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688407042 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_077   */
/******************************************/
CREATE TABLE `growth_bill_077` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668500482 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_078   */
/******************************************/
CREATE TABLE `growth_bill_078` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672201402 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_079   */
/******************************************/
CREATE TABLE `growth_bill_079` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=657608002 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_080   */
/******************************************/
CREATE TABLE `growth_bill_080` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670081482 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_081   */
/******************************************/
CREATE TABLE `growth_bill_081` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=684429922 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_082   */
/******************************************/
CREATE TABLE `growth_bill_082` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689566962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_083   */
/******************************************/
CREATE TABLE `growth_bill_083` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688302722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_084   */
/******************************************/
CREATE TABLE `growth_bill_084` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=686844162 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_085   */
/******************************************/
CREATE TABLE `growth_bill_085` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=672434522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_086   */
/******************************************/
CREATE TABLE `growth_bill_086` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674997882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_087   */
/******************************************/
CREATE TABLE `growth_bill_087` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668027562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_088   */
/******************************************/
CREATE TABLE `growth_bill_088` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=669652242 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_089   */
/******************************************/
CREATE TABLE `growth_bill_089` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=692701602 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_090   */
/******************************************/
CREATE TABLE `growth_bill_090` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=692375162 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_091   */
/******************************************/
CREATE TABLE `growth_bill_091` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=691398202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_092   */
/******************************************/
CREATE TABLE `growth_bill_092` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=690247082 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_093   */
/******************************************/
CREATE TABLE `growth_bill_093` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670444202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_094   */
/******************************************/
CREATE TABLE `growth_bill_094` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=675297882 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_095   */
/******************************************/
CREATE TABLE `growth_bill_095` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674076122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_096   */
/******************************************/
CREATE TABLE `growth_bill_096` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671500722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_097   */
/******************************************/
CREATE TABLE `growth_bill_097` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=698668802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_098   */
/******************************************/
CREATE TABLE `growth_bill_098` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688132762 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_099   */
/******************************************/
CREATE TABLE `growth_bill_099` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=689183522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_100   */
/******************************************/
CREATE TABLE `growth_bill_100` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688683442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_101   */
/******************************************/
CREATE TABLE `growth_bill_101` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673951722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_102   */
/******************************************/
CREATE TABLE `growth_bill_102` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668818282 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_103   */
/******************************************/
CREATE TABLE `growth_bill_103` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=665322202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_104   */
/******************************************/
CREATE TABLE `growth_bill_104` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671961442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_105   */
/******************************************/
CREATE TABLE `growth_bill_105` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=686284562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_106   */
/******************************************/
CREATE TABLE `growth_bill_106` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687672962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_107   */
/******************************************/
CREATE TABLE `growth_bill_107` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688898522 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_108   */
/******************************************/
CREATE TABLE `growth_bill_108` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=685356842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_109   */
/******************************************/
CREATE TABLE `growth_bill_109` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=668945562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_110   */
/******************************************/
CREATE TABLE `growth_bill_110` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=675627802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_111   */
/******************************************/
CREATE TABLE `growth_bill_111` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673320562 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_112   */
/******************************************/
CREATE TABLE `growth_bill_112` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=666638122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_113   */
/******************************************/
CREATE TABLE `growth_bill_113` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687506482 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_114   */
/******************************************/
CREATE TABLE `growth_bill_114` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687949202 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_115   */
/******************************************/
CREATE TABLE `growth_bill_115` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=688258842 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_116   */
/******************************************/
CREATE TABLE `growth_bill_116` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687093042 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_117   */
/******************************************/
CREATE TABLE `growth_bill_117` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=666989962 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_118   */
/******************************************/
CREATE TABLE `growth_bill_118` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=671457722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_119   */
/******************************************/
CREATE TABLE `growth_bill_119` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=673842242 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_120   */
/******************************************/
CREATE TABLE `growth_bill_120` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670214642 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_121   */
/******************************************/
CREATE TABLE `growth_bill_121` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=686241322 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_122   */
/******************************************/
CREATE TABLE `growth_bill_122` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687653442 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_123   */
/******************************************/
CREATE TABLE `growth_bill_123` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687283122 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_124   */
/******************************************/
CREATE TABLE `growth_bill_124` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=687351722 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_125   */
/******************************************/
CREATE TABLE `growth_bill_125` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674555002 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_126   */
/******************************************/
CREATE TABLE `growth_bill_126` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=670170922 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_bill_127   */
/******************************************/
CREATE TABLE `growth_bill_127` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(128) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `src_growth` bigint(20) DEFAULT NULL COMMENT '成长值前值',
  `dest_growth` bigint(20) DEFAULT NULL COMMENT '成长值后值',
  `detail` varchar(100) DEFAULT NULL COMMENT '来源详情',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `platform` int(8) DEFAULT '1' COMMENT '渠道（业态）',
  `vendor_id` varchar(20) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `store_id` varchar(20) DEFAULT NULL COMMENT '门店ID, 如果是物美渠道，则是sapID',
  `source` int(8) DEFAULT NULL COMMENT '业务来源',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `vendor_sap_id` varchar(50) DEFAULT NULL COMMENT '商家ID, 如果是物美渠道，则是商家sapID',
  `shard_user_id` bigint(1) DEFAULT NULL COMMENT '分库表中的userId',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_growth_type` (`user_id`,`growth_type`),
  KEY `idx_user_id_created` (`user_id`,`created`),
  KEY `idx_created` (`created`),
  KEY `shard_user_id_index` (`shard_user_id`),
  KEY `index_user_vendor` (`user_id`,`vendor_id`,`voucher`),
  KEY `idx_user_vou` (`voucher`,`user_id`,`growth_type`)
) ENGINE=InnoDB AUTO_INCREMENT=674630802 DEFAULT CHARSET=utf8 COMMENT='成长值流水表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_logs   */
/******************************************/
CREATE TABLE `growth_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则ID',
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `oper_msg` varchar(500) DEFAULT NULL COMMENT '操作描述',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3202 DEFAULT CHARSET=utf8 COMMENT='成长值变更日志';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_pooled   */
/******************************************/
CREATE TABLE `growth_pooled` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成长值流水ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '成长值流水的类型(0:扣减,1:增加)',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '业务类型(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `voucher` varchar(50) DEFAULT NULL COMMENT '业务单号',
  `money` bigint(20) DEFAULT NULL COMMENT '业务发生金额',
  `amount` int(11) DEFAULT NULL COMMENT '成长值额度',
  `validity` datetime DEFAULT NULL COMMENT '生效时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否生效(0:未生效,1:已生效)',
  `properties` varchar(100) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vendor_id` int(11) DEFAULT '0' COMMENT '自运营商家会员ID.平台则为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='未生效成长值记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = growth_reward_log   */
/******************************************/
CREATE TABLE `growth_reward_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) DEFAULT NULL COMMENT '规则ID',
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `oper_msg` varchar(500) DEFAULT NULL COMMENT '操作描述',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_rule_id` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='成长值变更日志';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = level_welfare_record   */
/******************************************/
CREATE TABLE `level_welfare_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `batch_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '批次id',
  `welfare_id` int(11) NOT NULL COMMENT '权益id',
  `reward_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖励标题',
  `reward_desc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖励描述',
  `reward_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '奖励项Code',
  `out_activity_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动页链接',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_userId_welfareId` (`user_id`,`welfare_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29205082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='等级权益领取记录';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = member_delay_task   */
/******************************************/
CREATE TABLE `member_delay_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_name` varchar(64) NOT NULL DEFAULT '' COMMENT '延期任务名称',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `delay_type` tinyint(2) NOT NULL COMMENT '延期类型 1.指定天数 2.指定日期',
  `status` tinyint(2) NOT NULL COMMENT '延期状态 1.初始化(预导入中)  2.初始化失败(预导入失败) 3.未开始（预导入完成） 4.写入执行中 5.全部成功 6.部分成功 7.全部失败 8.预导入系统失败(一般是导入时jvm销毁，比如：应用重启) ',
  `remark` varchar(128) DEFAULT NULL COMMENT '任务说明',
  `file_path` varchar(128) NOT NULL DEFAULT '' COMMENT '文件地址',
  `member_num` int(11) DEFAULT NULL COMMENT '会员数',
  `import_success_num` int(11) DEFAULT NULL COMMENT '预导入成功数',
  `delay_success_num` int(11) DEFAULT NULL COMMENT '延期成功数',
  `import_fail_num` int(11) DEFAULT NULL COMMENT '预导入失败数',
  `delay_fail_num` int(11) DEFAULT NULL COMMENT '延期失败数',
  `designated_day` int(11) DEFAULT NULL COMMENT '指定天数',
  `designated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '指定时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `import_start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行导入开始时间',
  `creator` varchar(64) NOT NULL DEFAULT '' COMMENT '申请人',
  `modifier` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `file_name` varchar(128) NOT NULL DEFAULT '' COMMENT '文件名称',
  PRIMARY KEY (`id`),
  KEY `idx_status_yn` (`status`,`yn`),
  KEY `idx_import_start_time_status` (`import_start_time`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6002 DEFAULT CHARSET=utf8 COMMENT='延期任务表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = member_delay_user_detail   */
/******************************************/
CREATE TABLE `member_delay_user_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `three_segment_code` varchar(128) DEFAULT NULL COMMENT '三段码',
  `relative_type` tinyint(2) DEFAULT '0' COMMENT '主副卡:1-主卡,2-副卡,0-默认',
  `union_id` varchar(128) DEFAULT NULL COMMENT 'unionId',
  `delay_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '延期状态:1-成功,2-失败,3-未执行,0-默认 ',
  `fail_msg` varchar(1000) DEFAULT NULL COMMENT '失败原因',
  `designated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '指定时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `uuid` varchar(128) NOT NULL DEFAULT '' COMMENT 'uuid,用于发送MQ时传给麦德龙',
  `before_delay_end_time` datetime DEFAULT NULL COMMENT '延期前结束时间',
  `delay_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '延期类型:1-付费会员延期,2-过期付费会员延期,3-普通会员延期，4-附属卡延期,0-默认 ',
  PRIMARY KEY (`id`),
  KEY `idx_task_id_user_id` (`task_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124054442 DEFAULT CHARSET=utf8 COMMENT='延期任务明细表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = notify_middle_ware   */
/******************************************/
CREATE TABLE `notify_middle_ware` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `notify_type` int(11) DEFAULT '1' COMMENT '推送类型. 1：普通商家会员;2:有授权的商家会员;3:异业合作会员',
  `fail_type` int(11) DEFAULT '1' COMMENT '失败类型:1:调用失败;2:接口成功响应后本地处理失败',
  `request_param` varchar(768) DEFAULT NULL COMMENT '调用中间层参数',
  `response_content` varchar(1024) DEFAULT NULL COMMENT '最近一次调用失败返回的内容。',
  `notify_times` int(11) DEFAULT '1' COMMENT '通知次数',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_notify_times` (`notify_times`)
) ENGINE=InnoDB AUTO_INCREMENT=4681082 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = offline_push_content   */
/******************************************/
CREATE TABLE `offline_push_content` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户userId',
  `user_version` int(11) DEFAULT NULL COMMENT '用户版本',
  `content` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '记录创建时间',
  `modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `yn` int(11) DEFAULT '1' COMMENT '记录有效性;1:有效;-1:无效',
  `content_type` int(11) DEFAULT '1' COMMENT '数据内容类型;1:基础信息;2:标签信息',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_version` (`user_version`)
) ENGINE=InnoDB AUTO_INCREMENT=12832316002 DEFAULT CHARSET=utf8mb4 COMMENT='待推送的增量离线会员数据';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_auto_renewal   */
/******************************************/
CREATE TABLE `paid_up_member_auto_renewal` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `properties` varchar(512) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `deduct_channel` int(11) DEFAULT NULL COMMENT '扣款渠道。1：仅支付宝;2:仅微信;3:支付宝和微信均可',
  `dm_tenant_id` int(11) DEFAULT '1' COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_vendor_id` (`user_id`,`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10949722 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员自动续费名单表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_form   */
/******************************************/
CREATE TABLE `paid_up_member_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `begin_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '过期时间',
  `tag_state` int(11) DEFAULT NULL COMMENT '标记状态: 0:取消标记失败;1:设置标签失败;2:取消标签成功;3:设置标签成功',
  `sys_version` int(11) DEFAULT '1' COMMENT '版本',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_vendor_id` (`user_id`,`vendor_id`),
  KEY `idx_end_time_tag_state` (`end_time`,`tag_state`)
) ENGINE=InnoDB AUTO_INCREMENT=229687202 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员总览';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_mq   */
/******************************************/
CREATE TABLE `paid_up_member_mq` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `order_no` bigint(1) DEFAULT NULL COMMENT '订单号',
  `mq_content` varchar(512) DEFAULT NULL COMMENT '消息内容',
  `topic` varchar(255) DEFAULT NULL COMMENT 'mq topic',
  `status` int(11) DEFAULT NULL COMMENT '处理状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_order_no` (`user_id`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=398592202 DEFAULT CHARSET=utf8mb4 COMMENT='处理失败的付费会员MQ';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_order   */
/******************************************/
CREATE TABLE `paid_up_member_order` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `base_id` bigint(1) DEFAULT NULL,
  `order_no` bigint(1) DEFAULT NULL COMMENT '订单号',
  `ware_sku` bigint(1) DEFAULT NULL,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `order_created_time` datetime DEFAULT NULL COMMENT '下单时间',
  `order_completed_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `pay_price` bigint(1) DEFAULT NULL COMMENT '订单支付金额(单位分)',
  `begin_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_first` int(11) DEFAULT NULL COMMENT '是否首次购买 1:是;0:否',
  `save_money` bigint(1) DEFAULT '0' COMMENT '周期权益节约单价(分)',
  `exchange_warefare_ids` varchar(1024) DEFAULT NULL,
  `send_welfare_task_state` int(11) DEFAULT '0' COMMENT '发放权益资格的任务执行状态;0：未发放;1:发放成功;2:发放失败',
  `tag_state` int(11) DEFAULT NULL COMMENT '标记状态: 0:取消标记失败;1:设置标签失败;2:取消标签成功;3:设置标签成功',
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '扩展属性json字符串',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `type` int(11) DEFAULT '1' COMMENT '明细类型:1:付费会员订单;2:积分兑换订单',
  `order_pay_time` datetime DEFAULT NULL COMMENT '订单支付时间',
  `sub_type` int(11) DEFAULT NULL COMMENT '二级类型',
  `cycle` int(11) DEFAULT '1' COMMENT '购买周期.',
  `exchange_sequence` varchar(50) DEFAULT NULL COMMENT '兑换序列ID',
  `state` int(11) DEFAULT '2' COMMENT '状态。1:开通中;2:开通成功;3:开通失败',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_exchange_sequence` (`exchange_sequence`),
  KEY `idx_order_complted_time` (`order_completed_time`),
  KEY `idx_begin_time_end_time` (`begin_time`,`end_time`),
  KEY `idx_user_id_vendor_id_order_no_ware_sku` (`user_id`,`vendor_id`,`order_no`,`ware_sku`),
  KEY `idx_base_id` (`base_id`),
  KEY `idx_order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=359279082 DEFAULT CHARSET=utf8mb4 COMMENT='用户购买付费会员明细表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_task   */
/******************************************/
CREATE TABLE `paid_up_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_id` bigint(1) DEFAULT NULL COMMENT '付费会员明细ID',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `invoke_time` datetime DEFAULT NULL COMMENT '调用时间',
  `type` int(11) DEFAULT '1' COMMENT '类型：1：发放',
  `state` int(11) DEFAULT NULL COMMENT '执行任务状态 0：未发放;1:发放成功;2:发放失败',
  `times` int(11) DEFAULT NULL COMMENT '执行次数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `properties` varchar(3600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性',
  `token_value` varchar(2000) DEFAULT NULL COMMENT 'token数据详情逗号分隔',
  PRIMARY KEY (`id`),
  KEY `idx_order_id_vendor_id_state` (`order_id`,`vendor_id`,`state`),
  KEY `idx_state` (`state`),
  KEY `idx_user_id_vendor_id_state` (`user_id`,`vendor_id`,`state`),
  KEY `idx_times` (`times`)
) ENGINE=InnoDB AUTO_INCREMENT=4874411802 DEFAULT CHARSET=utf8mb4 COMMENT='付费会员任务';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = paid_up_member_welfare_detail   */
/******************************************/
CREATE TABLE `paid_up_member_welfare_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `base_id` int(11) DEFAULT NULL COMMENT '付费会员基础id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '付费会员订单id',
  `coupon_amount` int(11) DEFAULT NULL COMMENT '促销优惠金额',
  `refund_coupon` int(11) DEFAULT NULL,
  `result_amount` int(11) DEFAULT NULL COMMENT '最终促销优惠金额',
  `status` int(11) DEFAULT NULL COMMENT '状态  1.未使用 2.已核销 3 已废弃',
  `welfare_name` varchar(36) DEFAULT NULL COMMENT '权益名称',
  `welfare_type` int(11) DEFAULT NULL COMMENT '权益类型',
  `issue_form` int(11) DEFAULT NULL COMMENT '发放形式',
  `welfare_id` varchar(36) DEFAULT NULL COMMENT '权益id',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `user_time` datetime DEFAULT NULL COMMENT '发放时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `properties` varchar(256) DEFAULT NULL COMMENT '拓展字段',
  PRIMARY KEY (`id`),
  KEY `idx_order_no_vendor_id` (`order_no`,`vendor_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_order_no_user_id` (`order_no`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12299202 DEFAULT CHARSET=utf8 COMMENT='付费会员促销数据';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = partner_card   */
/******************************************/
CREATE TABLE `partner_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '多点会员userid',
  `system_id` int(11) NOT NULL COMMENT '请求打标系统ID 枚举值由多点系统定义1-多点；2华北物美合作商家平台',
  `partner_id` varchar(20) NOT NULL COMMENT '联名商家id，由打标系统定义',
  `partner_name` varchar(50) DEFAULT NULL COMMENT '联名商家名称',
  `card_id` varchar(50) NOT NULL COMMENT '联名卡ID 用于区分同一个请求打标系统下的不同联名卡',
  `card_name` varchar(50) DEFAULT NULL COMMENT '联名卡名称',
  `member_name` varchar(50) DEFAULT NULL COMMENT '联名会员姓名',
  `member_phone` varchar(20) DEFAULT NULL COMMENT '联名会员手机号',
  `credent_type` tinyint(1) DEFAULT NULL COMMENT '证件类型',
  `credent_no` varchar(20) DEFAULT NULL COMMENT '证件编号',
  `address` varchar(50) DEFAULT NULL COMMENT '通讯地址',
  `properties` varchar(100) DEFAULT NULL COMMENT '扩展字段',
  `status` tinyint(1) NOT NULL COMMENT '卡状态 1：有效0：无效（即解绑）',
  `created` datetime NOT NULL COMMENT '打标时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT NULL COMMENT '是否有效(-1: 无效 ; 1: 有效)',
  PRIMARY KEY (`id`),
  KEY `idx_user_sys_partner_card` (`user_id`,`system_id`,`partner_id`,`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10631 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = receive_welfare   */
/******************************************/
CREATE TABLE `receive_welfare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_welfare_id` bigint(20) NOT NULL COMMENT '会员权益id',
  `user_id` bigint(20) NOT NULL,
  `receive_time` datetime DEFAULT NULL COMMENT '领取时间',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `mark_id` varchar(50) DEFAULT NULL,
  `gift_id` varchar(50) DEFAULT NULL,
  `gift_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_welfare_id` (`user_welfare_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2632362 DEFAULT CHARSET=utf8 COMMENT='领取权益明细表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = refund_record   */
/******************************************/
CREATE TABLE `refund_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refund_id` bigint(20) DEFAULT NULL COMMENT '退款单ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `refund_amount` bigint(20) DEFAULT NULL COMMENT '退款金额',
  `wares` text COMMENT '退款商品',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vendor_id` int(11) DEFAULT '0' COMMENT '自运营商家ID。平台的值为0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_refund_id_vendor_id` (`refund_id`,`vendor_id`) USING BTREE,
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=225979162 DEFAULT CHARSET=utf8 COMMENT='退货记录,用于保存退货消息发生在订单完成消息之前的记录';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = relative_card   */
/******************************************/
CREATE TABLE `relative_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '亲友卡类型：1:付费会员亲友卡',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `begin_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '截止日期',
  `primary_user_id` bigint(1) DEFAULT NULL COMMENT '主用户ID',
  `tag_state` int(11) DEFAULT NULL COMMENT '标记状态: 0:取消标记失败;1:设置标签失败;2:取消标签成功;3:设置标签成功',
  `lost_type` int(11) DEFAULT NULL COMMENT '失效原因;1:关联PLUS已失效;2:购买PLUS;3:账号注销;4:其他',
  `lost_time` datetime DEFAULT NULL COMMENT '失效时间',
  `properties` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展属性json',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `ref_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联手机号',
  PRIMARY KEY (`id`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_primary_user_id` (`primary_user_id`),
  KEY `idx_tag_state` (`tag_state`),
  KEY `indx_user_id` (`user_id`),
  KEY `idx_ref_phone` (`ref_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=126747402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='亲友卡';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_realtime_consume   */
/******************************************/
CREATE TABLE `statistics_realtime_consume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `record_time` datetime DEFAULT NULL COMMENT '记录时间',
  `member_count` int(11) DEFAULT NULL COMMENT '消费人数统计',
  `anonymity_count` bigint(1) DEFAULT NULL COMMENT '匿名下单用户数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id_store_id_record_date_record_time` (`vendor_id`,`store_id`,`record_time`),
  KEY `idx_member_count` (`member_count`),
  KEY `idx_anoymity_count` (`anonymity_count`),
  KEY `idx_record_time` (`record_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10696899362 DEFAULT CHARSET=utf8mb4 COMMENT='实时统计会员消费';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_realtime_member   */
/******************************************/
CREATE TABLE `statistics_realtime_member` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `record_time` datetime DEFAULT NULL COMMENT '记录时间',
  `new_user_count` bigint(1) DEFAULT '0' COMMENT '新会员数量',
  `order_created_count` bigint(1) DEFAULT '0' COMMENT '下单会员总数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id_record_time_user_count_order_count` (`vendor_id`,`record_time`,`new_user_count`,`order_created_count`),
  KEY `idx_record_time` (`record_time`)
) ENGINE=InnoDB AUTO_INCREMENT=324211722 DEFAULT CHARSET=utf8mb4 COMMENT='会员实时统计信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_user_growth   */
/******************************************/
CREATE TABLE `statistics_user_growth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '等级ID',
  `start_growth` int(11) NOT NULL DEFAULT '0' COMMENT '成长值起点',
  `end_growth` int(11) DEFAULT NULL COMMENT '成长值终点',
  `user_count` int(11) NOT NULL DEFAULT '0' COMMENT '用户数量',
  `record_date` date DEFAULT NULL COMMENT '记录日期',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `indx_vendor_id_level_id_record_date` (`vendor_id`,`level_id`,`record_date`)
) ENGINE=InnoDB AUTO_INCREMENT=836142802 DEFAULT CHARSET=utf8mb4 COMMENT='用户等级统计';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_user_level   */
/******************************************/
CREATE TABLE `statistics_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_date` date DEFAULT NULL COMMENT '记录日期',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `level_id` int(11) DEFAULT NULL COMMENT '会员等级ID',
  `user_count` int(11) NOT NULL DEFAULT '0' COMMENT '用户数量',
  `frequent_order_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '有购物行为的用户数',
  `lost_risk_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '流失风险的用户数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `indx_vendor_id_level_id_record_date` (`vendor_id`,`level_id`,`record_date`)
) ENGINE=InnoDB AUTO_INCREMENT=260427962 DEFAULT CHARSET=utf8mb4 COMMENT='用户等级统计';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_user_level_order   */
/******************************************/
CREATE TABLE `statistics_user_level_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家id',
  `level_id` int(11) DEFAULT NULL COMMENT '会员等级ID',
  `user_count` int(11) NOT NULL DEFAULT '0' COMMENT '下单的用户数量(去重)',
  `order_count` int(11) DEFAULT '0' COMMENT '下单订单总数',
  `order_pay_total` bigint(1) DEFAULT '0' COMMENT '订单金额总和',
  `record_date` date DEFAULT NULL COMMENT '记录日期',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id_level_id_record_date` (`vendor_id`,`level_id`,`record_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7192562 DEFAULT CHARSET=utf8mb4 COMMENT='等级会员订单统计';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_user_point_range   */
/******************************************/
CREATE TABLE `statistics_user_point_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `record_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '记录日期',
  `range_type` int(11) DEFAULT NULL COMMENT '区间类型;1:0积分;2:1-9积分;3:10-19 积分;4:20-99 积分;5:100-199;6:200-499;7:500积分以上',
  `user_count` int(11) NOT NULL DEFAULT '0' COMMENT '用户数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(3) DEFAULT '1' COMMENT '数据有效性;1:有效;-1:无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id_record_date_range_type` (`vendor_id`,`record_date`,`range_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1664003 DEFAULT CHARSET=utf8mb4 COMMENT='用户积分区间统计';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = statistics_user_summary   */
/******************************************/
CREATE TABLE `statistics_user_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `record_date` date DEFAULT NULL COMMENT '记录日期',
  `user_count` int(11) NOT NULL DEFAULT '0' COMMENT '用户数量',
  `new_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '新增用户数量',
  `first_order_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '首单会员数量',
  `activity_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '有购物行为的会员数量',
  `lost_risk_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '流失风险的用户数',
  `repurchase_user_count` int(11) NOT NULL DEFAULT '0' COMMENT '复购会员总数',
  `properties` varchar(1024) DEFAULT NULL COMMENT '扩展属性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(3) DEFAULT '1' COMMENT '数据有效性;1:有效;-1:无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indx_vendor_id_record_date` (`vendor_id`,`record_date`)
) ENGINE=InnoDB AUTO_INCREMENT=70253202 DEFAULT CHARSET=utf8mb4 COMMENT='用户统计概要信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = sync_user_api_data   */
/******************************************/
CREATE TABLE `sync_user_api_data` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '多点用户ID',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(100) DEFAULT NULL COMMENT '卡号',
  `platform_user_id` varchar(100) DEFAULT NULL COMMENT '合作方商家id',
  `data_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '参数内容',
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `state` int(11) DEFAULT NULL COMMENT '1:待处理;2:已处理;3:处理失败',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_phone` (`phone`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_platform_user_id_card_no` (`vendor_id`,`platform_user_id`,`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1920900482 DEFAULT CHARSET=utf8mb4 COMMENT='接口同步商家会员参数数据';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = system_operate_log   */
/******************************************/
CREATE TABLE `system_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL COMMENT '记录id',
  `type` varchar(50) NOT NULL COMMENT '日志类型',
  `comment` text COMMENT '内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '操作人',
  `operator` varchar(100) NOT NULL COMMENT '操作人名称',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_RECORD_ID` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112851482 DEFAULT CHARSET=utf8 COMMENT='操作日志表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = t_cus_info_4_dd   */
/******************************************/
CREATE TABLE `t_cus_info_4_dd` (
  `mobile_no` varchar(50) NOT NULL COMMENT '手机号码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员昵称',
  `sex` int(1) DEFAULT NULL COMMENT '性别(1:男2:女3:保密)',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `credent_type` int(11) DEFAULT NULL COMMENT '证件类型(1:身份证2:居住证3:护照)',
  `credent_no` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `education` int(11) DEFAULT NULL COMMENT '学历(1:初中2:高中3:大专4:本科5:硕士6:博士)',
  `marital_status` int(11) DEFAULT NULL COMMENT '婚姻状态(1:未婚2:已婚3:保密)',
  `email` varchar(50) NOT NULL DEFAULT '0' COMMENT '电子邮箱',
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL COMMENT '用户头像URL',
  `store_id` varchar(50) DEFAULT NULL COMMENT '注册门店',
  `register_time` varchar(50) DEFAULT NULL COMMENT '注册时间',
  `card_no` varchar(50) DEFAULT NULL COMMENT '会员卡号',
  `platform_user_id` varchar(100) NOT NULL COMMENT '商家的会员ID',
  `card_type` int(11) DEFAULT NULL COMMENT '商家会员卡类型',
  `residence_address` varchar(50) DEFAULT NULL COMMENT '居住地址',
  `card_valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `card_status` int(11) DEFAULT NULL COMMENT '卡状态（1：启用;0:禁用）',
  `point` int(11) DEFAULT NULL COMMENT '积分',
  `F_MER` varchar(50) NOT NULL COMMENT '所属商户',
  `_ddm_lock` bigint(20) unsigned DEFAULT '0' COMMENT 'do NOT modify',
  `_slot` int(11) DEFAULT NULL COMMENT 'do NOT modify',
  PRIMARY KEY (`platform_user_id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = t_cus_info_4_dd_result   */
/******************************************/
CREATE TABLE `t_cus_info_4_dd_result` (
  `mobile_no` varchar(50) NOT NULL COMMENT '手机号码',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员昵称',
  `sex` int(1) DEFAULT NULL COMMENT '性别(1:男2:女3:保密)',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `credent_type` int(11) DEFAULT NULL COMMENT '证件类型(1:身份证2:居住证3:护照)',
  `credent_no` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `education` int(11) DEFAULT NULL COMMENT '学历(1:初中2:高中3:大专4:本科5:硕士6:博士)',
  `marital_status` int(11) DEFAULT NULL COMMENT '婚姻状态(1:未婚2:已婚3:保密)',
  `email` varchar(50) NOT NULL DEFAULT '0' COMMENT '电子邮箱',
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL COMMENT '用户头像URL',
  `store_id` varchar(50) DEFAULT NULL COMMENT '注册门店',
  `register_time` varchar(50) DEFAULT NULL COMMENT '注册时间',
  `card_no` varchar(50) DEFAULT NULL COMMENT '会员卡号',
  `platform_user_id` varchar(100) NOT NULL COMMENT '商家的会员ID',
  `card_type` int(11) DEFAULT NULL COMMENT '商家会员卡类型',
  `residence_address` varchar(50) DEFAULT NULL COMMENT '居住地址',
  `card_valid_date` datetime DEFAULT NULL COMMENT '有效期',
  `card_status` int(11) DEFAULT NULL COMMENT '卡状态（1：启用;0:禁用）',
  `point` int(11) DEFAULT NULL COMMENT '积分',
  `process_state` int(11) DEFAULT '1' COMMENT '处理状态',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(3) DEFAULT '1' COMMENT '数据有效性;1:有效;-1:无效',
  PRIMARY KEY (`platform_user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_mobile_no` (`mobile_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = tencent_youmall_user_face   */
/******************************************/
CREATE TABLE `tencent_youmall_user_face` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `face_id` int(20) DEFAULT NULL,
  `company_id` varchar(64) DEFAULT NULL COMMENT '优Mall内部公司名',
  `shop_id` int(11) DEFAULT NULL COMMENT '优Mall内部门店ID',
  `aws_pic_url` varchar(1024) DEFAULT NULL COMMENT '多点采集的照片名',
  `tencent_umall_pic_url` text COMMENT '腾讯优Mall采集的照片路径',
  `person_type` int(11) DEFAULT NULL COMMENT '顾客类型（0表示普通顾客，1 白名单，2 表示黑名单，101表示集团白名单，102表示集团黑名单）',
  `first_visit_time` datetime DEFAULT NULL COMMENT '腾讯采集的顾客首次进店时间',
  `visit_times` int(11) DEFAULT NULL COMMENT '腾讯统计的顾客历史到访次数',
  `hit_times` int(11) DEFAULT NULL COMMENT '多点统计的顾客历史到访次数',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = third_cooperation   */
/******************************************/
CREATE TABLE `third_cooperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `source` int(11) DEFAULT NULL COMMENT '三方合作来源;1:微众银行',
  `state` int(11) DEFAULT NULL COMMENT '合作状态:0:未开通;1:预开通;2:已开通',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_source` (`user_id`,`source`)
) ENGINE=InnoDB AUTO_INCREMENT=73128642 DEFAULT CHARSET=utf8mb4 COMMENT='三方合作记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_000   */
/******************************************/
CREATE TABLE `user_busi_log_000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4568722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_001   */
/******************************************/
CREATE TABLE `user_busi_log_001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4997242 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_002   */
/******************************************/
CREATE TABLE `user_busi_log_002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5058682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_003   */
/******************************************/
CREATE TABLE `user_busi_log_003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5006202 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_004   */
/******************************************/
CREATE TABLE `user_busi_log_004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5025882 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_005   */
/******************************************/
CREATE TABLE `user_busi_log_005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4552562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_006   */
/******************************************/
CREATE TABLE `user_busi_log_006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4580082 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_007   */
/******************************************/
CREATE TABLE `user_busi_log_007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4574722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_008   */
/******************************************/
CREATE TABLE `user_busi_log_008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4547802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_009   */
/******************************************/
CREATE TABLE `user_busi_log_009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5010722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_010   */
/******************************************/
CREATE TABLE `user_busi_log_010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5027802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_011   */
/******************************************/
CREATE TABLE `user_busi_log_011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4988042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_012   */
/******************************************/
CREATE TABLE `user_busi_log_012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5031762 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_013   */
/******************************************/
CREATE TABLE `user_busi_log_013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4598642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_014   */
/******************************************/
CREATE TABLE `user_busi_log_014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4569802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_015   */
/******************************************/
CREATE TABLE `user_busi_log_015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4593642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_016   */
/******************************************/
CREATE TABLE `user_busi_log_016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4578722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_017   */
/******************************************/
CREATE TABLE `user_busi_log_017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5018082 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_018   */
/******************************************/
CREATE TABLE `user_busi_log_018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5002122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_019   */
/******************************************/
CREATE TABLE `user_busi_log_019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5022922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_020   */
/******************************************/
CREATE TABLE `user_busi_log_020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5013642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_021   */
/******************************************/
CREATE TABLE `user_busi_log_021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4561042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_022   */
/******************************************/
CREATE TABLE `user_busi_log_022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4598282 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_023   */
/******************************************/
CREATE TABLE `user_busi_log_023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4588322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_024   */
/******************************************/
CREATE TABLE `user_busi_log_024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4570162 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_025   */
/******************************************/
CREATE TABLE `user_busi_log_025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5000722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_026   */
/******************************************/
CREATE TABLE `user_busi_log_026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5009962 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_027   */
/******************************************/
CREATE TABLE `user_busi_log_027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5001202 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_028   */
/******************************************/
CREATE TABLE `user_busi_log_028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5017122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_029   */
/******************************************/
CREATE TABLE `user_busi_log_029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4589442 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_030   */
/******************************************/
CREATE TABLE `user_busi_log_030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4598322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_031   */
/******************************************/
CREATE TABLE `user_busi_log_031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4624282 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_032   */
/******************************************/
CREATE TABLE `user_busi_log_032` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4577922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_033   */
/******************************************/
CREATE TABLE `user_busi_log_033` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5006322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_034   */
/******************************************/
CREATE TABLE `user_busi_log_034` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5042122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_035   */
/******************************************/
CREATE TABLE `user_busi_log_035` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5028042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_036   */
/******************************************/
CREATE TABLE `user_busi_log_036` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4999162 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_037   */
/******************************************/
CREATE TABLE `user_busi_log_037` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4557842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_038   */
/******************************************/
CREATE TABLE `user_busi_log_038` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4590682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_039   */
/******************************************/
CREATE TABLE `user_busi_log_039` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4600082 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_040   */
/******************************************/
CREATE TABLE `user_busi_log_040` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4586522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_041   */
/******************************************/
CREATE TABLE `user_busi_log_041` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4997042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_042   */
/******************************************/
CREATE TABLE `user_busi_log_042` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5035722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_043   */
/******************************************/
CREATE TABLE `user_busi_log_043` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5015362 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_044   */
/******************************************/
CREATE TABLE `user_busi_log_044` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5028882 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_045   */
/******************************************/
CREATE TABLE `user_busi_log_045` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4610842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_046   */
/******************************************/
CREATE TABLE `user_busi_log_046` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4570162 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_047   */
/******************************************/
CREATE TABLE `user_busi_log_047` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4602242 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_048   */
/******************************************/
CREATE TABLE `user_busi_log_048` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4577122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_049   */
/******************************************/
CREATE TABLE `user_busi_log_049` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5020802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_050   */
/******************************************/
CREATE TABLE `user_busi_log_050` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5003202 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_051   */
/******************************************/
CREATE TABLE `user_busi_log_051` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5000922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_052   */
/******************************************/
CREATE TABLE `user_busi_log_052` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5010642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_053   */
/******************************************/
CREATE TABLE `user_busi_log_053` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4560842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_054   */
/******************************************/
CREATE TABLE `user_busi_log_054` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4615442 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_055   */
/******************************************/
CREATE TABLE `user_busi_log_055` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4601282 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_056   */
/******************************************/
CREATE TABLE `user_busi_log_056` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4572722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_057   */
/******************************************/
CREATE TABLE `user_busi_log_057` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5022442 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_058   */
/******************************************/
CREATE TABLE `user_busi_log_058` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5025002 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_059   */
/******************************************/
CREATE TABLE `user_busi_log_059` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5026002 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_060   */
/******************************************/
CREATE TABLE `user_busi_log_060` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5019522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_061   */
/******************************************/
CREATE TABLE `user_busi_log_061` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4562562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_062   */
/******************************************/
CREATE TABLE `user_busi_log_062` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4618762 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_063   */
/******************************************/
CREATE TABLE `user_busi_log_063` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4573682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_064   */
/******************************************/
CREATE TABLE `user_busi_log_064` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4596122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_065   */
/******************************************/
CREATE TABLE `user_busi_log_065` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5006682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_066   */
/******************************************/
CREATE TABLE `user_busi_log_066` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5014842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_067   */
/******************************************/
CREATE TABLE `user_busi_log_067` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4983842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_068   */
/******************************************/
CREATE TABLE `user_busi_log_068` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5037842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_069   */
/******************************************/
CREATE TABLE `user_busi_log_069` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4603522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_070   */
/******************************************/
CREATE TABLE `user_busi_log_070` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4550442 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_071   */
/******************************************/
CREATE TABLE `user_busi_log_071` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4576042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_072   */
/******************************************/
CREATE TABLE `user_busi_log_072` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4581882 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_073   */
/******************************************/
CREATE TABLE `user_busi_log_073` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4987642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_074   */
/******************************************/
CREATE TABLE `user_busi_log_074` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5040562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_075   */
/******************************************/
CREATE TABLE `user_busi_log_075` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5011322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_076   */
/******************************************/
CREATE TABLE `user_busi_log_076` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5006522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_077   */
/******************************************/
CREATE TABLE `user_busi_log_077` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4566802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_078   */
/******************************************/
CREATE TABLE `user_busi_log_078` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4601202 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_079   */
/******************************************/
CREATE TABLE `user_busi_log_079` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4567122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_080   */
/******************************************/
CREATE TABLE `user_busi_log_080` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4565322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_081   */
/******************************************/
CREATE TABLE `user_busi_log_081` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4965322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_082   */
/******************************************/
CREATE TABLE `user_busi_log_082` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5015482 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_083   */
/******************************************/
CREATE TABLE `user_busi_log_083` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5044122 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_084   */
/******************************************/
CREATE TABLE `user_busi_log_084` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5000922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_085   */
/******************************************/
CREATE TABLE `user_busi_log_085` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4612842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_086   */
/******************************************/
CREATE TABLE `user_busi_log_086` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4587842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_087   */
/******************************************/
CREATE TABLE `user_busi_log_087` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4608842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_088   */
/******************************************/
CREATE TABLE `user_busi_log_088` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4611082 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_089   */
/******************************************/
CREATE TABLE `user_busi_log_089` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5023682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_090   */
/******************************************/
CREATE TABLE `user_busi_log_090` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5021722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_091   */
/******************************************/
CREATE TABLE `user_busi_log_091` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5038522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_092   */
/******************************************/
CREATE TABLE `user_busi_log_092` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4991922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_093   */
/******************************************/
CREATE TABLE `user_busi_log_093` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4598522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_094   */
/******************************************/
CREATE TABLE `user_busi_log_094` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4604722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_095   */
/******************************************/
CREATE TABLE `user_busi_log_095` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4600922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_096   */
/******************************************/
CREATE TABLE `user_busi_log_096` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4614442 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_097   */
/******************************************/
CREATE TABLE `user_busi_log_097` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5016922 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_098   */
/******************************************/
CREATE TABLE `user_busi_log_098` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5012682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_099   */
/******************************************/
CREATE TABLE `user_busi_log_099` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5032762 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_100   */
/******************************************/
CREATE TABLE `user_busi_log_100` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5017762 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_101   */
/******************************************/
CREATE TABLE `user_busi_log_101` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4606682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_102   */
/******************************************/
CREATE TABLE `user_busi_log_102` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4600602 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_103   */
/******************************************/
CREATE TABLE `user_busi_log_103` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4561162 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_104   */
/******************************************/
CREATE TABLE `user_busi_log_104` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4598842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_105   */
/******************************************/
CREATE TABLE `user_busi_log_105` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5002002 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_106   */
/******************************************/
CREATE TABLE `user_busi_log_106` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5024322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_107   */
/******************************************/
CREATE TABLE `user_busi_log_107` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5016522 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_108   */
/******************************************/
CREATE TABLE `user_busi_log_108` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4983602 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_109   */
/******************************************/
CREATE TABLE `user_busi_log_109` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4556322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_110   */
/******************************************/
CREATE TABLE `user_busi_log_110` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4597562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_111   */
/******************************************/
CREATE TABLE `user_busi_log_111` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4589042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_112   */
/******************************************/
CREATE TABLE `user_busi_log_112` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4550562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_113   */
/******************************************/
CREATE TABLE `user_busi_log_113` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5031682 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_114   */
/******************************************/
CREATE TABLE `user_busi_log_114` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5004042 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_115   */
/******************************************/
CREATE TABLE `user_busi_log_115` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5013642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_116   */
/******************************************/
CREATE TABLE `user_busi_log_116` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4979322 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_117   */
/******************************************/
CREATE TABLE `user_busi_log_117` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4573562 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_118   */
/******************************************/
CREATE TABLE `user_busi_log_118` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4571242 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_119   */
/******************************************/
CREATE TABLE `user_busi_log_119` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4603722 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_120   */
/******************************************/
CREATE TABLE `user_busi_log_120` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4587882 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_121   */
/******************************************/
CREATE TABLE `user_busi_log_121` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4982642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_122   */
/******************************************/
CREATE TABLE `user_busi_log_122` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5004642 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_123   */
/******************************************/
CREATE TABLE `user_busi_log_123` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4968802 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_124   */
/******************************************/
CREATE TABLE `user_busi_log_124` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5017602 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_125   */
/******************************************/
CREATE TABLE `user_busi_log_125` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4609842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_126   */
/******************************************/
CREATE TABLE `user_busi_log_126` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4580842 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_busi_log_127   */
/******************************************/
CREATE TABLE `user_busi_log_127` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `vendor_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家(0表示多点平台)',
  `busi_type` int(11) NOT NULL DEFAULT '1' COMMENT '业务类型:1-商家授权 2-多点平台授权 3-麦德龙APP授权',
  `busi_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '业务ID busi_type=1时代表商家授权版本号（auth_vendor_config表的主键ID）',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `modified` datetime DEFAULT NULL COMMENT '解约时间',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_busi_type` (`busi_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4577762 DEFAULT CHARSET=utf8 COMMENT='用户业务操作（如授权）记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_face   */
/******************************************/
CREATE TABLE `user_face` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL,
  `face_token` varchar(50) DEFAULT NULL COMMENT '检查出的人脸token',
  `face_img` varchar(100) DEFAULT NULL COMMENT '用于检测的人脸照片',
  `vendor_id` varchar(10) DEFAULT NULL COMMENT '关联账号时的商家id',
  `store_sap_id` varchar(20) DEFAULT NULL COMMENT '关联账号时的门店SapID',
  `attributes` text COMMENT '检查出的人脸属性',
  `face_set` varchar(20) DEFAULT NULL COMMENT 'faceToken存放的faceSet',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT NULL COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_face_token` (`face_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人脸识别表,存放用户账号与绑定的人脸信息';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_growth_reward   */
/******************************************/
CREATE TABLE `user_growth_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户的userId',
  `rule_id` int(1) DEFAULT NULL COMMENT '表config_growth_reward_rule的id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  `receive_status` tinyint(3) DEFAULT NULL COMMENT '0：不可领取, 1:可以领取 , 2:领取完毕',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  `growth` bigint(1) DEFAULT NULL COMMENT '领取奖励时的成长值',
  `growth_min` bigint(1) DEFAULT NULL COMMENT '奖励发放的起始成长值',
  `receive_amount` int(11) DEFAULT NULL COMMENT '奖励数量',
  PRIMARY KEY (`id`),
  KEY `idx_user_id_rule_id` (`user_id`,`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79997593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_import_config   */
/******************************************/
CREATE TABLE `user_import_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `need_point` int(11) DEFAULT NULL COMMENT '是否需要导入积分：1：是;0:否',
  `point_key` varchar(255) DEFAULT NULL COMMENT '导入积分的key',
  `need_vendor_card` int(11) DEFAULT NULL COMMENT '是否需要导商家实体卡;1:是;0:否',
  `task_ids` varchar(512) DEFAULT NULL COMMENT '导入用户的任务奖励任务ID',
  `column_mapping` varchar(512) DEFAULT NULL COMMENT '导入列映射关系',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `import_count` int(11) DEFAULT NULL COMMENT '导入人数',
  `valid_count` int(11) DEFAULT '0' COMMENT '有效人数',
  `new_count` int(11) DEFAULT '0' COMMENT '新用户总数',
  `old_count` int(11) DEFAULT '0' COMMENT '已注册过的用户数量',
  `fail_count` int(11) DEFAULT '0' COMMENT '处理失败的数量',
  `created` datetime DEFAULT NULL COMMENT '记录创建时间',
  `modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `yn` int(11) DEFAULT '1' COMMENT '记录有效性;1:有效;-1:无效',
  PRIMARY KEY (`id`),
  KEY `idx_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3082 DEFAULT CHARSET=utf8mb4 COMMENT='商家会员导入配置表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_import_data   */
/******************************************/
CREATE TABLE `user_import_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL COMMENT '导入配置ID',
  `import_point_state` int(11) DEFAULT NULL COMMENT '导入积分状态',
  `import_user_state` int(11) DEFAULT NULL COMMENT '会员导入状态',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_id` bigint(1) DEFAULT NULL COMMENT '用户ID',
  `card_no` varchar(255) DEFAULT NULL COMMENT '卡号',
  `is_new_user` int(11) DEFAULT NULL COMMENT '是否是新用户;1:是;0:否',
  `read_source` text COMMENT '读取文件时的源记录',
  `convert_dest` varchar(1024) DEFAULT NULL COMMENT '转换后的数据',
  `task_status` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '记录创建时间',
  `modified` datetime DEFAULT NULL COMMENT '记录修改时间',
  `yn` int(11) DEFAULT '1' COMMENT '记录有效性;1:有效;-1:无效',
  PRIMARY KEY (`id`),
  KEY `idx_config_id` (`config_id`),
  KEY `idx_phone` (`phone`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21929002 DEFAULT CHARSET=utf8mb4 COMMENT='商家会员导入数据表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_level_history   */
/******************************************/
CREATE TABLE `user_level_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '等级升降记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '会员ID',
  `type_id` bigint(20) NOT NULL COMMENT '会员类型ID',
  `src_level` bigint(20) DEFAULT NULL COMMENT '原等级ID',
  `dest_level` bigint(20) NOT NULL COMMENT '新等级ID',
  `validity` datetime DEFAULT NULL COMMENT '等级到期时间',
  `growth_point` bigint(20) DEFAULT NULL COMMENT '升降级时的成长值',
  `reason` tinyint(1) DEFAULT NULL COMMENT '操作原因(1:购物,2:购物天数,3:退货扣减,4:等级超期扣减,5:活动)',
  `creator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vendor_id` bigint(20) DEFAULT '0' COMMENT '商家ID',
  PRIMARY KEY (`id`),
  KEY `idx_user_created` (`user_id`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=12159406242 DEFAULT CHARSET=utf8 COMMENT='会员等级升降记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_login_history   */
/******************************************/
CREATE TABLE `user_login_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_login_time` datetime DEFAULT NULL COMMENT '首次登录时间',
  `first_login_ip` varchar(255) DEFAULT NULL COMMENT '首次登录ip',
  `first_login_ua` varchar(500) DEFAULT NULL COMMENT '首次登录时的userAgent信息',
  `first_login_source` int(11) DEFAULT NULL COMMENT '首次登录的reg_src值',
  `last_login_time` datetime DEFAULT NULL COMMENT '最新登录时间',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '最新登录IP地址',
  `last_login_ua` varchar(500) DEFAULT NULL COMMENT '最新登录的userAgent信息',
  `last_login_source` int(11) DEFAULT NULL COMMENT '最新登录的reg_src值',
  `created` datetime DEFAULT NULL COMMENT '入库时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) DEFAULT NULL COMMENT '数据有效性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2851706722 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_tags   */
/******************************************/
CREATE TABLE `user_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `tag_key` int(11) DEFAULT NULL COMMENT '标签key',
  `tag_value` int(11) DEFAULT NULL COMMENT '标签value',
  `created` datetime DEFAULT NULL COMMENT '入库时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) DEFAULT NULL COMMENT '数据有效性',
  PRIMARY KEY (`id`),
  KEY `idx_tag_key` (`tag_key`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5085045922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = user_welfare   */
/******************************************/
CREATE TABLE `user_welfare` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `welfare_id` bigint(20) NOT NULL COMMENT '会员权益ID',
  `user_id` bigint(20) NOT NULL,
  `receive_status` tinyint(4) DEFAULT NULL COMMENT '0：不可领取, 1:可以领取 , 2:领取完毕',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  `can_receive_times` tinyint(4) DEFAULT NULL COMMENT '可领取次数',
  `received_times` tinyint(4) DEFAULT NULL COMMENT '已领取次数',
  `user_level` tinyint(4) DEFAULT NULL COMMENT '用户等级',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_welfare` (`user_id`,`welfare_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184155922 DEFAULT CHARSET=utf8 COMMENT='会员权益记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = ware_growth   */
/******************************************/
CREATE TABLE `ware_growth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `order_ware_id` bigint(20) DEFAULT NULL COMMENT '订单商品表中的主键ID',
  `source_ware_id` bigint(20) DEFAULT NULL COMMENT '修改订单中，本商品记录在原订单商品表中的ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `ware_num` int(8) DEFAULT NULL COMMENT '商品购买数量',
  `ware_type` int(4) DEFAULT NULL COMMENT '商品类型',
  `ware_price` bigint(20) DEFAULT '0' COMMENT '商品单价',
  `promotion_price` bigint(20) DEFAULT '0' COMMENT '促销价',
  `properties` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  `coupon_amount` bigint(20) DEFAULT '0' COMMENT '优惠券金额',
  `coupon_code_amount` bigint(20) DEFAULT '0' COMMENT '优惠码金额',
  `refund_num` int(8) DEFAULT '0' COMMENT '退货数量',
  `growth` bigint(20) DEFAULT '0' COMMENT 'sku分摊的成长值',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `vendor_id` int(11) DEFAULT '0' COMMENT '自运营商家ID。平台的值为0',
  PRIMARY KEY (`id`),
  KEY `idx_order_ware_sku` (`order_id`,`order_ware_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93017947642 DEFAULT CHARSET=utf8 COMMENT='分摊商品成长值记录表';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = wechat_marketing_card   */
/******************************************/
CREATE TABLE `wechat_marketing_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) DEFAULT NULL COMMENT 'appId',
  `user_id` bigint(1) DEFAULT NULL,
  `open_id` varchar(100) DEFAULT NULL COMMENT '微信公众号openId',
  `applet_open_id` varchar(100) DEFAULT NULL COMMENT '微信小程序openId',
  `union_id` varchar(100) DEFAULT NULL COMMENT 'unionId',
  `is_new` int(11) DEFAULT NULL COMMENT '是否是新用户',
  `biz_card_no` varchar(100) DEFAULT NULL COMMENT '微信会员卡卡号',
  `opend_date` datetime DEFAULT NULL COMMENT '开卡时间',
  `valid_date` datetime DEFAULT NULL COMMENT '有效截止日期',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `state` int(11) DEFAULT NULL COMMENT '状态;1:开通;2:解绑',
  `extra_data` text COMMENT '扩展数据',
  `syn_time` datetime DEFAULT NULL COMMENT '同步时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '有效性：1：有效，-1：无效',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_syn_time_state` (`syn_time`,`state`),
  KEY `idx_app_id_open_id` (`app_id`,`applet_open_id`,`open_id`),
  KEY `idx_biz_card_no` (`biz_card_no`),
  KEY `idx_union_id` (`union_id`),
  KEY `idx_open_id` (`open_id`),
  KEY `idx_applet_open_id` (`applet_open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30797802 DEFAULT CHARSET=utf8mb4 COMMENT='微信商户会员卡';


/******************************************/
/*   DatabaseName = dmall_member   */
/*   TableName = welfare_change_log   */
/******************************************/
CREATE TABLE `welfare_change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `welfare_id` bigint(20) DEFAULT NULL COMMENT '权益ID',
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `oper_msg` varchar(300) DEFAULT NULL COMMENT '操作描述',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='权益配置变更日志';


-- Export Tools
-- Time: 2024-04-16 15:27:47
-- Service: s4714i.yz.db.inner-dmall.com:4714   Database: dcms
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = access_channel_info   */
/******************************************/
CREATE TABLE `access_channel_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `access_id` bigint(19) NOT NULL COMMENT '接入端信息id',
  `channel_id` bigint(19) NOT NULL COMMENT '频道编码',
  `channel_name` varchar(100) NOT NULL COMMENT '频道名称',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_access_channel_id` (`access_id`,`channel_id`),
  KEY `idx_channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3122 DEFAULT CHARSET=utf8 COMMENT='接入端频道关联信息表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = access_client   */
/******************************************/
CREATE TABLE `access_client` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tenant_id` int(11) NOT NULL COMMENT '租户编码',
  `tenant_name` varchar(100) NOT NULL,
  `platform_code` varchar(50) DEFAULT '' COMMENT '平台编码',
  `platform_name` varchar(100) DEFAULT '' COMMENT '平台名称',
  `inner_channel` varchar(50) DEFAULT '' COMMENT '渠道编码',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '启用状态 0停用 1启用',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_platform_code_inner_channel` (`platform_code`,`inner_channel`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8 COMMENT='接入端管理表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = access_vender_channel_info   */
/******************************************/
CREATE TABLE `access_vender_channel_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `access_id` bigint(19) NOT NULL COMMENT '接入端信息id',
  `vender_id` int(11) NOT NULL COMMENT '商家编码',
  `channel_id` bigint(19) NOT NULL COMMENT '频道编码',
  `channel_name` varchar(100) NOT NULL COMMENT '频道名称',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '启用状态 0停用 1启用',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_access_vender_channel_id` (`access_id`,`vender_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25042 DEFAULT CHARSET=utf8 COMMENT='接入端频道关联信息表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = access_vender_info   */
/******************************************/
CREATE TABLE `access_vender_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `access_id` bigint(19) NOT NULL COMMENT '接入端信息id',
  `vender_id` int(11) NOT NULL COMMENT '商家编码',
  `vender_name` varchar(100) DEFAULT '' COMMENT '商家名称',
  `store_infos` text COMMENT '门店id和门店名称集合',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_access_vender_id` (`access_id`,`vender_id`),
  KEY `idx_vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2882 DEFAULT CHARSET=utf8 COMMENT='接入端商家关联信息表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = bottom_navigation_icon   */
/******************************************/
CREATE TABLE `bottom_navigation_icon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_decoration_id` bigint(20) NOT NULL COMMENT '频道装修ID',
  `name` varchar(16) DEFAULT NULL COMMENT '导航名称',
  `type` tinyint(10) DEFAULT NULL COMMENT '导航类型',
  `forward_url` mediumtext COMMENT '页面地址',
  `selected_img_url` varchar(128) DEFAULT NULL COMMENT '选中图片url',
  `unselected_img_url` varchar(128) DEFAULT NULL COMMENT '未选中图片url',
  `index_num` tinyint(4) DEFAULT NULL COMMENT '索引',
  `creator` varchar(45) DEFAULT NULL COMMENT '创建人姓名',
  `modifier` varchar(45) DEFAULT NULL COMMENT '修改人姓名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72362 DEFAULT CHARSET=utf8 COMMENT='底导航图标表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = bottom_navigation_style   */
/******************************************/
CREATE TABLE `bottom_navigation_style` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_decoration_id` bigint(20) NOT NULL COMMENT '频道装修ID',
  `show_bg_img` tinyint(4) DEFAULT NULL COMMENT '是否展示背景图: 0 不展示 1 展示\n',
  `bg_img_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景图片URL\n',
  `show_cross_line` tinyint(4) DEFAULT NULL COMMENT '是否展示分割线: 0 不展示 1 展示\n',
  `show_name` tinyint(4) DEFAULT NULL COMMENT '是否展示名称: 0 不展示 1 展示\n',
  `selected_name_color` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称选中颜色\n',
  `unselected_name_color` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称未选中颜色\n',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\\n',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='底导航风格表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = channel_decoration   */
/******************************************/
CREATE TABLE `channel_decoration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `store_id` int(11) NOT NULL COMMENT '门店ID',
  `category` tinyint(4) NOT NULL COMMENT '门店类型',
  `platform_code` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台编码',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '频道ID',
  `page_code` int(11) DEFAULT NULL COMMENT '页面标识',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置名称',
  `bg_img_url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景图',
  `enabled` tinyint(4) DEFAULT '0' COMMENT '开关:1 启用  0 弃用',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\n',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='频道装修';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = channel_decoration_activity_info   */
/******************************************/
CREATE TABLE `channel_decoration_activity_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_decoration_id` bigint(20) NOT NULL COMMENT '频道装修主键',
  `activity_id` bigint(20) NOT NULL COMMENT '活动主键',
  `schedule_start_time` datetime NOT NULL COMMENT '排期开始时间',
  `schedule_end_time` datetime NOT NULL COMMENT '排期结束时间',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\\n',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='频道装修和活动关联表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = channel_info   */
/******************************************/
CREATE TABLE `channel_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `channel_name` varchar(100) NOT NULL COMMENT '频道名称',
  `page_code` int(11) NOT NULL COMMENT '页面标识编码',
  `page_name` varchar(50) DEFAULT '',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8 COMMENT='频道管理表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_category   */
/******************************************/
CREATE TABLE `dcms_category` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `operator_id` int(100) DEFAULT NULL COMMENT '操作人id',
  `operator_name` varchar(100) DEFAULT NULL COMMENT '操作人名称',
  `category_name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `feature` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '数据逻辑状态',
  `plateform` varchar(20) DEFAULT '-1' COMMENT '运营平台',
  `platform_origin` int(4) DEFAULT NULL COMMENT '平台来源 -1：多点 1：来客 2：POP 3:品牌家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_image   */
/******************************************/
CREATE TABLE `dcms_image` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `descp` varchar(128) DEFAULT NULL,
  `size` int(11) DEFAULT NULL COMMENT '文件大小',
  `width` int(11) DEFAULT NULL COMMENT '文件宽度',
  `height` int(11) DEFAULT NULL COMMENT '文件高度',
  `type` tinyint(4) DEFAULT NULL COMMENT '图片类型，1：滚动图，2：商品图，3：背景图；4：商家图；5：门店图，6：其他',
  `url` varchar(512) DEFAULT NULL COMMENT '文件链接',
  `operator` bigint(32) DEFAULT NULL COMMENT '上传作者id',
  `category_id` bigint(32) DEFAULT NULL COMMENT '分类ID',
  `feature` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图片创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '图片修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '数据逻辑状态',
  `plateform` varchar(20) DEFAULT '-1' COMMENT '运营平台',
  `platform_origin` int(4) DEFAULT NULL COMMENT '平台来源 -1：多点 1：来客 2：POP',
  PRIMARY KEY (`id`),
  KEY `idx_plateform` (`plateform`),
  KEY `idx_operator` (`operator`)
) ENGINE=InnoDB AUTO_INCREMENT=2814162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_store_group   */
/******************************************/
CREATE TABLE `dcms_store_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分组名称',
  `category` varchar(100) NOT NULL COMMENT '业务类型',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(100) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_CMS_STORE_GROUP_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_template_center   */
/******************************************/
CREATE TABLE `dcms_template_center` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `decoration_page_id` bigint(32) NOT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态（0下线，1上线）',
  `type` tinyint(4) DEFAULT NULL COMMENT '模板类型',
  `url` varchar(255) DEFAULT NULL COMMENT '封面图',
  `islock` tinyint(4) DEFAULT '1' COMMENT '模板状态（1未锁定，2锁定）',
  `properties` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  `yn` tinyint(4) DEFAULT '1' COMMENT '数据逻辑状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(100) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7722 DEFAULT CHARSET=utf8 COMMENT='模板中心';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_template_store_group   */
/******************************************/
CREATE TABLE `dcms_template_store_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) DEFAULT NULL COMMENT '分组ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `erp_store_name` varchar(200) DEFAULT NULL COMMENT '门店名称',
  `category` varchar(100) DEFAULT NULL COMMENT '分组类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(100) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_CMS_STORE_GROUP_RELATION_id` (`id`),
  KEY `group_id` (`group_id`),
  KEY `idx_erp_store_id` (`erp_store_id`),
  KEY `index_name_yn` (`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=248282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = dcms_template_vender   */
/******************************************/
CREATE TABLE `dcms_template_vender` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `template_center_id` bigint(32) DEFAULT NULL COMMENT '模板中心id',
  `vender_id` int(100) DEFAULT NULL COMMENT '商家id',
  `vender_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `yn` tinyint(4) DEFAULT '1' COMMENT '数据逻辑状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(100) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8242 DEFAULT CHARSET=utf8 COMMENT='模板商家表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = decorate_bit_config   */
/******************************************/
CREATE TABLE `decorate_bit_config` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `channel_info_id` bigint(19) NOT NULL COMMENT '频道管理数据id',
  `area_type` tinyint(4) DEFAULT NULL COMMENT '区域类型',
  `area_name` varchar(20) DEFAULT '' COMMENT '区域名称',
  `picture_url` varchar(250) DEFAULT '' COMMENT '图片url',
  `width` varchar(20) DEFAULT '' COMMENT '宽度',
  `height` varchar(20) DEFAULT '' COMMENT '高度',
  `yn` tinyint(2) unsigned DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_channel_info_id` (`channel_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域装修配置表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = decoration_layout   */
/******************************************/
CREATE TABLE `decoration_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `decoration_page_id` bigint(20) DEFAULT NULL COMMENT '装修页ID',
  `layout_style_id` bigint(20) NOT NULL COMMENT '样式ID',
  `layout_info_id` bigint(20) DEFAULT NULL COMMENT '楼层ID',
  `type` int(11) NOT NULL COMMENT '样式类型',
  `schedule` tinyint(4) NOT NULL COMMENT '是否排期（0:不排期,1:排期）',
  `data_from` int(11) NOT NULL COMMENT '数据来源',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置名称',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `parent` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `properties` varchar(6000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扩展属性',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\n',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '删除标识',
  `schedule_start_time` datetime DEFAULT NULL COMMENT '租户ID',
  `schedule_end_time` datetime DEFAULT NULL COMMENT '排期结束时间',
  `style_type` int(11) NOT NULL COMMENT '样式类型',
  `composite_type` tinyint(4) DEFAULT NULL COMMENT '复合楼层类型（1：人群包）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3607562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修楼层';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = decoration_layout_position   */
/******************************************/
CREATE TABLE `decoration_layout_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `decoration_page_id` bigint(20) DEFAULT NULL COMMENT '装修页ID',
  `decoration_layout_id` bigint(20) DEFAULT NULL COMMENT '装修楼层ID',
  `display_type` int(11) NOT NULL COMMENT '展示类型',
  `forward_type` int(11) DEFAULT NULL COMMENT '跳转类型',
  `forward_key` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转信息',
  `img_url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `data_from` int(11) NOT NULL COMMENT '数据来源',
  `sort` int(11) DEFAULT NULL COMMENT '排序号',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `category` tinyint(4) DEFAULT NULL COMMENT '门店类型',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '坑位名称',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `parent` bigint(20) DEFAULT '-1' COMMENT '父级ID',
  `properties` json DEFAULT NULL COMMENT '扩展属性',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\n',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '删除标识',
  `backup_type` int(11) DEFAULT NULL COMMENT '主备选（1：主选，2：备选）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_parent` (`parent`),
  KEY `idx_dlp` (`decoration_layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99878802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修坑位';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = decoration_page   */
/******************************************/
CREATE TABLE `decoration_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `category` tinyint(4) DEFAULT NULL COMMENT '门店类型',
  `platform_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台编码',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '频道ID',
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `enabled` tinyint(4) DEFAULT '0' COMMENT '启用状态',
  `page_code` int(11) DEFAULT NULL COMMENT '页面标识',
  `business_activity_id` bigint(20) DEFAULT NULL COMMENT '业态装修ID',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板ID',
  `parent` bigint(20) DEFAULT '-1' COMMENT '父级ID',
  `properties` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\n',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '删除标识',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `channel_decoration_id` bigint(20) DEFAULT NULL COMMENT '频道装修ID',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `source` tinyint(4) DEFAULT '1' COMMENT '来源（1：装修系统，2：多涨点）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修页';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = icon_resource   */
/******************************************/
CREATE TABLE `icon_resource` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `channel_decoration_id` bigint(19) NOT NULL COMMENT '频道装修ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `start_version_key` int(19) NOT NULL COMMENT '开始版本',
  `end_version_key` int(19) NOT NULL COMMENT '结束版本',
  `img_url` varchar(1000) NOT NULL COMMENT '图',
  `forward_type` int(11) DEFAULT NULL COMMENT '跳转类型',
  `forward_key` varchar(5000) DEFAULT NULL COMMENT '跳转信息',
  `is_logined_locate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要登录 0 否  1 是',
  `type` int(19) DEFAULT NULL COMMENT '类型值',
  `position_type` tinyint(4) DEFAULT NULL COMMENT '位置  1. 服务部分 2. 工具部分 3. 会员部分',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(1000) DEFAULT NULL COMMENT '扩展字段',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21682 DEFAULT CHARSET=utf8 COMMENT='图标资源表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = icon_resource_relation   */
/******************************************/
CREATE TABLE `icon_resource_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `icon_resource_id` bigint(19) NOT NULL COMMENT '图标资源id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店/门店组',
  `category` int(11) DEFAULT NULL COMMENT '门店类型',
  `creator` varchar(60) DEFAULT NULL COMMENT '添加人',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=322002 DEFAULT CHARSET=utf8 COMMENT='图标资源门店表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = layout   */
/******************************************/
CREATE TABLE `layout` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `first_category_id` tinyint(4) NOT NULL COMMENT '一级分类id',
  `second_category_id` tinyint(4) NOT NULL COMMENT '二级分类id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `thumbnail_img` varchar(200) NOT NULL COMMENT '缩略图',
  `schedule` tinyint(4) NOT NULL COMMENT '是否排期 1启用 0未启用',
  `margin_top` tinyint(4) NOT NULL COMMENT '是否启用上边距 1启用 0未启用',
  `bg_config` tinyint(4) NOT NULL COMMENT '是否启用背景配置 1启用 0未启用',
  `bg_type` varchar(200) DEFAULT NULL COMMENT '背景类型，1背景图 0背景色',
  `intelligence_banner` tinyint(4) NOT NULL COMMENT '是否启用 1启用 0未启用',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8 COMMENT='楼层管理表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = layout_style   */
/******************************************/
CREATE TABLE `layout_style` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(100) NOT NULL COMMENT '样式名称',
  `remark` varchar(255) NOT NULL COMMENT '样式名称描述',
  `code` bigint(19) NOT NULL COMMENT '类型值',
  `thumbnail_img_url` varchar(255) NOT NULL COMMENT '缩略图',
  `thumbnail_selection_img_url` varchar(255) NOT NULL COMMENT '选中缩略图',
  `bit_img_url` varchar(255) NOT NULL COMMENT '占位图',
  `layout_id` bigint(19) NOT NULL COMMENT '楼层id',
  `choose_channel_type` tinyint(4) NOT NULL COMMENT '适配频道类型 全部 0 正选 1  反选 2',
  `choose_vender_type` tinyint(4) DEFAULT '0' COMMENT '适配商家类型 全部 0 正选 1  反选 2',
  `choose_vender_ids` text COMMENT '选择的商家ID列表',
  `front_version` text NOT NULL COMMENT '前端版本信息',
  `creator` varchar(60) NOT NULL COMMENT '添加人',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4482 DEFAULT CHARSET=utf8 COMMENT='楼层样式管理表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = layout_style_adapter_channel   */
/******************************************/
CREATE TABLE `layout_style_adapter_channel` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `layout_style_id` bigint(19) NOT NULL COMMENT '楼层样式id',
  `tenant_id` bigint(19) NOT NULL COMMENT '租户id',
  `platform_code` varchar(100) NOT NULL COMMENT '平台code',
  `channel_id` bigint(19) NOT NULL COMMENT '频道code',
  `creator` varchar(60) DEFAULT NULL COMMENT '添加人',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=230282 DEFAULT CHARSET=utf8 COMMENT='楼层样式适配频道表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = layout_style_ext_property   */
/******************************************/
CREATE TABLE `layout_style_ext_property` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `layout_style_id` bigint(19) NOT NULL COMMENT '楼层样式id',
  `type` tinyint(19) NOT NULL COMMENT '类型： 1 跳转类型 2 数据来源 3 支持属性',
  `code` varchar(100) NOT NULL COMMENT '属性code',
  `name` varchar(100) DEFAULT NULL COMMENT '属性name',
  `value` text COMMENT '属性value json',
  `creator` varchar(60) DEFAULT NULL COMMENT '添加人',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `modifier` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1启用 0未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200242 DEFAULT CHARSET=utf8 COMMENT='楼层样式扩展属性表';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = log_info   */
/******************************************/
CREATE TABLE `log_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_id` bigint(20) NOT NULL COMMENT '业务ID',
  `business_module` int(5) NOT NULL COMMENT '业务模块类型',
  `module_id` bigint(20) NOT NULL COMMENT '模块的业务ID',
  `module` int(5) NOT NULL COMMENT '模块类型:1001-接入端,2001-频道装修页,3001-频道装修 等等',
  `type` tinyint(3) NOT NULL COMMENT '操作类型:1-创建,2-修改,3-删除,4-启用,5-不启用,6-复制,7-移动',
  `details` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '操作详情',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `idx_module_bid` (`module`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17604882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户操作日志信息';


/******************************************/
/*   DatabaseName = dcms   */
/*   TableName = sys_dict   */
/******************************************/
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '枚举名称',
  `type` int(11) NOT NULL COMMENT '常量类型',
  `code` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '枚举值',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT '枚举内容',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `creator` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人姓名\n',
  `modifier` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人姓名\n',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修楼层';


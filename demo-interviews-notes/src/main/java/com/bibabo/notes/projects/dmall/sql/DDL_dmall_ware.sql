-- Export Tools
-- Time: 2024-04-16 16:42:31
-- Service: s3459i-ware.jxq.db.dmall.com:3459   Database: dmall_ware
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = _sap_location_ware_old   */
/******************************************/
CREATE TABLE `_sap_location_ware_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL,
  `tag` int(11) DEFAULT '0',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_locnr_matnr` (`locnr_id`,`matnr`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7884292 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = b2b_base_property_value   */
/******************************************/
CREATE TABLE `b2b_base_property_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性库属性值ID',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `property_id` int(11) NOT NULL COMMENT 'base_property表属性ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `value_data` varchar(100) NOT NULL COMMENT '属性库属性值',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_property_id_value_data` (`vender_id`,`property_id`,`value_data`) USING BTREE,
  KEY `idx_property_id` (`property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3277482 DEFAULT CHARSET=utf8 COMMENT='B2B属性值表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = bak_mdl_data   */
/******************************************/
CREATE TABLE `bak_mdl_data` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'skuid',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '预留：店铺id',
  `status` tinyint(4) DEFAULT NULL COMMENT ' -1、删除0、无效1、有效',
  `rf_id` varchar(100) DEFAULT NULL,
  `attributes` varchar(200) DEFAULT NULL COMMENT '销售属性集合：key:value，类似于：key id:value id^key id:value id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `stock` int(11) DEFAULT NULL COMMENT '是否有库存：1表示有，0表示无',
  `img_uri` varchar(300) DEFAULT NULL COMMENT 'SKU的主图',
  `hs_code` varchar(50) DEFAULT NULL COMMENT 'hs_code',
  `features` varchar(2000) DEFAULT NULL COMMENT 'sku特征',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ref_sku` int(11) DEFAULT NULL COMMENT 'EA主商品sku',
  `pub_name` varchar(200) DEFAULT NULL COMMENT '公共名称',
  `is_auxiliary_ware` tinyint(4) DEFAULT NULL COMMENT '是否箱规商品',
  `item_num` varchar(50) DEFAULT NULL COMMENT '子规格国条码',
  `features_alias` varchar(50) DEFAULT NULL COMMENT '别名',
  `spec_num` int(11) DEFAULT NULL COMMENT '主副商品对应规格比例',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `ea_flag` tinyint(4) DEFAULT NULL COMMENT 'EA商品标识',
  `sku_corner_sign` varchar(500) DEFAULT NULL COMMENT '角标规则',
  `video_info` varchar(2048) DEFAULT NULL COMMENT '视频信息 video_img_url 视频截图url video_url 视频链接',
  `ext_flags` json DEFAULT NULL COMMENT '扩展商品标记',
  `source` varchar(20) DEFAULT NULL COMMENT '多规格商品来源 PARTNER来客, ERP多点后台',
  `package_num` decimal(10,3) DEFAULT NULL COMMENT '多包装商品包装入数',
  `package_seq` int(11) DEFAULT NULL COMMENT '多包装商品包装序号',
  `cost_account_type` varchar(20) NOT NULL DEFAULT 'MovingAverage' COMMENT '成本记账方式；MovingAverage=移动平均;Batch=批次',
  `sub_offline_alias` varchar(255) DEFAULT NULL COMMENT '子码商品线下别名',
  `gen_rf_id` varchar(100) DEFAULT NULL COMMENT '多包装关联上级物料码',
  `en_title` varchar(255) DEFAULT '' COMMENT '商品英文名称',
  `ntgew` decimal(10,3) DEFAULT '0.000' COMMENT '净重',
  `market_time` datetime DEFAULT NULL COMMENT '上市时间',
  `origin` varchar(32) CHARACTER SET utf8mb4 DEFAULT 'HANDWORK' COMMENT '数据来源',
  `selling_point` varchar(300) DEFAULT NULL COMMENT '卖点',
  `short_name` varchar(200) DEFAULT NULL COMMENT '短名称',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `flag_info` json DEFAULT NULL COMMENT '附加信息',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `ware_id` (`ware_id`,`rf_id`),
  KEY `index_sku_rf_id` (`rf_id`),
  KEY `index_sku_ware_id` (`ware_id`),
  KEY `index_sku_ref_sku` (`ref_sku`),
  KEY `idx_item_num` (`item_num`),
  KEY `idx_vender_id_is_auxiliary` (`vender_id`,`is_auxiliary_ware`),
  KEY `idx_spec_type` (`spec_type`) USING BTREE,
  KEY `idx_vender_id_gen_rf_id` (`vender_id`,`gen_rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1058338122 DEFAULT CHARSET=utf8 COMMENT='商品sku表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_black   */
/******************************************/
CREATE TABLE `barcode_black` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `rf_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品编码',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品sku_id,关联ware_sku表',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(2) DEFAULT '0' COMMENT '是否有效,0:无效,1:有效 有效表示不能使用条码解析，需要使用二维码解析',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='条码解析黑名单';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_parse   */
/******************************************/
CREATE TABLE `barcode_parse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `barcode_type` tinyint(4) NOT NULL COMMENT '条码类型(1称重磅秤条码,2计数磅秤条码,3标品自定义条码,4标品折扣价签,5称重折扣价签,6计数折扣价签,7标品二维码,8称重磅秤二维码,9计数磅秤二维码)',
  `length` int(11) NOT NULL COMMENT '条码长度',
  `status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '1已启用,2草稿,3有效',
  `shelf_life` int(4) NOT NULL DEFAULT '-1' COMMENT '是否开启保质期校验(1-开启，-1-禁用)',
  `discount_flag` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否校验折扣签有效性,-1否,1是',
  `level` int(4) DEFAULT NULL COMMENT '优先级排序(1最大)',
  `yn` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否删除：1-未删除，-1-已删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `creator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `operated` datetime DEFAULT NULL COMMENT '修改时间',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `operator` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_status` (`vender_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家条码解析配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_parse_draft   */
/******************************************/
CREATE TABLE `barcode_parse_draft` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `barcode_type` tinyint(4) NOT NULL COMMENT '条码类型(1称重磅秤条码,2计数磅秤条码,3标品自定义条码,4标品折扣价签,5称重折扣价签,6计数折扣价签,7标品二维码,8称重磅秤二维码,9计数磅秤二维码)',
  `length` int(11) NOT NULL COMMENT '条码长度',
  `status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '1已启用,2草稿,3有效',
  `shelf_life` int(4) NOT NULL DEFAULT '-1' COMMENT '是否开启保质期校验(1-开启，-1-禁用)',
  `discount_flag` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否校验折扣签有效性,-1否,1是',
  `level` int(4) DEFAULT NULL COMMENT '优先级排序(1最大)',
  `yn` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否删除：1-未删除，-1-已删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `creater_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `creator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `operated` datetime DEFAULT NULL COMMENT '修改时间',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `operator` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_status` (`vender_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家条码解析配置草稿';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_parse_log   */
/******************************************/
CREATE TABLE `barcode_parse_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `barcode_parse_id` bigint(20) NOT NULL COMMENT '条码规则id',
  `barcode_type` tinyint(4) NOT NULL COMMENT '条码类型(1,2,3,4,5,6,7,8,9)',
  `barcode_parse_rule_id` bigint(20) DEFAULT NULL COMMENT '条码规则详情id',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '变更内容',
  `type` tinyint(4) DEFAULT NULL COMMENT '1新增,2创建副本,3启用,4更新,5禁用',
  `desc` json DEFAULT NULL COMMENT '持久化数据(type1~5会持久化)',
  `operated` datetime DEFAULT NULL COMMENT '操作时间',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人ID',
  `operator` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人姓名',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_barcode_parse_id` (`vender_id`,`barcode_parse_id`),
  KEY `idx_vender_operator` (`vender_id`,`operator`)
) ENGINE=InnoDB AUTO_INCREMENT=10922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家条码解析规则编辑日志';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_parse_rule   */
/******************************************/
CREATE TABLE `barcode_parse_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '条码规则详情id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `barcode_parse_id` bigint(20) NOT NULL COMMENT '条码规则id',
  `start_position` int(4) NOT NULL COMMENT '起始位置',
  `end_position` int(4) NOT NULL COMMENT '终止位置',
  `rule_type` int(4) NOT NULL COMMENT '规则项(1商品码,2重量,3数量,4金额,5校验位,6标识位,7生产日期,8保质期截止日期)',
  `code_analytic_order` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品码解析顺序(逗号分隔 plu,物料,国条)',
  `decimal_place_length` int(4) DEFAULT NULL COMMENT '小数位长度(重量、数量、金额)',
  `verify_mode` int(4) DEFAULT NULL COMMENT '校验模式(校验位,1:EAN8、2:EAN13、3:EAN18)',
  `verify_start_index` int(4) DEFAULT NULL COMMENT '校验模式开始位置',
  `fixed_value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '固定值(标识位)',
  `express_type` int(4) DEFAULT NULL COMMENT '表示的规则项(标识位)',
  `date_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期格式:YYYYMMDDHHmm、YYYYMMDDHH、YYYYMMDD(保质期)',
  `remaining_time` float(10,1) DEFAULT NULL COMMENT '临期拦截时间(保质期:剩余n小时过期拦截)',
  `yn` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否删除：1-未删除，-1-已删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_barcode_parse_id` (`vender_id`,`barcode_parse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家条码解析规则配置详情';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = barcode_parse_rule_draft   */
/******************************************/
CREATE TABLE `barcode_parse_rule_draft` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '条码规则详情id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `barcode_parse_id` bigint(20) NOT NULL COMMENT '条码规则id',
  `start_position` int(4) NOT NULL COMMENT '起始位置',
  `end_position` int(4) NOT NULL COMMENT '终止位置',
  `rule_type` int(4) NOT NULL COMMENT '规则项(1商品码,2重量,3数量,4金额,5校验位,6标识位,7生产日期,8保质期截止日期)',
  `code_analytic_order` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品码解析顺序(逗号分隔 plu,物料,国条)',
  `decimal_place_length` int(4) DEFAULT NULL COMMENT '小数位长度(重量、数量、金额)',
  `verify_mode` int(4) DEFAULT NULL COMMENT '校验模式(校验位,1:EAN8、2:EAN13、3:EAN18)',
  `verify_start_index` int(4) DEFAULT NULL COMMENT '校验模式开始位置',
  `fixed_value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '固定值(标识位)',
  `express_type` int(4) DEFAULT NULL COMMENT '表示的规则项(标识位)',
  `date_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期格式:YYYYMMDDHHmm、YYYYMMDDHH、YYYYMMDD(保质期)',
  `remaining_time` float(10,1) DEFAULT NULL COMMENT '临期拦截时间(保质期:剩余n小时过期拦截)',
  `yn` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '是否删除：1-未删除，-1-已删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_barcode_parse_id` (`vender_id`,`barcode_parse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家条码解析规则配置详情草稿';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = base_property   */
/******************************************/
CREATE TABLE `base_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性库属性ID',
  `property_name` varchar(100) NOT NULL COMMENT '属性库属性中文名称',
  `property_name_en` varchar(100) NOT NULL COMMENT '属性库属性英文名称',
  `group_id` int(11) DEFAULT NULL COMMENT '属性分组ID，来自property_group表',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `property_name` (`property_name`),
  KEY `property-group-id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = base_property_value   */
/******************************************/
CREATE TABLE `base_property_value` (
  `property_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性库属性值ID',
  `child_property_id` int(11) DEFAULT NULL COMMENT '子属性ID，备用字段',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `value_data` varchar(100) NOT NULL COMMENT '属性库属性值',
  `value_data_en` varchar(100) NOT NULL COMMENT '属性库属性英文值',
  `group_id` int(11) DEFAULT NULL COMMENT '属性值分组ID，来自property_group表',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`property_value_id`),
  UNIQUE KEY `property_id-value_data` (`property_id`,`value_data`),
  KEY `value-group-id` (`group_id`) USING BTREE,
  KEY `property-value-id` (`property_id`) USING BTREE,
  KEY `idx_property_pid` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=641202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = brand   */
/******************************************/
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_info` varchar(1000) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `first_char` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `brand_group` varchar(255) DEFAULT NULL,
  `brand_business_id` int(11) DEFAULT NULL COMMENT '品牌商ID',
  `modifie_user_name` varchar(255) DEFAULT NULL COMMENT '修改人姓名',
  `other_name` varchar(64) DEFAULT NULL,
  `process_status` tinyint(4) DEFAULT NULL COMMENT '进度',
  `cat_ids` varchar(255) DEFAULT NULL COMMENT '经营类目',
  `created_user_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `created_user_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `approval_user_id` int(11) DEFAULT NULL COMMENT '审核人ID',
  `approval_user_name` varchar(255) DEFAULT NULL COMMENT '审核人姓名',
  `ext_info` varchar(512) DEFAULT NULL COMMENT '扩展信息',
  `approved` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cn_other_name` (`cn_name`,`other_name`,`process_status`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=895202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = brand_business   */
/******************************************/
CREATE TABLE `brand_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '品牌商名称',
  `status` tinyint(3) DEFAULT NULL COMMENT '是否启用：1、启用 0、停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_name` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `modifie_user_name` varchar(255) DEFAULT NULL COMMENT '修改人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = brand_certificate   */
/******************************************/
CREATE TABLE `brand_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标志',
  `brand_id` int(11) NOT NULL COMMENT '品牌ID',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书文件名',
  `file_uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证书文件地址',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='品牌证书';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = brand_oper_log   */
/******************************************/
CREATE TABLE `brand_oper_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `oper_content` varchar(512) DEFAULT NULL COMMENT '操作内容',
  `oper_user_id` int(11) DEFAULT NULL COMMENT '操作人',
  `oper_user_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=497282 DEFAULT CHARSET=utf8 COMMENT='品牌操作日志';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cache_control   */
/******************************************/
CREATE TABLE `cache_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cache_describe` varchar(500) DEFAULT NULL COMMENT '缓存开关描述',
  `cache_key` varchar(200) NOT NULL COMMENT '缓存开关键',
  `cache_value` char(1) NOT NULL COMMENT '缓存   0：关闭，1：开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='缓存控制';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_access_control   */
/******************************************/
CREATE TABLE `cat_access_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `control_type` tinyint(4) DEFAULT NULL COMMENT '控制类型：1、人员管理数据控制；2、商品配置管理控制；3、运营中心数据控制',
  `type` tinyint(4) DEFAULT NULL COMMENT '品类架构类型：1、采购品类架构 2、营运课组架构',
  `level` tinyint(4) DEFAULT NULL COMMENT '控制层级',
  `applier` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效：1、有效；-1、无效',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id_control_type_type` (`vender_id`,`control_type`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_business_control   */
/******************************************/
CREATE TABLE `cat_business_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `cat_type` tinyint(4) DEFAULT NULL COMMENT '类目类型;1:品类,2:小分类',
  `cat_id` int(11) DEFAULT NULL COMMENT '类目id',
  `business_type` varchar(128) DEFAULT NULL COMMENT '业务控制类型',
  `applier` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(50) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `cat_vender_id` (`vender_id`,`cat_type`,`cat_id`),
  KEY `business_vender_id` (`vender_id`,`business_type`)
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8 COMMENT='类目业务控制';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_framework   */
/******************************************/
CREATE TABLE `cat_framework` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `type` varchar(255) DEFAULT NULL COMMENT '品类架构类型：1、采购品类架构 2、营运课组架构',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `layers` tinyint(4) DEFAULT NULL COMMENT '层数',
  `applier` varchar(60) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1、有效，-1、无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_vender` (`type`,`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_framework_level   */
/******************************************/
CREATE TABLE `cat_framework_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(100) DEFAULT NULL COMMENT '类目名称',
  `code` varchar(100) DEFAULT NULL COMMENT '类目编码',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级类目ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '类目级别',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1、有效，-1、无效',
  `classifylist` varchar(3000) DEFAULT NULL COMMENT '对应的后台三级类目',
  `type` tinyint(4) DEFAULT NULL COMMENT '品类架构类型：1、采购品类架构 2、营运课组架构',
  `shop_type` tinyint(4) DEFAULT NULL COMMENT '门店类型：0没有门店类型;1大卖场;2连锁店;3尚佳会员店;4便利店;5物美参;6虚拟门店;7标超;8卫星站',
  `applier` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(50) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_code_type_venderid_shopType` (`code`,`vender_id`,`type`,`shop_type`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_vender_status_type_shop` (`vender_id`,`type`,`shop_type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20041402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_hierarchy_business   */
/******************************************/
CREATE TABLE `cat_hierarchy_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(255) DEFAULT NULL COMMENT '层级业务名称',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `level` tinyint(4) DEFAULT NULL COMMENT '级别',
  `type` tinyint(4) DEFAULT NULL COMMENT '对应的品类架构类型：1、采购品类架构 2、营运课组架构',
  `applier` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '1、有效，-1、无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vender_level_type` (`vender_id`,`level`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=29442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_small_classify   */
/******************************************/
CREATE TABLE `cat_small_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `code` varchar(255) DEFAULT NULL COMMENT '小分类编码',
  `name` varchar(255) DEFAULT NULL COMMENT '小分类名称',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：1、有效，-1、无效',
  `applier` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID，一级的上级ID为空',
  `is_leaf` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否末级 1-是，-1-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_vender_id` (`vender_id`,`code`),
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_is_leaf` (`is_leaf`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16665522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_variety   */
/******************************************/
CREATE TABLE `cat_variety` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `code` varchar(255) DEFAULT NULL COMMENT '品种类型编码',
  `name` varchar(255) DEFAULT NULL COMMENT '品种类型名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1品种类型',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否启用:1启用 0停用',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效:1有效 -1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_code` (`vender_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9282 DEFAULT CHARSET=utf8 COMMENT='商品品种类型';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_variety_classify_map   */
/******************************************/
CREATE TABLE `cat_variety_classify_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `cat_variety_id` int(11) NOT NULL COMMENT '品种类型id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1品种类型',
  `small_classify_id` int(11) NOT NULL COMMENT '商家小分类id',
  `small_classify_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家小分类code',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_cat_variety_id` (`cat_variety_id`),
  KEY `idx_small_classify_id` (`small_classify_id`),
  KEY `idx_vender_classify_code` (`vender_id`,`small_classify_code`)
) ENGINE=InnoDB AUTO_INCREMENT=299002 DEFAULT CHARSET=utf8 COMMENT='品种类型与商家小分类关联表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cat_ware_control   */
/******************************************/
CREATE TABLE `cat_ware_control` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `purchase_cat_id` int(11) NOT NULL COMMENT '采购品类ID或小分类ID',
  `max_ware_size` int(11) DEFAULT NULL COMMENT '商品配置数量上限',
  `current_ware_size` int(11) DEFAULT '0' COMMENT '当前商品配置数量',
  `approving_ware_size` int(11) DEFAULT '0' COMMENT '商品配置审核中数量',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `purchase_cat_code` varchar(32) DEFAULT NULL COMMENT '采购或小分类编码',
  `shelf_group_level_code` varchar(32) DEFAULT NULL COMMENT '货架组编码',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=441722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category   */
/******************************************/
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台类目ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父后台类目ID',
  `cat_name` varchar(100) NOT NULL COMMENT '后台类目中文名称',
  `cat_name_en` varchar(100) NOT NULL COMMENT '后台类目英文名称',
  `cat_level` tinyint(4) NOT NULL COMMENT '后台类目级别',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否上柜\r\n0=下柜\r\n1=上柜\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`),
  KEY `cat-id-parent` (`parent_id`) USING BTREE,
  KEY `modified` (`modified`),
  KEY `idx_level_status` (`cat_level`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_billboard   */
/******************************************/
CREATE TABLE `category_billboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告牌ID',
  `cat_id` int(11) NOT NULL COMMENT '前台类目ID',
  `image` varchar(255) NOT NULL COMMENT '广告牌图片',
  `type` tinyint(4) NOT NULL COMMENT '广告牌类型 \r\n1=单链接\r\n2=多链接(热点图实现)\r\n',
  `jump_area` varchar(5000) DEFAULT NULL COMMENT 'type=1，则为跳转URL\r\ntype=2，则为热点图实现代码\r\n',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `cm-cat-id-bill` (`cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_property   */
/******************************************/
CREATE TABLE `category_property` (
  `cat_prop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台类目属性ID',
  `cat_id` int(11) NOT NULL COMMENT '后台类目ID',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `property_type` tinyint(4) NOT NULL COMMENT '属性库属性类型1=普通属性2=关键属性3=销售属性(文字)4=销售属性(图片)',
  `property_name_alias` varchar(100) DEFAULT NULL COMMENT '后台类目属性别名',
  `required` tinyint(4) NOT NULL COMMENT '是否必选\r\n0=不必选\r\n1=必选\r\n',
  `input_type` tinyint(4) NOT NULL COMMENT '输入类型，\r\n0=单选\r\n,1=多选\r\n,2=输入',
  `nav` tinyint(4) NOT NULL COMMENT '是否导航属性\r\n0=不是\r\n1=是\r\n',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `property_group` varchar(100) DEFAULT NULL COMMENT '属性分组',
  `show_front` varchar(50) NOT NULL DEFAULT 'N' COMMENT '是否在前台展示，N不展示，Y展示',
  `data_type` varchar(50) NOT NULL DEFAULT 'TEXT' COMMENT '数据类型，TEXT文本类型，DIGIT数字类型',
  `unit` varchar(100) DEFAULT NULL COMMENT '单位',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`cat_prop_id`),
  KEY `property-id` (`property_id`) USING BTREE,
  KEY `cat-id-property-id` (`cat_id`) USING BTREE,
  KEY `idx_cat_property` (`cat_id`,`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=308722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_property_value   */
/******************************************/
CREATE TABLE `category_property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台类目属性值ID',
  `cat_prop_id` int(11) NOT NULL COMMENT '后台类目属性ID',
  `cat_id` int(11) NOT NULL COMMENT '后台类目ID',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `property_value_id` int(11) NOT NULL COMMENT '属性库属性值ID',
  `property_value_alias` varchar(100) DEFAULT NULL COMMENT '后台类目属性值别名',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `cat-prop-id` (`cat_prop_id`) USING BTREE,
  KEY `cat-value-id` (`property_value_id`) USING BTREE,
  KEY `idx_catpv_cid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2661282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_qualification   */
/******************************************/
CREATE TABLE `category_qualification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `kind` tinyint(1) NOT NULL COMMENT '证照种类',
  `type_id` bigint(20) DEFAULT NULL COMMENT '证照系统证照类型id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '证照状态',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除 1未删除 0 已删除',
  `batch_number_switch` tinyint(1) DEFAULT '0' COMMENT '是否需要录入批次号 0不需要 1需要',
  `auto_un_shelf` tinyint(1) DEFAULT '1' COMMENT '是否需自动下架 0不需要 1需要',
  `category_id` bigint(11) NOT NULL COMMENT '后台三级类目id',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`),
  KEY `idx_vender_id_category_id_type_id` (`vender_id`,`category_id`,`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68442 DEFAULT CHARSET=utf8 COMMENT='后台类目与商品资质关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_qualification_operate_log   */
/******************************************/
CREATE TABLE `category_qualification_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_qualification_id` bigint(20) DEFAULT NULL COMMENT '资质类目关系id',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人Id',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作人Id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `ip` varchar(45) DEFAULT NULL COMMENT '操作IP地址',
  `content` varchar(64) DEFAULT NULL COMMENT '操作的具体内容',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `item` varchar(64) DEFAULT NULL COMMENT '操作项。新增，修改，删除',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_category_qualification_id` (`category_qualification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57802 DEFAULT CHARSET=utf8 COMMENT='后台类目与商品资质关联关系操作日志表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = category_special_property   */
/******************************************/
CREATE TABLE `category_special_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '无意义ID',
  `cat_id` int(11) NOT NULL COMMENT '后台类目ID',
  `spe_property_id` int(11) unsigned NOT NULL COMMENT '特殊属性ID, 1:品牌，2：加价幅度',
  `spe_value` varchar(100) NOT NULL COMMENT '特殊属性值',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=不可用\r\n1=可用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `cat-id-spe` (`cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = channel   */
/******************************************/
CREATE TABLE `channel` (
  `channel_id` int(5) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(100) DEFAULT NULL,
  `rank` tinyint(4) DEFAULT NULL COMMENT '排序字段',
  `template_type` tinyint(4) DEFAULT NULL COMMENT '1.自动生成2.配置生成',
  `channel_url` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1为上柜，0为下柜',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = channel_setting   */
/******************************************/
CREATE TABLE `channel_setting` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(5) DEFAULT NULL,
  `vcat_id` bigint(20) DEFAULT NULL COMMENT '虚拟分类id',
  `vcat_name` varchar(100) DEFAULT NULL COMMENT '虚拟分类名称',
  `location` tinyint(4) DEFAULT NULL COMMENT '频道内位置',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `rank` int(4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1.上柜，0为下柜',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cm_category   */
/******************************************/
CREATE TABLE `cm_category` (
  `cm_cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前台类目ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父前台类目ID',
  `cat_name` varchar(100) NOT NULL COMMENT '前台类目中文名称',
  `cat_name_en` varchar(100) NOT NULL COMMENT '前台类目英文名称',
  `cat_image` varchar(255) DEFAULT NULL COMMENT '前台类目Icon',
  `cat_level` tinyint(4) NOT NULL COMMENT '前台类目级别',
  `conditions` varchar(3000) DEFAULT NULL COMMENT '前台类目对应后台类目、频道页，个性URL的表达式字段',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否上柜\r\n0=下柜\r\n1=上柜\r\n',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家id',
  `business_type` int(11) DEFAULT NULL COMMENT '业态类型(1:O2O,2:全球精选,5:便当)',
  PRIMARY KEY (`cm_cat_id`),
  UNIQUE KEY `uk_name_vender_bt` (`cat_name`,`vender_id`,`business_type`),
  KEY `cm-cat-id-parent` (`parent_id`) USING BTREE,
  KEY `idx_vender_id_cat_level` (`vender_id`,`cat_level`),
  KEY `idx_cate_level_status` (`cat_level`,`status`) USING BTREE,
  KEY `idx_sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21277722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cm_category_billboard   */
/******************************************/
CREATE TABLE `cm_category_billboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告牌ID',
  `cm_cat_id` int(11) NOT NULL COMMENT '前台类目ID',
  `image` varchar(255) NOT NULL COMMENT '广告牌图片',
  `type` tinyint(4) NOT NULL COMMENT '广告牌类型 \r\n1=单链接\r\n2=多链接(热点图实现)\r\n',
  `jump_area` varchar(5000) DEFAULT NULL COMMENT 'type=1，则为跳转URL\r\ntype=2，则为热点图实现代码\r\n',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `cm-cat-id-bill` (`cm_cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cm_category_has_category   */
/******************************************/
CREATE TABLE `cm_category_has_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cm_cat_id` int(11) NOT NULL COMMENT '前台类目id',
  `cat_id` int(11) NOT NULL COMMENT '后台类目id',
  `is_main` tinyint(4) NOT NULL COMMENT '1:主类目；0：非主类目',
  `features` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT ' -1、删除0、无效1、有效',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cm_category_ware   */
/******************************************/
CREATE TABLE `cm_category_ware` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `cat_id` bigint(20) DEFAULT NULL COMMENT '类目ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKUid',
  `ware_id` bigint(20) DEFAULT NULL COMMENT 'ware_id',
  `rf_id` varchar(50) DEFAULT NULL COMMENT '物料编码',
  `yn` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL COMMENT '商品排序,最小为0',
  PRIMARY KEY (`id`),
  KEY `index_sku_id` (`sku_id`),
  KEY `index_rf_id` (`rf_id`),
  KEY `index_cat_id` (`cat_id`),
  KEY `index_ware_id` (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=717042 DEFAULT CHARSET=utf8 COMMENT='前台类目-商品';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = cm_category_ware_sort   */
/******************************************/
CREATE TABLE `cm_category_ware_sort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cm_category_ware_id` bigint(20) NOT NULL COMMENT '关联cm_category_ware表主键',
  `shop_id` bigint(20) NOT NULL COMMENT '门店ID',
  `sort_order` int(11) NOT NULL DEFAULT '2147483647' COMMENT '商品排序,大于等于0,值越小排序越靠前',
  `associated_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '商品关联分类的时间',
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人ID',
  `modified_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新人ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:有效,-1:逻辑删除',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_cat_ware_shop` (`cm_category_ware_id`,`shop_id`) COMMENT '查询分类下的商品，门店维度的排序值'
) ENGINE=InnoDB AUTO_INCREMENT=111922 DEFAULT CHARSET=utf8 COMMENT='前台类目-商品排序';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = dump_time   */
/******************************************/
CREATE TABLE `dump_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = forbid_sell_ware   */
/******************************************/
CREATE TABLE `forbid_sell_ware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(64) DEFAULT NULL COMMENT '商家名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id. 0-所有门店',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `sku_id` int(11) NOT NULL COMMENT '商品的skuid',
  `rf_id` varchar(200) NOT NULL COMMENT '物料编码',
  `ware_tag` int(11) DEFAULT NULL COMMENT '商品打标(商家商品标记)',
  `remark` varchar(200) DEFAULT NULL COMMENT '黑名单备注',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT ' -1：无效，1：有效',
  `reason` varchar(200) DEFAULT NULL COMMENT '备注',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_vender_shop_rf_id` (`vender_id`,`shop_id`,`rf_id`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_shop_rf_id` (`shop_id`,`rf_id`),
  KEY `idx_vender` (`vender_id`),
  KEY `idx_shop_id` (`shop_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `modified` (`modified`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109453042 DEFAULT CHARSET=utf8 COMMENT='禁销商品黑名单';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_limit   */
/******************************************/
CREATE TABLE `gware_limit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名',
  `store_group_id` bigint(20) NOT NULL COMMENT '门店组ID',
  `store_group_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店组名',
  `dpt_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部类编码',
  `dpt_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部类名',
  `max_num` int(11) NOT NULL DEFAULT '0' COMMENT '最大品项数',
  `now_num` int(11) NOT NULL DEFAULT '0' COMMENT '正在运营数',
  `wait_up_num` int(11) NOT NULL DEFAULT '0' COMMENT '等待上架数',
  `bussi_status` int(4) NOT NULL DEFAULT '1' COMMENT '业态（1_o2o，2_全球精选，3_社区拼团）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE COMMENT '商家ID索引',
  KEY `index_store_group_id` (`store_group_id`) USING BTREE COMMENT '门店组ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=111534042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚品项控制表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_reason   */
/******************************************/
CREATE TABLE `gware_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bussi_type` tinyint(2) NOT NULL COMMENT '业务类型（1-上架，2-下架）',
  `reason_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原因编码',
  `reason_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原因描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚上下架原因表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_result   */
/******************************************/
CREATE TABLE `gware_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盖亚任务ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名',
  `store_group_id` bigint(20) NOT NULL COMMENT '门店组ID',
  `store_group_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店组名',
  `dpt_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部类编码',
  `dpt_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '部类名',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku（下架才有）',
  `ware_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `ware_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `bussi_type` tinyint(2) NOT NULL COMMENT '业务类型（1-上架，2-下架）',
  `reason_ids` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原因IDS（英文逗号隔开）',
  `weight_ratio` int(11) DEFAULT NULL COMMENT '商品权重排序',
  `receive_time` datetime DEFAULT NULL COMMENT '接收时间',
  `result_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处理结果类型（1-提交审核，2-超出品数）',
  `todo_time` datetime DEFAULT NULL COMMENT '上下架执行时间',
  `assign_ware` tinyint(2) DEFAULT '1' COMMENT '指定商品上下架门店（1-未指定，2-指定）',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `bussi_status` int(4) NOT NULL DEFAULT '1' COMMENT '业态（1_o2o，2_全球精选，3_社区拼团）',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE COMMENT '商家ID索引',
  KEY `index_store_group_id` (`store_group_id`) USING BTREE COMMENT '门店组ID索引',
  KEY `index_task_id` (`task_id`) USING BTREE COMMENT '任务ID索引',
  KEY `idx_dpt_code` (`dpt_code`) USING BTREE,
  KEY `idx_ware_code` (`ware_code`) USING BTREE,
  KEY `idx_bussi_type_status` (`bussi_type`,`bussi_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2662313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚选品结果数据表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_review   */
/******************************************/
CREATE TABLE `gware_review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盖亚任务ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名',
  `store_group_id` bigint(20) NOT NULL COMMENT '门店组ID',
  `dpt_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部类编码',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku（下架才有）',
  `ware_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品编码',
  `ware_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `sale_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售卖方式',
  `bussi_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '业务类型（1-上架，2-下架）',
  `unpublish_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下架原因',
  `launch_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提报人',
  `launch_time` datetime DEFAULT NULL COMMENT '提报时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态（0-未处理，1-已处理，2-部分处理，3-信息不完整）',
  `opt_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  `tax_rate` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品税率',
  `base_unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '基本单位',
  `base_unit_desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '基本单位描述',
  `place_origin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产地',
  `warm_layer` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '温层',
  `specifications` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格',
  `brand_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌ID',
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名',
  `mc_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品MC编码',
  `mc_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'MC名',
  `country_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国条码',
  `gross_weight` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '毛重',
  `todo_time` datetime DEFAULT NULL COMMENT '上下架执行时间',
  `assign_ware` tinyint(2) DEFAULT '1' COMMENT '指定商品上下架门店（1-未指定，2-指定）',
  `invalid_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '无效原因',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  `sale_type_key` int(4) NOT NULL DEFAULT '0' COMMENT '销售类型（0_标品，1_散卖，2_生鲜标品，4_生鲜计数）',
  `opt_type` int(4) NOT NULL DEFAULT '1' COMMENT '营运类型（1_日杂百，2_生鲜）',
  `bussi_status` int(4) NOT NULL DEFAULT '1' COMMENT '业态（1_o2o，2_全球精选，3_社区拼团）',
  `weight_limit_ratio` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '称重上限',
  `fresh_weight_lower_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '称重下限',
  PRIMARY KEY (`id`),
  KEY `index_task_id` (`task_id`) USING BTREE COMMENT '任务ID索引',
  KEY `index_vender_id` (`vender_id`,`status`) USING BTREE COMMENT '商家ID索引',
  KEY `idx_bussi_type_status` (`bussi_type`,`bussi_status`) USING BTREE,
  KEY `idx_store_group` (`store_group_id`) USING BTREE,
  KEY `idx_opt_type` (`opt_type`) USING BTREE,
  KEY `idx_lanuch_time` (`launch_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2515653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚选品审核表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_review_result   */
/******************************************/
CREATE TABLE `gware_review_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `review_id` bigint(20) NOT NULL COMMENT '审核ID',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `vender_store_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家门店ID',
  `store_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名',
  `status` tinyint(2) NOT NULL COMMENT '执行状态（1-成功，2-失败）',
  `status_desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_store_id` (`store_id`) USING BTREE COMMENT '门店ID索引',
  KEY `index_review_id` (`review_id`) USING BTREE COMMENT '审核ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=217748283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚商品审核结果表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_store   */
/******************************************/
CREATE TABLE `gware_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '盖亚任务ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `store_group_id` bigint(20) NOT NULL COMMENT '门店组ID',
  `store_group_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店组名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `vender_store_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家门店ID',
  `store_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名',
  `ware_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品编码',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_vender_id` (`vender_id`) USING BTREE COMMENT '商家ID索引',
  KEY `index_store_group_id` (`store_group_id`) USING BTREE COMMENT '门店组ID索引',
  KEY `index_task_id` (`task_id`) USING BTREE COMMENT '任务ID索引',
  KEY `index_store_id` (`store_id`) USING BTREE COMMENT '门店ID索引',
  KEY `idx_ware_code` (`ware_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13939273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚选品门店信息表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = gware_task   */
/******************************************/
CREATE TABLE `gware_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '任务ID',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '执行状态（1-正在执行，2-执行成功，3-执行失败）',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  KEY `index_task_id` (`task_id`) USING BTREE COMMENT '任务ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=75623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='盖亚商品任务执行情况表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = house_shop_info   */
/******************************************/
CREATE TABLE `house_shop_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID（自定义）',
  `supplier_desc` varchar(255) DEFAULT NULL COMMENT '供应商描述',
  `house_id` varchar(255) DEFAULT NULL COMMENT '仓库ID',
  `sap_id` varchar(255) DEFAULT NULL COMMENT '门店sapId',
  `erp_store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(1) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='house_shop_info';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = interface_definition   */
/******************************************/
CREATE TABLE `interface_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `interfaceName` varchar(255) DEFAULT NULL COMMENT '接口名称',
  `methodName` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `paramNum` int(11) DEFAULT NULL COMMENT '参数个数',
  `paramTypes` varchar(255) DEFAULT NULL COMMENT '参数类型',
  `description` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否可用 -1不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ls_fhd_cat   */
/******************************************/
CREATE TABLE `ls_fhd_cat` (
  `cat_id3` int(11) NOT NULL DEFAULT '0' COMMENT '后台类目ID',
  `cat_name3` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '后台类目中文名称',
  `cat_id2` int(11) NOT NULL DEFAULT '0' COMMENT '后台类目ID',
  `cat_name2` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '后台类目中文名称',
  `cat_id1` int(11) NOT NULL DEFAULT '0' COMMENT '后台类目ID',
  `cat_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '后台类目中文名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ls_fhd_ware   */
/******************************************/
CREATE TABLE `ls_fhd_ware` (
  `ware_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `rf_id` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `category_id` int(11) DEFAULT NULL COMMENT '后台三级分类ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = mdl_shop_ware_price_sync_data   */
/******************************************/
CREATE TABLE `mdl_shop_ware_price_sync_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `matnr` varchar(200) DEFAULT NULL COMMENT '商品编码',
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '商家门店id',
  `shop_id` int(11) DEFAULT NULL COMMENT '多点门店id',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `origin_price` decimal(10,2) DEFAULT NULL COMMENT '基础价',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '档期价',
  `execute_price` decimal(10,2) DEFAULT NULL COMMENT '执行价',
  `status` tinyint(2) DEFAULT '-1' COMMENT '推送状态 -1-失败 1-成功',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005950522 DEFAULT CHARSET=utf8 COMMENT='麦德龙店品售价同步记录';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = mdl_ware_main_sync_data   */
/******************************************/
CREATE TABLE `mdl_ware_main_sync_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sap_title` varchar(200) DEFAULT NULL COMMENT '商品短名（商家商品名称）',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商品编码',
  `matkl` varchar(64) DEFAULT NULL COMMENT '商品小分类编码 ',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称 ',
  `spec_qty` varchar(64) DEFAULT NULL COMMENT '规格数量',
  `spec_unit` varchar(32) DEFAULT NULL COMMENT '规格单位',
  `chine` varchar(45) DEFAULT NULL COMMENT '基本单位描述',
  `package_num` decimal(10,3) DEFAULT NULL COMMENT '多包装商品包装入数',
  `produce_area` varchar(256) DEFAULT NULL COMMENT '产地',
  `mwskz` varchar(45) DEFAULT NULL COMMENT '税代码',
  `mwskz_name` varchar(45) DEFAULT NULL COMMENT '税目名称',
  `sale_able` tinyint(2) DEFAULT '0' COMMENT '允许销售 -1-不允许 1-允许',
  `status` tinyint(2) DEFAULT '-1' COMMENT '推送状态 -1-失败 1-成功',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9305762 DEFAULT CHARSET=utf8 COMMENT='麦德龙商品主数据同步记录';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = national_tax_classify   */
/******************************************/
CREATE TABLE `national_tax_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(50) NOT NULL COMMENT '合并编码',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(2000) DEFAULT NULL COMMENT '说明',
  `key_word` varchar(1000) DEFAULT NULL COMMENT '关键词',
  `tax_rate1` decimal(5,3) DEFAULT NULL COMMENT '税率1，百分比转小数保存',
  `tax_rate2` decimal(5,3) DEFAULT NULL COMMENT '税率2，百分比转小数保存',
  `added_value_tax_name` varchar(50) DEFAULT NULL COMMENT '增值税特别管理',
  `added_value_tax_code` varchar(50) DEFAULT NULL COMMENT '增值税特殊内容代码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注、预留字段',
  `yn` tinyint(1) DEFAULT NULL COMMENT '有效性',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `short_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '国税分类码简称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8527 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = new_shop_ware_refer   */
/******************************************/
CREATE TABLE `new_shop_ware_refer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `target_shop_id` int(11) NOT NULL COMMENT '目标门店ID',
  `refer_shop_id` int(11) DEFAULT NULL COMMENT '参考门店ID',
  `level_id_list` text COMMENT '参考门店货架组级id列表，用逗号隔开',
  `business_type` tinyint(4) DEFAULT NULL COMMENT '业务类型 1:商品初始化',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 1:未开始,2:进行中,3:已完成',
  `yn` tinyint(4) NOT NULL,
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `operator_login_id` varchar(50) DEFAULT NULL COMMENT '操作人登录id',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `init_mode` varchar(20) DEFAULT 'REFER_SHOP' COMMENT '初始化方式 REFER_SHOP参考店,SHELF_GROUP货架组级',
  `init_detail` json DEFAULT NULL COMMENT '初始化方式详情',
  PRIMARY KEY (`id`),
  KEY `idx_target_shop_id` (`target_shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2842 DEFAULT CHARSET=utf8 COMMENT='新开店商品参考';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = os_business_config   */
/******************************************/
CREATE TABLE `os_business_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `config_json` json NOT NULL COMMENT '配置json',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效1-有效;-1-无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1642 DEFAULT CHARSET=utf8 COMMENT='os商家配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = out_vender_category   */
/******************************************/
CREATE TABLE `out_vender_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台类目ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父后台类目ID',
  `vender_cat_code` varchar(50) DEFAULT NULL COMMENT '商家后台类目编码',
  `cat_name` varchar(100) NOT NULL COMMENT '后台类目中文名称',
  `cat_name_en` varchar(100) NOT NULL COMMENT '后台类目英文名称',
  `cat_level` tinyint(4) NOT NULL COMMENT '后台类目级别',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '是否上柜\r\n0=下柜\r\n1=上柜\r\n',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`cat_id`) USING BTREE,
  UNIQUE KEY `cat_name` (`vender_id`,`cat_name`) USING BTREE,
  KEY `cat-id-parent` (`parent_id`) USING BTREE,
  KEY `modified` (`modified`) USING BTREE,
  KEY `idx_level_status` (`vender_id`,`cat_level`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10002602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = platform   */
/******************************************/
CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) DEFAULT NULL COMMENT '平台编码',
  `title` varchar(255) DEFAULT NULL COMMENT '平台名称',
  `description` varchar(255) DEFAULT NULL COMMENT '平台描述',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = platform_interface   */
/******************************************/
CREATE TABLE `platform_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id` int(11) DEFAULT NULL COMMENT '平台主键ID',
  `interface_id` int(11) DEFAULT NULL COMMENT '接口主键ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_brand_config   */
/******************************************/
CREATE TABLE `pop_brand_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `brandid_list` text COMMENT '品牌id列表，用逗号隔开。',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT ' -1：无效，1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2553 DEFAULT CHARSET=utf8 COMMENT='pop商家经营品牌配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_category_config   */
/******************************************/
CREATE TABLE `pop_category_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台类目ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `main` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 1:主营  0:辅营',
  `first_level` int(11) NOT NULL COMMENT '一级类目',
  `second_level` int(11) NOT NULL COMMENT '二级类目',
  `three_level` int(11) NOT NULL DEFAULT '0' COMMENT '三级类目：0:表示该对应二级类目下面的所有三级类目',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT ' -1：无效，1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `veder_cate` (`vender_id`,`first_level`,`second_level`,`three_level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30833 DEFAULT CHARSET=utf8 COMMENT='pop商家经营类目配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware   */
/******************************************/
CREATE TABLE `pop_ware` (
  `ware_id` varchar(32) NOT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `ware_code` bigint(20) DEFAULT NULL COMMENT '商品码,ERP库返回来的商品ID',
  `ware_type` int(11) DEFAULT NULL COMMENT '商品类型(1:实物类,2:服务类)',
  `vir_tag` int(4) DEFAULT NULL COMMENT '虚拟商品标签[1:直充,2:核销,3:预约]',
  `category_id` int(11) DEFAULT NULL COMMENT '后台三级分类ID',
  `title` varchar(128) DEFAULT NULL COMMENT '商品名',
  `approval_status` int(11) DEFAULT NULL COMMENT '审批状态(10:草稿,21:待一审,22:待二审,23:待三审,24:一审驳回,25:二审驳回,26:三审驳回,30:审核通过',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效 0：数据无效/逻辑删除， 1：数据有效 ，2：数据无效可归档， 3：数据无效可归档， 4：标记可物理删除',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名',
  `country_id` int(11) DEFAULT NULL COMMENT '国家',
  `country_name` varchar(64) DEFAULT NULL COMMENT '国家名',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `img_url` text COMMENT '图片URL(3到6个)使用^_^分割',
  `video_url` varchar(1024) DEFAULT NULL COMMENT '视频URL',
  `ware_detail` text COMMENT '商详信息',
  `brgew` decimal(18,3) DEFAULT NULL COMMENT '售卖重量',
  `basic_unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `ware_life` int(11) DEFAULT NULL COMMENT '保质期(-1:无,单位天)',
  `storage_type` int(11) DEFAULT NULL COMMENT '储存温层',
  `features` varchar(256) DEFAULT NULL COMMENT '关键词(最少5个)',
  `advert` varchar(256) DEFAULT NULL COMMENT '商品广告语',
  `volume_length` decimal(18,3) DEFAULT NULL COMMENT '商品体积长(cm)',
  `volume_width` decimal(18,3) DEFAULT NULL COMMENT '商品体积宽(cm)',
  `volume_height` decimal(18,3) DEFAULT NULL COMMENT '商品体积高(cm)',
  `sync_erp` int(11) DEFAULT NULL COMMENT '是否同步到ERPl库(1:没有,2:已同步)',
  `sync_time` datetime DEFAULT NULL COMMENT '同步ERP时间',
  `reject_cause` varchar(128) DEFAULT NULL COMMENT '违规原因',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware_attr   */
/******************************************/
CREATE TABLE `pop_ware_attr` (
  `attr_id` varchar(32) NOT NULL,
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `attr_name` varchar(32) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(1024) DEFAULT NULL COMMENT '属性值,text值是字符串,radio/select值是{key:1,:value:''''},checkbox值是[{key:1,:value:''''}]',
  `input_type` varchar(16) DEFAULT NULL COMMENT '表单类型[text,radio,select,checkbox]',
  `attr_type` int(11) DEFAULT NULL COMMENT '属性类型(1:关键属性,2:销售属性)',
  `group_code` varchar(32) DEFAULT NULL COMMENT '属性组编码',
  `group_name` varchar(32) DEFAULT NULL COMMENT '属性组名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品动态属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware_info   */
/******************************************/
CREATE TABLE `pop_ware_info` (
  `info_id` varchar(32) NOT NULL,
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `place_origin` varchar(64) DEFAULT NULL COMMENT '产地',
  `spec` varchar(256) DEFAULT NULL COMMENT '规格',
  `pack` int(11) DEFAULT NULL COMMENT '包装',
  `storage_mode` varchar(32) DEFAULT NULL COMMENT '储存方式',
  `return_goods` int(11) DEFAULT NULL COMMENT '支持退货(1:是,2:否)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品简介表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware_log   */
/******************************************/
CREATE TABLE `pop_ware_log` (
  `log_id` varchar(32) NOT NULL,
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `log_type` int(11) DEFAULT NULL COMMENT '日志类型(1:新增,2:修改,3:审核)',
  `log_deail` longtext COMMENT '日志内容',
  `approval_reult` varchar(64) DEFAULT NULL COMMENT '审批结果',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `before_detail` longtext COMMENT '修改前内容',
  `after_detail` longtext COMMENT '修改后内容',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品操作日志表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware_sku   */
/******************************************/
CREATE TABLE `pop_ware_sku` (
  `sku_id` varchar(32) NOT NULL COMMENT 'POP商品SKU id',
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `sku_code` bigint(20) DEFAULT NULL COMMENT 'sku码,dmall库返回来的skuId',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `price` decimal(18,2) DEFAULT NULL COMMENT 'sku售价',
  `market_price` decimal(18,2) DEFAULT NULL COMMENT 'sku市场价',
  `stock` int(11) DEFAULT NULL COMMENT 'sku可售库存',
  `rf_id` varchar(32) DEFAULT NULL COMMENT 'sku商家码',
  `sku_barcode` varchar(32) DEFAULT NULL COMMENT 'sku国条码',
  `img_url` text COMMENT 'sku图片URL(3到6个)使用^_^分割',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效 0：数据无效/逻辑删除， 1：数据有效 ，2：数据无效可归档， 3：数据无效可归档， 4：标记可物理删除',
  `shelf_type` int(11) DEFAULT NULL COMMENT '上架类型(1:立即上架,2:定时上架,3:已上架)',
  `shelf_status` int(11) DEFAULT NULL COMMENT '上下架状态(1:上架,2:下架)',
  `fixed_time` datetime DEFAULT NULL COMMENT '定时上架时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品SKU表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_ware_sku_attr   */
/******************************************/
CREATE TABLE `pop_ware_sku_attr` (
  `sku_attr_id` varchar(32) NOT NULL COMMENT 'SKU属性ID',
  `sku_id` varchar(32) DEFAULT NULL COMMENT 'POP商品SKU id',
  `vender_id` bigint(20) DEFAULT NULL,
  `attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `attr_name` varchar(32) DEFAULT NULL COMMENT '属性名',
  `group_code` varchar(32) DEFAULT NULL COMMENT '属性组编码',
  `group_name` varchar(32) DEFAULT NULL COMMENT '属性组名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sku_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品SKU动态属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wareb   */
/******************************************/
CREATE TABLE `pop_wareb` (
  `ware_id` varchar(32) NOT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `ware_code` bigint(20) DEFAULT NULL COMMENT '商品码,ERP库返回来的商品ID',
  `ware_type` int(11) DEFAULT NULL COMMENT '商品类型(1:实物类,2:服务类)',
  `vir_tag` int(4) DEFAULT NULL COMMENT '虚拟商品标签[1:直充,2:核销,3:预约]',
  `category_id` int(11) DEFAULT NULL COMMENT '后台三级分类ID',
  `title` varchar(128) DEFAULT NULL COMMENT '商品名',
  `approval_status` int(11) DEFAULT NULL COMMENT '审批状态(10:草稿,21:待一审,22:待二审,23:待三审,24:一审驳回,25:二审驳回,26:三审驳回,30:审核通过',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效 0：数据无效/逻辑删除， 1：数据有效 ，2：数据无效可归档， 3：数据无效可归档， 4：标记可物理删除',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名',
  `country_id` int(11) DEFAULT NULL COMMENT '国家',
  `country_name` varchar(64) DEFAULT NULL COMMENT '国家名',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `img_url` text COMMENT '图片URL(3到6个)使用^_^分割',
  `video_url` varchar(1024) DEFAULT NULL COMMENT '视频URL',
  `ware_detail` text COMMENT '商详信息',
  `brgew` decimal(18,3) DEFAULT NULL COMMENT '售卖重量',
  `basic_unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `ware_life` int(11) DEFAULT NULL COMMENT '保质期(-1:无,单位天)',
  `storage_type` int(11) DEFAULT NULL COMMENT '储存温层',
  `features` varchar(256) DEFAULT NULL COMMENT '关键词(最少5个)',
  `advert` varchar(256) DEFAULT NULL COMMENT '商品广告语',
  `volume_length` decimal(18,3) DEFAULT NULL COMMENT '商品体积长(cm)',
  `volume_width` decimal(18,3) DEFAULT NULL COMMENT '商品体积宽(cm)',
  `volume_height` decimal(18,3) DEFAULT NULL COMMENT '商品体积高(cm)',
  `sync_erp` int(11) DEFAULT NULL COMMENT '是否同步到ERPl库(1:没有,2:已同步)',
  `sync_time` datetime DEFAULT NULL COMMENT '同步ERP时间',
  `reject_cause` varchar(128) DEFAULT NULL COMMENT '违规原因',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wareb_attr   */
/******************************************/
CREATE TABLE `pop_wareb_attr` (
  `attr_id` varchar(32) NOT NULL,
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `attr_name` varchar(32) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(1024) DEFAULT NULL COMMENT '属性值,text值是字符串,radio/select值是{key:1,:value:''''},checkbox值是[{key:1,:value:''''}]',
  `input_type` varchar(16) DEFAULT NULL COMMENT '表单类型[text,radio,select,checkbox]',
  `attr_type` int(11) DEFAULT NULL COMMENT '属性类型(1:关键属性,2:销售属性)',
  `group_code` varchar(32) DEFAULT NULL COMMENT '属性组编码',
  `group_name` varchar(32) DEFAULT NULL COMMENT '属性组名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品动态属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wareb_info   */
/******************************************/
CREATE TABLE `pop_wareb_info` (
  `info_id` varchar(32) NOT NULL,
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `place_origin` varchar(64) DEFAULT NULL COMMENT '产地',
  `spec` varchar(256) DEFAULT NULL COMMENT '规格',
  `pack` int(11) DEFAULT NULL COMMENT '包装',
  `storage_mode` varchar(32) DEFAULT NULL COMMENT '储存方式',
  `return_goods` int(11) DEFAULT NULL COMMENT '支持退货(1:是,2:否)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品简介表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wareb_sku   */
/******************************************/
CREATE TABLE `pop_wareb_sku` (
  `sku_id` varchar(32) NOT NULL COMMENT 'POP商品SKU id',
  `ware_id` varchar(32) DEFAULT NULL COMMENT 'pop商品ID',
  `sku_code` bigint(20) DEFAULT NULL COMMENT 'sku码,dmall库返回来的skuId',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家id',
  `price` decimal(18,2) DEFAULT NULL COMMENT 'sku售价',
  `market_price` decimal(18,2) DEFAULT NULL COMMENT 'sku市场价',
  `stock` int(11) DEFAULT NULL COMMENT 'sku可售库存',
  `rf_id` varchar(32) DEFAULT NULL COMMENT 'sku商家码',
  `sku_barcode` varchar(32) DEFAULT NULL COMMENT 'sku国条码',
  `img_url` text COMMENT 'sku图片URL(3到6个)使用^_^分割',
  `yn` int(11) DEFAULT '1' COMMENT '是否有效 0：数据无效/逻辑删除， 1：数据有效 ，2：数据无效可归档， 3：数据无效可归档， 4：标记可物理删除',
  `shelf_type` int(11) DEFAULT NULL COMMENT '上架类型(1:立即上架,2:定时上架,3:已上架)',
  `shelf_status` int(11) DEFAULT NULL COMMENT '上下架状态(1:上架,2:下架)',
  `fixed_time` datetime DEFAULT NULL COMMENT '定时上架时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品SKU表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wareb_sku_attr   */
/******************************************/
CREATE TABLE `pop_wareb_sku_attr` (
  `sku_attr_id` varchar(32) NOT NULL COMMENT 'SKU属性ID',
  `sku_id` varchar(32) DEFAULT NULL COMMENT 'POP商品SKU id',
  `vender_id` bigint(20) DEFAULT NULL,
  `attr_code` varchar(32) DEFAULT NULL COMMENT '属性编码',
  `attr_name` varchar(32) DEFAULT NULL COMMENT '属性名',
  `group_code` varchar(32) DEFAULT NULL COMMENT '属性组编码',
  `group_name` varchar(32) DEFAULT NULL COMMENT '属性组名',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sku_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP商品SKU动态属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pop_wm_barcode   */
/******************************************/
CREATE TABLE `pop_wm_barcode` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `bar_code` varchar(32) DEFAULT NULL COMMENT '国条码',
  `mandt` varchar(32) DEFAULT NULL COMMENT '地区编码',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_barcode` (`bar_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2585313 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='POP国条码表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = presell_sku_relation   */
/******************************************/
CREATE TABLE `presell_sku_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `presell_ware_id` bigint(20) NOT NULL COMMENT '预售商品ID',
  `offline_rf_id` varchar(200) NOT NULL COMMENT '线下商品编码',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_presell_ware_id` (`presell_ware_id`),
  KEY `idx_vender_rf_id` (`vender_id`,`offline_rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3324642 DEFAULT CHARSET=utf8 COMMENT='预售商品和线下商品对应关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = price_group   */
/******************************************/
CREATE TABLE `price_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家Id',
  `code` varchar(50) DEFAULT NULL COMMENT '价格群组code',
  `name` varchar(50) DEFAULT NULL COMMENT '价格群组名称',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '逻辑删除：1-有效，-1-逻辑删除',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`) USING BTREE COMMENT '商家id',
  KEY `idx_vender_id_code` (`vender_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8922 DEFAULT CHARSET=utf8 COMMENT='价格群组配置表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = price_group_ware_price   */
/******************************************/
CREATE TABLE `price_group_ware_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `vender_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rf_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '物料编码',
  `group_id` bigint(20) NOT NULL COMMENT '价格群组',
  `online_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '线上售价',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '线下售价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_query` (`vender_id`,`rf_id`,`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=777768322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='价格群组-商品价格';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = property_group   */
/******************************************/
CREATE TABLE `property_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(255) NOT NULL COMMENT '分组中文名称',
  `group_name_en` varchar(255) NOT NULL COMMENT '分组英文名称',
  `group_type` tinyint(4) NOT NULL COMMENT '分组适用对象类型，1=属性库属性\r\n，2=属性库属性值\r\n',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态\r\n0=停用\r\n1=启用\r\n',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pu_code_cats   */
/******************************************/
CREATE TABLE `pu_code_cats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pu编码',
  `cn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '英文名',
  `relate_cat_level` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '关联的类目id串',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-有效，-1-无效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_code` (`vender_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=133282 DEFAULT CHARSET=latin1 COMMENT='puCode及类目关联表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = pu_code_mc   */
/******************************************/
CREATE TABLE `pu_code_mc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标志',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `pu_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '陈列单元编码',
  `matkl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '末级小分类编码',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_code_mc` (`vender_id`,`pu_code`,`matkl`)
) ENGINE=InnoDB AUTO_INCREMENT=6053442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='陈列单元关联分类表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = rec_merch_bom   */
/******************************************/
CREATE TABLE `rec_merch_bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品SKUID',
  `rf_id` varchar(50) DEFAULT NULL,
  `comp_sku` int(11) DEFAULT NULL COMMENT '组件skuId',
  `comp_rf_id` varchar(50) DEFAULT NULL,
  `comp_qty` decimal(13,6) DEFAULT NULL COMMENT '组件商品数量',
  `comp_pkg_id` varchar(20) DEFAULT NULL COMMENT '组件中单位',
  `enable` smallint(6) DEFAULT '1' COMMENT '有效',
  `create_user_id` varchar(20) DEFAULT NULL COMMENT '创建人ID',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_user_id` varchar(20) DEFAULT NULL COMMENT '修改人ID',
  `modify_user_name` varchar(20) DEFAULT NULL COMMENT '修改人姓名',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `rec_flag` tinyint(2) DEFAULT '0' COMMENT '接收状态 0-初始 1-已处理',
  `received` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '接收时间',
  `yn` smallint(6) DEFAULT '1' COMMENT '状态 1：启用 -1：删除',
  `cost_qty` decimal(13,6) DEFAULT NULL COMMENT '成本拆分比例',
  `price_factor` decimal(13,6) DEFAULT NULL COMMENT '价格因子',
  `bom_type` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'COMMON' COMMENT 'bom类型（区分标准bom，白条分割，礼篮等）默认标准bom',
  `group_id` bigint(20) DEFAULT NULL COMMENT '关联关系分组表 rec_merch_bom_group主键id',
  `comp_num` decimal(10,6) DEFAULT NULL COMMENT 'comp_rf_id数量（相对于origin_num）',
  `origin_num` decimal(10,6) DEFAULT NULL COMMENT 'rf_id数量',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_vender_id_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_comp_sku_id` (`comp_sku`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7786202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = rec_merch_bom_group   */
/******************************************/
CREATE TABLE `rec_merch_bom_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据有效性:-1删除,0无效,1有效',
  `rf_id` varchar(100) NOT NULL COMMENT '物料编码',
  `bom_type` varchar(20) NOT NULL DEFAULT 'COMMON' COMMENT 'bom类型（区分标准bom，白条分割，礼篮等）默认标准bom',
  `description` varchar(255) NOT NULL COMMENT '方案描述',
  `sap_variant` varchar(255) DEFAULT NULL COMMENT '商家的分割方案类型',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  `auto_convert` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启自动转换,0:不开启,1:开启',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '启用状态：1:有效 , 0:无效',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_venderId_rfId` (`vender_id`,`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9672002 DEFAULT CHARSET=utf8mb4 COMMENT='bom关联关系分组表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = rec_merch_package   */
/******************************************/
CREATE TABLE `rec_merch_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL COMMENT '商品SKUID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `region_no` varchar(10) DEFAULT NULL COMMENT '区域编号',
  `rf_id` varchar(50) DEFAULT NULL,
  `package_id` varchar(10) DEFAULT NULL COMMENT '包装id 包装单位',
  `child_pkg_id` varchar(10) DEFAULT NULL COMMENT '子包装id',
  `name` varchar(20) DEFAULT NULL COMMENT '包装名称',
  `length` decimal(10,3) DEFAULT '0.000' COMMENT '深度（或长度）',
  `width` decimal(10,3) DEFAULT '0.000' COMMENT '宽度',
  `high` decimal(10,3) DEFAULT '0.000' COMMENT '高度',
  `weight` decimal(10,3) DEFAULT '0.000' COMMENT '重量',
  `unit_qt` decimal(10,3) DEFAULT '1.000' COMMENT '基本包装入数',
  `child_qt` int(11) DEFAULT '1' COMMENT '子包装入数',
  `can_sale` smallint(6) DEFAULT '1' COMMENT '可否销售',
  `enable` smallint(6) DEFAULT '1' COMMENT '有效',
  `create_user_id` varchar(20) DEFAULT NULL COMMENT '创建人ID',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT '创建人姓名',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_user_id` varchar(20) DEFAULT NULL COMMENT '修改人ID',
  `modify_user_name` varchar(20) DEFAULT NULL COMMENT '修改人姓名',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `rec_flag` tinyint(2) DEFAULT '0' COMMENT '接收状态 0-初始 1-已处理',
  `received` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '接收时间',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `volume` decimal(15,3) DEFAULT NULL COMMENT '体积（cm³）',
  `yn` smallint(6) DEFAULT '1' COMMENT '状态 1：启用 -1：删除',
  `net_weight` decimal(10,3) DEFAULT '0.000' COMMENT '净重',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_sku_id` (`sku_id`,`yn`) USING BTREE,
  KEY `idx_package_id` (`package_id`) USING BTREE,
  KEY `idx_vender_rf_id_pkg_id` (`vender_id`,`rf_id`,`package_id`) USING BTREE COMMENT '商家物料包装单位',
  KEY `rf_id_idx` (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361576082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = rule   */
/******************************************/
CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则Id',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家Id',
  `skuId` bigint(20) DEFAULT NULL COMMENT '商品SKU编号',
  `title` varchar(200) DEFAULT NULL,
  `range` smallint(6) DEFAULT NULL COMMENT '共享范围 0:商家   -1：供应商',
  `ref_sku` bigint(20) DEFAULT NULL COMMENT '关联的供应商商品SKU',
  `supplier_vender_id` bigint(20) DEFAULT NULL COMMENT '供应商商家id',
  `ref_shop_stock` tinyint(1) DEFAULT NULL COMMENT '是否关联到门店库存',
  `filter_type` smallint(6) DEFAULT NULL COMMENT '0:全部 1：白名单 -1：黑名单',
  `shoplist` varchar(1000) DEFAULT NULL COMMENT '门店列表',
  `need_auto_refresh` tinyint(1) DEFAULT NULL COMMENT '是否使用自动刷新库存',
  `auto_stock` int(11) DEFAULT NULL COMMENT '自动刷新库存值',
  `safe_stock` int(11) DEFAULT '0',
  `share_stock` int(11) DEFAULT '0' COMMENT '共享库存值',
  `status` smallint(6) DEFAULT NULL COMMENT '是否在用 1：是 -1：否',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `feature` varchar(500) DEFAULT NULL,
  `spec_num` int(11) DEFAULT NULL COMMENT '主副商品对应规格比例',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商Id',
  `pre_occupy_stock` int(11) DEFAULT '0' COMMENT '预占库存',
  `safe_stock_rate` float DEFAULT NULL COMMENT '安全库存系数',
  `safe_stock_type` tinyint(4) DEFAULT NULL COMMENT '安全库存类型 1：数 2：系数',
  PRIMARY KEY (`id`),
  KEY `idx_range` (`range`),
  KEY `idx_skuId` (`skuId`)
) ENGINE=InnoDB AUTO_INCREMENT=122842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0000   */
/******************************************/
CREATE TABLE `sap_location_ware_0000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=88899242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0001   */
/******************************************/
CREATE TABLE `sap_location_ware_0001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=100929842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0002   */
/******************************************/
CREATE TABLE `sap_location_ware_0002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=397795922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0003   */
/******************************************/
CREATE TABLE `sap_location_ware_0003` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=91892842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0004   */
/******************************************/
CREATE TABLE `sap_location_ware_0004` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84651642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0005   */
/******************************************/
CREATE TABLE `sap_location_ware_0005` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=76698482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0006   */
/******************************************/
CREATE TABLE `sap_location_ware_0006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=87042882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0007   */
/******************************************/
CREATE TABLE `sap_location_ware_0007` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92524122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0008   */
/******************************************/
CREATE TABLE `sap_location_ware_0008` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92130962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0009   */
/******************************************/
CREATE TABLE `sap_location_ware_0009` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=91043762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0010   */
/******************************************/
CREATE TABLE `sap_location_ware_0010` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78976522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0011   */
/******************************************/
CREATE TABLE `sap_location_ware_0011` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=100933042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0012   */
/******************************************/
CREATE TABLE `sap_location_ware_0012` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=202119362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0013   */
/******************************************/
CREATE TABLE `sap_location_ware_0013` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84425122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0014   */
/******************************************/
CREATE TABLE `sap_location_ware_0014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=75262762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0015   */
/******************************************/
CREATE TABLE `sap_location_ware_0015` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=94641082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0016   */
/******************************************/
CREATE TABLE `sap_location_ware_0016` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=94103722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0017   */
/******************************************/
CREATE TABLE `sap_location_ware_0017` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=95753562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0018   */
/******************************************/
CREATE TABLE `sap_location_ware_0018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81633642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0019   */
/******************************************/
CREATE TABLE `sap_location_ware_0019` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=97431682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0020   */
/******************************************/
CREATE TABLE `sap_location_ware_0020` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=94645442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0021   */
/******************************************/
CREATE TABLE `sap_location_ware_0021` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=102926122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0022   */
/******************************************/
CREATE TABLE `sap_location_ware_0022` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=410543442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0023   */
/******************************************/
CREATE TABLE `sap_location_ware_0023` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=97619122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0024   */
/******************************************/
CREATE TABLE `sap_location_ware_0024` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78175802 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0025   */
/******************************************/
CREATE TABLE `sap_location_ware_0025` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81558082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0026   */
/******************************************/
CREATE TABLE `sap_location_ware_0026` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=93051522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0027   */
/******************************************/
CREATE TABLE `sap_location_ware_0027` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=93731522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0028   */
/******************************************/
CREATE TABLE `sap_location_ware_0028` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=71416282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0029   */
/******************************************/
CREATE TABLE `sap_location_ware_0029` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92523602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0030   */
/******************************************/
CREATE TABLE `sap_location_ware_0030` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=90539522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0031   */
/******************************************/
CREATE TABLE `sap_location_ware_0031` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=88081162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0032   */
/******************************************/
CREATE TABLE `sap_location_ware_0032` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=227897082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0033   */
/******************************************/
CREATE TABLE `sap_location_ware_0033` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=65767842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0034   */
/******************************************/
CREATE TABLE `sap_location_ware_0034` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84435482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0035   */
/******************************************/
CREATE TABLE `sap_location_ware_0035` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84860402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0036   */
/******************************************/
CREATE TABLE `sap_location_ware_0036` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81039722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0037   */
/******************************************/
CREATE TABLE `sap_location_ware_0037` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84337442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0038   */
/******************************************/
CREATE TABLE `sap_location_ware_0038` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=97684922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0039   */
/******************************************/
CREATE TABLE `sap_location_ware_0039` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=85968722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0040   */
/******************************************/
CREATE TABLE `sap_location_ware_0040` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81338242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0041   */
/******************************************/
CREATE TABLE `sap_location_ware_0041` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=127574522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0042   */
/******************************************/
CREATE TABLE `sap_location_ware_0042` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=440398762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0043   */
/******************************************/
CREATE TABLE `sap_location_ware_0043` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=87906802 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0044   */
/******************************************/
CREATE TABLE `sap_location_ware_0044` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=94362762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0045   */
/******************************************/
CREATE TABLE `sap_location_ware_0045` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78241642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0046   */
/******************************************/
CREATE TABLE `sap_location_ware_0046` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=73675442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0047   */
/******************************************/
CREATE TABLE `sap_location_ware_0047` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=85574282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0048   */
/******************************************/
CREATE TABLE `sap_location_ware_0048` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(250) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=86594122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0049   */
/******************************************/
CREATE TABLE `sap_location_ware_0049` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=84967042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0050   */
/******************************************/
CREATE TABLE `sap_location_ware_0050` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=76620082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0051   */
/******************************************/
CREATE TABLE `sap_location_ware_0051` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=87750682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0052   */
/******************************************/
CREATE TABLE `sap_location_ware_0052` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=208213162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0053   */
/******************************************/
CREATE TABLE `sap_location_ware_0053` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=71544282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0054   */
/******************************************/
CREATE TABLE `sap_location_ware_0054` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78262562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0055   */
/******************************************/
CREATE TABLE `sap_location_ware_0055` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81091962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0056   */
/******************************************/
CREATE TABLE `sap_location_ware_0056` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=82232602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0057   */
/******************************************/
CREATE TABLE `sap_location_ware_0057` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=81631602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0058   */
/******************************************/
CREATE TABLE `sap_location_ware_0058` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=86621322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0059   */
/******************************************/
CREATE TABLE `sap_location_ware_0059` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=69584522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0060   */
/******************************************/
CREATE TABLE `sap_location_ware_0060` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92376722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0061   */
/******************************************/
CREATE TABLE `sap_location_ware_0061` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=98025122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0062   */
/******************************************/
CREATE TABLE `sap_location_ware_0062` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=393379122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0063   */
/******************************************/
CREATE TABLE `sap_location_ware_0063` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=71100402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0064   */
/******************************************/
CREATE TABLE `sap_location_ware_0064` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=63684842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0065   */
/******************************************/
CREATE TABLE `sap_location_ware_0065` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=64919442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0066   */
/******************************************/
CREATE TABLE `sap_location_ware_0066` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=91744602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0067   */
/******************************************/
CREATE TABLE `sap_location_ware_0067` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=89274602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0068   */
/******************************************/
CREATE TABLE `sap_location_ware_0068` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=95286642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0069   */
/******************************************/
CREATE TABLE `sap_location_ware_0069` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=88335442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0070   */
/******************************************/
CREATE TABLE `sap_location_ware_0070` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=73992482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0071   */
/******************************************/
CREATE TABLE `sap_location_ware_0071` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=95823322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0072   */
/******************************************/
CREATE TABLE `sap_location_ware_0072` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=231159882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0073   */
/******************************************/
CREATE TABLE `sap_location_ware_0073` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=83142962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0074   */
/******************************************/
CREATE TABLE `sap_location_ware_0074` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=92201002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0075   */
/******************************************/
CREATE TABLE `sap_location_ware_0075` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=77738722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0076   */
/******************************************/
CREATE TABLE `sap_location_ware_0076` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=90417962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0077   */
/******************************************/
CREATE TABLE `sap_location_ware_0077` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=77233922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0078   */
/******************************************/
CREATE TABLE `sap_location_ware_0078` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78782242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0079   */
/******************************************/
CREATE TABLE `sap_location_ware_0079` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=88000842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0080   */
/******************************************/
CREATE TABLE `sap_location_ware_0080` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=67724722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0081   */
/******************************************/
CREATE TABLE `sap_location_ware_0081` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=108103562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0082   */
/******************************************/
CREATE TABLE `sap_location_ware_0082` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=427060642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0083   */
/******************************************/
CREATE TABLE `sap_location_ware_0083` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=83572562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0084   */
/******************************************/
CREATE TABLE `sap_location_ware_0084` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=103685042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0085   */
/******************************************/
CREATE TABLE `sap_location_ware_0085` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=98029762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0086   */
/******************************************/
CREATE TABLE `sap_location_ware_0086` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=74449682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0087   */
/******************************************/
CREATE TABLE `sap_location_ware_0087` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=88410522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0088   */
/******************************************/
CREATE TABLE `sap_location_ware_0088` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=77411202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0089   */
/******************************************/
CREATE TABLE `sap_location_ware_0089` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=86156202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0090   */
/******************************************/
CREATE TABLE `sap_location_ware_0090` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=67934882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0091   */
/******************************************/
CREATE TABLE `sap_location_ware_0091` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=74035562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0092   */
/******************************************/
CREATE TABLE `sap_location_ware_0092` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=203177642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0093   */
/******************************************/
CREATE TABLE `sap_location_ware_0093` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=72171322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0094   */
/******************************************/
CREATE TABLE `sap_location_ware_0094` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78354162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0095   */
/******************************************/
CREATE TABLE `sap_location_ware_0095` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=75642922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0096   */
/******************************************/
CREATE TABLE `sap_location_ware_0096` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=78665482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0097   */
/******************************************/
CREATE TABLE `sap_location_ware_0097` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=89658642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0098   */
/******************************************/
CREATE TABLE `sap_location_ware_0098` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=98305962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_0099   */
/******************************************/
CREATE TABLE `sap_location_ware_0099` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` varchar(50) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL COMMENT '大数据修改库存时间',
  `tag` int(11) DEFAULT '0' COMMENT '商品标记',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  `offline_retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '线下商品参考价格',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `lack_tag` tinyint(4) DEFAULT '0' COMMENT '缺货标记 0:否 1：是',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `terminals` varchar(1000) DEFAULT NULL COMMENT '上架销售端',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=82367242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_bak   */
/******************************************/
CREATE TABLE `sap_location_ware_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locnr_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `locnr` varchar(45) DEFAULT NULL COMMENT '地点',
  `matnr` varchar(100) DEFAULT NULL,
  `mstae` varchar(45) DEFAULT NULL COMMENT 'sap禁售标识       0正常；为1时，ERP、上架状态自动变成0下架。',
  `mmsta` varchar(45) DEFAULT NULL COMMENT 'sap商品状态为1、2、3时，电商显示有货；其它状态时显示为无货；',
  `mmsta_time` datetime DEFAULT NULL COMMENT 'sap商品状态变更时间',
  `mstae_time` datetime DEFAULT NULL COMMENT '禁售变更时间',
  `stock_time` varchar(45) DEFAULT NULL COMMENT '库存变更时间',
  `stock` int(11) DEFAULT NULL COMMENT '总库存',
  `price_time` varchar(45) DEFAULT NULL COMMENT '价格变更时间',
  `labst` int(11) DEFAULT NULL COMMENT '安全库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `ware_sku_id` int(11) DEFAULT NULL COMMENT '商品id，关联ware表',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  `publish_status` smallint(6) DEFAULT '-1' COMMENT '是否发布,-1:未发布,1:已发布',
  `online_price` decimal(10,2) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL COMMENT '线上发布日期',
  `unit` varchar(45) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bd_stock_time` datetime DEFAULT NULL,
  `tag` int(11) DEFAULT '0',
  `store_chg_time` datetime DEFAULT NULL COMMENT '线下门店库存发生变更时间',
  `tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `corner_tag` int(11) DEFAULT '0' COMMENT '角标打标',
  `corner_tag_time` datetime DEFAULT NULL COMMENT '角标打标时间',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `ware_status` smallint(6) DEFAULT NULL COMMENT '主商品状态（0 false 1 true）',
  `sap_ware_status` smallint(6) DEFAULT NULL COMMENT '门店商品状态（0 false 1 true）',
  `stock_status` smallint(6) DEFAULT NULL COMMENT '库存状态（0 false 1 true）',
  `front_stock_time` varchar(45) DEFAULT NULL COMMENT '前置仓库存变更时间',
  `front_stock` int(11) DEFAULT NULL COMMENT '前置仓库存',
  `retail_price` decimal(10,2) DEFAULT '0.00' COMMENT '散卖商品参考价格',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_locnr_matnr` (`locnr_id`,`matnr`),
  UNIQUE KEY `uk_idx_shop_matnr` (`shop_id`,`matnr`),
  UNIQUE KEY `uk_shop_id_sku_id` (`shop_id`,`ware_sku_id`),
  KEY `index_sap_locnr_id` (`locnr_id`),
  KEY `index_sap_ware_id` (`ware_id`),
  KEY `index_sap_ware_sku_id` (`ware_sku_id`),
  KEY `index_modified` (`modified`),
  KEY `index_publish_status_shop_id` (`shop_id`,`publish_status`),
  KEY `index_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=9669939 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0000   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0000` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69668722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0001   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0001` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87337922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0002   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0002` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2148157242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0003   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0003` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69263922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0004   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0004` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73661922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0005   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0005` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68778082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0006   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0006` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84315282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0007   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0007` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59611922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0008   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0008` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65286922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0009   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0009` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64658962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0010   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0010` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84167722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0011   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0011` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68045482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0012   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0012` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1051167042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0013   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0013` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65502562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0014   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0014` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62317122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0015   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0015` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72857322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0016   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0016` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68899682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0017   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0017` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73944082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0018   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0018` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64952922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0019   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0019` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71279722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0020   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145235122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0021   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0021` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148991642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0022   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0022` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2281731842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0023   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0023` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136868962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0024   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0024` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138536162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0025   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0025` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73574362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0026   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0026` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143439402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0027   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0027` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145384282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0028   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0028` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60814042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0029   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0029` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150585322 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0030   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0030` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145314082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0031   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0031` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133926002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0032   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0032` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=985552762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0033   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0033` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134068642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0034   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0034` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143372002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0035   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0035` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144560162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0036   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0036` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147809202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0037   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0037` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144192002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0038   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0038` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149558362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0039   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0039` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156350242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0040   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0040` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145572362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0041   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0041` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=193366882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0042   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0042` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2172566082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0043   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0043` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141222922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0044   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0044` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212280522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0045   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0045` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205710562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0046   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0046` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133468442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0047   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0047` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70672682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0048   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0048` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143400002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0049   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0049` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151488362 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0050   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0050` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132984242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0051   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0051` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137574162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0052   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0052` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=978150642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0053   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0053` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109699722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0054   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0054` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125894442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0055   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0055` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67705282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0056   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0056` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132103162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0057   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0057` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127670642 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0058   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0058` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53817442 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0059   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0059` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130197522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0060   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0060` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128829602 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0061   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0061` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=153896482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0062   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0062` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2142325922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0063   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0063` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125236242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0064   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0064` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119110482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0065   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0065` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129550682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0066   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0066` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130954482 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0067   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0067` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57724682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0068   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0068` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150952082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0069   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0069` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134269042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0070   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0070` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136791002 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0071   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0071` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=214477402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0072   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0072` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1150981882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0073   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0073` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204369802 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0074   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0074` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56771202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0075   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0075` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60977202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0076   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0076` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147898522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0077   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0077` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139113162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0078   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0078` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133576682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0079   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0079` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127737762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0080   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0080` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129261762 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0081   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0081` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160829162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0082   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0082` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2230711522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0083   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0083` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64784562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0084   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0084` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129741842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0085   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0085` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60560122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0086   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0086` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135873242 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0087   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0087` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65538042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0088   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0088` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67569402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0089   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0089` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73632922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0090   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0090` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123307842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0091   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0091` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66064922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0092   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0092` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1014504522 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0093   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0093` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59594562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0094   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0094` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62113122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0095   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0095` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55173562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0096   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0096` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54000082 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0097   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0097` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63145042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0098   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0098` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68039802 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_location_ware_ext_0099   */
/******************************************/
CREATE TABLE `sap_location_ware_ext_0099` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `ware_id` int(11) DEFAULT NULL,
  `matnr` varchar(100) NOT NULL,
  `oper_dept_code` varchar(32) DEFAULT NULL COMMENT '营运课组',
  `price_up_limit` decimal(10,2) DEFAULT NULL COMMENT '价格上限',
  `price_down_limit` decimal(10,2) DEFAULT NULL COMMENT '价格下限',
  `distribution_mode` smallint(6) DEFAULT NULL COMMENT '配送方式（1 供商直送 2 配送 3 直流）',
  `management_style` smallint(6) DEFAULT NULL COMMENT '管理方式（1 单品 2 拆零 3 大码）',
  `main_sup_no` varchar(256) DEFAULT NULL COMMENT '主供商编码',
  `out_sup_no` varchar(256) DEFAULT NULL COMMENT '外部供商编码',
  `can_order` smallint(6) DEFAULT NULL COMMENT '允许订货',
  `can_return` smallint(6) DEFAULT NULL COMMENT '允许退货',
  `can_sale` smallint(6) DEFAULT NULL COMMENT '允许销售',
  `forbidden_type` smallint(6) DEFAULT NULL COMMENT '禁售类型（1 手动禁售 2 合同禁售）',
  `can_chg_retail_price` smallint(6) DEFAULT NULL COMMENT '允许变售价',
  `can_chg_scales_price` smallint(6) DEFAULT NULL COMMENT '允许磅秤变价',
  `can_store_order` smallint(6) DEFAULT NULL COMMENT '允许调拨',
  `can_sale_return` smallint(6) DEFAULT NULL COMMENT '是否销售可退货',
  `can_exhibit` smallint(6) DEFAULT NULL COMMENT '是否陈列',
  `sell_type` smallint(6) DEFAULT NULL COMMENT '经营方式',
  `is_union_no` smallint(6) DEFAULT NULL COMMENT '是否联营大码',
  `pr_style` varchar(32) DEFAULT NULL COMMENT '出清方式',
  `pr_param` varchar(256) DEFAULT NULL COMMENT '出清参数',
  `new_merch_date` varchar(256) DEFAULT NULL COMMENT '新品到期日',
  `vip_discount` varchar(256) DEFAULT NULL COMMENT '参与卡折扣',
  `article_id` varchar(256) DEFAULT NULL COMMENT '外部系统商品ID',
  `article_type` varchar(256) DEFAULT NULL COMMENT '外部系统商品类型',
  `assort` varchar(1024) DEFAULT NULL COMMENT '商品配置',
  `chg_id` varchar(10) DEFAULT NULL COMMENT '变更单号',
  `create_price_chg` smallint(6) DEFAULT '0' COMMENT '是否产生变价',
  `price_chg_interval` tinyint(2) DEFAULT '0' COMMENT '变价间隔天数',
  `price_chg_count` tinyint(2) DEFAULT '0' COMMENT '变价次数',
  `price_chg_rate` decimal(7,4) DEFAULT '0.0000' COMMENT '变价折扣率',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `can_chg_purchase_price` smallint(4) DEFAULT '0' COMMENT '是否可修改进价：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `product_place` varchar(255) DEFAULT NULL COMMENT '门店商品产地',
  `ext_info` json DEFAULT NULL COMMENT '扩展信息',
  `log_id` varchar(100) DEFAULT NULL COMMENT '操作日志id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_sku_id` (`shop_id`,`sku_id`),
  KEY `idx_created` (`created`),
  KEY `idx_shop_id_matnr` (`shop_id`,`matnr`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54433922 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_route_strategy   */
/******************************************/
CREATE TABLE `sap_route_strategy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_shopId` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3095042 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_route_strategy_origin   */
/******************************************/
CREATE TABLE `sap_route_strategy_origin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_shopId` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2805 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_ware_category   */
/******************************************/
CREATE TABLE `sap_ware_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '门店ID',
  `cls_code` varchar(20) NOT NULL COMMENT '分类编码',
  `parent_cls_code` varchar(20) DEFAULT NULL COMMENT '上级商品分类编码',
  `cls_name` varchar(32) NOT NULL COMMENT '分类名称',
  `creator` varchar(20) NOT NULL COMMENT '创建者',
  `cal_member_score` smallint(6) DEFAULT NULL COMMENT '是否积分',
  `member_score_rate` decimal(7,4) DEFAULT NULL COMMENT '积分率',
  `buyer_dept_code` varchar(20) DEFAULT NULL COMMENT '采购组编号',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  KEY `index_swc_shop_id` (`shop_id`),
  KEY `index_swc_cls_code` (`cls_code`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_ware_trace_result   */
/******************************************/
CREATE TABLE `sap_ware_trace_result` (
  `trace_result_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '跟踪任务结果列表编号',
  `task_id` int(16) NOT NULL COMMENT '任务编号',
  `result_path` varchar(4000) DEFAULT NULL COMMENT '结果保存路径',
  `created` date DEFAULT NULL COMMENT '数据创建时间',
  `err_info` varchar(4000) DEFAULT NULL COMMENT '执行错误信息',
  PRIMARY KEY (`trace_result_id`),
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11795202 DEFAULT CHARSET=utf8 COMMENT='门店商品价格库存跟踪任务-结果路径表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_ware_trace_task   */
/******************************************/
CREATE TABLE `sap_ware_trace_task` (
  `task_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `task_name` varchar(128) NOT NULL COMMENT '任务名称',
  `vender_id` int(11) NOT NULL COMMENT '商家编号',
  `vender_name` varchar(45) NOT NULL COMMENT '商家名称',
  `effective_date` date DEFAULT NULL COMMENT '生效时间',
  `expire_date` date DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`task_id`),
  KEY `idx_vender_id` (`vender_id`),
  KEY `idx_task_name` (`task_name`)
) ENGINE=InnoDB AUTO_INCREMENT=642 DEFAULT CHARSET=utf8 COMMENT='门店商品价格库存跟踪任务表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sap_ware_trace_ware   */
/******************************************/
CREATE TABLE `sap_ware_trace_ware` (
  `trace_ware_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '商品列表编号',
  `task_id` int(16) NOT NULL COMMENT '任务编号',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家编号',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品编号',
  `rf_id` varchar(100) DEFAULT NULL COMMENT '商家商品编号',
  `sku_id` int(11) DEFAULT NULL COMMENT 'sku编号',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `item_num` varchar(64) DEFAULT NULL COMMENT '商品国条码',
  PRIMARY KEY (`trace_ware_id`),
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1274322 DEFAULT CHARSET=utf8 COMMENT='门店商品价格库存跟踪任务-任务商品表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sellout_count_report   */
/******************************************/
CREATE TABLE `sellout_count_report` (
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `total_sale_amount` bigint(20) DEFAULT '0' COMMENT '总销售量',
  `virtual_sale_amount` bigint(20) DEFAULT '0' COMMENT '虚拟销量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL,
  `virtual_modified` datetime DEFAULT NULL COMMENT '虚拟销量修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = share_price_rule   */
/******************************************/
CREATE TABLE `share_price_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `skuId` bigint(20) DEFAULT NULL COMMENT '商品SKU编号',
  `title` varchar(200) DEFAULT NULL,
  `ref_sku` bigint(20) DEFAULT NULL COMMENT '关联的供应商商品SKU',
  `supplier_vender_id` bigint(20) DEFAULT NULL COMMENT '供应商商家id',
  `filter_type` smallint(6) DEFAULT NULL COMMENT '0:全部 1：白名单 -1：黑名单',
  `shoplist` varchar(1000) DEFAULT NULL COMMENT '门店列表',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `feature` varchar(500) DEFAULT NULL,
  `share_price_shop` int(11) DEFAULT NULL COMMENT '价格参考门店ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level   */
/******************************************/
CREATE TABLE `shelf_group_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '货架组级编码',
  `name` varchar(20) NOT NULL COMMENT '货架组级名称',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `repetition` tinyint(4) NOT NULL COMMENT '关联货架组级是否允许门店重复\r\n0=不允许重复\r\n1=允许重复\r\n',
  `purchase_cat_id` int(11) DEFAULT NULL COMMENT '采购线类目ID',
  `shelf_group_level_ids` varchar(2000) DEFAULT NULL COMMENT '关联货架组级IDs',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `grade` varchar(255) DEFAULT NULL COMMENT '级别',
  `store_type_code` tinyint(4) DEFAULT NULL COMMENT '门店业态类型code',
  `parent_code` varchar(255) DEFAULT NULL COMMENT '父级货架组级编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `is_cat_ware_ctrl` tinyint(4) DEFAULT '0' COMMENT '是否管控品类数量： 1：是， 0：否',
  `is_cover_shop_status` tinyint(4) DEFAULT '0' COMMENT '是否覆盖店品状态： 1：是， 0：否',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_code_index` (`code`),
  KEY `idx_parend_code` (`parent_code`),
  KEY `idx_vender_id_name` (`vender_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10269002 DEFAULT CHARSET=utf8 COMMENT='货架组级';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_shop_map   */
/******************************************/
CREATE TABLE `shelf_group_level_shop_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货架组级门店关联表数据',
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `shop_id` int(11) NOT NULL COMMENT '门店ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_shop_id_index` (`shop_id`),
  KEY `shelf_group_level_level_id_index` (`shelf_group_level_id`),
  KEY `idx_vender_id_yn` (`vender_id`,`yn`) USING BTREE,
  KEY `idx_vender_shop_id` (`vender_id`,`shop_id`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=96996082 DEFAULT CHARSET=utf8 COMMENT='货架组级与门店的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_sync_info   */
/******************************************/
CREATE TABLE `shelf_group_level_sync_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `shop_id` int(11) NOT NULL COMMENT '门店ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKUID',
  `rf_id` varchar(100) DEFAULT NULL COMMENT '物料码',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供商编码',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供商编码',
  `error` varchar(500) DEFAULT NULL COMMENT '错误信息',
  `yn` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sync_info` (`shelf_group_level_id`,`shop_id`,`sku_id`),
  KEY `idx_sync_info_1` (`shelf_group_level_id`,`shop_id`,`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58915402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=722412962 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_000   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=863010242 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_001   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_001` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=863116202 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_002   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_002` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=863075202 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_003   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_003` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=864069322 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_004   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_004` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=864065922 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_005   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_005` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=839489002 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_006   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_006` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=861342562 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_007   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_007` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=806105442 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_008   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_008` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=876315082 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_level_ware_map_009   */
/******************************************/
CREATE TABLE `shelf_group_level_ware_map_009` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_group_level_id` int(11) NOT NULL COMMENT '货架组级ID',
  `sku_id` int(11) NOT NULL COMMENT '商品ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效,1:有效,-1:无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(255) DEFAULT NULL COMMENT '商品状态',
  `top_retail_price` decimal(10,2) DEFAULT NULL COMMENT '门店最高售价',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式 0-在库,1-直流,2-直送',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '内部供应商',
  `out_supplier_code` varchar(100) DEFAULT NULL COMMENT '外部供应商',
  `display_able` tinyint(1) DEFAULT NULL COMMENT '是否陈列：1-是 0-否',
  `rf_id` varchar(100) NOT NULL DEFAULT '' COMMENT '物料编码',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '更新人',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `shelf_group_level_id_index` (`shelf_group_level_id`),
  KEY `shelf_group_level_sku_id_index` (`sku_id`),
  KEY `idx_vender_id_yn_status` (`vender_id`,`yn`,`status`) USING BTREE,
  KEY `idx_sglid_vender_yn_status` (`shelf_group_level_id`,`vender_id`,`yn`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=887438002 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_group_ware_task   */
/******************************************/
CREATE TABLE `shelf_group_ware_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` bigint(20) NOT NULL COMMENT '操作人ID',
  `operator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人',
  `detail` json NOT NULL COMMENT '任务详情，见：ShelfAndWareRow',
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DOING' COMMENT '任务状态: DOING:执行中；DONE-完成',
  `msg_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异步操作ID',
  `remark` varchar(512) DEFAULT NULL COMMENT '执行详情备注',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=7002 DEFAULT CHARSET=utf8 COMMENT='商品添加到货架组级任务';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_level_rule   */
/******************************************/
CREATE TABLE `shelf_level_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `level_code` varchar(255) NOT NULL COMMENT '层级code',
  `parent_level_code` varchar(255) DEFAULT NULL COMMENT '父级code',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效：1-有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2323 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shelf_ware_route_strategy   */
/******************************************/
CREATE TABLE `shelf_ware_route_strategy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_venderId` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4202 DEFAULT CHARSET=utf8 COMMENT='货架组级与商品的关联关系路由表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_cm_category   */
/******************************************/
CREATE TABLE `shop_cm_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '门店id',
  `shop_name` varchar(45) DEFAULT NULL COMMENT '门店名称',
  `cm_category_id` int(11) NOT NULL COMMENT '前台类目id',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_list   */
/******************************************/
CREATE TABLE `shop_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `range` smallint(6) DEFAULT NULL COMMENT '-1：供应商',
  `shop_ids` varchar(1000) DEFAULT NULL COMMENT '供应商门店ID列表',
  `supplier_id` int(20) DEFAULT NULL COMMENT '供应商Id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '供应商商家Id',
  `yn` smallint(6) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `feature` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_price_group   */
/******************************************/
CREATE TABLE `shop_price_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` int(11) NOT NULL COMMENT '商家Id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `shop_type` tinyint(1) NOT NULL COMMENT '门店类型',
  `cat_small_classify_id` int(11) NOT NULL COMMENT '商家小分类Id',
  `price_group_id` int(11) NOT NULL COMMENT '价格群组Id',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `data_source` varchar(50) DEFAULT 'MANUAL' COMMENT '数据来源',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_cls_id` (`shop_id`,`cat_small_classify_id`) USING BTREE,
  KEY `idx_small_classify_id` (`cat_small_classify_id`,`shop_id`),
  KEY `group_shop_id` (`price_group_id`,`shop_id`),
  KEY `idx_shop_cls_group_id` (`shop_id`,`cat_small_classify_id`,`price_group_id`) USING BTREE,
  KEY `idx_group_vender_id` (`price_group_id`,`yn`,`vender_id`) USING BTREE COMMENT '群组id商家id yn'
) ENGINE=InnoDB AUTO_INCREMENT=63917362 DEFAULT CHARSET=utf8 COMMENT='门店价格群组表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_price_group_log   */
/******************************************/
CREATE TABLE `shop_price_group_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_price_group_id` int(11) NOT NULL COMMENT '门店价格群组id',
  `oper_content` varchar(500) DEFAULT NULL COMMENT '操作内容',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_price_group_id` (`shop_price_group_id`) USING BTREE COMMENT '门店价格群组id'
) ENGINE=InnoDB AUTO_INCREMENT=33070082 DEFAULT CHARSET=utf8 COMMENT='门店价格群组操作日志表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_price_modified_log   */
/******************************************/
CREATE TABLE `shop_price_modified_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商品物料编码',
  `shop_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `old_price` decimal(10,2) DEFAULT NULL COMMENT '门店商品原线上价格',
  `old_offline_price` decimal(10,2) DEFAULT NULL COMMENT '门店商品原线下价格',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  KEY `idx_rf_id` (`rf_id`),
  KEY `idx_shop_id` (`shop_id`),
  KEY `idx_modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=6705615 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_price_temp   */
/******************************************/
CREATE TABLE `shop_price_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rf_id` varchar(100) DEFAULT NULL COMMENT '物料编码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `offline_price` decimal(10,2) DEFAULT NULL COMMENT '线下价格',
  `modified_price` decimal(10,2) DEFAULT NULL COMMENT '修改后价格',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(6) DEFAULT '1' COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  KEY `idx_rf_id` (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53889 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_tax_rate   */
/******************************************/
CREATE TABLE `shop_tax_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier_id` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `modifier` varchar(50) DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '逻辑删除：1-有效，-1-逻辑删除',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `shop_id` bigint(20) NOT NULL COMMENT '门店ID',
  `sap_id` varchar(50) NOT NULL COMMENT '门店编码',
  `shop_name` varchar(50) NOT NULL COMMENT '门店名称',
  `mwskz_name` varchar(45) NOT NULL COMMENT '商品税码',
  `output_tax_code` varchar(60) NOT NULL COMMENT '销项税码',
  `mwskz` double NOT NULL COMMENT '税率',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1：有效 -1：无效',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_tax` (`vender_id`,`mwskz_name`,`yn`),
  KEY `idx_shop_tax` (`shop_id`,`mwskz_name`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=1164242 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_ware_chg   */
/******************************************/
CREATE TABLE `shop_ware_chg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否有效,-1:无效,1:有效',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `biz_num` varchar(50) NOT NULL COMMENT '单据号  ware-code-api生成',
  `status` varchar(10) NOT NULL COMMENT '审核通过 PASSED 审核中 APPROVE 驳回 REJECTED 同步异常FAILED',
  `chg_scene` varchar(10) NOT NULL COMMENT '变更场景  SINGLE: 单个修改 SHOP_ALL: 批量设置-全部门店 SHOP_PART:批量设置-部分门店 SHELF:批量设置-货架组级 TEMPLATE:模板设置',
  `reject_reasons` varchar(255) DEFAULT NULL COMMENT '驳回原因',
  `submitter` varchar(50) NOT NULL COMMENT '提交人名称',
  `submitter_id` bigint(20) NOT NULL COMMENT '提交人ID',
  `err_msg` varchar(1000) DEFAULT NULL COMMENT '处理失败原因',
  `sync_count` tinyint(4) NOT NULL DEFAULT '0' COMMENT '同步次数',
  `platform` varchar(50) DEFAULT 'SHOP_WARE_WEB' COMMENT '来源平台的名称或者code',
  `change_reason` varchar(200) DEFAULT 'SHOP_WARE_WEB_CHANGE' COMMENT '变更原因',
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '期望生效时间',
  `effected_time` timestamp NULL DEFAULT NULL COMMENT '实际生效时间',
  `out_biz_num` varchar(255) DEFAULT NULL COMMENT '外部单号，如大数据中心任务ID',
  `process_status` varchar(10) DEFAULT NULL COMMENT '处理结果，PREPARE-待处理;PROCESSING-处理中;SUCCESS-处理成功;FAILED-处理失败',
  `canceled_id` bigint(20) DEFAULT NULL COMMENT '取消人ID',
  `data_source_detail` varchar(50) DEFAULT NULL COMMENT '记录来源明细',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_vender_biznum` (`vender_id`,`biz_num`) USING BTREE,
  KEY `idx_vender_status` (`vender_id`,`status`,`yn`) USING BTREE,
  KEY `vender_out_biz_num` (`vender_id`,`out_biz_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48807442 DEFAULT CHARSET=utf8 COMMENT='门店商品信息变更单据表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = shop_ware_chg_detail   */
/******************************************/
CREATE TABLE `shop_ware_chg_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否有效,-1:无效,1:有效',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `chg_id` bigint(20) NOT NULL COMMENT '单据ID  单据主表自增主键',
  `shop_id` bigint(20) NOT NULL COMMENT '门店ID',
  `shelf_codes` varchar(2000) DEFAULT NULL COMMENT '货架组级编码 多个用英文逗号隔开  直接冗余存储，不作为查询条件',
  `sap_id` varchar(100) NOT NULL COMMENT '门店编码',
  `rf_id` varchar(100) NOT NULL COMMENT '商品编码',
  `sku_id` bigint(20) NOT NULL COMMENT '商品skuid',
  `item_nums` varchar(1000) NOT NULL COMMENT '国际条码快照，多个以英文逗号分隔',
  `title` varchar(200) NOT NULL COMMENT '商品名称快照 对应wm的sap的MAKTM',
  `ware_status` json DEFAULT NULL COMMENT '商品状态编码 关联表ware_base_status',
  `sell_type` json DEFAULT NULL COMMENT '商品经营方式 1-自营,2-代销,3-联营（不管理库存）,8-联营（管理库存）',
  `is_union_no` json DEFAULT NULL COMMENT '是否联营大码  Y 是  N 否   需要存储旧值',
  `can_sale` json DEFAULT NULL COMMENT '是否可以销售  Y 是  N 否   需要存储旧值',
  `can_chg_retail_price` json DEFAULT NULL COMMENT '是否门店可变价 Y 是  N 否 需要存储旧值',
  `can_chg_scales_price` json DEFAULT NULL COMMENT '是否磅秤可变价 Y 是  N 否 需要存储旧值',
  `can_chg_purchase_price` json DEFAULT NULL COMMENT '是否可修改进价 Y 是  N 否 需要存储旧值',
  `sync_count` tinyint(4) NOT NULL DEFAULT '0' COMMENT '重试次数 最大3次',
  `sync_status` varchar(10) NOT NULL DEFAULT 'PENDING' COMMENT '同步结果 SUCCESS 成功 FAIL 失败',
  `err_msg` varchar(1000) DEFAULT NULL COMMENT '失败原因',
  `row_num` int(11) NOT NULL DEFAULT '0' COMMENT 'excel行号 单个修改时为0',
  `product_place` json DEFAULT NULL COMMENT '产地  需要存储旧值',
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '期望生效时间',
  `effected_time` timestamp NULL DEFAULT NULL COMMENT '实际生效时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_vender_id_rfid` (`vender_id`,`rf_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_chg_id` (`chg_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2525714962 DEFAULT CHARSET=utf8 COMMENT='门店商品信息变更单据扩展表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = sku_sell_amount   */
/******************************************/
CREATE TABLE `sku_sell_amount` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'skuID',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `total_sale_amount` int(11) DEFAULT NULL COMMENT '总销售量',
  `recent_sale_amount` int(11) DEFAULT NULL COMMENT '最近销售量',
  `created` date DEFAULT NULL COMMENT '创建时间',
  `modified` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = small_cat_tax_classify   */
/******************************************/
CREATE TABLE `small_cat_tax_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `small_cat_code` varchar(255) NOT NULL COMMENT '小分类code',
  `tax_classify_code` varchar(255) NOT NULL COMMENT '国税分类编码',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '最近操作人ID',
  `operator` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `operate_time` datetime NOT NULL COMMENT '最近操作时间',
  `operate_log` json DEFAULT NULL COMMENT '操作日志',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  KEY `idx_vender_smallcat_code` (`vender_id`,`small_cat_code`),
  KEY `idx_classify_code` (`tax_classify_code`)
) ENGINE=InnoDB AUTO_INCREMENT=478642 DEFAULT CHARSET=utf8 COMMENT='小分类国税分类码';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = status_contrast   */
/******************************************/
CREATE TABLE `status_contrast` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ware_status` tinyint(3) DEFAULT NULL COMMENT '商品主数据状态',
  `mstae` tinyint(3) DEFAULT NULL COMMENT '门店商品禁售标识',
  `mmsta` tinyint(3) DEFAULT NULL COMMENT '门店商品SAP状态',
  `publish_status` tinyint(3) DEFAULT NULL COMMENT '门店商品发布状态',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品skuId',
  `shop_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `ware_status_to` tinyint(3) DEFAULT NULL COMMENT '门店商品上主数据状态',
  `sap_ware_status` tinyint(3) DEFAULT NULL COMMENT '门店商品上门店商品状态',
  `stock_status` tinyint(3) DEFAULT NULL COMMENT '门店商品上库存状态',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(3) DEFAULT NULL COMMENT '数据是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id_created` (`sku_id`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=4195447 DEFAULT CHARSET=utf8 COMMENT='商品状态对比异常数据结果表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = stock_warning   */
/******************************************/
CREATE TABLE `stock_warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家id',
  `vender_name` varchar(300) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `shop_id` int(11) DEFAULT NULL COMMENT '门店id',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `dc_type` tinyint(4) DEFAULT NULL COMMENT '1 全球精选 2 前置仓',
  `skuId` int(11) DEFAULT NULL COMMENT 'skuID',
  `title` varchar(200) DEFAULT NULL COMMENT '商品title',
  `img_uri` varchar(300) DEFAULT NULL COMMENT '商品主图',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `threshold` int(11) DEFAULT NULL COMMENT '库存阈值',
  `type` tinyint(4) DEFAULT NULL COMMENT '报警状态 1 库存大于零小于阈值 2 库存为0 ',
  `change_time` datetime DEFAULT NULL,
  `feature` varchar(500) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_skuId` (`skuId`)
) ENGINE=InnoDB AUTO_INCREMENT=21184962 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = store_group_base_info   */
/******************************************/
CREATE TABLE `store_group_base_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL COMMENT '门店组名称',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `allow_use_system` varchar(100) DEFAULT NULL COMMENT '允许使用的系统：1-促销系统、2-优惠券系统、3-采销平台_销补',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性 1:有效 -1:无效',
  `applier` varchar(60) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(60) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idex_vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COMMENT='门店组基本信息';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = store_group_member   */
/******************************************/
CREATE TABLE `store_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '门店组id',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性 1:有效 -1:无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8303 DEFAULT CHARSET=utf8 COMMENT='门店组成员表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = switch_shop_approval_form   */
/******************************************/
CREATE TABLE `switch_shop_approval_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `shop_ids` varchar(100) NOT NULL COMMENT '门店id集合',
  `switch_start_date` date NOT NULL COMMENT '切店起始时间',
  `switch_end_date` date NOT NULL COMMENT '切店结束时间',
  `online_system` tinyint(1) NOT NULL COMMENT '上线系统 1.OS 2.MiniOS',
  `auditors` varchar(20) DEFAULT NULL COMMENT '审核人',
  `submitter_id` int(11) NOT NULL COMMENT '提交人id',
  `submitter` varchar(20) NOT NULL COMMENT '提交人',
  `status` tinyint(1) NOT NULL COMMENT '状态 1.审批中 2.审批驳回 3.审批完成 4.清理中 5.清理失败 6.清理完成',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = switch_shop_audit_record   */
/******************************************/
CREATE TABLE `switch_shop_audit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `form_id` int(11) NOT NULL COMMENT '审批单id',
  `deal_suggestion` varchar(50) DEFAULT NULL COMMENT '审批意见',
  `auditor_id` int(11) DEFAULT NULL,
  `auditor` varchar(50) DEFAULT NULL COMMENT '审批人',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `scene_id` int(11) DEFAULT NULL COMMENT '场景id',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 1.通过 -1驳回',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5383 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = switch_shop_clear_record   */
/******************************************/
CREATE TABLE `switch_shop_clear_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `form_id` int(11) DEFAULT NULL COMMENT '审批单id',
  `system_code` tinyint(2) NOT NULL COMMENT '系统标识',
  `status` tinyint(2) NOT NULL COMMENT '清理状态 1..清理中 2.清理完成 3.清理失败',
  `operator_id` int(11) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL COMMENT '清理人',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `clear_complete_time` datetime DEFAULT NULL COMMENT '完成清理时间',
  `yn` tinyint(1) DEFAULT '1' COMMENT '是否有效 1有效 -1无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = tag   */
/******************************************/
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL COMMENT '打标code（1,2,4,8...）',
  `description` varchar(255) DEFAULT NULL COMMENT '打标描述',
  `type` int(4) DEFAULT NULL COMMENT '打标位置（1门店商品 2商品主数据）',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = temp_hdbj_66   */
/******************************************/
CREATE TABLE `temp_hdbj_66` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hd_rf_id` varchar(10) DEFAULT NULL COMMENT '华东物料编号',
  `bj_rf_id` varchar(10) DEFAULT NULL COMMENT '北京物料编号',
  PRIMARY KEY (`id`),
  KEY `hd_rf_id_idx` (`hd_rf_id`),
  KEY `bj_rf_id_idx` (`bj_rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83937 DEFAULT CHARSET=utf8 COMMENT='临时表 华东华北物料映射 6变换6';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = user_table_custom_config   */
/******************************************/
CREATE TABLE `user_table_custom_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `data_type` varchar(20) NOT NULL COMMENT '数据类型（ 自定义筛选条件FILTER， 自定义展示列COLUMN）',
  `page_name` varchar(50) NOT NULL COMMENT '页面名称枚举',
  `custom_config` json DEFAULT NULL COMMENT '用户自定义配置：json格式',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_account` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_vender_data_type` (`user_id`,`vender_id`,`data_type`,`page_name`) USING BTREE COMMENT '用户商家配置唯一键',
  KEY `idx_vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2833002 DEFAULT CHARSET=latin1 COMMENT='自定义列配置(用户商家维度)';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_base_property_value   */
/******************************************/
CREATE TABLE `vender_base_property_value` (
  `property_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性库属性值ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `child_property_id` int(11) DEFAULT NULL COMMENT '子属性ID，备用字段',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `value_data` varchar(100) NOT NULL COMMENT '属性库属性值',
  `value_data_en` varchar(100) NOT NULL COMMENT '属性库属性英文值',
  `group_id` int(11) DEFAULT NULL COMMENT '属性值分组ID，来自property_group表',
  `features` varchar(255) DEFAULT NULL COMMENT '键值对，扩展字段',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态0=停用 1=启用',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '最后修改时间',
  `cat_id` int(11) NOT NULL COMMENT '后台类目ID',
  PRIMARY KEY (`property_value_id`),
  UNIQUE KEY `vender_value_data` (`vender_id`,`cat_id`,`property_id`,`value_data`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `property_value_id` (`property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1609322 DEFAULT CHARSET=utf8 COMMENT='商家自定义数据值';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_brand   */
/******************************************/
CREATE TABLE `vender_brand` (
  `vender_brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家品牌编号',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家编号',
  `vender_brand_name` varchar(128) NOT NULL COMMENT '商家品牌名称',
  `vender_brand_code` varchar(128) NOT NULL COMMENT '商家品牌编码',
  `status` int(4) DEFAULT NULL COMMENT '状态',
  `reviser` varchar(512) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `yn` int(4) DEFAULT NULL COMMENT '数据有效性 1 有效',
  PRIMARY KEY (`vender_brand_id`),
  UNIQUE KEY `unidx_vender_brand_code` (`vender_id`,`vender_brand_code`),
  KEY `idx_vender_brand_name` (`vender_id`,`vender_brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1064042 DEFAULT CHARSET=utf8 COMMENT='商家品牌表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_cat_small_property   */
/******************************************/
CREATE TABLE `vender_cat_small_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `cat_id` int(11) NOT NULL COMMENT '商家小分类类目ID',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `property_type` varchar(50) NOT NULL COMMENT '属性类型\r\nNORMAL 销售属性\r\nSPECIAL 关键属性',
  `required` varchar(50) NOT NULL COMMENT '是否必选\r\nOPTIONAL可选\r\nREQUIRED 必选\r\n',
  `input_type` varchar(50) NOT NULL COMMENT '输入类型，\r\nRADIO 单选\r\nCHECKBOX 多选\r\nINPUT 输入',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` varchar(50) NOT NULL COMMENT '状态\r\nNORMAL 正常\r\nDISABLE 禁用\r\nDELETED 删除',
  `data_type` varchar(50) NOT NULL DEFAULT 'TEXT' COMMENT '数据类型，TEXT文本类型，DIGIT数字类型',
  `unit` varchar(100) DEFAULT NULL COMMENT '单位',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1672282 DEFAULT CHARSET=utf8 COMMENT='商家小分类属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_cat_small_property_value   */
/******************************************/
CREATE TABLE `vender_cat_small_property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cat_prop_id` int(11) NOT NULL COMMENT '小分类目属性ID',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `cat_id` int(11) NOT NULL COMMENT '商家小分类类目ID',
  `property_id` int(11) NOT NULL COMMENT '属性库属性ID',
  `property_value_id` int(11) NOT NULL COMMENT '属性库属性值ID',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `status` varchar(50) NOT NULL COMMENT '状态\r\nNORMAL 正常\r\nDISABLE 禁用\r\nDELETED 删除',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`) USING BTREE,
  KEY `idx_cat_prop_id` (`cat_prop_id`) USING BTREE,
  KEY `idx_cat_id` (`cat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29682 DEFAULT CHARSET=utf8 COMMENT='商家小分类属性值表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_category   */
/******************************************/
CREATE TABLE `vender_category` (
  `vender_cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家类目id',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `outer_cat_id` varchar(50) NOT NULL COMMENT '商家外部类目ID',
  `cat_name` varchar(200) DEFAULT NULL COMMENT '类目名称',
  `cat_image` varchar(200) DEFAULT NULL COMMENT '类目图片URL',
  `cat_level` int(11) DEFAULT NULL COMMENT '类目级别',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类目id',
  `feature` varchar(400) DEFAULT NULL COMMENT '扩展字段',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否上柜0=下柜,1=上柜',
  `sort_order` int(11) DEFAULT NULL COMMENT '排序',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`vender_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9919 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_category_config   */
/******************************************/
CREATE TABLE `vender_category_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `status` tinyint(4) NOT NULL COMMENT '是否启用1：启用商家后台类目，0：不启用商家后台类目',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `vender_id` (`vender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家后台配置配置表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_config   */
/******************************************/
CREATE TABLE `vender_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效 1 有效，-1 删除',
  `config_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置类型',
  `config_data` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_vender_id_config_type` (`vender_id`,`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商家配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_matnr_map   */
/******************************************/
CREATE TABLE `vender_matnr_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '原商家Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '原skuId',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '原物料编码',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `ref_rf_id` varchar(200) DEFAULT NULL COMMENT '映射物料编码',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT 'yn',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6832 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vender_matnr_map_lk   */
/******************************************/
CREATE TABLE `vender_matnr_map_lk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '原商家Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '原skuId',
  `rf_id` varchar(100) DEFAULT NULL COMMENT '原物料编码',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `ref_rf_id` varchar(100) DEFAULT NULL COMMENT '映射物料编码',
  `supplier_code` varchar(100) DEFAULT NULL COMMENT '供应商卡号',
  `applier` varchar(50) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(50) DEFAULT NULL COMMENT '修改人',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT 'yn',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vender_refrf_supplier` (`vender_id`,`ref_rf_id`,`supplier_code`) USING BTREE,
  UNIQUE KEY `unique_vender_rf_id` (`vender_id`,`rf_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=343722 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = vendor   */
/******************************************/
CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `vendor_full_name` varchar(500) NOT NULL COMMENT '供应商全称',
  `vendor_short_name` varchar(500) DEFAULT NULL COMMENT '供应商简称',
  `vendor_card_code` varchar(50) DEFAULT NULL COMMENT '供应商卡片编码',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(17) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(1000) DEFAULT NULL COMMENT '地址',
  `emaill` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `cooperate` tinyint(4) DEFAULT NULL COMMENT '是否合作: 1为合作，-1为终止',
  `vendor_type` tinyint(4) DEFAULT NULL COMMENT '供应商类型',
  `tax_type` varchar(20) DEFAULT NULL COMMENT '税类型',
  `is_wave_manager` tinyint(4) DEFAULT NULL COMMENT '是否支持波次管理,1=支持,-1或null=不支持',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_ad   */
/******************************************/
CREATE TABLE `ware_ad` (
  `ware_id` int(11) NOT NULL COMMENT '商品Id',
  `ad` varchar(250) DEFAULT NULL COMMENT '广告词',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `ad_url` varchar(500) DEFAULT NULL COMMENT '广告语url',
  `link_desc` varchar(255) DEFAULT NULL COMMENT '链接文字',
  `promotion_ad` varchar(255) DEFAULT NULL COMMENT '促销广告语',
  `promotion_link_desc` varchar(255) DEFAULT NULL COMMENT '促销链接文字',
  `promotion_ad_url` varchar(255) DEFAULT NULL COMMENT '促销广告语URL',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销语生效起始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销语生效结束时间',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品广告语';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_album   */
/******************************************/
CREATE TABLE `ware_album` (
  `album_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '相册编号',
  `item_num` varchar(50) NOT NULL COMMENT '商品国条码',
  `album_type` int(2) NOT NULL COMMENT '相册类型{1：图册集，2：视频集，3：商详信息}',
  `album_name` varchar(256) NOT NULL COMMENT '对应相册类型名称',
  `album_all_num` int(4) DEFAULT NULL COMMENT '对应相册包含记录数量',
  `album_eff_num` int(4) DEFAULT NULL COMMENT '对应相册包含有效记录数量',
  `created` datetime DEFAULT NULL COMMENT '相册创建日期',
  `modified` datetime DEFAULT NULL COMMENT '相册修改日期',
  `yn` int(3) NOT NULL COMMENT '相册记录有效性,-1:无效,1:有效',
  PRIMARY KEY (`album_id`),
  KEY `idx_album_name` (`album_name`(100)),
  KEY `idx_item_num` (`item_num`),
  KEY `idx_item_album_type` (`item_num`,`album_type`)
) ENGINE=InnoDB AUTO_INCREMENT=36602 DEFAULT CHARSET=utf8mb4 COMMENT='商品相册(图片、视频、商详)';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_album_picture   */
/******************************************/
CREATE TABLE `ware_album_picture` (
  `picture_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `album_id` int(16) NOT NULL COMMENT '相册编号',
  `item_num` varchar(50) NOT NULL COMMENT '商品国条码',
  `album_name` varchar(256) NOT NULL COMMENT '图册名称',
  `picture_name` varchar(256) NOT NULL COMMENT '图片名称',
  `is_main_img` int(2) DEFAULT NULL COMMENT '是否为主图 0：不是主图，1：是主图',
  `img_uri` varchar(300) NOT NULL COMMENT '图片地址',
  `current_img_num` int(4) DEFAULT NULL COMMENT '当前有效主图相关组包含图片数量',
  `group_tag` varchar(256) DEFAULT NULL COMMENT '不同图片组标记',
  `created` datetime DEFAULT NULL COMMENT '图片创建日期',
  `modified` datetime DEFAULT NULL COMMENT '图片修改日期',
  `yn` int(3) NOT NULL COMMENT '图片记录有效性,-1:无效,1:有效',
  PRIMARY KEY (`picture_id`),
  KEY `idx_ablum_id` (`album_id`),
  KEY `idx_album_name` (`album_name`(100)),
  KEY `idx_item_num` (`item_num`)
) ENGINE=InnoDB AUTO_INCREMENT=129423 DEFAULT CHARSET=utf8mb4 COMMENT='商品相册的图片部分';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_attr_op_log   */
/******************************************/
CREATE TABLE `ware_attr_op_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `op_time` datetime NOT NULL COMMENT '最近一次操作的时间',
  `op_user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '最近一次操作人id',
  `op_user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '最近一次操作人姓名',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `ware_id` bigint(20) NOT NULL COMMENT '商品主键id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku主键id',
  `rf_id` varchar(200) NOT NULL DEFAULT '',
  `log_content` json NOT NULL,
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1有效，-1 无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_idx_sku_id` (`sku_id`) USING BTREE COMMENT 'sku唯一索引，一个sku只需要一条记录'
) ENGINE=InnoDB AUTO_INCREMENT=89775603 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性操作记录';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_base_status   */
/******************************************/
CREATE TABLE `ware_base_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `status_code` varchar(5) NOT NULL COMMENT '商品状态编码',
  `status_name` varchar(10) NOT NULL COMMENT '商品状态名称',
  `order_able` tinyint(1) NOT NULL COMMENT '是否允许自动补货 1-是 0-否',
  `return_able` tinyint(1) NOT NULL COMMENT '是否可以退货 1-是 0-否',
  `shop_allot_able` tinyint(1) NOT NULL COMMENT '是否可以门店间调拨  1-是 0-否',
  `sale_return_able` tinyint(1) NOT NULL COMMENT '是否可以销售退货 1-是 0-否',
  `exhibit_able` tinyint(1) NOT NULL COMMENT '是否陈列 1-是 0-否',
  `is_shop_default` tinyint(1) NOT NULL COMMENT '是否门店商品默认状态 1-是 0-否',
  `manual_match_able` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许门店手工匹货 1-是 0-否',
  `promotion_able` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许促销品补货 1-是 0-否',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性 1-有效 0-无效',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(50) DEFAULT NULL COMMENT '更新人',
  `price_chg_able` tinyint(1) NOT NULL DEFAULT '1' COMMENT '总部调价是否可覆盖',
  `is_cancel_cfg_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否取消配置默认状态 1-是 0-否',
  `hc_manual_match_able` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许总部手工补货 1-是 0-否, hc=head company',
  `client_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否前端显示 1-是 0-否',
  `sale_able` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以销售 1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_vender_code` (`vender_id`,`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=25922 DEFAULT CHARSET=utf8 COMMENT='商品基础状态表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_business_type   */
/******************************************/
CREATE TABLE `ware_business_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `sku_id` int(11) DEFAULT NULL COMMENT 'SKUid',
  `business_type` int(11) DEFAULT NULL COMMENT '业态0：无，8：智，16：F，24：智F',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` tinyint(4) DEFAULT NULL,
  `rf_id` varchar(100) DEFAULT NULL COMMENT '物料编码',
  PRIMARY KEY (`id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149203 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_cache_result   */
/******************************************/
CREATE TABLE `ware_cache_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `check_version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '检测的时间',
  `group_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分组Key',
  `group_key_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分组key的类型',
  `cache_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缓存的名称',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表名称',
  `table_count` bigint(32) NOT NULL DEFAULT '0' COMMENT '数据库中数量',
  `redis_count` bigint(32) NOT NULL DEFAULT '0' COMMENT 'redis中数量',
  `table_sku_count` int(32) DEFAULT '0' COMMENT '数据库sku抽样数量',
  `api_sku_count` int(32) DEFAULT '0' COMMENT 'api查询sku匹配上数量',
  `success` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否成功',
  `switch_status` int(32) DEFAULT '0' COMMENT '是否进行切换',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `check_version` (`check_version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=273005242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='缓存数据校验结果表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_cache_route   */
/******************************************/
CREATE TABLE `ware_cache_route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `vender_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商家名称',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `can_write` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可以写缓存，1表示可以写，0表示不可以写',
  `can_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '可以读缓存， 1表示可以读，0表示不可以读',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1，有效，0无效',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `vender_id` (`vender_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品缓存路由表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_certificate   */
/******************************************/
CREATE TABLE `ware_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ware_id` int(11) NOT NULL COMMENT '商品ID',
  `sku_id` int(11) NOT NULL COMMENT 'skuId',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `rf_id` varchar(200) NOT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `certificate_type` tinyint(3) DEFAULT NULL COMMENT '证件类型 1.检测报告',
  `certificate_no` varchar(128) DEFAULT NULL COMMENT '证件号码',
  `certificate_office` varchar(128) DEFAULT NULL COMMENT '发证机关',
  `certificate_date` datetime DEFAULT NULL COMMENT '发证日期',
  `expire_date` datetime DEFAULT NULL COMMENT '有效期',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_ware_id` (`ware_id`),
  KEY `idx_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158642 DEFAULT CHARSET=utf8 COMMENT='商品证照信息';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_code_length   */
/******************************************/
CREATE TABLE `ware_code_length` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `code_type` tinyint(4) NOT NULL COMMENT '编码类型1商品编码 2商品PLU码',
  `code_length` int(11) NOT NULL COMMENT '编码长度',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_code_type` (`vender_id`,`code_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='编码长度配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_code_rule   */
/******************************************/
CREATE TABLE `ware_code_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `start_code` varchar(100) NOT NULL COMMENT '起始号',
  `end_code` varchar(100) NOT NULL COMMENT '终止号',
  `current_code` varchar(100) DEFAULT NULL COMMENT '当前号',
  `external_set_flag` tinyint(4) NOT NULL COMMENT '是否外部指定 0系统生成 1外部指定',
  `code_type` tinyint(4) NOT NULL COMMENT '编码类型1商品编码 2商品PLU码',
  `ware_type_list` varchar(200) DEFAULT NULL COMMENT '商品类型列表，用逗号隔开。',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_vender_code_type` (`vender_id`,`code_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='编码规则配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_describe_picture   */
/******************************************/
CREATE TABLE `ware_describe_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '预留：店铺ID',
  `img_uri` varchar(300) DEFAULT NULL COMMENT '图片京东地址',
  `original_imguri` varchar(300) DEFAULT NULL COMMENT '图片原始地址',
  `status` tinyint(4) DEFAULT NULL COMMENT '-1、删除 0、无效 1、有效',
  `index_id` int(11) DEFAULT NULL COMMENT '排序，越小越靠前',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型:1：商家主动上传 2：程序自动抓取',
  `kb_size` int(11) DEFAULT NULL COMMENT '图片大小 只精确到KB',
  `created` date DEFAULT NULL COMMENT '创建时间',
  `modified` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述中的外链图片存储';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_ext   */
/******************************************/
CREATE TABLE `ware_ext` (
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `cubage` varchar(30) DEFAULT NULL COMMENT '长*宽*高',
  `pack_info` varchar(300) DEFAULT NULL COMMENT '包装清单',
  `net_weight` decimal(11,3) DEFAULT NULL COMMENT '商品净重',
  `weight` decimal(11,3) DEFAULT NULL COMMENT '商品毛重',
  `pack_long` decimal(11,3) DEFAULT NULL COMMENT '包装长度',
  `pack_wide` decimal(11,3) DEFAULT NULL COMMENT '包装宽度',
  `pack_height` decimal(11,3) DEFAULT NULL COMMENT '包装高度',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sku_id` int(11) NOT NULL COMMENT 'skuId',
  `tax_cat_no` varchar(255) DEFAULT NULL COMMENT '国税分类编码',
  `packing_name` varchar(64) DEFAULT NULL COMMENT '包装单位名称',
  `spec_qty` varchar(64) DEFAULT NULL COMMENT '规格数量',
  `spec_unit` varchar(32) DEFAULT NULL COMMENT '规格单位',
  `wares_emc` varchar(64) DEFAULT NULL COMMENT '商品EMC',
  `manufacturer` varchar(64) DEFAULT NULL COMMENT '生产厂家',
  `grade` varchar(32) DEFAULT NULL COMMENT '等级',
  `warning_shelf_life` int(11) DEFAULT NULL COMMENT '预警保质期',
  `eatting_type` varchar(128) DEFAULT NULL COMMENT '食用方式',
  `material_detail` varchar(512) DEFAULT NULL COMMENT '原料说明',
  `purchase_receive_radio` decimal(10,3) DEFAULT NULL COMMENT '采购收货比例',
  `produce_area` varchar(256) DEFAULT NULL COMMENT '产地',
  `yn` smallint(4) DEFAULT NULL,
  `estimate_type` varchar(255) DEFAULT NULL COMMENT '评估类编码（枚举类来自rdp配置中心)',
  `ware_type_code` varchar(255) DEFAULT 'TRA' COMMENT '商品类型编码（枚举类来自rdp配置中心)',
  `storage` varchar(255) DEFAULT NULL COMMENT '存储条件',
  `factory_site` varchar(256) DEFAULT NULL COMMENT '厂址',
  `telephone` varchar(256) DEFAULT NULL COMMENT '电话',
  `can_fill_manufacture_date` smallint(4) DEFAULT '0' COMMENT '是否必填生产日期：1、是；0、否',
  `vender_id` int(10) DEFAULT NULL COMMENT '商家ID',
  `ext_json` json DEFAULT NULL COMMENT '扩展属性',
  `include_num` varchar(50) DEFAULT NULL COMMENT '记录商品内包装的数量描述',
  `pu_code` varchar(100) GENERATED ALWAYS AS (json_extract(`ext_json`,'$.puCode')) VIRTUAL,
  `tax_cat_source` varchar(20) DEFAULT NULL COMMENT '国税码分类来源,WARE商品本身、CLASSIFY小分类',
  `article_no` varchar(255) GENERATED ALWAYS AS (json_unquote(json_extract(`ext_json`,'$.articleNo'))) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sku_id` (`sku_id`),
  KEY `index_ware_id` (`ware_id`),
  KEY `idx_vender_pucode` (`vender_id`,`pu_code`),
  KEY `idx_vender_articleno` (`vender_id`,`article_no`)
) ENGINE=InnoDB AUTO_INCREMENT=249662922 DEFAULT CHARSET=utf8 COMMENT='商品扩展表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_ext_content   */
/******************************************/
CREATE TABLE `ware_ext_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `yn` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效:1有效，-1无效',
  `rf_id` varchar(100) NOT NULL COMMENT '商品物料码',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `extra_content` json DEFAULT NULL COMMENT '扩展属性json字段',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vender_id_rf_id` (`vender_id`,`rf_id`),
  UNIQUE KEY `uk_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2694482 DEFAULT CHARSET=utf8mb4 COMMENT='商品自定义扩展属性表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_init_msg   */
/******************************************/
CREATE TABLE `ware_init_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `rf_id` varchar(50) DEFAULT NULL COMMENT '物料编码',
  `out_biz_no` varchar(50) NOT NULL COMMENT '外部业务单号',
  `biz_type` varchar(20) NOT NULL COMMENT '业务类型',
  `biz_data` json DEFAULT NULL COMMENT '业务数据',
  `biz_status` varchar(10) NOT NULL COMMENT '业务状态',
  `biz_sub_status` varchar(20) DEFAULT NULL COMMENT '业务子状态',
  `error_msg` varchar(255) DEFAULT NULL COMMENT '错误消息',
  `retry_times` int(10) DEFAULT '0' COMMENT '重试次数',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uk` (`out_biz_no`,`biz_type`) USING BTREE,
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2664562 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品初始化消息';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_load_rule   */
/******************************************/
CREATE TABLE `ware_load_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) DEFAULT '' COMMENT '商家名称',
  `filter_type` smallint(6) DEFAULT NULL COMMENT '0:全部 1：白名单 -1：黑名单',
  `shoplist` varchar(1000) DEFAULT NULL COMMENT '门店列表',
  `ware_tag` int(11) DEFAULT '512' COMMENT '商品打标',
  `daily_update` tinyint(4) DEFAULT '0' COMMENT '是否每日更新0否 1是',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `notes` varchar(255) DEFAULT '' COMMENT '备注',
  `applier` varchar(60) DEFAULT '' COMMENT '创建者',
  `retractor` varchar(60) DEFAULT '0' COMMENT '取消人',
  `status` tinyint(6) NOT NULL DEFAULT '0' COMMENT '0:已取消  1:已创建 2:已审核 3:已生效',
  `effector` varchar(60) DEFAULT NULL COMMENT '生效人',
  `canceled` datetime DEFAULT NULL COMMENT '取消时间',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `inx_venderid` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8 COMMENT='库存定时导入规则表 人员id来自系统';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_matnr_item_num   */
/******************************************/
CREATE TABLE `ware_matnr_item_num` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `matnr` varchar(200) NOT NULL COMMENT '物料编码',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuId',
  `item_num` varchar(50) NOT NULL COMMENT '国条码',
  `main_item_num` smallint(4) DEFAULT '0' COMMENT '是否是主国条(1 是 0 否)',
  `ratio` int(11) DEFAULT '1' COMMENT '系数',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL,
  `package_id` varchar(40) DEFAULT NULL COMMENT '包装id',
  `can_sale` smallint(6) DEFAULT '1' COMMENT '可否销售',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_wmi_vender_matnr_itemnum` (`vender_id`,`matnr`,`item_num`),
  KEY `index_wmi_matnr` (`matnr`),
  KEY `index_wmi_item_num` (`item_num`),
  KEY `index_sku_id` (`sku_id`),
  KEY `idx_vender_item_num` (`vender_id`,`item_num`,`yn`) USING BTREE COMMENT '商家国条'
) ENGINE=InnoDB AUTO_INCREMENT=407736122 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_matnr_item_num_bak0201   */
/******************************************/
CREATE TABLE `ware_matnr_item_num_bak0201` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `matnr` varchar(200) NOT NULL COMMENT '物料编码',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuId',
  `item_num` varchar(50) NOT NULL COMMENT '国条码',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_wmi_vender_matnr_itemnum` (`vender_id`,`matnr`,`item_num`),
  KEY `index_wmi_matnr` (`matnr`),
  KEY `index_wmi_item_num` (`item_num`),
  KEY `index_wmi_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3281 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_matnr_item_num_bak0802   */
/******************************************/
CREATE TABLE `ware_matnr_item_num_bak0802` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `matnr` varchar(200) NOT NULL COMMENT '物料编码',
  `sku_id` int(11) DEFAULT NULL COMMENT 'skuId',
  `item_num` varchar(50) NOT NULL COMMENT '国条码',
  `main_item_num` smallint(4) DEFAULT '0' COMMENT '是否是主国条(1 是 0 否)',
  `ratio` int(11) DEFAULT '1' COMMENT '系数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `yn` smallint(6) DEFAULT NULL COMMENT '逻辑删除位',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_wmi_vender_matnr_itemnum` (`vender_id`,`matnr`,`item_num`),
  KEY `index_wmi_matnr` (`matnr`),
  KEY `index_wmi_item_num` (`item_num`),
  KEY `index_wmi_yn` (`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=2732648 DEFAULT CHARSET=utf8 COMMENT='ware_matnr_item_num';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_mc_rule   */
/******************************************/
CREATE TABLE `ware_mc_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) DEFAULT '' COMMENT '商家名称',
  `mc_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '商家mcId',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `reviewed` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `canceled` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '取消时间',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `status` tinyint(6) DEFAULT '0' COMMENT '0:已取消  1:已创建 2:已审核 3:已生效',
  `actual_start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '实际生效时间',
  `applier` varchar(60) DEFAULT '' COMMENT '创建者',
  `reviewer` varchar(60) DEFAULT '' COMMENT '审核人',
  `effector` varchar(60) DEFAULT '' COMMENT '生效人',
  `notes` varchar(255) DEFAULT '' COMMENT '备注',
  `feature` varchar(20) DEFAULT '' COMMENT '扩展字段',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改(更新)时间',
  `retractor` varchar(60) DEFAULT '' COMMENT '取消人',
  `actual_start_type` tinyint(4) DEFAULT '0' COMMENT '1:正常生效，2：立即生效',
  `worker_status` int(11) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。',
  PRIMARY KEY (`id`),
  KEY `inx_mcid` (`mc_id`),
  KEY `inx_venderid` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='商家MC层级库存不同步规则表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_online_sync_config   */
/******************************************/
CREATE TABLE `ware_online_sync_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ware_id` bigint(20) NOT NULL COMMENT 'ware_id',
  `sync_time` timestamp NULL DEFAULT NULL COMMENT '同步时间',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31474402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_onway_stock_rule   */
/******************************************/
CREATE TABLE `ware_onway_stock_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) DEFAULT '' COMMENT '商家名称',
  `filter_type` smallint(6) DEFAULT NULL COMMENT '0:全部 1：白名单 -1：黑名单',
  `shoplist` varchar(1000) DEFAULT NULL COMMENT '门店列表',
  `start_time` time DEFAULT NULL COMMENT '运行周期开始时间',
  `end_time` time DEFAULT NULL COMMENT '运行周期结束时间',
  `ratio` smallint(3) DEFAULT '35' COMMENT '同步库存系数',
  `notes` varchar(255) DEFAULT '' COMMENT '备注',
  `applier` varchar(60) DEFAULT '' COMMENT '创建者',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `reviser` varchar(60) DEFAULT '0' COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `canceled` datetime DEFAULT NULL COMMENT '取消时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COMMENT='在途库存规则';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_onway_stock_rule_sku   */
/******************************************/
CREATE TABLE `ware_onway_stock_rule_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id 对应(ware_onway_stock_rule)表的id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品id',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效：-1无效 1有效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `stock_rule` tinyint(255) NOT NULL DEFAULT '1' COMMENT '0:售卖在途库存;1:售卖在途库存+门店库存',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rule_skuid` (`rule_id`,`sku_id`),
  KEY `idx_ruleid` (`rule_id`),
  KEY `idx_venderid` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100322 DEFAULT CHARSET=utf8 COMMENT='在途库存商品记录';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price   */
/******************************************/
CREATE TABLE `ware_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '价格ID',
  `ware_id` int(11) NOT NULL COMMENT '商品 ID',
  `min_count` int(11) DEFAULT NULL COMMENT '商品数量下限',
  `max_count` int(11) DEFAULT NULL COMMENT '商品数量上限',
  `ware_price` decimal(10,5) NOT NULL COMMENT '商品价格',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品阶梯价格表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price_log   */
/******************************************/
CREATE TABLE `ware_price_log` (
  `shop_id` int(11) NOT NULL COMMENT '门店ID',
  `matnr` varchar(45) NOT NULL COMMENT '物料编号、商品码和商品主码',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `online_price` decimal(10,2) DEFAULT NULL COMMENT '线上价格',
  `corner_tag_source` varchar(50) DEFAULT NULL COMMENT '角标打标来源',
  `price_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '价格变更时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态(0:未被同步处理,1:已被同步处理)',
  PRIMARY KEY (`shop_id`,`matnr`),
  KEY `idx_created` (`created`),
  KEY `idx_matnr_vender_id` (`matnr`,`vender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品价格日志表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price_rule   */
/******************************************/
CREATE TABLE `ware_price_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `vender_name` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `locked_price` decimal(10,2) DEFAULT NULL COMMENT '锁定价格',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态(0:过期后还未被worker处理过,1:过期后已被worker处理过)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `matnr` varchar(200) DEFAULT NULL COMMENT '物料ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `yn` tinyint(4) DEFAULT NULL COMMENT '锁定状态(1:锁定,-1:取消锁定/删除)',
  `transaction_id` varchar(100) DEFAULT NULL COMMENT '业务调用方的唯一交易号',
  `platform_code` varchar(100) DEFAULT NULL COMMENT '调用方平台code',
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`),
  KEY `idx_modified` (`modified`),
  KEY `idx_matnr_vid` (`matnr`,`vender_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14462883 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price_rule_20200930   */
/******************************************/
CREATE TABLE `ware_price_rule_20200930` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `vender_name` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `locked_price` decimal(10,2) DEFAULT NULL COMMENT '锁定价格',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态(0:过期后还未被worker处理过,1:过期后已被worker处理过)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `matnr` varchar(200) DEFAULT NULL COMMENT '物料ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `yn` tinyint(4) DEFAULT NULL COMMENT '锁定状态(1:锁定,-1:取消锁定/删除)',
  `transaction_id` varchar(100) DEFAULT NULL COMMENT '业务调用方的唯一交易号',
  `platform_code` varchar(100) DEFAULT NULL COMMENT '调用方平台code',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`),
  KEY `idx_modified` (`modified`),
  KEY `idx_matnr_vid` (`matnr`,`vender_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4585683 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price_rule_bk   */
/******************************************/
CREATE TABLE `ware_price_rule_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `vender_name` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `locked_price` decimal(10,2) DEFAULT NULL COMMENT '锁定价格',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态(0:过期后还未被worker处理过,1:过期后已被worker处理过)',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '最后修改时间',
  `matnr` varchar(200) DEFAULT NULL COMMENT '物料ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `yn` tinyint(4) DEFAULT NULL COMMENT '锁定状态(1:锁定,-1:取消锁定/删除)',
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`),
  KEY `idx_modified` (`modified`),
  KEY `idx_matnr_vid` (`matnr`,`vender_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_vender_yn_stime_etime` (`vender_id`,`yn`,`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=799476 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_price_specialty_logic   */
/******************************************/
CREATE TABLE `ware_price_specialty_logic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `matnr` varchar(200) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `old_price_time` datetime DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL COMMENT '最新价格',
  `new_price_time` datetime DEFAULT NULL,
  `mem_price` decimal(10,2) DEFAULT NULL COMMENT '会员价',
  `mem_price_time` datetime DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shop_id_matnr` (`matnr`,`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40802233 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_publish   */
/******************************************/
CREATE TABLE `ware_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '单据ID（唯一标识）',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商品编码',
  `ware_type_code` varchar(255) DEFAULT NULL COMMENT '商品类型编码（枚举类来自RDP配置中心TRA,PDU)',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类别，0普通，1母规格，2子规格，11组合商品，12加工商品',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称 对应wm的sap的MAKTM',
  `matkl` varchar(64) DEFAULT NULL COMMENT '商品分类MC ',
  `mwskz_name` varchar(45) DEFAULT NULL COMMENT '税目名称',
  `mwskz` varchar(45) DEFAULT NULL COMMENT '税代码',
  `brand_id` int(11) DEFAULT NULL COMMENT '商品品牌id',
  `weight` tinyint(4) DEFAULT NULL COMMENT '是否是称重商品',
  `basic_unit` varchar(20) DEFAULT NULL COMMENT '基本单位',
  `chine` varchar(45) DEFAULT NULL COMMENT '基本单位描述',
  `storage_type` tinyint(3) DEFAULT NULL COMMENT '储存温层 1.常温,2.冷冻,3.冷藏',
  `estimate_type` varchar(255) DEFAULT NULL COMMENT '评估类编码（枚举类来自RDP配置中心)',
  `produce_area` varchar(256) DEFAULT NULL COMMENT '产地',
  `can_fill_manufacture_date` smallint(4) DEFAULT NULL COMMENT '是否必填生产日期：1、是；0、否',
  `spec_qty` varchar(20) DEFAULT NULL COMMENT '规格数量',
  `spec_unit` varchar(32) DEFAULT NULL COMMENT '规格单位',
  `ware_life` float DEFAULT NULL COMMENT '保质期(天)',
  `ware_life_unit` tinyint(4) DEFAULT '1' COMMENT '保质期单位（1：天；2：小时）',
  `warning_shelf_life` int(11) DEFAULT NULL COMMENT '预警保质期',
  `status` tinyint(3) NOT NULL COMMENT '单据状态（1、草稿；2、审核中；3、审核通过；4、驳回；5、审核失败）',
  `submitter_id` bigint(20) DEFAULT NULL COMMENT '提交人id',
  `submitter` varchar(50) DEFAULT NULL COMMENT '提交人',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人id',
  `creater` varchar(50) DEFAULT NULL COMMENT '创建人',
  `item_nums` text COMMENT '国条码列表',
  `scale_codes` varchar(256) DEFAULT NULL COMMENT '磅秤PLU码列表',
  `reject_reason` varchar(256) DEFAULT NULL COMMENT '驳回原因',
  `fail_reason` varchar(256) DEFAULT NULL COMMENT '失败原因',
  `fail_detail` text COMMENT '失败详情链接',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `submitted` datetime DEFAULT NULL COMMENT '提交时间',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `reject_time` datetime DEFAULT NULL COMMENT '驳回时间',
  `rejectter` varchar(20) DEFAULT NULL COMMENT '驳回人',
  `reject_operation` varchar(100) DEFAULT NULL COMMENT '驳回操作名称',
  `seasonal_tag` varchar(20) DEFAULT '' COMMENT '是否季节性商品',
  `seasonal_start_month` varchar(20) DEFAULT NULL COMMENT '季节性商品开始时间',
  `seasonal_end_month` varchar(20) DEFAULT NULL COMMENT '季节性商品结束日期',
  `private_brand_tag` varchar(20) DEFAULT NULL COMMENT '自有品牌标记',
  `grade` varchar(32) DEFAULT NULL COMMENT '等级',
  `fail_time` datetime DEFAULT NULL COMMENT '同步失败时间',
  `biz_num` varchar(50) DEFAULT NULL COMMENT '单据流水号,商家下唯一',
  `change_snapshoot` json DEFAULT NULL COMMENT '商品信息变更快照',
  `type` varchar(32) DEFAULT 'ware_add' COMMENT '单据类型 ware_add:商品新增,ware_update:商品更新,默认:ware_add',
  `sync_count` tinyint(4) DEFAULT '0' COMMENT '同步次数',
  `origin` varchar(32) CHARACTER SET utf8mb4 DEFAULT 'HANDWORK' COMMENT '数据来源（HANDWORK - 手动创建，MERCHANTS - 招商下发)',
  `out_biz_no` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '外部系统单据号',
  `effect_time` datetime DEFAULT NULL COMMENT '生效时间',
  `effect_flag` tinyint(4) DEFAULT NULL COMMENT '生效状态 :0 未生效 1：已生效',
  `choose_type` tinyint(4) DEFAULT NULL COMMENT '选择类型 1：审核完成立即生效 2：指定生效时间生效',
  `gen_rf_id` varchar(100) DEFAULT NULL COMMENT '多包装关联上级物料码',
  `process_status` varchar(10) DEFAULT NULL COMMENT '处理结果，PREPARE-待处理;PROCESSING-处理中;SUCCESS-处理成功;FAILED-处理失败',
  `data_source_detail` varchar(50) DEFAULT NULL COMMENT '记录来源明细',
  `is_self` tinyint(4) DEFAULT NULL COMMENT '业务类型控制',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_bill_id` (`bill_id`),
  UNIQUE KEY `index_vender_biz_num` (`vender_id`,`biz_num`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_vender_type_matkl` (`vender_id`,`type`,`matkl`,`yn`),
  KEY `idx_type_status_effect_time` (`type`,`status`,`yn`,`effect_time`),
  KEY `idx_vender_gen_rf_id` (`vender_id`,`gen_rf_id`,`type`),
  KEY `idx_vender_choose_type` (`vender_id`,`type`,`status`,`yn`,`choose_type`,`effect_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=116534522 DEFAULT CHARSET=utf8 COMMENT='商品发布表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_publish_change   */
/******************************************/
CREATE TABLE `ware_publish_change` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家Id',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `change_type` tinyint(4) NOT NULL COMMENT '变更类型 1:门店全部设置，2：门店部分设置，3：门店部分不设置。',
  `start_time` datetime NOT NULL COMMENT '生效时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 1:未生效，2已生效，3，手动失效（只能在未生效前）',
  `actual_start_time` datetime DEFAULT NULL COMMENT '实际生效时间',
  `shopid_list` varchar(5000) DEFAULT NULL COMMENT '门店id列表，用逗号隔开。',
  `fail_shop_list` varchar(5000) DEFAULT NULL COMMENT '调价失败的门店列表。',
  `worker_status` tinyint(4) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `applier` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_task` tinyint(4) DEFAULT '0' COMMENT '是否在实际生效时间之后定时更新',
  `update_task_time` datetime DEFAULT NULL COMMENT '每日更新生效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_publish_change_sku   */
/******************************************/
CREATE TABLE `ware_publish_change_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `change_id` bigint(20) NOT NULL COMMENT '上下架变更id，对应ware_publish_change表id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家Id',
  `sku_id` bigint(20) NOT NULL COMMENT '门店Id',
  `matnr` varchar(200) DEFAULT NULL COMMENT '物料编码',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '商品wareId',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上下架状态 1:上架 -1：下架',
  `yn` smallint(6) NOT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_CHANGEID` (`change_id`),
  KEY `idx_yn` (`yn`),
  KEY `index_modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=25351842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_publish_ext   */
/******************************************/
CREATE TABLE `ware_publish_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `publish_id` int(11) NOT NULL COMMENT '商品发布表ID',
  `scale_json` json DEFAULT NULL COMMENT '磅秤信息',
  `merch_bom_json` json DEFAULT NULL COMMENT '组件信息',
  `merch_package_json` json DEFAULT NULL COMMENT '包装信息',
  `item_num_json` json DEFAULT NULL COMMENT 'EAN/UPC信息',
  `purchase_json` json DEFAULT NULL COMMENT '采购信息',
  `shelf_group_json` json DEFAULT NULL COMMENT '货架组配置信息',
  `sap_info_json` json DEFAULT NULL COMMENT '门店信息',
  `sap_price_json` json DEFAULT NULL COMMENT '门店售价信息',
  `certificate_json` json DEFAULT NULL COMMENT '证照信息',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `basic_json` json DEFAULT NULL COMMENT '基础数据信息',
  `price_group_price_json` json DEFAULT NULL COMMENT '价格群组价格信息',
  `scale_template_json` json DEFAULT NULL COMMENT '电子秤模板信息',
  `ware_additional_json` json DEFAULT NULL COMMENT '商品附加信息',
  PRIMARY KEY (`id`),
  KEY `idx_publish_id` (`publish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31908002 DEFAULT CHARSET=utf8 COMMENT='商品发布拓展信息表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_publish_sku   */
/******************************************/
CREATE TABLE `ware_publish_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `publish_id` int(11) NOT NULL COMMENT '商品发布id',
  `rf_id` varchar(100) DEFAULT NULL COMMENT '物料编码',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `attributes` varchar(200) DEFAULT NULL COMMENT '属性集合',
  `features` varchar(2000) DEFAULT NULL COMMENT 'sku特征',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `item_nums` varchar(256) DEFAULT NULL COMMENT '子规格国条码列表',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_vender_rf_id` (`vender_id`,`rf_id`),
  KEY `publish_id` (`publish_id`),
  KEY `rf_id` (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32019602 DEFAULT CHARSET=utf8 COMMENT='OS新品发布sku表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_route_strategy   */
/******************************************/
CREATE TABLE `ware_route_strategy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL,
  `ware_table_name` varchar(50) DEFAULT NULL,
  `sku_table_name` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_idx_venderId` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73402 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_safetystock_rule   */
/******************************************/
CREATE TABLE `ware_safetystock_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `mc` varchar(64) DEFAULT NULL COMMENT '线下mc分类',
  `safety_stock` int(11) DEFAULT NULL COMMENT '安全库存数',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` smallint(4) DEFAULT NULL COMMENT '是否可用',
  `log` text COMMENT '操作日志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_venderId_mc` (`vender_id`,`mc`)
) ENGINE=InnoDB AUTO_INCREMENT=1778082 DEFAULT CHARSET=utf8 COMMENT='商品库存安全规则';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sale_attr_alias   */
/******************************************/
CREATE TABLE `ware_sale_attr_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) DEFAULT NULL COMMENT '商品id',
  `sale_attr_id` int(11) DEFAULT NULL COMMENT '销售属性id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 -1删除 、0无效、1正常',
  `attr_value_alias` varchar(2000) DEFAULT NULL COMMENT '销售属性值别名组合例如 valueid1:红色;valueid2:黑色;valueid3:白色',
  `type` tinyint(4) DEFAULT NULL COMMENT '销售属性类型  3=销售属性(文字)4=销售属性(图片)',
  `features` varchar(2000) DEFAULT NULL COMMENT 'feature',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售属性别名表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_scale_code   */
/******************************************/
CREATE TABLE `ware_scale_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `sku_id` int(11) NOT NULL COMMENT 'skuid',
  `rf_id` varchar(100) NOT NULL COMMENT '物料编码',
  `scale_code` varchar(100) NOT NULL COMMENT '磅秤码,PLU码',
  `scale_ware_name` varchar(200) DEFAULT NULL COMMENT '磅秤商品名称',
  `eatting_type` varchar(128) DEFAULT NULL COMMENT '食用方式',
  `material_detail` varchar(512) DEFAULT NULL COMMENT '原料说明',
  `manufacturer` varchar(64) DEFAULT NULL COMMENT '生产厂家',
  `warning_shelf_life` int(11) DEFAULT NULL COMMENT '预警保质期',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `production_date` datetime DEFAULT NULL COMMENT '生产日期',
  `template_code` varchar(100) DEFAULT NULL COMMENT '电子秤模板编码',
  `source_item_num` varchar(50) DEFAULT NULL COMMENT '来源条码',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_vender_scale_code` (`vender_id`,`scale_code`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`),
  KEY `idx_vender_id_template_code` (`vender_id`,`template_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8052402 DEFAULT CHARSET=utf8 COMMENT='商品磅秤码信息';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sell_amount   */
/******************************************/
CREATE TABLE `ware_sell_amount` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `total_sale_amount` int(11) DEFAULT NULL COMMENT '总销售量',
  `recent_sale_amount` int(11) DEFAULT NULL COMMENT '最近销售量',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sell_package   */
/******************************************/
CREATE TABLE `ware_sell_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '商家Id',
  `vender_name` varchar(45) DEFAULT NULL COMMENT '商家名称',
  `skuId` bigint(20) DEFAULT NULL COMMENT '商品SKU',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `chine` varchar(45) DEFAULT NULL COMMENT '包装单位',
  `rate` int(5) DEFAULT NULL COMMENT '系数',
  `front_text` varchar(100) DEFAULT NULL COMMENT '前端显示文案',
  `status` smallint(6) DEFAULT NULL COMMENT '是否在用 1：正常 -1：无效',
  `is_default` smallint(6) DEFAULT NULL COMMENT '是否默认 1:是 -1 否',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_query` (`skuId`,`chine`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=328122 DEFAULT CHARSET=utf8 COMMENT='ware_sell_package';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_seo   */
/******************************************/
CREATE TABLE `ware_seo` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `keywords` varchar(300) DEFAULT NULL COMMENT '关键字，多个关键字分号隔开',
  `desc` varchar(300) DEFAULT NULL COMMENT '商品简介',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ware_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=1133668802 DEFAULT CHARSET=utf8 COMMENT='商品seo表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_service_cfg   */
/******************************************/
CREATE TABLE `ware_service_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '服务名称',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `status` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '状态Disable=停用,Normal=启用',
  `op_user_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '最后操作人id',
  `op_user_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `op_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1=删除,1有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_status` (`name`,`status`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1 COMMENT='商品附加服务';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_service_option_cfg   */
/******************************************/
CREATE TABLE `ware_service_option_cfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '选项名称',
  `order` int(11) DEFAULT NULL COMMENT '排序值',
  `service_id` bigint(20) NOT NULL COMMENT '所属服务id',
  `status` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '状态Disable=停用,Normal=启用',
  `op_user_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '最后操作人id',
  `op_user_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `op_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据修改时间',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '-1=删除,1有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_service_name_status` (`service_id`,`name`,`status`,`yn`) USING BTREE,
  KEY `idx_name_status` (`name`,`status`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1282 DEFAULT CHARSET=latin1 COMMENT='商品附加服务选项';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku   */
/******************************************/
CREATE TABLE `ware_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'skuid',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '预留：店铺id',
  `status` tinyint(4) DEFAULT NULL COMMENT ' -1、删除0、无效1、有效',
  `rf_id` varchar(100) DEFAULT NULL,
  `attributes` varchar(200) DEFAULT NULL COMMENT '销售属性集合：key:value，类似于：key id:value id^key id:value id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `stock` int(11) DEFAULT NULL COMMENT '是否有库存：1表示有，0表示无',
  `img_uri` varchar(300) DEFAULT NULL COMMENT 'SKU的主图',
  `hs_code` varchar(50) DEFAULT NULL COMMENT 'hs_code',
  `features` varchar(2000) DEFAULT NULL COMMENT 'sku特征',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ref_sku` int(11) DEFAULT NULL COMMENT 'EA主商品sku',
  `pub_name` varchar(200) DEFAULT NULL COMMENT '公共名称',
  `is_auxiliary_ware` tinyint(4) DEFAULT NULL COMMENT '是否箱规商品',
  `item_num` varchar(50) DEFAULT NULL COMMENT '子规格国条码',
  `features_alias` varchar(50) DEFAULT NULL COMMENT '别名',
  `spec_num` int(11) DEFAULT NULL COMMENT '主副商品对应规格比例',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `ea_flag` tinyint(4) DEFAULT NULL COMMENT 'EA商品标识',
  `sku_corner_sign` varchar(500) DEFAULT NULL COMMENT '角标规则',
  `video_info` varchar(2048) DEFAULT NULL COMMENT '视频信息 video_img_url 视频截图url video_url 视频链接',
  `ext_flags` json DEFAULT NULL COMMENT '扩展商品标记',
  `source` varchar(20) DEFAULT NULL COMMENT '多规格商品来源 PARTNER来客, ERP多点后台',
  `package_num` decimal(10,3) DEFAULT NULL COMMENT '多包装商品包装入数',
  `package_seq` int(11) DEFAULT NULL COMMENT '多包装商品包装序号',
  `cost_account_type` varchar(20) NOT NULL DEFAULT 'MovingAverage' COMMENT '成本记账方式；MovingAverage=移动平均;Batch=批次',
  `sub_offline_alias` varchar(255) DEFAULT NULL COMMENT '子码商品线下别名',
  `gen_rf_id` varchar(100) DEFAULT NULL COMMENT '多包装关联上级物料码',
  `en_title` varchar(255) DEFAULT '' COMMENT '商品英文名称',
  `ntgew` decimal(10,3) DEFAULT '0.000' COMMENT '净重',
  `market_time` datetime DEFAULT NULL COMMENT '上市时间',
  `origin` varchar(32) CHARACTER SET utf8mb4 DEFAULT 'HANDWORK' COMMENT '数据来源',
  `selling_point` varchar(300) DEFAULT NULL COMMENT '卖点',
  `short_name` varchar(200) DEFAULT NULL COMMENT '短名称',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `flag_info` json DEFAULT NULL COMMENT '附加信息',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `uq_idx_wid_rf_id` (`ware_id`,`rf_id`),
  KEY `index_sku_rf_id` (`rf_id`),
  KEY `index_sku_ware_id` (`ware_id`),
  KEY `idx_status` (`status`),
  KEY `index_sku_ref_sku` (`ref_sku`),
  KEY `idx_item_num` (`item_num`),
  KEY `idx_vender_id_is_auxiliary` (`vender_id`,`is_auxiliary_ware`),
  KEY `idx_spec_type` (`spec_type`) USING BTREE,
  KEY `idx_vender_id_gen_rf_id` (`vender_id`,`gen_rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212102722 DEFAULT CHARSET=utf8 COMMENT='商品sku表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku10   */
/******************************************/
CREATE TABLE `ware_sku10` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'skuid',
  `ware_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `shop_id` int(11) DEFAULT NULL COMMENT '预留：店铺id',
  `status` tinyint(4) DEFAULT NULL COMMENT ' -1、删除0、无效1、有效',
  `rf_id` varchar(100) DEFAULT NULL,
  `attributes` varchar(200) DEFAULT NULL COMMENT '销售属性集合：key:value，类似于：key id:value id^key id:value id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '供货价',
  `stock` int(11) DEFAULT NULL COMMENT '是否有库存：1表示有，0表示无',
  `img_uri` varchar(300) DEFAULT NULL COMMENT 'SKU的主图',
  `hs_code` varchar(50) DEFAULT NULL COMMENT 'hs_code',
  `features` varchar(2000) DEFAULT NULL COMMENT 'sku特征',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ref_sku` int(11) DEFAULT NULL COMMENT 'EA主商品sku',
  `pub_name` varchar(200) DEFAULT NULL COMMENT '公共名称',
  `is_auxiliary_ware` tinyint(4) DEFAULT NULL COMMENT '是否箱规商品',
  `item_num` varchar(50) DEFAULT NULL COMMENT '子规格国条码',
  `features_alias` varchar(50) DEFAULT NULL COMMENT '别名',
  `spec_num` int(11) DEFAULT NULL COMMENT '主副商品对应规格比例',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `ea_flag` tinyint(4) DEFAULT NULL COMMENT 'EA商品标识',
  `sku_corner_sign` varchar(500) DEFAULT NULL COMMENT '角标规则',
  `video_info` varchar(2048) DEFAULT NULL COMMENT '视频信息 video_img_url 视频截图url video_url 视频链接',
  `ext_flags` json DEFAULT NULL COMMENT '扩展商品标记',
  `source` varchar(20) DEFAULT NULL COMMENT '多规格商品来源 PARTNER来客, ERP多点后台',
  `package_num` decimal(10,3) DEFAULT NULL COMMENT '多包装商品包装入数',
  `package_seq` int(11) DEFAULT NULL COMMENT '多包装商品包装序号',
  `cost_account_type` varchar(20) NOT NULL DEFAULT 'MovingAverage' COMMENT '成本记账方式；MovingAverage=移动平均;Batch=批次',
  `sub_offline_alias` varchar(255) DEFAULT NULL COMMENT '子码商品线下别名',
  `gen_rf_id` varchar(100) DEFAULT NULL COMMENT '多包装关联上级物料码',
  `en_title` varchar(255) DEFAULT '' COMMENT '商品英文名称',
  `ntgew` decimal(10,3) DEFAULT '0.000' COMMENT '净重',
  `market_time` datetime DEFAULT NULL COMMENT '上市时间',
  `origin` varchar(32) CHARACTER SET utf8mb4 DEFAULT 'HANDWORK' COMMENT '数据来源',
  `selling_point` varchar(300) DEFAULT NULL COMMENT '卖点',
  `short_name` varchar(200) DEFAULT NULL COMMENT '短名称',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `flag_info` json DEFAULT NULL COMMENT '附加信息',
  PRIMARY KEY (`sku_id`),
  UNIQUE KEY `ware_id` (`ware_id`,`rf_id`),
  KEY `index_sku_rf_id` (`rf_id`),
  KEY `index_sku_ware_id` (`ware_id`),
  KEY `index_sku_ref_sku` (`ref_sku`),
  KEY `idx_item_num` (`item_num`),
  KEY `idx_vender_id_is_auxiliary` (`vender_id`,`is_auxiliary_ware`),
  KEY `idx_spec_type` (`spec_type`) USING BTREE,
  KEY `idx_vender_id_gen_rf_id` (`vender_id`,`gen_rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1152250242 DEFAULT CHARSET=utf8 COMMENT='商品sku表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_rule   */
/******************************************/
CREATE TABLE `ware_sku_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) DEFAULT '' COMMENT '商家名称',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `reviewed` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `canceled` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '取消时间',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `status` tinyint(6) NOT NULL DEFAULT '0' COMMENT '0:已取消 1:已创建 2:已审核 3:已生效 4:已失效',
  `actual_start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '实际生效时间',
  `applier` varchar(60) DEFAULT '' COMMENT '创建者',
  `reviewer` varchar(60) DEFAULT NULL COMMENT '审核人',
  `effector` varchar(60) DEFAULT NULL COMMENT '生效人',
  `notes` varchar(255) DEFAULT '' COMMENT '备注',
  `feature` varchar(512) DEFAULT '' COMMENT '扩展字段',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改(更新)时间',
  `retractor` varchar(60) DEFAULT '0' COMMENT '取消人',
  `actual_start_type` tinyint(4) DEFAULT '0' COMMENT '生效类型（1worker生效 2 页面立即生效）',
  `worker_status` tinyint(4) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。',
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `sku_id` bigint(20) DEFAULT '0' COMMENT 'sku id',
  `matnr` varchar(200) NOT NULL DEFAULT '' COMMENT '物料编码',
  `ware_name` varchar(256) DEFAULT '' COMMENT '商品名称',
  `ware_tag` int(11) DEFAULT '512' COMMENT '商品打标',
  `shop_id` bigint(20) DEFAULT NULL COMMENT 'OS门店id',
  PRIMARY KEY (`id`),
  KEY `inx_venderid` (`vender_id`),
  KEY `sku_id` (`sku_id`),
  KEY `matnr` (`matnr`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3565602 DEFAULT CHARSET=utf8 COMMENT='商家sku层级库存不同步规则表 人员id来自系统';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_rule_backup20180503   */
/******************************************/
CREATE TABLE `ware_sku_rule_backup20180503` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) CHARACTER SET utf8 DEFAULT '' COMMENT '商家名称',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `reviewed` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `canceled` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '取消时间',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `status` tinyint(6) NOT NULL DEFAULT '0' COMMENT '0:已取消  1:已创建 2:已审核 3:已生效',
  `actual_start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '实际生效时间',
  `applier` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '创建者',
  `reviewer` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '审核人',
  `effector` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '生效人',
  `notes` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `feature` varchar(512) CHARACTER SET utf8 DEFAULT '' COMMENT '扩展字段',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改(更新)时间',
  `retractor` varchar(60) CHARACTER SET utf8 DEFAULT '0' COMMENT '取消人',
  `actual_start_type` tinyint(4) DEFAULT '0' COMMENT '生效类型（1worker生效 2 页面立即生效）',
  `worker_status` tinyint(4) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_rule_sku   */
/******************************************/
CREATE TABLE `ware_sku_rule_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id 对应(ware_sku_rule_sku)表的id',
  `stock` int(11) DEFAULT '0' COMMENT '商品库存',
  `ware_name` varchar(256) DEFAULT '' COMMENT '商品名称',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效：-1无效 1有效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `daily_update` tinyint(4) DEFAULT '0' COMMENT '是否每日更新0否 1是',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `matnr` varchar(200) NOT NULL DEFAULT '' COMMENT '物料编码',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品id',
  `deleter` varchar(64) DEFAULT '' COMMENT '删除人',
  `deleted` datetime DEFAULT NULL COMMENT '删除时间',
  `sync_type` smallint(4) DEFAULT NULL COMMENT '库存同步方式(1 覆盖 2 调增)',
  PRIMARY KEY (`id`),
  KEY `idx_ruleid` (`rule_id`),
  KEY `idx_venderid` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23543 DEFAULT CHARSET=utf8 COMMENT='商家sku层级库存不同步规则关联的商品';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_rule_sku_backup20180503   */
/******************************************/
CREATE TABLE `ware_sku_rule_sku_backup20180503` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id 对应(ware_sku_rule_sku)表的id',
  `stock` int(11) DEFAULT '0' COMMENT '商品库存',
  `ware_name` varchar(256) CHARACTER SET utf8 DEFAULT '' COMMENT '商品名称',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效：-1无效 1有效',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `daily_update` tinyint(4) DEFAULT '0' COMMENT '是否每日更新0否 1是',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `matnr` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '物料编码',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '商品id',
  `deleter` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '删除人',
  `deleted` datetime DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_rule_temp   */
/******************************************/
CREATE TABLE `ware_sku_rule_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vender_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(256) DEFAULT '' COMMENT '商家名称',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `reviewed` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `canceled` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '取消时间',
  `yn` tinyint(4) DEFAULT '0' COMMENT '是否有效,-1:无效,1:有效',
  `status` tinyint(6) NOT NULL DEFAULT '0' COMMENT '0:已取消 1:已创建 2:已审核 3:已生效 4:已失效',
  `actual_start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '实际生效时间',
  `applier` varchar(60) DEFAULT '' COMMENT '创建者',
  `reviewer` varchar(60) DEFAULT NULL COMMENT '审核人',
  `effector` varchar(60) DEFAULT NULL COMMENT '生效人',
  `notes` varchar(255) DEFAULT '' COMMENT '备注',
  `feature` varchar(512) DEFAULT '' COMMENT '扩展字段',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改(更新)时间',
  `retractor` varchar(60) DEFAULT '0' COMMENT '取消人',
  `actual_start_type` tinyint(4) DEFAULT '0' COMMENT '生效类型（1worker生效 2 页面立即生效）',
  `worker_status` tinyint(4) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。',
  `end_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `sku_id` bigint(20) DEFAULT '0' COMMENT 'sku id',
  `matnr` varchar(200) NOT NULL DEFAULT '' COMMENT '物料编码',
  `ware_name` varchar(256) DEFAULT '' COMMENT '商品名称',
  `ware_tag` int(11) DEFAULT '512' COMMENT '商品打标',
  `shop_id` bigint(20) DEFAULT NULL COMMENT 'OS门店id',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `inx_venderid` (`vender_id`),
  KEY `sku_id` (`sku_id`),
  KEY `matnr` (`matnr`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2483042 DEFAULT CHARSET=utf8 COMMENT='商家sku层级库存不同步规则表 人员id来自系统';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_sku_service   */
/******************************************/
CREATE TABLE `ware_sku_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku主键id',
  `rf_id` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '商品sku物料编码',
  `ware_id` bigint(20) NOT NULL COMMENT '商品主数据id',
  `service` json DEFAULT NULL COMMENT '商品sku支持的服务列表，例：[{serviceId:1,options:[1,2,3]}, {serviceId:2,options:[4,5]}]',
  `store_range` json DEFAULT NULL COMMENT '适用门店的门店id数组，全门店时存空数组',
  `channel` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '渠道：APP：多点APP；MIN_APP：多点小程序；FSD：麦德龙toB业务；OUTER=外平台：饿了么，美团之类的三方平台；',
  `status` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ON' COMMENT '服务状态（Normal=开启，Disable=关闭）',
  `memo` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `op_user_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '最后操作人id',
  `op_user_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '最后操作人性名',
  `op_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT '1' COMMENT ' -1：无效，1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sku_channnel` (`sku_id`,`channel`),
  UNIQUE KEY `uk_vender_rf_channnel` (`vender_id`,`rf_id`,`channel`)
) ENGINE=InnoDB AUTO_INCREMENT=40842 DEFAULT CHARSET=latin1 COMMENT='商品sku附加服务';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_spec_type_log   */
/******************************************/
CREATE TABLE `ware_spec_type_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'SKUID',
  `ware_id` bigint(20) DEFAULT NULL COMMENT 'ware_id',
  `rf_id` varchar(255) DEFAULT NULL COMMENT '物料编码',
  `before_value` tinyint(4) DEFAULT NULL COMMENT '修改前值',
  `after_value` tinyint(4) DEFAULT NULL COMMENT '修改后值',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73162 DEFAULT CHARSET=utf8 COMMENT='商品类别订正表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_status_auto_config   */
/******************************************/
CREATE TABLE `ware_status_auto_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '变更code',
  `source_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '初始商品状态',
  `target_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标商品状态',
  `activeType` int(11) NOT NULL COMMENT '生效类型：1，立即生效，2，指定日期',
  `activeTypeValue` json DEFAULT NULL COMMENT '生效类型值',
  `activeTypeInterval` int(11) DEFAULT NULL COMMENT '时间间隔',
  `activeTypeIntervalTime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时间间隔设置时间',
  `yn` int(11) NOT NULL COMMENT '禁用：0，启用：1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `v_code` (`vender_id`,`code`),
  KEY `yn` (`vender_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品自动变更表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_status_auto_mc   */
/******************************************/
CREATE TABLE `ware_status_auto_mc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `mcCode` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '四级品类',
  `source_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '初始商品状态',
  `target_status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标商品状态',
  `days` int(11) NOT NULL COMMENT '天数',
  `yn` int(11) NOT NULL COMMENT '禁用：0，启用：1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `vonlyKey` (`vender_id`,`source_status`,`target_status`,`mcCode`),
  KEY `v_y_s_t` (`vender_id`,`yn`,`source_status`,`target_status`)
) ENGINE=InnoDB AUTO_INCREMENT=38601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品状态自动变更特殊品类';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_status_auto_rule   */
/******************************************/
CREATE TABLE `ware_status_auto_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则名称',
  `describeStr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则描述,例如：门店数/有效数{var1}{var2}',
  `varNum` int(11) NOT NULL COMMENT '参数个数',
  `varTypes` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数类型：1,2,3',
  `varValues` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值：10,9,8',
  `varValueFormats` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '值对应格式',
  `tips` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则提示',
  `colspan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '间隔',
  `config_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '自动变更code',
  `isMcCode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否按品类设置：0表示否，1表示是',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `creator` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `__zone__` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `config_id` (`vender_id`,`config_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品状态变更规则表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_stock_log   */
/******************************************/
CREATE TABLE `ware_stock_log` (
  `shop_id` int(11) NOT NULL COMMENT '门店ID',
  `matnr` varchar(45) NOT NULL COMMENT '物料编号、商品码和商品主码',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `stock` int(11) DEFAULT NULL COMMENT '原库存',
  `stock_source` varchar(50) DEFAULT NULL COMMENT '库存来源（0 规则生效记录, 1 下发同步记录',
  `stock_time` varchar(50) DEFAULT NULL COMMENT '价格变更时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '处理状态(0:未被同步处理,1:已被同步处理)',
  PRIMARY KEY (`shop_id`,`matnr`),
  KEY `index_ware_stock_log_vender_id_matnr` (`matnr`,`vender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存日志表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_tag_synto_wm   */
/******************************************/
CREATE TABLE `ware_tag_synto_wm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '同步物美状态：1,待发送，2,发送中，3,已发送。',
  `yn` tinyint(4) DEFAULT NULL,
  `rf_id` varchar(200) DEFAULT NULL,
  `vender_id` bigint(20) DEFAULT NULL,
  `ware_id` bigint(20) DEFAULT NULL,
  `shopid_list` text COMMENT '门店id列表，用逗号隔开。',
  PRIMARY KEY (`id`),
  KEY `idx_ware_id` (`ware_id`) USING BTREE,
  KEY `VENDERID_RFID_INDEX` (`vender_id`,`rf_id`,`yn`,`status`) USING BTREE,
  KEY `idx_rfid_status` (`rf_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=375162 DEFAULT CHARSET=latin1 COMMENT='打标时，新品同步给物美。';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_tag_temp   */
/******************************************/
CREATE TABLE `ware_tag_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317899 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_tax_classify_log   */
/******************************************/
CREATE TABLE `ware_tax_classify_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `rf_id` varchar(100) NOT NULL COMMENT '商品编码',
  `ware_id` bigint(20) NOT NULL COMMENT '商品主数据ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品skuId',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '最近操作人ID',
  `operator` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `operate_time` datetime NOT NULL COMMENT '最近操作时间',
  `operate_log` json DEFAULT NULL COMMENT '操作日志',
  `yn` tinyint(4) NOT NULL COMMENT '是否有效,-1:无效,1:有效',
  PRIMARY KEY (`id`),
  KEY `idx_vender_rf_id` (`vender_id`,`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2977402 DEFAULT CHARSET=utf8 COMMENT='商品国税分类码日志';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_tax_rate   */
/******************************************/
CREATE TABLE `ware_tax_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家id',
  `vender_name` varchar(45) DEFAULT NULL COMMENT '商家名称',
  `mwskz_name` varchar(45) DEFAULT NULL COMMENT '税代码',
  `mwskz` double DEFAULT NULL COMMENT '税率',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否在用 1：正常 -1：无效',
  `creator` int(11) DEFAULT NULL COMMENT '创建用户',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  `mender` int(11) DEFAULT NULL COMMENT '末次修改用户',
  `yn` smallint(6) NOT NULL DEFAULT '1' COMMENT '状态 1：启用 -1：停用',
  `output_tax_code` varchar(60) DEFAULT NULL COMMENT '销项税码',
  `scope` varchar(40) DEFAULT NULL COMMENT '适用范围 VENDER商家，SHOP门店特配',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_vender_mwskz_rate` (`vender_id`,`mwskz_name`,`mwskz`) USING BTREE,
  KEY `idx_vender_tax` (`vender_id`,`mwskz`) USING BTREE,
  KEY `idx_vender_taxname` (`vender_id`,`mwskz_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17882 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_temp   */
/******************************************/
CREATE TABLE `ware_temp` (
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `item_num` varchar(50) DEFAULT NULL COMMENT '货号,对应wm的sap的 ean11',
  KEY `idx_rf_id_item_num` (`rf_id`,`item_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_title_prefix_rule   */
/******************************************/
CREATE TABLE `ware_title_prefix_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_key` varchar(32) DEFAULT NULL COMMENT 'key',
  `content` text COMMENT '内容列表（包括：商家ID，商品ID，物料码），用逗号隔开',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT ' -1：无效，1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_idx_key` (`rule_key`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='商品名称前缀规则表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_type_cfg   */
/******************************************/
CREATE TABLE `ware_type_cfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(20) NOT NULL COMMENT '创建人名称',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier` varchar(20) NOT NULL COMMENT '修改人名称',
  `yn` tinyint(1) NOT NULL COMMENT '数据有效性:-1删除,0无效,1有效',
  `ware_type_code` varchar(20) NOT NULL COMMENT '商品类型编码,如共性商品:CC',
  `sub_type_code` varchar(20) NOT NULL COMMENT '商品类型编码子码,如共性商品-主码:CCMC',
  `ware_spec_code` int(11) NOT NULL COMMENT '商品类别编码',
  `sell_type_code` int(11) NOT NULL COMMENT '经营方式编码',
  `order_able` tinyint(1) NOT NULL COMMENT '是否可以订货:1是,-1否',
  `sell_online_able` tinyint(1) NOT NULL COMMENT '是否可以线上销售:1是,-1否',
  `sell_offline_able` tinyint(1) NOT NULL COMMENT '是否可以线下销售:1是,-1否',
  `stock_able` tinyint(1) NOT NULL COMMENT '是否可库存:1是,-1否',
  `stock_with_cost` tinyint(1) NOT NULL COMMENT '是否库存管理成本:1是,-1否',
  `stock_with_amount` tinyint(1) NOT NULL COMMENT '是否库存管理数量:1是,-1否',
  `stock_type_code` tinyint(4) NOT NULL COMMENT '库存管理方式枚举值',
  `sort_idx` int(11) DEFAULT '0' COMMENT '排序值，自然顺序',
  `memo` varchar(200) DEFAULT NULL COMMENT '简要描述',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8mb4 COMMENT='商品类型配置';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_ware   */
/******************************************/
CREATE TABLE `ware_ware` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `category_id` int(11) DEFAULT NULL COMMENT '后台三级分类ID',
  `ware_status` tinyint(3) DEFAULT NULL COMMENT '商品状态 1.在售中,2.仓库中,3违规,4.删除',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称 对应wm的sap的MAKTM',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `item_num` varchar(50) DEFAULT NULL COMMENT '货号,对应wm的sap的 ean11',
  `attributes` varchar(10000) DEFAULT NULL COMMENT '可选属性：商品其它属性key id:value id^key id:value id^key id:value id,value_id2^key id:0,value id',
  `stock` int(11) DEFAULT NULL COMMENT '商品总库存',
  `img_uri` varchar(300) DEFAULT NULL COMMENT '商品的主图',
  `features` varchar(2000) DEFAULT NULL COMMENT '特征',
  `brand_id` int(11) DEFAULT NULL COMMENT '商品品牌id',
  `online_time` datetime DEFAULT NULL COMMENT '最后上架时间',
  `offline_time` datetime DEFAULT NULL COMMENT '最后下架时间',
  `price` decimal(10,2) DEFAULT NULL COMMENT '售价,对应wm的KWERT',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `matkl` varchar(64) DEFAULT NULL COMMENT '商品分类MC ',
  `mwskz` varchar(45) DEFAULT NULL COMMENT '税代码',
  `mwskz_name` varchar(45) DEFAULT NULL COMMENT '税目名称',
  `brgew` decimal(20,3) DEFAULT NULL COMMENT '毛重',
  `chine` varchar(45) DEFAULT NULL COMMENT '基本单位描述',
  `weight` tinyint(4) DEFAULT NULL COMMENT '是否是称重商品',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家id',
  `vender_cat_ids` varchar(200) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `ware_type` int(11) DEFAULT '0' COMMENT '特殊商品标记',
  `ware_life` float DEFAULT NULL COMMENT '保质期(天)',
  `ware_tag` int(11) DEFAULT '512' COMMENT '商品打标',
  `out_brand_id` varchar(64) DEFAULT NULL COMMENT '外部品牌ID',
  `out_supplier_id` int(11) DEFAULT NULL COMMENT '外部供应商ID',
  `ware_tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `storage_type` tinyint(3) DEFAULT NULL COMMENT '储存温层 1.常温,2.冷冻,3.冷藏',
  `corner_mark` tinyint(4) DEFAULT NULL COMMENT '角标 1:周年庆 2:首发 3:产地直供 4:海淘 5:双十一',
  `produce_type` int(4) DEFAULT '0' COMMENT '生产类型',
  `produce_type_time` datetime DEFAULT NULL COMMENT '生产类型变更时间',
  `allowReturn` int(4) DEFAULT NULL COMMENT '是否允许退货',
  `storageHouseId` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `has_description` tinyint(4) DEFAULT '0' COMMENT '是否有图文详情',
  `warehouse_id` int(4) DEFAULT NULL COMMENT '前置仓属性',
  `cornerSign` varchar(2000) DEFAULT NULL COMMENT '角标标识',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `weight_limit_ratio` float(4,2) DEFAULT '0.50' COMMENT '称重商品重量上限',
  `is_private_stock` tinyint(4) DEFAULT '0' COMMENT '是否独享库存，1：是，0：否。',
  `fresh_weight_lower_limit` float(4,2) DEFAULT NULL COMMENT '生鲜标品重量下限。',
  `sap_title` varchar(200) DEFAULT NULL COMMENT '商品短名（商家商品名称）',
  `basic_unit` varchar(20) DEFAULT NULL COMMENT '基本单位',
  `tax_type` int(4) DEFAULT NULL COMMENT '税收分类',
  `ext_json` text COMMENT '商品额外信息（json串）',
  `expand_attributes` varchar(2000) DEFAULT NULL COMMENT '拓展属性（包含：子类型和特有属性（如：面值等）），json串',
  `ware_life_unit` tinyint(4) DEFAULT '1' COMMENT '保质期单位（1：天；2：小时）',
  `pop_virtual_ware_tag` tinyint(4) DEFAULT NULL COMMENT 'pop虚拟商品标记：1-直充、2-核销、3-预约',
  `pattern` varchar(32) NOT NULL DEFAULT 'ENTITY' COMMENT '商品形态。ENTITY：实物商品； VIRTUAL：虚拟商品',
  `vender_category_id` int(11) DEFAULT NULL COMMENT '商家后台三级分类ID',
  `is_self` tinyint(4) DEFAULT NULL COMMENT '业务类型控制',
  PRIMARY KEY (`ware_id`),
  UNIQUE KEY `uq_idx_rfid_vid` (`rf_id`,`vender_id`),
  KEY `index_modified` (`modified`),
  KEY `idx_item_num` (`item_num`),
  KEY `vender_id` (`vender_id`),
  KEY `idx_vender_category` (`vender_id`,`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  KEY `idx_vender_id_matkl` (`vender_id`,`matkl`),
  KEY `ware_status` (`ware_status`,`vender_id`,`ware_id`),
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122996322 DEFAULT CHARSET=utf8 COMMENT='商品表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = ware_ware10   */
/******************************************/
CREATE TABLE `ware_ware10` (
  `ware_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `category_id` int(11) DEFAULT NULL COMMENT '后台三级分类ID',
  `vender_cat_ids` varchar(200) DEFAULT NULL COMMENT '商家类目id列表,逗号分隔',
  `ware_status` tinyint(3) DEFAULT NULL COMMENT '商品状态 1.在售中,2.仓库中,3违规,4.删除',
  `title` varchar(200) DEFAULT NULL COMMENT '商品名称 对应wm的sap的MAKTM',
  `rf_id` varchar(200) DEFAULT NULL COMMENT '商家自己的编码，对应wm的MATNR',
  `item_num` varchar(50) DEFAULT NULL COMMENT '货号,对应wm的sap的 ean11',
  `attributes` varchar(10000) DEFAULT NULL COMMENT '可选属性：商品其它属性key id:value id^key id:value id^key id:value id,value_id2^key id:0,value id',
  `stock` int(11) DEFAULT NULL COMMENT '商品总库存',
  `img_uri` varchar(300) DEFAULT NULL COMMENT '商品的主图',
  `features` varchar(2000) DEFAULT NULL COMMENT '特征',
  `brand_id` int(11) DEFAULT NULL COMMENT '商品品牌id',
  `online_time` datetime DEFAULT NULL COMMENT '最后上架时间',
  `offline_time` datetime DEFAULT NULL COMMENT '最后下架时间',
  `price` decimal(10,2) DEFAULT NULL COMMENT '售价,对应wm的KWERT',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `matkl` varchar(64) DEFAULT NULL COMMENT '商品分类MC ',
  `mwskz` varchar(45) DEFAULT NULL COMMENT '税代码',
  `mwskz_name` varchar(45) DEFAULT NULL COMMENT '税目名称',
  `brgew` decimal(20,3) DEFAULT NULL COMMENT '毛重',
  `chine` varchar(45) DEFAULT NULL COMMENT '基本单位描述',
  `weight` tinyint(4) DEFAULT NULL COMMENT '是否是称重商品',
  `vender_id` int(11) DEFAULT NULL COMMENT '商家id',
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `ware_type` int(11) DEFAULT '0' COMMENT '特殊商品标记',
  `ware_life` float DEFAULT NULL COMMENT '保质期(天)',
  `ware_tag` int(11) DEFAULT '512' COMMENT '商品打标',
  `out_brand_id` varchar(64) DEFAULT NULL COMMENT '外部品牌ID',
  `out_supplier_id` int(11) DEFAULT NULL COMMENT '外部供应商ID',
  `ware_tag_time` datetime DEFAULT NULL COMMENT '商品标记变更时间',
  `storage_type` tinyint(3) DEFAULT NULL COMMENT '储存温层 1.常温,2.冷冻,3.冷藏',
  `corner_mark` tinyint(4) DEFAULT NULL COMMENT '角标 1:周年庆 2:首发 3:产地直供 4:海淘 5:双十一',
  `produce_type` int(4) DEFAULT '0' COMMENT '生产类型',
  `produce_type_time` datetime DEFAULT NULL COMMENT '生产类型变更时间',
  `allowReturn` int(4) DEFAULT NULL COMMENT '是否允许退货',
  `storageHouseId` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `has_description` tinyint(4) DEFAULT '0' COMMENT '是否有图文详情',
  `warehouse_id` int(11) DEFAULT NULL COMMENT '前置仓属性',
  `cornerSign` varchar(2000) DEFAULT NULL COMMENT '角标标识',
  `spec_type` tinyint(4) DEFAULT NULL COMMENT '多规格类型，0普通，1母规格，2子规格',
  `weight_limit_ratio` float(4,2) DEFAULT '0.50' COMMENT '称重商品重量上限',
  `is_private_stock` tinyint(4) DEFAULT '0' COMMENT '是否独享库存，1：是，0：否。',
  `fresh_weight_lower_limit` float(4,2) DEFAULT NULL COMMENT '生鲜标品重量下限。',
  `sap_title` varchar(200) DEFAULT NULL COMMENT '商品短名（商家商品名称）',
  `basic_unit` varchar(20) DEFAULT NULL COMMENT '基本单位',
  `tax_type` int(4) DEFAULT NULL COMMENT '税收分类',
  `ext_json` text COMMENT '商品额外信息（json串）',
  `expand_attributes` varchar(2000) DEFAULT NULL COMMENT '拓展属性（包含：子类型和特有属性（如：面值等）），json串',
  `ware_life_unit` tinyint(4) DEFAULT '1' COMMENT '保质期单位（1：天；2：小时）',
  `pop_virtual_ware_tag` tinyint(4) DEFAULT NULL COMMENT 'pop虚拟商品标记：1-直充、2-核销、3-预约',
  `pattern` varchar(32) NOT NULL DEFAULT 'ENTITY' COMMENT '商品形态。ENTITY：实物商品； VIRTUAL：虚拟商品',
  `vender_category_id` int(11) DEFAULT NULL COMMENT '商家后台三级分类ID',
  `is_self` tinyint(4) DEFAULT NULL COMMENT '业务类型控制',
  PRIMARY KEY (`ware_id`),
  UNIQUE KEY `rf_id` (`rf_id`,`vender_id`),
  KEY `modified` (`modified`),
  KEY `item_num` (`item_num`),
  KEY `vender_id` (`vender_id`),
  KEY `idx_vender_category` (`vender_id`,`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `idx_vender_id_matkl` (`vender_id`,`matkl`),
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE,
  KEY `ware_status` (`ware_status`,`vender_id`,`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1133696442 DEFAULT CHARSET=utf8 COMMENT='商品表';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = warehouse   */
/******************************************/
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_code` int(4) DEFAULT NULL COMMENT '前置仓编号',
  `warehouse_name` varchar(50) DEFAULT NULL COMMENT '前置仓名称',
  `warehouse_icon` varchar(255) DEFAULT NULL COMMENT '前置仓图标',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change   */
/******************************************/
CREATE TABLE `wareprice_change` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家Id',
  `change_type` tinyint(4) NOT NULL COMMENT '变更类型 1:门店全部设置，2：门店部分设置，3：门店部分不设置。',
  `start_time` datetime NOT NULL COMMENT '设置价格生效时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 1:未生效，2已生效，3，手动失效（只能在未生效前），4审核驳回，5审核通过。',
  `actual_start_time` datetime DEFAULT NULL COMMENT '实际生效时间',
  `actual_start_type` tinyint(4) DEFAULT NULL COMMENT '生效类型 1:worker生效，2：界面立即执行。',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_presell` tinyint(4) DEFAULT NULL COMMENT '是否预售，0非预售，1预售',
  `applier` varchar(50) DEFAULT NULL COMMENT '创建人',
  `reviewer` varchar(50) DEFAULT NULL COMMENT '审核人',
  `shopid_list` text COMMENT '门店id列表，用逗号隔开。',
  `vender_name` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `fail_shop_list` text COMMENT '调价失败的门店列表。',
  `worker_status` tinyint(4) DEFAULT '0' COMMENT 'worker处理状态，0：正常，1：生效worker处理中，2：到期未审核驳回。',
  `operation_type` tinyint(4) DEFAULT '1' COMMENT '操作类型：1、门店调价；2、总部调价',
  `interception_flag` tinyint(4) DEFAULT '0' COMMENT '商品风控系统拦截标志【1：拦截过，0：未拦截过】',
  `actual_type` tinyint(4) DEFAULT NULL COMMENT '生效类型（1-紧急调价，2-常规调价）',
  `approve_time` datetime DEFAULT NULL COMMENT '提交时间',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `return_reason` varchar(255) DEFAULT NULL COMMENT '驳回原因',
  `review_flow_id` varchar(50) DEFAULT NULL COMMENT '审批任务流ID',
  `applier_id` bigint(20) DEFAULT NULL COMMENT '提交人ID',
  `change_source` varchar(50) DEFAULT 'HANDEL_WORK' COMMENT '业务来源 （WARE_CFG_CHG-商品变更，SHOP_CFG_CHG-门店变更，OS_WARE_PUBLISH-新品发布，HANDEL_WORK-手动创建）',
  `out_biz_no` varchar(255) DEFAULT NULL COMMENT '外部业务单号',
  PRIMARY KEY (`id`),
  KEY `idx_vender_actual_time` (`vender_id`,`actual_start_time`),
  KEY `idx_out_biz` (`change_source`,`out_biz_no`),
  KEY `idx_start_time_vender` (`start_time`,`vender_id`),
  KEY `idx_review_time` (`review_time`)
) ENGINE=InnoDB AUTO_INCREMENT=25522842 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change_log   */
/******************************************/
CREATE TABLE `wareprice_change_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `change_id` bigint(20) DEFAULT NULL COMMENT '调价单Id',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `operate_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',
  `operate_content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=718802 DEFAULT CHARSET=utf8 COMMENT='调价单日志';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change_msg   */
/******************************************/
CREATE TABLE `wareprice_change_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `yn` tinyint(4) NOT NULL DEFAULT '1',
  `vender_id` bigint(20) NOT NULL COMMENT '商家ID',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `change_source` varchar(50) NOT NULL COMMENT '消息来源',
  `out_biz_no` varchar(255) NOT NULL COMMENT '外部单号',
  `msg_status` varchar(20) NOT NULL COMMENT '消息状态',
  `msg_ctx` json NOT NULL COMMENT '消息内容',
  `error_msg` json DEFAULT NULL COMMENT '错误信息',
  `change_id` bigint(20) DEFAULT NULL COMMENT '调价单Id',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_out_biz` (`change_source`,`out_biz_no`)
) ENGINE=InnoDB AUTO_INCREMENT=348900842 DEFAULT CHARSET=utf8mb4 COMMENT='调价单消息记录';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change_shop   */
/******************************************/
CREATE TABLE `wareprice_change_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sku_id` bigint(20) NOT NULL COMMENT '门店Id',
  `change_id` bigint(20) NOT NULL COMMENT '价格变更id，对应ware_price_change表id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'create date',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'modified date',
  `yn` smallint(6) NOT NULL DEFAULT '1' COMMENT 'yn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_skuchangidshop` (`sku_id`,`change_id`,`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13090716 DEFAULT CHARSET=utf8 COMMENT='wareprice_change_shop';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change_sku   */
/******************************************/
CREATE TABLE `wareprice_change_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` bigint(20) NOT NULL COMMENT '商家Id',
  `sku_id` bigint(20) NOT NULL COMMENT '门店Id',
  `change_id` bigint(20) NOT NULL COMMENT '价格变更id，对应ware_price_change表id',
  `yn` smallint(6) DEFAULT NULL COMMENT '状态 1：启用 -1：停用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `matnr` varchar(200) DEFAULT NULL COMMENT '物料编码',
  `ware_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `online_price` decimal(10,2) DEFAULT NULL COMMENT '电商价',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(200) DEFAULT NULL COMMENT '供应商名称',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '散卖商品参考价格',
  `operation_type` tinyint(4) DEFAULT '1' COMMENT '操作类型：1、门店调价；2、总部调价',
  `old_retail_price` decimal(10,2) DEFAULT NULL COMMENT '创建调价单时，商品的当前价格',
  `shopid_list` varchar(10000) DEFAULT NULL,
  `interception_reason` varchar(100) DEFAULT NULL COMMENT '拦截原因',
  `group_id` bigint(20) DEFAULT NULL COMMENT '价格群组',
  `in_price_max` decimal(10,2) DEFAULT NULL COMMENT '最高进价',
  `in_price_min` decimal(10,2) DEFAULT NULL COMMENT '最低进价',
  `old_sale_price_max` decimal(10,2) DEFAULT NULL COMMENT '原最高售价',
  `old_sale_price_min` decimal(10,2) DEFAULT NULL COMMENT '原最低售价',
  `old_sale_rate_max` decimal(10,2) DEFAULT NULL COMMENT '原最高毛利率',
  `old_sale_rate_min` decimal(10,2) DEFAULT NULL COMMENT '原最低毛利率',
  `new_sale_rate_max` decimal(10,2) DEFAULT NULL COMMENT '新最高毛利率',
  `new_sale_rate_min` decimal(10,2) DEFAULT NULL COMMENT '新最低毛利率',
  `change_reason` varchar(255) DEFAULT NULL COMMENT '调价理由',
  PRIMARY KEY (`id`),
  KEY `idx_modified_change_id_yn` (`modified`,`change_id`,`yn`),
  KEY `idx_change_id` (`change_id`),
  KEY `idx_sku_id` (`sku_id`),
  KEY `idx_vender_id` (`vender_id`),
  KEY `idx_matnr` (`matnr`),
  KEY `idx_change_id_yn` (`change_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1098137562 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_change_store   */
/******************************************/
CREATE TABLE `wareprice_change_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `sku_id` bigint(20) NOT NULL COMMENT '门店Id',
  `change_id` bigint(20) NOT NULL COMMENT '价格变更id，对应ware_price_change表id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `change_sku_id` bigint(20) DEFAULT NULL COMMENT 'SKU详情表ID',
  `in_price` decimal(10,2) DEFAULT NULL COMMENT '进价',
  `old_sale_price` decimal(10,2) DEFAULT NULL COMMENT '原售价',
  `old_sale_rate` decimal(10,0) DEFAULT NULL,
  `new_sale_price` decimal(10,2) DEFAULT NULL COMMENT '新售价',
  `new_sale_rate` decimal(10,2) DEFAULT NULL,
  `effect_status` tinyint(4) DEFAULT NULL COMMENT '生效状态（-1：不执行，0-未执行，1-已执行，2-执行失败）',
  `fail_reason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  `overwrite_time` datetime DEFAULT NULL COMMENT '覆写时间',
  `execute_flow_id` varchar(50) DEFAULT NULL COMMENT '执行任务ID',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `yn` tinyint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_change_sku_id` (`change_sku_id`),
  KEY `idx_change_sku_shop_detail_id` (`change_id`,`sku_id`,`shop_id`,`change_sku_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_vender_id_yn` (`vender_id`,`yn`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_effect_status` (`effect_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2319789202 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wareprice_mq_change   */
/******************************************/
CREATE TABLE `wareprice_mq_change` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家Id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店Id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `rf_id` varchar(50) DEFAULT NULL COMMENT '物料编码',
  `title` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `old_price` decimal(10,2) DEFAULT NULL COMMENT '原线下价格',
  `price` decimal(10,2) DEFAULT NULL COMMENT '线下价格',
  `old_online_price` decimal(10,2) DEFAULT NULL COMMENT '原线上价格',
  `online_price` decimal(10,2) DEFAULT NULL COMMENT '线上价格',
  `old_retail_price` decimal(10,2) DEFAULT NULL COMMENT '原参考价格',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '参考价格',
  `refresh_status` tinyint(4) DEFAULT NULL COMMENT '刷新状态 0：未刷新 1：已刷新',
  `updator` varchar(50) DEFAULT NULL COMMENT '操作人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `index_store_id_rf_id_yn` (`store_id`,`rf_id`,`yn`),
  KEY `idx_store_id_sku_id_yn` (`store_id`,`sku_id`,`yn`),
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品价格MQ同步优化';


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wm_mc_code   */
/******************************************/
CREATE TABLE `wm_mc_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) DEFAULT NULL COMMENT '多点商家ID',
  `MANDT` varchar(9) DEFAULT NULL COMMENT '客户端',
  `AREA` varchar(18) DEFAULT NULL COMMENT '销售地区',
  `MATKL` varchar(27) DEFAULT NULL COMMENT '商品分类MC',
  `INDU` varchar(12) DEFAULT NULL COMMENT '工厂概要文件',
  `ABTNR` varchar(12) DEFAULT NULL COMMENT '营运部门',
  `OPER` varchar(9) DEFAULT NULL COMMENT '营运课',
  `EKGRP` varchar(9) DEFAULT NULL COMMENT '采购组',
  `EKGRS` varchar(9) DEFAULT NULL COMMENT '采购处',
  `UDATE` varchar(24) DEFAULT NULL COMMENT '修改日期',
  `EKNAM` varchar(60) DEFAULT NULL COMMENT '采购组名称',
  `PUUNIT` varchar(18) DEFAULT NULL COMMENT '采购课组（U课）',
  `PUNAM` varchar(60) DEFAULT NULL COMMENT '采购课组名称',
  `PUCODE` varchar(18) DEFAULT NULL COMMENT '采购行政岗位',
  `PUCODENAM` varchar(60) DEFAULT NULL COMMENT '采购行政岗位名称',
  `EKGNAM` varchar(60) DEFAULT NULL COMMENT '采购处名称',
  `OPUNIT` varchar(18) DEFAULT NULL COMMENT '营运课组',
  `OPNAM` varchar(60) DEFAULT NULL COMMENT '营运课组名称',
  `OPRNAM` varchar(60) DEFAULT NULL COMMENT '营运课名称',
  `ABNAM` varchar(60) DEFAULT NULL COMMENT '营运部门',
  `TEMP01` varchar(60) DEFAULT NULL,
  `TEMP02` varchar(60) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `yn` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mandt_matkl` (`MANDT`,`MATKL`),
  UNIQUE KEY `unique_venderId_matkl` (`vender_id`,`MATKL`)
) ENGINE=InnoDB AUTO_INCREMENT=11562162 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_ware   */
/*   TableName = wms_pallet_rule   */
/******************************************/
CREATE TABLE `wms_pallet_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `vender_id` bigint(20) NOT NULL COMMENT '商家id',
  `yn` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效； -1 无效',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifior` varchar(50) DEFAULT NULL COMMENT '修改人',
  `rf_id` varchar(100) NOT NULL COMMENT '商品编码',
  `package_id` varchar(10) NOT NULL COMMENT '包装单位',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `shop_code` varchar(50) DEFAULT NULL COMMENT 'DC编码(门店(仓库)编码)',
  `layer_qty` int(11) DEFAULT NULL COMMENT '每层数量',
  `layer_height` int(11) DEFAULT NULL COMMENT '层高',
  `half_pallet_sku_qty` int(11) DEFAULT NULL COMMENT '二分之一托盘sku数量',
  `quarter_pallet_sku_qty` int(11) DEFAULT NULL COMMENT '四分之一托盘sku数量',
  `__zone__` varchar(10) NOT NULL DEFAULT 'gz01' COMMENT 'avaliable values: gz01,rz02,rz03...',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id_rf_id_package_id` (`vender_id`,`rf_id`,`package_id`),
  KEY `idx_shop_id_rf_id_package_id` (`shop_id`,`rf_id`,`package_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54358722 DEFAULT CHARSET=utf8 COMMENT='码盘规则表';


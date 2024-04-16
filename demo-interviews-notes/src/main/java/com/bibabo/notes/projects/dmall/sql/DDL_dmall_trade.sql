-- Export Tools
-- Time: 2024-04-16 16:48:50
-- Service: s3410i.jxq.db.dmall.com:3410   Database: dmall_trade
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = auto_key   */
/******************************************/
CREATE TABLE `auto_key` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `val` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `val` (`val`)
) ENGINE=MyISAM AUTO_INCREMENT=868494682 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_config   */
/******************************************/
CREATE TABLE `dmall_trade_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'app_id',
  `config_key` varchar(128) NOT NULL COMMENT '键',
  `config_value` varchar(4000) DEFAULT NULL COMMENT '值',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `creator` varchar(20) DEFAULT NULL COMMENT '应用创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1-正常',
  `yn` int(11) NOT NULL DEFAULT '1',
  `config_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='结算系统配置';


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_0   */
/******************************************/
CREATE TABLE `dmall_trade_consign_0` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_1   */
/******************************************/
CREATE TABLE `dmall_trade_consign_1` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_10   */
/******************************************/
CREATE TABLE `dmall_trade_consign_10` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_11   */
/******************************************/
CREATE TABLE `dmall_trade_consign_11` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_12   */
/******************************************/
CREATE TABLE `dmall_trade_consign_12` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_13   */
/******************************************/
CREATE TABLE `dmall_trade_consign_13` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_14   */
/******************************************/
CREATE TABLE `dmall_trade_consign_14` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_15   */
/******************************************/
CREATE TABLE `dmall_trade_consign_15` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_16   */
/******************************************/
CREATE TABLE `dmall_trade_consign_16` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_17   */
/******************************************/
CREATE TABLE `dmall_trade_consign_17` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_18   */
/******************************************/
CREATE TABLE `dmall_trade_consign_18` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_19   */
/******************************************/
CREATE TABLE `dmall_trade_consign_19` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_2   */
/******************************************/
CREATE TABLE `dmall_trade_consign_2` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_20   */
/******************************************/
CREATE TABLE `dmall_trade_consign_20` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_21   */
/******************************************/
CREATE TABLE `dmall_trade_consign_21` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_22   */
/******************************************/
CREATE TABLE `dmall_trade_consign_22` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_23   */
/******************************************/
CREATE TABLE `dmall_trade_consign_23` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_24   */
/******************************************/
CREATE TABLE `dmall_trade_consign_24` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_25   */
/******************************************/
CREATE TABLE `dmall_trade_consign_25` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_26   */
/******************************************/
CREATE TABLE `dmall_trade_consign_26` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_27   */
/******************************************/
CREATE TABLE `dmall_trade_consign_27` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_28   */
/******************************************/
CREATE TABLE `dmall_trade_consign_28` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_29   */
/******************************************/
CREATE TABLE `dmall_trade_consign_29` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_3   */
/******************************************/
CREATE TABLE `dmall_trade_consign_3` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_30   */
/******************************************/
CREATE TABLE `dmall_trade_consign_30` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_31   */
/******************************************/
CREATE TABLE `dmall_trade_consign_31` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_32   */
/******************************************/
CREATE TABLE `dmall_trade_consign_32` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_33   */
/******************************************/
CREATE TABLE `dmall_trade_consign_33` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_34   */
/******************************************/
CREATE TABLE `dmall_trade_consign_34` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_35   */
/******************************************/
CREATE TABLE `dmall_trade_consign_35` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_36   */
/******************************************/
CREATE TABLE `dmall_trade_consign_36` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_37   */
/******************************************/
CREATE TABLE `dmall_trade_consign_37` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_38   */
/******************************************/
CREATE TABLE `dmall_trade_consign_38` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_39   */
/******************************************/
CREATE TABLE `dmall_trade_consign_39` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_4   */
/******************************************/
CREATE TABLE `dmall_trade_consign_4` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_40   */
/******************************************/
CREATE TABLE `dmall_trade_consign_40` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_41   */
/******************************************/
CREATE TABLE `dmall_trade_consign_41` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_42   */
/******************************************/
CREATE TABLE `dmall_trade_consign_42` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_43   */
/******************************************/
CREATE TABLE `dmall_trade_consign_43` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_44   */
/******************************************/
CREATE TABLE `dmall_trade_consign_44` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_45   */
/******************************************/
CREATE TABLE `dmall_trade_consign_45` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_46   */
/******************************************/
CREATE TABLE `dmall_trade_consign_46` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_47   */
/******************************************/
CREATE TABLE `dmall_trade_consign_47` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_48   */
/******************************************/
CREATE TABLE `dmall_trade_consign_48` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_49   */
/******************************************/
CREATE TABLE `dmall_trade_consign_49` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_5   */
/******************************************/
CREATE TABLE `dmall_trade_consign_5` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_50   */
/******************************************/
CREATE TABLE `dmall_trade_consign_50` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_51   */
/******************************************/
CREATE TABLE `dmall_trade_consign_51` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_52   */
/******************************************/
CREATE TABLE `dmall_trade_consign_52` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_53   */
/******************************************/
CREATE TABLE `dmall_trade_consign_53` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_54   */
/******************************************/
CREATE TABLE `dmall_trade_consign_54` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_55   */
/******************************************/
CREATE TABLE `dmall_trade_consign_55` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_56   */
/******************************************/
CREATE TABLE `dmall_trade_consign_56` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_57   */
/******************************************/
CREATE TABLE `dmall_trade_consign_57` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_58   */
/******************************************/
CREATE TABLE `dmall_trade_consign_58` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_59   */
/******************************************/
CREATE TABLE `dmall_trade_consign_59` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_6   */
/******************************************/
CREATE TABLE `dmall_trade_consign_6` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_60   */
/******************************************/
CREATE TABLE `dmall_trade_consign_60` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_61   */
/******************************************/
CREATE TABLE `dmall_trade_consign_61` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_62   */
/******************************************/
CREATE TABLE `dmall_trade_consign_62` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_63   */
/******************************************/
CREATE TABLE `dmall_trade_consign_63` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_64   */
/******************************************/
CREATE TABLE `dmall_trade_consign_64` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_65   */
/******************************************/
CREATE TABLE `dmall_trade_consign_65` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_66   */
/******************************************/
CREATE TABLE `dmall_trade_consign_66` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_67   */
/******************************************/
CREATE TABLE `dmall_trade_consign_67` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_68   */
/******************************************/
CREATE TABLE `dmall_trade_consign_68` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_69   */
/******************************************/
CREATE TABLE `dmall_trade_consign_69` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_7   */
/******************************************/
CREATE TABLE `dmall_trade_consign_7` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_70   */
/******************************************/
CREATE TABLE `dmall_trade_consign_70` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_71   */
/******************************************/
CREATE TABLE `dmall_trade_consign_71` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_72   */
/******************************************/
CREATE TABLE `dmall_trade_consign_72` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_73   */
/******************************************/
CREATE TABLE `dmall_trade_consign_73` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_74   */
/******************************************/
CREATE TABLE `dmall_trade_consign_74` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_75   */
/******************************************/
CREATE TABLE `dmall_trade_consign_75` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_76   */
/******************************************/
CREATE TABLE `dmall_trade_consign_76` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_77   */
/******************************************/
CREATE TABLE `dmall_trade_consign_77` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_78   */
/******************************************/
CREATE TABLE `dmall_trade_consign_78` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_79   */
/******************************************/
CREATE TABLE `dmall_trade_consign_79` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_8   */
/******************************************/
CREATE TABLE `dmall_trade_consign_8` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_80   */
/******************************************/
CREATE TABLE `dmall_trade_consign_80` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_81   */
/******************************************/
CREATE TABLE `dmall_trade_consign_81` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_82   */
/******************************************/
CREATE TABLE `dmall_trade_consign_82` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_83   */
/******************************************/
CREATE TABLE `dmall_trade_consign_83` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_84   */
/******************************************/
CREATE TABLE `dmall_trade_consign_84` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_85   */
/******************************************/
CREATE TABLE `dmall_trade_consign_85` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_86   */
/******************************************/
CREATE TABLE `dmall_trade_consign_86` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_87   */
/******************************************/
CREATE TABLE `dmall_trade_consign_87` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_88   */
/******************************************/
CREATE TABLE `dmall_trade_consign_88` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_89   */
/******************************************/
CREATE TABLE `dmall_trade_consign_89` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_9   */
/******************************************/
CREATE TABLE `dmall_trade_consign_9` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_90   */
/******************************************/
CREATE TABLE `dmall_trade_consign_90` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_91   */
/******************************************/
CREATE TABLE `dmall_trade_consign_91` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_92   */
/******************************************/
CREATE TABLE `dmall_trade_consign_92` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_93   */
/******************************************/
CREATE TABLE `dmall_trade_consign_93` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_94   */
/******************************************/
CREATE TABLE `dmall_trade_consign_94` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_95   */
/******************************************/
CREATE TABLE `dmall_trade_consign_95` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_96   */
/******************************************/
CREATE TABLE `dmall_trade_consign_96` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_97   */
/******************************************/
CREATE TABLE `dmall_trade_consign_97` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_98   */
/******************************************/
CREATE TABLE `dmall_trade_consign_98` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_consign_99   */
/******************************************/
CREATE TABLE `dmall_trade_consign_99` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  `version` varchar(5) DEFAULT NULL COMMENT '版本号',
  `idcard` varchar(150) DEFAULT NULL COMMENT '身份证',
  `exception_consign` tinyint(1) DEFAULT NULL COMMENT '是否为异常地址，NULL与-1不是，1是',
  `dm_tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户平台ID',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = dmall_trade_gate_config   */
/******************************************/
CREATE TABLE `dmall_trade_gate_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(35) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `biz_name` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '配置类型',
  `env` int(4) NOT NULL DEFAULT '1' COMMENT '线上/线下环境',
  `parameters` varchar(4096) DEFAULT NULL,
  `module_jsonstr` varchar(8192) DEFAULT NULL,
  `yn` tinyint(1) NOT NULL DEFAULT '1',
  `content` varchar(200) DEFAULT NULL COMMENT '描述',
  `platform` int(11) DEFAULT NULL COMMENT '平台类型 1:app 2:H5 3:小程序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_uuid` (`uuid`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1282 DEFAULT CHARSET=utf8;


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = init_dm_tenant_address   */
/******************************************/
CREATE TABLE `init_dm_tenant_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dm_tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `yn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=586372722 DEFAULT CHARSET=utf8 COMMENT='租户地址隔离洗数初始化表，初始化完成后删除本表';


/******************************************/
/*   DatabaseName = dmall_trade   */
/*   TableName = wm_receive_place   */
/******************************************/
CREATE TABLE `wm_receive_place` (
  `id` bigint(20) NOT NULL,
  `webuser_id` bigint(12) NOT NULL,
  `consignee` varchar(45) NOT NULL COMMENT '收货人姓名',
  `mobil_phone` varchar(20) NOT NULL COMMENT '联系手机号',
  `tele_phone` varchar(20) DEFAULT NULL COMMENT '联系固定电话',
  `email` varchar(80) DEFAULT NULL,
  `area_id_3` int(11) DEFAULT NULL COMMENT '第三级区域id',
  `address_id` int(11) DEFAULT '0' COMMENT '存的是街道详细地址',
  `amap_id` varchar(12) DEFAULT NULL COMMENT 'é«å¾·å°å¾è¡éå°åºid',
  `address_name` varchar(100) DEFAULT NULL COMMENT 'è¡éå°åºåç§°',
  `address_detail` varchar(200) NOT NULL,
  `address_alias` varchar(45) DEFAULT NULL,
  `isdefault` int(1) DEFAULT '2' COMMENT '1：默认; 2：非默认',
  `properties` varchar(200) DEFAULT NULL,
  `latitude` double(10,7) DEFAULT NULL COMMENT 'åæ çº¬åº¦',
  `longitude` double(10,7) DEFAULT NULL COMMENT 'åæ ç²¾åº¦',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `yn` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `temp_consign` tinyint(1) DEFAULT '0' COMMENT '是否是临时收货人',
  `area_id_1` int(11) DEFAULT NULL COMMENT '第一级区域id',
  `area_id_2` int(11) DEFAULT NULL COMMENT '第二级区域id',
  `area_name_1` varchar(200) DEFAULT NULL COMMENT '第一级区域名称',
  `area_name_2` varchar(200) DEFAULT NULL COMMENT '第二级区域名称',
  `area_name_3` varchar(200) DEFAULT NULL COMMENT '第三级区域名称',
  PRIMARY KEY (`id`),
  KEY `address_area_idx` (`address_id`) USING BTREE,
  KEY `address_webuser_id_idx` (`webuser_id`) USING BTREE,
  KEY `area_id` (`area_id_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


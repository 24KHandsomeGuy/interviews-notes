-- Export Tools
-- Time: 2024-04-16 15:40:30
-- Service: s3529i.jxq.db.dmall.com:3529   Database: dmall_terns
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = area_fence   */
/******************************************/
CREATE TABLE `area_fence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_id` bigint(20) DEFAULT NULL COMMENT '围栏ID',
  `name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `fence` polygon NOT NULL COMMENT '地理围栏',
  `fence_geo_json` text GENERATED ALWAYS AS (st_asgeojson(`fence`)) VIRTUAL COMMENT '围栏json',
  `center` varchar(100) GENERATED ALWAYS AS (st_asgeojson(st_centroid(`fence`))) VIRTUAL COMMENT '围栏中心点json',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modifier` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(50) DEFAULT NULL COMMENT '修改人名称',
  `modified` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  SPATIAL KEY `idx_fence` (`fence`)
) ENGINE=InnoDB AUTO_INCREMENT=105331 DEFAULT CHARSET=utf8 COMMENT='区域围栏(路区)';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = district_boundary   */
/******************************************/
CREATE TABLE `district_boundary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adcode` varchar(50) DEFAULT NULL COMMENT '行政区划ID',
  `boundary` polygon NOT NULL COMMENT '行政区划边界围栏',
  PRIMARY KEY (`id`),
  SPATIAL KEY `boundaries` (`boundary`),
  KEY `idx_adcode` (`adcode`)
) ENGINE=InnoDB AUTO_INCREMENT=9790 DEFAULT CHARSET=utf8 COMMENT='行政区划边界围栏';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = districts   */
/******************************************/
CREATE TABLE `districts` (
  `adcode` varchar(50) NOT NULL COMMENT '行政区划ID',
  `parent_adcode` varchar(50) DEFAULT NULL COMMENT '上级行政区划ID',
  `citycode` varchar(50) DEFAULT NULL COMMENT '区号',
  `name` varchar(50) DEFAULT NULL COMMENT '行政区划名称',
  `level` varchar(50) DEFAULT NULL COMMENT '行政区划级别',
  `center` geometry DEFAULT NULL COMMENT '行政区划中心点',
  `lng` double GENERATED ALWAYS AS (st_x(`center`)) VIRTUAL COMMENT '中心点经度',
  `lat` double GENERATED ALWAYS AS (st_y(`center`)) VIRTUAL COMMENT '中心点纬度',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = erp_store_info   */
/******************************************/
CREATE TABLE `erp_store_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `vender_brand_id` bigint(20) DEFAULT NULL COMMENT '商家品牌ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `tp_id` varchar(50) DEFAULT NULL COMMENT '三方门店ID',
  `dc_id` bigint(20) DEFAULT NULL COMMENT '站点ID',
  `name` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `address` varchar(200) DEFAULT NULL COMMENT '门店地址',
  `location` point NOT NULL COMMENT '门店位置',
  `lng` double GENERATED ALWAYS AS (st_x(`location`)) VIRTUAL COMMENT '门店坐标经度',
  `lat` double GENERATED ALWAYS AS (st_y(`location`)) VIRTUAL COMMENT '门店坐标纬度',
  `provincial` bigint(20) DEFAULT NULL COMMENT '省行政代码',
  `municipal` bigint(20) DEFAULT NULL COMMENT '市行政代码',
  `district` bigint(20) DEFAULT NULL COMMENT '区行政代码',
  `flag_online` tinyint(4) DEFAULT NULL COMMENT '后台可见',
  `flag_open` tinyint(4) DEFAULT NULL COMMENT '前台可见',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_erp_store_id` (`erp_store_id`),
  SPATIAL KEY `idx_location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=2639 DEFAULT CHARSET=utf8 COMMENT='门店系统同步信息';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_00   */
/******************************************/
CREATE TABLE `ride_distance_00` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8315082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_01   */
/******************************************/
CREATE TABLE `ride_distance_01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9541402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_02   */
/******************************************/
CREATE TABLE `ride_distance_02` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9441922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_03   */
/******************************************/
CREATE TABLE `ride_distance_03` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8625882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_04   */
/******************************************/
CREATE TABLE `ride_distance_04` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7749042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_05   */
/******************************************/
CREATE TABLE `ride_distance_05` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9983962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_06   */
/******************************************/
CREATE TABLE `ride_distance_06` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=11149362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_07   */
/******************************************/
CREATE TABLE `ride_distance_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7389162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_08   */
/******************************************/
CREATE TABLE `ride_distance_08` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8844602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_09   */
/******************************************/
CREATE TABLE `ride_distance_09` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7488362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_10   */
/******************************************/
CREATE TABLE `ride_distance_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10261122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_11   */
/******************************************/
CREATE TABLE `ride_distance_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8465362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_12   */
/******************************************/
CREATE TABLE `ride_distance_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7509562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_13   */
/******************************************/
CREATE TABLE `ride_distance_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=6757682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_14   */
/******************************************/
CREATE TABLE `ride_distance_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7157722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_15   */
/******************************************/
CREATE TABLE `ride_distance_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8058962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_16   */
/******************************************/
CREATE TABLE `ride_distance_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8021682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_17   */
/******************************************/
CREATE TABLE `ride_distance_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9881522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_18   */
/******************************************/
CREATE TABLE `ride_distance_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9577322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_19   */
/******************************************/
CREATE TABLE `ride_distance_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9459322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_20   */
/******************************************/
CREATE TABLE `ride_distance_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10002242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_21   */
/******************************************/
CREATE TABLE `ride_distance_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9561722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_22   */
/******************************************/
CREATE TABLE `ride_distance_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9425482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_23   */
/******************************************/
CREATE TABLE `ride_distance_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7947922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_24   */
/******************************************/
CREATE TABLE `ride_distance_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8062882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_25   */
/******************************************/
CREATE TABLE `ride_distance_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10015322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_26   */
/******************************************/
CREATE TABLE `ride_distance_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8986682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_27   */
/******************************************/
CREATE TABLE `ride_distance_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7981162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_28   */
/******************************************/
CREATE TABLE `ride_distance_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9845922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_29   */
/******************************************/
CREATE TABLE `ride_distance_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8410402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_30   */
/******************************************/
CREATE TABLE `ride_distance_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8414082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_31   */
/******************************************/
CREATE TABLE `ride_distance_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8291602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_32   */
/******************************************/
CREATE TABLE `ride_distance_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7299602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_33   */
/******************************************/
CREATE TABLE `ride_distance_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7987442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_34   */
/******************************************/
CREATE TABLE `ride_distance_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8676082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_35   */
/******************************************/
CREATE TABLE `ride_distance_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7772842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_36   */
/******************************************/
CREATE TABLE `ride_distance_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=11223442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_37   */
/******************************************/
CREATE TABLE `ride_distance_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9294082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_38   */
/******************************************/
CREATE TABLE `ride_distance_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8741882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_39   */
/******************************************/
CREATE TABLE `ride_distance_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9806562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_40   */
/******************************************/
CREATE TABLE `ride_distance_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8070482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_41   */
/******************************************/
CREATE TABLE `ride_distance_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9458162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_42   */
/******************************************/
CREATE TABLE `ride_distance_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8395162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_43   */
/******************************************/
CREATE TABLE `ride_distance_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=6916882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_44   */
/******************************************/
CREATE TABLE `ride_distance_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9317722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_45   */
/******************************************/
CREATE TABLE `ride_distance_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=11560802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_46   */
/******************************************/
CREATE TABLE `ride_distance_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8233962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_47   */
/******************************************/
CREATE TABLE `ride_distance_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8066722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_48   */
/******************************************/
CREATE TABLE `ride_distance_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10467562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_49   */
/******************************************/
CREATE TABLE `ride_distance_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7503402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_50   */
/******************************************/
CREATE TABLE `ride_distance_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8401602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_51   */
/******************************************/
CREATE TABLE `ride_distance_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9577642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_52   */
/******************************************/
CREATE TABLE `ride_distance_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10119042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_53   */
/******************************************/
CREATE TABLE `ride_distance_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8572802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_54   */
/******************************************/
CREATE TABLE `ride_distance_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9637042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_55   */
/******************************************/
CREATE TABLE `ride_distance_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7689602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_56   */
/******************************************/
CREATE TABLE `ride_distance_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10121202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_57   */
/******************************************/
CREATE TABLE `ride_distance_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=11128402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_58   */
/******************************************/
CREATE TABLE `ride_distance_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10156442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_59   */
/******************************************/
CREATE TABLE `ride_distance_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8840602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_60   */
/******************************************/
CREATE TABLE `ride_distance_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7617642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_61   */
/******************************************/
CREATE TABLE `ride_distance_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8800922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_62   */
/******************************************/
CREATE TABLE `ride_distance_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10053522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_63   */
/******************************************/
CREATE TABLE `ride_distance_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7635682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_64   */
/******************************************/
CREATE TABLE `ride_distance_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9617762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_65   */
/******************************************/
CREATE TABLE `ride_distance_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7198322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_66   */
/******************************************/
CREATE TABLE `ride_distance_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7404122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_67   */
/******************************************/
CREATE TABLE `ride_distance_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8394922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_68   */
/******************************************/
CREATE TABLE `ride_distance_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7975962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_69   */
/******************************************/
CREATE TABLE `ride_distance_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9451042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_70   */
/******************************************/
CREATE TABLE `ride_distance_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8564802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_71   */
/******************************************/
CREATE TABLE `ride_distance_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9959002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_72   */
/******************************************/
CREATE TABLE `ride_distance_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=10827362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_73   */
/******************************************/
CREATE TABLE `ride_distance_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8449282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_74   */
/******************************************/
CREATE TABLE `ride_distance_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9405962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_75   */
/******************************************/
CREATE TABLE `ride_distance_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7201802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_76   */
/******************************************/
CREATE TABLE `ride_distance_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9066242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_77   */
/******************************************/
CREATE TABLE `ride_distance_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8666482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_78   */
/******************************************/
CREATE TABLE `ride_distance_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9944482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_79   */
/******************************************/
CREATE TABLE `ride_distance_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8075082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_80   */
/******************************************/
CREATE TABLE `ride_distance_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7057402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_81   */
/******************************************/
CREATE TABLE `ride_distance_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8252842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_82   */
/******************************************/
CREATE TABLE `ride_distance_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8423082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_83   */
/******************************************/
CREATE TABLE `ride_distance_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8717162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_84   */
/******************************************/
CREATE TABLE `ride_distance_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7854962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_85   */
/******************************************/
CREATE TABLE `ride_distance_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=11453002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_86   */
/******************************************/
CREATE TABLE `ride_distance_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=6811322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_87   */
/******************************************/
CREATE TABLE `ride_distance_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7605242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_88   */
/******************************************/
CREATE TABLE `ride_distance_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=7362922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_89   */
/******************************************/
CREATE TABLE `ride_distance_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8326442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_90   */
/******************************************/
CREATE TABLE `ride_distance_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8670482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_91   */
/******************************************/
CREATE TABLE `ride_distance_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8700082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_92   */
/******************************************/
CREATE TABLE `ride_distance_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9802362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_93   */
/******************************************/
CREATE TABLE `ride_distance_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=6726642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_94   */
/******************************************/
CREATE TABLE `ride_distance_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8229042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_95   */
/******************************************/
CREATE TABLE `ride_distance_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9894042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_96   */
/******************************************/
CREATE TABLE `ride_distance_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9074802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_97   */
/******************************************/
CREATE TABLE `ride_distance_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=8995642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_98   */
/******************************************/
CREATE TABLE `ride_distance_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9242882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_99   */
/******************************************/
CREATE TABLE `ride_distance_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `geo_hash` varchar(20) NOT NULL COMMENT '配送地址 GeoHash 值',
  `distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的骑行距离',
  `line_distance` decimal(12,2) DEFAULT NULL COMMENT '门店地址到配送地址的直线距离',
  `distance_flag` tinyint(2) NOT NULL DEFAULT '1' COMMENT '距离标记(1.直线距离、2.估算距离、3.骑行距离)',
  `duration` int(11) DEFAULT NULL COMMENT '门店地址到配送地址的骑行时间(秒)',
  `last_update_user` bigint(20) DEFAULT NULL COMMENT '订正骑行线路用户ID',
  `router` json DEFAULT NULL COMMENT '门店地址到配送地址的骑行线路',
  `created` datetime(3) NOT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `request_flag` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '请求高德标记(-1.未请求、0.无需请求、1.已请求)',
  `yn` tinyint(2) NOT NULL DEFAULT '1' COMMENT '有效性(-1.无效、1.有效)',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ride_distance` (`erp_store_id`,`address_longitude`,`address_latitude`) USING BTREE COMMENT '唯一索引',
  KEY `idx_geo_hash` (`geo_hash`) USING BTREE,
  KEY `query_idx` (`geo_hash`,`address_longitude`,`address_latitude`),
  KEY `query_request_idx` (`request_flag`,`yn`),
  KEY `query_complex_idx` (`erp_store_id`,`geo_hash`,`distance_flag`,`address_longitude`,`address_latitude`,`request_flag`,`yn`)
) ENGINE=InnoDB AUTO_INCREMENT=9257482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址骑行距离表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = ride_distance_resource   */
/******************************************/
CREATE TABLE `ride_distance_resource` (
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `address` varchar(255) NOT NULL COMMENT '配送地址',
  `address_longitude` decimal(8,5) NOT NULL COMMENT '配送地址经度',
  `address_latitude` decimal(7,5) NOT NULL COMMENT '配送地址纬度',
  `index_status` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '是否创建索引',
  `unique_key` varchar(30) DEFAULT NULL COMMENT '唯一约束键',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ride_distance` (`unique_key`) USING BTREE COMMENT '唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=25629346 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店地址到配送地址对应关系表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_big_fence   */
/******************************************/
CREATE TABLE `store_big_fence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dc_id` int(11) DEFAULT NULL COMMENT '配送中心ID',
  `erp_store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `store_fence_id` bigint(20) NOT NULL COMMENT '关联的门店电子围栏ID',
  `type` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `fence` polygon NOT NULL COMMENT '门店围栏',
  `fence_json` text GENERATED ALWAYS AS (st_asgeojson(`fence`)) VIRTUAL COMMENT '门店围栏json',
  `center` varchar(100) DEFAULT NULL COMMENT '围栏中心',
  `last_update_user` int(11) DEFAULT NULL COMMENT '最后修改人ID',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` tinyint(4) NOT NULL COMMENT '是否生效',
  `fence_name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `index_status` tinyint(4) DEFAULT '-1' COMMENT '是否已创建索引(-1: 未创建；1:已创建)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_big_fence_index` (`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  SPATIAL KEY `big_fence_index` (`fence`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店大围栏信息';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_big_fence_index   */
/******************************************/
CREATE TABLE `store_big_fence_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015874282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='大围栏数据索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence   */
/******************************************/
CREATE TABLE `store_fence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence` polygon NOT NULL COMMENT '地理围栏',
  `fence_geo_json` text GENERATED ALWAYS AS (st_asgeojson(`fence`)) VIRTUAL COMMENT '围栏json',
  `center` varchar(100) GENERATED ALWAYS AS (st_asgeojson(st_centroid(`fence`))) VIRTUAL COMMENT '围栏中心点json',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `business_type` int(11) DEFAULT NULL COMMENT '业态（经营范围）',
  `enable` tinyint(4) DEFAULT NULL COMMENT '是否生效',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modifier` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(50) DEFAULT NULL COMMENT '修改人名称',
  `modified` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  SPATIAL KEY `idx_fence` (`fence`)
) ENGINE=InnoDB AUTO_INCREMENT=130824 DEFAULT CHARSET=utf8 COMMENT='门店地理围栏信息';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_history   */
/******************************************/
CREATE TABLE `store_fence_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fence_id` bigint(20) DEFAULT NULL COMMENT '围栏ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence` polygon NOT NULL COMMENT '地理围栏',
  `fence_geo_json` text GENERATED ALWAYS AS (st_asgeojson(`fence`)) VIRTUAL COMMENT '围栏json',
  `center` varchar(100) GENERATED ALWAYS AS (st_asgeojson(st_centroid(`fence`))) VIRTUAL COMMENT '围栏中心点json',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `name` varchar(50) DEFAULT NULL COMMENT '围栏名称',
  `business_type` int(11) DEFAULT NULL COMMENT '业态（经营范围）',
  `enable` tinyint(4) DEFAULT NULL COMMENT '是否生效',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(50) DEFAULT NULL COMMENT '创建人名称',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modifier` bigint(20) DEFAULT NULL COMMENT '修改人',
  `modifier_name` varchar(50) DEFAULT NULL COMMENT '修改人名称',
  `modified` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  SPATIAL KEY `fence` (`fence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史门店地理围栏信息';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_00   */
/******************************************/
CREATE TABLE `store_fence_index_00` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1857482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_01   */
/******************************************/
CREATE TABLE `store_fence_index_01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2002362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_02   */
/******************************************/
CREATE TABLE `store_fence_index_02` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1794162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_03   */
/******************************************/
CREATE TABLE `store_fence_index_03` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1827522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_04   */
/******************************************/
CREATE TABLE `store_fence_index_04` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1744562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_05   */
/******************************************/
CREATE TABLE `store_fence_index_05` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1877282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_06   */
/******************************************/
CREATE TABLE `store_fence_index_06` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2003282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_07   */
/******************************************/
CREATE TABLE `store_fence_index_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1772842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_08   */
/******************************************/
CREATE TABLE `store_fence_index_08` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1975522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_09   */
/******************************************/
CREATE TABLE `store_fence_index_09` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1839722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_10   */
/******************************************/
CREATE TABLE `store_fence_index_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1797762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_11   */
/******************************************/
CREATE TABLE `store_fence_index_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_12   */
/******************************************/
CREATE TABLE `store_fence_index_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1676322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_13   */
/******************************************/
CREATE TABLE `store_fence_index_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1785802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_14   */
/******************************************/
CREATE TABLE `store_fence_index_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1879762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_15   */
/******************************************/
CREATE TABLE `store_fence_index_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1828682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_16   */
/******************************************/
CREATE TABLE `store_fence_index_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1796602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_17   */
/******************************************/
CREATE TABLE `store_fence_index_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1823082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_18   */
/******************************************/
CREATE TABLE `store_fence_index_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2006602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_19   */
/******************************************/
CREATE TABLE `store_fence_index_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_20   */
/******************************************/
CREATE TABLE `store_fence_index_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1859682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_21   */
/******************************************/
CREATE TABLE `store_fence_index_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1840322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_22   */
/******************************************/
CREATE TABLE `store_fence_index_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1873602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_23   */
/******************************************/
CREATE TABLE `store_fence_index_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1759922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_24   */
/******************************************/
CREATE TABLE `store_fence_index_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_25   */
/******************************************/
CREATE TABLE `store_fence_index_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1946002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_26   */
/******************************************/
CREATE TABLE `store_fence_index_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1706082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_27   */
/******************************************/
CREATE TABLE `store_fence_index_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1908882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_28   */
/******************************************/
CREATE TABLE `store_fence_index_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1847322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_29   */
/******************************************/
CREATE TABLE `store_fence_index_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1791482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_30   */
/******************************************/
CREATE TABLE `store_fence_index_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1808362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_31   */
/******************************************/
CREATE TABLE `store_fence_index_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1806562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_32   */
/******************************************/
CREATE TABLE `store_fence_index_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1899562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_33   */
/******************************************/
CREATE TABLE `store_fence_index_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1727922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_34   */
/******************************************/
CREATE TABLE `store_fence_index_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1827282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_35   */
/******************************************/
CREATE TABLE `store_fence_index_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1727082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_36   */
/******************************************/
CREATE TABLE `store_fence_index_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2033282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_37   */
/******************************************/
CREATE TABLE `store_fence_index_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1892762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_38   */
/******************************************/
CREATE TABLE `store_fence_index_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1791522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_39   */
/******************************************/
CREATE TABLE `store_fence_index_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1937042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_40   */
/******************************************/
CREATE TABLE `store_fence_index_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1911842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_41   */
/******************************************/
CREATE TABLE `store_fence_index_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1707962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_42   */
/******************************************/
CREATE TABLE `store_fence_index_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1869842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_43   */
/******************************************/
CREATE TABLE `store_fence_index_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1819882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_44   */
/******************************************/
CREATE TABLE `store_fence_index_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1837362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_45   */
/******************************************/
CREATE TABLE `store_fence_index_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1918202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_46   */
/******************************************/
CREATE TABLE `store_fence_index_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1948202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_47   */
/******************************************/
CREATE TABLE `store_fence_index_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1768962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_48   */
/******************************************/
CREATE TABLE `store_fence_index_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1950642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_49   */
/******************************************/
CREATE TABLE `store_fence_index_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2054962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_50   */
/******************************************/
CREATE TABLE `store_fence_index_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1787282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_51   */
/******************************************/
CREATE TABLE `store_fence_index_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1914202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_52   */
/******************************************/
CREATE TABLE `store_fence_index_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1847242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_53   */
/******************************************/
CREATE TABLE `store_fence_index_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1896122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_54   */
/******************************************/
CREATE TABLE `store_fence_index_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1909802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_55   */
/******************************************/
CREATE TABLE `store_fence_index_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1996762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_56   */
/******************************************/
CREATE TABLE `store_fence_index_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1878322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_57   */
/******************************************/
CREATE TABLE `store_fence_index_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2036802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_58   */
/******************************************/
CREATE TABLE `store_fence_index_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1985282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_59   */
/******************************************/
CREATE TABLE `store_fence_index_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1802322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_60   */
/******************************************/
CREATE TABLE `store_fence_index_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1922282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_61   */
/******************************************/
CREATE TABLE `store_fence_index_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1936082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_62   */
/******************************************/
CREATE TABLE `store_fence_index_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1889202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_63   */
/******************************************/
CREATE TABLE `store_fence_index_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1758802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_64   */
/******************************************/
CREATE TABLE `store_fence_index_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1933682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_65   */
/******************************************/
CREATE TABLE `store_fence_index_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1781482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_66   */
/******************************************/
CREATE TABLE `store_fence_index_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1697682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_67   */
/******************************************/
CREATE TABLE `store_fence_index_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1829682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_68   */
/******************************************/
CREATE TABLE `store_fence_index_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1924722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_69   */
/******************************************/
CREATE TABLE `store_fence_index_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1836282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_70   */
/******************************************/
CREATE TABLE `store_fence_index_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1923442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_71   */
/******************************************/
CREATE TABLE `store_fence_index_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2019962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_72   */
/******************************************/
CREATE TABLE `store_fence_index_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1958442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_73   */
/******************************************/
CREATE TABLE `store_fence_index_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1839042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_74   */
/******************************************/
CREATE TABLE `store_fence_index_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1962082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_75   */
/******************************************/
CREATE TABLE `store_fence_index_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1884682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_76   */
/******************************************/
CREATE TABLE `store_fence_index_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1767522 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_77   */
/******************************************/
CREATE TABLE `store_fence_index_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1739642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_78   */
/******************************************/
CREATE TABLE `store_fence_index_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1879042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_79   */
/******************************************/
CREATE TABLE `store_fence_index_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1679002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_80   */
/******************************************/
CREATE TABLE `store_fence_index_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1738002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_81   */
/******************************************/
CREATE TABLE `store_fence_index_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1666242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_82   */
/******************************************/
CREATE TABLE `store_fence_index_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1793322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_83   */
/******************************************/
CREATE TABLE `store_fence_index_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1879562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_84   */
/******************************************/
CREATE TABLE `store_fence_index_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1731002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_85   */
/******************************************/
CREATE TABLE `store_fence_index_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1891002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_86   */
/******************************************/
CREATE TABLE `store_fence_index_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1668442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_87   */
/******************************************/
CREATE TABLE `store_fence_index_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1761202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_88   */
/******************************************/
CREATE TABLE `store_fence_index_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1794482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_89   */
/******************************************/
CREATE TABLE `store_fence_index_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1851922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_90   */
/******************************************/
CREATE TABLE `store_fence_index_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1901802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_91   */
/******************************************/
CREATE TABLE `store_fence_index_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1920882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_92   */
/******************************************/
CREATE TABLE `store_fence_index_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1994242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_93   */
/******************************************/
CREATE TABLE `store_fence_index_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1927562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_94   */
/******************************************/
CREATE TABLE `store_fence_index_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1708002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_95   */
/******************************************/
CREATE TABLE `store_fence_index_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1968082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_96   */
/******************************************/
CREATE TABLE `store_fence_index_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2001882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_97   */
/******************************************/
CREATE TABLE `store_fence_index_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2039962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_98   */
/******************************************/
CREATE TABLE `store_fence_index_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1905802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_index_99   */
/******************************************/
CREATE TABLE `store_fence_index_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT NULL COMMENT '门店ID',
  `fence_geohash` varchar(20) DEFAULT NULL COMMENT '围栏分块后的 GeoHash 值',
  `store_fence_id` bigint(20) DEFAULT NULL COMMENT '关联的门店电子围栏ID',
  `hex_business_type` int(11) DEFAULT NULL COMMENT '围栏业态(多点超市:1;全球精选:2;海淘:4;自由购:8;便当:16;半日达:32;多点家居:64;智能购设备:128;)',
  `channel` int(11) DEFAULT NULL COMMENT '围栏渠道(通用:1;微信:2;沃尔玛小程序:4;)',
  `relation_type` tinyint(2) DEFAULT NULL COMMENT '当前分块与围栏的关系，包含/相交',
  `intersection_polygon` multipolygon DEFAULT NULL COMMENT '当前分块与围栏相交后的多边形，可能是多个多边形',
  `created` datetime(3) DEFAULT NULL COMMENT '入库时间',
  `modified` datetime(3) DEFAULT NULL COMMENT '更新时间',
  `yn` tinyint(2) DEFAULT NULL COMMENT '有效性',
  `delivery_type` bigint(20) DEFAULT '3' COMMENT '配送方式',
  `performance_type` bigint(20) DEFAULT NULL COMMENT '履约类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_fence_idx` (`fence_geohash`,`erp_store_id`,`store_fence_id`) USING BTREE COMMENT '唯一索引',
  KEY `fence_geohash_idx` (`fence_geohash`) USING BTREE,
  KEY `query_idx` (`fence_geohash`,`hex_business_type`,`channel`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2073762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='门店电子围栏按照 GeoHash 分块的索引表';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = store_fence_push   */
/******************************************/
CREATE TABLE `store_fence_push` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) DEFAULT '0' COMMENT '商家ID',
  `erp_store_id` bigint(20) DEFAULT '0' COMMENT '门店ID',
  `third_type` int(11) DEFAULT '0' COMMENT '三方类型 1：抖音',
  `third_type_name` varchar(50) DEFAULT '' COMMENT '三方类型中文名称 1：抖音',
  `store_fence_id` bigint(20) DEFAULT '0' COMMENT '关联的门店电子围栏ID',
  `third_dmall_id` varchar(100) DEFAULT '' COMMENT '通过多点其他系统调用三方，其他系统的id',
  `third_id` varchar(100) DEFAULT '' COMMENT '三方返回的id',
  `status` int(11) DEFAULT '0' COMMENT '同步状态 0未同步，1已同步，2同步失败 3删除',
  `failure_reason` text COMMENT '同步三方失败原因',
  `modified` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71162 DEFAULT CHARSET=utf8 COMMENT='门店围栏推送三方系统';


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = sync_erp_store   */
/******************************************/
CREATE TABLE `sync_erp_store` (
  `id` int(11) NOT NULL,
  `erp_store_id` int(11) DEFAULT NULL,
  `sap_id` varchar(50) DEFAULT NULL,
  `vender_id` int(11) DEFAULT NULL,
  `dc_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `vender_brand_id` int(8) DEFAULT NULL,
  `provincial` int(8) DEFAULT NULL,
  `municipal` int(8) DEFAULT NULL,
  `district` int(8) DEFAULT NULL,
  `flag_online` int(4) DEFAULT NULL,
  `flag_open` int(4) DEFAULT NULL,
  `last_update_time` datetime(3) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `enable_fence` int(4) DEFAULT NULL,
  `store_type` int(2) DEFAULT NULL,
  `hex_business_type` int(8) DEFAULT NULL,
  `provincial_name` varchar(30) DEFAULT NULL,
  `municipal_name` varchar(30) DEFAULT NULL,
  `district_name` varchar(30) DEFAULT NULL,
  `sync_created` datetime(3) DEFAULT NULL,
  `sync_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = sync_relation_data   */
/******************************************/
CREATE TABLE `sync_relation_data` (
  `id` int(11) NOT NULL,
  `road_line_id` int(8) DEFAULT NULL,
  `road_fence_id` int(8) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `yn` int(2) DEFAULT NULL,
  `station_id` int(8) DEFAULT NULL,
  `relation_store_id` int(8) DEFAULT NULL,
  `sync_created` datetime(3) DEFAULT NULL,
  `sync_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = sync_road_fence   */
/******************************************/
CREATE TABLE `sync_road_fence` (
  `id` int(11) NOT NULL,
  `dc_id` int(8) DEFAULT NULL,
  `erp_store_id` int(8) DEFAULT NULL,
  `fence_id` int(8) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  `last_update_time` datetime(3) DEFAULT NULL,
  `last_update_user` int(8) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `fence_name` varchar(50) DEFAULT NULL,
  `sync_created` datetime(3) DEFAULT NULL,
  `sync_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = sync_road_line   */
/******************************************/
CREATE TABLE `sync_road_line` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `modified` datetime(3) DEFAULT NULL,
  `yn` int(2) DEFAULT NULL,
  `erp_store_id` int(8) DEFAULT NULL,
  `first_level_line_id` int(8) DEFAULT NULL,
  `sync_created` datetime(3) DEFAULT NULL,
  `sync_modified` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = sync_store_fence   */
/******************************************/
CREATE TABLE `sync_store_fence` (
  `id` int(11) NOT NULL COMMENT '主键',
  `dc_id` int(11) DEFAULT NULL,
  `erp_store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `type` int(4) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  `last_update_time` datetime(3) DEFAULT NULL,
  `last_update_user` int(11) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `fence_name` varchar(50) DEFAULT NULL,
  `fence_aging_code` int(4) DEFAULT NULL,
  `payment_type` int(4) DEFAULT NULL,
  `default_payment_type` int(4) DEFAULT NULL,
  `hex_business_type` int(4) DEFAULT NULL,
  `channel` int(4) DEFAULT NULL,
  `created` datetime(3) DEFAULT NULL,
  `sync_created` datetime(3) DEFAULT NULL COMMENT '数据同步入库时间',
  `sync_modified` datetime(3) DEFAULT NULL COMMENT '数据同步更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


/******************************************/
/*   DatabaseName = dmall_terns   */
/*   TableName = user_gps_log   */
/******************************************/
CREATE TABLE `user_gps_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型（1-正常定位，2-无效定位）',
  `location` point NOT NULL COMMENT '定位位置',
  `lng` double GENERATED ALWAYS AS (st_x(`location`)) VIRTUAL COMMENT '用户坐标经度',
  `lat` double GENERATED ALWAYS AS (st_y(`location`)) VIRTUAL COMMENT '用户坐标纬度',
  `count` int(11) DEFAULT NULL COMMENT '定位次数',
  `yn` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_location` (`type`,`location`(25)),
  SPATIAL KEY `idx_location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=2879923 DEFAULT CHARSET=utf8 COMMENT='用户定位记录';


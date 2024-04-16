-- Export Tools
-- Time: 2024-04-16 15:35:16
-- Service: ts3026i.yz.db.inner-dmall.com:3026   Database: dmall_coupon
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_00   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_00` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_00_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_00_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346044442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表00';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_01   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_01_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_01_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344509442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表01';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_02   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_02` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_02_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_02_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345386282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表02';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_03   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_03` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_03_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_03_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345298962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表03';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_04   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_04` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_04_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_04_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346416042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表04';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_05   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_05` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(70) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_05_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_05_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346278642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表05';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_06   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_06` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_06_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_06_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343428922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表06';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_07   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_07` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_07_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_07_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344883042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表07';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_08   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_08` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_08_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_08_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343042162 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表08';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_09   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_09` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_09_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_09_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343587202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表09';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_10   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_10` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_10_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_10_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344753802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表10';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_11   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_11` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_11_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_11_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344553762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表11';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_12   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_12` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_12_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_12_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344508122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表12';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_13   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_13` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_13_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_13_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344577482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表13';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_14   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_14` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_14_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_14_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344119202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表14';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_15   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_15` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_15_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_15_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345922642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表15';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_16   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_16` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_16_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_16_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344571842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表16';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_17   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_17` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_17_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_17_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345743362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表17';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_18   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_18` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_18_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_18_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344286682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表18';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_19   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_19` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_19_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_19_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346102042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表19';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_20   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_20` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_20_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_20_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344073402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表20';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_21   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_21` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_21_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_21_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343807002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表21';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_22   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_22` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_22_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_22_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344111602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表22';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_23   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_23` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_23_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_23_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344201122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表23';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_24   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_24` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_24_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_24_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344849962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表24';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_25   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_25` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_25_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_25_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344175322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表25';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_26   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_26` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_26_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_26_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344210762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表26';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_27   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_27` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_27_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_27_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345326562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表27';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_28   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_28` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_28_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_28_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344290682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表28';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_29   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_29` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_29_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_29_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4342831722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表29';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_30   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_30` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_30_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_30_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343837802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表30';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_31   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_31` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_31_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_31_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345284882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表31';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_32   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_32` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_32_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_32_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344167282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表32';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_33   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_33` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_33_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_33_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344884602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表33';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_34   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_34` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_34_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_34_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344440882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表34';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_35   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_35` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_35_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_35_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344159962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表35';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_36   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_36` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_36_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_36_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344686762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表36';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_37   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_37` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_37_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_37_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344088042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表37';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_38   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_38` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_38_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_38_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345035002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表38';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_39   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_39` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_39_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_39_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344038362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表39';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_40   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_40` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_40_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_40_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344865762 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表40';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_41   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_41` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_41_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_41_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345248082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表41';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_42   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_42` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_42_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_42_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346105082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表42';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_43   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_43` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_43_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_43_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345021322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表43';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_44   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_44` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_44_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_44_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343906082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表44';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_45   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_45` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_45_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_45_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345927442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表45';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_46   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_46` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_46_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_46_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344353002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表46';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_47   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_47` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_47_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_47_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345045642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表47';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_48   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_48` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_48_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_48_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344151882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表48';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_49   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_49` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_49_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_49_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343765642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表49';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_50   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_50` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_50_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_50_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343517882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表50';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_51   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_51` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_51_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_51_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344060922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表51';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_52   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_52` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_52_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_52_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344006842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表52';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_53   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_53` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_53_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_53_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344672642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表53';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_54   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_54` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_54_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_54_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343820722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表54';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_55   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_55` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_55_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_55_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344497122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表55';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_56   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_56` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_56_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_56_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344265602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表56';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_57   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_57` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_57_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_57_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345046602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表57';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_58   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_58` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_58_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_58_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345456122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表58';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_59   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_59` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_59_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_59_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343881682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表59';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_60   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_60` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_60_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_60_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345454842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表60';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_61   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_61` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_61_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_61_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345277962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表61';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_62   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_62` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_62_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_62_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343430842 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表62';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_63   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_63` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_63_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_63_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345242482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表63';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_64   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_64` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_64_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_64_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345344802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表64';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_65   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_65` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_65_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_65_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343698882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表65';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_66   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_66` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_66_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_66_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345275282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表66';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_67   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_67` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_67_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_67_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343938002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表67';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_68   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_68` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_68_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_68_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4342799642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表68';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_69   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_69` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_69_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_69_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343264442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表69';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_70   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_70` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_70_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_70_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344246002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表70';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_71   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_71` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_71_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_71_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345159882 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表71';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_72   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_72` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_72_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_72_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344847962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表72';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_73   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_73` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_73_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_73_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344777322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表73';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_74   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_74` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_74_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_74_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344057202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表74';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_75   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_75` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_75_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_75_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344973802 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表75';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_76   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_76` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_76_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_76_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344456442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表76';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_77   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_77` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_77_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_77_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343632602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表77';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_78   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_78` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_78_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_78_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345577682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表78';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_79   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_79` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_79_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_79_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344133242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表79';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_80   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_80` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_80_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_80_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344170242 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表80';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_81   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_81` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_81_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_81_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343800042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表81';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_82   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_82` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_82_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_82_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344089962 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表82';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_83   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_83` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_83_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_83_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344765122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表83';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_84   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_84` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_84_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_84_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4347352042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表84';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_85   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_85` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_85_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_85_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4346310122 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表85';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_86   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_86` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_86_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_86_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344865682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表86';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_87   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_87` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_87_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_87_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344063002 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表87';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_88   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_88` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_88_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_88_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344943402 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表88';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_89   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_89` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_89_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_89_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344016922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表89';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_90   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_90` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_90_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_90_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343684362 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表90';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_91   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_91` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_91_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_91_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344220922 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表91';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_92   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_92` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_92_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_92_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4345677322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表92';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_93   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_93` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_93_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_93_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344752562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表93';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_94   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_94` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_94_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_94_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343177642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表94';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_95   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_95` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_95_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_95_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344126602 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表95';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_96   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_96` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_96_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_96_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344268042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表96';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_97   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_97` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_97_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_97_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343071042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表97';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_98   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_98` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_98_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_98_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4344676322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表98';


/******************************************/
/*   DatabaseName = dmall_coupon   */
/*   TableName = coup_log_coupon_flow_99   */
/******************************************/
CREATE TABLE `coup_log_coupon_flow_99` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(50) NOT NULL COMMENT '优惠券编号',
  `op_type` varchar(100) NOT NULL COMMENT '操作类型',
  `op_remark` varchar(100) DEFAULT NULL COMMENT '操作说明',
  `coupon_status` varchar(100) NOT NULL COMMENT '优惠券状态',
  `op_date` datetime NOT NULL COMMENT '操作日期',
  `op_user_id` int(11) DEFAULT NULL COMMENT '操作人id',
  `op_user_name` varchar(20) NOT NULL COMMENT '操作人名称',
  `cus_id` bigint(20) DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ` coup_log_coupon_flow_99_coupon_id` (`coupon_id`) USING BTREE,
  KEY ` coup_log_coupon_flow_99_coupon_code` (`coupon_code`) USING BTREE
) ENGINE=ROCKSDB AUTO_INCREMENT=4343660562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='优惠券流程跟踪表99';


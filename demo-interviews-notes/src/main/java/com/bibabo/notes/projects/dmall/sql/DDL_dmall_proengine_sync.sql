-- Export Tools
-- Time: 2024-04-16 15:37:39
-- Service: s3649i.jxq.db.dmall.com:3649   Database: dmall_proengine_sync
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_brief   */
/******************************************/
CREATE TABLE `promotion_sync_brief` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `last_sync_detail` bigint(20) NOT NULL COMMENT '最后一次同步的元数据',
  `pro_batch_num` varchar(50) DEFAULT NULL COMMENT '促销批次号，一条元数据对应一个批次，一个批次可能存在多个促销',
  `sync_source` int(11) DEFAULT NULL COMMENT '同步来源,值枚举: 1: 华北物美,2：华东物美, 85:天津物美, 56:新百连超',
  `metadata_pk` varchar(50) DEFAULT NULL COMMENT '同步元数据的主键,对应在外围系统该数据的主键',
  `parse_result` tinyint(4) NOT NULL COMMENT '最后一次同步的转换结果',
  `parse_result_brief` varchar(255) DEFAULT NULL COMMENT '最后一次同步的转换结果说明简要',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '记录是否有效',
  `erp_force_stop` int(11) DEFAULT NULL COMMENT '手动批量强制结束标识，1为强制结束，-1为手动同步',
  `partner_force_stop` int(11) DEFAULT NULL COMMENT '来客平台手动批量强制结束标识，1为强制结束，-1为手动同步',
  PRIMARY KEY (`id`),
  KEY `union_idx_msy` (`metadata_pk`,`sync_source`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1475762 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_config   */
/******************************************/
CREATE TABLE `promotion_sync_config` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_name` varchar(50) DEFAULT '' COMMENT '商家名称',
  `vender_id` bigint(11) DEFAULT NULL COMMENT '商家id',
  `vender_sap_id` varchar(50) DEFAULT NULL COMMENT '商家sapId',
  `create_source` int(11) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL COMMENT '费用承担部门id',
  `payer_name` varchar(255) DEFAULT '' COMMENT '费用承担部门',
  `payer_type` int(11) DEFAULT NULL COMMENT '费用承担类型,1:多点部门;2:商家;3:供应商',
  `dept_id_1` varchar(255) DEFAULT '' COMMENT '费用承担一级部门',
  `dept_name_1` varchar(255) DEFAULT '',
  `dept_id_2` varchar(255) DEFAULT '' COMMENT '费用承担二级部门',
  `dept_name_2` varchar(255) DEFAULT '',
  `dept_id_3` varchar(255) DEFAULT '' COMMENT '费用承担三级部门',
  `dept_name_3` varchar(255) DEFAULT '',
  `dept_id_4` varchar(255) DEFAULT '' COMMENT '费用承担四级部门',
  `dept_name_4` varchar(255) DEFAULT '',
  `order_end_time` varchar(20) DEFAULT NULL COMMENT '结单时间，线下同步促销结束时间',
  `pre_start_flag` int(11) DEFAULT NULL COMMENT '是否提前开始，1是，-1否',
  `pre_end_flag` int(11) DEFAULT NULL COMMENT '是否提前结束1是，-1否',
  `auto_verify_flag` int(11) DEFAULT NULL COMMENT '是否自动审核，1是，-1否',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL COMMENT '数据是否有效，如果被删除为-1，有效为1',
  PRIMARY KEY (`id`),
  KEY `idx_vender_id` (`vender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_config_new   */
/******************************************/
CREATE TABLE `promotion_sync_config_new` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vender_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商家名称',
  `vender_id` bigint(11) NOT NULL COMMENT '商家id',
  `payer_id` varchar(255) NOT NULL COMMENT '费用承担部门id',
  `payer_name` varchar(255) DEFAULT '' COMMENT '费用承担部门',
  `payer_type` int(11) NOT NULL COMMENT '费用承担类型,1:多点部门;2:商家;3:供应商',
  `dept_1` varchar(255) DEFAULT '' COMMENT '费用承担一级部门',
  `dept_2` varchar(255) DEFAULT '' COMMENT '费用承担二级部门',
  `dept_3` varchar(255) DEFAULT '' COMMENT '费用承担三级部门',
  `dept_4` varchar(255) DEFAULT '' COMMENT '费用承担四级部门',
  `order_end_time` varchar(20) DEFAULT NULL COMMENT '截单时间，线下同步促销结束时间',
  `pre_start_flag` int(11) NOT NULL COMMENT '是否提前开始，1是，-1否',
  `pre_end_flag` int(11) NOT NULL COMMENT '是否提前结束1是，-1否',
  `os_store_flag` int(11) NOT NULL DEFAULT '-1' COMMENT '是否过滤非os门店 1是，-1否',
  `auto_verify_flag` int(11) NOT NULL COMMENT '是否自动审核，1是，-1否',
  `pro_sub_type` varchar(255) NOT NULL COMMENT '支持的促销子类型，多个逗号 隔开',
  `applys` varchar(255) DEFAULT NULL COMMENT '不支持同步的配置，多个逗号隔开',
  `payment` tinyint(2) DEFAULT NULL COMMENT '收取方式',
  `platforms` varchar(255) NOT NULL COMMENT '线上促销平台,多个逗号隔开 ',
  `template_switch` tinyint(2) NOT NULL COMMENT '样板店拆分开关',
  `limit_rule` tinyint(2) NOT NULL COMMENT '限购规则同步开关',
  `mix_rule` tinyint(2) NOT NULL COMMENT '叠加规则同步开关',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `operator` varchar(255) NOT NULL COMMENT '操作人',
  `yn` int(11) NOT NULL COMMENT '数据是否有效，如果被删除为-1，有效为1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_detail   */
/******************************************/
CREATE TABLE `promotion_sync_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sync_channel` int(11) DEFAULT NULL COMMENT '同步渠道',
  `sync_source` int(11) NOT NULL COMMENT '同步来源,值枚举: 1: 华北物美,2：华东物美, 85:天津物美, 56:新百连超',
  `metadata_pk` varchar(50) NOT NULL COMMENT '同步元数据的主键,对应在外围系统该数据的主键',
  `trans_to_pro_num` bigint(20) DEFAULT NULL COMMENT '转换后的线上促销数量',
  `pro_batch_num` varchar(50) DEFAULT NULL COMMENT '促销批次号',
  `sync_base_info_detail` varchar(500) DEFAULT NULL COMMENT '基础信息转换说明',
  `sync_join_item_detail` mediumtext COMMENT '参与商品转换说明',
  `sync_join_executor_detail` text COMMENT '参与门店转换说明',
  `sync_condition_detail` varchar(1000) DEFAULT NULL COMMENT '促销触发、优惠、限购信息转换说明',
  `sync_metadata` mediumtext COMMENT '线下促销原始数据',
  `pro_sub_type` smallint(5) unsigned zerofill DEFAULT NULL COMMENT '促销类型',
  `operator` varchar(50) DEFAULT NULL COMMENT '操作人名字',
  `parse_result` tinyint(4) DEFAULT NULL COMMENT '同步的转换结果',
  `parse_result_brief` varchar(1000) DEFAULT NULL COMMENT '转换结果简要说明',
  `save_result` tinyint(4) DEFAULT NULL COMMENT '调促销系统api是否保存成功',
  `save_detail` text COMMENT '调促销系统api保存结果',
  `log_source` varchar(100) NOT NULL DEFAULT '' COMMENT '日志来源（同步方式）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `yn` tinyint(4) NOT NULL COMMENT '该记录是否有效',
  PRIMARY KEY (`id`),
  KEY `union_idx_msy` (`metadata_pk`,`sync_source`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12418602 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_log   */
/******************************************/
CREATE TABLE `promotion_sync_log` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(11) NOT NULL COMMENT '商家id',
  `pro_id` bigint(20) NOT NULL,
  `sync_result` varchar(50) NOT NULL DEFAULT '',
  `sync_log` text,
  `create_time` datetime NOT NULL,
  `yn` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_pro_vender_yn` (`pro_id`,`vender_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101259561 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_task   */
/******************************************/
CREATE TABLE `promotion_sync_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '任务Id',
  `vender_id` bigint(20) DEFAULT '0' COMMENT '商家id',
  `vender_name` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `task_type` int(20) NOT NULL COMMENT '任务类型',
  `task_status` int(20) NOT NULL COMMENT '任务状态',
  `pro_ids` mediumtext COMMENT '关联的促销id',
  `creater_name` varchar(50) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL,
  `yn` int(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `TASK_ID` (`task_id`,`yn`) USING BTREE,
  KEY `CREATE_TIME` (`create_time`,`yn`) USING BTREE,
  KEY `TASK_TYPE` (`task_type`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5121 DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_sync_time   */
/******************************************/
CREATE TABLE `promotion_sync_time` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `pre_sync_time` datetime NOT NULL COMMENT '上次同步时间',
  `last_sync_time` datetime NOT NULL COMMENT '上次同步回来的最大促销修改时间',
  `total_sync_count` int(11) NOT NULL COMMENT '同步次数',
  `sync_source` int(11) NOT NULL COMMENT '同步来源（VenderEnum的VenderId）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/******************************************/
/*   DatabaseName = dmall_proengine_sync   */
/*   TableName = promotion_task_log   */
/******************************************/
CREATE TABLE `promotion_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `opt_type` int(11) NOT NULL COMMENT '操作类型',
  `opt_time` datetime NOT NULL COMMENT '操作时间',
  `opt_user` varchar(50) NOT NULL COMMENT '操作人',
  `yn` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `TASK_ID` (`task_id`,`yn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10241 DEFAULT CHARSET=utf8mb4;


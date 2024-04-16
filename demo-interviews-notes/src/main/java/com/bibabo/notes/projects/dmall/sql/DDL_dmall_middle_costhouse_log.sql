-- Export Tools
-- Time: 2024-04-16 16:26:24
-- Service: m4000i-tidb-log.tc.db.dmall.com:4000   Database: dmall_middle_costhouse_log
-- ------------------------------------------------------

/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_00   */
/******************************************/
CREATE TABLE `mc_calculate_log_00` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(20) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=79091624 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_01   */
/******************************************/
CREATE TABLE `mc_calculate_log_01` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(21) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=81701054 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_02   */
/******************************************/
CREATE TABLE `mc_calculate_log_02` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(22) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77085485 */ COMMENT='算价操作记录表';


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_03   */
/******************************************/
CREATE TABLE `mc_calculate_log_03` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(23) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77173490 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_04   */
/******************************************/
CREATE TABLE `mc_calculate_log_04` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(24) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78162410 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_05   */
/******************************************/
CREATE TABLE `mc_calculate_log_05` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(25) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78449621 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_06   */
/******************************************/
CREATE TABLE `mc_calculate_log_06` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(26) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77559697 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_07   */
/******************************************/
CREATE TABLE `mc_calculate_log_07` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(27) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77849395 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_08   */
/******************************************/
CREATE TABLE `mc_calculate_log_08` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(28) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77798276 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_09   */
/******************************************/
CREATE TABLE `mc_calculate_log_09` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(29) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76379599 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_10   */
/******************************************/
CREATE TABLE `mc_calculate_log_10` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(30) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77530653 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_11   */
/******************************************/
CREATE TABLE `mc_calculate_log_11` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(31) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78290268 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_12   */
/******************************************/
CREATE TABLE `mc_calculate_log_12` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(32) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76731131 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_13   */
/******************************************/
CREATE TABLE `mc_calculate_log_13` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(33) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77101671 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_14   */
/******************************************/
CREATE TABLE `mc_calculate_log_14` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(34) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77439236 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_15   */
/******************************************/
CREATE TABLE `mc_calculate_log_15` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(35) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78089863 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_16   */
/******************************************/
CREATE TABLE `mc_calculate_log_16` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(36) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77363215 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_17   */
/******************************************/
CREATE TABLE `mc_calculate_log_17` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(37) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78078276 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_18   */
/******************************************/
CREATE TABLE `mc_calculate_log_18` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(38) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78001286 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_19   */
/******************************************/
CREATE TABLE `mc_calculate_log_19` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(39) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77637362 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_20   */
/******************************************/
CREATE TABLE `mc_calculate_log_20` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(40) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=79502741 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_21   */
/******************************************/
CREATE TABLE `mc_calculate_log_21` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(41) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76980543 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_22   */
/******************************************/
CREATE TABLE `mc_calculate_log_22` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(42) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78739456 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_23   */
/******************************************/
CREATE TABLE `mc_calculate_log_23` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(43) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78372078 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_24   */
/******************************************/
CREATE TABLE `mc_calculate_log_24` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(44) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77114850 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_25   */
/******************************************/
CREATE TABLE `mc_calculate_log_25` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(45) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77598568 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_26   */
/******************************************/
CREATE TABLE `mc_calculate_log_26` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(46) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77883910 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_27   */
/******************************************/
CREATE TABLE `mc_calculate_log_27` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(47) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77202999 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_28   */
/******************************************/
CREATE TABLE `mc_calculate_log_28` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(48) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78182149 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_29   */
/******************************************/
CREATE TABLE `mc_calculate_log_29` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(49) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77635055 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_30   */
/******************************************/
CREATE TABLE `mc_calculate_log_30` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(50) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76832808 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_31   */
/******************************************/
CREATE TABLE `mc_calculate_log_31` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(51) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77369231 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_32   */
/******************************************/
CREATE TABLE `mc_calculate_log_32` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(52) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76680367 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_33   */
/******************************************/
CREATE TABLE `mc_calculate_log_33` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(53) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76242677 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_34   */
/******************************************/
CREATE TABLE `mc_calculate_log_34` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(54) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77545522 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_35   */
/******************************************/
CREATE TABLE `mc_calculate_log_35` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(55) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77592014 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_36   */
/******************************************/
CREATE TABLE `mc_calculate_log_36` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(56) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77716131 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_37   */
/******************************************/
CREATE TABLE `mc_calculate_log_37` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(57) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77313195 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_38   */
/******************************************/
CREATE TABLE `mc_calculate_log_38` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(58) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=75826747 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_39   */
/******************************************/
CREATE TABLE `mc_calculate_log_39` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(59) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76774948 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_40   */
/******************************************/
CREATE TABLE `mc_calculate_log_40` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(60) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76505844 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_41   */
/******************************************/
CREATE TABLE `mc_calculate_log_41` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(61) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77320633 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_42   */
/******************************************/
CREATE TABLE `mc_calculate_log_42` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(62) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78353966 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_43   */
/******************************************/
CREATE TABLE `mc_calculate_log_43` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(63) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77257826 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_44   */
/******************************************/
CREATE TABLE `mc_calculate_log_44` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(64) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77839057 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_45   */
/******************************************/
CREATE TABLE `mc_calculate_log_45` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(65) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78262081 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_46   */
/******************************************/
CREATE TABLE `mc_calculate_log_46` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(66) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77126061 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_47   */
/******************************************/
CREATE TABLE `mc_calculate_log_47` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(67) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77371335 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_48   */
/******************************************/
CREATE TABLE `mc_calculate_log_48` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(68) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77673363 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_49   */
/******************************************/
CREATE TABLE `mc_calculate_log_49` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(69) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78877325 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_50   */
/******************************************/
CREATE TABLE `mc_calculate_log_50` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(70) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77344040 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_51   */
/******************************************/
CREATE TABLE `mc_calculate_log_51` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(71) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77460220 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_52   */
/******************************************/
CREATE TABLE `mc_calculate_log_52` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(72) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77294517 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_53   */
/******************************************/
CREATE TABLE `mc_calculate_log_53` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(73) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78467310 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_54   */
/******************************************/
CREATE TABLE `mc_calculate_log_54` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(74) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77547213 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_55   */
/******************************************/
CREATE TABLE `mc_calculate_log_55` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(75) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77270214 */ COMMENT='算价操作记录表';


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_56   */
/******************************************/
CREATE TABLE `mc_calculate_log_56` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(76) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77000501 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_57   */
/******************************************/
CREATE TABLE `mc_calculate_log_57` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(77) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76843679 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_58   */
/******************************************/
CREATE TABLE `mc_calculate_log_58` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(78) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77130928 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_59   */
/******************************************/
CREATE TABLE `mc_calculate_log_59` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(79) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76186026 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_60   */
/******************************************/
CREATE TABLE `mc_calculate_log_60` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(80) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77799518 */ COMMENT='算价操作记录表';


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_61   */
/******************************************/
CREATE TABLE `mc_calculate_log_61` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(81) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77173951 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_62   */
/******************************************/
CREATE TABLE `mc_calculate_log_62` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(82) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76487193 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_63   */
/******************************************/
CREATE TABLE `mc_calculate_log_63` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(83) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76846472 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_64   */
/******************************************/
CREATE TABLE `mc_calculate_log_64` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(84) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77318477 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_65   */
/******************************************/
CREATE TABLE `mc_calculate_log_65` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(85) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77303588 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_66   */
/******************************************/
CREATE TABLE `mc_calculate_log_66` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(86) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76915441 */ COMMENT='算价操作记录表';


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_67   */
/******************************************/
CREATE TABLE `mc_calculate_log_67` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(87) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78442824 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_68   */
/******************************************/
CREATE TABLE `mc_calculate_log_68` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(88) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77122587 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_69   */
/******************************************/
CREATE TABLE `mc_calculate_log_69` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(89) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77286591 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_70   */
/******************************************/
CREATE TABLE `mc_calculate_log_70` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(90) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76797909 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_71   */
/******************************************/
CREATE TABLE `mc_calculate_log_71` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(91) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76772434 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_72   */
/******************************************/
CREATE TABLE `mc_calculate_log_72` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(92) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77411059 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_73   */
/******************************************/
CREATE TABLE `mc_calculate_log_73` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(93) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77254111 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_74   */
/******************************************/
CREATE TABLE `mc_calculate_log_74` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(94) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76382463 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_75   */
/******************************************/
CREATE TABLE `mc_calculate_log_75` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(95) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76862715 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_76   */
/******************************************/
CREATE TABLE `mc_calculate_log_76` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(96) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77212206 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_77   */
/******************************************/
CREATE TABLE `mc_calculate_log_77` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(97) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78118015 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_78   */
/******************************************/
CREATE TABLE `mc_calculate_log_78` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(98) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77682664 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_79   */
/******************************************/
CREATE TABLE `mc_calculate_log_79` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(99) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77132571 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_80   */
/******************************************/
CREATE TABLE `mc_calculate_log_80` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(100) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76553277 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_81   */
/******************************************/
CREATE TABLE `mc_calculate_log_81` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(101) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76778259 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_82   */
/******************************************/
CREATE TABLE `mc_calculate_log_82` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(102) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78048352 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_83   */
/******************************************/
CREATE TABLE `mc_calculate_log_83` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(103) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77889274 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_84   */
/******************************************/
CREATE TABLE `mc_calculate_log_84` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(104) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76953194 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_85   */
/******************************************/
CREATE TABLE `mc_calculate_log_85` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(105) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77007941 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_86   */
/******************************************/
CREATE TABLE `mc_calculate_log_86` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(106) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=79173119 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_87   */
/******************************************/
CREATE TABLE `mc_calculate_log_87` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(107) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78173835 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_88   */
/******************************************/
CREATE TABLE `mc_calculate_log_88` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(108) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77255541 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_89   */
/******************************************/
CREATE TABLE `mc_calculate_log_89` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(109) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77001078 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_90   */
/******************************************/
CREATE TABLE `mc_calculate_log_90` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(110) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77173766 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_91   */
/******************************************/
CREATE TABLE `mc_calculate_log_91` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(111) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76811258 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_92   */
/******************************************/
CREATE TABLE `mc_calculate_log_92` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(112) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76410772 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_93   */
/******************************************/
CREATE TABLE `mc_calculate_log_93` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(113) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77596042 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_94   */
/******************************************/
CREATE TABLE `mc_calculate_log_94` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(114) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77374551 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_95   */
/******************************************/
CREATE TABLE `mc_calculate_log_95` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(115) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77099571 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_96   */
/******************************************/
CREATE TABLE `mc_calculate_log_96` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(116) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=76147892 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_97   */
/******************************************/
CREATE TABLE `mc_calculate_log_97` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(117) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=78482234 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_98   */
/******************************************/
CREATE TABLE `mc_calculate_log_98` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(118) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77657446 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_calculate_log_99   */
/******************************************/
CREATE TABLE `mc_calculate_log_99` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */,
  `calc_type` int(11) DEFAULT NULL COMMENT '算价类型（1正向，2逆向）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `item_id` varchar(100) DEFAULT NULL COMMENT '商品行唯一标识',
  `operation_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `ware_sku` bigint(20) DEFAULT NULL COMMENT '商品sku',
  `ref_ware_sku` bigint(20) DEFAULT NULL COMMENT '相关联sku',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `execute_log` json DEFAULT NULL COMMENT '当前操作执行记录',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `yn` int(11) NOT NULL DEFAULT '1' COMMENT '有效性 （-1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档）',
  `ware_db_id` bigint(119) DEFAULT NULL COMMENT '订单商品行主键id',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_orderId_item_created` (`order_id`,`item_id`,`created`) COMMENT 'idx_orderId_item_created',
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=77935418 */ COMMENT='算价操作记录表' /*T![placement] PLACEMENT POLICY=`storessd` */;


/******************************************/
/*   DatabaseName = dmall_middle_costhouse_log   */
/*   TableName = mc_execute_log   */
/******************************************/
CREATE TABLE `mc_execute_log` (
  `id` bigint(20) NOT NULL /*T![auto_rand] AUTO_RANDOM(5) */ COMMENT '主键',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `operator_name` varchar(128) DEFAULT NULL COMMENT '操作人名字',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `url` varchar(1024) DEFAULT NULL COMMENT '请求路径',
  `exe_type` varchar(32) DEFAULT NULL COMMENT '操作类型',
  `exe_type_desc` varchar(64) DEFAULT NULL COMMENT '操作类型描述',
  `feature_key` varchar(64) DEFAULT NULL COMMENT '特征值',
  `exe_before` json DEFAULT NULL COMMENT '操作前',
  `exe_after` json DEFAULT NULL COMMENT '操作后',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(9) NOT NULL DEFAULT '1' COMMENT '有效性 -1 无效 1 有效 2 记录有效，且可做归档 3 记录无效，且可做归档',
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  KEY `idx_created` (`created`),
  KEY `idx_feature_key` (`feature_key`),
  KEY `idx_exe_type` (`exe_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin /*T![auto_rand_base] AUTO_RANDOM_BASE=11831969 */ /*T![placement] PLACEMENT POLICY=`storessd` */;


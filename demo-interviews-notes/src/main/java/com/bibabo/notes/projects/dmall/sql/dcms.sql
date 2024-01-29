--- 商城装修基础配置表 ---
--- 1.字典表 包含频道、映射脚本...
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
) ENGINE=InnoDB AUTO_INCREMENT=2482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修楼层';
---表数据
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (1,"到家首页-O2O",1,"1","1",1,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 17:46:08",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (2,"到店首页",1,"14","14",2,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (3,"微信小程序首页",1,"12","12",3,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (5,"小程序会员首页",1,"47","47",5,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (10,"到家首页-精选",1,"4","4",2,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (11,"我的页面",1,"49","49",10,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (15,"活动页",1,"50","50",14,"SYS","SYS","2022-03-15 02:25:00","2022-03-15 02:25:00",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (241,"基础楼层",4,"1","[{\"code\":1,\"name\":\"商品通用\",\"level\":2,\"parentCode\":1},{\"code\":2,\"name\":\"商品导航\",\"level\":2,\"parentCode\":1},{\"code\":3,\"name\":\"商品秒杀\",\"level\":2,\"parentCode\":1},{\"code\":4,\"name\":\"轮播图\",\"level\":2,\"parentCode\":1},{\"code\":5,\"name\":\"快捷入口 \",\"level\":2,\"parentCode\":1},{\"code\":6,\"name\":\"图片组合\",\"level\":2,\"parentCode\":1},{\"code\":7,\"name\":\"图片热区\",\"level\":2,\"parentCode\":1},{\"code\":8,\"name\":\"楼层导航\",\"level\":2,\"parentCode\":1},{\"code\":9,\"name\":\"自定义模块\",\"level\":2,\"parentCode\":1},{\"code\":10,\"name\":\"文字轮播\",\"level\":2,\"parentCode\":1},{\"code\":11,\"name\":\"视频\",\"level\":2,\"parentCode\":1},{\"code\":12,\"name\":\"方形卡片\",\"level\":2,\"parentCode\":1},{\"code\":17,\"name\":\"附近门店\",\"level\":2,\"parentCode\":1},{\"code\":19,\"name\":\"文本\",\"level\":2,\"parentCode\":1},{\"code\": 22,\"name\": \"话题互动\",\"level\": 2,\"parentCode\": 1}]",10,"SYS","刘悦","2022-03-15 02:25:00","2024-01-22 11:27:19",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (281,"营销楼层",4,"2","[{\"code\":13,\"name\":\"新人楼层\",\"level\":2,\"parentCode\":2},{\"code\":14,\"name\":\"直播\",\"level\":2,\"parentCode\":2},{\"code\":15,\"name\":\"优惠券楼层\",\"level\":2,\"parentCode\":2},{\"code\":20,\"name\":\"智能优惠券 \",\"level\":2,\"parentCode\":2},{\"code\":16,\"name\":\"抽奖楼层\",\"level\":2,\"parentCode\":2},{\"code\":18,\"name\":\"活动规则\",\"level\":2,\"parentCode\":2},{\"code\":21,\"name\":\"限时秒券\",\"level\":2,\"parentCode\":2}]",11,"SYS","刘悦","2022-03-15 02:25:00","2023-04-18 18:07:01",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (361,"APP客户端",6,"APP","APP",2,"SYS","SYS","2022-03-15 21:31:15","2022-03-28 15:56:33",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (401,"微信小程序",6,"9","9",3,"SYS","SYS","2022-03-15 21:31:15","2022-03-18 10:49:25",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (481,"微信拼团小程序",6,"16","16",5,"SYS","SYS","2022-03-15 21:31:15","2022-03-18 10:49:25",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (601,"模板中心",1,"54","54",15,"SYS","SYS","2022-04-01 14:06:18","2022-04-01 14:08:50",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (641,"首页",7,"1","1",1,"SYS","SYS","2022-04-01 15:41:29","2022-04-01 15:41:29",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (681,"分类",7,"2","2",2,"SYS","SYS","2022-04-01 15:41:29","2022-04-01 15:41:29",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (721,"购物车",7,"4","4",4,"SYS","SYS","2022-04-01 15:41:29","2022-06-23 23:05:34",1);
INSERT INTO `sys_dict` (`id`,`name`,`type`,`code`,`value`,`sort`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (761,"我的",7,"5","5",5,"SYS","SYS","2022-04-01 15:41:29","2022-06-23 23:05:34",1);

---接入端、商家相关。tenant_id租户是租房者
---2.接入端基础表，商家可以在哪些渠道接入，比如小程序、APP...
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
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8 COMMENT='接入端管理表';
---表数据
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (41,1,"多点","9","多点微信小程序",null,1,1,"刘晓玺","2022-05-12 23:17:23","孙磊","2023-12-21 23:49:17",74);
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (81,1,"多点","36","多点支付宝小程序",null,0,0,"刘晓玺","2022-05-13 10:32:32","刘晓玺","2022-09-23 13:39:58",4);
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (121,1,"多点","APP","APP客户端",null,1,1,"刘晓玺","2022-05-16 10:12:11","孙磊","2024-01-24 00:53:48",139);
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (241,14,"物美","16","物美微信拼团小程序",null,1,1,"刘悦","2022-09-20 21:23:48","刘悦","2023-04-13 17:46:47",13);
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (281,14,"物美","9","物美微信小程序",null,1,1,"孙磊","2022-09-20 23:52:44","孙磊","2023-11-23 23:04:09",21);
INSERT INTO `access_client` (`id`,`tenant_id`,`tenant_name`,`platform_code`,`platform_name`,`inner_channel`,`status`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (361,14,"物美","54","物美抖音小程序",null,1,1,"孙磊","2023-09-05 23:06:57","孙磊","2023-09-05 23:07:07",2);

---3.商家接入了哪些渠道，比如物美接入了多个渠道，多点小程序、App、物美小程序...
---SELECT * FROM `access_vender_info` where `vender_id`  = 1 and `yn` = 1 LIMIT 200;
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
) ENGINE=InnoDB AUTO_INCREMENT=2722 DEFAULT CHARSET=utf8 COMMENT='接入端商家关联信息表';
---表数据
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (121,81,1,"北京物美","[{\"storeName\":\"古城店\",\"storeId\":6},{\"storeName\":\"八角北里店\",\"storeId\":9},{\"storeName\":\"昌平城北店\",\"storeId\":11},{\"storeName\":\"新隆店\",\"storeId\":15},{\"storeName\":\"北大地店\",\"storeId\":16},{\"storeName\":\"旧宫店\",\"storeId\":17},{\"storeName\":\"建兴店\",\"storeId\":18},{\"storeName\":\"天通苑店\",\"storeId\":19},{\"storeName\":\"万源店\",\"storeId\":149},{\"storeName\":\"密云果园店\",\"storeId\":184},{\"storeName\":\"开阳桥店\",\"storeId\":186},{\"storeName\":\"丰体时代店\",\"storeId\":183},{\"storeName\":\"清河店\",\"storeId\":148},{\"storeName\":\"白纸坊店\",\"storeId\":195},{\"storeName\":\"马家堡店\",\"storeId\":196},{\"storeName\":\"德胜门店\",\"storeId\":198},{\"storeName\":\"和平新城店\",\"storeId\":202},{\"storeName\":\"安外店\",\"storeId\":204},{\"storeName\":\"亦庄店\",\"storeId\":205},{\"storeName\":\"时代风帆店\",\"storeId\":209},{\"storeName\":\"良乡店\",\"storeId\":222},{\"storeName\":\"燕化星城店\",\"storeId\":225},{\"storeName\":\"北太平庄店\",\"storeId\":234},{\"storeName\":\"双峪环岛店\",\"storeId\":240},{\"storeName\":\"通州三间房店\",\"storeId\":249},{\"storeName\":\"西黄村二店\",\"storeId\":261},{\"storeName\":\"京良路店\",\"storeId\":277},{\"storeName\":\"陶然亭店\",\"storeId\":273},{\"storeName\":\"田村店\",\"storeId\":291},{\"storeName\":\"太阳岛店\",\"storeId\":292},{\"storeName\":\"后沙峪店\",\"storeId\":321},{\"storeName\":\"三旗百汇店\",\"storeId\":339},{\"storeName\":\"沙城店\",\"storeId\":365},{\"storeName\":\"总部零号店\",\"storeId\":358},{\"storeName\":\"冯村店\",\"storeId\":364},{\"storeName\":\"燕郊东贸店\",\"storeId\":10443},{\"storeName\":\"紫竹院店\",\"storeId\":10483},{\"storeName\":\"金宝街店\",\"storeId\":10485},{\"storeName\":\"固安店\",\"storeId\":10486},{\"storeName\":\"丽泽桥店\",\"storeId\":10522},{\"storeName\":\"团购三店\",\"storeId\":11285},{\"storeName\":\"崇文门店\",\"storeId\":12922},{\"storeName\":\"大兴清城店\",\"storeId\":13020},{\"storeName\":\"隆达路店\",\"storeId\":13030}]",1,"刘晓玺","2022-05-13 10:32:32","刘晓玺","2022-05-13 10:43:00",3);
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (321,41,1,"北京物美","[{\"storeName\":\"全部门店\",\"storeId\":-1}]",1,"刘晓玺","2022-05-23 14:53:28","孙磊","2023-12-21 23:49:17",42);
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (401,121,1,"北京物美","[{\"storeName\":\"全部门店\",\"storeId\":-1}]",1,"刘悦","2022-06-23 23:50:52","孙磊","2024-01-24 00:53:48",112);
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (641,241,1,"北京物美","[{\"storeName\":\"全部门店\",\"storeId\":-1}]",1,"刘悦","2022-09-20 21:23:48","刘悦","2023-04-13 17:46:47",12);
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (681,281,1,"北京物美","[{\"storeName\":\"全部门店\",\"storeId\":-1}]",1,"孙磊","2022-09-20 23:52:44","孙磊","2023-11-23 23:04:09",20);
INSERT INTO `access_vender_info` (`id`,`access_id`,`vender_id`,`vender_name`,`store_infos`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2441,361,1,"北京物美","[{\"storeName\":\"全部门店\",\"storeId\":-1}]",1,"孙磊","2023-09-05 23:06:57","孙磊","2023-09-05 23:06:57",1);

---4.接入端与频道的关联表，一个接入端可以有哪些频道。比如APP端可装修如下频道
---SELECT * FROM `access_channel_info` where `access_id` = 121 and `yn` = 1 LIMIT 200;
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
) ENGINE=InnoDB AUTO_INCREMENT=3042 DEFAULT CHARSET=utf8 COMMENT='接入端频道关联信息表';
---表数据
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (441,121,81,"APP到家首页",1,"刘晓玺","2022-05-16 10:12:11","孙磊","2024-01-24 00:53:48",113);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (921,121,161,"导航2N楼层tab页",1,"刘悦","2022-06-23 23:50:52","孙磊","2024-01-24 00:53:48",112);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (961,121,201,"活动页",1,"刘悦","2022-06-23 23:50:52","孙磊","2024-01-24 00:53:48",112);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1281,121,521,"百货聚合首页",1,"刘悦","2022-07-21 16:13:54","孙磊","2024-01-24 00:53:48",100);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1321,121,561,"百货门店二级页",1,"刘悦","2022-07-21 16:13:54","孙磊","2024-01-24 00:53:48",100);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1761,121,641,"自定义模块",1,"孙磊","2022-11-17 22:49:16","孙磊","2024-01-24 00:53:48",54);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1801,121,681,"APP付费会员页",1,"孙磊","2023-02-21 23:03:26","孙磊","2024-01-24 00:53:48",28);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1881,121,761,"个人中心",1,"孙磊","2023-03-21 23:02:49","孙磊","2024-01-24 00:53:48",25);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2001,121,801,"新百本地生活",1,"孙磊","2023-05-04 22:21:00","孙磊","2024-01-24 00:53:48",24);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2121,121,841,"重百超+汽+电+百首页",1,"孙磊","2023-05-23 22:39:00","孙磊","2024-01-24 00:53:48",21);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2161,121,881,"重百汽+电+百首页",1,"孙磊","2023-05-23 22:39:00","孙磊","2024-01-24 00:53:48",21);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2241,121,921,"重百百货商城首页",1,"孙磊","2023-07-26 00:08:12","孙磊","2024-01-24 00:53:48",19);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (2441,121,1041,"麦德龙APP全城配首页",1,"孙磊","2023-09-21 22:34:55","孙磊","2024-01-24 00:53:48",16);
INSERT INTO `access_channel_info` (`id`,`access_id`,`channel_id`,`channel_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (3041,121,1121,"看点首页",1,"王晶磊","2024-01-23 11:15:10","孙磊","2024-01-24 00:53:48",7);

---频道相关
--- 5.频道信息表，APP首页装修、小程序我的装修、活动页装修...
--- SELECT * FROM `channel_info` LIMIT 200;
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
) ENGINE=InnoDB AUTO_INCREMENT=1122 DEFAULT CHARSET=utf8 COMMENT='频道管理表';
--- 表数据
INSERT INTO `channel_info` (`id`,`channel_name`,`page_code`,`page_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (1,"小程序O2O首页",12,"微信小程序首页",1,"刘晓玺","2022-05-12 20:41:09","刘晓玺","2022-05-17 16:03:32",2);
INSERT INTO `channel_info` (`id`,`channel_name`,`page_code`,`page_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (41,"小程序精选首页",17,"小程序精选",1,"刘晓玺","2022-05-12 20:43:00","刘晓玺","2022-05-12 20:43:00",1);
INSERT INTO `channel_info` (`id`,`channel_name`,`page_code`,`page_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (81,"APP到家首页",1,"到家首页-O2O",1,"刘晓玺","2022-05-12 20:44:01","刘晓玺","2022-05-12 20:44:01",1);
INSERT INTO `channel_info` (`id`,`channel_name`,`page_code`,`page_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (121,"微信会员中心页",42,"微信会员中心页",1,"刘晓玺","2022-05-12 20:44:18","刘晓玺","2022-05-12 20:44:18",1);
INSERT INTO `channel_info` (`id`,`channel_name`,`page_code`,`page_name`,`yn`,`creator`,`create_time`,`modifier`,`modify_time`,`version`) VALUES (161,"导航2N楼层tab页",99,"导航2N楼层tab页",1,"刘晓玺","2022-05-12 20:46:00","刘晓玺","2022-05-12 20:46:00",1);


---以下是楼层相关表
---6.楼层表，App进去首页后的那些分层展示
---SELECT * FROM `layout` LIMIT 20;
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
---表数据
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (1,2,15,"优惠券","https://download.dmallcdn.com/8ff481567dc143b3998fc91337b81ed5.png",1,1,1,"0",1,"刘晓玺","2022-05-12 21:08:00","刘悦","2022-06-23 23:27:13",1);
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (81,1,4,"图片轮播","https://download.dmallcdn.com/7cbe8f8f78d140978559be9e99322087.png",1,1,1,"1",0,"刘晓玺","2022-05-12 21:10:50","重百测试商家管理员","2022-05-15 17:13:12",1);
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (121,1,5,"快捷入口","https://download.dmallcdn.com/196731a9d8b049f7912550eb2da4a830.png",1,1,1,"0,1",0,"刘晓玺","2022-05-12 21:11:45","孙磊","2023-08-28 18:41:30",1);
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (161,1,10,"文字轮播","https://download.dmallcdn.com/1c8a3636425e4e53bae7d97aee18bf9d.png",1,1,1,"0",0,"刘晓玺","2022-05-12 21:12:28","重百测试商家管理员","2022-05-15 17:13:28",1);
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (441,1,2,"商品导航","https://download.dmallcdn.com/20c18463984d45788eb0f16ea7c05856.png",1,1,0,"",0,"刘晓玺","2022-05-12 21:25:33",null,null,1);
INSERT INTO `layout` (`id`,`first_category_id`,`second_category_id`,`name`,`thumbnail_img`,`schedule`,`margin_top`,`bg_config`,`bg_type`,`intelligence_banner`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (681,2,13,"新人楼层","https://download.dmallcdn.com/3c3fdaff223e49108c579918a6d6dacc.png",1,0,1,"1",0,"孙磊","2022-11-17 23:05:20","孙磊","2022-11-17 23:09:51",1);

---6.楼层样式表，比如查看图片轮播层的样式都有哪些
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
---表数据
INSERT INTO `layout_style` (`id`,`name`,`remark`,`code`,`thumbnail_img_url`,`thumbnail_selection_img_url`,`bit_img_url`,`layout_id`,`choose_channel_type`,`choose_vender_type`,`choose_vender_ids`,`front_version`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (721,"图片热区","图片热区",99,"https://download.dmallcdn.com/9a4d770688ad41d7857d015e5761c7cb.png","https://download.dmallcdn.com/be0124a210034aa6a710658626893f7a.png","https://download.dmallcdn.com/1eb39ea8e49e418785f1248b32ed4e79.png",401,1,2,"[58]","[{\"code\":1,\"endVersion\":\"最高版本\",\"endVersionKey\":2147483647,\"name\":\"Android\",\"startVersion\":\"5.4.9\",\"startVersionKey\":75},{\"code\":2,\"endVersion\":\"最高版本\",\"endVersionKey\":2147483647,\"name\":\"IOS\",\"startVersion\":\"5.4.9\",\"startVersionKey\":75},{\"code\":3,\"endVersion\":\"最高版本\",\"endVersionKey\":2147483647,\"name\":\"微信小程序\",\"startVersion\":\"4.6.0\",\"startVersionKey\":40},{\"code\":4,\"endVersion\":\"最高版本\",\"endVersionKey\":2147483647,\"name\":\"支付宝小程序\",\"startVersion\":\"5.4.0\",\"startVersionKey\":72},{\"code\":5,\"endVersion\":\"最高版本\",\"endVersionKey\":2147483647,\"name\":\"抖音小程序\",\"startVersion\":\"1.0.0\",\"startVersionKey\":1}]","刘晓玺","2022-05-12 22:14:51","孙磊","2024-01-24 16:22:17",1);

---7.楼层样式扩展属性表，如顶部通栏的样式扩展属性
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
) ENGINE=InnoDB AUTO_INCREMENT=184922 DEFAULT CHARSET=utf8 COMMENT='楼层样式扩展属性表';
---表数据
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (157961,41,2,"1","自定义",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158001,41,2,"26","星图广告","[\"ATL-Dma-DTbannerys\",\"ATL-Dma-Glx-Mini-RSActtJJ\"]",null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158041,41,1,"1","活动页面",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158081,41,1,"20","固定频道","[{\"code\":\"dLink://home\",\"value\":\"首页\"},{\"code\":\"dLink://category\",\"value\":\"分类页\"},{\"code\":\"dLink://cart\",\"value\":\"购物车\"},{\"code\":\"dLink://coupon\",\"value\":\"优惠券列表\"}]",null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158121,41,1,"3","商品详情",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158161,41,1,"2","商品分类",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158201,41,1,"5","自定义",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158241,41,3,"1","坑位尺寸","[{\"width\":\"750\"}]",null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158281,41,3,"4","高度自定义",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158321,41,3,"7","最大坑位数","{\"maxValue\":\"99\"}",null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158361,41,3,"9","背景图片","{\"defaultImg\":\"\",\"width\":\"750\",\"height\":\"\"}",null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158401,41,3,"12","人群定向",null,null,null,null,null,1);
INSERT INTO `layout_style_ext_property` (`id`,`layout_style_id`,`type`,`code`,`name`,`value`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (158441,41,3,"13","海报模版","[{\"key\":\"4\",\"labels\":[{\"value\":\"58\"}]}]",null,null,null,null,1);


---8.楼层样式适配频道表，某个楼层样式可以用在哪些频道下
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
) ENGINE=InnoDB AUTO_INCREMENT=195482 DEFAULT CHARSET=utf8 COMMENT='楼层样式适配频道表';
---表数据
INSERT INTO `layout_style_adapter_channel` (`id`,`layout_style_id`,`tenant_id`,`platform_code`,`channel_id`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (153721,41,1,"34",1,null,null,null,null,1);
INSERT INTO `layout_style_adapter_channel` (`id`,`layout_style_id`,`tenant_id`,`platform_code`,`channel_id`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (153761,41,1,"9",1,null,null,null,null,1);
INSERT INTO `layout_style_adapter_channel` (`id`,`layout_style_id`,`tenant_id`,`platform_code`,`channel_id`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (153801,41,1,"APP",561,null,null,null,null,1);
INSERT INTO `layout_style_adapter_channel` (`id`,`layout_style_id`,`tenant_id`,`platform_code`,`channel_id`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (153841,41,14,"54",241,null,null,null,null,1);
INSERT INTO `layout_style_adapter_channel` (`id`,`layout_style_id`,`tenant_id`,`platform_code`,`channel_id`,`creator`,`create_time`,`modifier`,`modify_time`,`yn`) VALUES (153881,41,14,"9",1,null,null,null,null,1);

---9.频道装修表，哪个租户下的哪个平台下的哪个商家下的哪个门店的使用了哪种频道进行装修
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
) ENGINE=InnoDB AUTO_INCREMENT=17322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='频道装修';
---表数据
INSERT INTO `channel_decoration` (`id`,`tenant_id`,`vender_id`,`store_id`,`category`,`platform_code`,`channel_id`,`page_code`,`name`,`bg_img_url`,`enabled`,`status`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (15241,1,1,1081,2,"APP",81,1,"北京物美非58家-投放中",null,1,1,"张昊阳","张昊阳","2023-12-13 00:05:43","2024-01-29 09:21:49",1);
INSERT INTO `channel_decoration` (`id`,`tenant_id`,`vender_id`,`store_id`,`category`,`platform_code`,`channel_id`,`page_code`,`name`,`bg_img_url`,`enabled`,`status`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (14121,1,1,2961,2,"APP",81,1,"中国传媒大学",null,1,1,"张昊阳","陈淑晓","2023-09-11 18:01:03","2023-09-23 15:16:37",1);
INSERT INTO `channel_decoration` (`id`,`tenant_id`,`vender_id`,`store_id`,`category`,`platform_code`,`channel_id`,`page_code`,`name`,`bg_img_url`,`enabled`,`status`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`) VALUES (16281,1,1,3681,2,"APP",81,1,"北京物美（优+）58家-投放中",null,1,1,"陈淑晓","张昊阳","2023-12-19 18:05:31","2024-01-29 09:20:52",1);


---开始对哪个商家门店的哪个频道进行装修
---10.装修页面
---SELECT * FROM `decoration_page` where `channel_decoration_id` in (3561) LIMIT 200;
CREATE TABLE `decoration_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` int(11) NOT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `category` tinyint(4) DEFAULT NULL COMMENT '门店类型',
  `platform_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台编码',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '频道ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置名称',
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
) ENGINE=InnoDB AUTO_INCREMENT=290482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修页';
---表数据
INSERT INTO `decoration_page` (`id`,`vender_id`,`store_id`,`category`,`platform_code`,`channel_id`,`name`,`status`,`enabled`,`page_code`,`business_activity_id`,`template_id`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`tenant_id`,`channel_decoration_id`,`version`,`source`) VALUES (268641,1,1081,2,"APP",81,"多点-APP客户端-APP到家首页-10.11北美双井及其他10家测试店-首页的页面复制复制复制复制复制复制复制",0,0,1,39161,null,-1,"{\"bgColor\":\"#f4f4f4\",\"endTime\":1945958399000,\"intelligenceColor\":\"orange\",\"intelligenceStyleId\":321,\"intelligenceUrl\":\"https://img.dmallcdn.com/wumart/smart_image/63dafb0e-f308-11ec-a7cb-3a6c08b2d3ec\",\"isLocation\":0,\"pageTheme\":{\"bgColor\":\"#f4f4f4\",\"intelligenceColor\":\"orange\",\"intelligenceStyleId\":321,\"intelligenceUrl\":\"https://img.dmallcdn.com/wumart/smart_image/63dafb0e-f308-11ec-a7cb-3a6c08b2d3ec\"},\"startTime\":1702396800000}","黄宇蝶","张昊阳","2022-10-17 19:47:29","2023-12-19 10:33:32",1,1,3561,7153,1);
INSERT INTO `decoration_page` (`id`,`vender_id`,`store_id`,`category`,`platform_code`,`channel_id`,`name`,`status`,`enabled`,`page_code`,`business_activity_id`,`template_id`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`tenant_id`,`channel_decoration_id`,`version`,`source`) VALUES (78841,1,1081,2,"APP",81,"多点-APP客户端-APP到家首页-10.11北美双井及其他10家测试店-首页的页面复制复制复制复制复制复制",0,0,1,19041,null,-1,"{\"bgColor\":\"#f4f4f4\",\"endTime\":1702396799000,\"intelligenceColor\":\"orange\",\"intelligenceStyleId\":321,\"intelligenceUrl\":\"https://img.dmallcdn.com/wumart/smart_image/63dafb0e-f308-11ec-a7cb-3a6c08b2d3ec\",\"isLocation\":0,\"pageTheme\":{\"bgColor\":\"#f4f4f4\",\"intelligenceColor\":\"orange\",\"intelligenceStyleId\":321,\"intelligenceUrl\":\"https://img.dmallcdn.com/wumart/smart_image/63dafb0e-f308-11ec-a7cb-3a6c08b2d3ec\"},\"startTime\":1664553600000}","黄宇蝶","张昊阳","2022-10-17 19:47:29","2023-12-13 00:06:05",1,1,3561,7148,1);


---11.页面的楼层装修，如首页页面
---SELECT * FROM `decoration_layout` WHERE `decoration_page_id` = 268641 and `yn` = 1
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
) ENGINE=InnoDB AUTO_INCREMENT=3149642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修楼层';
---表数据
INSERT INTO `decoration_layout` (`id`,`decoration_page_id`,`layout_style_id`,`layout_info_id`,`type`,`schedule`,`data_from`,`sort`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`schedule_start_time`,`schedule_end_time`,`style_type`,`composite_type`) VALUES (2568241,268641,1241,null,5,1,1,3,"快捷入口",0,-1,"{\"adKey\":\"\",\"adKeyName\":\"\",\"positionLimit\":24,\"resource\":false,\"syncCount\":0}","陈淑晓","陈淑晓","2023-03-31 18:14:24","2023-12-19 10:33:32",1,null,null,201,null);
INSERT INTO `decoration_layout` (`id`,`decoration_page_id`,`layout_style_id`,`layout_info_id`,`type`,`schedule`,`data_from`,`sort`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`schedule_start_time`,`schedule_end_time`,`style_type`,`composite_type`) VALUES (2568201,268641,1601,null,13,1,37,1,"新人楼层",0,-1,"{\"adKey\":\"\",\"adKeyName\":\"\",\"bgImgUrl\":\"https://img.dmallcdn.com/dshop/202304/229f033e-5abe-4292-b0be-045784fceb57\",\"buttonColor\":\"#FF433E\",\"buttonImgUrl\":\"https://img.dmallcdn.com/dshop/202304/f7152e0d-6576-463d-8864-f1d75be90f2d\",\"newUserInfo\":{\"activityId\":6601,\"activityName\":\"北京物美新人活动\"},\"positionLimit\":-1,\"resource\":false,\"syncCount\":0,\"textColor\":\"1\"}","贾一鸣","贾一鸣","2023-04-06 11:57:21","2023-12-13 00:06:05",1,null,null,202,null);
INSERT INTO `decoration_layout` (`id`,`decoration_page_id`,`layout_style_id`,`layout_info_id`,`type`,`schedule`,`data_from`,`sort`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`schedule_start_time`,`schedule_end_time`,`style_type`,`composite_type`) VALUES (2662321,268641,41,null,4,0,1,2,"图片轮播",0,-1,"{\"positionLimit\":99}","移动营销研发组1","移动营销研发组1","2023-12-19 10:30:27","2023-12-19 10:30:27",1,null,null,19,null);


---12.楼层坑位装修，哪个页面下的哪个楼层下的哪种样式下的哪个坑位，填充一些链接
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
) ENGINE=InnoDB AUTO_INCREMENT=82793522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='装修坑位';
---表数据
INSERT INTO `decoration_layout_position` (`id`,`decoration_page_id`,`decoration_layout_id`,`display_type`,`forward_type`,`forward_key`,`img_url`,`data_from`,`sort`,`vender_id`,`store_id`,`category`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`backup_type`) VALUES (64920321,268641,2577361,1,3,"100398","https://img.dmallcdn.com/20211009/040d4d22-e9de-4173-8860-d312c694b7c8",1,326,1,null,null,"小不为男式手套",null,64907281,"{\"sku\": 100398, \"rfId\": \"457682\", \"specifiedStore\": 0, \"skuResourceType\": 1}",null,null,"2023-12-12 23:26:07","2023-12-12 22:53:37",1,null);
INSERT INTO `decoration_layout_position` (`id`,`decoration_page_id`,`decoration_layout_id`,`display_type`,`forward_type`,`forward_key`,`img_url`,`data_from`,`sort`,`vender_id`,`store_id`,`category`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`backup_type`) VALUES (64921601,268641,2577361,1,3,"101631843","https://img.dmallcdn.com/20200522/10a0b9e2-9667-474b-b559-d24ccf17e4cb",1,358,1,null,null,"古船香思红豆软吐司面包 440g",null,64907281,"{\"sku\": 101631843, \"rfId\": \"966663\", \"specifiedStore\": 0, \"skuResourceType\": 1}",null,null,"2023-12-12 23:26:07","2023-12-12 22:53:37",1,null);
INSERT INTO `decoration_layout_position` (`id`,`decoration_page_id`,`decoration_layout_id`,`display_type`,`forward_type`,`forward_key`,`img_url`,`data_from`,`sort`,`vender_id`,`store_id`,`category`,`name`,`status`,`parent`,`properties`,`creator`,`modifier`,`create_time`,`modify_time`,`yn`,`backup_type`) VALUES (64922881,268641,2577361,1,3,"192205","https://img.dmallcdn.com/20210903/5d80c869-a546-4395-a66c-a18e26dbaca8",1,390,1,null,null,"河蟹小 约70g/只",null,64907281,"{\"sku\": 192205, \"rfId\": \"418717\", \"specifiedStore\": 0, \"skuResourceType\": 1}",null,null,"2023-12-12 23:26:07","2023-12-12 22:53:37",1,null);


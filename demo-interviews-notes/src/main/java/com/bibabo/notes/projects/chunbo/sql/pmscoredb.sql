/*
Navicat MySQL Data Transfer

Source Server         : dms-fukuixiang
Source Server Version : 50628
Source Host           : birdb-dms.prod.chunbo.com:3311
Source Database       : pmscoredb

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2023-02-20 15:50:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '所在快递',
  `account_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '账户ID',
  `type` tinyint(3) NOT NULL DEFAULT '2' COMMENT '帐号类型 1:配送商管理员,2:配送商普通用户',
  `staff_number` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '员工编号',
  `staff_sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别：1:男、2:女',
  `full_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '名称',
  `password` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `distributors_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送商编码',
  `expire_date` timestamp NULL DEFAULT '1970-10-01 00:00:00' COMMENT '账号过期时间',
  `valid_duration` int(11) DEFAULT '60' COMMENT '密码有效期',
  `memo` varchar(120) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `last_login_time` date DEFAULT '1970-10-01' COMMENT '最后一次登录日期',
  `login_failed_count` int(11) DEFAULT '0' COMMENT '最近登录密码错误次数',
  `office_tele` varchar(16) COLLATE utf8_bin DEFAULT '' COMMENT '办公电话',
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '手机',
  `mobile2` varchar(16) COLLATE utf8_bin DEFAULT '' COMMENT '手机',
  `email` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '邮件',
  `department` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `intendant_user_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `disabled_datetime` datetime DEFAULT NULL COMMENT '停用时间',
  `enabled_datetime` datetime DEFAULT NULL COMMENT '启用时间',
  `delete_date` date DEFAULT NULL COMMENT '删除日期',
  `thumb_path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `origin_path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '原图地址',
  `id_number` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '身份证号',
  `account_number` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '银行卡号',
  `recruitment_channel` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '招聘渠道:0--无 1--尚行 2--合创 3--自招（内部推荐)',
  PRIMARY KEY (`unit_id`,`account_id`),
  KEY `Account_I1` (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for account_pwd_route
-- ----------------------------
DROP TABLE IF EXISTS `account_pwd_route`;
CREATE TABLE `account_pwd_route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `account_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户ID',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码',
  `unit_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '所在快递',
  `entry_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pwd_route_idxI1` (`account_id`,`unit_id`) USING BTREE,
  KEY `pwd_route_idxI2` (`entry_datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11392 DEFAULT CHARSET=utf8 COMMENT='账户密码修改流水表';

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `account_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '账户ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`unit_id`,`account_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for business_config
-- ----------------------------
DROP TABLE IF EXISTS `business_config`;
CREATE TABLE `business_config` (
  `config_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成',
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递公司ID',
  `attr_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '属性名称 转单分拣、返货分拣、转单站点',
  `attr_value` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '属性值 ',
  `distributors_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '设置属性值的单位编码',
  PRIMARY KEY (`config_id`),
  KEY `Business_Config_I1` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1370 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for business_logo
-- ----------------------------
DROP TABLE IF EXISTS `business_logo`;
CREATE TABLE `business_logo` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '配送商id',
  `thumb_path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `origin_path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '原图地址',
  `image_blog` mediumblob COMMENT '图片blog类型， 只有上传失败的时候， 才会存图片',
  `image_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名称',
  `upload_dfs` tinyint(4) DEFAULT '0' COMMENT '是否上传到dfs：1是， 0否，-1失败',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for business_unit
-- ----------------------------
DROP TABLE IF EXISTS `business_unit`;
CREATE TABLE `business_unit` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'bumen编码相同 系统自动生成唯一  企业不同  站点编码可以',
  `unit_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '部门编码 快递下唯一',
  `mnemonic_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '助记码',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型 1:配送商,2:职能部门,3:配送站,4:分拣中心,5:运输中心,6:仓储中心,7:企业,8:商家',
  `type_attr` tinyint(3) unsigned DEFAULT '0' COMMENT '类型属性 自建站点、加盟总站、加盟子站',
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司名称',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '上级单位',
  `top_type` tinyint(3) DEFAULT NULL COMMENT 'top类型 1:配送商,8:商家',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '单位级别 一级、二级、三级',
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司电话号码',
  `call_center_phone` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '客服电话',
  `operation_model` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '运营模式：独立运营、合作运营',
  `web_site` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司网址用来存企业域名或网站',
  `email` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司公共电子邮箱',
  `province_code` varchar(16) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址省',
  `province_name` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址省',
  `city_code` varchar(16) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址市',
  `city_name` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址市',
  `area_code` varchar(16) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址区',
  `area_name` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '公司地址区',
  `address` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `finance_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '财务名称',
  `post_code` char(6) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司邮编*',
  `contact_person` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '公司联络人',
  `storages` mediumtext COLLATE utf8_bin COMMENT '单位级别*',
  `memo` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `logo` varchar(120) COLLATE utf8_bin DEFAULT '' COMMENT '公司logo图片 存放web 根目录',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态  停用、启用',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建用户',
  `distributors_code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '配送商编码',
  `update_user` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '修改用户',
  `delete_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '删除标志',
  `lng` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`unit_id`),
  KEY `Business_Unit_I1` (`parent_id`),
  KEY `Business_Unit_I2` (`unit_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for odometer
-- ----------------------------
DROP TABLE IF EXISTS `odometer`;
CREATE TABLE `odometer` (
  `odo_type` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '类型编码',
  `LENGTH` int(11) NOT NULL COMMENT '数字后缀长度 ChunBo-9000001001 长度十位',
  `current_no` int(11) NOT NULL COMMENT '当前编码，每次获取后自动加',
  `memo` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `prefix` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT ' ',
  PRIMARY KEY (`odo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成',
  `permission_code` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限码',
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `parent_id` int(8) NOT NULL DEFAULT '0' COMMENT '权限码',
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限名称',
  `url_seam` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '动作指定',
  `level_code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限级别 一级菜单、二级菜单、三级菜单',
  `sort_code` int(8) NOT NULL DEFAULT '0' COMMENT '权限排序',
  `ptype` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '权限类型：菜单or功能',
  `state` int(8) NOT NULL DEFAULT '0' COMMENT '状态',
  `gif_tag` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限图标',
  `memo` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`permission_id`),
  KEY `Permission_I1` (`permission_code`),
  KEY `Permission_I2` (`unit_id`),
  KEY `Permission_I3` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4606 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL COMMENT '地区id',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父地区id;当父为省的时候该字段可以为国家id',
  `region_name` varchar(128) DEFAULT NULL COMMENT '区域名',
  `region_level_id` int(11) DEFAULT NULL COMMENT '区域所属级别',
  `region_code` varchar(32) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '是否生效:1 有效 0 失效',
  `invalid_begin_date` datetime DEFAULT NULL COMMENT '失效开始时间',
  PRIMARY KEY (`region_id`),
  KEY `region_type_id_idx` (`region_level_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域维表';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '角色 32767*2',
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'bumen编码相同 系统自动生成唯一  企业不同  站点编码可以',
  `role_code` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '角色编码',
  `role_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '描述',
  `delete_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '删除标识',
  `is_permission` tinyint(3) unsigned DEFAULT '0' COMMENT '角色是否关联了权限  0：no 1：yes ',
  `create_id` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建账户ID',
  `create_datetime` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '创建时间',
  `update_id` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '修改账户ID',
  `update_datetime` datetime DEFAULT '1970-10-01 00:00:00' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0：初始 1：启用 2：停用 ',
  `rtype` tinyint(1) DEFAULT '0' COMMENT '角色类型 1:管理员角色 2:普通角色',
  PRIMARY KEY (`role_id`,`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `permission_id` int(8) NOT NULL COMMENT '权限码',
  `role_id` int(8) NOT NULL COMMENT '角色',
  PRIMARY KEY (`permission_id`,`role_id`,`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sys_log_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_info`;
CREATE TABLE `sys_log_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志信息id',
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `operator` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作员',
  `operate_time` timestamp NOT NULL DEFAULT '2015-11-11 00:00:00' COMMENT '操作时间',
  `details` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作内容',
  `level` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作模块（权限码）',
  `memo` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'log备注',
  `delete_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '删除标识',
  PRIMARY KEY (`id`),
  KEY `Sys_Log_Info_I2` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `unit_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `login_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '登陆用户ID',
  `login_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '登陆时间',
  `failcount` int(8) NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `state` int(8) NOT NULL DEFAULT '0' COMMENT '状态 登陆、冻结、失效',
  `delete_date` timestamp NOT NULL DEFAULT '1970-10-01 00:00:00' COMMENT '删除标识',
  PRIMARY KEY (`login_id`),
  KEY `Sys_User_I1` (`unit_id`,`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

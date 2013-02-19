/*
MySQL Data Transfer
Source Host: localhost
Source Database: app_dpms
Target Host: localhost
Target Database: app_dpms
Date: 2013/1/17 23:29:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for access
-- ----------------------------
CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for class
-- ----------------------------
CREATE TABLE `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '亲id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Table structure for group
-- ----------------------------
CREATE TABLE `group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
CREATE TABLE `groups` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for material
-- ----------------------------
CREATE TABLE `material` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '题标',
  `model` varchar(255) DEFAULT NULL COMMENT '品产型号',
  `class` int(11) unsigned NOT NULL COMMENT '品产分类',
  `code` varchar(60) DEFAULT NULL COMMENT '品产编码',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '品产状态 1正常',
  `provider` int(11) unsigned NOT NULL COMMENT '供应商',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `stocks` decimal(11,0) unsigned NOT NULL DEFAULT '0' COMMENT '库存数量',
  `warn_stock` decimal(10,0) unsigned NOT NULL,
  `unit` enum('t','ml','l','kg','bag','k') NOT NULL DEFAULT 'kg' COMMENT '单位',
  `desc` text COMMENT '产品图片',
  `add_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '改修时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原料表';

-- ----------------------------
-- Table structure for node
-- ----------------------------
CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for provider
-- ----------------------------
CREATE TABLE `provider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '供应商名',
  `flag` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '1:正常',
  `address` varchar(255) NOT NULL COMMENT '址地',
  `contact` varchar(30) NOT NULL COMMENT '系人联',
  `tel` varchar(20) NOT NULL,
  `tax` varchar(16) DEFAULT NULL,
  `postcode` char(16) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL COMMENT '应商供网址',
  `email` varchar(255) DEFAULT NULL,
  `add_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '加添时间',
  `up_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '改修时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `access` VALUES ('2', '1', '1', '0', null);
INSERT INTO `access` VALUES ('2', '40', '2', '1', null);
INSERT INTO `access` VALUES ('2', '30', '2', '1', null);
INSERT INTO `access` VALUES ('3', '1', '1', '0', null);
INSERT INTO `access` VALUES ('2', '69', '2', '1', null);
INSERT INTO `access` VALUES ('2', '50', '3', '40', null);
INSERT INTO `access` VALUES ('3', '50', '3', '40', null);
INSERT INTO `access` VALUES ('1', '50', '3', '40', null);
INSERT INTO `access` VALUES ('3', '7', '2', '1', null);
INSERT INTO `access` VALUES ('3', '39', '3', '30', null);
INSERT INTO `access` VALUES ('2', '39', '3', '30', null);
INSERT INTO `access` VALUES ('2', '49', '3', '30', null);
INSERT INTO `access` VALUES ('4', '1', '1', '0', null);
INSERT INTO `access` VALUES ('4', '2', '2', '1', null);
INSERT INTO `access` VALUES ('4', '3', '2', '1', null);
INSERT INTO `access` VALUES ('4', '4', '2', '1', null);
INSERT INTO `access` VALUES ('4', '5', '2', '1', null);
INSERT INTO `access` VALUES ('4', '6', '2', '1', null);
INSERT INTO `access` VALUES ('4', '7', '2', '1', null);
INSERT INTO `access` VALUES ('4', '11', '2', '1', null);
INSERT INTO `access` VALUES ('5', '25', '1', '0', null);
INSERT INTO `access` VALUES ('5', '51', '2', '25', null);
INSERT INTO `access` VALUES ('1', '1', '1', '0', null);
INSERT INTO `access` VALUES ('1', '39', '3', '30', null);
INSERT INTO `access` VALUES ('1', '40', '2', '1', null);
INSERT INTO `access` VALUES ('1', '30', '2', '1', null);
INSERT INTO `access` VALUES ('1', '7', '2', '1', null);
INSERT INTO `access` VALUES ('1', '49', '3', '30', null);
INSERT INTO `access` VALUES ('3', '69', '2', '1', null);
INSERT INTO `access` VALUES ('3', '30', '2', '1', null);
INSERT INTO `access` VALUES ('3', '40', '2', '1', null);
INSERT INTO `access` VALUES ('1', '37', '3', '30', null);
INSERT INTO `access` VALUES ('1', '36', '3', '30', null);
INSERT INTO `access` VALUES ('1', '35', '3', '30', null);
INSERT INTO `access` VALUES ('1', '34', '3', '30', null);
INSERT INTO `access` VALUES ('1', '33', '3', '30', null);
INSERT INTO `access` VALUES ('1', '32', '3', '30', null);
INSERT INTO `access` VALUES ('1', '31', '3', '30', null);
INSERT INTO `access` VALUES ('2', '32', '3', '30', null);
INSERT INTO `access` VALUES ('2', '31', '3', '30', null);
INSERT INTO `access` VALUES ('7', '1', '1', '0', null);
INSERT INTO `access` VALUES ('7', '30', '2', '1', null);
INSERT INTO `access` VALUES ('7', '40', '2', '1', null);
INSERT INTO `access` VALUES ('7', '69', '2', '1', null);
INSERT INTO `access` VALUES ('7', '50', '3', '40', null);
INSERT INTO `access` VALUES ('7', '39', '3', '30', null);
INSERT INTO `access` VALUES ('7', '49', '3', '30', null);
INSERT INTO `access` VALUES ('8', '1', '1', '0', null);
INSERT INTO `class` VALUES ('1', '营养成分', '0', '1');
INSERT INTO `class` VALUES ('2', '药物', '0', '1');
INSERT INTO `group` VALUES ('2', 'App', '应用中心', '1222841259', '0', '1', '0', '0');
INSERT INTO `groups` VALUES ('1', '项目组1');
INSERT INTO `groups` VALUES ('2', '项目组2');
INSERT INTO `groups` VALUES ('3', '项目组3');
INSERT INTO `node` VALUES ('49', 'read', '查看', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('40', 'Index', '默认模块', '1', '', '1', '1', '2', '0', '0');
INSERT INTO `node` VALUES ('39', 'index', '列表', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('37', 'resume', '恢复', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('36', 'forbid', '禁用', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('35', 'foreverdelete', '删除', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('34', 'update', '更新', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('33', 'edit', '编辑', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('32', 'insert', '写入', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('31', 'add', '新增', '1', '', null, '30', '3', '0', '0');
INSERT INTO `node` VALUES ('30', 'Public', '公共模块', '1', '', '2', '1', '2', '0', '0');
INSERT INTO `node` VALUES ('7', 'User', '后台用户', '1', '', '4', '1', '2', '0', '2');
INSERT INTO `node` VALUES ('6', 'Role', '角色管理', '1', '', '3', '1', '2', '0', '2');
INSERT INTO `node` VALUES ('2', 'Node', '节点管理', '1', '', '2', '1', '2', '0', '2');
INSERT INTO `node` VALUES ('1', 'Admin', '后台管理', '1', '', null, '0', '1', '0', '2');
INSERT INTO `node` VALUES ('50', 'main', '空白首页', '1', '', null, '40', '3', '0', '0');
INSERT INTO `node` VALUES ('84', 'sfsdf', 'afasdfas', '1', 'asdfasfasdf', null, '0', '1', '0', '2');
INSERT INTO `provider` VALUES ('1', '三星', '1', '北京', '三星负责人', '12302215', '22112', '012011', 'http://www.sunsung.com', 'sss@123.com', '0', '0');
INSERT INTO `provider` VALUES ('2', 'sony', '1', 'bejing', 'sony', '112222', '36652', '201001', 'http://google.com', 'test2@123.com', '0', '0');
INSERT INTO `provider` VALUES ('3', 'dell', '1', 'tianjing', 'dell', '56242', '232245', '22222', 'http://www.163.com', 'sfasf', '0', '0');
INSERT INTO `role` VALUES ('1', '领导组', '0', '1', '', '', '1208784792', '1254325558');
INSERT INTO `role` VALUES ('2', '员工组', '0', '1', '', '', '1215496283', '1254325566');
INSERT INTO `role` VALUES ('7', '演示组', '0', '1', '', null, '1254325787', '0');
INSERT INTO `role` VALUES ('8', 'XZCXC', '1', '1', 'CCXZ', null, '1358175702', '0');
INSERT INTO `role_user` VALUES ('4', '27');
INSERT INTO `role_user` VALUES ('4', '26');
INSERT INTO `role_user` VALUES ('4', '30');
INSERT INTO `role_user` VALUES ('5', '31');
INSERT INTO `role_user` VALUES ('3', '22');
INSERT INTO `role_user` VALUES ('3', '1');
INSERT INTO `role_user` VALUES ('1', '4');
INSERT INTO `role_user` VALUES ('2', '3');
INSERT INTO `role_user` VALUES ('7', '2');
INSERT INTO `role_user` VALUES ('3', '35');
INSERT INTO `role_user` VALUES ('3', '36');
INSERT INTO `user` VALUES ('1', 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '', '1358435086', '127.0.0.1', '926', '8888', 'liu21st@gmail.com', '备注信息', '1222907803', '1239977420', '1', '0', '');
INSERT INTO `user` VALUES ('2', 'demo', '演示', 'fe01ce2a7fbac8fafaed7c982a04e229', '', '1306159437', '127.0.0.1', '94', '8888', '', '', '1239783735', '1254325770', '1', '0', '');
INSERT INTO `user` VALUES ('3', 'member', '员工', 'aa08769cdcb26674c6706093503ff0a3', '', '1254326104', '127.0.0.1', '15', '', '', '', '1253514375', '1254325728', '1', '0', '');
INSERT INTO `user` VALUES ('4', 'leader', '领导', 'c444858e0aaeb727da73d2eae62321ad', '', '1284542339', '127.0.0.1', '17', '', '', '领导', '1253514575', '1254325705', '1', '0', '');
INSERT INTO `user` VALUES ('36', 'zhanghuihua', '张慧华', '21218cca77804d2ba1922c33e0151105', '', '0', null, '0', null, 'zhanghuihua@sohu.com', '', '1284448629', '1285638494', '1', '0', '');

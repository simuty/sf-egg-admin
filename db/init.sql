/*
 Navicat Premium Data Transfer

 Source Server         : Mac
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : siyee-api

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 12/10/2020 16:05:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for image_space_info
-- ----------------------------
DROP TABLE IF EXISTS `image_space_info`;
CREATE TABLE `image_space_info` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) NOT NULL,
  `url` varchar(500) NOT NULL,
  `extra` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of image_space_info
-- ----------------------------
BEGIN;
INSERT INTO `image_space_info` VALUES ('2020-09-24 06:11:00.706996', '2020-09-24 06:11:00.706996', 2, 2, 'http://image.si-yee.com/思忆/20200924_021100.png', '{\"key\":\"思忆/20200924_021100.png\",\"hash\":\"FlcrAvWiCZQvsBTU7XKaDwpv0sSF\"}');
INSERT INTO `image_space_info` VALUES ('2020-09-24 06:20:44.617766', '2020-09-24 06:20:44.617766', 3, 1, 'http://image.si-yee.com/头像/20200924_022044.jpeg', '{\"key\":\"头像/20200924_022044.jpeg\",\"hash\":\"Fikim5OW0KWgyLqRXktE0FqJQr6Y\"}');
COMMIT;

-- ----------------------------
-- Table structure for image_space_type
-- ----------------------------
DROP TABLE IF EXISTS `image_space_type`;
CREATE TABLE `image_space_type` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_91decef4a2b88cb59caf658d44` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of image_space_type
-- ----------------------------
BEGIN;
INSERT INTO `image_space_type` VALUES ('2020-09-24 06:04:51.708064', '2020-09-24 06:04:51.708064', 1, '头像');
INSERT INTO `image_space_type` VALUES ('2020-09-24 06:10:36.509527', '2020-09-24 06:10:36.509527', 2, '思忆');
COMMIT;

-- ----------------------------
-- Table structure for share_exchange
-- ----------------------------
DROP TABLE IF EXISTS `share_exchange`;
CREATE TABLE `share_exchange` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) NOT NULL,
  `gid` bigint(20) NOT NULL,
  `bcoin` int(10) unsigned NOT NULL,
  `acoin` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for share_goods
-- ----------------------------
DROP TABLE IF EXISTS `share_goods`;
CREATE TABLE `share_goods` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cid` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `intro` text,
  `tag` varchar(20) DEFAULT NULL,
  `ex_coin` int(11) DEFAULT '0',
  `show` tinyint(4) DEFAULT '1',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for share_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `share_goods_category`;
CREATE TABLE `share_goods_category` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `mark` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for share_member
-- ----------------------------
DROP TABLE IF EXISTS `share_member`;
CREATE TABLE `share_member` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `coin` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0c38752704138f4025483b5ec2` (`username`),
  UNIQUE KEY `IDX_81ffb23ee659a1554daccdd75a` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parend_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
BEGIN;
INSERT INTO `sys_department` VALUES ('2020-08-27 03:33:19.000000', '2020-08-27 03:33:19.000000', 1, NULL, '思忆技术', 0);
INSERT INTO `sys_department` VALUES ('2020-09-08 05:31:32.426851', '2020-10-07 04:25:31.000000', 2, 1, '管理部门', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `router` varchar(255) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT '0',
  `view_path` varchar(255) DEFAULT NULL,
  `keepalive` tinyint(4) DEFAULT '1',
  `isShow` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('2020-08-28 10:09:26.322745', '2020-10-12 06:35:18.000000', 1, NULL, '系统', '/sys', NULL, 0, 'system', 255, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-01 00:00:00.000000', '2020-09-14 03:53:31.000000', 3, 1, '权限管理', '/sys/permssion', NULL, 0, 'permission', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-08 00:00:00.000000', '2020-09-08 06:54:45.000000', 4, 3, '用户列表', '/sys/permssion/user', NULL, 1, 'peoples', 0, 'views/system/permission/user', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-15 00:00:00.000000', '2020-09-11 06:11:52.000000', 5, 4, '新增', NULL, 'sys:user:add', 2, NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-15 00:00:00.000000', '2020-09-11 06:13:03.000000', 6, 4, '删除', NULL, 'sys:user:delete', 2, NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-08 00:00:00.000000', '2020-09-24 09:51:40.000000', 7, 3, '菜单列表', '/sys/permssion/menu', NULL, 1, 'menu', 0, 'views/system/permission/menu', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-08-15 00:00:00.000000', '2020-08-15 00:00:00.000000', 8, 7, '新增', NULL, 'sys:menu:add', 2, NULL, 0, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES ('2020-08-15 00:00:00.000000', '2020-08-15 00:00:00.000000', 9, 7, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-02 08:22:27.548410', '2020-09-02 08:22:27.548410', 10, 7, '查询', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-04 06:26:36.408290', '2020-09-04 07:13:30.000000', 17, 16, '测试', '', 'sys:menu:list,sys:menu:update,sys:menu:info,sys:menu:add', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-04 08:08:53.621419', '2020-09-04 08:08:53.621419', 19, 7, '修改', '', 'sys:menu:update', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-04 09:41:43.133191', '2020-09-24 09:16:56.000000', 23, 3, '角色列表', '/sys/permission/role', '', 1, 'role', 0, 'views/system/permission/role', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 02:44:27.663925', '2020-09-07 08:51:18.000000', 25, 23, '删除', '', 'sys:role:delete', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 02:49:36.058795', '2020-09-14 03:56:56.000000', 26, 44, '饿了么文档', 'http://element-cn.eleme.io/#/zh-CN/component/installation', '', 1, 'international', 0, 'views/charts/keyboard', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 02:50:03.345817', '2020-09-14 03:56:47.000000', 27, 44, 'TypeORM中文文档', 'https://www.bookstack.cn/read/TypeORM-0.2.20-zh/README.md', '', 1, 'international', 2, 'views/error-log/components/ErrorTestB', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 07:08:18.106272', '2020-09-14 10:26:58.000000', 28, 23, '新增', '', 'sys:role:add', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 08:51:48.319938', '2020-09-07 08:51:58.000000', 29, 23, '修改', '', 'sys:role:update', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-07 10:39:50.396350', '2020-09-09 06:34:13.000000', 32, 23, '查询', '', 'sys:role:list,sys:role:page,sys:role:info', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-08 05:29:40.117403', '2020-09-11 06:03:43.000000', 33, 4, '部门查询', '', 'sys:dept:list,sys:dept:info', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-09 07:10:08.435753', '2020-09-10 03:41:32.000000', 34, 4, '查询', '', 'sys:user:page,sys:user:info', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-10 05:09:31.904519', '2020-09-10 05:09:31.904519', 35, 4, '更新', '', 'sys:user:update', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-10 08:02:29.853643', '2020-09-10 08:02:40.000000', 36, 4, '部门转移', '', 'sys:dept:transfer', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-11 04:34:00.379002', '2020-09-14 03:29:59.000000', 37, 1, '系统监控', '/sys/monitor', '', 0, 'monitor', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-11 04:34:52.949262', '2020-09-24 09:16:33.000000', 38, 37, '请求日志', '/sys/monitor/log', '', 1, 'log', 0, 'views/system/monitor/log', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-11 06:12:14.621531', '2020-09-11 06:12:14.621531', 39, 4, '部门新增', '', 'sys:dept:add', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-11 06:13:23.752133', '2020-09-11 06:13:23.752133', 40, 4, '部门删除', '', 'sys:dept:delete', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-11 06:29:52.437621', '2020-09-11 06:29:52.437621', 41, 4, '部门更新', '', 'sys:dept:update', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-14 03:14:48.168779', '2020-09-14 10:00:55.000000', 43, 38, '查询', '', 'sys:log:page,sys:log:search', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-14 03:56:24.740870', '2020-10-09 07:47:05.000000', 44, NULL, '文档', '/document', '', 0, 'documentation', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-09-14 06:55:17.544866', '2020-09-24 08:00:12.000000', 45, NULL, '通用权限', '/common', '', 0, '', 0, '', 1, 0);
INSERT INTO `sys_menu` VALUES ('2020-09-23 07:31:28.700348', '2020-09-24 05:22:45.000000', 46, 45, '图片空间', '', 'space:image:type:list,space:image:type:add,space:image:type:delete,space:image:page,space:image:delete,space:image:upload', 2, '', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-10-09 07:49:03.798676', '2020-10-09 07:49:03.798676', 49, NULL, '物品管理', '/product', NULL, 0, 'component', 0, '', 1, 1);
INSERT INTO `sys_menu` VALUES ('2020-10-09 07:49:55.939508', '2020-10-09 07:49:55.939508', 50, 49, '物品列表', '/product/list', NULL, 1, 'nested', 0, 'views/pms/product', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_req_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_req_log`;
CREATE TABLE `sys_req_log` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `params` text,
  `action` varchar(100) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_223de54d6badbe43a5490450c3` (`name`),
  UNIQUE KEY `IDX_f2d07943355da93c3a8a1c411a` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('2020-08-27 03:35:05.000000', '2020-08-27 03:35:05.000000', 1, 'root', 'root', '超级管理员', NULL);
INSERT INTO `sys_role` VALUES ('2020-09-14 07:39:02.423786', '2020-09-14 07:39:02.423786', 2, '1', '测试角色', 'testrole', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_department`;
CREATE TABLE `sys_role_department` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_department
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_department` VALUES ('2020-09-14 07:39:02.445216', '2020-09-14 07:39:02.445216', 1, 2, 1);
INSERT INTO `sys_role_department` VALUES ('2020-09-14 07:39:02.445216', '2020-09-14 07:39:02.445216', 2, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('2020-09-14 07:39:02.432650', '2020-09-14 07:39:02.432650', 1, 2, 44);
INSERT INTO `sys_role_menu` VALUES ('2020-09-14 07:39:02.432650', '2020-09-14 07:39:02.432650', 2, 2, 26);
INSERT INTO `sys_role_menu` VALUES ('2020-09-14 07:39:02.432650', '2020-09-14 07:39:02.432650', 3, 2, 27);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 4, 2, 4);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 7, 2, 33);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 8, 2, 34);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 10, 2, 36);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 11, 2, 39);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 13, 2, 41);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 14, 2, 37);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 15, 2, 38);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 16, 2, 43);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 17, 2, 1);
INSERT INTO `sys_role_menu` VALUES ('2020-09-15 08:05:45.986899', '2020-09-15 08:05:45.986899', 18, 2, 3);
INSERT INTO `sys_role_menu` VALUES ('2020-09-21 06:29:29.232489', '2020-09-21 06:29:29.232489', 19, 2, 8);
INSERT INTO `sys_role_menu` VALUES ('2020-09-21 06:29:29.232489', '2020-09-21 06:29:29.232489', 20, 2, 10);
INSERT INTO `sys_role_menu` VALUES ('2020-09-21 06:29:29.232489', '2020-09-21 06:29:29.232489', 21, 2, 7);
INSERT INTO `sys_role_menu` VALUES ('2020-10-12 03:22:35.019793', '2020-10-12 03:22:35.019793', 22, 2, 45);
INSERT INTO `sys_role_menu` VALUES ('2020-10-12 03:22:35.019793', '2020-10-12 03:22:35.019793', 23, 2, 46);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `head_img` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9e7164b2f1ea1348bc0eb0a7da` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('2020-08-27 03:38:30.000000', '2020-10-07 07:17:14.000000', 1, 1, '杨长源', 'hackycy', 'U2FsdGVkX18E8MLkt/45xe3xRALUa6mE9udOXcxrVCA=', '', 'http://image.si-yee.com/思忆/20200924_021100.png', 'qa894178522@qq.com', '15622472425', NULL, 1);
INSERT INTO `sys_user` VALUES ('2020-09-14 07:41:33.732000', '2020-10-12 06:04:19.000000', 2, 2, '杨长源', 'test001', 'U2FsdGVkX1+iVR+kHHErkPNInZiV27Mpk4pFL8uhtTQ=', '', '', 'qa894178522@qq.com', '', '', 0);
INSERT INTO `sys_user` VALUES ('2020-10-12 03:23:14.611864', '2020-10-12 06:12:20.000000', 3, 2, '长源小号', 'hackycy2', 'U2FsdGVkX18tvghStliPvPopFZQiILUrZhNk3mUs2jA=', '', NULL, '', '', '', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('2020-09-14 04:10:34.371646', '2020-09-14 04:10:34.371646', 1, 1, 1);
INSERT INTO `sys_user_role` VALUES ('2020-10-12 06:04:19.072876', '2020-10-12 06:04:19.072876', 17, 2, 2);
INSERT INTO `sys_user_role` VALUES ('2020-10-12 06:12:20.149960', '2020-10-12 06:12:20.149960', 18, 3, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

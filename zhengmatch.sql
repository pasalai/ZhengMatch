/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : zhengmatch

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-05-01 07:49:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add 成绩及答题', '1', 'add_achievement');
INSERT INTO `auth_permission` VALUES ('2', 'Can change 成绩及答题', '1', 'change_achievement');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete 成绩及答题', '1', 'delete_achievement');
INSERT INTO `auth_permission` VALUES ('4', 'Can view 成绩及答题', '1', 'view_achievement');
INSERT INTO `auth_permission` VALUES ('5', 'Can add 选择题题库', '2', 'add_choosequestions');
INSERT INTO `auth_permission` VALUES ('6', 'Can change 选择题题库', '2', 'change_choosequestions');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete 选择题题库', '2', 'delete_choosequestions');
INSERT INTO `auth_permission` VALUES ('8', 'Can view 选择题题库', '2', 'view_choosequestions');
INSERT INTO `auth_permission` VALUES ('9', 'Can add CTF类型', '3', 'add_ctfcategory');
INSERT INTO `auth_permission` VALUES ('10', 'Can change CTF类型', '3', 'change_ctfcategory');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete CTF类型', '3', 'delete_ctfcategory');
INSERT INTO `auth_permission` VALUES ('12', 'Can view CTF类型', '3', 'view_ctfcategory');
INSERT INTO `auth_permission` VALUES ('13', 'Can add CTF题库', '4', 'add_ctfquestions');
INSERT INTO `auth_permission` VALUES ('14', 'Can change CTF题库', '4', 'change_ctfquestions');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete CTF题库', '4', 'delete_ctfquestions');
INSERT INTO `auth_permission` VALUES ('16', 'Can view CTF题库', '4', 'view_ctfquestions');
INSERT INTO `auth_permission` VALUES ('17', 'Can add 赛事信息', '5', 'add_matchinfo');
INSERT INTO `auth_permission` VALUES ('18', 'Can change 赛事信息', '5', 'change_matchinfo');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete 赛事信息', '5', 'delete_matchinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can view 赛事信息', '5', 'view_matchinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 公告', '6', 'add_notice');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 公告', '6', 'change_notice');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 公告', '6', 'delete_notice');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 公告', '6', 'view_notice');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 题解', '7', 'add_writeup');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 题解', '7', 'change_writeup');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 题解', '7', 'delete_writeup');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 题解', '7', 'view_writeup');
INSERT INTO `auth_permission` VALUES ('29', 'Can add log entry', '8', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('30', 'Can change log entry', '8', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete log entry', '8', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('32', 'Can view log entry', '8', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('33', 'Can add permission', '9', 'add_permission');
INSERT INTO `auth_permission` VALUES ('34', 'Can change permission', '9', 'change_permission');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete permission', '9', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('36', 'Can view permission', '9', 'view_permission');
INSERT INTO `auth_permission` VALUES ('37', 'Can add group', '10', 'add_group');
INSERT INTO `auth_permission` VALUES ('38', 'Can change group', '10', 'change_group');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete group', '10', 'delete_group');
INSERT INTO `auth_permission` VALUES ('40', 'Can view group', '10', 'view_group');
INSERT INTO `auth_permission` VALUES ('41', 'Can add user', '11', 'add_user');
INSERT INTO `auth_permission` VALUES ('42', 'Can change user', '11', 'change_user');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete user', '11', 'delete_user');
INSERT INTO `auth_permission` VALUES ('44', 'Can view user', '11', 'view_user');
INSERT INTO `auth_permission` VALUES ('45', 'Can add content type', '12', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('46', 'Can change content type', '12', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete content type', '12', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('48', 'Can view content type', '12', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('49', 'Can add session', '13', 'add_session');
INSERT INTO `auth_permission` VALUES ('50', 'Can change session', '13', 'change_session');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete session', '13', 'delete_session');
INSERT INTO `auth_permission` VALUES ('52', 'Can view session', '13', 'view_session');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 选手答题记录', '14', 'add_uphistory');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 选手答题记录', '14', 'change_uphistory');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 选手答题记录', '14', 'delete_uphistory');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 选手答题记录', '14', 'view_uphistory');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 动态Flag管理', '15', 'add_dynamicflag');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 动态Flag管理', '15', 'change_dynamicflag');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 动态Flag管理', '15', 'delete_dynamicflag');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 动态Flag管理', '15', 'view_dynamicflag');
INSERT INTO `auth_permission` VALUES ('61', 'Can add registration profile', '16', 'add_registrationprofile');
INSERT INTO `auth_permission` VALUES ('62', 'Can change registration profile', '16', 'change_registrationprofile');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete registration profile', '16', 'delete_registrationprofile');
INSERT INTO `auth_permission` VALUES ('64', 'Can view registration profile', '16', 'view_registrationprofile');
INSERT INTO `auth_permission` VALUES ('65', 'Can add supervised registration profile', '17', 'add_supervisedregistrationprofile');
INSERT INTO `auth_permission` VALUES ('66', 'Can change supervised registration profile', '17', 'change_supervisedregistrationprofile');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete supervised registration profile', '17', 'delete_supervisedregistrationprofile');
INSERT INTO `auth_permission` VALUES ('68', 'Can view supervised registration profile', '17', 'view_supervisedregistrationprofile');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$216000$w4wDfFbAtbPB$3/TCWslGGuVOxYTy6/rhwStPiUf70qIQtv2+s8PIMNU=', '2021-04-26 16:26:36.975407', '1', 'root', '', '', 'root@root.com', '1', '1', '2021-01-11 17:49:04.804471');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$216000$irPsJCQLcan9$7yT4Z64jnM8Vhi9QhUfGLrs4zwydtARMiqgZ6jsolgY=', '2021-04-26 15:02:02.807734', '0', 'user', '', '', '', '0', '1', '2021-01-18 11:07:00.000000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$216000$ubqwStdMFoly$THhfbUWl9JTLrsBEadzioSzhDs6MekiZKWl1TUDiUks=', '2021-04-26 15:08:17.075262', '0', 'test', '', '', '', '0', '1', '2021-02-24 16:56:37.234601');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$216000$BHqndbc9rwd9$iAPVo15iiEHgRFmZY+M7geBw+tho6ndTEQZCCwzXgSI=', '2021-04-26 15:07:52.105057', '0', 'laishouchao', '', '', 'pasalai@qq.com', '0', '1', '2021-04-26 14:27:53.372198');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('34', '2021-03-07 20:51:06.350791', '2', '心灵树洞', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2021-03-07 20:57:09.026176', '10', '1021', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2021-03-07 20:57:09.030168', '9', '921', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2021-03-07 20:57:09.034167', '8', '821', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2021-03-07 20:57:09.037171', '7', '721', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2021-03-07 20:57:09.039166', '6', '621', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2021-03-07 20:57:09.040167', '5', '522', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2021-03-07 20:57:09.042167', '4', '422', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2021-03-07 20:57:09.044167', '3', '322', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2021-03-07 20:57:09.046169', '2', '222', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2021-03-07 20:57:09.048167', '1', '121', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2021-03-12 09:25:03.250341', '3', '你对DVWA了解如何', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2021-03-12 10:30:41.725914', '2', '心灵树洞', '2', '[{\"changed\": {\"fields\": [\"\\u95ee\\u9898\\u5185\\u5bb9\", \"\\u90e8\\u7f72\\u5230Docker\\u7684\\u6587\\u4ef6\", \"\\u662f\\u5426\\u542f\\u7528\\u52a8\\u6001flag\\u53ca\\u53cd\\u4f5c\\u5f0a\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2021-03-12 10:30:49.852927', '2', '心灵树洞', '2', '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u4f7f\\u7528Docker\", \"Docker\\u6e90\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2021-03-12 10:47:31.668101', '18', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2021-03-12 10:47:31.673102', '17', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2021-03-12 10:47:31.675104', '16', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2021-03-12 10:47:31.677102', '15', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2021-03-12 10:54:41.373051', '19', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2021-03-12 10:55:33.473489', '3', '你对DVWA了解如何', '2', '[{\"changed\": {\"fields\": [\"\\u90e8\\u7f72\\u5230Docker\\u7684\\u6587\\u4ef6\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2021-03-12 18:20:57.046924', '2', 'YoungCtf初赛 & 决赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u9898\\u76ee\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2021-03-12 18:22:52.911873', '3', 'AWD-DVWA', '2', '[{\"changed\": {\"fields\": [\"\\u95ee\\u9898\\u6807\\u9898\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2021-03-12 18:35:16.625003', '1', '121', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2021-03-12 20:16:22.895913', '3', '322', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2021-03-12 20:16:22.907967', '2', '221', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2021-03-12 20:16:56.022762', '3', 'AWD-DVWA', '2', '[{\"changed\": {\"fields\": [\"\\u90e8\\u7f72\\u5230Docker\\u7684\\u6587\\u4ef6\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2021-03-12 20:19:45.885101', '4', '421', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2021-03-12 20:22:01.472384', '5', '521', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2021-03-12 20:26:29.574125', '6', '621', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2021-03-12 20:28:38.185054', '7', '721', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2021-03-12 20:43:39.111619', '8', '821', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2021-03-13 18:33:17.994848', '9', '921', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2021-03-13 18:52:04.370421', '21', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2021-03-13 18:52:04.377014', '20', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2021-03-13 18:55:59.193995', '22', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2021-03-13 18:56:27.269003', '23', '12', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2021-04-13 19:25:20.705898', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u5f00\\u59cb\\u65f6\\u95f4\", \"\\u7ade\\u8d5b\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2021-04-13 19:26:23.147562', '2', 'YoungCtf初赛 & 决赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u5f00\\u59cb\\u65f6\\u95f4\", \"\\u7ade\\u8d5b\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2021-04-13 19:26:38.790358', '11', '1122', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2021-04-13 19:26:38.793856', '10', '1021', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2021-04-13 19:42:09.317707', '3', 'AWD-DVWA', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2021-04-13 19:42:38.777500', '2', 'YoungCtf初赛 & 决赛', '2', '[]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2021-04-13 20:01:09.293413', '12', '1221', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2021-04-22 16:04:38.697914', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u9009\\u62e9\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2021-04-22 16:04:43.080728', '2', 'YoungCtf初赛 & 决赛', '2', '[{\"changed\": {\"fields\": [\"\\u9009\\u62e9\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2021-04-22 16:04:50.622006', '1', '网鼎杯参赛队伍选拔赛', '2', '[{\"changed\": {\"fields\": [\"\\u9009\\u62e9\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2021-04-22 16:08:09.145005', '1', '网鼎杯参赛队伍选拔赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u5f00\\u59cb\\u65f6\\u95f4\", \"\\u7ade\\u8d5b\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2021-04-22 16:28:45.579885', '13', '1321', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2021-04-25 17:55:21.810980', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u7ed3\\u675f\\u65f6\\u95f4\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2021-04-26 13:00:21.481220', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u9898\\u76ee\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2021-04-26 13:54:54.800175', '2', 'Registration information for lai2', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2021-04-26 13:54:54.809172', '1', 'Registration information for lai', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2021-04-26 13:55:02.350509', '4', 'lai', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2021-04-26 13:55:02.356579', '5', 'lai2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2021-04-26 14:17:27.409918', '11', 'Registration information for niu4', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2021-04-26 14:17:27.417069', '10', 'Registration information for niu3', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2021-04-26 14:17:27.419346', '9', 'Registration information for niu2', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2021-04-26 14:17:27.421411', '8', 'Registration information for niu', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2021-04-26 14:17:27.425286', '7', 'Registration information for ttt1', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2021-04-26 14:17:27.429318', '6', 'Registration information for ttt', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2021-04-26 14:17:27.431417', '5', 'Registration information for lai3', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2021-04-26 14:17:27.434319', '4', 'Registration information for lai2', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2021-04-26 14:17:27.436314', '3', 'Registration information for lai', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2021-04-26 14:18:02.847042', '6', 'lai', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2021-04-26 14:18:02.852990', '7', 'lai2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2021-04-26 14:18:02.855061', '8', 'lai3', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2021-04-26 14:18:02.858096', '11', 'niu', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2021-04-26 14:18:02.861993', '12', 'niu2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2021-04-26 14:18:02.863992', '13', 'niu3', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2021-04-26 14:18:02.865995', '14', 'niu4', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2021-04-26 14:18:02.868337', '9', 'ttt', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2021-04-26 14:18:02.869337', '10', 'ttt1', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2021-04-26 14:31:51.947529', '13', 'Registration information for lailai', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2021-04-26 14:58:31.659359', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2021-04-26 14:58:35.724249', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2021-04-26 14:59:28.682259', '16', 'lailai', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2021-04-26 15:01:46.731511', '3', 'test', '2', '[{\"changed\": {\"fields\": [\"password\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2021-04-26 15:18:10.837418', '14', '1423', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2021-04-26 15:33:42.870346', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u53c2\\u8d5b\\u9009\\u624b\"]}}]', '5', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2021-04-26 15:34:22.996242', '3', '互联网安全大赛', '2', '[{\"changed\": {\"fields\": [\"\\u7ade\\u8d5b\\u7b80\\u4ecb\"]}}]', '5', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('8', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('10', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('9', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('11', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('12', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('1', 'pingtai', 'achievement');
INSERT INTO `django_content_type` VALUES ('2', 'pingtai', 'choosequestions');
INSERT INTO `django_content_type` VALUES ('3', 'pingtai', 'ctfcategory');
INSERT INTO `django_content_type` VALUES ('4', 'pingtai', 'ctfquestions');
INSERT INTO `django_content_type` VALUES ('15', 'pingtai', 'dynamicflag');
INSERT INTO `django_content_type` VALUES ('5', 'pingtai', 'matchinfo');
INSERT INTO `django_content_type` VALUES ('6', 'pingtai', 'notice');
INSERT INTO `django_content_type` VALUES ('14', 'pingtai', 'uphistory');
INSERT INTO `django_content_type` VALUES ('7', 'pingtai', 'writeup');
INSERT INTO `django_content_type` VALUES ('16', 'registration', 'registrationprofile');
INSERT INTO `django_content_type` VALUES ('17', 'registration', 'supervisedregistrationprofile');
INSERT INTO `django_content_type` VALUES ('13', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2021-01-11 17:42:05.397389');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2021-01-11 17:42:08.587092');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2021-01-11 17:42:11.044865');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2021-01-11 17:42:11.454275');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2021-01-11 17:42:11.659578');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2021-01-11 17:42:12.375251');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2021-01-11 17:42:12.682708');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2021-01-11 17:42:12.992106');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2021-01-11 17:42:13.180499');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2021-01-11 17:42:13.451836');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2021-01-11 17:42:13.603908');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2021-01-11 17:42:13.809119');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2021-01-11 17:42:14.219683');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2021-01-11 17:42:14.525314');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2021-01-11 17:42:14.934705');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2021-01-11 17:42:15.433862');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2021-01-11 17:42:15.754426');
INSERT INTO `django_migrations` VALUES ('18', 'pingtai', '0001_initial', '2021-01-11 17:42:20.056838');
INSERT INTO `django_migrations` VALUES ('19', 'sessions', '0001_initial', '2021-01-11 17:42:20.669598');
INSERT INTO `django_migrations` VALUES ('20', 'pingtai', '0002_auto_20210118_1058', '2021-01-18 10:58:38.496730');
INSERT INTO `django_migrations` VALUES ('21', 'pingtai', '0003_auto_20210118_1102', '2021-01-18 11:03:03.867867');
INSERT INTO `django_migrations` VALUES ('22', 'pingtai', '0004_auto_20210118_1103', '2021-01-18 11:03:52.786461');
INSERT INTO `django_migrations` VALUES ('23', 'pingtai', '0005_auto_20210118_1106', '2021-01-18 11:06:16.873100');
INSERT INTO `django_migrations` VALUES ('24', 'pingtai', '0006_auto_20210118_1119', '2021-01-18 11:19:36.004614');
INSERT INTO `django_migrations` VALUES ('25', 'pingtai', '0007_auto_20210227_1121', '2021-02-27 11:21:23.362070');
INSERT INTO `django_migrations` VALUES ('26', 'pingtai', '0008_ctfquestions_if_anticheating', '2021-02-27 11:58:58.824079');
INSERT INTO `django_migrations` VALUES ('27', 'pingtai', '0009_auto_20210227_1200', '2021-02-27 12:00:20.206755');
INSERT INTO `django_migrations` VALUES ('28', 'pingtai', '0010_auto_20210307_1630', '2021-03-07 16:30:15.789148');
INSERT INTO `django_migrations` VALUES ('29', 'pingtai', '0011_auto_20210307_1701', '2021-03-07 17:02:00.525127');
INSERT INTO `django_migrations` VALUES ('30', 'pingtai', '0012_auto_20210307_2032', '2021-03-07 20:32:16.667462');
INSERT INTO `django_migrations` VALUES ('31', 'pingtai', '0013_auto_20210312_1052', '2021-03-12 10:53:16.789147');
INSERT INTO `django_migrations` VALUES ('32', 'pingtai', '0014_auto_20210312_1054', '2021-03-12 10:54:31.512725');
INSERT INTO `django_migrations` VALUES ('33', 'pingtai', '0015_dynamicflag', '2021-03-12 15:20:27.948609');
INSERT INTO `django_migrations` VALUES ('34', 'pingtai', '0016_auto_20210312_1535', '2021-03-12 15:35:43.640523');
INSERT INTO `django_migrations` VALUES ('35', 'pingtai', '0017_auto_20210422_1548', '2021-04-22 15:56:23.890923');
INSERT INTO `django_migrations` VALUES ('36', 'pingtai', '0017_auto_20210426_1258', '2021-04-26 12:58:51.443535');
INSERT INTO `django_migrations` VALUES ('37', 'registration', '0001_initial', '2021-04-26 12:58:51.466112');
INSERT INTO `django_migrations` VALUES ('38', 'registration', '0002_registrationprofile_activated', '2021-04-26 12:58:51.501363');
INSERT INTO `django_migrations` VALUES ('39', 'registration', '0003_migrate_activatedstatus', '2021-04-26 12:58:51.519670');
INSERT INTO `django_migrations` VALUES ('40', 'registration', '0004_supervisedregistrationprofile', '2021-04-26 12:58:51.537235');
INSERT INTO `django_migrations` VALUES ('41', 'registration', '0005_activation_key_sha256', '2021-04-26 12:58:51.565346');
INSERT INTO `django_migrations` VALUES ('42', 'pingtai', '0018_auto_20210426_1532', '2021-04-26 15:32:59.938178');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0vdvw5jh0382qkmtd1cilx0vq9dxqbdj', '.eJxVjEEOwiAURO_C2hA-pMG6dO8ZyPA_SNVAUtpV4921SRe6nffebCpgXUpYe5rDJOqirDr9bhH8THUH8kC9N82tLvMU9a7og3Z9a5Je18P9Oyjo5Vv7SBgzmIzzyUQG-JwixA4eZFk8cR7hXM6GTBbvLPyQbWKCISGj3h8XWTjs:1lIsn3:4gFPZSp5EvF4GXnL0iBkjUavGxAvtCNTJ_7MWmy2MOU', '2021-03-21 20:45:45.811130');
INSERT INTO `django_session` VALUES ('6b5r7j3exigq4a5952h4ts55i735m04b', '.eJzNl0tz2jAUhf8K43UCki3rkWU7k113zXRRMhk9rkEt2NSPdjIZ_nslmQzEMcETnNKVxr7HR1ffETJ-ih5kUy8fmgrKB2uimwhHV4f3lNQ_IfcF80Pmi2Kqi7wurZp6yXRXraZfCgOrTzvtC4OlrJbuacEwS1OiNaKZUpQaQrhIuI5jShXDlFGQFAmskMExxCQWGU2oSJjmXBsde9M15E3lvL4_zaNcrmEe3Uzm0XzeMGnADdykyg0psMQPSYbm0ZVTWNdzq81kOcnktbalXkFbXPvOK19-afv56-3EW2sWPBn3A1MS-4EgOsC6KVdtbSbN2uazjc0XtbQzXWda1rAoysdZq5TG3A0QO9nuAVWCNLps1qqn9TOIbK8mY1LY3vsyWOOrGKH4iL_ggoc-RTIm5V8NVLUt8moQ5r36Ypzfy6HLOen6e9NYem-KEL5dycVonM2jm8bqzHmexnwo_veUz6TQpUx6_GmMkXcDEKFHLX3jAto8U7IP2Z14cAZ2qZcWfoM7E-vT2A_FF8E-KpZuDmnPhLumCYQTi2SAQ-o0G23fr2XtqOZZcRr_XnoR-OOw6FKnPTMJhERIm6hXwXKl_BZIszTdbwE3mNBTqkMNyTMSaTZLW9WD3qp76UUS-XhO3bTYyS52v8bnLtoryoRvJssQ_1baGu427ZU4I6Y_3qjZnA7pWfgfRDQqnG42vHd67HNnDMIuwDTkTsg5v4-8qK2G09x3ugthf9-6u0xF9wbuOxiVJGHQOMzC_WQ04eEfAiPJ6zkrP2flXqYrcy1X9dufEH4daRzM4oQdWYD_SOqPzX9DzXz5eGJ7yfCwRlh0D8qhC-3EgvtiYaDJkS68SXWti8UbyBZl8dbpcqC5OLRBC-0ii7s30PY-2v4Fze_2kA:1lL2xZ:B1bTqtOZGin8UiZqgAW1J8nBCaLuf0UTUAeTMTyhh2M', '2021-03-27 20:01:33.630516');
INSERT INTO `django_session` VALUES ('if388o8fw5o172o576zr7gu36cqam1rk', '.eJzFlktvm0AQx7-KxdkPFpZ95NhKvfXWnkpk7WOwNzWQ8mhVRf7uZTGRk9XaJiEqp5WZP_-Z-Q0e7VOwFW2z37Y1VFujg7sABcuXz6RQP6GwAf0gil25VmXRVEaurWQ9ROv111LD4dOgfWWwF_W-e5tTRJMEKxWSTEpCNMaMx0xFESGSIkIJCBJyJEONIohwxDMSEx5TxZjSKrKmORRt3Xn9eEqDQuSQBneLNEjTlgoN3cF0IrsjARrbI87CNFh2CtPVfNJmolpkYqVMpQ5wCua28tqGX9t-_vbFOivaW1ImR3i11eEU2widm2LzaIpdI8xGNZkSDezK6u_mpBRafx8h7mTDC7ICoVXV5tJT6wQEx-ViUtvHexsGo20UhWHkN-SMs74uHk_j-KuFujFlUY8CeVbPRXJ84y7J2DW0Nogoe2AsJmAsysYouA1w0P1_dG_q1OWGPW4kQqGtD4D3FSlhf8kEP0_o_TCF2hv4Dd1uam4TfSmeBetEEC7rxJNiKBMD648MkM3brf0JkHPRdOSKrLyN-CydBfB7u3fJEo83D0Pez7Af3rBZPmiz7suyhrcsV-eFWWBPBOIyp74UJzfGYQreP5VpoH28jfVZOA_O0b265Jj7APn-GlLg_lCo3-zMLngSM5uTUOzJWducdbcyD3olDs31C5tlkUS9WRTTCw3YK6l_VPbGurHhy0M6S8aP5wOa9qAc26gzFhT6vEDhC1VYk3qlyt0VZLuqvPZhv9DMDm1Uoy4y5H7a_HgfHP8BRG0mrA:1lEpSi:O2O2led-HrnpFbDLetTT3MFPtIG-NirKOW4vV4SlC7A', '2021-03-10 16:24:00.053833');
INSERT INTO `django_session` VALUES ('k2093jjppudm9cdo14vy6bosotov47qz', '.eJxVjEEOwiAURO_C2hA-pMG6dO8ZyPA_SNVAUtpV4921SRe6nffebCpgXUpYe5rDJOqirDr9bhH8THUH8kC9N82tLvMU9a7og3Z9a5Je18P9Oyjo5Vv7SBgzmIzzyUQG-JwixA4eZFk8cR7hXM6GTBbvLPyQbWKCISGj3h8XWTjs:1l1MRq:rmlTBqGsPZoMetA--nZSiGKDSJEbgF7_9jyQL_V0VGk', '2021-02-01 12:47:26.727172');
INSERT INTO `django_session` VALUES ('m83pnaml7f8dctq2u7juik8awzb33o5b', '.eJxVjEEOwiAQRe_C2pAOFDp16d4zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uzsur0u0VKD6k74DvV26zTXNdlinpX9EGbvs4sz8vh_h0UauVbi2BE50GyRerYWA-c-9EyDHYwvaPEaNBHwZwIooEE2TjvScbI2IF6fwDo-DgD:1lEq2W:3bCPotZAZ3M1xTmNTabJNpmwebFPOoVAuaJMqe86pOA', '2021-03-10 17:01:00.514108');
INSERT INTO `django_session` VALUES ('o2dzl02013zu0tq3xto4v6r4b777ix8m', '.eJxVjEEOwiAURO_C2hA-pMG6dO8ZyPA_SNVAUtpV4921SRe6nffebCpgXUpYe5rDJOqirDr9bhH8THUH8kC9N82tLvMU9a7og3Z9a5Je18P9Oyjo5Vv7SBgzmIzzyUQG-JwixA4eZFk8cR7hXM6GTBbvLPyQbWKCISGj3h8XWTjs:1lL1dX:aAD0-diH7mPdkfNuRNj4n3hFEZPNcF5YGALKAVnwnsg', '2021-03-27 18:36:47.352550');
INSERT INTO `django_session` VALUES ('v3sr48mn39i6hlt57ri793tgh4z87rwu', '.eJzNV01zmzAQ_SsezomNQEgox3Ymt146zfRQdzL6AqvF4PLRTiaT_16t7IwdBRsa3LqnBe3q7e57EkKPwT3v2tV91-j63qjgJkDB1eGY4PK7LsGhvvEyr-ayKtvaiDmEzHfeZv6hUrp4t4t9AbDizcrOZhTRJMFShiQTghCFccriVEYRIYIiQonmJGRIhApFOsIRy0hMWExlmkolIwBd67JrLNaXx2VQ8rVeBjezZfBR56Zpa96aqlwGV3bESHgCX8brWcavpallobfONVTagPs4zGxTV5kpdDMCr6uLrW_B1dqUi_oA58XLDnOxncaVuvvTmXbObraoNVey7tZioJOBBp6uZpNJePoKbm0UeFEYRv4A8rMslx3lSluTqkRYk2gag4mzcIKC7z_dzgBaUodJUzBUcAQGh-QNYm5MmbfcLGSbSd7qvKofjuvXFzxSsgmM-OROZMEXDx_BZylLXZ0sPifLPzrdwOJrRtG8j74Yz2_lwec56dkkScQBm9gtdFvw_Gw8qwebxsjMYg7TfBj871meyILPMunBJxEKAU1r5mqUHApneqtngvci2zNKT6Cdy5XRP7U9xdph2g-DL0L7WWnxdaA9CXdFY-2-WDjTyKlOsrOt-zVvLatlVg3Tvw-9CPnn4cJnPe3JxMKQObWxeCVsKgQsgSRLkv0SsEa5mhLpfCGfoEi3Wdn_jVGn6j70Ior8fZ58tdhgFbvd-FzF9o1QBsVkWZh-rk2r7zbbNzZBpl8A1G2GRXoO_A8kOis5njYo7E2PQHdKtVsFiDjdMZ6yP8qqNfLElcGLuxDtb-vb5xT5GyDu-zAKjp2RyGVJIRmJU_eHQHH8OmcDORt7mBbqmhft6SsE9JFEDiyK6ZEG4FrbLxvcehfgPq7YPmS8WGdouu8KNrJRX6c-WaiW-EgVANJcyyo_QVleV6e-LgcxFydtVKM-ZdgfsHfk4Ok3E-uG_w:1lawZh:l9FCo2FnrwXnigydkJby8errMTBRnfXgsyw5AwH8E9Y', '2021-05-10 16:26:37.039896');

-- ----------------------------
-- Table structure for pingtai_achievement
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_achievement`;
CREATE TABLE `pingtai_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answered_question_id` longtext NOT NULL,
  `achievement` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_achievement
-- ----------------------------
INSERT INTO `pingtai_achievement` VALUES ('1', '1', '1', '1/2', '1000');
INSERT INTO `pingtai_achievement` VALUES ('2', '1', '2', '1', '500');
INSERT INTO `pingtai_achievement` VALUES ('3', '1', '3', '1', '500');
INSERT INTO `pingtai_achievement` VALUES ('4', '2', '1', '3', '1000');
INSERT INTO `pingtai_achievement` VALUES ('5', '2', '2', '3', '1000');
INSERT INTO `pingtai_achievement` VALUES ('6', '2', '3', '3', '1000');

-- ----------------------------
-- Table structure for pingtai_choosequestions
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_choosequestions`;
CREATE TABLE `pingtai_choosequestions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` longtext NOT NULL,
  `question_options` longtext NOT NULL,
  `question_answer` varchar(255) NOT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_choosequestions
-- ----------------------------
INSERT INTO `pingtai_choosequestions` VALUES ('3', '一加一等于几', '一加一等于1', '2');

-- ----------------------------
-- Table structure for pingtai_ctfcategory
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_ctfcategory`;
CREATE TABLE `pingtai_ctfcategory` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_ctfcategory
-- ----------------------------
INSERT INTO `pingtai_ctfcategory` VALUES ('1', 'Misc');
INSERT INTO `pingtai_ctfcategory` VALUES ('2', 'Android');
INSERT INTO `pingtai_ctfcategory` VALUES ('3', 'Web');
INSERT INTO `pingtai_ctfcategory` VALUES ('4', 'PWN');
INSERT INTO `pingtai_ctfcategory` VALUES ('5', 'Reverse');
INSERT INTO `pingtai_ctfcategory` VALUES ('6', 'Crypto');

-- ----------------------------
-- Table structure for pingtai_ctfquestions
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_ctfquestions`;
CREATE TABLE `pingtai_ctfquestions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL,
  `question_content` longtext NOT NULL,
  `question_tips` longtext NOT NULL,
  `question_answer` varchar(255) NOT NULL,
  `question_fraction` varchar(255) NOT NULL,
  `question_type` varchar(6) NOT NULL,
  `question_ctf_category` varchar(20) NOT NULL,
  `docker_Hub` varchar(200) NOT NULL,
  `docker_file` varchar(100) NOT NULL,
  `docker_type` longtext NOT NULL,
  `if_docker` varchar(1) NOT NULL,
  `if_AntiCheating` varchar(1) NOT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_ctfquestions
-- ----------------------------
INSERT INTO `pingtai_ctfquestions` VALUES ('1', '签到题', '关注公众号 “山青网安信协” 发送关键字 “flag” 即可得到flag', '关注公众号 “山青网安信协” 发送关键字 “flag” 即可得到flag', 'flag{Welcome_to_join_Th3_SDYU_Y0ungCTF}', '500', 'CTF', 'Misc', '', '', '', '0', '0');
INSERT INTO `pingtai_ctfquestions` VALUES ('2', '心灵树洞', 'http://10.174.254.3:5004\r\nflag{Welcome_to_join_YoungCtf2021}', '文件包含，文件上传，phar打包', 'flag{Welcome_to_join_YoungCtf2021}', '500', 'CTF', 'Web', '', '', '', '0', '0');
INSERT INTO `pingtai_ctfquestions` VALUES ('3', 'AWD-DVWA', '测试docker 实时部署的题目', '汉化重构的DVWA', '动态生成', '1000', 'AWD', 'Web', '', 'static/upload/upload_docker_file/DVWA.zip', 'WebFile', '1', '1');

-- ----------------------------
-- Table structure for pingtai_dynamicflag
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_dynamicflag`;
CREATE TABLE `pingtai_dynamicflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `container_id` longtext NOT NULL,
  `container_address` longtext NOT NULL,
  `flag` longtext NOT NULL,
  `match_name` longtext NOT NULL,
  `user_name` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_dynamicflag
-- ----------------------------
INSERT INTO `pingtai_dynamicflag` VALUES ('15', '3', '1', '3', '8ce8e36d15560451aefb69bdcf52a83291650f9aa4c4f61b91ae751f831e910d', 'http://169.254.160.143:11660', 'flag{9e4cf79350b41086847a8c2847ed1cea}', '互联网安全大赛', 'root');

-- ----------------------------
-- Table structure for pingtai_matchinfo
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_matchinfo`;
CREATE TABLE `pingtai_matchinfo` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(40) NOT NULL,
  `match_start_time` datetime NOT NULL,
  `match_stop_time` datetime NOT NULL,
  `match_user` varchar(999) NOT NULL,
  `match_questions` varchar(999) NOT NULL,
  `match_content` varchar(50) NOT NULL,
  PRIMARY KEY (`match_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_matchinfo
-- ----------------------------
INSERT INTO `pingtai_matchinfo` VALUES ('1', '网鼎杯参赛队伍选拔赛', '2021-04-22 16:05:00', '2021-04-30 16:07:00', '1,2,3', '1,2', '这是一个新建的测试比赛');
INSERT INTO `pingtai_matchinfo` VALUES ('2', 'YoungCtf初赛 & 决赛', '2021-04-13 19:26:00', '2021-04-30 19:26:00', '1,2,3', '1,2,3', '第三届山青YoungCtf火热报名中');
INSERT INTO `pingtai_matchinfo` VALUES ('3', '互联网安全大赛', '2021-04-13 19:25:00', '2021-09-26 19:25:00', '1,2,3,4', '1,2,3', '所有用户&所有题目');

-- ----------------------------
-- Table structure for pingtai_notice
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_notice`;
CREATE TABLE `pingtai_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `notice_content` longtext NOT NULL,
  `notice_time` datetime NOT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE,
  KEY `match_id` (`match_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_notice
-- ----------------------------
INSERT INTO `pingtai_notice` VALUES ('1', '3', '测试通知', '2020-12-19 09:53:26');
INSERT INTO `pingtai_notice` VALUES ('2', '0', '全局通知测试', '2020-12-19 12:20:21');

-- ----------------------------
-- Table structure for pingtai_uphistory
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_uphistory`;
CREATE TABLE `pingtai_uphistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `upload_flag` longtext NOT NULL,
  `if_cheating` varchar(1) NOT NULL,
  `match_title` longtext NOT NULL,
  `user_name` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_uphistory
-- ----------------------------
INSERT INTO `pingtai_uphistory` VALUES ('19', '2', '1', 'flag{6c48f43d1b604b57d44586e49a1777a9}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('18', '2', '1', 'flag{6c48f43d1b604b57d44586e49a1777a9}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('17', '2', '1', 'sdsds', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('16', '2', '2', 'flag{test}', '0', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('15', '2', '1', 'flag{test}', '1', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('14', '2', '2', 'flag{test}', '0', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('13', '2', '2', 'flag{test}', '0', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('12', '2', '2', 'flag{flag}', '1', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('11', '2', '1', 'flag{flag}', '', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('20', '2', '1', 'flag{6c48f43d1b604b57d44586e49a1777a9}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('21', '2', '2', 'flag{b805f52ee511a63d85ab8fe6a8fd5299}', '0', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('22', '2', '1', 'flag{6c48f43d1b604b57d44586e49a1777a9}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('23', '2', '2', 'flag{6c48f43d1b604b57d44586e49a1777a9}', '1', 'YoungCtf初赛 & 决赛', 'user');
INSERT INTO `pingtai_uphistory` VALUES ('24', '2', '1', 'flag{7ec0fb21d667fac003bdcba993afb6c9}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('25', '2', '1', 'flag{0b15680ae4eb6d0b67a99fc0c8febdd2}', '0', 'YoungCtf初赛 & 决赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('26', '3', '1', '', '0', '互联网安全大赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('27', '3', '1', '', '', '互联网安全大赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('28', '3', '1', '', '', '互联网安全大赛', 'root');
INSERT INTO `pingtai_uphistory` VALUES ('29', '2', '3', '', '0', 'YoungCtf初赛 & 决赛', 'test');
INSERT INTO `pingtai_uphistory` VALUES ('30', '2', '3', '', '0', 'YoungCtf初赛 & 决赛', 'test');
INSERT INTO `pingtai_uphistory` VALUES ('31', '2', '3', 'flag{a14f46c2a5414070daf45cf2b9a9896f}', '0', 'YoungCtf初赛 & 决赛', 'test');

-- ----------------------------
-- Table structure for pingtai_writeup
-- ----------------------------
DROP TABLE IF EXISTS `pingtai_writeup`;
CREATE TABLE `pingtai_writeup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `match_id` int(11) NOT NULL,
  `writeup_file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pingtai_writeup
-- ----------------------------
INSERT INTO `pingtai_writeup` VALUES ('24', '1', '2', 'static/upload/upload_WriteUp_file/root-2.pdf');

-- ----------------------------
-- Table structure for registration_registrationprofile
-- ----------------------------
DROP TABLE IF EXISTS `registration_registrationprofile`;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(64) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of registration_registrationprofile
-- ----------------------------
INSERT INTO `registration_registrationprofile` VALUES ('12', 'ce59ce4efae8faa5524a019b317d396575ff04e50828e53f0bd98ada08f51aff', '15', '1');

-- ----------------------------
-- Table structure for registration_supervisedregistrationprofile
-- ----------------------------
DROP TABLE IF EXISTS `registration_supervisedregistrationprofile`;
CREATE TABLE `registration_supervisedregistrationprofile` (
  `registrationprofile_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`registrationprofile_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of registration_supervisedregistrationprofile
-- ----------------------------

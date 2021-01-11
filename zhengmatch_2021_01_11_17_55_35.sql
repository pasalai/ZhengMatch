-- MySQL dump 10.13  Distrib 8.0.16, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: zhengmatch
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add 成绩及答题',1,'add_achievement'),(2,'Can change 成绩及答题',1,'change_achievement'),(3,'Can delete 成绩及答题',1,'delete_achievement'),(4,'Can view 成绩及答题',1,'view_achievement'),(5,'Can add 选择题题库',2,'add_choosequestions'),(6,'Can change 选择题题库',2,'change_choosequestions'),(7,'Can delete 选择题题库',2,'delete_choosequestions'),(8,'Can view 选择题题库',2,'view_choosequestions'),(9,'Can add CTF类型',3,'add_ctfcategory'),(10,'Can change CTF类型',3,'change_ctfcategory'),(11,'Can delete CTF类型',3,'delete_ctfcategory'),(12,'Can view CTF类型',3,'view_ctfcategory'),(13,'Can add CTF题库',4,'add_ctfquestions'),(14,'Can change CTF题库',4,'change_ctfquestions'),(15,'Can delete CTF题库',4,'delete_ctfquestions'),(16,'Can view CTF题库',4,'view_ctfquestions'),(17,'Can add 赛事信息',5,'add_matchinfo'),(18,'Can change 赛事信息',5,'change_matchinfo'),(19,'Can delete 赛事信息',5,'delete_matchinfo'),(20,'Can view 赛事信息',5,'view_matchinfo'),(21,'Can add 公告',6,'add_notice'),(22,'Can change 公告',6,'change_notice'),(23,'Can delete 公告',6,'delete_notice'),(24,'Can view 公告',6,'view_notice'),(25,'Can add 题解',7,'add_writeup'),(26,'Can change 题解',7,'change_writeup'),(27,'Can delete 题解',7,'delete_writeup'),(28,'Can view 题解',7,'view_writeup'),(29,'Can add log entry',8,'add_logentry'),(30,'Can change log entry',8,'change_logentry'),(31,'Can delete log entry',8,'delete_logentry'),(32,'Can view log entry',8,'view_logentry'),(33,'Can add permission',9,'add_permission'),(34,'Can change permission',9,'change_permission'),(35,'Can delete permission',9,'delete_permission'),(36,'Can view permission',9,'view_permission'),(37,'Can add group',10,'add_group'),(38,'Can change group',10,'change_group'),(39,'Can delete group',10,'delete_group'),(40,'Can view group',10,'view_group'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$w4wDfFbAtbPB$3/TCWslGGuVOxYTy6/rhwStPiUf70qIQtv2+s8PIMNU=','2021-01-11 17:49:41.604696',1,'root','','','root@root.com',1,1,'2021-01-11 17:49:04.804471');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(10,'auth','group'),(9,'auth','permission'),(11,'auth','user'),(12,'contenttypes','contenttype'),(1,'pingtai','achievement'),(2,'pingtai','choosequestions'),(3,'pingtai','ctfcategory'),(4,'pingtai','ctfquestions'),(5,'pingtai','matchinfo'),(6,'pingtai','notice'),(7,'pingtai','writeup'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-11 17:42:05.397389'),(2,'auth','0001_initial','2021-01-11 17:42:08.587092'),(3,'admin','0001_initial','2021-01-11 17:42:11.044865'),(4,'admin','0002_logentry_remove_auto_add','2021-01-11 17:42:11.454275'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-11 17:42:11.659578'),(6,'contenttypes','0002_remove_content_type_name','2021-01-11 17:42:12.375251'),(7,'auth','0002_alter_permission_name_max_length','2021-01-11 17:42:12.682708'),(8,'auth','0003_alter_user_email_max_length','2021-01-11 17:42:12.992106'),(9,'auth','0004_alter_user_username_opts','2021-01-11 17:42:13.180499'),(10,'auth','0005_alter_user_last_login_null','2021-01-11 17:42:13.451836'),(11,'auth','0006_require_contenttypes_0002','2021-01-11 17:42:13.603908'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-11 17:42:13.809119'),(13,'auth','0008_alter_user_username_max_length','2021-01-11 17:42:14.219683'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-11 17:42:14.525314'),(15,'auth','0010_alter_group_name_max_length','2021-01-11 17:42:14.934705'),(16,'auth','0011_update_proxy_permissions','2021-01-11 17:42:15.433862'),(17,'auth','0012_alter_user_first_name_max_length','2021-01-11 17:42:15.754426'),(18,'pingtai','0001_initial','2021-01-11 17:42:20.056838'),(19,'sessions','0001_initial','2021-01-11 17:42:20.669598');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lpfmlkfas1rqmv5hnq9d4ipacasb4nuq','.eJxVjEEOwiAQRe_C2hCY0gFcuvcMhBmoVA0kpV0Z765NutDtf-_9lwhxW0vYel7CnMRZaHH63SjyI9cdpHustya51XWZSe6KPGiX15by83K4fwcl9vKtvdV2HA2zwokIMRnj_OAYAJGsRos5ovKaVNKQwYCfcEA_WHaOE4N4fwC3JjbJ:1kytpV:y3h2SdzjGGoqJrGSIU6QqqXj7CmIV3HXtb_NPB25WC8','2021-01-25 17:49:41.813869');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_achievement`
--

DROP TABLE IF EXISTS `pingtai_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_achievement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answered_question_id` longtext NOT NULL,
  `achievement` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_achievement`
--

LOCK TABLES `pingtai_achievement` WRITE;
/*!40000 ALTER TABLE `pingtai_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingtai_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_choosequestions`
--

DROP TABLE IF EXISTS `pingtai_choosequestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_choosequestions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` longtext NOT NULL,
  `question_options` longtext NOT NULL,
  `question_answer` varchar(255) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_choosequestions`
--

LOCK TABLES `pingtai_choosequestions` WRITE;
/*!40000 ALTER TABLE `pingtai_choosequestions` DISABLE KEYS */;
INSERT INTO `pingtai_choosequestions` VALUES (3,'一加一等于几','一加一等于1','2');
/*!40000 ALTER TABLE `pingtai_choosequestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_ctfcategory`
--

DROP TABLE IF EXISTS `pingtai_ctfcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_ctfcategory` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_ctfcategory`
--

LOCK TABLES `pingtai_ctfcategory` WRITE;
/*!40000 ALTER TABLE `pingtai_ctfcategory` DISABLE KEYS */;
INSERT INTO `pingtai_ctfcategory` VALUES (1,'Misc'),(2,'Android'),(3,'Web'),(4,'PWN'),(5,'Reverse'),(6,'Crypto');
/*!40000 ALTER TABLE `pingtai_ctfcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_ctfquestions`
--

DROP TABLE IF EXISTS `pingtai_ctfquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_ctfquestions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL,
  `question_content` longtext NOT NULL,
  `question_tips` longtext NOT NULL,
  `question_answer` varchar(255) NOT NULL,
  `question_fraction` varchar(255) NOT NULL,
  `question_type` varchar(6) NOT NULL,
  `question_ctf_category` varchar(20) NOT NULL,
  `docker_path` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_ctfquestions`
--

LOCK TABLES `pingtai_ctfquestions` WRITE;
/*!40000 ALTER TABLE `pingtai_ctfquestions` DISABLE KEYS */;
INSERT INTO `pingtai_ctfquestions` VALUES (1,'签到题','关注公众号 “山青网安信协” 发送关键字 “flag” 即可得到flag','关注公众号 “山青网安信协” 发送关键字 “flag” 即可得到flag','flag{Welcome_to_join_YoungCtf2020}','500','CTF','Misc',''),(2,'测试题目','http://10.174.254.3:5004','文件包含，文件上传，phar打包','flag{Welcome_to_join_YoungCtf2021}','500','CTF','Web','');
/*!40000 ALTER TABLE `pingtai_ctfquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_matchinfo`
--

DROP TABLE IF EXISTS `pingtai_matchinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_matchinfo` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_name` varchar(40) NOT NULL,
  `match_start_time` datetime NOT NULL,
  `match_stop_time` datetime NOT NULL,
  `match_user` longtext NOT NULL,
  `match_questions` longtext NOT NULL,
  `match_content` varchar(50) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_matchinfo`
--

LOCK TABLES `pingtai_matchinfo` WRITE;
/*!40000 ALTER TABLE `pingtai_matchinfo` DISABLE KEYS */;
INSERT INTO `pingtai_matchinfo` VALUES (1,'网鼎杯参赛队伍选拔赛','2021-01-11 13:13:00','2021-01-11 18:00:00','root/user/user1/user2','1','这是一个新建的测试比赛'),(2,'YoungCtf初赛 & 决赛','2020-12-23 12:14:00','2020-12-31 12:14:00','user/root','1/2','第三届山青YoungCtf火热报名中'),(3,'互联网安全大赛','2021-01-11 13:13:00','2021-01-11 18:00:00','user/user1','1/2','互联网安全大赛，由ffff举办，概述');
/*!40000 ALTER TABLE `pingtai_matchinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_notice`
--

DROP TABLE IF EXISTS `pingtai_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `notice_content` longtext NOT NULL,
  `notice_time` datetime NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_notice`
--

LOCK TABLES `pingtai_notice` WRITE;
/*!40000 ALTER TABLE `pingtai_notice` DISABLE KEYS */;
INSERT INTO `pingtai_notice` VALUES (1,3,'测试通知','2020-12-19 09:53:26'),(2,0,'全局通知测试','2020-12-19 12:20:21');
/*!40000 ALTER TABLE `pingtai_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtai_writeup`
--

DROP TABLE IF EXISTS `pingtai_writeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pingtai_writeup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `match_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtai_writeup`
--

LOCK TABLES `pingtai_writeup` WRITE;
/*!40000 ALTER TABLE `pingtai_writeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingtai_writeup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 17:55:36

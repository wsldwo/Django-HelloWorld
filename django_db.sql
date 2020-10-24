-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: localhost    Database: django_db
-- ------------------------------------------------------
-- Server version	5.7.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add test',7,'add_test'),(26,'Can change test',7,'change_test'),(27,'Can delete test',7,'delete_test'),(28,'Can view test',7,'view_test'),(29,'Can add pony',8,'add_pony'),(30,'Can change pony',8,'change_pony'),(31,'Can delete pony',8,'delete_pony'),(32,'Can view pony',8,'view_pony'),(33,'Can add pony',9,'add_pony'),(34,'Can change pony',9,'change_pony'),(35,'Can delete pony',9,'delete_pony'),(36,'Can view pony',9,'view_pony'),(37,'Can add student',10,'add_student'),(38,'Can change student',10,'change_student'),(39,'Can delete student',10,'delete_student'),(40,'Can view student',10,'view_student'),(41,'Can add teacher',11,'add_teacher'),(42,'Can change teacher',11,'change_teacher'),(43,'Can delete teacher',11,'delete_teacher'),(44,'Can view teacher',11,'view_teacher'),(45,'Can add class',12,'add_class'),(46,'Can change class',12,'change_class'),(47,'Can delete class',12,'delete_class'),(48,'Can view class',12,'view_class');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$M5y09eO4piXc$KfygTHziqbqjNzJ92Im1a0PNd+JdKZ15poLid3Cq7pg=','2020-09-09 01:22:16.710862',1,'root','','','',1,1,'2020-09-09 01:21:14.837092'),(2,'pbkdf2_sha256$216000$lCEHhkO2YXAL$8gU8nsr7/a/8jmFjzXj8DYTcGh56ICRs44EB5zeErNs=','2020-10-08 10:45:43.727540',0,'user0924','','','',0,1,'2020-09-24 11:22:21.740372');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'PonyApp','pony'),(12,'SchoolApp','class'),(10,'SchoolApp','student'),(11,'SchoolApp','teacher'),(6,'sessions','session'),(8,'testapp','pony'),(7,'testapp','test');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-05 00:09:37.699319'),(2,'auth','0001_initial','2020-09-05 00:09:38.936226'),(3,'admin','0001_initial','2020-09-05 00:09:42.676291'),(4,'admin','0002_logentry_remove_auto_add','2020-09-05 00:09:43.545098'),(5,'admin','0003_logentry_add_action_flag_choices','2020-09-05 00:09:43.569920'),(6,'contenttypes','0002_remove_content_type_name','2020-09-05 00:09:44.207451'),(7,'auth','0002_alter_permission_name_max_length','2020-09-05 00:09:45.706209'),(8,'auth','0003_alter_user_email_max_length','2020-09-05 00:09:46.250874'),(9,'auth','0004_alter_user_username_opts','2020-09-05 00:09:46.281141'),(10,'auth','0005_alter_user_last_login_null','2020-09-05 00:09:46.642469'),(11,'auth','0006_require_contenttypes_0002','2020-09-05 00:09:46.674734'),(12,'auth','0007_alter_validators_add_error_messages','2020-09-05 00:09:46.713630'),(13,'auth','0008_alter_user_username_max_length','2020-09-05 00:09:47.264344'),(14,'auth','0009_alter_user_last_name_max_length','2020-09-05 00:09:47.763483'),(15,'auth','0010_alter_group_name_max_length','2020-09-05 00:09:48.372409'),(16,'auth','0011_update_proxy_permissions','2020-09-05 00:09:48.404256'),(17,'auth','0012_alter_user_first_name_max_length','2020-09-05 00:09:48.930542'),(18,'sessions','0001_initial','2020-09-05 00:09:49.153122'),(19,'testapp','0001_initial','2020-09-05 00:11:25.474663'),(20,'testapp','0002_auto_20200905_1002','2020-09-05 03:21:04.439350'),(21,'testapp','0003_auto_20200905_1026','2020-09-05 03:21:04.748875'),(22,'testapp','0004_auto_20200905_1054','2020-09-05 03:21:04.787878'),(23,'testapp','0005_auto_20200905_1117','2020-09-05 03:21:04.807796'),(24,'testapp','0006_test_color','2020-09-05 03:32:22.478393'),(25,'PonyApp','0001_initial','2020-09-05 03:43:41.518797'),(26,'SchoolApp','0001_initial','2020-09-13 02:50:27.726013'),(27,'SchoolApp','0002_auto_20200913_1524','2020-09-13 07:24:39.884283');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `django_session` VALUES ('562oudf18fr1cy5vrqec58zo9grogh7h','.eJxVjEsOwjAMBe-SNYqstE0dluw5Q2TXNi2gROpnhbg7VOoCtm9m3stl2tYxb4vOeRJ3dsGdfjem4aFlB3Kncqt-qGWdJ_a74g-6-GsVfV4O9-9gpGX81pA6GxpDjW3XJIkhxcDQB8NEbUQkDcaGbKKIAMjQpb7VRCJsrODeH9u4OFg:1kLQYI:_oLAGRPZQTpNtfZ9hoeUTH5JkEfSICjyCVUYhfvPrcY','2020-10-08 12:40:46.501854'),('cvswjc9nqquhr4gu89anv874u27fgl42','.eJxVjEEOwiAQRe_C2pCOMGBduvcMZIYBqRpISrsy3l2bdKHb_977LxVoXUpYe5rDJOqsQB1-N6b4SHUDcqd6azq2uswT603RO-362iQ9L7v7d1Col29trCB6x5iYxeZ0dIiGIg0EjATRox3Z4uCycyfIIg4QkvF29NkbYPX-AOdGN6A:1kFooS:bjJMA8mdL64WJU2EIJQt3jRUD0QYovmBL58kEzsKnyk','2020-09-23 01:22:16.730147'),('fxbpkbz2pp7durzptcot4iocvqkdkylu','.eJxVjEsOgkAQRO8yazMZBxh63ImfnWcg3XS3oAYSPivj3R0SFrqsqlfvbWpc5rZeJhnrjs3BeLP77Qibp_TrwA_s74Nthn4eO7IrYrd1sreB5VVt7J-gxalNbxcLbTIFCXmRRQ4-Bk-u9AoR8wCA4pUUSFkAnANyRSxzichMSuKSlHHGfVIdq9OWfErny9V8vmfqP2A:1kM03C:dYo4qMzxLtmr3i76F8X--wh2X1DlqmQSZpT0xqPAM8I','2020-10-10 02:35:02.563167'),('nxhe0kv1twcro3p85wc8n9zsydntfpvt','.eJxVjEsOgkAQRO8yazMZBxh63ImfnWcg3XS3oAYSPivj3R0SFrqsqlfvbWpc5rZeJhnrjs3BeLP77Qibp_TrwA_s74Nthn4eO7IrYrd1sreB5VVt7J-gxalNbxcLbTIFCXmRRQ4-Bk-u9AoR8wCA4pUUSFkAnANyRSxzichMSuKSlHHGfVIdq9OWfErny9V8vmfqP2A:1kQTQd:ng3my2F6nujfNC2OK3oqwiV2nyw_3WHSDkIp6PacoB4','2020-10-22 10:45:43.747346');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponyapp_pony`
--

DROP TABLE IF EXISTS `ponyapp_pony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponyapp_pony` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `color` varchar(20) NOT NULL,
  `ability` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponyapp_pony`
--

LOCK TABLES `ponyapp_pony` WRITE;
/*!40000 ALTER TABLE `ponyapp_pony` DISABLE KEYS */;
INSERT INTO `ponyapp_pony` VALUES (1,'rarity',16,'white','clothes design'),(2,'pinkie pie',16,'pink','party design'),(3,'twilight sparkle',16,'purple','unicorn magic'),(4,'apple jack',16,'orange','plant apple'),(5,'rainbow dash',16,'blue','flyer team'),(6,'starlight glimmer',16,'purple','unicorn magic'),(11,'fluttershy',17,'pink','animal expert'),(12,'princess luna',5000,'blue','raise moon'),(13,'princess celestia',5020,'white','raise sun'),(14,'sunset shimmer',18,'orange','unicorn magic'),(15,'dj',16,'blue','dj artist'),(16,'shinning armor',24,'white','defend team'),(17,'pienapple pen',30,'Chocolate','nurse'),(18,'banana cup',12,'Chocolate','merchant'),(19,'watermelon ice',12,'LawnGreen','doctor'),(20,'autunm ice',14,'DarkGray','doctor'),(21,'summer cake',30,'DarkGray','nurse'),(22,'watermelon noodle',14,'Salmon','zoo keeper'),(23,'spring noodle',30,'LightSeaGreen','writer'),(24,'banana python',13,'Salmon','writer'),(25,'perl game',13,'LightSeaGreen','teacher'),(26,'spring heart',21,'Azure','writer'),(27,'flower game',16,'Tomato','researcher'),(28,'autunm pen',12,'DarkGray','farmer'),(29,'summer computer',26,'Tomato','researcher'),(30,'pienapple python',13,'DarkGray','researcher'),(31,'pienapple heart',11,'Azure','writer'),(32,'perl math',13,'SpringGreen','farmer'),(33,'autunm ice',10,'Azure','zoo keeper'),(34,'autunm ice',20,'Chocolate','teacher'),(35,'flower game',21,'Chocolate','nurse'),(36,'banana ice',30,'LightSeaGreen','singer'),(37,'pienapple computer',26,'SpringGreen','zoo keeper'),(38,'spring ice',22,'PeachPuff','merchant'),(39,'banana water',30,'Tomato','singer'),(40,'pienapple game',22,'DarkGray','nurse'),(41,'watermelon math',13,'GreenYellow','zoo keeper'),(42,'strawberry water',16,'DarkGray','zoo keeper'),(43,'cherry game',19,'Salmon','zoo keeper'),(44,'orange book',28,'Azure','teacher'),(45,'winter noodle',29,'Tomato','nurse'),(46,'watermelon computer',12,'PeachPuff','zoo keeper'),(47,'summer computer',18,'LightSeaGreen','singer'),(48,'strawberry python',20,'Azure','merchant'),(49,'cherry computer',21,'Tomato','nurse'),(50,'pienapple game',24,'Salmon','farmer'),(51,'cherry computer',16,'LightSeaGreen','nurse'),(52,'watermelon math',25,'LightSeaGreen','singer'),(53,'pienapple ice',23,'DarkGray','writer'),(54,'banana book',28,'SpringGreen','researcher'),(55,'flower game',11,'Snow','detective'),(56,'summer ice',19,'Chocolate','singer'),(57,'banana game',46,'Tomato','researcher'),(58,'watermelon book',93,'Tomato','doctor'),(59,'winter book',30,'Salmon','teacher'),(60,'cherry noodle',12,'SpringGreen','detective'),(61,'perl book',81,'GreenYellow','nurse'),(62,'spring pen',62,'LawnGreen','nurse'),(63,'perl water',13,'LawnGreen','researcher'),(64,'banana cake',94,'LawnGreen','farmer'),(65,'pienapple python',14,'LawnGreen','doctor'),(66,'banana water',30,'Chocolate','singer'),(67,'flower pen',48,'PeachPuff','merchant'),(68,'pienapple computer',9,'LightSeaGreen','researcher'),(69,'watermelon pen',77,'Azure','merchant'),(70,'autunm python',92,'LawnGreen','teacher'),(71,'autunm cup',21,'Snow','writer'),(72,'autunm book',48,'LawnGreen','farmer'),(73,'flower ice',50,'SpringGreen','farmer'),(74,'strawberry game',9,'Silver','researcher'),(75,'autunm computer',10,'Silver','writer'),(76,'perl cup',11,'Wheat','farmer'),(77,'summer book',27,'DarkGray','zoo keeper'),(78,'spring noodle',9,'Azure','farmer'),(79,'perl math',33,'DarkGray','nurse'),(80,'autunm cake',63,'Salmon','farmer'),(81,'summer game',87,'LawnGreen','detective'),(82,'strawberry cake',17,'Azure','teacher'),(83,'pienapple ice',75,'Silver','farmer'),(84,'strawberry math',73,'Snow','teacher'),(85,'strawberry computer',11,'Wheat','writer'),(86,'spring water',45,'Salmon','actor'),(87,'flower python',72,'Silver','nurse'),(88,'watermelon python',73,'PeachPuff','doctor'),(89,'pienapple math',61,'Tomato','writer'),(90,'winter ice',13,'Wheat','researcher'),(91,'strawberry book',83,'SpringGreen','nurse'),(92,'summer python',68,'SpringGreen','singer'),(93,'summer water',79,'LightSeaGreen','merchant'),(94,'orange water',97,'LawnGreen','researcher'),(95,'cherry pen',61,'PeachPuff','farmer'),(96,'flower noodle',53,'SpringGreen','detective'),(97,'banana python',73,'PeachPuff','actor'),(98,'flower book',43,'Tomato','nurse'),(99,'perl math',43,'Azure','writer'),(100,'spring noodle',59,'Snow','zoo keeper'),(101,'flower heart',61,'Chocolate','nurse'),(102,'banana book',76,'SpringGreen','teacher'),(103,'orange cake',90,'Snow','teacher'),(104,'spring computer',47,'DarkGray','nurse'),(105,'cherry book',85,'Snow','merchant'),(106,'autunm math',46,'Azure','zoo keeper'),(107,'pienapple heart',77,'Snow','merchant'),(108,'watermelon book',75,'SpringGreen','writer'),(109,'winter game',30,'Chocolate','doctor'),(110,'summer book',12,'LawnGreen','zoo keeper'),(111,'perl noodle',58,'SpringGreen','writer'),(112,'autunm noodle',73,'LightSeaGreen','merchant'),(113,'winter math',20,'LawnGreen','nurse'),(114,'pienapple cup',48,'PeachPuff','researcher'),(115,'flower cake',70,'LawnGreen','singer'),(116,'pienapple ice',94,'Salmon','farmer'),(117,'orange math',54,'Tomato','merchant'),(118,'watermelon book',13,'LightSeaGreen','actor'),(119,'spring cake',93,'Wheat','actor'),(120,'cherry ice',86,'PeachPuff','doctor'),(121,'flower heart',38,'Tomato','farmer'),(122,'strawberry pen',80,'Salmon','teacher'),(123,'autunm python',23,'DarkGray','merchant'),(124,'watermelon noodle',49,'Tomato','researcher'),(125,'orange cake',17,'SpringGreen','doctor'),(126,'orange math',61,'DarkGray','teacher'),(127,'autunm computer',65,'DarkGray','farmer'),(128,'cherry book',92,'SpringGreen','detective'),(129,'cherry noodle',9,'Tomato','teacher'),(130,'cherry cake',49,'DarkGray','singer'),(131,'perl heart',41,'LawnGreen','merchant'),(132,'watermelon cake',97,'Tomato','doctor'),(133,'spring water',17,'DarkGray','writer'),(134,'autunm python',52,'GreenYellow','farmer'),(135,'pienapple cake',42,'PeachPuff','doctor'),(136,'banana pen',11,'LawnGreen','singer'),(137,'autunm game',65,'Chocolate','detective'),(138,'autunm game',17,'PeachPuff','zoo keeper'),(139,'strawberry noodle',35,'Tomato','zoo keeper'),(140,'perl computer',95,'SpringGreen','detective'),(141,'autunm math',37,'Snow','merchant'),(142,'orange water',100,'LightSeaGreen','actor'),(143,'banana cake',69,'Snow','singer'),(144,'banana heart',30,'PeachPuff','researcher'),(145,'strawberry cake',61,'Silver','writer'),(146,'cherry water',72,'DarkGray','teacher'),(147,'autunm cake',72,'Tomato','merchant'),(148,'watermelon heart',42,'PeachPuff','doctor'),(149,'banana math',53,'Wheat','detective'),(150,'cherry ice',41,'Azure','writer'),(151,'orange computer',100,'Snow','writer'),(152,'orange python',51,'Snow','farmer'),(153,'winter water',97,'LawnGreen','zoo keeper'),(154,'orange math',52,'Chocolate','farmer'),(155,'spring cake',88,'PeachPuff','actor'),(156,'pienapple water',49,'Wheat','nurse');
/*!40000 ALTER TABLE `ponyapp_pony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_class`
--

DROP TABLE IF EXISTS `schoolapp_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolapp_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `population` smallint(6) NOT NULL,
  `classteacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classteacher_id` (`classteacher_id`),
  CONSTRAINT `SchoolApp_class_classteacher_id_0a986f13_fk_SchoolApp_teacher_id` FOREIGN KEY (`classteacher_id`) REFERENCES `schoolapp_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_class`
--

LOCK TABLES `schoolapp_class` WRITE;
/*!40000 ALTER TABLE `schoolapp_class` DISABLE KEYS */;
INSERT INTO `schoolapp_class` VALUES (1,'高二4班',58,1),(2,'高二1班',50,2),(3,'高二2班',52,5);
/*!40000 ALTER TABLE `schoolapp_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_class_teachers`
--

DROP TABLE IF EXISTS `schoolapp_class_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolapp_class_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SchoolApp_class_teachers_class_id_teacher_id_eafa3fb1_uniq` (`class_id`,`teacher_id`),
  KEY `SchoolApp_class_teac_teacher_id_86ff9517_fk_SchoolApp` (`teacher_id`),
  CONSTRAINT `SchoolApp_class_teac_teacher_id_86ff9517_fk_SchoolApp` FOREIGN KEY (`teacher_id`) REFERENCES `schoolapp_teacher` (`id`),
  CONSTRAINT `SchoolApp_class_teachers_class_id_c8573f12_fk_SchoolApp_class_id` FOREIGN KEY (`class_id`) REFERENCES `schoolapp_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_class_teachers`
--

LOCK TABLES `schoolapp_class_teachers` WRITE;
/*!40000 ALTER TABLE `schoolapp_class_teachers` DISABLE KEYS */;
INSERT INTO `schoolapp_class_teachers` VALUES (9,1,6),(1,1,7),(2,1,10),(13,1,16),(14,1,17),(15,1,18),(5,2,7),(3,2,9),(4,2,10),(10,2,13),(11,2,14),(12,2,15),(16,3,8),(18,3,12),(19,3,15),(17,3,17),(20,3,19);
/*!40000 ALTER TABLE `schoolapp_class_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_student`
--

DROP TABLE IF EXISTS `schoolapp_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolapp_student` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` smallint(6) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `_class_id` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `SchoolApp_student__class_id_176c1a71_fk_SchoolApp_class_id` (`_class_id`),
  CONSTRAINT `SchoolApp_student__class_id_176c1a71_fk_SchoolApp_class_id` FOREIGN KEY (`_class_id`) REFERENCES `schoolapp_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_student`
--

LOCK TABLES `schoolapp_student` WRITE;
/*!40000 ALTER TABLE `schoolapp_student` DISABLE KEYS */;
INSERT INTO `schoolapp_student` VALUES (1,'徐莹',15,'女',2),(2,'李慧',14,'女',2),(3,'陈科豪',15,'男',2),(4,'雷荣飞',15,'男',2),(5,'王新玉',15,'女',1),(6,'谭卉',14,'女',1),(7,'康希豪',33,'男',1),(8,'李秀亭',33,'男',1),(9,'熊洪强',33,'男',1),(10,'马平川',33,'男',1),(11,'马天顺',33,'男',1),(12,'李博',32,'男',1),(13,'李专',15,'女',1),(14,'王梦溪',14,'女',1),(15,'孙武',33,'男',1),(16,'刘杰予',33,'男',1),(17,'张文利',15,'男',2),(18,'任乐',15,'男',2),(19,'唐安',15,'男',2),(20,'胡瑞杰',16,'男',2),(21,'但卓航',15,'男',2),(22,'谢天渊',16,'男',2),(23,'周涛',15,'男',2),(24,'徐家宇',16,'男',2),(25,'邓学琤',14,'男',2),(26,'周嘉鑫',15,'男',2),(27,'胡佳琦',14,'男',2),(28,'方正',15,'男',2),(29,'付文慧',14,'女',2),(30,'李文洁',15,'女',2),(31,'刘格格',14,'女',2),(32,'文嘉莉',15,'女',2),(33,'廖丝雨',14,'女',2),(34,'龙自如',15,'女',2),(35,'沈杨玲',14,'女',2),(36,'马裕溪',15,'女',2),(37,'石蕊',15,'女',2),(38,'唐密',16,'女',2),(39,'罗列耶',33,'男',1),(40,'李金波',33,'男',1),(41,'赵荣瑾',33,'男',1),(42,'孙廷超',33,'男',1),(43,'钱鹏飞',15,'男',3),(44,'刘欣怡',14,'女',3),(45,'吕苗',14,'女',1),(46,'曾玉恩',14,'女',1);
/*!40000 ALTER TABLE `schoolapp_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_teacher`
--

DROP TABLE IF EXISTS `schoolapp_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolapp_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` smallint(6) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `addr` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_teacher`
--

LOCK TABLES `schoolapp_teacher` WRITE;
/*!40000 ALTER TABLE `schoolapp_teacher` DISABLE KEYS */;
INSERT INTO `schoolapp_teacher` VALUES (1,'王星',27,'男','18202797005','陆水高中'),(2,'李丹',24,'女','13510748964','陆水高中'),(5,'王洪波',50,'男','18703763345','陆水高中'),(6,'李静',25,'女','15347014698','陆水高中'),(7,'芦大旺',27,'男','19162782993','陆水高中'),(8,'杜平之',25,'女','17747014651','陆水高中'),(9,'马力',50,'男','13167542993','陆水高中'),(10,'张艳华',24,'女','15147014651','陆水高中'),(11,'曾益',24,'男','18862782993','陆水高中'),(12,'宋佳',24,'女','19047014651','陆水高中'),(13,'邱金华',34,'男','15162782993','陆水高中'),(14,'孔小静',24,'女','19047014651','陆水高中'),(15,'刘丽',25,'女','15662783456','陆水高中'),(16,'刘念',24,'女','19047011564','陆水高中'),(17,'丁实德',40,'男','18862782993','陆水高中'),(18,'于唯兰',34,'女','18647014651','陆水高中'),(19,'宋艳林',60,'男','18823456754','陆水高中'),(20,'彭存鑫',65,'男','18023456709','陆水高中');
/*!40000 ALTER TABLE `schoolapp_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testapp_test`
--

DROP TABLE IF EXISTS `testapp_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testapp_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `ability` varchar(40) NOT NULL,
  `color` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testapp_test`
--

LOCK TABLES `testapp_test` WRITE;
/*!40000 ALTER TABLE `testapp_test` DISABLE KEYS */;
INSERT INTO `testapp_test` VALUES (1,'2020-09-05 08:39:17','',''),(2,'rarity','','');
/*!40000 ALTER TABLE `testapp_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-11 17:40:30

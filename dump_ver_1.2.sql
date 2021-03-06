-- MySQL dump 10.13  Distrib 5.6.23, for osx10.8 (x86_64)
--
-- Host: localhost    Database: ads_development
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `acquired_quota_points`
--

DROP TABLE IF EXISTS `acquired_quota_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acquired_quota_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `date_conducted` date NOT NULL DEFAULT '2015-02-20',
  `training_activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_acquired_quota_points_on_training_activity_id` (`training_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquired_quota_points`
--

LOCK TABLES `acquired_quota_points` WRITE;
/*!40000 ALTER TABLE `acquired_quota_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `acquired_quota_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_members`
--

DROP TABLE IF EXISTS `activity_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varsity_member_id` int(11) DEFAULT NULL,
  `acquired_quota_point_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `judge` tinyint(1) DEFAULT NULL,
  `article` tinyint(1) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_members`
--

LOCK TABLES `activity_members` WRITE;
/*!40000 ALTER TABLE `activity_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_debts`
--

DROP TABLE IF EXISTS `competition_debts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_debts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_of_debt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `debt_amount` decimal(10,2) DEFAULT NULL,
  `competition_id` int(11) NOT NULL,
  `varsity_member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_competition_debts_on_varsity_member_id` (`varsity_member_id`),
  KEY `index_competition_debts_on_competition_id` (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_debts`
--

LOCK TABLES `competition_debts` WRITE;
/*!40000 ALTER TABLE `competition_debts` DISABLE KEYS */;
/*!40000 ALTER TABLE `competition_debts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number_of_contingent` int(11) NOT NULL,
  `arqp_contingent_debater` decimal(10,2) DEFAULT NULL,
  `arqp_contingent_adjudicator` decimal(10,2) DEFAULT NULL,
  `arqp_non_contingent` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL DEFAULT '2015-02-20',
  `end_date` date NOT NULL DEFAULT '2015-02-20',
  `quota_point_monetary_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (10,'Finals',5,5.00,5.00,2.00,'Ongoing','2015-03-20','2015-03-25',2.00);
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contingent_members`
--

DROP TABLE IF EXISTS `contingent_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contingent_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contingent_id` int(11) DEFAULT NULL,
  `debater_position` varchar(255) DEFAULT NULL,
  `tryout_member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contingent_members`
--

LOCK TABLES `contingent_members` WRITE;
/*!40000 ALTER TABLE `contingent_members` DISABLE KEYS */;
INSERT INTO `contingent_members` VALUES (1,3,'Contingent Debater',1,'2015-03-18 06:02:16','2015-03-18 06:02:16');
/*!40000 ALTER TABLE `contingent_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contingents`
--

DROP TABLE IF EXISTS `contingents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contingents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tryout_intent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contingents`
--

LOCK TABLES `contingents` WRITE;
/*!40000 ALTER TABLE `contingents` DISABLE KEYS */;
/*!40000 ALTER TABLE `contingents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt_settlements`
--

DROP TABLE IF EXISTS `debt_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debt_settlements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `date_paid` date NOT NULL DEFAULT '2015-02-20',
  `varsity_member_id` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_debt_settlements_on_varsity_member_id` (`varsity_member_id`),
  KEY `index_debt_settlements_on_officer_id` (`officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt_settlements`
--

LOCK TABLES `debt_settlements` WRITE;
/*!40000 ALTER TABLE `debt_settlements` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt_settlements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer_in_charges`
--

DROP TABLE IF EXISTS `officer_in_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officer_in_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_officer_in_charges_on_email` (`email`),
  UNIQUE KEY `index_officer_in_charges_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer_in_charges`
--

LOCK TABLES `officer_in_charges` WRITE;
/*!40000 ALTER TABLE `officer_in_charges` DISABLE KEYS */;
INSERT INTO `officer_in_charges` VALUES (8,'ma@yahoo.com','$2a$10$INZ1iC2IugqaSAe57hLlF.A5mjG1oolvDZRi9vdICmLY7y8/STMNS',NULL,NULL,NULL,1,'2015-03-08 06:24:01','2015-03-08 06:24:01','127.0.0.1','127.0.0.1',NULL,'2015-03-08 06:24:01','2015-03-08 06:24:01',3),(9,'march_chua@yahoo.com','$2a$10$UfM/rp/2F9blQLYlHuYrDeMdgKrWYytCK/gZvaNEzkXV/ub01hqXa','7e7f6d2dae4511eaac7786ff83dbf2e0e54701f0bea7b79e442ee8c91363281a','2015-03-16 14:15:20',NULL,2,'2015-03-13 01:47:21','2015-03-08 07:21:04','127.0.0.1','127.0.0.1',NULL,'2015-03-08 07:21:04','2015-03-16 14:15:20',4),(10,'azi@yahoo.com','$2a$10$elvREYq5iXIc.0QlfoSt7e0I2cZhr.ixQWwjgK40cF6U5QFkJpSgG',NULL,NULL,NULL,1,'2015-03-08 08:02:27','2015-03-08 08:02:27','127.0.0.1','127.0.0.1',NULL,'2015-03-08 08:02:27','2015-03-08 08:02:27',4),(11,'adrian@yahoo.com','$2a$10$CbYME2E27o25zqKKXd2M6OznwIL9vf.Zjgqf0PGWdzWVd3krYZlie',NULL,NULL,NULL,1,'2015-03-08 08:03:03','2015-03-08 08:03:03','127.0.0.1','127.0.0.1',NULL,'2015-03-08 08:03:03','2015-03-08 08:03:03',3),(12,'marichelle@yahoo.com','$2a$10$KJPl8Bx9br9W/Q.Yscz3Lu1.FBwPW9oxqub4jk5m70DNmlZe91apC',NULL,NULL,NULL,5,'2015-03-18 06:16:04','2015-03-11 03:41:51','127.0.0.1','127.0.0.1',NULL,'2015-03-09 02:48:19','2015-03-18 06:16:04',3),(13,'march@yahoo.com','$2a$10$ZU7mj.zX9VBra.auE.izQ.DF4TGOXU8N4DYSjzmTSLaauc32iw7Py',NULL,NULL,NULL,14,'2015-03-18 09:47:38','2015-03-18 09:22:07','127.0.0.1','127.0.0.1',NULL,'2015-03-11 03:43:39','2015-03-18 09:47:38',5),(14,'chua@yahoo.com','$2a$10$YqjtcGOrygafDp349Akkne8sQFRtyEXXq3VHqygrVRfy3bVKpHOK.',NULL,NULL,NULL,5,'2015-03-18 09:36:25','2015-03-18 09:25:07','127.0.0.1','127.0.0.1',NULL,'2015-03-11 03:46:36','2015-03-18 09:36:25',4),(15,'ets@misa.org.ph','$2a$10$3CJZEzi/BXBPUOBpBbfXaeLjik5lapTQ0N5XGQO18rtN0K1WEKbMi',NULL,NULL,NULL,1,'2015-03-18 05:11:52','2015-03-18 05:11:52','127.0.0.1','127.0.0.1',NULL,'2015-03-18 05:11:52','2015-03-18 05:11:52',5);
/*!40000 ALTER TABLE `officer_in_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (3,'Office of Finance','2015-03-08 04:22:32','2015-03-08 04:22:32'),(4,'Office of Training and Varsity','2015-03-08 04:22:44','2015-03-08 04:22:44'),(5,'Administrator','2015-03-08 07:37:51','2015-03-08 07:37:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150219133018'),('20150219143539'),('20150219143609'),('20150219162842'),('20150219163952'),('20150220135313'),('20150220144002'),('20150220144710'),('20150220144716'),('20150303080751'),('20150307075258'),('20150307083852'),('20150307101346'),('20150308040828'),('20150308083648'),('20150308085344'),('20150308085950'),('20150309025639'),('20150309031123'),('20150311055029'),('20150311135157'),('20150311153028'),('20150315063859'),('20150316145123'),('20150317124246'),('20150317124437'),('20150317124954'),('20150317125504'),('20150317131007'),('20150318024609'),('20150318030526'),('20150318035559'),('20150318041632'),('20150318101533');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_activities`
--

DROP TABLE IF EXISTS `training_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quota_point_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_activities`
--

LOCK TABLES `training_activities` WRITE;
/*!40000 ALTER TABLE `training_activities` DISABLE KEYS */;
INSERT INTO `training_activities` VALUES (10,'Debate Round',4.00);
/*!40000 ALTER TABLE `training_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tryout_intents`
--

DROP TABLE IF EXISTS `tryout_intents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tryout_intents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '2015-02-20',
  `competition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tryout_intents`
--

LOCK TABLES `tryout_intents` WRITE;
/*!40000 ALTER TABLE `tryout_intents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tryout_intents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tryout_members`
--

DROP TABLE IF EXISTS `tryout_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tryout_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varsity_member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `debater_position` varchar(255) DEFAULT NULL,
  `tryout_intent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tryout_members`
--

LOCK TABLES `tryout_members` WRITE;
/*!40000 ALTER TABLE `tryout_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `tryout_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varsity_members`
--

DROP TABLE IF EXISTS `varsity_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varsity_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vm_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `course` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `varsity_track` varchar(255) NOT NULL,
  `debater_position` varchar(255) NOT NULL DEFAULT 'Non-contingent',
  `total_debt` decimal(10,2) DEFAULT NULL,
  `total_acquired_quota_points` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varsity_members`
--

LOCK TABLES `varsity_members` WRITE;
/*!40000 ALTER TABLE `varsity_members` DISABLE KEYS */;
INSERT INTO `varsity_members` VALUES (7,100001,'Juan','Dela Cruz',4,'BS MIS','juan@yahoo.com','09171111111','Debater','Non-contingent',0.00,0.00,'2015-03-18 12:14:00','2015-03-18 12:14:00');
/*!40000 ALTER TABLE `varsity_members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-18 20:49:48

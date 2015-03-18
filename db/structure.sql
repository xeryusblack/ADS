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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `contingents`
--

DROP TABLE IF EXISTS `contingents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contingents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tryout_intent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-18 18:18:47
INSERT INTO schema_migrations (version) VALUES ('20150219133018');

INSERT INTO schema_migrations (version) VALUES ('20150219143539');

INSERT INTO schema_migrations (version) VALUES ('20150219143609');

INSERT INTO schema_migrations (version) VALUES ('20150219162842');

INSERT INTO schema_migrations (version) VALUES ('20150219163952');

INSERT INTO schema_migrations (version) VALUES ('20150220135313');

INSERT INTO schema_migrations (version) VALUES ('20150220144002');

INSERT INTO schema_migrations (version) VALUES ('20150220144710');

INSERT INTO schema_migrations (version) VALUES ('20150220144716');

INSERT INTO schema_migrations (version) VALUES ('20150303080751');

INSERT INTO schema_migrations (version) VALUES ('20150307075258');

INSERT INTO schema_migrations (version) VALUES ('20150307083852');

INSERT INTO schema_migrations (version) VALUES ('20150307101346');

INSERT INTO schema_migrations (version) VALUES ('20150308040828');

INSERT INTO schema_migrations (version) VALUES ('20150308083648');

INSERT INTO schema_migrations (version) VALUES ('20150308085344');

INSERT INTO schema_migrations (version) VALUES ('20150308085950');

INSERT INTO schema_migrations (version) VALUES ('20150309025639');

INSERT INTO schema_migrations (version) VALUES ('20150309031123');

INSERT INTO schema_migrations (version) VALUES ('20150311055029');

INSERT INTO schema_migrations (version) VALUES ('20150311135157');

INSERT INTO schema_migrations (version) VALUES ('20150311153028');

INSERT INTO schema_migrations (version) VALUES ('20150315063859');

INSERT INTO schema_migrations (version) VALUES ('20150316145123');

INSERT INTO schema_migrations (version) VALUES ('20150317124246');

INSERT INTO schema_migrations (version) VALUES ('20150317124437');

INSERT INTO schema_migrations (version) VALUES ('20150317124954');

INSERT INTO schema_migrations (version) VALUES ('20150317125504');

INSERT INTO schema_migrations (version) VALUES ('20150317131007');

INSERT INTO schema_migrations (version) VALUES ('20150318024609');

INSERT INTO schema_migrations (version) VALUES ('20150318030526');

INSERT INTO schema_migrations (version) VALUES ('20150318035559');

INSERT INTO schema_migrations (version) VALUES ('20150318041632');

INSERT INTO schema_migrations (version) VALUES ('20150318101533');


-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_development
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commenter` varchar(255) DEFAULT NULL,
  `body` text,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_err_code_ins_infos`
--

DROP TABLE IF EXISTS `daily_err_code_ins_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_err_code_ins_infos` (
  `date` varchar(10) NOT NULL DEFAULT '',
  `app_type` varchar(10) NOT NULL DEFAULT '',
  `err_code` varchar(10) NOT NULL DEFAULT '',
  `acq_ins` varchar(15) NOT NULL DEFAULT '',
  `fwd_ins` varchar(15) NOT NULL DEFAULT '',
  `err_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`date`,`app_type`,`err_code`,`acq_ins`,`fwd_ins`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_err_codes`
--

DROP TABLE IF EXISTS `daily_err_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_err_codes` (
  `date` varchar(10) NOT NULL DEFAULT '',
  `app_type` varchar(10) NOT NULL DEFAULT '',
  `err_code` varchar(10) NOT NULL DEFAULT '',
  `err_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`date`,`app_type`,`err_code`),
  KEY `index_daily_err_codes_on_datestr_and_app_type_and_err_code` (`date`,`app_type`,`err_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_err_num_hours`
--

DROP TABLE IF EXISTS `daily_err_num_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_err_num_hours` (
  `date` varchar(10) NOT NULL DEFAULT '',
  `app_type` varchar(10) NOT NULL DEFAULT '',
  `hour` varchar(10) NOT NULL DEFAULT '',
  `err_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`date`,`app_type`,`hour`),
  KEY `index_daily_err_num_hours_on_datestr_and_app_type_and_hour` (`date`,`app_type`,`hour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_err_num_modules`
--

DROP TABLE IF EXISTS `daily_err_num_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_err_num_modules` (
  `dates` varchar(10) NOT NULL DEFAULT '',
  `app_type` varchar(10) NOT NULL DEFAULT '',
  `module` varchar(15) NOT NULL DEFAULT '',
  `err_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`dates`,`app_type`,`module`),
  KEY `index_daily_err_num_modules_on_datestr_and_app_type_and_module` (`dates`,`app_type`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_err_nums`
--

DROP TABLE IF EXISTS `daily_err_nums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_err_nums` (
  `date` varchar(10) NOT NULL,
  `app_type` varchar(10) NOT NULL,
  `host_name` varchar(10) NOT NULL,
  `err_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`date`,`app_type`,`host_name`),
  KEY `index_daily_err_nums_on_datestr_and_app_type_and_host_name` (`date`,`app_type`,`host_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `err_codes`
--

DROP TABLE IF EXISTS `err_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `err_codes` (
  `err_code` varchar(10) NOT NULL DEFAULT '',
  `module_name` varchar(20) NOT NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`err_code`,`module_name`),
  KEY `index_err_codes_on_err_code_and_module_name` (`err_code`,`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swts`
--

DROP TABLE IF EXISTS `swts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daystr` text,
  `daynum` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-14 12:55:57

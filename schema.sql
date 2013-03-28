-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: shorten
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `shorten_links`
--

DROP TABLE IF EXISTS `shorten_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shorten_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `identifier` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_13319CFC81CFDAE7` (`url_id`),
  KEY `identifier_index` (`identifier`(255)),
  CONSTRAINT `FK_13319CFC81CFDAE7` FOREIGN KEY (`url_id`) REFERENCES `shorten_urls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shorten_links`
--

LOCK TABLES `shorten_links` WRITE;
/*!40000 ALTER TABLE `shorten_links` DISABLE KEYS */;
INSERT INTO `shorten_links` VALUES (1,1,1,'0','2013-02-23 09:19:15'),(2,2,0,'2','2013-02-23 09:37:12'),(3,2,0,'2','2013-02-23 09:38:00'),(4,3,1,'goog','2013-02-23 18:23:53'),(5,4,1,'yahoo','2013-02-25 10:55:05'),(6,5,0,'5','2013-02-27 05:42:50'),(7,6,0,'6','2013-02-27 05:43:32'),(8,7,0,'7','2013-02-27 05:44:08'),(9,8,1,'symlinks','2013-02-27 06:17:04');
/*!40000 ALTER TABLE `shorten_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shorten_urls`
--

DROP TABLE IF EXISTS `shorten_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shorten_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4E56741D2F727085` (`original`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shorten_urls`
--

LOCK TABLES `shorten_urls` WRITE;
/*!40000 ALTER TABLE `shorten_urls` DISABLE KEYS */;
INSERT INTO `shorten_urls` VALUES (1,'google.fr'),(5,'http://fr.wikipedia.org/wiki/Proxy_inverse'),(6,'http://gonzalo123.com/2012/09/03/dependency-injection-containers-with-php-when-pimple-is-not-enough/#comment-4001'),(3,'http://google.com'),(8,'http://www.simounet.net/creation-de-liens-symboliques-sous-windows-7-symlink/'),(2,'http://yahoo.com'),(4,'http://yahoo.fr'),(7,'https://igor.io/2013/02/02/http-kernel-middlewares.html');
/*!40000 ALTER TABLE `shorten_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shorten_visits`
--

DROP TABLE IF EXISTS `shorten_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shorten_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3EDACB6ADA40271` (`link_id`),
  CONSTRAINT `FK_E3EDACB6ADA40271` FOREIGN KEY (`link_id`) REFERENCES `shorten_links` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shorten_visits`
--

LOCK TABLES `shorten_visits` WRITE;
/*!40000 ALTER TABLE `shorten_visits` DISABLE KEYS */;
INSERT INTO `shorten_visits` VALUES (1,4,'2013-02-26 04:31:38','127.0.0.1','XX'),(2,4,'2013-02-26 04:33:21','127.0.0.1','XX'),(3,5,'2013-02-26 07:38:05','127.0.0.1','XX'),(4,7,'2013-02-27 05:43:52','127.0.0.1','XX'),(5,8,'2013-02-27 05:44:12','127.0.0.1','XX'),(6,9,'2013-02-27 06:24:58','127.0.0.1','XX');
/*!40000 ALTER TABLE `shorten_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_shortener_links`
--

DROP TABLE IF EXISTS `url_shortener_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_shortener_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `identifier` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5DF98C6A81CFDAE7` (`url_id`),
  KEY `identifier_index` (`identifier`(255)),
  CONSTRAINT `FK_5DF98C6A81CFDAE7` FOREIGN KEY (`url_id`) REFERENCES `url_shortener_urls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_shortener_links`
--

LOCK TABLES `url_shortener_links` WRITE;
/*!40000 ALTER TABLE `url_shortener_links` DISABLE KEYS */;
INSERT INTO `url_shortener_links` VALUES (1,1,1,'yahoo','2013-03-28 08:45:08'),(2,2,0,'2','2013-03-28 08:48:28'),(3,3,0,'3','2013-03-28 08:49:45');
/*!40000 ALTER TABLE `url_shortener_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_shortener_urls`
--

DROP TABLE IF EXISTS `url_shortener_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_shortener_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_82C5B6FF2F727085` (`original`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_shortener_urls`
--

LOCK TABLES `url_shortener_urls` WRITE;
/*!40000 ALTER TABLE `url_shortener_urls` DISABLE KEYS */;
INSERT INTO `url_shortener_urls` VALUES (3,'http://facebook.com'),(2,'http://google.com'),(1,'http://yahoo.fr');
/*!40000 ALTER TABLE `url_shortener_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_shortener_visits`
--

DROP TABLE IF EXISTS `url_shortener_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_shortener_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FACF52D7ADA40271` (`link_id`),
  CONSTRAINT `FK_FACF52D7ADA40271` FOREIGN KEY (`link_id`) REFERENCES `url_shortener_links` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_shortener_visits`
--

LOCK TABLES `url_shortener_visits` WRITE;
/*!40000 ALTER TABLE `url_shortener_visits` DISABLE KEYS */;
INSERT INTO `url_shortener_visits` VALUES (1,NULL,'2013-03-28 08:46:45','127.0.0.1','XX'),(2,NULL,'2013-03-28 08:48:33','127.0.0.1','XX');
/*!40000 ALTER TABLE `url_shortener_visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-28 10:12:05

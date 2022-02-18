-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (77,'Angola'),(95,'Anguilla'),(21,'Antarctica (the territory South of 60 deg S)'),(63,'Aruba'),(46,'Austria'),(20,'Azerbaijan'),(10,'Belgium'),(100,'Belize'),(37,'Benin'),(90,'Bhutan'),(32,'Bosnia and Herzegovina'),(53,'Bouvet Island (Bouvetoya)'),(97,'British Indian Ocean Territory (Chagos Archipelago)'),(49,'Burkina Faso'),(91,'Cambodia'),(83,'Cayman Islands'),(66,'Chile'),(2,'Cocos (Keeling) Islands'),(62,'Comoros'),(33,'Costa Rica'),(98,'Croatia'),(67,'Djibouti'),(50,'Equatorial Guinea'),(43,'Eritrea'),(76,'Estonia'),(4,'Ethiopia'),(39,'Falkland Islands (Malvinas)'),(41,'Fiji'),(42,'Finland'),(65,'French Guiana'),(51,'Ghana'),(16,'Greenland'),(7,'Guatemala'),(74,'Guernsey'),(34,'Guinea'),(29,'Guinea-Bissau'),(18,'Guyana'),(12,'Haiti'),(94,'Heard Island and McDonald Islands'),(13,'Hong Kong'),(30,'Hungary'),(36,'Israel'),(45,'Jamaica'),(58,'Japan'),(57,'Jersey'),(3,'Kiribati'),(26,'Korea'),(8,'Kuwait'),(27,'Kyrgyz Republic'),(85,'Latvia'),(25,'Lesotho'),(23,'Liberia'),(31,'Libyan Arab Jamahiriya'),(68,'Lithuania'),(44,'Madagascar'),(59,'Moldova'),(69,'Montenegro'),(72,'Myanmar'),(88,'Nauru'),(11,'Nepal'),(48,'Netherlands Antilles'),(86,'New Zealand'),(70,'Nicaragua'),(14,'Norfolk Island'),(82,'Norway'),(15,'Palestinian Territory'),(89,'Panama'),(60,'Philippines'),(9,'Pitcairn Islands'),(24,'Poland'),(61,'Portugal'),(55,'Puerto Rico'),(1,'Romania'),(64,'Russian Federation'),(5,'Saint Helena'),(81,'Saint Martin'),(92,'Saint Pierre and Miquelon'),(99,'Samoa'),(56,'Sao Tome and Principe'),(93,'Saudi Arabia'),(38,'Somalia'),(73,'South Africa'),(22,'Spain'),(52,'Sudan'),(17,'Swaziland'),(96,'Tanzania'),(19,'Thailand'),(75,'Timor-Leste'),(47,'Togo'),(54,'Trinidad and Tobago'),(6,'Turkmenistan'),(80,'Ukraine'),(40,'United Kingdom'),(79,'United States Minor Outlying Islands'),(71,'United States of America'),(87,'United States Virgin Islands'),(78,'Uzbekistan'),(84,'Venezuela'),(35,'Wallis and Futuna'),(28,'Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-22 12:39:58

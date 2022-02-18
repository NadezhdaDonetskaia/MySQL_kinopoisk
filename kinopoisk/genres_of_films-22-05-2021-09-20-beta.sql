-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_24
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
-- Table structure for table `genres_of_films`
--

DROP TABLE IF EXISTS `genres_of_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres_of_films` (
  `film_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_of_films`
--

LOCK TABLES `genres_of_films` WRITE;
/*!40000 ALTER TABLE `genres_of_films` DISABLE KEYS */;
INSERT INTO `genres_of_films` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,1),(16,2),(17,3),(18,4),(19,5),(20,6),(21,7),(22,8),(23,9),(24,10),(25,11),(26,12),(27,13),(28,14),(29,1),(30,2),(31,3),(32,4),(33,5),(34,6),(35,7),(36,8),(37,9),(38,10),(39,11),(40,12),(41,13),(42,14),(43,1),(44,2),(45,3),(46,4),(47,5),(48,6),(49,7),(50,8),(51,9),(52,10),(53,11),(54,12),(55,13),(56,14),(57,1),(58,2),(59,3),(60,4),(61,5),(62,6),(63,7),(64,8),(65,9),(66,10),(67,11),(68,12),(69,13),(70,14),(71,1),(72,2),(73,3),(74,4),(75,5),(76,6),(77,7),(78,8),(79,9),(80,10),(81,11),(82,12),(83,13),(84,14),(85,1),(86,2),(87,3),(88,4),(89,5),(90,6),(91,7),(92,8),(93,9),(94,10),(95,11),(96,12),(97,13),(98,14),(99,1),(100,2);
/*!40000 ALTER TABLE `genres_of_films` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-22  9:20:35

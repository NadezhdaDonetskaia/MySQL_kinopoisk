-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_21
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
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Romaine','Christiansen','2017-08-02',1),(2,'Ruthe','Sauer','1982-11-22',2),(3,'Daniella','Ortiz','1978-04-13',3),(4,'Frederique','Witting','1996-07-27',4),(5,'Vladimir','Heidenreich','2011-08-21',5),(6,'Kathlyn','Tromp','1975-01-31',6),(7,'Doyle','Beahan','1981-04-12',7),(8,'Jaida','Kutch','1988-04-10',8),(9,'Nola','Okuneva','2004-02-09',9),(10,'Maria','Hackett','1977-08-10',10),(11,'Rosie','White','1999-09-01',11),(12,'Vernice','Gottlieb','2019-07-02',12),(13,'Aliza','Quitzon','2001-11-10',13),(14,'Baby','Hagenes','2004-05-14',14),(15,'Roberto','Mitchell','2019-04-16',15),(16,'Kaycee','Haag','1984-03-13',16),(17,'Leann','Hoeger','1981-06-30',17),(18,'Eddie','Runolfsdottir','2020-04-27',18),(19,'Forrest','Ferry','2001-01-24',19),(20,'Jonatan','Nolan','2013-06-19',20),(21,'Yesenia','Friesen','1975-08-17',21),(22,'Juana','Schuster','2011-04-10',22),(23,'Bettie','Hilpert','2006-04-27',23),(24,'Mack','Lynch','2008-02-26',24),(25,'Jacynthe','Fahey','2007-05-23',25),(26,'Lisandro','Rempel','1996-12-13',26),(27,'Enoch','Legros','1981-10-08',27),(28,'Elyse','Johns','1979-07-19',28),(29,'Tia','Bernhard','2008-12-31',29),(30,'Anabel','Schmidt','2001-09-26',30),(31,'Elvera','Runolfsdottir','1976-12-20',31),(32,'D\'angelo','Reichert','2010-09-08',32),(33,'Joana','Wolf','1994-08-29',33),(34,'Avis','Durgan','2012-10-23',34),(35,'Marianna','Hansen','2008-10-31',35),(36,'Creola','Beahan','1982-02-17',36),(37,'Rachelle','Koch','1989-02-03',37),(38,'Newton','Brakus','1979-11-12',38),(39,'Elliott','Hand','1992-10-01',39),(40,'Lessie','Reichert','2017-10-24',40),(41,'Mackenzie','Walker','2011-08-02',41),(42,'Cydney','Adams','2011-08-22',42),(43,'Jerome','Stiedemann','1974-02-02',43),(44,'Monserrate','Anderson','2014-07-15',44),(45,'Mae','Lowe','2004-12-25',45),(46,'Paige','Fritsch','1981-02-19',46),(47,'Cade','Lang','1979-09-06',47),(48,'Kiera','Conn','1979-04-09',48),(49,'Lysanne','Effertz','1979-10-17',49),(50,'Anissa','Jerde','2001-04-09',50),(51,'Devan','Schuster','1989-04-28',51),(52,'Johnathan','O\'Keefe','2008-12-29',52),(53,'Rebecca','Bayer','1990-06-19',53),(54,'Adella','DuBuque','2002-12-19',54),(55,'Carole','Runolfsdottir','1995-08-14',55),(56,'Derrick','Conroy','1992-11-29',56),(57,'Augusta','Kuhlman','1974-12-08',57),(58,'Ashton','Koelpin','1988-01-17',58),(59,'Beaulah','Kshlerin','1991-04-29',59),(60,'Chelsey','Howe','2002-06-14',60),(61,'Imogene','Streich','2000-01-07',61),(62,'Arch','Koelpin','2019-06-11',62),(63,'Bert','Wisoky','2007-06-30',63),(64,'Major','Raynor','1988-09-11',64),(65,'Daniela','D\'Amore','1986-11-17',65),(66,'Meagan','Hodkiewicz','2004-12-04',66),(67,'Rosemary','Kautzer','2015-11-13',67),(68,'Marguerite','Mosciski','1978-12-20',68),(69,'Daniella','O\'Keefe','1973-05-08',69),(70,'Odessa','Klein','1989-04-09',70),(71,'Gaylord','Altenwerth','1996-04-05',71),(72,'Dayne','Carter','2021-04-13',72),(73,'Fatima','Walsh','2002-09-10',73),(74,'Fae','Douglas','1973-07-01',74),(75,'Keira','Hayes','2001-09-22',75),(76,'Camryn','Hodkiewicz','2003-06-27',76),(77,'Emmalee','Weimann','2005-06-20',77),(78,'Monica','Rogahn','2000-04-22',78),(79,'Ashlynn','Ullrich','2009-05-06',79),(80,'Vena','Oberbrunner','1993-08-09',80),(81,'Josefa','Nitzsche','1983-04-22',81),(82,'Adolphus','Kunde','1983-12-23',82),(83,'Jamel','Kuhn','1976-05-05',83),(84,'Geraldine','Auer','1996-05-01',84),(85,'Rowena','Carroll','1998-11-24',85),(86,'Javon','Jones','2001-01-21',86),(87,'Krystal','Walsh','1971-10-18',87),(88,'Lucile','Muller','1991-05-18',88),(89,'Adele','Hoeger','1989-03-15',89),(90,'Viva','Konopelski','2019-07-30',90),(91,'Trever','Nolan','1982-12-06',91),(92,'Jeremie','Homenick','2008-12-10',92),(93,'Lonzo','Cronin','1983-07-06',93),(94,'Carleton','Herzog','1973-07-09',94),(95,'Blaise','Murazik','2013-02-05',95),(96,'Audra','Von','1997-11-19',96),(97,'Gerda','Koelpin','1990-03-11',97),(98,'Noemie','Raynor','1988-07-24',98),(99,'Vaughn','Conn','1994-08-11',99),(100,'Tobin','Oberbrunner','2015-11-03',100);
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 13:01:18

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Amie','Cummings','1986-09-29',1),(2,'Wilfred','Casper','2020-08-11',2),(3,'Shawn','O\'Connell','2012-10-28',3),(4,'Lillie','Rogahn','1999-03-01',4),(5,'Charlotte','Hermann','2003-11-11',5),(6,'Filiberto','Daugherty','1976-04-15',6),(7,'Brant','Jones','1989-09-06',7),(8,'Jordyn','Kunze','1995-01-31',8),(9,'Brandy','Stehr','2003-07-01',9),(10,'Trevor','Yost','2006-05-25',10),(11,'Reyna','Nitzsche','1998-09-02',11),(12,'Shanna','Turcotte','2012-05-15',12),(13,'Meta','King','1998-06-29',13),(14,'Vaughn','Klocko','1996-04-17',14),(15,'Alexandrine','Murray','1990-01-09',15),(16,'Velva','Hansen','2004-05-02',16),(17,'Nya','Reichel','1982-03-17',17),(18,'Colby','Abernathy','1970-11-06',18),(19,'Kristin','Carroll','1974-11-24',19),(20,'Hazel','Buckridge','1994-07-26',20),(21,'Dock','Heidenreich','2009-04-23',21),(22,'Vidal','Klocko','2012-10-11',22),(23,'Brant','Hansen','1989-02-03',23),(24,'Clarissa','Howe','2018-12-15',24),(25,'Kassandra','Lubowitz','2007-05-20',25),(26,'Marge','Stroman','1970-08-20',26),(27,'Gregoria','Denesik','2013-11-04',27),(28,'Erna','Ruecker','2004-10-17',28),(29,'Emmanuel','Volkman','1981-01-03',29),(30,'Joan','Monahan','2020-07-24',30),(31,'Gilberto','Rutherford','1989-02-22',31),(32,'Yessenia','Boyer','1988-03-18',32),(33,'Rosamond','Pfannerstill','1984-07-17',33),(34,'Morgan','Smith','2017-08-09',34),(35,'Cedrick','Weimann','2015-02-26',35),(36,'Domenick','Smitham','1994-07-26',36),(37,'Emmitt','Wolf','2018-09-18',37),(38,'Candace','Casper','1977-11-07',38),(39,'Claudie','Goldner','2005-03-25',39),(40,'Susie','Bernhard','1974-01-14',40),(41,'Greta','Gibson','1979-04-03',41),(42,'Rowan','Mohr','1979-12-23',42),(43,'Adolph','Hintz','2018-10-03',43),(44,'Emmanuel','Haag','1989-07-06',44),(45,'Jovanny','Wolf','1997-11-15',45),(46,'Jennings','White','2015-12-11',46),(47,'Ezra','Vandervort','1972-06-28',47),(48,'Alize','Johnson','1974-03-29',48),(49,'Jaunita','Schmitt','2019-06-26',49),(50,'Muhammad','Miller','1995-11-02',50),(51,'Desmond','Terry','2010-04-30',51),(52,'Orion','Boyer','2009-03-17',52),(53,'Wayne','Schinner','1991-03-23',53),(54,'Marianne','Frami','1997-08-05',54),(55,'Kaleb','Lehner','2016-10-24',55),(56,'Anya','Robel','1999-06-01',56),(57,'Christy','Bruen','1976-03-31',57),(58,'Laurence','Koepp','1993-06-11',58),(59,'Justen','Vandervort','1984-02-01',59),(60,'Abigale','Ferry','2013-10-31',60),(61,'Bernhard','Hodkiewicz','2001-05-07',61),(62,'Emile','Schaefer','2004-10-08',62),(63,'Margaret','Jacobs','1980-12-14',63),(64,'Russ','Streich','1999-11-01',64),(65,'Arielle','Waters','2001-03-12',65),(66,'Claudie','Ratke','1991-02-09',66),(67,'Bryce','Altenwerth','2017-07-05',67),(68,'Carley','Zemlak','1978-08-01',68),(69,'Neoma','Turcotte','1997-04-27',69),(70,'Jaleel','Morissette','2004-12-30',70),(71,'Claudia','Marks','1987-12-31',71),(72,'Alexandre','Barrows','2006-03-10',72),(73,'Mckenzie','Runte','1974-07-12',73),(74,'Gladyce','Goodwin','1970-09-13',74),(75,'Marty','Purdy','1979-04-20',75),(76,'Jennyfer','Stracke','1992-05-22',76),(77,'Cordia','Shanahan','1991-03-11',77),(78,'Gunnar','Mohr','2017-10-09',78),(79,'Luisa','Ondricka','1981-10-19',79),(80,'Clarabelle','Hammes','1985-04-03',80),(81,'Pietro','Harvey','2008-05-16',81),(82,'Chester','Halvorson','1977-07-20',82),(83,'Rocio','Rowe','2019-10-07',83),(84,'Amani','Pacocha','2011-08-29',84),(85,'Bert','Beer','1995-07-24',85),(86,'Diana','Block','1971-11-08',86),(87,'Enrique','Grant','2011-07-24',87),(88,'Dejah','Cummerata','1988-06-24',88),(89,'Cedrick','Roberts','1992-12-25',89),(90,'Noe','Prohaska','1992-01-03',90),(91,'Marisol','Schneider','1991-12-12',91),(92,'Santino','Stamm','2002-11-17',92),(93,'Eleonore','Adams','1978-12-17',93),(94,'Joan','Balistreri','2009-05-13',94),(95,'Anjali','Feeney','1998-11-29',95),(96,'Maida','Hoeger','2008-04-03',96),(97,'Damien','Maggio','1999-04-09',97),(98,'Lysanne','Cormier','2002-09-24',98),(99,'Marianne','Haag','1994-09-08',99),(100,'Katelin','Bernhard','1995-02-12',100);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 13:00:49

-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: friendsdb
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(225) DEFAULT NULL,
  `friend_id` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,'1','6','2016-04-09 00:00:00','2016-04-09 00:00:00'),(2,'2','1','2016-04-09 00:00:00','2016-04-09 00:00:00'),(3,'2','3','2016-04-09 00:00:00','2016-04-09 00:00:00'),(4,'2','6','2016-04-09 00:00:00','2016-04-09 00:00:00'),(5,'3','1','2016-04-09 00:00:00','2016-04-09 00:00:00'),(6,'9','1','2016-04-09 00:00:00','2016-04-09 00:00:00'),(7,'9','2','2016-04-09 00:00:00','2016-04-09 00:00:00'),(8,'9','3','2016-04-09 00:00:00','2016-04-09 00:00:00'),(9,'9','6','2016-04-09 18:35:01','2016-04-09 18:35:01');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `alias` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `pw_hash` varchar(225) DEFAULT NULL,
  `date_of_birth` varchar(225) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mickey Mouse','Mickey','mickey@mouse.com','$2a$12$5LYJ6MU.g9FE0znhnwu2JOx4fe.nLnFJqb9NGB7fhSLJSqIz./OgO','2015-10-01','2015-10-03 17:41:36','2015-10-03 17:41:36'),(2,'Bruce Lee','Bruce','bruce@lee.com','$2a$12$nmmbOZzf3qp5U69StsHAxunA.01Tf8TqFbGxILojp.FfBCSGQF5bW','2015-10-10','2015-10-03 17:41:57','2015-10-03 17:41:57'),(3,'Russell Wilson','Russ','russ@wilson.com','$2a$12$h3LxKk8UguZOpE57ktqq4uY5XEne0eZf2..TaCrJ7PNObwGQ/41Ii','1967-10-03','2015-10-07 07:50:23','2015-10-07 07:50:23'),(4,'Jay Cutler','JayCut','cutty@cut.com','$2a$12$29xB1UlEiYaVeI2.iXY5veHlzUitg7xpX6USlWf3TKMtoSFAkQWBq','1970-01-09','2015-10-07 07:51:21','2015-10-07 07:51:21'),(5,'Jason Hayward','Jason','jason@hayward.com','$2a$12$iwzO/x1oAUoYBSa5BJG5ReA29y.XSuUI9ycP1kx.lQ3h29RK9s5NC','1988-03-05','2015-10-07 07:52:13','2015-10-07 07:52:13'),(6,'Andy Luck','Lucky','andy@lucky.com','$2a$12$9m.u4kFiG0v/uGmVQIjiQuJCAxnTXGKQtdcanVY3xcaOAafE3b7Uq','1990-10-12','2015-10-07 07:53:03','2015-10-07 07:53:03'),(7,'Ricky Martin','Ricky','ricky@martin.com','$2a$12$Xa.YgKyYIRogw225rHhX5uw34T/3YLFejSkBTGj6nB8xPg9ae4acG','2015-10-06','2015-10-07 08:09:35','2015-10-07 08:09:35'),(8,'Minny Mouse','Minny','minny@mouse.com','$2a$12$RzY5aMlPrWVSvd1Z1A9oIuUiuljDmEh4PCRW2y1O1sT5vTbx2tnb2','1960-01-04','2015-10-07 08:14:53','2015-10-07 08:14:53'),(9,'Geno Guerrero','gnoevil','geno.guerrero@gmail.com','$2b$12$viwdXG6t1FT9du0CA/IxE.6uaavTs2e8P2Ox64RtBT4UMn0v6W1i6','1973-03-28','2016-04-09 17:10:45','2016-04-09 17:10:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-09 20:05:13

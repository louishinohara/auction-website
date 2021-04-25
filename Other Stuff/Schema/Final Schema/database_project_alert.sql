-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: database_project
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alertID` int NOT NULL,
  `accountID` int DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `itemID` int DEFAULT NULL,
  PRIMARY KEY (`alertID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (1,2,'You have been outbid for item 1','18:30:54 PM','2021-04-23',1),(2,5,'You have been outbid for item 1','22:18:40 PM','2021-04-23',1),(3,2,'You have been outbid for item 1','22:37:14 PM','2021-04-23',1),(4,2,'You have been outbid for item 1','22:37:32 PM','2021-04-23',1),(5,5,'You have been outbid for item 1','22:37:58 PM','2021-04-23',1),(6,5,'You have been outbid for item 2','22:38:55 PM','2021-04-23',2),(7,2,'You have been outbid for item 2','22:39:33 PM','2021-04-23',2),(8,4,'You have been outbid for item 20','00:39:01 AM','2021-04-24',20),(9,2,'You have been outbid for item 20','00:39:31 AM','2021-04-24',20),(10,4,'You have been outbid for item 20','00:43:43 AM','2021-04-24',20),(11,4,'You have been outbid for item 20','00:44:10 AM','2021-04-24',20),(12,2,'You have been outbid for item 20','00:47:35 AM','2021-04-24',20),(13,4,'You have been outbid for item 20','00:48:10 AM','2021-04-24',20),(14,2,'You have been outbid for item 20','00:52:24 AM','2021-04-24',20),(15,4,'You have been outbid for item 20','00:53:19 AM','2021-04-24',20),(16,2,'You have been outbid for item 20','00:54:16 AM','2021-04-24',20),(17,2,'You have been outbid for item 1','01:14:16 AM','2021-04-24',1),(18,7,'Reserve price was not been met for 1. Item not purchased.','01:23:43 AM','2021-04-24',1),(19,1,'Reserve price was not been met for 1. Item not sold.','01:23:43 AM','2021-04-24',1),(20,5,'Congrats. You have won item 2','01:23:43 AM','2021-04-24',2),(21,4,'Congrats. You have won item 20','01:23:43 AM','2021-04-24',20);
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 20:48:44

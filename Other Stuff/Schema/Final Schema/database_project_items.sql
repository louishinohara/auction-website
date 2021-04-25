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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_type` varchar(10) DEFAULT NULL,
  `model` varchar(40) DEFAULT NULL,
  `item_id` int NOT NULL,
  `item_year` int DEFAULT NULL,
  `color` varchar(12) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `mpg` varchar(30) DEFAULT NULL,
  `miles` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('car','Toyota Camry',1,2020,'Blue','null','New Jersey','Automatic','48','100'),('bike','Harley-Davidson',2,1999,'Black','https://i.imgur.com/OdXtzRN.jpg','California','Manual','30','300'),('car','Honda Civic',3,2021,'White','https://i.imgur.com/K0vYT4p.jpg','Wisconsin','Manual','29','4000'),('car','Corvette',4,2005,'Red','https://i.imgur.com/KPc1Vaq.jpg','New York','Automatic','10','1000'),('car','Honda-Civic',5,2017,'Black','https://i.imgur.com/JsgfJna.jpg','Texas','Automatic','40','3000'),('car','Camaro',6,2019,'Blue','https://i.imgur.com/uN62tGS.jpg','Michigan','Manual','20','1000'),('car','Corvette',7,2018,'Red','https://i.imgur.com/SamrPXI.jpg','Wisconsin','Manual','25','6000'),('car','Mustang',8,2008,'Red','https://i.imgur.com/Lmo56PI.jpg','Maryland','Manual','28','8000'),('car','Volks-Wagon',9,2014,'Blue','https://i.imgur.com/FHf498Y.jpg','Oklahoma','Automatic','38','3000'),('car','Jeep',10,2021,'Grey','https://i.imgur.com/g8HyTuc.jpg','Arkansas','Automatic','18','2000'),('truck','Volvo',11,2020,'Lime','https://i.imgur.com/EvgH2C5.jpg','Pennsylvania','Automatic','12','4000'),('truck','Ford',12,2010,'Black','https://i.imgur.com/HbPAuHn.jpg','New York','Automatic','22','7000'),('truck','Ford',13,2019,'Black','https://i.imgur.com/ceVykws.jpg','New Jersey','Automatic','14','9000'),('truck','GMC',14,2001,'Red','https://i.imgur.com/6wHvm6N.jpg','Delaware','Automatic','19','4000'),('truck','GMC',15,2001,'Yellow','null','Kansas','Automatic','29','40000'),('bike','Yamaha',16,2011,'Purple','null','New Jersey','Manual','19','4000'),('bike','Yamaha',17,2012,'Blue','https://i.imgur.com/HiV3RQr.jpg','New York','Manual','29','500'),('bike','Honda',18,2012,'Black','https://i.imgur.com/UVqFcWB.jpg','New York','Manual','39','100'),('bike','Yamaha',19,2007,'Blue','https://i.imgur.com/1jFelzW.png','Kentucky','Manual','9','200'),('bike','Super Yamaha',20,1996,'Rainbow','null','New Jersey','Manual','10','999');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 20:48:43

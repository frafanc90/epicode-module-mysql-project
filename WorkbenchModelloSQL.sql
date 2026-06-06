CREATE DATABASE  IF NOT EXISTS `workbench_epicode_mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `workbench_epicode_mysql`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: workbench_epicode_mysql
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'The Lost Kingdom','RPG'),(2,'Shadow Protocol','Sparatutto'),(3,'Turbo Racers 2025','Racing'),(4,'Dungeon Master X','RPG'),(5,'Football Champions','Sport'),(6,'Zombie Outbreak','Survival Horror'),(7,'Space Invaders Neo','Sparatutto'),(8,'Mystery Island','Avventura'),(9,'Street Fighter Legacy','Picchiaduro'),(10,'NBA Legends 2025','Sport'),(11,'Minecraft Worlds Pro','Sandbox'),(12,'Dragon Quest XII','RPG'),(13,'Neon Drift','Racing'),(14,'Sniper Elite 6','Sparatutto'),(15,'SimCity Ultra','Simulazione'),(16,'Age of Empires VI','Strategia'),(17,'Cyberpunk Arena','Azione'),(18,'Puzzle Master 3D','Puzzle'),(19,'FIFA 2026','Sport'),(20,'Resident Evil 9','Survival Horror');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `RegionID` int NOT NULL AUTO_INCREMENT,
  `StateName` varchar(50) DEFAULT NULL,
  `RegionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Lombardia','Nord-Ovest'),(2,'Piemonte','Nord-Ovest'),(3,'Liguria','Nord-Ovest'),(4,'Valle d\'Aosta','Nord-Ovest'),(5,'Veneto','Nord-Est'),(6,'Trentino-Alto Adige','Nord-Est'),(7,'Friuli-Venezia Giulia','Nord-Est'),(8,'Emilia-Romagna','Nord-Est'),(9,'Toscana','Centro'),(10,'Umbria','Centro'),(11,'Marche','Centro'),(12,'Lazio','Centro'),(13,'Campania','Sud'),(14,'Puglia','Sud'),(15,'Basilicata','Sud'),(16,'Calabria','Sud'),(17,'Sicilia','Isole'),(18,'Sardegna','Isole'),(19,'Abruzzo','Sud'),(20,'Molise','Sud');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SalesID` int NOT NULL AUTO_INCREMENT,
  `RegionID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `DateSale` date DEFAULT NULL,
  `UnitePrice` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`SalesID`),
  KEY `ProductID` (`ProductID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `region` (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,1,'2024-01-08',59.99),(2,2,5,'2024-01-15',49.99),(3,3,12,'2024-01-22',69.99),(4,4,3,'2024-02-03',39.99),(5,5,19,'2024-02-10',59.99),(6,6,7,'2024-02-18',29.99),(7,7,16,'2024-03-01',49.99),(8,8,20,'2024-03-09',69.99),(9,9,2,'2024-03-17',54.99),(10,10,11,'2024-04-04',34.99),(11,11,6,'2024-04-12',44.99),(12,12,15,'2024-04-25',39.99),(13,13,9,'2024-05-06',29.99),(14,14,17,'2024-05-14',59.99),(15,15,4,'2024-05-20',49.99),(16,16,13,'2024-06-03',39.99),(17,17,8,'2024-06-11',34.99),(18,18,18,'2024-06-24',19.99),(19,19,10,'2024-07-02',54.99),(20,20,14,'2024-07-16',44.99);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_geografia`
--

DROP TABLE IF EXISTS `vw_geografia`;
/*!50001 DROP VIEW IF EXISTS `vw_geografia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_geografia` AS SELECT 
 1 AS `CodiceRegione`,
 1 AS `NomeStato`,
 1 AS `NomeRegione`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_prodotti`
--

DROP TABLE IF EXISTS `vw_prodotti`;
/*!50001 DROP VIEW IF EXISTS `vw_prodotti`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_prodotti` AS SELECT 
 1 AS `CodiceProdotto`,
 1 AS `NomeProdotto`,
 1 AS `NomeCategoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'workbench_epicode_mysql'
--

--
-- Final view structure for view `vw_geografia`
--

/*!50001 DROP VIEW IF EXISTS `vw_geografia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_geografia` AS select `r`.`RegionID` AS `CodiceRegione`,`r`.`StateName` AS `NomeStato`,`r`.`RegionName` AS `NomeRegione` from `region` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_prodotti`
--

/*!50001 DROP VIEW IF EXISTS `vw_prodotti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prodotti` AS select `p`.`ProductID` AS `CodiceProdotto`,`p`.`ProductName` AS `NomeProdotto`,`p`.`CategoryName` AS `NomeCategoria` from `product` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-06 21:32:48

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: consultorio_medico_ospina
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `dll_medico_procedimiento`
--

DROP TABLE IF EXISTS `dll_medico_procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dll_medico_procedimiento` (
  `id_medico_procedimiento` varchar(20) NOT NULL,
  `id_procedimiento_procedimiento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medico_procedimiento`,`id_procedimiento_procedimiento`),
  KEY `id_procedimiento_procedimiento` (`id_procedimiento_procedimiento`),
  CONSTRAINT `dll_medico_procedimiento_ibfk_1` FOREIGN KEY (`id_medico_procedimiento`) REFERENCES `tb_medico` (`id_medico`),
  CONSTRAINT `dll_medico_procedimiento_ibfk_2` FOREIGN KEY (`id_procedimiento_procedimiento`) REFERENCES `tb_procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dll_medico_procedimiento`
--

LOCK TABLES `dll_medico_procedimiento` WRITE;
/*!40000 ALTER TABLE `dll_medico_procedimiento` DISABLE KEYS */;
INSERT INTO `dll_medico_procedimiento` VALUES ('100A','300A'),('100B','300B'),('100C','300C'),('100D','300D'),('100E','300E');
/*!40000 ALTER TABLE `dll_medico_procedimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 22:07:12

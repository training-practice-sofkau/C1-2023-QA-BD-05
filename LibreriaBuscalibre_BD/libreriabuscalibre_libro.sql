-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: libreriabuscalibre
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
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ISBN` varchar(10) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `numero_paginas` varchar(45) DEFAULT NULL,
  `nombre_editorial` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `nombre_editorial_idx` (`nombre_editorial`),
  CONSTRAINT `nombre_editorial` FOREIGN KEY (`nombre_editorial`) REFERENCES `editorial` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('A000016','Tiempo de migrar al norte','78','Alba'),('A000120','Al faro','665','Acantilado'),('A00017','El rey Lear','66','Acantilado'),('A00018','Rojo y negro','777','Aguilar'),('A00019','Memorias de Adriano','66','Alba'),('A001','Viaje al fin de la noche','77','Acantilado'),('A0010','El proceso','44','Alba'),('A0011','Hijos y amantes','56','Aguilar'),('A0012','Pippi Calzaslargas','76','Aguilar'),('A00120','Al faro','665','Acantilado'),('A0013','Beloved','55','Almadia'),('A0014','Lolita','44','Acantilado'),('A0015','Bostan','45','Alba'),('A0016','Tiempo de migrar al norte','78','Alba'),('A0017','El rey Lear','66','Acantilado'),('A0018','Rojo y negro','777','Aguilar'),('A0019','Memorias de Adriano','66','Alba'),('A002','Don Quijote de la Mancha','500','Acantilado'),('A003','Los cuentos de Canterbury','444','Aguilar'),('A004','Fausto','666','Alba'),('A005','Medea','400','Alfaguara'),('A006','Cien años de soledad','555','Alianza'),('A007','El viejo y el mar','556','Alianza'),('A008','Odisea','50','Alkal'),('A009','Ulises','200','Alfaguara');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 22:08:55

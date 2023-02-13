-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: libreriabuscalibre
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` varchar(10) NOT NULL,
  `fecha de nacimiento` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(20) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES ('1001','01/01/90','Colombiano','Juan Garcia'),('1002','12/06/95','Mexicano','Pedro Mancha'),('1003','13/10/86','Venezolano','Jhon Cena'),('1004','06/05/70','Colombiano','Mario Bross'),('1005','25/01/78','Peruano','Pablo Escobar');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1115069123','Juan Valdez'),('1115069258','Jessie Pinkman'),('1115069369','Walter White'),('1115069456','Ash Ketshup'),('1115069741','Naruto Uzumaki'),('1115069789','Gon Freecs'),('1115069852','Jorge El Curioso');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!50001 DROP VIEW IF EXISTS `compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compras` AS SELECT 
 1 AS `cedula`,
 1 AS `nombre`,
 1 AS `libro`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL DEFAULT '6013909541',
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES ('Editorial1','Buga','Calle 11 #60-27 segundo piso','2213300'),('Editorial2','Cali','Calle 20 #50-30','2236699'),('Editorial3','Medellin','Calle 45 #50-30 primer piso','2315060'),('Editorial4','Bogota','Calle 50 #30-30','2315060');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `infolibro`
--

DROP TABLE IF EXISTS `infolibro`;
/*!50001 DROP VIEW IF EXISTS `infolibro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infolibro` AS SELECT 
 1 AS `libro`,
 1 AS `paginas`,
 1 AS `editorial`,
 1 AS `telefono`,
 1 AS `autor`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `libro` VALUES ('ABC123','El amanecer','100','Editorial4'),('ABC124','Programacion','560','Editorial2'),('ABC125','Cocina','60','Editorial1'),('ABC126','El anochecer','56','Editorial2'),('ABC127','La puerta','50','Editorial3'),('ABC128','Pokemon','60','Editorial4'),('ABC129','Zelda','3600','Editorial1'),('ABC130','Aprenda ingles','1000','Editorial3'),('ABC131','Aprenda frances','1200','Editorial1'),('ABC132','Aprenda programar','80','Editorial4'),('ABC133','Matematica financiera','54','Editorial2'),('ABC134','Calculo diferencial','453','Editorial1'),('ABC135','Calculo vectorial','415','Editorial3'),('ABC136','Fisica','57','Editorial1'),('ABC137','Leyes de newton','756','Editorial4'),('ABC138','La biblia','745','Editorial4'),('ABC139','El senior de los anillos','57','Editorial1'),('ABC140','The last of us','213','Editorial1'),('ABC141','Batman','214','Editorial3'),('ABC142','La caida de Edgar','456','Editorial2');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_autor` (
  `ISBN_libro` varchar(10) NOT NULL,
  `id_autor` varchar(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`,`id_autor`),
  KEY `id_autor_idx` (`id_autor`),
  CONSTRAINT `id_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`),
  CONSTRAINT `ISBN_libro` FOREIGN KEY (`ISBN_libro`) REFERENCES `libro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES ('ABC123','1001'),('ABC132','1001'),('ABC140','1001'),('ABC141','1001'),('ABC124','1002'),('ABC126','1002'),('ABC125','1003'),('ABC127','1004'),('ABC129','1005'),('ABC131','1005');
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_cliente`
--

DROP TABLE IF EXISTS `libro_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro_cliente` (
  `ISBN_libro_cliente` varchar(10) NOT NULL,
  `id_cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro_cliente`,`id_cliente`),
  KEY `id_cliente_idx` (`id_cliente`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `ISBN_libro_cliente` FOREIGN KEY (`ISBN_libro_cliente`) REFERENCES `libro` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_cliente`
--

LOCK TABLES `libro_cliente` WRITE;
/*!40000 ALTER TABLE `libro_cliente` DISABLE KEYS */;
INSERT INTO `libro_cliente` VALUES ('ABC123','1115069123'),('ABC124','1115069123'),('ABC125','1115069123'),('ABC131','1115069258'),('ABC130','1115069369'),('ABC126','1115069456'),('ABC127','1115069456'),('ABC129','1115069741'),('ABC128','1115069789'),('ABC132','1115069852');
/*!40000 ALTER TABLE `libro_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_cliente`
--

DROP TABLE IF EXISTS `telefono_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_cliente` (
  `cedula_cliente` varchar(10) NOT NULL,
  `numero` varchar(15) NOT NULL,
  PRIMARY KEY (`cedula_cliente`,`numero`),
  CONSTRAINT `cedula_cliente` FOREIGN KEY (`cedula_cliente`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_cliente`
--

LOCK TABLES `telefono_cliente` WRITE;
/*!40000 ALTER TABLE `telefono_cliente` DISABLE KEYS */;
INSERT INTO `telefono_cliente` VALUES ('1115069123','3135643211'),('1115069123','3135643231'),('1115069123','3135643232'),('1115069258','3135643239'),('1115069369','3135643238'),('1115069456','3135643233'),('1115069456','3135643234'),('1115069456','3135643235'),('1115069741','3135643237'),('1115069789','3135643236'),('1115069852','3135643210'),('1115069852','3135643212');
/*!40000 ALTER TABLE `telefono_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `compras`
--

/*!50001 DROP VIEW IF EXISTS `compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compras` AS select `cliente`.`cedula` AS `cedula`,`cliente`.`nombre` AS `nombre`,`libro`.`titulo` AS `libro`,`telefono_cliente`.`numero` AS `telefono` from (((`libro` join `libro_cliente` on((`libro`.`ISBN` = `libro_cliente`.`ISBN_libro_cliente`))) join `cliente` on((`cliente`.`cedula` = `libro_cliente`.`id_cliente`))) join `telefono_cliente` on((`telefono_cliente`.`cedula_cliente` = `cliente`.`cedula`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infolibro`
--

/*!50001 DROP VIEW IF EXISTS `infolibro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infolibro` AS select `libro`.`titulo` AS `libro`,`libro`.`numero_paginas` AS `paginas`,`libro`.`nombre_editorial` AS `editorial`,`editorial`.`Telefono` AS `telefono`,`autor`.`nombre` AS `autor` from (((`editorial` join `libro` on((`editorial`.`nombre` = `libro`.`nombre_editorial`))) join `libro_autor` on((`libro_autor`.`ISBN_libro` = `libro`.`ISBN`))) join `autor` on((`autor`.`id` = `libro_autor`.`id_autor`))) */;
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

-- Dump completed on 2023-02-13 14:55:07

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: libreriabuscalibre
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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` varchar(10) NOT NULL,
  `fechadenacimiento` varchar(45) DEFAULT NULL,
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
INSERT INTO `autor` VALUES ('101','01/04/1837','Colombiano','Jorge isaacs'),('123','29/09/1547','Español','Miguel de cervantes Saavedra'),('213','1833-07-11','Colombiano','Rafael pombo'),('456','06/03/1927','Colombiano','Gabriel garcia marquez'),('789','05/06/1898','Español','Federico garcia lorca');
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
INSERT INTO `cliente` VALUES ('106754','Eibrajam charry'),('106987','Loren sarmiento'),('108389','Rodrigo vasquez'),('1098634','Isabel perez'),('187657','Maria zuñiga'),('5154788','Camila peña'),('5467898','Tomas santa');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `editorial` VALUES ('Altea','Bogota','Cr 11 98-50','310675893'),('Edicion Gamma','Bogota','calle 85 18-32','3185642311'),('Luna libros','Bogota','calle 97 16-50','3155126886'),('Tragaluz Editores','Medellin','calle 9 43c-50','3214568950');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `libro` VALUES ('ABC-120','Maria','231','Edicion Gamma'),('ABC-121','Novela americana','306','Edicion Gamma'),('ABC-122','Don quijote de la mancha','462','Altea'),('ABC-123','Novelas ejemplares','312','Altea'),('ABC-124','El renacuajo paseador','38','Luna libros'),('ABC-125','Mirringa Mirronga','40','Luna libros'),('ABC-126','Cronica de una muerte anunciada','128','Tragaluz Editores'),('ABC-127','Cien años de soledad','512','Tragaluz Editores'),('ABC-128','Romancero gitano','240','Altea'),('ABC-129','Poeta en nueva york','264','Altea'),('ABC-130','El ingenioso hidalgo','462','Edicion Gamma'),('ABC-131','La gitanilla','104','Edicion Gamma'),('ABC-132','La tierra de cordoba','17','Luna libros'),('ABC-133','Mayo','20','Luna libros'),('ABC-134','Coronel no tiene quien le escriba','110','Tragaluz Editores'),('ABC-135','Del amor y otros demonios','168','Tragaluz Editores'),('ABC-136','Gato bandido','60','Altea'),('ABC-137','La pobre viejecita','36','Altea'),('ABC-138','Poema del cante jondo','154','Edicion Gamma'),('ABC-139','sonetos del amor oscuro','59','Edicion Gamma');
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
INSERT INTO `libro_autor` VALUES ('ABC-120','101'),('ABC-133','101'),('ABC-122','123'),('ABC-130','123'),('ABC-124','213'),('ABC-136','213'),('ABC-127','456'),('ABC-135','456'),('ABC-129','789'),('ABC-138','789');
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
INSERT INTO `libro_cliente` VALUES ('ABC-136','106987'),('ABC-138','106987'),('ABC-135','1098634'),('ABC-130','187657'),('ABC-133','187657'),('ABC-124','5154788'),('ABC-127','5154788'),('ABC-129','5154788'),('ABC-120','5467898'),('ABC-122','5467898');
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
INSERT INTO `telefono_cliente` VALUES ('106754','3103256545'),('106754','3206783456'),('106987','3006783411'),('106987','3045672356'),('108389','3021114567'),('108389','3115409800'),('1098634','311234567'),('1098634','320876234'),('187657','315678435'),('187657','325678790'),('5154788','31245323'),('5467898','318675120');
/*!40000 ALTER TABLE `telefono_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-13 14:05:19

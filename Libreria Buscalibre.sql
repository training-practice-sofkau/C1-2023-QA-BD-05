CREATE DATABASE  IF NOT EXISTS `libreriabuscalibre` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libreriabuscalibre`;
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
INSERT INTO `autor` VALUES ('1','1928-03-06','Colombiana','Gabriel García Márquez'),('2','1947-03-31','Española','Ana María Matute'),('3','1902-07-03','Polaca','Joseph Conrad'),('4','1899-02-11','Estadounidense','F. Scott Fitzgerald'),('5','1927-11-29','Argentina','Julio Cortázar'),('6','1916-12-07','Estadounidense','Norman Mailer'),('7','1948-08-25','Peruana','Mario Vargas Llosa'),('8','1919-05-22','Mexicana','Carlos Fuentes');
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
INSERT INTO `cliente` VALUES ('0123456789','Nelson Garzon'),('1234567890','Andres Lopez'),('2345678901','Lina Rodriguez'),('3456789012','Edgar Andrade'),('4567890123','Maria Gonzalez'),('5678901234','Julian Casablanca'),('6789012345','Jhon Perez'),('7890123456','Lucia Ramirez'),('8901234567','Carlos Perdomo'),('9012345678','Julio Coronado');
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
INSERT INTO `editorial` VALUES ('Editorial Alfaguara','Madrid','Sede principal','5678912345'),('Editorial Alianza','Barcelona','Oficinas centrales','6789123456'),('Editorial Debolsillo','Mexico','Sede principal','7891234567'),('Editorial Lumen','Lima','Edificio central','8912345678'),('Editorial Sudamericana','Buenos Aires','Edificio Central','4567891234');
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
INSERT INTO `libro` VALUES ('111','Cien años de soledad','417','Editorial Alfaguara'),('112','Artificial Respiration','231','Editorial Alianza'),('113','The Heart of Darkness','160','Editorial Debolsillo'),('114','The Great Gatsby','180','Editorial Lumen'),('115','Final del Juego','200','Editorial Alfaguara'),('116','The Naked and the Dead','450','Editorial Alianza'),('117','La ciudad y los perros','250','Editorial Debolsillo'),('118','La tía Julia y el escribidor','320','Editorial Lumen'),('119','La muerte de Artemio Cruz','340','Editorial Alfaguara'),('120','El coronel no tiene quien le escriba','250','Editorial Alianza'),('121','Agua Viva','150','Editorial Debolsillo'),('122','This Side of Paradise','230','Editorial Lumen'),('123','Los relatos','300','Editorial Alfaguara'),('124','La Guerra del Fin del Mundo','400','Editorial Alianza'),('125','La casa verde','420','Editorial Debolsillo'),('126','Tender is the Night','450','Editorial Lumen'),('127','La fiesta del Chivo','320','Editorial Alfaguara'),('128','La vida es sueño','230','Editorial Alianza'),('129','Los premios','400','Editorial Debolsillo'),('130','The Beautiful and Damned','350','Editorial Lumen');
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
INSERT INTO `libro_autor` VALUES ('111','1'),('120','1'),('114','4'),('122','4'),('130','4'),('115','5'),('123','5'),('125','7'),('127','7'),('119','8');
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
INSERT INTO `libro_cliente` VALUES ('125','0123456789'),('115','1234567890'),('127','1234567890'),('115','2345678901'),('130','3456789012'),('118','4567890123'),('115','5678901234'),('124','5678901234'),('123','6789012345'),('123','9012345678');
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
INSERT INTO `telefono_cliente` VALUES ('0123456789','2345678901'),('0123456789','8889990000'),('1234567890','1234567890'),('1234567890','9990001111'),('2345678901','3456789012'),('2345678901','7778889999'),('3456789012','5556667777'),('3456789012','5678901234'),('4567890123','3334445555'),('4567890123','7890123456'),('5678901234','1112223333'),('5678901234','9012345678'),('6789012345','1235678901'),('6789012345','2344567890'),('7890123456','2223334444'),('7890123456','8901234567'),('8901234567','4445556666'),('8901234567','6789012345'),('9012345678','4567890123'),('9012345678','6667778888');
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

-- Dump completed on 2023-02-14 21:13:56

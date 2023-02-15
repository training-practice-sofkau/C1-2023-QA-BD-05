CREATE DATABASE  IF NOT EXISTS `procedimiento_medico` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `procedimiento_medico`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: procedimiento_medico
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
-- Table structure for table `contacto_enfermero`
--

DROP TABLE IF EXISTS `contacto_enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_enfermero` (
  `id_enfermero` varchar(15) NOT NULL,
  `telefono_enfermero` varchar(20) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  CONSTRAINT `idenfermero_contacto` FOREIGN KEY (`id_enfermero`) REFERENCES `enfermero` (`id_enfermero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_enfermero`
--

LOCK TABLES `contacto_enfermero` WRITE;
/*!40000 ALTER TABLE `contacto_enfermero` DISABLE KEYS */;
INSERT INTO `contacto_enfermero` VALUES ('E001','1111111'),('E002','2222222'),('E003','3333333'),('E004','4444444'),('E005','5555555');
/*!40000 ALTER TABLE `contacto_enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_medico`
--

DROP TABLE IF EXISTS `contacto_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_medico` (
  `id_medico` varchar(15) NOT NULL,
  `telefono_medico` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medico`),
  CONSTRAINT `idmedico_contacto` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_medico`
--

LOCK TABLES `contacto_medico` WRITE;
/*!40000 ALTER TABLE `contacto_medico` DISABLE KEYS */;
INSERT INTO `contacto_medico` VALUES ('M001','6666666'),('M002','7777777'),('M003','8888888'),('M004','9999999'),('M005','0000000');
/*!40000 ALTER TABLE `contacto_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_paciente`
--

DROP TABLE IF EXISTS `contacto_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_paciente` (
  `id_paciente` varchar(15) NOT NULL,
  `telefono_paciente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  CONSTRAINT `idpaciente_contacto` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_paciente`
--

LOCK TABLES `contacto_paciente` WRITE;
/*!40000 ALTER TABLE `contacto_paciente` DISABLE KEYS */;
INSERT INTO `contacto_paciente` VALUES ('P001','6789012345'),('P002','9012345678'),('P003','4567890123'),('P004','4445556666'),('P005','2345678901');
/*!40000 ALTER TABLE `contacto_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermero`
--

DROP TABLE IF EXISTS `enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermero` (
  `id_enfermero` varchar(15) NOT NULL,
  `nombre_enfermero` varchar(65) NOT NULL,
  PRIMARY KEY (`id_enfermero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermero`
--

LOCK TABLES `enfermero` WRITE;
/*!40000 ALTER TABLE `enfermero` DISABLE KEYS */;
INSERT INTO `enfermero` VALUES ('E001','Juan Reyes'),('E002','Rubi Ochoa'),('E003','Nicandro Mejia'),('E004','Soraya Montenegro'),('E005','Paola Bracho');
/*!40000 ALTER TABLE `enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` varchar(15) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `valor_total_factura` varchar(10) NOT NULL,
  `id_paciente` varchar(15) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `idpaciente_factura_idx` (`id_paciente`),
  CONSTRAINT `idpaciente_factura` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('F001','2022-01-15 09:23:12','3000000','P001'),('F002','2022-01-18 14:11:01','650000','P002'),('F003','2022-01-21 11:45:23','8000000','P003'),('F004','2022-01-25 08:32:56','150000','P004'),('F005','2022-01-29 16:40:18','90000','P005');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `id_medicamento` varchar(15) NOT NULL,
  `nombre_medicamento` varchar(65) NOT NULL,
  `dosis_medicamento` varchar(8) NOT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES ('M001','Aspirina','100mg'),('M002','Paracetamol','500mg'),('M003','Ibuprofeno','200mg'),('M004','Amoxicilina','500mg'),('M005','Omeprazol','20mg');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` varchar(15) NOT NULL,
  `nombre_medico` varchar(65) NOT NULL,
  `especialidad_medico` varchar(45) NOT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('M001','Freddie Mercury','Oncología'),('M002','Paola Jara','Cardiología'),('M003','Elton John','Pediatría'),('M004','Paulina Rubio','Neurología'),('M005','Michael Jackson','Cirugía');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` varchar(15) NOT NULL,
  `nombre_paciente` varchar(65) NOT NULL,
  `direccion_paciente` varchar(90) NOT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('P001','María del Rosario','Calle 123 # 45-67'),('P002','Oréstes Mercouri','Avenida 54 # 12-34'),('P003','Beatriz Pinzon','Carrera 78 # 90-12'),('P004','Catalina Santana','Calle 21 # 43-56'),('P005','Fernando Colunga','Avenida 87 # 23-45');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento`
--

DROP TABLE IF EXISTS `procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimiento` (
  `id_procedimiento` varchar(15) NOT NULL,
  `tipo_procedimiento` varchar(45) NOT NULL,
  `id_medico` varchar(15) NOT NULL,
  `id_enfermero` varchar(15) NOT NULL,
  `id_paciente` varchar(15) NOT NULL,
  PRIMARY KEY (`id_procedimiento`),
  KEY `idmedico_procedimiento_idx` (`id_medico`),
  KEY `idenfermero_procedimiento_idx` (`id_enfermero`),
  KEY `idpaciente_procedimiento_idx` (`id_paciente`),
  CONSTRAINT `idenfermero_procedimiento` FOREIGN KEY (`id_enfermero`) REFERENCES `enfermero` (`id_enfermero`),
  CONSTRAINT `idmedico_procedimiento` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `idpaciente_procedimiento` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento`
--

LOCK TABLES `procedimiento` WRITE;
/*!40000 ALTER TABLE `procedimiento` DISABLE KEYS */;
INSERT INTO `procedimiento` VALUES ('PR001','Cirugía de corazón','M002','E001','P003'),('PR002','Quimioterapia','M001','E002','P001'),('PR003','Extracción de apéndice','M005','E003','P002'),('PR004','Terapia ocupacional','M003','E004','P005'),('PR005','Radiografía de pulmones','M004','E005','P004');
/*!40000 ALTER TABLE `procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_medicamento`
--

DROP TABLE IF EXISTS `receta_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_medicamento` (
  `id_paciente` varchar(15) NOT NULL,
  `id_medicamento` varchar(15) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_medicamento`),
  KEY `idmedicamento_receta_idx` (`id_medicamento`),
  CONSTRAINT `idmedicamento_receta` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`),
  CONSTRAINT `idpaciente_receta` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_medicamento`
--

LOCK TABLES `receta_medicamento` WRITE;
/*!40000 ALTER TABLE `receta_medicamento` DISABLE KEYS */;
INSERT INTO `receta_medicamento` VALUES ('P003','M001'),('P001','M002'),('P002','M003'),('P001','M004'),('P003','M005');
/*!40000 ALTER TABLE `receta_medicamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 21:15:05

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
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
-- Table structure for table `enfermero`
--

DROP TABLE IF EXISTS `enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermero` (
  `cedula_enfermero` varchar(15) NOT NULL,
  `nombres_enfermero` varchar(60) NOT NULL,
  `apellidos_enfermero` varchar(60) NOT NULL,
  `id_medico` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula_enfermero`),
  KEY `id_medico_enfermero_idx` (`id_medico`),
  CONSTRAINT `id_medico_enfermero` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`cedula_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermero`
--

LOCK TABLES `enfermero` WRITE;
/*!40000 ALTER TABLE `enfermero` DISABLE KEYS */;
INSERT INTO `enfermero` VALUES ('12345','Leonardo','Gomez Sarmiendo','10587675'),('12678','Carol Juliana','Cañon Perez','10832356'),('15123','Angie Carolina','Gamboa Lizcano','10987864'),('15679','Cristian Daniel','Sabogal Castro','10835676'),('18754','Nicolas ','Cordoba Vargas','19078654');
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
  `fecha` varchar(20) NOT NULL,
  `valor_Total` varchar(20) NOT NULL,
  `ced_paciente` varchar(15) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `ced_paciente_factura_idx` (`ced_paciente`),
  CONSTRAINT `ced_paciente_factura` FOREIGN KEY (`ced_paciente`) REFERENCES `paciente` (`cedula_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('61','15-02-2023','14.500','45367'),('62','16-02-2023','5.500','67453'),('63','17-02-2023','5.500','67453'),('64','26-03-2023','12.000','76567'),('65','27-04-2023','11.500','76567');
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
  `nombre_medicamento` varchar(60) NOT NULL,
  `dosis` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES ('11','Naproxeno','8 horas'),('12','Acetaminofen','6 horas'),('13','Ibuprofeno','12 horas'),('14','Cefalexina','6 horas'),('15','Amoxicilina','8 horas');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `cedula_medico` varchar(15) NOT NULL,
  `nombres_medico` varchar(60) NOT NULL,
  `apellidos_medico` varchar(60) NOT NULL,
  `especialidad` varchar(55) NOT NULL,
  PRIMARY KEY (`cedula_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('10587675','Yeferson','Ortiz Bolivar','Cirujano'),('10832356','Sergio Esteben','Ramirez Contreras','Odontologo'),('10835676','Deiver Adrian','Gonzalez Hernandez','Medico General'),('10987864','Maria Fernanda','Zuñiga Zalazar','Pediatra'),('19078654','Karen','Rivera Lasso','Neurocirugia');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `cedula_paciente` varchar(15) NOT NULL,
  `nombre_paciente` varchar(100) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `iden_procedimiento` varchar(15) NOT NULL,
  PRIMARY KEY (`cedula_paciente`),
  KEY `id_procedimiento_paciente_idx` (`iden_procedimiento`),
  CONSTRAINT `id_procedimiento_paciente` FOREIGN KEY (`iden_procedimiento`) REFERENCES `procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('45367','Sofia Gonzalez','calle 5 12-5','53'),('67453','Maria Ramirez','cra 6 88-04','51'),('75645','Micahel Gonzalez','cra 6 23-8','52'),('76567','Sergio Vasquez','calle 10D 56-02','54'),('78342','Lina mora','calle 7 12-23','55');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_medicamento`
--

DROP TABLE IF EXISTS `paciente_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_medicamento` (
  `identifi_medicamento` varchar(15) NOT NULL,
  `cedula_Paciente` varchar(15) NOT NULL,
  PRIMARY KEY (`identifi_medicamento`,`cedula_Paciente`),
  KEY `ced_paciente_medicamento_idx` (`cedula_Paciente`),
  CONSTRAINT `ced_paciente_medicamento` FOREIGN KEY (`cedula_Paciente`) REFERENCES `paciente` (`cedula_paciente`),
  CONSTRAINT `identificador_medicamento` FOREIGN KEY (`identifi_medicamento`) REFERENCES `medicamento` (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_medicamento`
--

LOCK TABLES `paciente_medicamento` WRITE;
/*!40000 ALTER TABLE `paciente_medicamento` DISABLE KEYS */;
INSERT INTO `paciente_medicamento` VALUES ('11','45367'),('14','67453'),('15','75645'),('13','76567'),('12','78342');
/*!40000 ALTER TABLE `paciente_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento`
--

DROP TABLE IF EXISTS `procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimiento` (
  `id_procedimiento` varchar(15) NOT NULL,
  `tipo_procedimiento` varchar(60) NOT NULL,
  PRIMARY KEY (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento`
--

LOCK TABLES `procedimiento` WRITE;
/*!40000 ALTER TABLE `procedimiento` DISABLE KEYS */;
INSERT INTO `procedimiento` VALUES ('51','Examen de sangre'),('52','Patologias'),('53','Blanqueamento dental'),('54','Colectomia'),('55','Cirujia con laser');
/*!40000 ALTER TABLE `procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento_medico`
--

DROP TABLE IF EXISTS `procedimiento_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimiento_medico` (
  `ident_procedimiento` varchar(15) NOT NULL,
  `cedula_medico` varchar(15) NOT NULL,
  PRIMARY KEY (`ident_procedimiento`,`cedula_medico`),
  KEY `cedula_medico_procedimiento_idx` (`cedula_medico`),
  CONSTRAINT `cedula_medico_procedimiento` FOREIGN KEY (`cedula_medico`) REFERENCES `medico` (`cedula_medico`),
  CONSTRAINT `identificador_procedimiento` FOREIGN KEY (`ident_procedimiento`) REFERENCES `procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento_medico`
--

LOCK TABLES `procedimiento_medico` WRITE;
/*!40000 ALTER TABLE `procedimiento_medico` DISABLE KEYS */;
INSERT INTO `procedimiento_medico` VALUES ('52','10587675'),('53','10832356'),('51','10835676'),('54','10987864'),('55','19078654');
/*!40000 ALTER TABLE `procedimiento_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_enfermero`
--

DROP TABLE IF EXISTS `telefono_enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_enfermero` (
  `ced_enfermero` varchar(15) NOT NULL,
  `telefono_enfermero` varchar(15) NOT NULL,
  PRIMARY KEY (`ced_enfermero`,`telefono_enfermero`),
  CONSTRAINT `ced_enfermero_telef` FOREIGN KEY (`ced_enfermero`) REFERENCES `enfermero` (`cedula_enfermero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_enfermero`
--

LOCK TABLES `telefono_enfermero` WRITE;
/*!40000 ALTER TABLE `telefono_enfermero` DISABLE KEYS */;
INSERT INTO `telefono_enfermero` VALUES ('12345','312073768'),('12678','312012356'),('15123','310882356'),('15679','312017856'),('18754','318965434');
/*!40000 ALTER TABLE `telefono_enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_medico`
--

DROP TABLE IF EXISTS `telefono_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_medico` (
  `ced_medico` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`ced_medico`,`telefono`),
  CONSTRAINT `ced_medico_tel` FOREIGN KEY (`ced_medico`) REFERENCES `medico` (`cedula_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_medico`
--

LOCK TABLES `telefono_medico` WRITE;
/*!40000 ALTER TABLE `telefono_medico` DISABLE KEYS */;
INSERT INTO `telefono_medico` VALUES ('10587675','3102385667'),('10832356','318927438'),('10835676','310238945'),('10835676','316789700'),('19078654','320674591');
/*!40000 ALTER TABLE `telefono_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_paciente`
--

DROP TABLE IF EXISTS `telefono_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_paciente` (
  `ced_paciente` varchar(15) NOT NULL,
  `telefono_paciente` varchar(15) NOT NULL,
  PRIMARY KEY (`ced_paciente`,`telefono_paciente`),
  CONSTRAINT `ced_paciente_telefno` FOREIGN KEY (`ced_paciente`) REFERENCES `paciente` (`cedula_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_paciente`
--

LOCK TABLES `telefono_paciente` WRITE;
/*!40000 ALTER TABLE `telefono_paciente` DISABLE KEYS */;
INSERT INTO `telefono_paciente` VALUES ('45367','3123567'),('67453','2342345'),('75645','1234555'),('76567','3256778'),('78342','3244566');
/*!40000 ALTER TABLE `telefono_paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14  0:39:22

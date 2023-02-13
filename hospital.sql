-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
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
-- Temporary view structure for view `datoscompletos`
--

DROP TABLE IF EXISTS `datoscompletos`;
/*!50001 DROP VIEW IF EXISTS `datoscompletos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datoscompletos` AS SELECT 
 1 AS `enfermero`,
 1 AS `paciente`,
 1 AS `procedimiento`,
 1 AS `doctor`,
 1 AS `medicamento`,
 1 AS `dosis`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `datospaciente`
--

DROP TABLE IF EXISTS `datospaciente`;
/*!50001 DROP VIEW IF EXISTS `datospaciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datospaciente` AS SELECT 
 1 AS `paciente`,
 1 AS `direccion`,
 1 AS `medicamento`,
 1 AS `dosis`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `datosprocedimiento`
--

DROP TABLE IF EXISTS `datosprocedimiento`;
/*!50001 DROP VIEW IF EXISTS `datosprocedimiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datosprocedimiento` AS SELECT 
 1 AS `enfermero`,
 1 AS `paciente`,
 1 AS `procedimiento`,
 1 AS `doctor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dll_medico_procedimiento`
--

DROP TABLE IF EXISTS `dll_medico_procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dll_medico_procedimiento` (
  `id_medico_p` varchar(20) NOT NULL,
  `id_procedimiento_p` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medico_p`,`id_procedimiento_p`),
  KEY `id_procedimiento_p` (`id_procedimiento_p`),
  CONSTRAINT `dll_medico_procedimiento_ibfk_1` FOREIGN KEY (`id_medico_p`) REFERENCES `tb_medico` (`id_medico`),
  CONSTRAINT `dll_medico_procedimiento_ibfk_2` FOREIGN KEY (`id_procedimiento_p`) REFERENCES `tb_procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dll_medico_procedimiento`
--

LOCK TABLES `dll_medico_procedimiento` WRITE;
/*!40000 ALTER TABLE `dll_medico_procedimiento` DISABLE KEYS */;
INSERT INTO `dll_medico_procedimiento` VALUES ('1001','3001'),('1002','3002'),('1003','3003'),('1004','3004'),('1005','3005');
/*!40000 ALTER TABLE `dll_medico_procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dll_paciente_medicamento`
--

DROP TABLE IF EXISTS `dll_paciente_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dll_paciente_medicamento` (
  `id_paciente_m` varchar(20) NOT NULL,
  `id_medicamento_m` varchar(20) NOT NULL,
  PRIMARY KEY (`id_paciente_m`,`id_medicamento_m`),
  KEY `id_medicamento_m` (`id_medicamento_m`),
  CONSTRAINT `dll_paciente_medicamento_ibfk_1` FOREIGN KEY (`id_paciente_m`) REFERENCES `tb_paciente` (`id_paciente`),
  CONSTRAINT `dll_paciente_medicamento_ibfk_2` FOREIGN KEY (`id_medicamento_m`) REFERENCES `tb_medicamento` (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dll_paciente_medicamento`
--

LOCK TABLES `dll_paciente_medicamento` WRITE;
/*!40000 ALTER TABLE `dll_paciente_medicamento` DISABLE KEYS */;
INSERT INTO `dll_paciente_medicamento` VALUES ('4001','6001'),('4002','6002'),('4003','6003'),('4004','6004'),('4005','6005');
/*!40000 ALTER TABLE `dll_paciente_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enfermero`
--

DROP TABLE IF EXISTS `tb_enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_enfermero` (
  `id_enfermero` varchar(20) NOT NULL,
  `nombre_enfermero` varchar(50) DEFAULT NULL,
  `apellido_enfermero` varchar(50) DEFAULT NULL,
  `id_medico` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enfermero`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `tb_enfermero_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enfermero`
--

LOCK TABLES `tb_enfermero` WRITE;
/*!40000 ALTER TABLE `tb_enfermero` DISABLE KEYS */;
INSERT INTO `tb_enfermero` VALUES ('2001','Laura','Garcia','1001'),('2002','Maga','Oscura','1002'),('2003','Stuart','Little','1003'),('2004','Trunks','Delfuturo','1004'),('2005','Power','Ranger','1005');
/*!40000 ALTER TABLE `tb_enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_enfermeros`
--

DROP TABLE IF EXISTS `tb_enfermeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_enfermeros` (
  `id_enfermero` varchar(20) NOT NULL,
  `nombre_enfermero` varchar(50) DEFAULT NULL,
  `apellido_enfermero` varchar(50) DEFAULT NULL,
  `id_medico_e` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_enfermero`),
  KEY `id_medico_e` (`id_medico_e`),
  CONSTRAINT `tb_enfermeros_ibfk_1` FOREIGN KEY (`id_medico_e`) REFERENCES `tb_medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_enfermeros`
--

LOCK TABLES `tb_enfermeros` WRITE;
/*!40000 ALTER TABLE `tb_enfermeros` DISABLE KEYS */;
INSERT INTO `tb_enfermeros` VALUES ('2001','Laura','Garcia','1001'),('2002','Maga','Oscura','1002'),('2003','Stuart','Little','1003'),('2004','Trunks','Delfuturo','1004'),('2005','Power','Ranger','1005');
/*!40000 ALTER TABLE `tb_enfermeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_facture`
--

DROP TABLE IF EXISTS `tb_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_facture` (
  `id_factura` varchar(20) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `id_paciente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `tb_facture_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_facture`
--

LOCK TABLES `tb_facture` WRITE;
/*!40000 ALTER TABLE `tb_facture` DISABLE KEYS */;
INSERT INTO `tb_facture` VALUES ('5001','01/01/2023',60000,'4001'),('5002','08/02/2023',60000,'4002'),('5003','15/03/2023',60000,'4003'),('5004','06/12/2022',60000,'4004'),('5005','25/11/2022',60000,'4005');
/*!40000 ALTER TABLE `tb_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamento`
--

DROP TABLE IF EXISTS `tb_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medicamento` (
  `id_medicamento` varchar(20) NOT NULL,
  `nombre_medicamento` varchar(50) DEFAULT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamento`
--

LOCK TABLES `tb_medicamento` WRITE;
/*!40000 ALTER TABLE `tb_medicamento` DISABLE KEYS */;
INSERT INTO `tb_medicamento` VALUES ('6001','Semilla del lermitanio','2 mg al dia'),('6002','Paracetamol','6mg cada 8 horas'),('6003','Loratadina','mucho'),('6004','Dolex gripa','2 veces al dia 5mg'),('6005','Descansar','Siempre');
/*!40000 ALTER TABLE `tb_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico`
--

DROP TABLE IF EXISTS `tb_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medico` (
  `id_medico` varchar(20) NOT NULL,
  `nombre_medico` varchar(50) DEFAULT NULL,
  `apellido_medico` varchar(50) DEFAULT NULL,
  `especialidad` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico`
--

LOCK TABLES `tb_medico` WRITE;
/*!40000 ALTER TABLE `tb_medico` DISABLE KEYS */;
INSERT INTO `tb_medico` VALUES ('1001','Raul','Restrepo','Cirugia'),('1002','Fabio','Lopez','Dermatologo'),('1003','Julian','Ramirez','Pediatra'),('1004','Wisin','Yandel','Otorrino'),('1005','Ash','Ketshup','Emergencias');
/*!40000 ALTER TABLE `tb_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente`
--

DROP TABLE IF EXISTS `tb_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_paciente` (
  `id_paciente` varchar(20) NOT NULL,
  `nombre_paciente` varchar(50) DEFAULT NULL,
  `apellido_paciente` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_procedimiento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_procedimiento` (`id_procedimiento`),
  CONSTRAINT `tb_paciente_ibfk_1` FOREIGN KEY (`id_procedimiento`) REFERENCES `tb_procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
INSERT INTO `tb_paciente` VALUES ('4001','Jaime','Garzon','calle falsa 121','3001'),('4002','Calamardo','Tentaculos','calle falsa 122','3002'),('4003','Bob','Esponja','calle falsa 123','3003'),('4004','Patricio','Estrella','calle falsa 124','3004'),('4005','Don','Cangrejo','calle falsa 125','3005');
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pacientes`
--

DROP TABLE IF EXISTS `tb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pacientes` (
  `id_paciente` varchar(20) NOT NULL,
  `nombre_paciente` varchar(50) DEFAULT NULL,
  `apellido_paciente` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_procedimiento_f` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_procedimiento_f` (`id_procedimiento_f`),
  CONSTRAINT `tb_pacientes_ibfk_1` FOREIGN KEY (`id_procedimiento_f`) REFERENCES `tb_procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pacientes`
--

LOCK TABLES `tb_pacientes` WRITE;
/*!40000 ALTER TABLE `tb_pacientes` DISABLE KEYS */;
INSERT INTO `tb_pacientes` VALUES ('4001','Jaime','Garzon','calle falsa 121','3001'),('4002','Calamardo','Tentaculos','calle falsa 122','3002'),('4003','Bob','Esponja','calle falsa 123','3003'),('4004','Patricio','Estrella','calle falsa 124','3004'),('4005','Don','Cangrejo','calle falsa 125','3005');
/*!40000 ALTER TABLE `tb_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_procedimiento`
--

DROP TABLE IF EXISTS `tb_procedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_procedimiento` (
  `id_procedimiento` varchar(20) NOT NULL,
  `tipo_procedimiento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_procedimiento`
--

LOCK TABLES `tb_procedimiento` WRITE;
/*!40000 ALTER TABLE `tb_procedimiento` DISABLE KEYS */;
INSERT INTO `tb_procedimiento` VALUES ('3001','Quirurjico'),('3002','Terapia'),('3003','Contra el cancer'),('3004','Psicologico'),('3005','Biopsia');
/*!40000 ALTER TABLE `tb_procedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_enfermero`
--

DROP TABLE IF EXISTS `telefono_enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_enfermero` (
  `id_enfermero` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id_enfermero`,`telefono`),
  CONSTRAINT `telefono_enfermero_ibfk_1` FOREIGN KEY (`id_enfermero`) REFERENCES `tb_enfermero` (`id_enfermero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_enfermero`
--

LOCK TABLES `telefono_enfermero` WRITE;
/*!40000 ALTER TABLE `telefono_enfermero` DISABLE KEYS */;
INSERT INTO `telefono_enfermero` VALUES ('2001','3135633236'),('2002','3135633237'),('2003','3135633238'),('2004','3135633239'),('2005','3135633210');
/*!40000 ALTER TABLE `telefono_enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_medico`
--

DROP TABLE IF EXISTS `telefono_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_medico` (
  `id_medico` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id_medico`,`telefono`),
  CONSTRAINT `telefono_medico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_medico`
--

LOCK TABLES `telefono_medico` WRITE;
/*!40000 ALTER TABLE `telefono_medico` DISABLE KEYS */;
INSERT INTO `telefono_medico` VALUES ('1001','3135633231'),('1002','3135633232'),('1003','3135633233'),('1004','3135633234'),('1005','3135633235');
/*!40000 ALTER TABLE `telefono_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_paciente`
--

DROP TABLE IF EXISTS `telefono_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_paciente` (
  `id_paciente` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id_paciente`,`telefono`),
  CONSTRAINT `telefono_paciente_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_paciente`
--

LOCK TABLES `telefono_paciente` WRITE;
/*!40000 ALTER TABLE `telefono_paciente` DISABLE KEYS */;
INSERT INTO `telefono_paciente` VALUES ('4001','3135633216'),('4002','3135633227'),('4003','3135633438'),('4004','3135633249'),('4005','3135633250');
/*!40000 ALTER TABLE `telefono_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `datoscompletos`
--

/*!50001 DROP VIEW IF EXISTS `datoscompletos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datoscompletos` AS select `tb_enfermeros`.`nombre_enfermero` AS `enfermero`,`tb_pacientes`.`nombre_paciente` AS `paciente`,`tb_procedimiento`.`tipo_procedimiento` AS `procedimiento`,`tb_medico`.`nombre_medico` AS `doctor`,`tb_medicamento`.`nombre_medicamento` AS `medicamento`,`tb_medicamento`.`dosis` AS `dosis` from ((((((`tb_pacientes` join `tb_procedimiento` on((`tb_pacientes`.`id_procedimiento_f` = `tb_procedimiento`.`id_procedimiento`))) join `dll_medico_procedimiento` on((`tb_procedimiento`.`id_procedimiento` = `dll_medico_procedimiento`.`id_procedimiento_p`))) join `tb_medico` on((`tb_medico`.`id_medico` = `dll_medico_procedimiento`.`id_medico_p`))) join `tb_enfermeros` on((`tb_enfermeros`.`id_medico_e` = `tb_medico`.`id_medico`))) join `dll_paciente_medicamento` on((`dll_paciente_medicamento`.`id_paciente_m` = `tb_pacientes`.`id_paciente`))) join `tb_medicamento` on((`tb_medicamento`.`id_medicamento` = `dll_paciente_medicamento`.`id_medicamento_m`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datospaciente`
--

/*!50001 DROP VIEW IF EXISTS `datospaciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datospaciente` AS select `tb_paciente`.`nombre_paciente` AS `paciente`,`tb_paciente`.`direccion` AS `direccion`,`tb_medicamento`.`nombre_medicamento` AS `medicamento`,`tb_medicamento`.`dosis` AS `dosis` from ((`tb_paciente` join `dll_paciente_medicamento` on((`tb_paciente`.`id_paciente` = `dll_paciente_medicamento`.`id_paciente_m`))) join `tb_medicamento` on((`tb_medicamento`.`id_medicamento` = `dll_paciente_medicamento`.`id_medicamento_m`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datosprocedimiento`
--

/*!50001 DROP VIEW IF EXISTS `datosprocedimiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datosprocedimiento` AS select `tb_enfermeros`.`nombre_enfermero` AS `enfermero`,`tb_pacientes`.`nombre_paciente` AS `paciente`,`tb_procedimiento`.`tipo_procedimiento` AS `procedimiento`,`tb_medico`.`nombre_medico` AS `doctor` from ((((`tb_pacientes` join `tb_procedimiento` on((`tb_pacientes`.`id_procedimiento_f` = `tb_procedimiento`.`id_procedimiento`))) join `dll_medico_procedimiento` on((`tb_procedimiento`.`id_procedimiento` = `dll_medico_procedimiento`.`id_procedimiento_p`))) join `tb_medico` on((`tb_medico`.`id_medico` = `dll_medico_procedimiento`.`id_medico_p`))) join `tb_enfermeros` on((`tb_enfermeros`.`id_medico_e` = `tb_medico`.`id_medico`))) */;
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

-- Dump completed on 2023-02-13 18:14:36

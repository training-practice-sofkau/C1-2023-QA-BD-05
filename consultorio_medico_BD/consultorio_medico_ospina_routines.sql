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
-- Temporary view structure for view `listado_enfermeros`
--

DROP TABLE IF EXISTS `listado_enfermeros`;
/*!50001 DROP VIEW IF EXISTS `listado_enfermeros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listado_enfermeros` AS SELECT 
 1 AS `id_enfermero`,
 1 AS `nombre_enfermero`,
 1 AS `apellido_enfermero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `control de citas medicas`
--

DROP TABLE IF EXISTS `control de citas medicas`;
/*!50001 DROP VIEW IF EXISTS `control de citas medicas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `control de citas medicas` AS SELECT 
 1 AS `Enfermero`,
 1 AS `nombre_paciente`,
 1 AS `Procedimiento`,
 1 AS `nombre_medico`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `listado_enfermeros`
--

/*!50001 DROP VIEW IF EXISTS `listado_enfermeros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listado_enfermeros` AS select `tb_enfermero`.`id_enfermero` AS `id_enfermero`,`tb_enfermero`.`nombre_enfermero` AS `nombre_enfermero`,`tb_enfermero`.`apellido_enfermero` AS `apellido_enfermero` from `tb_enfermero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `control de citas medicas`
--

/*!50001 DROP VIEW IF EXISTS `control de citas medicas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `control de citas medicas` AS select `tb_enfermero`.`nombre_enfermero` AS `Enfermero`,`tb_paciente`.`nombre_paciente` AS `nombre_paciente`,`tb_procedimiento`.`tipo_procedimiento` AS `Procedimiento`,`tb_medico`.`nombre_medico` AS `nombre_medico` from ((((`tb_paciente` join `tb_procedimiento` on((`tb_paciente`.`id_procedimiento_paciente` = `tb_procedimiento`.`id_procedimiento`))) join `dll_medico_procedimiento` on((`tb_procedimiento`.`id_procedimiento` = `dll_medico_procedimiento`.`id_procedimiento_procedimiento`))) join `tb_medico` on((`tb_medico`.`id_medico` = `dll_medico_procedimiento`.`id_medico_procedimiento`))) join `tb_enfermero` on((`tb_enfermero`.`id_medico_Enfermero` = `tb_medico`.`id_medico`))) */;
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

-- Dump completed on 2023-02-14 22:07:12

-- -----------------------------------------------------
-- Ingresando datos a las tablas de la librería
-- -----------------------------------------------------
USE `LibreriaBuscaLibre`;

-- -----------------------------------------------------
-- Tabla Autor
-- -----------------------------------------------------
INSERT INTO `autor` VALUES ('1', '1/1/1980', 'COL', 'Juan');
INSERT INTO `autor` VALUES ('2', '1/2/1980', 'ESP', 'Luis');
INSERT INTO `autor` VALUES ('3', '1/3/1980', 'VEN', 'José');
INSERT INTO `autor` VALUES ('4', '1/4/1980', 'USA', 'Mark');
INSERT INTO `autor` VALUES ('5', '1/5/1980', 'RUS', 'Alek');

-- -----------------------------------------------------
-- Tabla Editorial
-- -----------------------------------------------------
INSERT INTO `editorial` VALUES ('Planeta', 'Barcelona', 'Calle 1 # 1 - 1', '1111111111');
INSERT INTO `editorial` VALUES ('RM', 'Barcelona', 'Calle 2 # 1 - 2', '2222222222');
INSERT INTO `editorial` VALUES ('Lumen', 'Madrid', 'Calle 1 # 1 - 1', '3333333333');
INSERT INTO `editorial` VALUES ('Debolsillo', 'Bogotá', 'Carrera 1 # 1 - 1', '4444444444');

-- -----------------------------------------------------
-- Tabla Libro
-- -----------------------------------------------------
INSERT INTO `libro` VALUES ('10', 'Luz', '40', 'Planeta');
INSERT INTO `libro` VALUES ('11', 'Viajando al mar', '168', 'RM');
INSERT INTO `libro` VALUES ('12', 'Despegando', '500', 'Planeta');
INSERT INTO `libro` VALUES ('13', 'El nombre', '620', 'Lumen');
INSERT INTO `libro` VALUES ('14', 'La casa de al lado', '461', 'Debolsillo');
INSERT INTO `libro` VALUES ('15', 'Felicidad', '86', 'RM');
INSERT INTO `libro` VALUES ('16', 'Recuerdos en verso', '614', 'Planeta');
INSERT INTO `libro` VALUES ('17', 'Despierta YA!', '163', 'Planeta');
INSERT INTO `libro` VALUES ('18', 'Cómo ser mejor en...', '613', 'RM');
INSERT INTO `libro` VALUES ('19', 'Español para extranjeros', '795', 'Lumen');
INSERT INTO `libro` VALUES ('20', 'De visita al interior', '985', 'RM');
INSERT INTO `libro` VALUES ('21', 'Rodolfo, el tripulante', '32', 'Planeta');
INSERT INTO `libro` VALUES ('22', 'El nombre del viento', '963', 'Debolsillo');
INSERT INTO `libro` VALUES ('23', 'Cuarenta y tres horas', '433', 'Planeta');
INSERT INTO `libro` VALUES ('24', 'Los camellos del sur', '94', 'Debolsillo');
INSERT INTO `libro` VALUES ('25', 'Escribir, arte y pecado', '77', 'Lumen');
INSERT INTO `libro` VALUES ('26', 'Sonidos lejanos', '623', 'RM');
INSERT INTO `libro` VALUES ('27', 'Amarte', '81', 'Planeta');
INSERT INTO `libro` VALUES ('28', 'Después de la muerte', '630', 'Lumen');
INSERT INTO `libro` VALUES ('29', 'Sentimientos más allá', '106', 'Debolsillo');

-- -----------------------------------------------------
-- Tabla Cliente
-- -----------------------------------------------------
INSERT INTO `cliente` VALUES ('1111111119', 'Pedro');
INSERT INTO `cliente` VALUES ('1111111118', 'Manuela');
INSERT INTO `cliente` VALUES ('1111111117', 'Carmen');
INSERT INTO `cliente` VALUES ('1111111116', 'Andrés');
INSERT INTO `cliente` VALUES ('1111111115', 'Felipe');
INSERT INTO `cliente` VALUES ('1111111114', 'Mateo');
INSERT INTO `cliente` VALUES ('1111111113', 'Sara');

-- -----------------------------------------------------
-- Tabla Teléfono_Cliente
-- -----------------------------------------------------
INSERT INTO `telefono_cliente` VALUES ('1111111113', '5555555555');
INSERT INTO `telefono_cliente` VALUES ('1111111114', '6666666666');
INSERT INTO `telefono_cliente` VALUES ('1111111115', '7777777777');
INSERT INTO `telefono_cliente` VALUES ('1111111116', '8888888888');
INSERT INTO `telefono_cliente` VALUES ('1111111117', '9999999999');
INSERT INTO `telefono_cliente` VALUES ('1111111118', '1011111111');
INSERT INTO `telefono_cliente` VALUES ('1111111119', '2022222222');
INSERT INTO `telefono_cliente` VALUES ('1111111113', '3033333333');
INSERT INTO `telefono_cliente` VALUES ('1111111114', '4044444444');
INSERT INTO `telefono_cliente` VALUES ('1111111115', '5055555555');
INSERT INTO `telefono_cliente` VALUES ('1111111116', '6066666666');
INSERT INTO `telefono_cliente` VALUES ('1111111117', '7077777777');

-- -----------------------------------------------------
-- Tabla Libro_Autor
-- -----------------------------------------------------
INSERT INTO `libro_autor` VALUES ('10', '1');
INSERT INTO `libro_autor` VALUES ('12', '3');
INSERT INTO `libro_autor` VALUES ('14', '5');
INSERT INTO `libro_autor` VALUES ('16', '5');
INSERT INTO `libro_autor` VALUES ('18', '3');
INSERT INTO `libro_autor` VALUES ('20', '1');
INSERT INTO `libro_autor` VALUES ('22', '1');
INSERT INTO `libro_autor` VALUES ('24', '3');
INSERT INTO `libro_autor` VALUES ('26', '5');
INSERT INTO `libro_autor` VALUES ('28', '5');

-- -----------------------------------------------------
-- Tabla Libro_Cliente
-- -----------------------------------------------------
INSERT INTO `libro_cliente` VALUES ('11', '1111111113');
INSERT INTO `libro_cliente` VALUES ('11', '1111111114');
INSERT INTO `libro_cliente` VALUES ('11', '1111111115');
INSERT INTO `libro_cliente` VALUES ('13', '1111111116');
INSERT INTO `libro_cliente` VALUES ('15', '1111111117');
INSERT INTO `libro_cliente` VALUES ('17', '1111111118');
INSERT INTO `libro_cliente` VALUES ('19', '1111111119');
INSERT INTO `libro_cliente` VALUES ('21', '1111111113');
INSERT INTO `libro_cliente` VALUES ('23', '1111111114');
INSERT INTO `libro_cliente` VALUES ('25', '1111111115');

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LibreriaBuscaLibre
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LibreriaBuscaLibre
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LibreriaBuscaLibre` DEFAULT CHARACTER SET utf8 ;
USE `LibreriaBuscaLibre` ;

-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`Editorial` (
  `nombre` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `complemento` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL DEFAULT '6013909541',
  PRIMARY KEY (`nombre`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_paginas` VARCHAR(45) NULL,
  `nombre_editorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `LibreriaBuscaLibre`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`autor` (
  `id` VARCHAR(10) NOT NULL,
  `fecha de nacimiento` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(20) NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`libro_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`libro_autor` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `id_autor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `id_autor`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `id_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `LibreriaBuscaLibre`.`autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ISBN_libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `LibreriaBuscaLibre`.`libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`libro_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`libro_cliente` (
  `ISBN_libro_cliente` VARCHAR(10) NOT NULL,
  `id_cliente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro_cliente`, `id_cliente`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `ISBN_libro_cliente`
    FOREIGN KEY (`ISBN_libro_cliente`)
    REFERENCES `LibreriaBuscaLibre`.`libro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `LibreriaBuscaLibre`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`telefono_cliente` (
  `cedula_cliente` VARCHAR(10) NOT NULL,
  `numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedula_cliente`, `numero`),
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `LibreriaBuscaLibre`.`cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Ingresando datos a las tablas
-- -----------------------------------------------------
USE `LibreriaBuscaLibre`;

-- -----------------------------------------------------
-- Tabla Autor
-- -----------------------------------------------------
INSERT INTO `libreriabuscalibre`.`autor` VALUES ('1', '1/1/1980', 'COL', 'Juan');
INSERT INTO `libreriabuscalibre`.`autor` VALUES ('2', '1/2/1980', 'ESP', 'Luis');
INSERT INTO `libreriabuscalibre`.`autor` VALUES ('3', '1/3/1980', 'VEN', 'José');
INSERT INTO `libreriabuscalibre`.`autor` VALUES ('4', '1/4/1980', 'USA', 'Mark');
INSERT INTO `libreriabuscalibre`.`autor` VALUES ('5', '1/5/1980', 'RUS', 'Alek');

-- -----------------------------------------------------
-- Tabla Editorial
-- -----------------------------------------------------
INSERT INTO `libreriabuscalibre`.`editorial` VALUES ('Planeta', 'Barcelona', 'Calle 1 # 1 - 1', '1111111111');
INSERT INTO `libreriabuscalibre`.`editorial` VALUES ('RM', 'Barcelona', 'Calle 2 # 1 - 2', '2222222222');
INSERT INTO `libreriabuscalibre`.`editorial` VALUES ('Lumen', 'Madrid', 'Calle 1 # 1 - 1', '3333333333');
INSERT INTO `libreriabuscalibre`.`editorial` VALUES ('Debolsillo', 'Bogotá', 'Carrera 1 # 1 - 1', '4444444444');

-- -----------------------------------------------------
-- Tabla Libro
-- -----------------------------------------------------
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('10', 'Luz', '40', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('11', 'Viajando al mar', '168', 'RM');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('12', 'Despegando', '500', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('13', 'El nombre', '620', 'Lumen');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('14', 'La casa de al lado', '461', 'Debolsillo');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('15', 'Felicidad', '86', 'RM');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('16', 'Recuerdos en verso', '614', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('17', 'Despierta YA!', '163', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('18', 'Cómo ser mejor en...', '613', 'RM');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('19', 'Español para extranjeros', '795', 'Lumen');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('20', 'De visita al interior', '985', 'RM');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('21', 'Rodolfo, el tripulante', '32', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('22', 'El nombre del viento', '963', 'Debolsillo');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('23', 'Cuarenta y tres horas', '433', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('24', 'Los camellos del sur', '94', 'Debolsillo');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('25', 'Escribir, arte y pecado', '77', 'Lumen');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('26', 'Sonidos lejanos', '623', 'RM');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('27', 'Amarte', '81', 'Planeta');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('28', 'Después de la muerte', '630', 'Lumen');
INSERT INTO `libreriabuscalibre`.`libro` VALUES ('29', 'Sentimientos más allá', '106', 'Debolsillo');

-- -----------------------------------------------------
-- Tabla Cliente
-- -----------------------------------------------------
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111119', 'Pedro');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111118', 'Manuela');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111117', 'Carmen');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111116', 'Andrés');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111115', 'Felipe');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111114', 'Mateo');
INSERT INTO `libreriabuscalibre`.`cliente` VALUES ('1111111113', 'Sara');

-- -----------------------------------------------------
-- Tabla Libro_Autor
-- -----------------------------------------------------
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('10', '1');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('12', '3');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('14', '5');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('16', '5');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('18', '3');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('20', '1');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('22', '1');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('24', '3');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('26', '5');
INSERT INTO `libreriabuscalibre`.`libro_autor` VALUES ('28', '5');
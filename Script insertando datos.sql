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

INSERT INTO  `LibreriaBuscaLibre`.`Editorial` ( `nombre`,`ciudad`, `complemento` ,`Telefono` )
VALUES("Vintage", "Cali", "La mejor editorial", "101010"),
		("zeta", "Cali", "La mejor editorial", "401010"),
        ("Alba", "Bogota", "La mejor editorial de Bogotá", "201010"),
        ("Lectura", "Cali", "Leer es mi cuento", "301010");


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
    FOREIGN KEY (`nombre_editorial`) REFERENCES `LibreriaBuscaLibre`.`Editorial` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `LibreriaBuscaLibre`.`libro` (`ISBN`,   `titulo`,   `numero_paginas`, `nombre_editorial`)
VALUES("123B", "El retrato", "120", "Vintage"),
		("123C", "Lideres mundiales", "200", "Vintage"),
		("123D", "El diario de Ana Frank", "30", "Vintage"),
		("123E", "El alquimista", "180", "Vintage"),
		("123F", "La republica", "200", "Vintage"),
		("123G", "Simple", "200", "Vintage"),
		("123H", "Cocina de tu vida", "200", "zeta"),
		("123I", "Historia del arte", "500", "zeta"),
		("123J", "Arte y fotografía", "150", "zeta"),
		("123k", "Historia de la imágenes", "300", "zeta"),
		("123L", "Historia del jazz", "90", "Alba"),
		("123M", "Tu cerebro y la musica", "100", "Alba"),
		("123N", "Plantas olvidadas", "150", "Alba"),
		("123O", "Algas marinas", "99", "Alba"),
		("123P", "Viviendo en el futuro", "100", "Lectura"),
    ("123Q", "Los innovadores", "100", "Lectura"),
    ("123R", "TIC en casa", "110", "Lectura"),
    ("123S", "Fisioterapia en casa", "100", "Lectura"),
    ("123T", "Manualidades en casa", "167", "Lectura"),
    ("123U", "Desarrollo industrial", "190", "Lectura"),
    ("123V", "El enigma y el espejo", "100", "Lectura");
        
        
 


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;

INSERT INTO  `LibreriaBuscaLibre`.`cliente`(`cedula`,  `nombre`)
VALUES ("1088888", "Agela Cumbal"),
	("101010101", "Juliana Rios"),
    ("202020202", "Ivan Lopez"),
    ("303030303", "Aura Lucia Soto"),
    ("404040404", "Jose Pinzon"),
    ("505050505", "Jairo Cultid"),
    ("606060606", "Marcela Paguay");



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

INSERT INTO LibreriaBuscaLibre.autor ( id,   `fecha de nacimiento`, nacionalidad, nombre)
VALUES ("2", "2000-01-01", "colombiano", "Ana Maria Lopez"),
		("3", "1998-01-01", "colombiano", "Jenny Hernandez"),
        ("4", "2000-01-01", "colombiano", "Liliana Paz"),
        ("5", "2000-01-01", "colombiano", "Juliana Paguay");


-- -----------------------------------------------------
-- Table `LibreriaBuscaLibre`.`libro_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibreriaBuscaLibre`.`libro_autor` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `id_autor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `id_autor`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONS,TRAINT `id_autor`
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

  INSERT INTO `LibreriaBuscaLibre`.`libro_autor` (  `ISBN_libro`, `id_autor` )
  VALUES ("123B",1),
  ("123C", "2"),
  ("123D","2"),
  ("123E","1"),
  ("123F", "3"),
  ("123F", "4"),
  ("123G", "4"),
  ("123G", "5"),
  ("123H","5"),
  ("123I", "1"),
  ("123J", "2"),
  ("123k", "3"),
  ("123L", "4"),
  ("123M", "4"),
  ("123N", "5"),
  ("123O", "5"),
  ("123P", "1"),
  ("123Q", "1"),
  ("123R", "2"),
  ("123S", "3"),
  ("123T", "4"),
  ("123U", "4"),
  ("123V", "3");



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
    INSERT INTO  `LibreriaBuscaLibre`.`libro_cliente` (  `ISBN_libro_cliente` ,`id_cliente`)
    VALUES    ("123J", "1088888" ),
        ("123k", "1088888"),
        ("123L", "101010101"),
        ("123M", "101010101"),
        ("123N", "202020202"),
        ("123O", "202020202"),
        ("123P", "303030303"),
        ("123Q", "303030303"),
        ("123R", "404040404"),
        ("123S", "505050505"),
        ("123T", "606060606"),
        ("123U", "606060606"),
        ("123V", "101010101");



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

INSERT INTO `LibreriaBuscaLibre`.`telefono_cliente` ( `cedula_cliente`, `numero`)
VALUES ("1088888", "317777777"),
("1088888", "317777778"),
("606060606",  "317777776"),
("101010101",  "317777775"),
("101010101",  "317777755"),
("303030303",   "317777776"),
("404040404",   "317777775"),
("505050505",   "317777774");



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
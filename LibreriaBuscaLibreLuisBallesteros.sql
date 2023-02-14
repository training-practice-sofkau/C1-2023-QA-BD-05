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
  `fecha_de_nacimiento` VARCHAR(45) NULL,
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

----------
-- Tabla Autor
INSERT INTO LibreriaBuscaLibre.autor (id, fecha_de_nacimiento, nacionalidad, nombre)
VALUES 
("12", "1990-01-12", "Colombiano", "Camilo Navas"),
("13", "2000-02-22", "Colombiano", "Javier Salas"),
("14", "1990-08-31", "Colombiano", "Sonia Parada"),
("15", "1976-05-25", "Colombiano", "Pedro Pascal"),
("16", "2001-07-26", "Colombiano", "Lina Huerta");

----------
-- Tabla Cliente
INSERT INTO libreriabuscalibre.cliente (cedula, nombre)
VALUES
("1140", "Fernando Ballestas"),
("1141", "Jaime Torres"),
("1142", "Tomas Cabal"),
("1143", "Yenni Candela"),
("1144", "Lola Esposito"),
("1145", "Tim Bolaños"),
("1146", "Ruth Chará");

----------
-- Tabla Editorial
INSERT INTO libreriabuscalibre.editorial (nombre, ciudad, complemento, Telefono)
VALUES
("Editorial Norma", "Barranquilla", "Calle esquina", "312454"),
("Editorial Nacional", "Bogotá", "Segundo piso", "312321"),
("Editorial Sofka", "Medellin", "Al lado del cai municipal", "311256"),
("Editorial Colombia", "Bogota", "Calle esquina", "301456");

----------
-- Tabla Libro
INSERT INTO libreriabuscalibre.libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES
("I00020", "En la cumbre", "20", "Editorial Norma"),
("I00021", "La cupula", "200", "Editorial Nacional"),
("I00022", "Cumbres borrascosas", "231", "Editorial Sofka"),
("I00023", "Harry Potter 1", "89", "Editorial Nacional"),
("I00024", "Harry Potter 2", "300", "Editorial Nacional"),
("I00025", "Harry Potter 3", "67", "Editorial Norma"),
("I00026", "Harry Potter 4", "89", "EEditorial Sofka"),
("I00027", "Harry Potter 5", "800", "Editorial Nacional"),
("I00028", "Harry Potter 6", "1340", "Editorial Sofka"),
("I00029", "Harry Potter 7", "480", "Editorial Colombia"),
("I00030", "Rojo", "450", "Editorial Nacional"),
("I00031", "Negro", "200", "Editorial Norma"),
("I00032", "Verde", "450", "Editorial Nacional"),
("I00033", "Blanco", "670", "Editorial Norma"),
("I00034", "Resplandor", "210", "Editorial Nacional"),
("I00035", "Claustrofobia", "120", "Editorial Sofka"),
("I00036", "3", "520", "Editorial Nacional"),
("I00037", "Amor y odio", "820", "Editorial Colombia"),
("I00038", "Java para tontos", "20", "Editorial Colombia"),
("I00039", "Sql para tontos", "20", "Editorial Norma"),
("I00040", "Mantenga su casa hermosa", "20", "Editorial Sofka");

----------
-- Tabla libro_autor
INSERT INTO libreriabuscalibre.libro_autor (ISBN_libro, id_autor)
VALUES
("I00020", "12"),
("I00021", "13"),
("I00022", "14"),
("I00023", "15"),
("I00024", "16"),
("I00025", "12"),
("I00026", "16"),
("I00027", "13"),
("I00028", "12"),
("I00032", "16");

----------
-- Tabla libro_cliente
INSERT INTO libreriabuscalibre.libro_cliente (ISBN_libro_cliente, id_cliente)
VALUES
("I00035", "1140"),
("I00036", "1141"),
("I00037", "1142"),
("I00038", "1143"),
("I00031", "1144"),
("I00021", "1145"),
("I00021", "1146"),
("I00022", "1141"),
("I00025", "1140"),
("I00034", "1142");

----------
-- Tabla telefono_cliente
INSERT INTO libreriabuscalibre.telefono_cliente (cedula_cliente, numero)
VALUES
("1140", "313427"),
("1140", "012345"),
("1141", "315908"),
("1141", "002134"),
("1142", "876543"),
("1142", "376432"),
("1143", "102357"),
("1143", "178956"),
("1144", "12053"),
("1144", "31467"),
("1145", "3147927"),
("1145", "319607");

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
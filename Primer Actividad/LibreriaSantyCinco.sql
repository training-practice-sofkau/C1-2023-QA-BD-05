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
  `FechaNacimiento` VARCHAR(45) NULL,
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

-- Tabla Autor
INSERT INTO `libreriabuscalibre`.`autor` (`id`, `fecha de nacimiento`, `nacionalidad`, `nombre`) 
VALUES
('1', '12-02-2001', 'Colombiano', 'Pepito Perez'),
("2", "2000-02-22", "Colombiano", "Jesus de Nazaret"),
("3", "2001-08-33", "Venezolano", "Son Goku"),
("4", "2002-05-44", "Peruano", "Bart Simpson"),
("5", "2003-07-55", "Colombiano", "Pedro Alvarez");


-- Tabla cliente

INSERT INTO `libreriabuscalibre`.`cliente` (`cedula`, `nombre`) 
VALUES 
('1', 'Pepito Jimenez'),
('2', 'Marcela Sepulveda'),
('3', 'Krillin '),
('4', 'Neo Fonseca'),
('5', 'Mr Increible'),
('6', 'Lisa Simpson'),
('7', 'Homer Simpson');


-- Tabla editorial
INSERT INTO `libreriabuscalibre`.`editorial` (`nombre`, `ciudad`, `complemento`, `Telefono`)
 VALUES 
 ('Editorial Santy', 'Pereira', 'Calle1', '322911123'),
 ('Editorial Minuto de DIOS', 'Medellin', 'Calle 5', '3221244'),
 ('Editorial Letricas', 'Cali', 'Calle 8', '38923874'),
 ('Editorial Springfield', 'New York', 'Calle 9', '23144444');



-- Tabla libros 
INSERT INTO `libreriabuscalibre`.`libro` (`ISBN`, `titulo`, `numero_paginas`, `nombre_editorial`)
VALUES 
(1, "El alquimista", 200, "Editorial Santy"),
(2, "Sueño en el poder", 150, "Editorial Santy"),
(3, "La vida secreta de las abejas", 250, "Editorial Santy"),
(4, "El código da Vinci",  300, "Editorial Santy"),
(5, "Harry Potter y la piedra filosofal",  350, "Editorial Minuto de DIOS"),
(6, "La isla del tesoro", 200, "Editorial Minuto de DIOS"),
(7, "La Odisea", "800 a.C", 250, "Editorial Minuto de DIOS"),
(8, "Los hermanos Karamazov", 450, "Editorial Minuto de DIOS"),
(9, "Cien años de soledad", 400, "Editorial Letricas"),
(10, "Matar a un ruiseñor", 300, "Editorial Letricas"),
(11, "Frankenstein o el moderno Prometeo", 250, "Editorial Letricas"),
(12, "Dracula",  350, "Editorial Letricas"),
(13, "El extraño caso del Dr. Jekyll y Mr. Hyde", 150, "Editorial Letricas"),
(14, "El gran Gatsby", 200, "Editorial Letricas"),
(15, "Moby Dick",300, "Editorial Springfield"),
(16, "El guardián entre el centeno", 200, "Editorial Springfield"),
(17, "La naranja mecánica", 250, "Editorial Springfield"),
(18, "1984", 300, "Editorial Springfield"),
(19, "Un mundo feliz", 150, "Editorial Springfield"),
(20, "El cuento de la criada", 250, "Editorial Springfield");



SELECT nombre, `fecha de nacimiento`
FROM LibreriaBuscaLibre.autor;

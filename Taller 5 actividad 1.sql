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

INSERT INTO autor (id,`fecha de nacimiento`,nacionalidad,nombre) VALUES (1,'25/07/1991','Colombia','Efrain');
INSERT INTO autor (id,`fecha de nacimiento`,nacionalidad,nombre) VALUES (2,'30/09/1990','España','Andres');
INSERT INTO autor (id,`fecha de nacimiento`,nacionalidad,nombre) VALUES (4,'1/01/1960','Colombia','Gabriel');
INSERT INTO autor (id,`fecha de nacimiento`,nacionalidad,nombre) VALUES (5,'2/05/1978','Argentina','Felipe');
INSERT INTO autor (id,`fecha de nacimiento`,nacionalidad,nombre) VALUES (3,'31/12/1980','Colombia','Mario');


INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (1,'Satanás',200,'Planeta');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (2,'Cien años de soledad',1000,'Sudamericana');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (3,'La hojarasca',40,'Sudamericana');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (4,'1984',300,'Debolsillo');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (5,'Crimen y castigo',500,'Porrúa S.A');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (6,'Melancolia de los feos',150,'Planeta');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (7,'El pantano de las mariposas',200,'Destino');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (8,'¿Dónde está la franja amarilla editorial?',50,'LITERATURA RANDOM HOUSE MONDADORI S.A.');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (9,'Un mundo feliz',200,'Planeta');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (10,'Moby Dick',200,'Editorial Alma');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (11,'el club de la pelea',200,'Tornamesa');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (12,'CABALLO DE TROYA',200,'Penguin Libros');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (13,'El código Da Vinci',200,'Umbriel Editores');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (14,'Debolsillo',200,'Debolsillo');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (15,'La milla verde',200,'Debolsillo');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (16,'Dracula',200,'Editorial Porrúa');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (17,'Akelarre',200,'Planeta');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (18,'A sangre fría',200,'Debolsillo');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (19,'Las venas abiertas de América Latina',200,'Siglo XXI Editores');
INSERT INTO  libro (ISBN,titulo,numero_paginas,nombre_editorial) VALUES (20,'El extraño caso del Dr. Jekyll y Mr. Hyde',200,'Editorial Alma');



INSERT INTO cliente(cedula,nombre) VALUES (43243243,'Andres');
INSERT INTO cliente(cedula,nombre) VALUES (534354,'Jorge');
INSERT INTO cliente(cedula,nombre) VALUES (53453453,'Laura');
INSERT INTO cliente(cedula,nombre) VALUES (31321312,'Leidy');
INSERT INTO cliente(cedula,nombre) VALUES (321312,'Daniela');
INSERT INTO cliente(cedula,nombre) VALUES (1243245,'Jesus');
INSERT INTO cliente(cedula,nombre) VALUES (78967987,'Juan');


INSERT INTO editorial(nombre,ciudad,complemento,Telefono) VALUES ('Debolsillo','España','CL 40 #50', 43267657);
INSERT INTO editorial(nombre,ciudad,complemento,Telefono) VALUES ('Editorial Alma','Perú','Cr89 # 20 -60', 543543);
INSERT INTO editorial(nombre,ciudad,complemento,Telefono) VALUES ('Destino','Argentina', 'Cr 10 # 30 -50', 654655465);
INSERT INTO editorial(nombre,ciudad,complemento,Telefono) VALUES ('Planeta','Mexico','Cr 50 # 30', 43243324);


INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (1,1243245);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (20,1243245);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (3,1243245);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (6,321312);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (7,321312);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (1,534354);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (7,534354);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (17,321312);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (1,43243243);
INSERT INTO libro_cliente(ISBN_libro_cliente,id_cliente) VALUES (2,43243243);


INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (17,3);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (6,3);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (2,1);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (5,1);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (2,4);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (18,4);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (20,4);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (7,5);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (12,2);
INSERT INTO libro_autor(ISBN_libro,id_autor) VALUES (1,3);

INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (31321312,53543435);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (31321312,54354345);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (321312,6757566765);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (321312,4324324);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (43243243,654867867);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (43243243,97997897);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (534354,767565);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (534354,98798870);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (53453453,765765);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (53453453,4537876);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (78967987,3213145);
INSERT INTO telefono_cliente(cedula_cliente,numero) VALUES (78967987,7545343);


SELECT nombre,`fecha de nacimiento` FROM libreriabuscalibre.autor;

SELECT count(distinct ISBN_libro_cliente ) as Libros_vendidos FROM libreriabuscalibre.libro_cliente;

SELECT nombre, numero FROM libreriabuscalibre.cliente join telefono_cliente on cedula = cedula_cliente ;

SELECT titulo,nombre FROM libreriabuscalibre.libro join libro_autor on ISBN_libro = ISBN join autor on id_autor = id;

SELECT  distinct nombre_editorial FROM libreriabuscalibre.libro join libro_cliente on ISBN = ISBN_libro_cliente;

SELECT * from libros_mas_vendidos;

select * from datos_contacto_cliente;

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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Se insertan 5 registros a la tabla editorial 
INSERT INTO Editorial(nombre, ciudad, complemento, telefono) 
VALUES ('Ediciones SM', 'Madrid', 'cll 78 #45-12', '6013909541'),
('Ediciones Ekaré', 'Caracas', 'cll 48 #12-78', '6013909541'), 
('Editorial Kókinos', 'Madrid', 'cra 96 #48-12', '6013909541'),
('Editorial Juventud', 'Barcelona', 'cll 23 #12-78', '6013909541'), 
('Editorial Algar', 'Alcira', 'cra 79 #32-48', '6013909541'); 

-- Se insertan 6 registros a la tabla autor
INSERT INTO autor (id, fecha_de_nacimiento, nacionalidad, nombre)
VALUES ('43495755', '15/10/1989', 'Colombiano', 'Jorge Pérez Restrepo'), 
('35475988', '10/02/1990', 'Cubano', 'Luis Morales Rendón'),
('54721499', '03/08/1831', 'Colombiano', 'Adriana Agudelo Monsalve'), 
('19645788', '22/11/1992', 'Mexicano', 'Ángel Tangarife Monsalve'),
('30157855', '21/04/1982', 'Venezolano', 'Carmén Hurtado Serna'),
('49521755', '16/05/1988', 'Peruano', 'Ana Gómez Aguirre');

-- Se insertan 8 registros a la tabla cliente 
INSERT INTO cliente (cedula, nombre)
VALUES ('459621588', 'Antonio Giraldo Hurtado'),
('31854177', 'Liliana Monsalve Morales'),
('16555211', 'Daniel Mosquera Serna'),
('36666521', 'Alejandro Taborda Cifuentes'),
('19666533', 'Luz Aguirre Montoya'),
('99547111', 'Gloria Meneses Hernández'),
('10111002', 'Cristina Pérez Hurtado'),
('54777544', 'Sofía Murillo Torres'); 

-- Se insertan 13 registros a la tabla teléfono cliente 
INSERT INTO telefono_cliente(cedula_cliente, numero)
VALUES ('459621588', '3201752222'),
('31854177', '3115743621'),
('16555211', '3100000245'),
('36666521', '3124720136'),
('19666533', '3401456321'),
('99547111', '3120097775'),
('10111002', '3110200033'),
('54777544', '3147894444'),
('459621588', '3001254722'),
('31854177', '3004875214'),
('16555211', '3201791641'),
('36666521', '3112546546'),
('19666533', '3147456444');

-- Se insertan 21 registros a la tabla libro
INSERT INTO libro(ISBN, titulo, numero_paginas, nombre_editorial)
VALUES ('978-32-456', '¿Quién soy?', '178', 'Ediciones SM'),
('979-15-458', 'El pollo Pepe', '89', 'Editorial Kókinos'), 
('978-54-121', 'Cucú Tras', '121', 'Editorial Juventud'),
('978-54-852', 'Charlie y la fábrica de chocolate', '25', 'Editorial Algar'),
('978-12-336', 'Viaje al centro de la tierra', '50', 'Ediciones Ekaré'),
('979-45-333', '¿A qué sabe la luna?', '54', 'Editorial Kókinos'),
('978-36-555', 'La historia interminable', '151', 'Editorial Juventud'),
('979-54-954', 'Elmer', '15', 'Ediciones SM'),
('979-89-333', 'El principito', '136', 'Ediciones SM'),
('978-21-666', 'El pequeño Nicolás', '200', 'Editorial Algar'),
('979-03-000', 'Los cinco sentidos de Nacho', '19', 'Ediciones SM'),
('978-44-320', 'Orejas de mariposa', '29', 'Editorial Juventud'),
('979-78-000', 'El monstruo de colores', '80', 'Ediciones SM'),
('978-30-125', 'Las jirafas no pueden bailar', '97', 'Editorial Kókinos'),
('979-03-365', 'La historia interminable', '15', 'Ediciones SM'),
('978-00-333', 'Harry Potter y la piedra filosofal', '154', 'Ediciones SM'),
('979-15-785', 'Donde viven los monstruos', '254', 'Editorial Algar'),
('978-88-120', 'Platero y yo', '154', 'Editorial Juventud'),
('979-59-000', 'El árbol de los recuerdos', '76', 'Editorial Algar'),
('979-12-350', 'Todos bostezan', '64', 'Editorial Kókinos'),
('978-00-145', 'Los instrumentos del mundo', '34', 'Editorial Algar');

-- Se insertan 11 registros a la tabla libro cliente
INSERT INTO libro_cliente(ISBN_libro_cliente, id_cliente)
VALUES('978-00-145', '459621588'),
('979-89-333', '31854177'),
('979-54-954', '16555211'),
('979-59-000', '36666521'),
('979-45-333', '99547111'),
('978-12-336', '10111002'),
('978-54-852', '54777544'),
('978-54-121', '16555211'),
('978-32-456', '36666521'),
('978-30-125', '19666533'),
('979-12-350', '459621588'); 

INSERT INTO libro_cliente(ISBN_libro_cliente, id_cliente)
VALUES ('979-12-350', '99547111');

-- Se insertan 11 registros a la tabla libro autor
INSERT INTO libro_autor(ISBN_libro, id_autor)
VALUES ('978-00-145', '43495755'), 
('979-89-333', '43495755'),
('979-54-954', '35475988'),
('979-59-000', '35475988'),
('979-45-333', '19645788'),
('978-12-336', '19645788'),
('978-54-852', '30157855'),
('978-54-121', '49521755'),
('978-32-456', '54721499'),
('978-30-125', '54721499'),
('979-12-350', '49521755'); 

-- Visualizar todos los archivos de cada una de las tablas 
SELECT *
FROM Editorial;

SELECT * 
FROM autor;

SELECT * 
FROM cliente;

SELECT * 
FROM telefono_cliente; 

SELECT *
FROM libro;

SELECT * 
FROM libro_cliente;

SELECT * 
FROM libro_autor;

-- Consulta #1. Conocer el nombre y la fecha de nacimiento de cada escritor.
SELECT nombre AS "Nombre del escritor", fecha_de_nacimiento AS "Fecha de nacimiento"
FROM libreriabuscalibre.autor;

-- Consulta #2. Cantidad de libros diferentes vendidos. 
SELECT COUNT(DISTINCT ISBN_libro_cliente) AS "Cantidad de libros diferentes vendidos"
FROM libro_cliente;

-- Consulta #3. Nombre de su cliente acompañado de su número telefónico.
SELECT cliente.nombre AS "Nombre del cliente", telefono_cliente.numero AS "Número telefónico"
FROM cliente
INNER JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- Consulta #4. Nombre del libro acompañado por su autor o sus autores.
SELECT libro.titulo AS "Título del libro", autor.nombre AS "Nombre del autor"
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

-- Consulta #5. Nombre de las editoriales que han logrado vender libros.
SELECT DISTINCT nombre_editorial AS "Editoriales que han vendido libros"
FROM libro
INNER JOIN editorial ON editorial.nombre = libro.nombre_editorial
INNER JOIN libro_cliente ON libro_cliente.ISBN_libro_cliente = libro.ISBN;

-- Se crea una vista con los libros que ha comprado un cliente 
CREATE VIEW preferencia_cliente AS
SELECT cliente.nombre AS "Nombre del cliente", libro.titulo AS "Título del libro"
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN cliente ON cliente.cedula = libro_cliente.id_cliente;

SELECT *
FROM preferencia_cliente;

-- Se crea una vista con el nombre de las editoriales que han logrado vender libros 
CREATE VIEW vender_libros AS
SELECT DISTINCT nombre_editorial AS "Editoriales que han vendido libros"
FROM libro
INNER JOIN editorial ON editorial.nombre = libro.nombre_editorial
INNER JOIN libro_cliente ON libro_cliente.ISBN_libro_cliente = libro.ISBN;

SELECT *
FROM vender_libros;



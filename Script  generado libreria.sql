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

INSERT INTO `LibreriaBuscaLibre`.`autor` (`id`, `fecha_de_nacimiento`, `nacionalidad`, `nombre`) 
VALUES 
('A001', '01/01/1980', 'Español', 'Juan Pérez'),
('A002', '02/02/1985', 'Mexicano', 'María García'),
('A003', '03/03/1990', 'Argentino', 'Carlos Rodríguez'),
('A004', '04/04/1995', 'Colombiano', 'Sofía Martínez'),
('A005', '05/05/2000', 'Venezolano', 'José López');
SELECT *
FROM `LibreriaBuscaLibre`.`autor`;

INSERT INTO LibreriaBuscaLibre.Editorial (nombre, ciudad, complemento, Telefono)
VALUES ('Editorial A', 'Ciudad A', 'Complemento A', '555-555-5555'),
('Editorial B', 'Ciudad B', 'Complemento B', '555-555-5556'),
('Editorial C', 'Ciudad C', 'Complemento C', '555-555-5557'),
('Editorial D', 'Ciudad D', 'Complemento D', '555-555-5558');
SELECT *
FROM LibreriaBuscaLibre.Editorial;


INSERT INTO LibreriaBuscaLibre.libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES ('1234567890', 'Libro A', '200', 'Editorial A'),
('0987654', 'Libro B', '300', 'Editorial B'),
('1029381', 'Libro C', '400', 'Editorial C'),
('5432167', 'Libro D', '500', 'Editorial D'),
('67890ae', 'Libro E', '250', 'Editorial A'),
('abcdef1', 'Libro F', '350', 'Editorial B'),
('fghijkl', 'Libro G', '450', 'Editorial C'),
('qrstuvw', 'Libro H', '550', 'Editorial D'),
('7894561', 'Libro I', '275', 'Editorial A'),
('1597532', 'Libro J', '375', 'Editorial B'),
('1472583', 'Libro K', '475', 'Editorial C'),
('3692581', 'Libro L', '575', 'Editorial D'),
('2583691', 'Libro M', '225', 'Editorial A'),
('147058', 'Libro N', '325', 'Editorial B'),
('70258f6', 'Libro O', '425', 'Editorial C'),
('5836914', 'Libro P', '525', 'Editorial D'),
('3691470', 'Libro Q', '275', 'Editorial A'),
('1470258', 'Libro R', '375', 'Editorial B'),
('7025836', 'Libro S', '475', 'Editorial C'),
('5836919', 'Libro T', '575', 'Editorial D');
SELECT *
FROM LibreriaBuscaLibre.libro;


INSERT INTO `LibreriaBuscaLibre`.`libro_autor` (`ISBN_libro`, `id_autor`) VALUES
('5836919', 'A001'),
('7025836', 'A002'),
('1470258', 'A003'),
('3691470', 'A004'),
('5836914', 'A005'),
('70258f6', 'A001'),
('147058', 'A002'),
('3692581', 'A003'),
('2583691', 'A004'),
('1472583', 'A005');
SELECT *
FROM LibreriaBuscaLibre.libro_autor;


INSERT INTO `LibreriaBuscaLibre`.`cliente` (`cedula`, `nombre`)
VALUES 
("1000000000", "Juan"),
("2000000000", "María"),
("3000000000", "Pedro"),
("4000000000", "Sofía"),
("5000000000", "Carlos"),
("6000000000", "Ana"),
("7000000000", "Luis");
SELECT *
FROM `LibreriaBuscaLibre`.`cliente`;

INSERT INTO `LibreriaBuscaLibre`.`libro_cliente` (`ISBN_libro_cliente`, `id_cliente`) 
VALUES 
('5836919','1000000000'),
('7025836','2000000000'),
('1470258','3000000000'),
('3691470','4000000000'),
('5836914','5000000000'),
('70258f6','6000000000'),
('147058', '7000000000'),
('3692581','1000000000'),
('2583691','2000000000'),
('1472583','3000000000');
SELECT *
FROM `LibreriaBuscaLibre`.`libro_cliente`;

INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES
("1000000000", "555-555-1234"),
("1000000000", "555-555-2345"),
("2000000000", "555-555-3456"),
("2000000000", "555-555-4567"),
("3000000000", "555-555-5678"),
("4000000000", "555-555-6789"),
("5000000000", "555-555-7890"),
("6000000000", "555-555-8901"),
("7000000000", "555-555-9012"),
("4000000000", "555-555-0123"),
("7000000000", "555-555-1234"),
("6000000000", "555-555-2345");
SELECT *
FROM telefono_cliente;

-- -----------------------------------------------------
------#CONSULTAS  - El nombre y la fecha de nacimiento de cada escritor  -------------------------
-- -----------------------------------------------------
SELECT nombre, fecha_de_nacimiento FROM autor WHERE id='A001';
SELECT nombre, fecha_de_nacimiento FROM autor WHERE id='A002';
SELECT nombre, fecha_de_nacimiento FROM autor WHERE id='A003';
SELECT nombre, fecha_de_nacimiento FROM autor WHERE id='A004';
SELECT nombre, fecha_de_nacimiento FROM autor WHERE id='A005';

-- -----------------------------------------------------
------#CONSULTAS  - La cantidad de libros diferentes vendidos  -------------------------
-- -----------------------------------------------------

SELECT COUNT(DISTINCT ISBN) FROM libro;
SELECT COUNT(DISTINCT ISBN) FROM libro WHERE numero_paginas>'300';
SELECT COUNT(DISTINCT ISBN) FROM libro WHERE nombre_editorial='Editorial A';
SELECT COUNT(DISTINCT ISBN) FROM libro WHERE titulo LIKE '%Libro%';
SELECT COUNT(DISTINCT ISBN) FROM libro WHERE nombre_editorial='Editorial B' AND numero_paginas<'400';

-- -----------------------------------------------------
------#CONSULTAS  - El nombre de su cliente acompañado de su numero teléfonico  -------------------------
-- -----------------------------------------------------

SELECT c.nombre, t.numero
FROM cliente c
JOIN telefono_cliente t ON c.cedula = t.cedula_cliente;

SELECT c.nombre, GROUP_CONCAT(t.numero SEPARATOR ', ') AS numeros
FROM cliente c
JOIN telefono_cliente t ON c.cedula = t.cedula_cliente
GROUP BY c.nombre;

SELECT c.nombre, t.numero
FROM cliente c
LEFT JOIN telefono_cliente t ON c.cedula = t.cedula_cliente;

SELECT c.nombre, t.numero
FROM telefono_cliente t
JOIN cliente c ON t.cedula_cliente = c.cedula;

SELECT c.nombre, t.numero
FROM telefono_cliente t
RIGHT JOIN cliente c ON t.cedula_cliente = c.cedula;

-- -----------------------------------------------------
-- ----#CONSULTAS  - El nombre del libro acompañado por su autor o sus autores  ------------
-- -----------------------------------------------------

SELECT libro.titulo, autor.nombre
FROM LibreriaBuscaLibre.libro
JOIN LibreriaBuscaLibre.libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN LibreriaBuscaLibre.autor ON libro_autor.id_autor = autor.id;

-- -----------------------------------------------------
-- ----#CONSULTAS  -El nombre de las editoriales que han logrado vender libros  ------------
-- -----------------------------------------------------
SELECT DISTINCT nombre_editorial
FROM LibreriaBuscaLibre.libro;

-- -----------------------------------------------------
-- ----#CONSULTAS  -VISTAS que considero son las más importantes------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- ----#CONSULTAS  -VISTA de los libros y sus autores:------------
-- -----------------------------------------------------
CREATE VIEW vista_libros_autores AS
SELECT libro.titulo AS 'Título del libro', autor.nombre AS 'Nombre del autor'
FROM libro
INNER JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
INNER JOIN autor ON libro_autor.id_autor = autor.id;
SELECT * FROM vista_libros_autores;

-- -----------------------------------------------------
-- ----#CONSULTAS  -VISTA de los clientes y los libros que han comprado:------------
-- -----------------------------------------------------
CREATE VIEW vista_clientes_libros AS
SELECT cliente.nombre AS 'Nombre del cliente', libro.titulo AS 'Título del libro'
FROM cliente
INNER JOIN libro_cliente ON cliente.cedula = libro_cliente.id_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN;
SELECT * FROM vista_clientes_libros;


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

INSERT INTO autor (`id`,  `fecha de nacimiento` ,`nacionalidad`, `nombre`)
VALUES
    ('A001', '1980-01-01', 'Español', 'Juan García'),
    ('A002', '1985-05-12', 'Mexicano', 'María Rodríguez'),
    ('A003', '1990-03-20', 'Argentino', 'Pedro Pérez'),
    ('A004', '1995-07-15', 'Colombiano', 'Sofía García'),
    ('A005', '1988-09-10', 'Peruano', 'Carlos Rodríguez');


SELECT*
FROM autor;

INSERT INTO Editorial (nombre, ciudad, complemento, Telefono)
VALUES
    ('Editorial Planeta', 'Barcelona', 'Calle Falsa 123', '6013909541'),
    ('Editorial Santillana', 'Madrid', 'Avenida Principal 456', '6013909541'),
    ('Editorial Alfaguara', 'Santiago', 'Calle Secundaria 789', '6013909541'),
    ('Editorial Anaya', 'Madrid', 'Calle Mayor 123', '6013909541'),
    ('Editorial Norma', 'Bogotá', 'Carrera Principal 456', '6013909541');
SELECT *
FROM Editorial;

INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES
    ('L001', 'El Quijote de la Mancha', '500', 'Editorial Planeta'),
    ('L002', 'Don Juan Tenorio', '300', 'Editorial Santillana'),
    ('L003', 'La Celestina', '400', 'Editorial Alfaguara'),
    ('L004', 'La Ilíada', '450', 'Editorial Anaya'),
    ('L005', 'La Odisea', '500', 'Editorial Norma'),
    ('L006', 'Hamlet', '400', 'Editorial Planeta'),
    ('L007', 'Othello', '450', 'Editorial Santillana'),
    ('L008', 'Romeo y Julieta', '500', 'Editorial Alfaguara'),
    ('L009', 'Macbeth', '450', 'Editorial Anaya'),
    ('L010', 'La Divina Comedia', '450', 'Editorial Norma'),
    ('L011', 'Los Argonautas', '400', 'Editorial Planeta'),
    ('L012', 'La Isla del Tesoro', '300', 'Editorial Santillana'),
    ('L013', 'Matar a un ruiseñor', '450', 'Editorial Alfaguara'),
    ('L014', 'El Gran Gatsby', '400', 'Editorial Anaya'),
    ('L015', '1984', '450', 'Editorial Norma'),
    ('L016', 'Una tempestad', '450', 'Editorial Planeta'),
    ('L017', 'La Guerra y la Paz', '500', 'Editorial Santillana'),
    ('L018', 'Anna Karenina', '450', 'Editorial Alfaguara'),
    ('L019', 'Madame Bovary', '400', 'Editorial Anaya'),
    ('L020', 'El Lobo Estepario', '450', 'Editorial Norma');
    SELECT *
    FROM libro;
    
INSERT INTO cliente (cedula, nombre)
VALUES
("1234567890", "Paula Perez"),
("2345678901", "Sebas Rodriguez"),
("3456789012", "Carlos Cordoba"),
("4567890123", "Ana Meneses"),
("5678901234", "Luis Martinez"),
("6789012345", "Ana Díaz"),
("7890123456", "Sandro Ortiz"),
("8901234567", "Eva Jimenez");

SELECT *
FROM cliente;

INSERT INTO libro_cliente (ISBN_libro_cliente, id_cliente)
VALUES
("L001", "1234567890"),
("L002", "2345678901"),
("L003", "3456789012"),
("L013", "4567890123"),
("L014", "1234567890"),
("L020", "6789012345"),
("L009", "7890123456"),
("L011", "8901234567"),
("L006", "5678901234"),
("L010", "3456789012");
SELECT*
FROM libro_cliente;

INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES
("1234567890", "555-555-1212"),
("2345678901", "555-555-1213"),
("3456789012", "555-555-1214"),
("4567890123", "555-555-1215"),
("5678901234", "555-555-1216"),
("6789012345", "555-555-1217"),
("7890123456", "555-555-1218"),
("8901234567", "555-555-1219"),
("4567890123", "555-555-1220"),
("5678901234", "555-555-1221"),
("2345678901", "555-555-1222"),
("1234567890", "555-555-1223");
SELECT *
FROM telefono_cliente;

INSERT INTO libro_autor (ISBN_libro, id_autor)
VALUES
("L001", "A001"),
("L002", "A002"),
("L010", "A003"),
("L011", "A004"),
("L015", "A005"),
("L006", "A001"),
("L004", "A002"),
("L019", "A003"),
("L003", "A004"),
("L017", "A005");

-- consulta para ver el nombre del autor + su fecha de nacimiento 
SELECT *
FROM libro_autor;
-- consulta para 
SELECT `nombre`, `fecha de nacimiento`
FROM autor;

-- consulta para conocer la cantidad de libros vendidos diferentes
SELECT COUNT(DISTINCT ISBN_libro_cliente) as Cantidad_libros_diferentes
FROM libro_cliente;

-- consulta para conocer el nombre de su cliente acompañado de su numero teléfonico
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
INNER JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- consulta nombre del libro acompañado de su autor 
SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

-- consulta para ver el nombre de los editoriales que tienen libros vendidos 
SELECT distinct nombre
FROM libro
INNER JOIN editorial ON editorial.nombre = libro.nombre_editorial
INNER JOIN libro_cliente ON libro_cliente.ISBN_libro_cliente = libro.ISBN;


-- vista para  los libros mas comprados por los clientes
CREATE VIEW librosPreferencia_clientes AS
SELECT cliente.nombre, libro.titulo
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN cliente ON cliente.cedula = libro_cliente.id_cliente;

SELECT *
FROM librosPreferencia_clientes;

-- vista para los nombres de los libros con su respectivo autor
CREATE VIEW informacion_libro AS
SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

SELECT *
FROM informacion_libro;

-- procedimiento para agregar un resgitro de editoriales:
DELIMITER //
CREATE PROCEDURE AgregarEditorial(
  IN p_nombre VARCHAR(50),
  IN p_ciudad VARCHAR(30),
  IN p_complemento VARCHAR(100),
  IN p_telefono VARCHAR(20)
)
BEGIN
  INSERT INTO Editorial(nombre, ciudad, complemento, Telefono)
  VALUES(p_nombre, p_ciudad, p_complemento, p_telefono);
END //
DELIMITER ;

CALL AgregarEditorial('Colombina','Buenos Aires','edificio Santorini','5557896-1');

-- procedimiento para actualizar un resgitro de editoriales: 
DELIMITER //
CREATE PROCEDURE ActualizarEditorial(
  IN p_nombre VARCHAR(50),
  IN p_ciudad VARCHAR(30),
  IN p_complemento VARCHAR(100),
  IN p_telefono VARCHAR(20)
)
BEGIN
  UPDATE Editorial
  SET ciudad = p_ciudad, complemento = p_complemento, Telefono = p_telefono
  WHERE nombre = p_nombre;
END //
DELIMITER ;

CALL ActualizarEditorial('Colombina','Buenos Aires','edificio Santorini','5578960-2');

-- procedimiento para consultar un resgitro de editoriales: 
DELIMITER //
CREATE PROCEDURE ConsultarEditorial(
  IN p_nombre VARCHAR(50)
)
BEGIN
  SELECT * FROM Editorial
  WHERE nombre = p_nombre;
END //
DELIMITER ;

DROP procedure ConsultarEditorial;
CALL ConsultarEditorial('Colombina');

-- procedimiento para borrar un registro de editoriales :
DELIMITER //
CREATE PROCEDURE BorrarEditorial(
  IN p_nombre VARCHAR(50)
)
BEGIN
  DELETE FROM Editorial
  WHERE nombre = p_nombre;
END //
DELIMITER ;
CALL BorrarEditorial('Colombina');

-- Creo la tabla "control_de_cambios_librería"
CREATE TABLE control_de_cambios_librería (
  usuario VARCHAR(50),
  accion VARCHAR(10),
  fecha TIMESTAMP
);

-- Creo el primer trigger para insertar en la tabla de control cuando se agregue un registro
DELIMITER //
CREATE TRIGGER insertar_registro AFTER INSERT ON Editorial
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha) 
  VALUES (USER(), 'agregó', NOW());
END//
DELIMITER ;

-- Creo el segundo trigger para insertar en la tabla de control cuando se elimine un registro
DELIMITER //
CREATE TRIGGER eliminar_registro AFTER DELETE ON Editorial
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha) 
  VALUES (USER(), 'eliminó', NOW());
END//
DELIMITER ;

INSERT INTO Editorial (nombre, ciudad, complemento, Telefono)
VALUES('Editorial MiCasa', 'Cartagena', 'Calle  rio sur', '3225441023');


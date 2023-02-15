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
INSERT INTO `libreriabuscalibre`.`autor` (`id`, `FechaNacimiento`, `nacionalidad`, `nombre`) 
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
(7, "La Odisea", 250, "Editorial Minuto de DIOS"),
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
 
 -- Tabla LibroCliente
 
 INSERT INTO `libreriabuscalibre`.`libro_cliente` (`ISBN_libro_cliente`, `id_cliente`) 
 VALUES
('1', '1'),
('2', '1'),
('3', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('4', '5'),
('4', '6'),
('5', '6'),
('6', '7');

 -- Tabla Libro Autor
 
INSERT INTO `libreriabuscalibre`.`libro_autor` (`ISBN_libro`, `id_autor`) 
VALUES
 ('1', '1'),
 ('2', '1'),
 ('3', '2'),
 ('4', '2'),
 ('5', '3'),
 ('6', '3'),
 ('7', '4'),
 ('8', '4'),
 ('9', '5'),
 ('10', '5'),
 ('11', '1'),
 ('12', '1'),
 ('13', '1'),
 ('14', '2'),
 ('15', '2'),
 ('16', '3'),
 ('17', '3'),
 ('18', '4'),
 ('19', '4'),
 ('20', '5');
 
 
 -- Registros telefono_cliente 
 INSERT INTO `libreriabuscalibre`.`telefono_cliente` (`cedula_cliente`, `numero`)
 VALUES
 ('1', '1213231'),
 ('2', '13231321'),
 ('3', '123233'),
 ('4', '13231'),
 ('5', '12313132'),
 ('6', '132132'),
 ('7', '12331321'),
 ('7', '1321321'),
 ('1', '12123'),
 ('2', '123123331'),
 ('1', '132313'),
 ('2', '13213211');
 
 

 -- Consulta nombre y fecha de nacimiento de cada escritor
SELECT nombre, `fecha de nacimiento`
FROM LibreriaBuscaLibre.autor;


-- Titulo libro con su autor o autores 
-- Vistas TelefonosClienteVisualizar

CREATE VIEW VistaAutorLibro AS
SELECT titulo, GROUP_CONCAT(nombre SEPARATOR ', ') as autores
FROM libro
JOIN libro_autor
ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor
ON libro_autor.id_autor = autor.id
GROUP BY titulo;

-- 
SELECT DISTINCT nombre_editorial
FROM libro
JOIN libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente;

-- Cantidad de libros vendidos 
CREATE VIEW ComprasLibroDistintos AS 
SELECT count(DISTINCT ISBN_libro_cliente) AS "Contador de compras " FROM libro_cliente;

-- Nombre editoriales que han vendido libros 
SELECT DISTINCT libro.nombre_editorial AS "editorial"
FROM libro INNER JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente;

-- El nombre de su cliente acompañado de su número telefónico
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- Vistas TelefonosClienteVisualizar

CREATE VIEW TelefonoClientesVisualizar AS
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;



-- Procedimiento agregar usuario
DELIMITER //
CREATE PROCEDURE AgregarNuevoCliente ( IN CedulaLocal VARCHAR(10), IN NombreLocal VARCHAR(45))
BEGIN
    INSERT INTO cliente (cedula, nombre) VALUES (CedulaLocal, NombreLocal);
END//
DELIMITER ;

CALL AgregarNuevoCliente("10000000", "UsuarioParaAgregar");


-- Procedimiento actualizar cliente 
DELIMITER //
CREATE PROCEDURE ActualizarCliente (IN cedulaLocal VARCHAR(10),IN nombreLocal VARCHAR(45))
BEGIN
    UPDATE cliente SET nombre = nombreLocal WHERE cedula = cedulaLocal;
END//
DELIMITER ;
CALL ActualizarCliente('000000', 'Tortuguita');

-- Procedimiento para eliminar clientes 
DELIMITER //
CREATE PROCEDURE EliminarCliente (IN cedulaLocal VARCHAR(10))
BEGIN
    DELETE FROM cliente WHERE cedula = cedulaLocal;
END//
DELIMITER ;
CALL EliminarCliente('2');


DELIMITER //
CREATE PROCEDURE ConsultarCliente (IN cedulaLocal VARCHAR(10))
BEGIN
    SELECT * FROM cliente WHERE cedula = cedulaLocal;
END//
DELIMITER ;
CALL ConsultarCliente('7');


-- Tabla ControlCambiosLibreria 
CREATE TABLE IF NOT EXISTS ControlCambiosLibreria (
  usuario VARCHAR(45) NOT NULL,
  accion VARCHAR(10) NOT NULL,
  fecha DATETIME NOT NULL,
  PRIMARY KEY (usuario, accion, fecha));


-- Trigger  de insertar cliente
DELIMITER //
CREATE TRIGGER TriggerInsertarCliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO ControlCambiosLibreria (usuario, accion, fecha)
  VALUES (USER(), "Agregar", NOW());
END//
DELIMITER ;

-- Trigger de eliminar
DELIMITER //
CREATE TRIGGER TriggerEliminarClienye
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO ControlCambiosLibreria (usuario, accion, fecha)
  VALUES (USER(), "Eliminar", NOW());
END//
DELIMITER ;

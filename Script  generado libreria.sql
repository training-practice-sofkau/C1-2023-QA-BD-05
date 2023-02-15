
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

-- Se hace el registro de 5 autores 
INSERT INTO autor (id, fecha_de_nacimiento, nacionalidad, nombre)
VALUES ('1','6 de noviembre de 1934','Estadounidense','Carl Sagan'), ('2','8 de enero de 1942','Británico','Stephen Hawking'),
	   ('3','8 de abril de 1947','Estadounidense','Robert Kiyosaki'),('4','6 de marzo de 1927','Colombiano','Gabriel García Márquez'),
       ('5','15 de octubre de 1844','Aleman','Friedrich Nietzsche');

SELECT *
FROM autor;

-- Se hace el registro de 20 libros
INSERT INTO libro (ISBN, titulo, numero_paginas,nombre_editorial)
VALUES ('001','Contacto','432','Planeta'),('002','Cosmos','384','Alianza'),('003','El mundo y sus demonios','457','Babel Libros'),('004','Un punto azul pálido','448','Gamma'),
       ('005','Los dragones del Edén','263','Planeta'),
       
       ('006','Breve historia del tiempo','216','Alianza'),('007','La teoría del todo','152','Babel Libros'),('008','Breves respuestas a las grandes preguntas','288','Gamma'),
       ('009','El gran diseño','208','Planeta'),('010','El universo en una cáscara de nuez','256','Alianza'),
       
       ('011','Padre Rico, Padre Pobre','232','Babel Libros'),('012','El cuadrante del flujo de dinero','312','Gamma'),('013','Guía para invertir','672','Planeta'),
       ('014','Queremos que seas rico','416','Alianza'),('015','Fake','240','Babel Libros'),
       
       ('016','Cien años de soledad','496','Gamma'),('017','El amor en los tiempos del cóleras','461','Planeta'),
       
       ('018','Más allá del bien y del mal','302','Alianza'),('019','El Anticristo','124','Babel Libros'),('020','La gaya ciencia','260','Gamma');

SELECT *
FROM libro;

-- Se hace el registro de 7 clientes 
INSERT INTO cliente (cedula, nombre)
VALUES ('1010101010','Alejandro Mendez'),('2020202020','Bernardo López'),('3030303030','Carlos Ruiz'),('4040404040','César Morales'),     
	   ('5050505050','Eliza Saban'),('6060606060','Nancy Calderón'),('7070707070','Vicente Vásquez');
       
SELECT *
FROM cliente;

-- Se hace el registro de 4 editoriales
INSERT INTO editorial (nombre, ciudad, complemento, telefono)
VALUES ('Planeta','Bogota','Calle 73','6013909541'),('Alianza','Bogota','Carrera 6','6013909541'),
       ('Babel Libros','Bogota','Calle 39a','6013909541'),('Gamma','Bogota','Calle 85','6013909541');
       
SELECT *
FROM editorial;    

-- Se hace el registro de 10 libro_cliente que hace referencia a las ventas de libros.
INSERT INTO libro_cliente (ISBN_libro_cliente, id_cliente)  
VALUES ('001','1010101010'),('006','1010101010'),('011','2020202020'),('012','2020202020'),('012','3030303030'),('016','3030303030'),('018','4040404040'),('020','5050505050'),
	   ('013','6060606060'),('003','7070707070');
       
SELECT *
FROM libro_cliente;

-- Se hace el registro de 10 libro_autor.
INSERT INTO libro_autor (ISBN_libro, id_autor)
VALUES ('001','1'),('002','1'),('006','2'),('007','2'),('011','3'),('012','3'),('016','4'),('017','4'),('018','5'),('019','5');

SELECT *
FROM libro_autor;

-- Se hace el registro de 12 telefono_cliente  que hace referencia a los telefonos que tenga cada cliente.
INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES ('1010101010','+57 3001234567'),('2020202020','+57 3104567890'),('3030303030','+57 3207890123'),('4040404040','+57 3301234567'),
       ('5050505050','+57 3404567890'),('6060606060','+57 3507890123'),('7070707070','+57 3601234567'),('1010101010','+57 3001111111'),
	   ('2020202020','+57 3102222222'),('3030303030','+57 3203333333'),('4040404040','+57 3304444444'),('5050505050','+57 3405555555');

SELECT *
FROM telefono_cliente;

-- Consulta para conocer el nombre y la fecha de nacimiento de cada escritor,
SELECT nombre, fecha_de_nacimiento
FROM autor;

-- Consulta para conocer la cantidad de libros vendidos diferentes
SELECT COUNT(DISTINCT ISBN_libro_cliente) as Cantidad_libros_diferentes
FROM libro_cliente;

-- Consulta para conocer el nombre de su cliente acompañado de su numero teléfonico
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
INNER JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- Consulta para conocer el nombre del libro acompañado por su autor o sus autores
SELECT libro.titulo, autor.nombre
FROM libro
INNER JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
INNER JOIN autor ON libro_autor.id_autor = autor.id;

-- Consulta para conocer el nombre de las editoriales que han logrado vender libros.
SELECT DISTINCT nombre_editorial
FROM libro
INNER JOIN editorial ON editorial.nombre = libro.nombre_editorial
INNER JOIN libro_cliente ON libro_cliente.ISBN_libro_cliente = libro.ISBN;

-- Vista para ver los gustos de los clientes
CREATE VIEW gustos_clientes AS
SELECT cliente.nombre, libro.titulo
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN cliente ON cliente.cedula = libro_cliente.id_cliente;

SELECT *
FROM gustos_clientes;

-- Vista para buscar el contacto del cliente
CREATE VIEW contacto_cliente AS
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
INNER JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

SELECT *
FROM contacto_cliente;
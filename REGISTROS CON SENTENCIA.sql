-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema libreriabuscalibre
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema libreriabuscalibre
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libreriabuscalibre` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ingresos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `habilitado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble` (
  `idInmueble` VARCHAR(10) NOT NULL,
  `precio_propietario` VARCHAR(45) NOT NULL,
  `precio_venta` VARCHAR(45) NOT NULL,
  `precio_alquiler` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `disponibilidad` VARCHAR(45) NOT NULL,
  `fotos` VARCHAR(45) NOT NULL,
  `piso` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `estrato` VARCHAR(45) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `comuna` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInmueble`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Datos_inmobiliaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Datos_inmobiliaria` (
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `pagina_web` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asesor` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `salario` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `idCompra` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `idInmueble` VARCHAR(10) NULL,
  `nombre_datoss` VARCHAR(10) NULL,
  `cedula_asesor` VARCHAR(10) NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `idInmueble_idx` (`idInmueble` ASC) VISIBLE,
  INDEX `nombre_datoos_idx` (`nombre_datoss` ASC) VISIBLE,
  INDEX `cedula_asesor_idx` (`cedula_asesor` ASC) VISIBLE,
  CONSTRAINT `idInmueble`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_datoos`
    FOREIGN KEY (`nombre_datoss`)
    REFERENCES `mydb`.`Datos_inmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_asesor`
    FOREIGN KEY (`cedula_asesor`)
    REFERENCES `mydb`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler` (
  `idAlquiler` VARCHAR(10) NOT NULL,
  `fecha_inicio` VARCHAR(45) NOT NULL,
  `fecha_fin` VARCHAR(45) NOT NULL,
  `idInmueblee` VARCHAR(10) NULL,
  `nombre_datoss` VARCHAR(10) NULL,
  `cedula_asesoor` VARCHAR(10) NULL,
  PRIMARY KEY (`idAlquiler`),
  INDEX `idInmueblee_idx` (`idInmueblee` ASC) VISIBLE,
  INDEX `nombre_datoss_idx` (`nombre_datoss` ASC) VISIBLE,
  INDEX `cedula_asesoor_idx` (`cedula_asesoor` ASC) VISIBLE,
  CONSTRAINT `idInmueblee`
    FOREIGN KEY (`idInmueblee`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nombre_datoss`
    FOREIGN KEY (`nombre_datoss`)
    REFERENCES `mydb`.`Datos_inmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_asesoor`
    FOREIGN KEY (`cedula_asesoor`)
    REFERENCES `mydb`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InfoVisitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InfoVisitas` (
  `idInfoVisitas` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInfoVisitas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Propietario` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_cliente` (
  `cedula_clientte` VARCHAR(10) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_clientte`, `Telefono`),
  CONSTRAINT `cedula_clientte`
    FOREIGN KEY (`cedula_clientte`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_propietario` (
  `cedula_propietario` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_propietario`, `telefono`),
  CONSTRAINT `cedula_propietarioo`
    FOREIGN KEY (`cedula_propietario`)
    REFERENCES `mydb`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_datos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_datos` (
  `nombre_datos` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre_datos`, `telefono`),
  CONSTRAINT `nombre_datos`
    FOREIGN KEY (`nombre_datos`)
    REFERENCES `mydb`.`Datos_inmobiliaria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra_cliente` (
  `idCompraa` VARCHAR(10) NOT NULL,
  `cedula_clienteee` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idCompraa`, `cedula_clienteee`),
  INDEX `cedula_cliente_idx` (`cedula_clienteee` ASC) VISIBLE,
  CONSTRAINT `idCompraa`
    FOREIGN KEY (`idCompraa`)
    REFERENCES `mydb`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_clienteee`
    FOREIGN KEY (`cedula_clienteee`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquiler_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquiler_cliente` (
  `idAlquileer` VARCHAR(10) NOT NULL,
  `cedulaa_cliente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idAlquileer`, `cedulaa_cliente`),
  INDEX `cedulaa_cliente_idx` (`cedulaa_cliente` ASC) VISIBLE,
  CONSTRAINT `idAlquileer`
    FOREIGN KEY (`idAlquileer`)
    REFERENCES `mydb`.`Alquiler` (`idAlquiler`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedulaa_cliente`
    FOREIGN KEY (`cedulaa_cliente`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`visitas_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`visitas_cliente` (
  `idVisitas` VARCHAR(10) NOT NULL,
  `cedula_cliientee` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idVisitas`, `cedula_cliientee`),
  INDEX `cedula_clientee_idx` (`cedula_cliientee` ASC) VISIBLE,
  CONSTRAINT `idVisitas`
    FOREIGN KEY (`idVisitas`)
    REFERENCES `mydb`.`InfoVisitas` (`idInfoVisitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_cliientee`
    FOREIGN KEY (`cedula_cliientee`)
    REFERENCES `mydb`.`Cliente` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asesor_visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asesor_visitas` (
  `cedulaa_asesor` VARCHAR(10) NOT NULL,
  `idViisitas` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cedulaa_asesor`, `idViisitas`),
  INDEX `idViisitas_idx` (`idViisitas` ASC) VISIBLE,
  CONSTRAINT `cedulaa_asesor`
    FOREIGN KEY (`cedulaa_asesor`)
    REFERENCES `mydb`.`Asesor` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idViisitas`
    FOREIGN KEY (`idViisitas`)
    REFERENCES `mydb`.`InfoVisitas` (`idInfoVisitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble_visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble_visitas` (
  `idInnmueble` VARCHAR(10) NOT NULL,
  `idVisiitas` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idInnmueble`, `idVisiitas`),
  INDEX `idVisiitas_idx` (`idVisiitas` ASC) VISIBLE,
  CONSTRAINT `idInnmueble`
    FOREIGN KEY (`idInnmueble`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVisiitas`
    FOREIGN KEY (`idVisiitas`)
    REFERENCES `mydb`.`InfoVisitas` (`idInfoVisitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inmueble_propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inmueble_propietario` (
  `idInmueblle` VARCHAR(10) NOT NULL,
  `cedula_propietario` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idInmueblle`, `cedula_propietario`),
  INDEX `cedula_propietario_idx` (`cedula_propietario` ASC) VISIBLE,
  CONSTRAINT `idInmueblle`
    FOREIGN KEY (`idInmueblle`)
    REFERENCES `mydb`.`Inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_propietario`
    FOREIGN KEY (`cedula_propietario`)
    REFERENCES `mydb`.`Propietario` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `libreriabuscalibre` ;

-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`autor` (
  `id` VARCHAR(10) NOT NULL,
  `fecha_de_nacimiento` VARCHAR(45) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(20) NULL DEFAULT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`cliente` (
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`editorial` (
  `nombre` VARCHAR(50) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `complemento` VARCHAR(100) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL DEFAULT '6013909541',
  PRIMARY KEY (`nombre`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`libro` (
  `ISBN` VARCHAR(10) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_paginas` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_editorial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `nombre_editorial_idx` (`nombre_editorial` ASC) VISIBLE,
  CONSTRAINT `nombre_editorial`
    FOREIGN KEY (`nombre_editorial`)
    REFERENCES `libreriabuscalibre`.`editorial` (`nombre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`libro_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`libro_autor` (
  `ISBN_libro` VARCHAR(10) NOT NULL,
  `id_autor` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro`, `id_autor`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `id_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `libreriabuscalibre`.`autor` (`id`),
  CONSTRAINT `ISBN_libro`
    FOREIGN KEY (`ISBN_libro`)
    REFERENCES `libreriabuscalibre`.`libro` (`ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`libro_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`libro_cliente` (
  `ISBN_libro_cliente` VARCHAR(10) NOT NULL,
  `id_cliente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ISBN_libro_cliente`, `id_cliente`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `libreriabuscalibre`.`cliente` (`cedula`),
  CONSTRAINT `ISBN_libro_cliente`
    FOREIGN KEY (`ISBN_libro_cliente`)
    REFERENCES `libreriabuscalibre`.`libro` (`ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libreriabuscalibre`.`telefono_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `libreriabuscalibre`.`telefono_cliente` (
  `cedula_cliente` VARCHAR(10) NOT NULL,
  `numero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedula_cliente`, `numero`),
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `libreriabuscalibre`.`cliente` (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*REGISTRO AUTOR*/
INSERT INTO autor VALUES
("1", "12/5/1983", "colombiana", "Carlos");
INSERT INTO autor VALUES
("2", "5/5/1993", "venezolano", "Mauricio");
INSERT INTO autor VALUES
("3", "16/5/1973", "colombiana", "Isabel");
INSERT INTO autor VALUES
("4", "2/10/1977", "españolka", "Laura");
INSERT INTO autor VALUES
("5", "22/6/1988", "colombiana", "Diego");

/*REGISTRO EDITORIAL*/
INSERT INTO editorial VALUES
("EL LIBRO", "MEDELLIN", "52-30", "4444545");
INSERT INTO editorial VALUES
("LUNA AZUL", "BOGOTA", "43-20", "4446567");
INSERT INTO editorial VALUES
("LA PERLA", "MEDELLIN", "44-50", "4444545");
INSERT INTO editorial VALUES
("ICONO", "MEDELLIN", "22-33", "4442222");

/*REGISTRO LIBRO*/
INSERT INTO libro VALUES
("11", "EL PRINCIPITO", "120", "EL LIBRO");
INSERT INTO libro VALUES
("12", "LA OJARAZCA", "62", "LA PERLA");
INSERT INTO libro VALUES
("13", "LA MARQUEZA", "546", "ICONO");
INSERT INTO libro VALUES
("14", "EL PATRIARCA", "654", "EL LIBRO");
INSERT INTO libro VALUES
("15", "PEDRO PARAMO", "354", "EL LIBRO");
INSERT INTO libro VALUES
("16", "ME ALQUILO PARA SOÑAR", "32", "ICONO");
INSERT INTO libro VALUES
("17", "20MIL LEGUAS DE VIAJE SUBMARINO", "766", "EL LIBRO");
INSERT INTO libro VALUES
("18", "LA VUELTA AL MUNDO", "678", "EL LIBRO");
INSERT INTO libro VALUES
("19", "MARIA", "234", "LUNA AZUL");
INSERT INTO libro VALUES
("20", "EL OTRO CIELO", "876", "EL LIBRO");
INSERT INTO libro VALUES
("21", "100 AÑOS DE SOLEDAD", "343", "EL LIBRO");
INSERT INTO libro VALUES
("22", "TESTIGOS", "76", "EL LIBRO");
INSERT INTO libro VALUES
("23", "UNA FLOR AMARILLA", "987", "LUNA AZUL");
INSERT INTO libro VALUES
("24", "EL TERRESTRE", "434", "EL LIBRO");
INSERT INTO libro VALUES
("25", "LA ASOMADERA", "654", "ICONO");
INSERT INTO libro VALUES
("26", "EL PERFUME", "876", "ICONO");
INSERT INTO libro VALUES
("27", "NO OYES", "987", "EL LIBRO");
INSERT INTO libro VALUES
("28", "LADRAS LOS PERROS", "324", "LA PERLA");
INSERT INTO libro VALUES
("29", "SALVADOR GAVIOTA", "657", "LA PERLA");
INSERT INTO libro VALUES
("30", "LLANO EN LLAMAS", "876", "EL LIBRO");

/*REGISTROS CLIENTE*/
INSERT INTO cliente VALUES
("4356765", "CARLOS LOPEZ");
INSERT INTO cliente VALUES
("4356457", "MONICA PEREZ");
INSERT INTO cliente VALUES
("4435456", "MAURICIO ROJAS");
INSERT INTO cliente VALUES
("4432567", "MAICOL TORRES");
INSERT INTO cliente VALUES
("4432456", "LAUDY PAEZ");
INSERT INTO cliente VALUES
("4356453", "ANA COLORADO");

/*REGISTROS LIBRO CLIENTE*/
INSERT INTO libro_cliente VALUES
("11", "4356765");
INSERT INTO libro_cliente VALUES
("21", "4435456");
INSERT INTO libro_cliente VALUES
("12", "4356457");
INSERT INTO libro_cliente VALUES
("22", "4435456");
INSERT INTO libro_cliente VALUES
("13", "4356453");
INSERT INTO libro_cliente VALUES
("23", "4432456");
INSERT INTO libro_cliente VALUES
("14", "4435456");
INSERT INTO libro_cliente VALUES
("24", "4432456");
INSERT INTO libro_cliente VALUES
("15", "4356457");
INSERT INTO libro_cliente VALUES
("25", "4356457");

/*REGISTROS LIBRO AUTOR*/

INSERT INTO libro_autor VALUES
("11", "1");
INSERT INTO libro_autor VALUES
("21", "1");
INSERT INTO libro_autor VALUES
("12", "1");
INSERT INTO libro_autor VALUES
("22", "1");
INSERT INTO libro_autor VALUES
("13", "1");
INSERT INTO libro_autor VALUES
("23", "1");
INSERT INTO libro_autor VALUES
("14", "1");
INSERT INTO libro_autor VALUES
("24", "1");
INSERT INTO libro_autor VALUES
("15", "1");
INSERT INTO libro_autor VALUES
("25", "1");
INSERT INTO libro_autor VALUES
("26", "5");
INSERT INTO libro_autor VALUES
("27", "4");
INSERT INTO libro_autor VALUES
("28", "3");
INSERT INTO libro_autor VALUES
("29", "2");

/*REGISTROS TELEFONO CLIENTE*/

INSERT INTO telefono_cliente VALUES
("4356765", "4445665");
INSERT INTO telefono_cliente VALUES
("4356765", "4445434");
INSERT INTO telefono_cliente VALUES
("4356765", "4332234");
INSERT INTO telefono_cliente VALUES
("4356457", "4445643");
INSERT INTO telefono_cliente VALUES
("4356457", "4334532");
INSERT INTO telefono_cliente VALUES
("4435456", "4434532");
INSERT INTO telefono_cliente VALUES
("4432567", "4334543");
INSERT INTO telefono_cliente VALUES
("4432456", "4468976");
INSERT INTO telefono_cliente VALUES
("4432456", "4456787");
INSERT INTO telefono_cliente VALUES
("4432567", "4435678");
INSERT INTO telefono_cliente VALUES
("4356453", "4332254");
INSERT INTO telefono_cliente VALUES
("4356453", "2223454");
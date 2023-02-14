-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospital` DEFAULT CHARACTER SET utf8 ;
USE `Hospital` ;

-- -----------------------------------------------------
-- Table `Hospital`.`procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`procedimiento` (
  `id_procedimiento` VARCHAR(15) NOT NULL,
  `tipo_procedimiento` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_procedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Paciente` (
  `cedula_paciente` VARCHAR(15) NOT NULL,
  `nombre_paciente` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `iden_procedimiento` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cedula_paciente`),
  INDEX `id_procedimiento_paciente_idx` (`iden_procedimiento` ASC) VISIBLE,
  CONSTRAINT `id_procedimiento_paciente`
    FOREIGN KEY (`iden_procedimiento`)
    REFERENCES `Hospital`.`procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_paciente` (
  `ced_paciente` VARCHAR(15) NOT NULL,
  `telefono_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ced_paciente`, `telefono_paciente`),
  CONSTRAINT `ced_paciente_telefno`
    FOREIGN KEY (`ced_paciente`)
    REFERENCES `Hospital`.`Paciente` (`cedula_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`medicamento` (
  `id_medicamento` VARCHAR(15) NOT NULL,
  `nombre_medicamento` VARCHAR(60) NOT NULL,
  `dosis` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`paciente_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`paciente_medicamento` (
  `identifi_medicamento` VARCHAR(15) NOT NULL,
  `cedula_Paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`identifi_medicamento`, `cedula_Paciente`),
  INDEX `ced_paciente_medicamento_idx` (`cedula_Paciente` ASC) VISIBLE,
  CONSTRAINT `identificador_medicamento`
    FOREIGN KEY (`identifi_medicamento`)
    REFERENCES `Hospital`.`medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ced_paciente_medicamento`
    FOREIGN KEY (`cedula_Paciente`)
    REFERENCES `Hospital`.`Paciente` (`cedula_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`factura` (
  `id_factura` VARCHAR(15) NOT NULL,
  `fecha` VARCHAR(20) NOT NULL,
  `valor_Total` VARCHAR(20) NOT NULL,
  `ced_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `ced_paciente_factura_idx` (`ced_paciente` ASC) VISIBLE,
  CONSTRAINT `ced_paciente_factura`
    FOREIGN KEY (`ced_paciente`)
    REFERENCES `Hospital`.`Paciente` (`cedula_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`medico` (
  `cedula_medico` VARCHAR(15) NOT NULL,
  `nombres_medico` VARCHAR(60) NOT NULL,
  `apellidos_medico` VARCHAR(60) NOT NULL,
  `especialidad` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`cedula_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`procedimiento_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`procedimiento_medico` (
  `ident_procedimiento` VARCHAR(15) NOT NULL,
  `cedula_medico` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ident_procedimiento`, `cedula_medico`),
  INDEX `cedula_medico_procedimiento_idx` (`cedula_medico` ASC) VISIBLE,
  CONSTRAINT `identificador_procedimiento`
    FOREIGN KEY (`ident_procedimiento`)
    REFERENCES `Hospital`.`procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_medico_procedimiento`
    FOREIGN KEY (`cedula_medico`)
    REFERENCES `Hospital`.`medico` (`cedula_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_medico` (
  `ced_medico` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ced_medico`, `telefono`),
  CONSTRAINT `ced_medico_tel`
    FOREIGN KEY (`ced_medico`)
    REFERENCES `Hospital`.`medico` (`cedula_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`enfermero` (
  `cedula_enfermero` VARCHAR(15) NOT NULL,
  `nombres_enfermero` VARCHAR(60) NOT NULL,
  `apellidos_enfermero` VARCHAR(60) NOT NULL,
  `id_medico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_enfermero`),
  INDEX `id_medico_enfermero_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `id_medico_enfermero`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Hospital`.`medico` (`cedula_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_enfermero` (
  `ced_enfermero` VARCHAR(15) NOT NULL,
  `telefono_enfermero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ced_enfermero`, `telefono_enfermero`),
  CONSTRAINT `ced_enfermero_telef`
    FOREIGN KEY (`ced_enfermero`)
    REFERENCES `Hospital`.`enfermero` (`cedula_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

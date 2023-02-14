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
-- Table `Hospital`.`tb_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_procedimiento` (
  `id_procedimiento` VARCHAR(45) NOT NULL,
  `tipo_procedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_procedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`tb_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_paciente` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `nombre_paciente` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `id_procedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  INDEX `id_procedimiento_paciente_idx` (`id_procedimiento` ASC) VISIBLE,
  CONSTRAINT `id_procedimiento_paciente`
    FOREIGN KEY (`id_procedimiento`)
    REFERENCES `Hospital`.`tb_procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_paciente` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  CONSTRAINT `id_paciente_telefono`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `Hospital`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`tb_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_factura` (
  `id_factura` VARCHAR(45) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `valor_total` VARCHAR(45) NOT NULL,
  `id_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `id_paciente_factura_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `id_paciente_factura`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `Hospital`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`tb_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_medicamento` (
  `id_medicamento` VARCHAR(45) NOT NULL,
  `nombre_medicamento` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`tb_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_medico` (
  `id_medico` VARCHAR(15) NOT NULL,
  `nombre_medico` VARCHAR(45) NOT NULL,
  `apellido_medico` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`dll_medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`dll_medico_procedimiento` (
  `id_medico_procedimiento` VARCHAR(45) NOT NULL,
  `id_medico` VARCHAR(15) NOT NULL,
  `id_procedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico_procedimiento`),
  INDEX `id_procedimiento_procedimiento_idx` (`id_procedimiento` ASC) VISIBLE,
  INDEX `id_medico_medico_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `id_procedimiento_procedimiento`
    FOREIGN KEY (`id_procedimiento`)
    REFERENCES `Hospital`.`tb_procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medico_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Hospital`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`dll_paciente_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`dll_paciente_medicamento` (
  `id_paciente_medicamento` VARCHAR(45) NOT NULL,
  `id_paciente` VARCHAR(15) NOT NULL,
  `id_medicamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente_medicamento`),
  INDEX `id_paciente_medicamento_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `id_medicamento_paciente_idx` (`id_medicamento` ASC) VISIBLE,
  CONSTRAINT `id_paciente_medicamento_fk`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `Hospital`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medicamento_paciente`
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `Hospital`.`tb_medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_medico` (
  `id_medico` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`),
  CONSTRAINT `id_medico_telefono`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Hospital`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`tb_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`tb_enfermero` (
  `id_enfermero` VARCHAR(15) NOT NULL,
  `nombre_enfermero` VARCHAR(45) NOT NULL,
  `apellido_enfermero` VARCHAR(45) NOT NULL,
  `id_medico` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  INDEX `id_medico_enfermero_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `id_medico_enfermero`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Hospital`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_enfermero` (
  `id_enfermero` VARCHAR(15) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  CONSTRAINT `id_enfermero_telefono`
    FOREIGN KEY (`id_enfermero`)
    REFERENCES `Hospital`.`tb_enfermero` (`id_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

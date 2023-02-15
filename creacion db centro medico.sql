-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema procedimiento_medico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema procedimiento_medico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `procedimiento_medico` DEFAULT CHARACTER SET utf8 ;
USE `procedimiento_medico` ;

-- -----------------------------------------------------
-- Table `procedimiento_medico`.`enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`enfermero` (
  `id_enfermero` VARCHAR(15) NOT NULL,
  `nombre_enfermero` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`id_enfermero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`contacto_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`contacto_enfermero` (
  `id_enfermero` VARCHAR(15) NOT NULL,
  `telefono_enfermero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  CONSTRAINT `idenfermero_contacto`
    FOREIGN KEY (`id_enfermero`)
    REFERENCES `procedimiento_medico`.`enfermero` (`id_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`medico` (
  `id_medico` VARCHAR(15) NOT NULL,
  `nombre_medico` VARCHAR(65) NOT NULL,
  `especialidad_medico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`contacto_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`contacto_medico` (
  `id_medico` VARCHAR(15) NOT NULL,
  `telefono_medico` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_medico`),
  CONSTRAINT `idmedico_contacto`
    FOREIGN KEY (`id_medico`)
    REFERENCES `procedimiento_medico`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`paciente` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `nombre_paciente` VARCHAR(65) NOT NULL,
  `direccion_paciente` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`procedimiento` (
  `id_procedimiento` VARCHAR(15) NOT NULL,
  `tipo_procedimiento` VARCHAR(45) NOT NULL,
  `id_medico` VARCHAR(15) NOT NULL,
  `id_enfermero` VARCHAR(15) NOT NULL,
  `id_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_procedimiento`),
  INDEX `idmedico_procedimiento_idx` (`id_medico` ASC) VISIBLE,
  INDEX `idenfermero_procedimiento_idx` (`id_enfermero` ASC) VISIBLE,
  INDEX `idpaciente_procedimiento_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `idmedico_procedimiento`
    FOREIGN KEY (`id_medico`)
    REFERENCES `procedimiento_medico`.`medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idenfermero_procedimiento`
    FOREIGN KEY (`id_enfermero`)
    REFERENCES `procedimiento_medico`.`enfermero` (`id_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idpaciente_procedimiento`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `procedimiento_medico`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`medicamento` (
  `id_medicamento` VARCHAR(15) NOT NULL,
  `nombre_medicamento` VARCHAR(65) NOT NULL,
  `dosis_medicamento` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`receta_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`receta_medicamento` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `id_medicamento` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_paciente`, `id_medicamento`),
  INDEX `idmedicamento_receta_idx` (`id_medicamento` ASC) VISIBLE,
  CONSTRAINT `idpaciente_receta`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `procedimiento_medico`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmedicamento_receta`
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `procedimiento_medico`.`medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`factura` (
  `id_factura` VARCHAR(15) NOT NULL,
  `fecha_factura` DATETIME NOT NULL,
  `valor_total_factura` VARCHAR(10) NOT NULL,
  `id_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `idpaciente_factura_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `idpaciente_factura`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `procedimiento_medico`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `procedimiento_medico`.`contacto_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `procedimiento_medico`.`contacto_paciente` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `telefono_paciente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  CONSTRAINT `idpaciente_contacto`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `procedimiento_medico`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

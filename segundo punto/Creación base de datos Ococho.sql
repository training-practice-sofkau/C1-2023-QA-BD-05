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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento` (
  `idMedicamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `dosis` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`procedimiento` (
  `idProcedimiento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idProcedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `idProcedimiento_paciente` INT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `idProcedimiento_paciente_idx` (`idProcedimiento_paciente` ASC) VISIBLE,
  CONSTRAINT `idProcedimiento_paciente`
    FOREIGN KEY (`idProcedimiento_paciente`)
    REFERENCES `mydb`.`procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicamento_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento_paciente` (
  `idMedicamento_paciente` INT NOT NULL,
  `idPaciente_medicamento` INT NOT NULL,
  PRIMARY KEY (`idMedicamento_paciente`, `idPaciente_medicamento`),
  INDEX `idPaciente_medicamento_idx` (`idPaciente_medicamento` ASC) VISIBLE,
  CONSTRAINT `idMedicamento_paciente`
    FOREIGN KEY (`idMedicamento_paciente`)
    REFERENCES `mydb`.`medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPaciente_medicamento`
    FOREIGN KEY (`idPaciente_medicamento`)
    REFERENCES `mydb`.`paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_paciente` (
  `idtelefono_paciente` INT NOT NULL,
  `telefono_paciente` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idtelefono_paciente`, `telefono_paciente`),
  CONSTRAINT `idtelefono_paciente`
    FOREIGN KEY (`idtelefono_paciente`)
    REFERENCES `mydb`.`paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`factura` (
  `idfactura` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `valorTotal` VARCHAR(9) NULL,
  `idPaciente_factura` INT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `idPaciente_factura_idx` (`idPaciente_factura` ASC) VISIBLE,
  CONSTRAINT `idPaciente_factura`
    FOREIGN KEY (`idPaciente_factura`)
    REFERENCES `mydb`.`paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `especialidad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idmedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_telefono` (
  `idmedico_telefono` INT NOT NULL,
  `medico_telefono` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idmedico_telefono`, `medico_telefono`),
  CONSTRAINT `idmedico_telefono`
    FOREIGN KEY (`idmedico_telefono`)
    REFERENCES `mydb`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_procedimiento` (
  `idmedico_procedimiento` INT NOT NULL,
  `idprocedimiento_medico` INT NOT NULL,
  PRIMARY KEY (`idmedico_procedimiento`, `idprocedimiento_medico`),
  INDEX `idprocedimiento_medico_idx` (`idprocedimiento_medico` ASC) VISIBLE,
  CONSTRAINT `idmedico_procedimiento`
    FOREIGN KEY (`idmedico_procedimiento`)
    REFERENCES `mydb`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idprocedimiento_medico`
    FOREIGN KEY (`idprocedimiento_medico`)
    REFERENCES `mydb`.`procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enfermero` (
  `idenfermero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `idMedico_enfermero` INT NULL,
  PRIMARY KEY (`idenfermero`),
  INDEX `idEnfermero_medico_idx` (`idMedico_enfermero` ASC) VISIBLE,
  CONSTRAINT `idEnfermero_medico`
    FOREIGN KEY (`idMedico_enfermero`)
    REFERENCES `mydb`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enfermero_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enfermero_telefono` (
  `idenfermero_telefono` INT NOT NULL,
  `telefono_enfermero` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`idenfermero_telefono`, `telefono_enfermero`),
  CONSTRAINT `idenfermero_telefono`
    FOREIGN KEY (`idenfermero_telefono`)
    REFERENCES `mydb`.`enfermero` (`idenfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

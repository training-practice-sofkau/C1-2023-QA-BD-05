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
-- Table `Hospital`.`Procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Procedimiento` (
  `idProcedimiento` VARCHAR(10) NOT NULL,
  `TipoProcedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProcedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Paciente` (
  `idPaciente` VARCHAR(10) NOT NULL,
  `Nombre_Paciente` VARCHAR(45) NOT NULL,
  `Apellido_Paciente` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ID_Procedimiento_paciente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `ID_Procedimiento_paciente_idx` (`ID_Procedimiento_paciente` ASC) VISIBLE,
  CONSTRAINT `ID_Procedimiento_paciente`
    FOREIGN KEY (`ID_Procedimiento_paciente`)
    REFERENCES `Hospital`.`Procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`factura` (
  `idfactura` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `valor_total` VARCHAR(45) NOT NULL,
  `ID_Paciente_factura` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `ID_Paciente_factura_idx` (`ID_Paciente_factura` ASC) VISIBLE,
  CONSTRAINT `ID_Paciente_factura`
    FOREIGN KEY (`ID_Paciente_factura`)
    REFERENCES `Hospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`telefono_paciente` (
  `idtelefono_paciente` VARCHAR(10) NOT NULL,
  `telefonos_paciente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idtelefono_paciente`, `telefonos_paciente`),
  CONSTRAINT `idtelefono_paciente`
    FOREIGN KEY (`idtelefono_paciente`)
    REFERENCES `Hospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Medicamento` (
  `idMedicamento` VARCHAR(10) NOT NULL,
  `nombre_Medicamento` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Paciente_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Paciente_Medicamento` (
  `ID_Paciente_Medicamento` VARCHAR(10) NOT NULL,
  `ID_Medicamento_Paciente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_Paciente_Medicamento`, `ID_Medicamento_Paciente`),
  INDEX `ID_Medicamento_Paciente_idx` (`ID_Medicamento_Paciente` ASC) VISIBLE,
  CONSTRAINT `ID_Paciente_Medicamento`
    FOREIGN KEY (`ID_Paciente_Medicamento`)
    REFERENCES `Hospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Medicamento_Paciente`
    FOREIGN KEY (`ID_Medicamento_Paciente`)
    REFERENCES `Hospital`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Medico` (
  `idMedico` VARCHAR(10) NOT NULL,
  `Nombre_Medico` VARCHAR(45) NOT NULL,
  `apellido_medico` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`medico_procedimiento` (
  `ID_Medico_Procedimiento` VARCHAR(10) NOT NULL,
  `ID_Procedimiento_medico` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_Medico_Procedimiento`, `ID_Procedimiento_medico`),
  INDEX `ID_Procedimiento_medico_idx` (`ID_Procedimiento_medico` ASC) VISIBLE,
  CONSTRAINT `ID_Medico_Procedimiento`
    FOREIGN KEY (`ID_Medico_Procedimiento`)
    REFERENCES `Hospital`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_Procedimiento_medico`
    FOREIGN KEY (`ID_Procedimiento_medico`)
    REFERENCES `Hospital`.`Procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Enfermero` (
  `idEnfermero` VARCHAR(10) NOT NULL,
  `Nombre_Enfermero` VARCHAR(45) NOT NULL,
  `Apellido_Enfermero` VARCHAR(45) NOT NULL,
  `ID_Medico_Asignado` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idEnfermero`),
  INDEX `ID_Medico_Asignado_idx` (`ID_Medico_Asignado` ASC) VISIBLE,
  CONSTRAINT `ID_Medico_Asignado`
    FOREIGN KEY (`ID_Medico_Asignado`)
    REFERENCES `Hospital`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Telefono_Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Telefono_Enfermero` (
  `idTelefono_Enfermero` VARCHAR(10) NOT NULL,
  `Telefonos_Enfermero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTelefono_Enfermero`, `Telefonos_Enfermero`),
  CONSTRAINT `idTelefono_Enfermero`
    FOREIGN KEY (`idTelefono_Enfermero`)
    REFERENCES `Hospital`.`Enfermero` (`idEnfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hospital`.`Telefono_Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Telefono_Medico` (
  `idTelefono_Medico` VARCHAR(10) NOT NULL,
  `Telefonos_Medico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTelefono_Medico`, `Telefonos_Medico`),
  CONSTRAINT `idTelefono_Medico`
    FOREIGN KEY (`idTelefono_Medico`)
    REFERENCES `Hospital`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

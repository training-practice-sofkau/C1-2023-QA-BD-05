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
-- Table `mydb`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico` (
  `id_Medico` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Procedimiento` (
  `id_Procedimiento` VARCHAR(45) NOT NULL,
  `tipo_procedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Procedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Procedimiento_has_Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Procedimiento_has_Medico` (
  `Procedimiento_id_Procedimiento` VARCHAR(45) NOT NULL,
  `Medico_id_Medico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Procedimiento_id_Procedimiento`, `Medico_id_Medico`),
  INDEX `fk_Procedimiento_has_Medico_Medico1_idx` (`Medico_id_Medico` ASC) VISIBLE,
  INDEX `fk_Procedimiento_has_Medico_Procedimiento_idx` (`Procedimiento_id_Procedimiento` ASC) VISIBLE,
  CONSTRAINT `fk_Procedimiento_has_Medico_Procedimiento`
    FOREIGN KEY (`Procedimiento_id_Procedimiento`)
    REFERENCES `mydb`.`Procedimiento` (`id_Procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Procedimiento_has_Medico_Medico1`
    FOREIGN KEY (`Medico_id_Medico`)
    REFERENCES `mydb`.`Medico` (`id_Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `id_Paciente` VARCHAR(45) NOT NULL,
  `nombre_paciente` VARCHAR(45) NOT NULL,
  `apellido_paciente` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Id_Procedimiento_FK` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Paciente`, `Id_Procedimiento_FK`),
  INDEX `Id_Procedimiento_FK_idx` (`Id_Procedimiento_FK` ASC) VISIBLE,
  CONSTRAINT `Id_Procedimiento_FK`
    FOREIGN KEY (`Id_Procedimiento_FK`)
    REFERENCES `mydb`.`Procedimiento` (`id_Procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_paciente` (
  `Telefono` VARCHAR(20) NOT NULL,
  `Id_Paciente_Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Telefono`, `Id_Paciente_Telefono`),
  INDEX `Id_Paciente_FK_idx` (`Id_Paciente_Telefono` ASC) VISIBLE,
  CONSTRAINT `Id_Paciente_Telefono`
    FOREIGN KEY (`Id_Paciente_Telefono`)
    REFERENCES `mydb`.`Paciente` (`id_Paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Factura` (
  `id_Factura` VARCHAR(45) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `Valor_total` VARCHAR(45) NOT NULL,
  `Id_Paciente_Factura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Factura`),
  INDEX `Id_Paciente_FK_idx` (`Id_Paciente_Factura` ASC) VISIBLE,
  CONSTRAINT `Id_Paciente_Factura`
    FOREIGN KEY (`Id_Paciente_Factura`)
    REFERENCES `mydb`.`Paciente` (`id_Paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento` (
  `id_Medicamento` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento_has_Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento_has_Paciente` (
  `Medicamento_id_Medicamento` VARCHAR(45) NOT NULL,
  `Paciente_id_Paciente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Medicamento_id_Medicamento`, `Paciente_id_Paciente`),
  INDEX `fk_Medicamento_has_Paciente_Paciente1_idx` (`Paciente_id_Paciente` ASC) VISIBLE,
  INDEX `fk_Medicamento_has_Paciente_Medicamento1_idx` (`Medicamento_id_Medicamento` ASC) VISIBLE,
  CONSTRAINT `fk_Medicamento_has_Paciente_Medicamento1`
    FOREIGN KEY (`Medicamento_id_Medicamento`)
    REFERENCES `mydb`.`Medicamento` (`id_Medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamento_has_Paciente_Paciente1`
    FOREIGN KEY (`Paciente_id_Paciente`)
    REFERENCES `mydb`.`Paciente` (`id_Paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_Medico` (
  `Telefono` VARCHAR(20) NOT NULL,
  `Id_Medico_Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Telefono`, `Id_Medico_Telefono`),
  INDEX `Id_Medico_FK_idx` (`Id_Medico_Telefono` ASC) VISIBLE,
  CONSTRAINT `Id_Medico_Telefono`
    FOREIGN KEY (`Id_Medico_Telefono`)
    REFERENCES `mydb`.`Medico` (`id_Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermero` (
  `id_Enfermero` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Id_Medico_FK` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Enfermero`, `Id_Medico_FK`),
  INDEX `Id_Medico_FK_idx` (`Id_Medico_FK` ASC) VISIBLE,
  CONSTRAINT `Id_Medico_FK`
    FOREIGN KEY (`Id_Medico_FK`)
    REFERENCES `mydb`.`Medico` (`id_Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono_Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono_Enfermero` (
  `Telefono` VARCHAR(45) NOT NULL,
  `Id_Enfermero_FK` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Telefono`, `Id_Enfermero_FK`),
  INDEX `Id_Enfermero_FK_idx` (`Id_Enfermero_FK` ASC) VISIBLE,
  CONSTRAINT `Id_Enfermero_FK`
    FOREIGN KEY (`Id_Enfermero_FK`)
    REFERENCES `mydb`.`Enfermero` (`id_Enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

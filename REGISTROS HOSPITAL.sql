-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`Procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Procedimiento` (
  `id` VARCHAR(10) NOT NULL,
  `tipo_procedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Paciente` (
  `id` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `id_procedimiento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_proceediimiento_idx` (`id_procedimiento` ASC) VISIBLE,
  CONSTRAINT `id_proceediimiento`
    FOREIGN KEY (`id_procedimiento`)
    REFERENCES `hospital`.`Procedimiento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Factura` (
  `id` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `valor_total` VARCHAR(45) NOT NULL,
  `id_paciente` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_paciiente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `id_paciiente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Medicamento` (
  `id` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `dosis` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Medico` (
  `id` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apallido` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Enfermero` (
  `id` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `id_medico` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `iid_medico_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `iid_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`Medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Telefono_paciente` (
  `id_paciente` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`, `telefono`),
  CONSTRAINT `id_paaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Paciente_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Paciente_medicamento` (
  `id_paciente` VARCHAR(10) NOT NULL,
  `id_medicamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`, `id_medicamento`),
  INDEX `id_mediicamento_idx` (`id_medicamento` ASC) VISIBLE,
  CONSTRAINT `id_paacientee`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `hospital`.`Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_mediicamento`
    FOREIGN KEY (`id_medicamento`)
    REFERENCES `hospital`.`Medicamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Medico_procedimiento` (
  `id_medico` VARCHAR(10) NOT NULL,
  `id_procedimiento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_medico`, `id_procedimiento`),
  INDEX `id_proceedimiento_idx` (`id_procedimiento` ASC) VISIBLE,
  CONSTRAINT `id_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`Medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_proceedimiento`
    FOREIGN KEY (`id_procedimiento`)
    REFERENCES `hospital`.`Procedimiento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Telefono_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Telefono_medico` (
  `id_medico` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`),
  CONSTRAINT `idd_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `hospital`.`Medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Telefono_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`Telefono_enfermero` (
  `id_enfermero` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  CONSTRAINT `id_enfermero`
    FOREIGN KEY (`id_enfermero`)
    REFERENCES `hospital`.`Enfermero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*REGISTRO MEDICO*/
INSERT INTO MEDICO VALUES
("m1","carlos", "valencia", "internista");
INSERT INTO MEDICO VALUES
("m2","monica", "zuluaga", "general");
INSERT INTO MEDICO VALUES
("m3","mauricio", "ocampo", "internista");
INSERT INTO MEDICO VALUES
("m4","luisa", "giraldo", "anestesiologo");
INSERT INTO MEDICO VALUES
("m5","melisa", "menses", "general");

/*REGISTRO ENFERMERO*/
INSERT INTO ENFERMERO VALUES
("E1", "ISABEL", "MENDEZ", "m1");
INSERT INTO ENFERMERO VALUES
("E2", "CAROLINA", "SALAZAR", "m2");
INSERT INTO ENFERMERO VALUES
("E3", "JULIAN", "ROJAS", "m3");
INSERT INTO ENFERMERO VALUES
("E4", "DAVID", "GUITIERREZ", "m4");
INSERT INTO ENFERMERO VALUES
("E5", "JUAN", "URAN", "m5");

/*REGISTRO PROCEDIMIENTO*/
INSERT INTO PROCEDIMIENTO VALUES
("P1", "INYECCION");
INSERT INTO PROCEDIMIENTO VALUES
("P2", "ANESTECIA");
INSERT INTO PROCEDIMIENTO VALUES
("P3", "CIRUGIA");
INSERT INTO PROCEDIMIENTO VALUES
("P4", "VACUNACION");
INSERT INTO PROCEDIMIENTO VALUES
("P5", "PRENATAL");

/*REGISTRO PACIENTE*/
INSERT INTO PACIENTE VALUES
("PTE1", "MAICOL", "TORRES", "CALLE 12", "P1");
INSERT INTO PACIENTE VALUES
("PTE2", "CARLOS", "LUNA", "CALLE 13", "P2");
INSERT INTO PACIENTE VALUES
("PTE3", "GULLERMO", "SALAZAR", "CALLE 14", "P3");
INSERT INTO PACIENTE VALUES
("PTE4", "JUAN", "TALERO", "CALLE 15", "P4");
INSERT INTO PACIENTE VALUES
("PTE5", "ISABELLA", "GIRALDO", "CALLE 16", "P5");

/*REGISTRO FACTURA*/
INSERT INTO FACTURA VALUES
("F1", "2/10/2023", "130", "PTE1");
INSERT INTO FACTURA VALUES
("F2", "3/10/2023", "130", "PTE2");
INSERT INTO FACTURA VALUES
("F3", "4/8/2023", "130", "PTE3");
INSERT INTO FACTURA VALUES
("F4", "5/5/2023", "130", "PTE4");
INSERT INTO FACTURA VALUES
("F5", "6/11/2023", "130", "PTE5");

/*REGISTRO MEDICO PROCEDIMIENTO*/
INSERT INTO MEDICO_PROCEDIMIENTO VALUES
("M1", "P1");
INSERT INTO MEDICO_PROCEDIMIENTO VALUES
("M2", "P2");
INSERT INTO MEDICO_PROCEDIMIENTO VALUES
("M3", "P3");
INSERT INTO MEDICO_PROCEDIMIENTO VALUES
("M4", "P4");
INSERT INTO MEDICO_PROCEDIMIENTO VALUES
("M5", "P5");

/*REGISTRO MEDICAMENTO*/
INSERT INTO MEDICAMENTO VALUES
("C1", "ACETAMINOFEN", "2");
INSERT INTO MEDICAMENTO VALUES
("C2", "NAPROXENO", "6");
INSERT INTO MEDICAMENTO VALUES
("C3", "DOLEX", "7");
INSERT INTO MEDICAMENTO VALUES
("C4", "RAMIPRIL", "3");
INSERT INTO MEDICAMENTO VALUES
("C5", "ASPIRINA", "10");

/*REGISTRO PACIENTE MEDICAMENTO*/
INSERT INTO PACIENTE_MEDICAMENTO VALUES
("PTE1", "C1");
INSERT INTO PACIENTE_MEDICAMENTO VALUES
("PTE2", "C2");
INSERT INTO PACIENTE_MEDICAMENTO VALUES
("PTE3", "C3");
INSERT INTO PACIENTE_MEDICAMENTO VALUES
("PTE4", "C4");
INSERT INTO PACIENTE_MEDICAMENTO VALUES
("PTE5", "C5");

/*REGISTRO TELEFONO ENFERMERO*/
INSERT INTO TELEFONO_ENFERMERO VALUES
("E1", "4443232");
INSERT INTO TELEFONO_ENFERMERO VALUES
("E2", "4445656");
INSERT INTO TELEFONO_ENFERMERO VALUES
("E3", "4447876");
INSERT INTO TELEFONO_ENFERMERO VALUES
("E4", "4449878");
INSERT INTO TELEFONO_ENFERMERO VALUES
("E5", "4449800");

/*REGISTRO TELEFONO MEDICO*/
INSERT INTO TELEFONO_MEDICO VALUES
("M1", "4332243");
INSERT INTO TELEFONO_MEDICO VALUES
("M2", "4336577");
INSERT INTO TELEFONO_MEDICO VALUES
("M3", "4332432");
INSERT INTO TELEFONO_MEDICO VALUES
("M4", "4336578");
INSERT INTO TELEFONO_MEDICO VALUES
("M5", "4336578");

/*REGISTRO TELEFONO PACIENTE*/
INSERT INTO TELEFONO_PACIENTE VALUES
("PTE1", "2224566");
INSERT INTO TELEFONO_PACIENTE VALUES
("PTE2", "2225687");
INSERT INTO TELEFONO_PACIENTE VALUES
("PTE3", "2226789");
INSERT INTO TELEFONO_PACIENTE VALUES
("PTE4", "2226700");
INSERT INTO TELEFONO_PACIENTE VALUES
("PTE5", "2223498");
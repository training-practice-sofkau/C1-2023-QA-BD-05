CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`procedimiento` (
  `id` INT NOT NULL,
  `tipoProcedimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`paciente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `idProcedimiento` INT NOT NULL,
  PRIMARY KEY (`id`, `idProcedimiento`),
    FOREIGN KEY (`idProcedimiento`) REFERENCES `hospital`.`procedimiento` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`telefonoPaciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`telefonoPaciente` (
  `idPaciente` INT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  CONSTRAINT `idPaciente`
    FOREIGN KEY (`idPaciente`) REFERENCES `hospital`.`paciente` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`factura` (
  `id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  `idPaciente` INT NOT NULL,
  PRIMARY KEY (`id`, `idPaciente`),
    FOREIGN KEY (`idPaciente`) REFERENCES `hospital`.`paciente` (`id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medicamento` (
  `id` INT NOT NULL,
  `nombreMedicamento` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`pacienteMedicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`pacienteMedicamento` (
  `id` INT NOT NULL,
  `idPaciente` INT NOT NULL,
  `idMedicamento` INT NOT NULL,
  PRIMARY KEY (`id`, `idMedicamento`, `idPaciente`),
    FOREIGN KEY (`idPaciente`) REFERENCES `hospital`.`paciente` (`id`),
    FOREIGN KEY (`idMedicamento`)  REFERENCES `hospital`.`medicamento` (`id`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medico` (
  `id` INT NOT NULL,
  `nombreMedico` VARCHAR(45) NOT NULL,
  `apellidoMedico` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`procedimientoMedico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`procedimientoMedico` (
  `idProcedimientoMedico` INT NOT NULL,
  `idMedico` INT NOT NULL,
  `idProcedimiento` INT NOT NULL,
  PRIMARY KEY (`idProcedimientoMedico`, `idMedico`, `idProcedimiento`),
    FOREIGN KEY (`idProcedimiento`) REFERENCES `hospital`.`procedimiento` (`id`),
    FOREIGN KEY (`idMedico`) REFERENCES `hospital`.`medico` (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`telefonoMedico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`telefonoMedico` (
  `idtelefonoMedico` INT NOT NULL,
  `telefono` VARCHAR(15) NULL,
  PRIMARY KEY (`idtelefonoMedico`),
    FOREIGN KEY (`idtelefonoMedico`) REFERENCES `hospital`.`medico` (`id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`enfermero` (
  `idenfermero` INT NOT NULL,
  `nombreEnfermero` VARCHAR(45) NULL,
  `apellidoEnfermero` VARCHAR(45) NULL,
  `idMedico` INT NOT NULL,
  PRIMARY KEY (`idenfermero`, `idMedico`),
    FOREIGN KEY (`idMedico`) REFERENCES `hospital`.`medico` (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`telefonoEnfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`telefonoEnfermero` (
  `idtelefonoEnfermero` INT NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idtelefonoEnfermero`, `telefono`),
    FOREIGN KEY (`idtelefonoEnfermero`) REFERENCES `hospital`.`enfermero` (`idenfermero`)
)
ENGINE = InnoDB;


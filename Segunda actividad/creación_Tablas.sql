CREATE SCHEMA IF NOT EXISTS `consultorio_doctor` DEFAULT CHARACTER SET utf8;

USE `consultorio_doctor`;

CREATE TABLE IF NOT EXISTS `Médico` (
  `idMédico` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `especialidad` VARCHAR(45) NULL,
  `teléfono` VARCHAR(45) NULL,
  PRIMARY KEY (`idMédico`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Enfermero` (
  `idEnfermero` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `teléfono` VARCHAR(45) NULL,
  `idMédico_enfermero` INT NOT NULL,
  PRIMARY KEY (`idEnfermero`),
  INDEX `idMedico_idx` (`idMédico_enfermero` ASC) VISIBLE,
  CONSTRAINT `FKidMedico` FOREIGN KEY (`idMédico_enfermero`) REFERENCES `Médico` (`idMédico`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Procedimiento` (
  `id_procedimiento` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_procedimiento`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Paciente` (
  `id_paciente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `teléfono` VARCHAR(45) NULL,
  `id_procedimiento` INT NOT NULL,
  PRIMARY KEY (`id_paciente`),
  INDEX `id_procedimiento_idx` (`id_procedimiento` ASC) VISIBLE,
  CONSTRAINT `PKid_procedimiento` FOREIGN KEY (`id_procedimiento`) 
  REFERENCES `Procedimiento` (`id_procedimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Medicamento` (
  `id_medicamento` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `dosis` VARCHAR(45) NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Factura` (
  `id_factura` INT NOT NULL,
  `valorTotal` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  `id_procedimiento_factura` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `id_procedimiento_idx` (`id_procedimiento_factura` ASC) VISIBLE,
  CONSTRAINT `pkid_procedimiento_factura` FOREIGN KEY (`id_procedimiento_factura`) 
  REFERENCES `Procedimiento` (`id_procedimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Realizar` (
  `idMedico_PK` INT NOT NULL,
  `id_procedimiento_PK` INT NOT NULL,
  PRIMARY KEY (`idMedico_PK`, `id_procedimiento_PK`),
  INDEX `id_procedimiento_idx` (`id_procedimiento_PK` ASC) VISIBLE,
  CONSTRAINT `idMedico_PK` FOREIGN KEY (`idMedico_PK`) REFERENCES `Médico` (`idMédico`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_procedimiento_PK` FOREIGN KEY (`id_procedimiento_PK`) 
  REFERENCES `Procedimiento` (`id_procedimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
CREATE TABLE Atender (
  id_paciente INT NOT NULL,
  id_enfermero INT NOT NULL,
  fecha_atencion DATE,
  hora_atencion TIME,
  PRIMARY KEY (id_paciente, id_enfermero),
  CONSTRAINT fk_paciente
    FOREIGN KEY (id_paciente)
    REFERENCES Paciente (id_paciente),
  CONSTRAINT fk_enfermero
    FOREIGN KEY (id_enfermero)
    REFERENCES Enfermero (idEnfermero)
);
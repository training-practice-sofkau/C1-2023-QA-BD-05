SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Hospital` DEFAULT CHARACTER SET utf8 ;
USE `Hospital` ;

CREATE TABLE `Hospital`.`tb_procedimiento` (
  `id_procedimiento` VARCHAR(20) PRIMARY KEY,
  `id_medico_procedimiento` VARCHAR(20),
  FOREIGN KEY (`id_medico_procedimiento`) 
  REFERENCES `Hospital`.`dll_medico_procedimiento`(`id_medico_procedimiento`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`dll_medico_procedimiento` (
  `id_medico_procedimiento` VARCHAR(20) PRIMARY KEY,
  `id_medico` VARCHAR(20),
  `id_procedimiento` VARCHAR(20),
  FOREIGN KEY (`id_medico`) 
  REFERENCES `Hospital`.`tb_medico`(`id_medico`),
  FOREIGN KEY (`id_procedimiento`) 
  REFERENCES `Hospital`.`tb_procedimiento`(`id_procedimiento`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`tb_paciente` (
  `id_paciente` VARCHAR(50) NOT NULL,
  `nombre_paciente` VARCHAR(50) NOT NULL,
  `apellido_paciente` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `id_procedimiento` VARCHAR(50),
  PRIMARY KEY (`id_paciente`),
  CONSTRAINT `fk_id_procedimiento`
    FOREIGN KEY (`id_procedimiento`) 
    REFERENCES `tb_procedimiento`(`id_procedimiento`)
) ENGINE = InnoDB;

CREATE TABLE `Hospital`.`tb_factura` (
  `id_factura` VARCHAR(20) PRIMARY KEY,
  `fecha` VARCHAR(20),
  `valor_total` VARCHAR(20),
  `id_paciente` VARCHAR(20),
  FOREIGN KEY (`id_paciente`) 
  REFERENCES `Hospital`.`tb_paciente`(`id_paciente`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`telefono_paciente` (
  `id_paciente` VARCHAR(20),
  `telefono` VARCHAR(20),
  FOREIGN KEY (`id_paciente`) 
  REFERENCES `Hospital`.`tb_paciente`(`id_paciente`)
)
ENGINE = InnoDB;


CREATE TABLE `Hospital`.`tb_medico` (
  `id_medico` VARCHAR(20) PRIMARY KEY,
  `nombre_medico` VARCHAR(50),
  `apellido_medico` VARCHAR(50),
  `especialidad` VARCHAR(50)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`tb_enfermero` (
  `id_enfermero` VARCHAR(20) PRIMARY KEY,
  `nombre_enfermero` VARCHAR(50),
  `apellido_enfermero` VARCHAR(50),
  `id_medico` VARCHAR(20),
  FOREIGN KEY (`id_medico`) 
  REFERENCES `Hospital`.`tb_medico`(`id_medico`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`telefono_paciente2` (
  `id_paciente2` VARCHAR(20),
  `telefono2` VARCHAR(20),
  FOREIGN KEY (`id_paciente2`) 
  REFERENCES `Hospital`.`tb_medico`(`id_medico`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`dll_paciente_medicamento` (
  `id_paciente_medicamento` INT PRIMARY KEY,
  `id_paciente` VARCHAR(20),
  `id_medicamento` VARCHAR(20),
  FOREIGN KEY (`id_paciente`) 
  REFERENCES `Hospital`.`tb_paciente`(`id_paciente`),
  FOREIGN KEY (`id_medicamento`) 
  REFERENCES `Hospital`.`tb_medicamento`(`id_medicamento`)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`tb_medicamento` (
  `id_medicamento` VARCHAR(20) PRIMARY KEY,
  `nombre_medicamento` VARCHAR(50),
  `dosis` VARCHAR(50)
)
ENGINE = InnoDB;

CREATE TABLE `Hospital`.`telefono_paciente3` (
  `id_paciente` VARCHAR(20),
  `telefono` VARCHAR(20),
  FOREIGN KEY (`id_paciente`)
  REFERENCES `Hospital`.`tb_enfermero`(`id_enfermero`)
)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
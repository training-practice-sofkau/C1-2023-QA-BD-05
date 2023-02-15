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
-- Table `mydb`.`tb_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_procedimiento` (
  `id_procedimiento` VARCHAR(10) NOT NULL,
  `tipo_procedimiento` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_procedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_paciente` (
  `id_paciente` VARCHAR(10) NOT NULL,
  `nombre_paciente` VARCHAR(45) NOT NULL,
  `apellido_paciente` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `id_procedimiento_paciente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  INDEX `id_procedimiento_paciente_idx` (`id_procedimiento_paciente` ASC) VISIBLE,
  CONSTRAINT `id_procedimiento_paciente`
    FOREIGN KEY (`id_procedimiento_paciente`)
    REFERENCES `mydb`.`tb_procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_paciente` (
  `id_paciente_telefono` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paciente_telefono`, `telefono`),
  CONSTRAINT `id_paciente_telefono`
    FOREIGN KEY (`id_paciente_telefono`)
    REFERENCES `mydb`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_factura` (
  `id_factura` VARCHAR(10) NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `valor_total` VARCHAR(45) NOT NULL,
  `id_paciente_factura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `id_paciente_factura_idx` (`id_paciente_factura` ASC) VISIBLE,
  CONSTRAINT `id_paciente_factura`
    FOREIGN KEY (`id_paciente_factura`)
    REFERENCES `mydb`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_medicamento` (
  `id_medicamento` VARCHAR(10) NOT NULL,
  `nombre_medicamento` VARCHAR(300) NOT NULL,
  `dosis` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_medico` (
  `id_medico` VARCHAR(10) NOT NULL,
  `nombre_medico` VARCHAR(65) NOT NULL,
  `apellido_medico` VARCHAR(65) NOT NULL,
  `especialidad` VARCHAR(155) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_enfermero` (
  `id_enfermero` VARCHAR(10) NOT NULL,
  `nombre_enfermero` VARCHAR(45) NOT NULL,
  `apellido_enfermero` VARCHAR(45) NOT NULL,
  `id_medico_enfermero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  INDEX `id_medico_enfermero_idx` (`id_medico_enfermero` ASC) VISIBLE,
  CONSTRAINT `id_medico_enfermero`
    FOREIGN KEY (`id_medico_enfermero`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente_medicamento` (
  `id_paciente_medic` VARCHAR(10) NOT NULL,
  `id_medicamento_pac` VARCHAR(10) NOT NULL,
  INDEX `id_paciente_medic_idx` (`id_paciente_medic` ASC) VISIBLE,
  INDEX `id_medicamento_pac_idx` (`id_medicamento_pac` ASC) VISIBLE,
  CONSTRAINT `id_paciente_medic`
    FOREIGN KEY (`id_paciente_medic`)
    REFERENCES `mydb`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medicamento_pac`
    FOREIGN KEY (`id_medicamento_pac`)
    REFERENCES `mydb`.`tb_medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_procedimiento` (
  `id_medico_proc` VARCHAR(10) NOT NULL,
  `id_procedimiento_med` VARCHAR(45) NOT NULL,
  INDEX `id_medico_proc_idx` (`id_medico_proc` ASC) VISIBLE,
  INDEX `id_procedimiento_med_idx` (`id_procedimiento_med` ASC) VISIBLE,
  CONSTRAINT `id_medico_proc`
    FOREIGN KEY (`id_medico_proc`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_procedimiento_med`
    FOREIGN KEY (`id_procedimiento_med`)
    REFERENCES `mydb`.`tb_procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_enfermero` (
  `id_enfermero_tel` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_enfermero_tel`, `telefono`),
  CONSTRAINT `id_enfermero_tel`
    FOREIGN KEY (`id_enfermero_tel`)
    REFERENCES `mydb`.`tb_enfermero` (`id_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_medico` (
  `id_medico_tel` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico_tel`, `telefono`),
  CONSTRAINT `id_medico_tel`
    FOREIGN KEY (`id_medico_tel`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO mydb.tb_procedimiento (id_procedimiento, tipo_procedimiento)
VALUES ('P1', 'Extracción cordales'),
('P2', 'Limpieza dental'),
('P3', 'Endodoncia'),
('P4', 'Implante dental'),
('P5', 'Ortodoncia');

DELETE FROM tb_procedimiento WHERE id_procedimiento = 'PROC1';
DELETE FROM tb_procedimiento WHERE id_procedimiento = 'PROC2';
DELETE FROM tb_procedimiento WHERE id_procedimiento = 'PROC3';
DELETE FROM tb_procedimiento WHERE id_procedimiento = 'PROC4';
DELETE FROM tb_procedimiento WHERE id_procedimiento = 'PROC5';
SELECT*
FROM tb_procedimiento;


INSERT INTO mydb.tb_paciente (id_paciente, nombre_paciente, apellido_paciente, direccion, id_procedimiento_paciente)
VALUES ('PAC1', 'Juan', 'Pérez', 'Calle 123', 'P1'),
('PAC2', 'María', 'González', 'Avenida 456', 'P2'),
('PAC3', 'Pedro', 'Martínez', 'Plaza 789', 'P2'),
('PAC4', 'Ana', 'Sánchez', 'Calle 456', 'P3'),
('PAC5', 'Luis', 'García', 'Avenida 789', 'P5');
SELECT *
FROM tb_paciente;

INSERT INTO mydb.telefono_paciente (id_paciente_telefono, telefono)
VALUES ('PAC1', '3156203563'),
('PAC1', '604274896'),
('PAC2', '3112569985'),
('PAC3', '3217884789'),
('PAC5', '3214567891'),
('PAC4','3005226630');

DELETE FROM telefono_paciente WHERE id_paciente_telefono = 'PAC1';
DELETE FROM telefono_paciente  WHERE id_paciente_telefono = 'PAC2';
DELETE FROM telefono_paciente  WHERE id_paciente_telefono = 'PAC3';
DELETE FROM telefono_paciente WHERE id_paciente_telefono = 'PAC4';
DELETE FROM telefono_paciente WHERE id_paciente_telefono = 'PAC5';

SELECT*
FROM telefono_paciente;

INSERT INTO mydb.tb_factura (id_factura, fecha, valor_total, id_paciente_factura)
VALUES ('FAC1', '2022-01-01', '100', 'PAC1'),
('FAC2', '2022-02-01', '200', 'PAC2'),
('FAC3', '2022-03-01', '300', 'PAC3'),
('FAC4', '2022-04-01', '400', 'PAC4'),
('FAC5', '2022-05-01', '500', 'PAC5');
SELECT *
FROM tb_factura;

INSERT INTO mydb.tb_medicamento (id_medicamento, nombre_medicamento, dosis) VALUES
('M1', 'Ibuprofeno', '400 mg'),
('M2', 'Paracetamol', '500 mg'),
('M3', 'Aspirina', '81 mg'),
('M4', 'Amoxicillina', '500 mg'),
('M5', 'Loratadina', '10 mg');
SELECT*
FROM tb_medicamento;

INSERT INTO mydb.tb_medico (id_medico, nombre_medico, apellido_medico, especialidad) VALUES
('M001', 'John', 'Sepulveda', 'Ortodoncista'),
('M002', 'Jane', 'Terry', 'Dentista General'),
('M003', 'Bob', 'Smith', 'Endodoncista'),
('M004', 'Alice', 'Johnson', 'Cirujano oral'),
('M005', 'Chris', 'Lee', 'Prostodoncista');
SELECT *
FROM tb_medico;

INSERT INTO mydb.tb_enfermero (id_enfermero, nombre_enfermero, apellido_enfermero, id_medico_enfermero)
VALUES
('E001', 'Ana', 'Garcia', 'M001'),
('E002', 'Pedro', 'Lopez', 'M002'),
('E003', 'Lucia', 'Fernandez', 'M003'),
('E004', 'Juan', 'Perez', 'M001'),
('E005', 'Luisa', 'Gonzalez', 'M002');
SELECT*
FROM tb_enfermero;

INSERT INTO mydb.paciente_medicamento (id_paciente_medic, id_medicamento_pac) VALUES
('PAC1', 'M2'),
('PAC2', 'M3'),
('PAC3', 'M1'),
('PAC4', 'M5'),
('PAC5', 'M4');
SELECT*
FROM paciente_medicamento;

INSERT INTO mydb.medico_procedimiento (id_medico_proc, id_procedimiento_med) VALUES
('M001', 'P1'),
('M002', 'P2'),
('M003', 'P5'),
('M004', 'P3'),
('M005', 'P4');
SELECT*
FROM medico_procedimiento;

INSERT INTO mydb.telefono_enfermero (id_enfermero_tel, telefono) VALUES
('E001', '3112758962'),
('E005', '5558960'),
('E002', '6042747915'),
('E003', '3225447788'),
('E004', '3103589620');
SELECT*
FROM telefono_enfermero;

INSERT INTO mydb.telefono_medico (id_medico_tel, telefono) VALUES
('M001', '3154123620'),
('M002', '3207467796'),
('M003', '3103562111'),
('M005', '3225441199'),
('M004', '6045263320');

DELETE FROM telefono_medico WHERE id_medico_tel = 'M001';
DELETE FROM telefono_medico  WHERE id_medico_tel = 'M002';
DELETE FROM telefono_medico  WHERE id_medico_tel = 'M003';
DELETE FROM telefono_medico WHERE id_medico_tel = 'M004';
DELETE FROM telefono_medico WHERE id_medico_tel = 'M005';
SELECT *
FROM telefono_medico;

-- Consulta para saber que medicamentos ha tomado cada paciente y la dosis suministrada

SELECT nombre_medicamento, nombre_paciente,apellido_paciente,dosis
FROM tb_paciente
INNER JOIN paciente_medicamento ON id_paciente=id_paciente_medic
INNER JOIN tb_medicamento ON id_medicamento= id_medicamento_pac;

-- Consulta para saber que enfermeros estuvieron en los procedimientos de los pacientes:
SELECT tb_enfermero.nombre_enfermero, tb_enfermero.apellido_enfermero, tb_medico.nombre_medico, tb_medico.apellido_medico, tb_medico.especialidad, tb_procedimiento.tipo_procedimiento
FROM tb_enfermero
INNER JOIN tb_medico ON tb_enfermero.id_medico_enfermero = tb_medico.id_medico
INNER JOIN medico_procedimiento ON tb_medico.id_medico = medico_procedimiento.id_medico_proc
INNER JOIN tb_procedimiento ON medico_procedimiento.id_procedimiento_med = tb_procedimiento.id_procedimiento;

-- creacion de una vista pasra saber que medicamentos debe tomar cada paciente y que dosis 
CREATE VIEW info_medicamento_pacientes AS
SELECT nombre_medicamento, nombre_paciente,apellido_paciente,dosis
FROM tb_paciente
INNER JOIN paciente_medicamento ON id_paciente=id_paciente_medic
INNER JOIN tb_medicamento ON id_medicamento= id_medicamento_pac;
SELECT *
FROM info_medicamento_pacientes;

-- Creacion de una vista para tener resgitro e informacion completa de los procedimientos en los pacientes
CREATE VIEW info_procedimientos AS
SELECT tb_enfermero.nombre_enfermero, tb_enfermero.apellido_enfermero, tb_medico.nombre_medico, tb_medico.apellido_medico, tb_medico.especialidad, tb_procedimiento.tipo_procedimiento
FROM tb_enfermero
INNER JOIN tb_medico ON tb_enfermero.id_medico_enfermero = tb_medico.id_medico
INNER JOIN medico_procedimiento ON tb_medico.id_medico = medico_procedimiento.id_medico_proc
INNER JOIN tb_procedimiento ON medico_procedimiento.id_procedimiento_med = tb_procedimiento.id_procedimiento;
SELECT*
FROM info_procedimientos;


-- Creacion de una vista para mostrar la información del paciente, la factura correspondiente y el total de la factura

CREATE VIEW info_paciente AS 
SELECT p.nombre_paciente, p.apellido_paciente, p.direccion, f.fecha, f.valor_total 
FROM `mydb`.`tb_paciente` p 
JOIN `mydb`.`tb_factura` f ON p.id_paciente = f.Id_paciente_factura;
SELECT *
FROM info_paciente;

-- agregar un procedimiento 
DELIMITER //
CREATE PROCEDURE AgregarProcedimiento(
  IN p_id VARCHAR(10),
  IN p_tipo VARCHAR(300)
)
BEGIN
  INSERT INTO tb_procedimiento(id_procedimiento, tipo_procedimiento)
  VALUES(p_id, p_tipo);
END //
DELIMITER ;
DROP procedure AgregarProcedimiento ;

CALL AgregarProcedimiento ('P6','Revision encias');

-- actualizar un procedimiento 
DELIMITER //
CREATE PROCEDURE ActualizarProcedimiento(
  IN p_id VARCHAR(10),
  IN p_tipo VARCHAR(300)
)
BEGIN
  UPDATE tb_procedimiento
  SET tipo_procedimiento = p_tipo
  WHERE id_procedimiento = p_id;
END //
DELIMITER ;
CALL ActualizarProcedimiento ('P5','sacada cordales');
-- consultar un procedimiento
DELIMITER //
CREATE PROCEDURE ConsultarProcedimiento(
  IN p_id VARCHAR(10)
)
BEGIN
  SELECT * FROM tb_procedimiento
  WHERE id_procedimiento = p_id;
END //
DELIMITER ;
CALL ConsultarProcedimiento ('P5');
-- borrar un procedimiento
DELIMITER //
CREATE PROCEDURE BorrarProcedimiento(
  IN p_id VARCHAR(10)
)
BEGIN
  DELETE FROM tb_procedimiento
  WHERE id_procedimiento = p_id;
END //
DELIMITER ;
CALL BorrarProcedimiento ('P5');

-- Creo la tabla "control_de_cambios_hospital"
CREATE TABLE control_de_cambios_hospital (
  usuario VARCHAR(50) NOT NULL,
  accion VARCHAR(50) NOT NULL,
  fecha DATETIME NOT NULL
);

-- Creo el primer trigger para registrar la inserción de un registro en "tb_procedimiento"
DELIMITER //
CREATE TRIGGER registro_insertar_procedimiento
AFTER INSERT ON tb_procedimiento
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
  VALUES (USER(), 'INSERTAR', NOW());
END //
DELIMITER ;

-- Creor el segundo trigger para registrar la eliminación de un registro en "tb_procedimiento"
DELIMITER //
CREATE TRIGGER registro_eliminar_procedimiento
AFTER DELETE ON tb_procedimiento
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
  VALUES (USER(), 'ELIMINAR', NOW());
END //
DELIMITER ;
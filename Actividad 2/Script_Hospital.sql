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

CREATE TABLE control_de_cambios_hospital (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(50),
  accion VARCHAR(10),
  fecha DATETIME
);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

#Poblando la base de datos

INSERT INTO `mydb`.`Medico` (`id_Medico`, `Nombre`, `Apellido`, `Especialidad`)
VALUES 
  ('1', 'Juan', 'Perez', 'Cardiología'),
  ('2', 'Maria', 'Gomez', 'Pediatría'),
  ('3', 'Luis', 'Martinez', 'Cirugía'),
  ('4', 'Ana', 'Ruiz', 'Oftalmología'),
  ('5', 'Carlos', 'Garcia', 'Dermatología');
SELECT *
FROM `mydb`.`Medico`;

INSERT INTO `mydb`.`Procedimiento` (`id_Procedimiento`, `tipo_procedimiento`)
VALUES 
  ('1', 'Extracción de sangre'),
  ('2', 'Radiografía'),
  ('3', 'Colonoscopía'),
  ('4', 'Cirugía de cataratas'),
  ('5', 'Endoscopía');
  SELECT *
FROM `mydb`.`Procedimiento`;

INSERT INTO `mydb`.`Procedimiento_has_Medico` (`Procedimiento_id_Procedimiento`, `Medico_id_Medico`)
VALUES 
  ('1', '1'),
  ('2', '2'),
  ('3', '3'),
  ('4', '4'),
  ('5', '5');
SELECT *
FROM `mydb`.`Procedimiento_has_Medico`;

INSERT INTO `mydb`.`Paciente` (`id_Paciente`, `nombre_paciente`, `apellido_paciente`, `Direccion`, `Id_Procedimiento_FK`)
VALUES 
  ('1', 'Juan', 'González', 'Calle 123', '1'),
  ('2', 'María', 'Martínez', 'Avenida 456', '2'),
  ('3', 'Pedro', 'García', 'Calle 789', '3'),
  ('4', 'Ana', 'Rodríguez', 'Avenida 012', '4'),
  ('5', 'Sofía', 'Sánchez', 'Calle 345', '5');
SELECT *
FROM `mydb`.`Paciente`;

INSERT INTO `mydb`.`Telefono_paciente` (`Telefono`, `Id_Paciente_Telefono`)
VALUES 
  ('555-1111', '1'),
  ('555-2222', '2'),
  ('555-3333', '3'),
  ('555-4444', '4'),
  ('555-5555', '5');
  SELECT *
FROM `mydb`.`Telefono_paciente`;

INSERT INTO `mydb`.`Factura` (`id_Factura`, `fecha`, `Valor_total`, `Id_Paciente_Factura`)
VALUES 
  ('1', '2022-01-01', '100', '1'),
  ('2', '2022-01-02', '200', '2'),
  ('3', '2022-01-03', '300', '3'),
  ('4', '2022-01-04', '400', '4'),
  ('5', '2022-01-05', '500', '5');
  SELECT *
FROM `mydb`.`Factura`;

INSERT INTO mydb.Medicamento (id_Medicamento, Nombre, dosis) VALUES
('M001', 'Ibuprofeno', '400 mg'),
('M002', 'Paracetamol', '500 mg'),
('M003', 'Amoxicilina', '500 mg'),
('M004', 'Omeprazol', '20 mg'),
('M005', 'Diazepam', '5 mg');
 SELECT *
FROM mydb.Medicamento;

INSERT INTO Medicamento_has_Paciente (Medicamento_id_Medicamento, Paciente_id_Paciente) 
VALUES ('M001', '1');
INSERT INTO Medicamento_has_Paciente (Medicamento_id_Medicamento, Paciente_id_Paciente) 
VALUES ('M002', '2');
INSERT INTO Medicamento_has_Paciente (Medicamento_id_Medicamento, Paciente_id_Paciente) 
VALUES ('M003', '3');
INSERT INTO Medicamento_has_Paciente (Medicamento_id_Medicamento, Paciente_id_Paciente) 
VALUES ('M004', '4');
INSERT INTO Medicamento_has_Paciente (Medicamento_id_Medicamento, Paciente_id_Paciente) 
VALUES ('M005', '5');
SELECT *
FROM Medicamento_has_Paciente;

INSERT INTO `Telefono_Medico` (`Telefono`, `Id_Medico_Telefono`) 
VALUES 
    ('1234567890', '1'), 
    ('0987654321', '2'), 
    ('5554443333', '3'), 
    ('1112223333', '4'), 
    ('4445556666', '5');
    SELECT *
FROM `Telefono_Medico`;

INSERT INTO `Enfermero` (`id_Enfermero`, `Nombre`, `Apellido`, `Id_Medico_FK`) 
VALUES 
    ('1', 'Juan', 'Pérez', '1'), 
    ('2', 'María', 'García', '2'), 
    ('3', 'Luis', 'González', '3'), 
    ('4', 'Ana', 'Martínez', '4'), 
    ('5', 'Carlos', 'Ruiz', '5');
 SELECT *
FROM `Enfermero`;

INSERT INTO `Telefono_Enfermero` (`Telefono`, `Id_Enfermero_FK`) 
VALUES 
    ('123-456-7890', '1'),
    ('234-567-8901', '2'),
    ('345-678-9012', '3'),
    ('456-789-0123', '4'),
    ('567-890-1234', '5');
SELECT *
FROM `Telefono_Enfermero`;


#CONSULTAS
-- -----------------------------------------------------
-- Para conocer los medicamentos que ha tomado cada paciente y la dosis suministrada.
-- -----------------------------------------------------
SELECT p.nombre_paciente, m.Nombre, m.dosis
FROM Paciente p
INNER JOIN Medicamento_has_Paciente mp ON p.id_Paciente = mp.Paciente_id_Paciente
INNER JOIN Medicamento m ON mp.Medicamento_id_Medicamento = m.id_Medicamento;

-- -----------------------------------------------------
-- Para conocer los enfermeros que estuvieron en los procedimientos de los pacientes
-- -----------------------------------------------------
SELECT P.nombre_paciente, P.apellido_paciente, PR.tipo_procedimiento, M.Nombre AS NombreMedico, M.Apellido AS ApellidoMedico, E.Nombre AS NombreEnfermero, E.Apellido AS ApellidoEnfermero
FROM Paciente AS P
INNER JOIN Procedimiento AS PR ON P.Id_Procedimiento_FK = PR.id_Procedimiento
INNER JOIN Procedimiento_has_Medico AS PM ON PR.id_Procedimiento = PM.Procedimiento_id_Procedimiento
INNER JOIN Medico AS M ON PM.Medico_id_Medico = M.id_Medico
INNER JOIN Enfermero AS E ON M.id_Medico = E.Id_Medico_FK;


#VISTAS 
-- -----------------------------------------------------
-- Vista para mostrar la información del paciente, la factura correspondiente y el total de la factura
-- -----------------------------------------------------
CREATE VIEW `mydb`.`Paciente_Factura` AS 
SELECT p.nombre_paciente, p.apellido_paciente, p.Direccion, f.fecha, f.Valor_total 
FROM `mydb`.`Paciente` p 
JOIN `mydb`.`Factura` f ON p.id_Paciente = f.Id_Paciente_Factura;
SELECT *
FROM `mydb`.`Paciente_Factura`;

-- -----------------------------------------------------
-- Vista para mostrar los médicos y los procedimientos a los que están asociados
-- -----------------------------------------------------
CREATE VIEW `mydb`.`Medico_Procedimiento` AS 
SELECT m.Nombre, m.Apellido, m.Especialidad, p.tipo_procedimiento 
FROM `mydb`.`Medico` m 
JOIN `mydb`.`Procedimiento_has_Medico` pm ON m.id_Medico = pm.Medico_id_Medico 
JOIN `mydb`.`Procedimiento` p ON pm.Procedimiento_id_Procedimiento = p.id_Procedimiento;
SELECT *
FROM `mydb`.`Medico_Procedimiento`;

-- -----------------------------------------------------
-- Vista para mostrar la información de los medicamentos que ha sido prescrita a cada paciente
-- -----------------------------------------------------
CREATE VIEW `mydb`.`Paciente_Medicamento` AS 
SELECT p.nombre_paciente, p.apellido_paciente, m.Nombre, m.dosis 
FROM `mydb`.`Paciente` p 
JOIN `mydb`.`Medicamento_has_Paciente` mp ON p.id_Paciente = mp.Paciente_id_Paciente 
JOIN `mydb`.`Medicamento` m ON mp.Medicamento_id_Medicamento = m.id_Medicamento;
SELECT *
FROM `mydb`.`Paciente_Medicamento`;


-- -----------------------------------------------------
-- ----#Procedimiento para crear un medicamento::------------
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE CrearMedicamento
(
    IN id_Medicamento VARCHAR(10),
    IN Nombre VARCHAR(50),
    IN dosis VARCHAR(20)
)
BEGIN
    INSERT INTO mydb.Medicamento (id_Medicamento, Nombre, dosis) 
    VALUES (id_Medicamento, Nombre, dosis);
END //
DELIMITER ;
CALL CrearMedicamento('M006', 'Aspirina', '500 mg');

-- -----------------------------------------------------
-- ----#Procedimiento para consultar un medicamento por su ID:------------
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE ConsultarMedicamento
(
    IN id_Medicamento VARCHAR(10)
)
BEGIN
    SELECT * FROM mydb.Medicamento 
    WHERE id_Medicamento = id_Medicamento;
END //
DELIMITER ;
CALL ConsultarMedicamento('M006');
drop procedure ConsultarMedicamento;
-- -----------------------------------------------------
-- ----#Procedimiento para actualizar un medicamento:------------
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE ActualizarMedicamento
(
    IN id_Medicamento VARCHAR(10),
    IN Nombre VARCHAR(50),
    IN dosis VARCHAR(20)
)
BEGIN
    UPDATE mydb.Medicamento 
    SET Nombre = Nombre, dosis = dosis 
    WHERE id_Medicamento = id_Medicamento;
END //
DELIMITER ;
CALL ActualizarMedicamento('M006', 'Clonazepam', '2 mg');

-- -----------------------------------------------------
-- ----#Procedimiento para borrar un medicamento por su ID:------------
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE BorrarMedicamento
(
    IN id_Medicamento VARCHAR(10)
)
BEGIN
    DELETE FROM mydb.Medicamento 
    WHERE id_Medicamento = id_Medicamento;
END //
DELIMITER ;
CALL BorrarMedicamento('M006');

-- -----------------------------------------------------
-- ----#CREACION DE LOS TRIGGERS:------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- ----#Trigger para registrar la acción de agregar un registro en la tabla Medicamento:------------
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER tr_control_cambios_agregar
AFTER INSERT ON Medicamento
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_hospital (usuario, accion, fecha) VALUES (USER(), 'agregar', NOW());
END //
DELIMITER ;

-- -----------------------------------------------------
-- ----#Trigger para registrar la acción de eliminar un registro en la tabla Medicamento:------------
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER tr_control_cambios_eliminar
AFTER DELETE ON Medicamento
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_hospital (usuario, accion, fecha) VALUES (USER(), 'eliminar', NOW());
END //
DELIMITER ;


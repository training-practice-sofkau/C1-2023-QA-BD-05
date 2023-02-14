use hospital;

# Registros agregados a las tablas

-- Tabla médico

INSERT INTO Medico (idMedico, nombre, especialidad, telefono)
VALUES 
("M001", "James Muñoz", "Pediatría", "555-555-5555"),
("M002", "Julieta Muñoz", "Cardiología", "555-555-5556"),
("M003", "Sara Mejia", "Neurología", "555-555-5557"),
("M004", "Jams Muñoz", "Oftalmología", "555-555-5558"),
("M005", "Carlos Muñoz", "Ortopedia", "555-555-5559");

-- Tabla enfermero

INSERT INTO Enfermero (idEnfermero, nombre, Medico_idMedico)
VALUES 
("E001", "Pedro Ramos", "M001"),
("E002", "Javier Muñoz", "M002"),
("E003", "Ara Borja", "M003"),
("E004", "Luz Cardona", "M004"),
("E005", "David Ortiz", "M005");

-- Tabla procedimiento

INSERT INTO Procedimiento (idProcedimiento, tipo)
VALUES 
("P001", "Cirugía"),
("P002", "Terapia"),
("P003", "Radiografía"),
("P004", "Tomografía"),
("P005", "Ecografía");

-- Tabla Paciente

INSERT INTO Paciente (idPaciente, nombre, direccion, idProcedimiento)
VALUES 
("PA001", "Juan González", "Calle 123", "P001"),
("PA002", "Ana López", "Calle 124", "P002"),
("PA003", "Luis Pérez", "Calle 125", "P003"),
("PA004", "María Rodríguez", "Calle 126", "P004"),
("PA005", "Carlos Martínez", "Calle 127", "P005");

-- Tabla factura

INSERT INTO Factura (idFactura, fecha, valor_total, idPaciente) 
VALUES
("001", "2023/02/13", "100", "PA001"),
("002", "2023/02/13", "100", "PA002"),
("003", "2023/02/13", "100", "PA003"),
("004", "2023/02/13", "100", "PA004"),
("005", "2023/02/13", "100", "PA005");

-- Tabla Medico_has_Procedimiento

INSERT INTO Medico_has_Procedimiento (idMedico, idProcedimiento)
VALUES 
("M001", "P001"),
("M002", "P002"),
("M003", "P003"),
("M004", "P004"),
("M005", "P005");

-- Tabla Medicamento

INSERT INTO Medicamento (idMedicamento, nombre, dosis)
VALUES
("MD001", "Ibuprofeno", "200mg"),
("MD002", "Paracetamol", "500mg"),
("MD003", "Amlodipino", "10mg"),
("MD004", "Naproxeno", "250mg"),
("MD005", "Loratadina", "100mg");

-- Tabla Paciente_has_Medicamento

INSERT INTO Paciente_has_Medicamento (idPaciente, idMedicamento)
VALUES 
("PA001", "MD001"),
("PA002", "MD002"),
("PA003", "MD003"),
("PA004", "MD004"),
("PA005", "MD005");

-- Consulta que me permita conocer que medicamentos a tomado cada paciente y la dosis suministrada.

SELECT 
  Paciente.nombre AS 'Nombre del Paciente', 
  Medicamento.nombre AS 'Nombre del Medicamento', 
  Medicamento.dosis AS 'Dosis Suministrada'
FROM 
  Paciente 
  JOIN Paciente_has_Medicamento ON Paciente.idPaciente = Paciente_has_Medicamento.idPaciente
  JOIN Medicamento ON Paciente_has_Medicamento.idMedicamento = Medicamento.idMedicamento;
  
-- Consulta que me permita conocer que enfermeros estuvieron en los procedimientos de los pacientes.
  
SELECT 
  Paciente.nombre AS 'Nombre del Paciente', 
  Procedimiento.tipo AS 'Tipo de Procedimiento', 
  Enfermero.nombre AS 'Nombre del Enfermero'
FROM 
  Paciente 
  JOIN Procedimiento ON Paciente.idProcedimiento = Procedimiento.idProcedimiento
  JOIN Medico_has_Procedimiento ON Procedimiento.idProcedimiento = Medico_has_Procedimiento.idProcedimiento
  JOIN Medico ON Medico_has_Procedimiento.idMedico = Medico.idMedico
  JOIN Enfermero ON Enfermero.Medico_idMedico = Medico.idMedico;
  
-- vista para ver las facturas de los pacientes

CREATE VIEW pacientes_facturas AS
SELECT Paciente.idPaciente, Paciente.nombre, Factura.fecha, Factura.valor_total
FROM Paciente
JOIN Factura ON Paciente.idPaciente = Factura.idPaciente;

-- vista para ver medicamentos asignados a los pacientes

CREATE VIEW MedicamentosPorPaciente AS 
SELECT Paciente.idPaciente, Paciente.nombre AS nombrePaciente, Medicamento.nombre AS nombreMedicamento, Medicamento.dosis
FROM Paciente
JOIN Paciente_has_Medicamento ON Paciente.idPaciente = Paciente_has_Medicamento.idPaciente
JOIN Medicamento ON Paciente_has_Medicamento.idMedicamento = Medicamento.idMedicamento;

-- vista para ver los medicos y su especialidad

CREATE VIEW vista_medicos_especialidad AS
SELECT idMedico, nombre, especialidad
FROM Medico;

-- Agregar un nuevo registro en la tabla Medico

DELIMITER //
CREATE PROCEDURE agregar_Medico (
    IN idMedico_medico VARCHAR(25),
    IN nombre_medico VARCHAR(45),
    IN especialidad_medico VARCHAR(45),
    IN telefono_medico VARCHAR(45)
)
BEGIN
    INSERT INTO Medico (idMedico, nombre, especialidad, telefono)
    VALUES (idMedico_medico, nombre_medico, especialidad_medico, telefono_medico);
END //
DELIMITER ;
call hospital.agregar_Medico('M006', 'Jeison', 'Ginecologo', '2223311');

-- Actualizar un registro existente en la tabla Medico

DELIMITER //
CREATE PROCEDURE actualizarMedico_Medico (IN idMedico_Medico VARCHAR(10), IN nombre_Medico VARCHAR(50), IN especialidad_Medico VARCHAR(50),
    IN telefono_Medico VARCHAR(15)
)
BEGIN
    UPDATE Medico
    SET nombre = nombre_Medico, especialidad = especialidad_Medico, telefono = telefono_Medico
    WHERE idMedico = idMedico_Medico;
END //
DELIMITER ;
call hospital.actualizarMedico_Medico('M001', 'Juanes', 'Oncólogo', '4446587');

-- Consultar un registro en la tabla Medico

DELIMITER //
CREATE PROCEDURE consultarMedico_Medico (
    IN idMedico_Medico VARCHAR(10)
)
BEGIN
    SELECT idMedico, nombre, especialidad, telefono
    FROM Medico
    WHERE idMedico = idMedico_Medico;
END //
DELIMITER ;
call hospital.consultarMedico_Medico('M002');

-- Eliminar un registro de la tabla Medico

DELIMITER //
CREATE PROCEDURE eliminarMedico_Medico (IN idMedico_Medico VARCHAR(10)
)
BEGIN
    DELETE FROM Medico WHERE idMedico = idMedico_Medico;
END //
DELIMITER ;
call hospital.eliminarMedico_Medico('M006');

-- tabla llamada "control_de_cambios_hospital" con las columnas "usuario", "accion" y "fecha"

CREATE TABLE control_de_cambios_hospital (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50),
  accion VARCHAR(10),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE control_de_cambios_hospital (
    usuario VARCHAR(50),
    accion VARCHAR(50),
    fecha DATETIME
);

-- Trigger Para agregar registros en la tabla Medico

DELIMITER //
CREATE TRIGGER tr_agregarMedico 
AFTER INSERT ON Medico
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_hospital (usuario, accion, fecha) VALUES (USER(), 'insertar', NOW());
END; //
DELIMITER ;
call hospital.agregar_Medico('M0020', 'Ledys', 'General', '445511');

-- Trigger Para eliminar registros de la tabla Medico
  
DELIMITER //
CREATE TRIGGER tr_eliminarMedico AFTER DELETE ON Medico
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_hospital (usuario, accion, fecha) VALUES (USER(), 'eliminar', NOW());
END; //
DELIMITER ;
call hospital.eliminarMedico_Medico('M0020');
  
-- SENTENCIAS PARA CREAR LA BASE DE DATOS

-- -----------------------------------------------------
-- Schema Hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hospital` DEFAULT CHARACTER SET utf8mb3 ;
USE `Hospital` ;

-- -----------------------------------------------------
-- Table `Hospital`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Medico` (
  `idMedico` VARCHAR(25) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Enfermero` (
  `idEnfermero` VARCHAR(25) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `Medico_idMedico` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idEnfermero`),
  INDEX `fk_Enfermero_Medico1_idx` (`Medico_idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Enfermero_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `Hospital`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Procedimiento` (
  `idProcedimiento` VARCHAR(25) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProcedimiento`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Paciente` (
  `idPaciente` VARCHAR(25) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `idProcedimiento` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_Paciente_Procedimiento1_idx` (`idProcedimiento` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Procedimiento1`
    FOREIGN KEY (`idProcedimiento`)
    REFERENCES `Hospital`.`Procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Medico_has_Procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Medico_has_Procedimiento` (
  `idMedico` VARCHAR(25) NOT NULL,
  `idProcedimiento` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idMedico`, `idProcedimiento`),
  INDEX `fk_Medico_has_Procedimiento_Procedimiento1_idx` (`idProcedimiento` ASC) VISIBLE,
  INDEX `fk_Medico_has_Procedimiento_Medico1_idx` (`idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_has_Procedimiento_Medico1`
    FOREIGN KEY (`idMedico`)
    REFERENCES `Hospital`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medico_has_Procedimiento_Procedimiento1`
    FOREIGN KEY (`idProcedimiento`)
    REFERENCES `Hospital`.`Procedimiento` (`idProcedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Medicamento` (
  `idMedicamento` VARCHAR(25) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Paciente_has_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Paciente_has_Medicamento` (
  `idPaciente` VARCHAR(25) NOT NULL,
  `idMedicamento` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idPaciente`, `idMedicamento`),
  INDEX `fk_Paciente_has_Medicamento_Medicamento1_idx` (`idMedicamento` ASC) VISIBLE,
  INDEX `fk_Paciente_has_Medicamento_Paciente1_idx` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_has_Medicamento_Paciente1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `Hospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_has_Medicamento_Medicamento1`
    FOREIGN KEY (`idMedicamento`)
    REFERENCES `Hospital`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Hospital`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospital`.`Factura` (
  `idFactura` INT NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `valor_total` VARCHAR(45) NOT NULL,
  `idPaciente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Paciente1_idx` (`idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Paciente1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `Hospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



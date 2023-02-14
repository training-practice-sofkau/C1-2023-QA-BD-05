-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE `mydb`;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_medico` (
  `id_medico` VARCHAR(15) NOT NULL,
  `nombre_medico` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `especialidad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_medico` (
  `id_medico_telefono` VARCHAR(15) NOT NULL,
  `numero_medico` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_medico_telefono`, `numero_medico`),
  CONSTRAINT `id_medico_telefono`
    FOREIGN KEY (`id_medico_telefono`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_procedimiento` (
  `id_procedimiento` VARCHAR(15) NOT NULL,
  `tipo_procedimiento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_procedimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medico_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_procedimiento` (
  `id_medico_procedimietno` VARCHAR(15) NOT NULL,
  `id_procedimiento_medico` VARCHAR(15) NOT NULL,
  INDEX `id_medico_procedimiento_idx` (`id_medico_procedimietno` ASC) VISIBLE,
  INDEX `id_procedimiento_medico_idx` (`id_procedimiento_medico` ASC) VISIBLE,
  CONSTRAINT `id_medico_procedimiento`
    FOREIGN KEY (`id_medico_procedimietno`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_procedimiento_medico`
    FOREIGN KEY (`id_procedimiento_medico`)
    REFERENCES `mydb`.`tb_procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_paciente` (
  `id_paciente` VARCHAR(15) NOT NULL,
  `nombre_paciente` VARCHAR(50) NOT NULL,
  `apellido_paciente` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `id_procedimiento_paciente` VARCHAR(15) NOT NULL,
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
  `id_paciente_telefono` VARCHAR(15) NOT NULL,
  `numero_paciente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_paciente_telefono`, `numero_paciente`),
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
  `id_factura` VARCHAR(15) NOT NULL,
  `fecha` VARCHAR(30) NOT NULL,
  `valor_total` VARCHAR(15) NOT NULL,
  `id_paciente_factura` VARCHAR(15) NOT NULL,
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
  `id_medicamento` VARCHAR(15) NOT NULL,
  `nombre_emdicamento` VARCHAR(45) NOT NULL,
  `dosis` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente_medicamento` (
  `id_paciente_medicamento` VARCHAR(15) NOT NULL,
  `id_medicamento_paciente` VARCHAR(15) NOT NULL,
  INDEX `id_paciente_medicamento_idx` (`id_paciente_medicamento` ASC) VISIBLE,
  INDEX `id_medicamento_paciente_idx` (`id_medicamento_paciente` ASC) VISIBLE,
  CONSTRAINT `id_paciente_medicamento`
    FOREIGN KEY (`id_paciente_medicamento`)
    REFERENCES `mydb`.`tb_paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_medicamento_paciente`
    FOREIGN KEY (`id_medicamento_paciente`)
    REFERENCES `mydb`.`tb_medicamento` (`id_medicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_enfermero` (
  `id_enfermero` VARCHAR(15) NOT NULL,
  `nombre_enfermero` VARCHAR(50) NOT NULL,
  `apellido_enfermero` VARCHAR(50) NOT NULL,
  `id_medico_enfermero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_enfermero`),
  INDEX `id_medico_enfermero_idx` (`id_medico_enfermero` ASC) VISIBLE,
  CONSTRAINT `id_medico_enfermero`
    FOREIGN KEY (`id_medico_enfermero`)
    REFERENCES `mydb`.`tb_medico` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefono_enfermero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono_enfermero` (
  `id_enfermero_telefono` VARCHAR(15) NOT NULL,
  `numero_enfermero` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_enfermero_telefono`, `numero_enfermero`),
  CONSTRAINT `id_enfermero_numero`
    FOREIGN KEY (`id_enfermero_telefono`)
    REFERENCES `mydb`.`tb_enfermero` (`id_enfermero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Se hacen 5 registros para la tabla tb_medico
 INSERT INTO tb_medico (id_medico, nombre_medico, apellido, especialidad) 
 VALUES('M001', 'Juan', 'García', 'Pediatría'),('M002', 'María', 'González', 'Oftalmología'),('M003', 'Santiago', 'Martínez', 'Cardiología'),
	   ('M004', 'Ana', 'Hernández', 'Dermatología'),('M005', 'Luis', 'Pérez', 'Neurología');
       
SELECT *
FROM tb_medico;

-- Se hacen 5 registros para la tabla telefono_medico
INSERT INTO telefono_medico (id_medico_telefono, numero_medico) 
VALUES('M001', '3101234567'),('M002', '3219876543'),('M003', '3014567890'),('M004', '3003216549'),('M005', '3127418529');

SELECT *
FROM telefono_medico;

-- Se hacen 5 registros para la tablas procedimiento
INSERT INTO tb_procedimiento (id_procedimiento, tipo_procedimiento) 
VALUES('P001', 'Extracción de sangre'),('P002', 'Radiografía'),('P003', 'Endoscopia'),('P004', 'Tomografía'),('P005', 'Cirugía de cataratas');

SELECT *
FROM tb_procedimiento;

-- Se hacen 5 registros para la tablas procedimiento
INSERT INTO medico_procedimiento (id_medico_procedimietno, id_procedimiento_medico) 
VALUES('M001', 'P001'),('M001', 'P002'),('M002', 'P003'),('M003', 'P004'),('M004', 'P005');

SELECT *
FROM medico_procedimiento;

-- Se hacen 5 registros para la tablas tb_paciente
INSERT INTO tb_paciente (id_paciente, nombre_paciente, apellido_paciente, direccion, id_procedimiento_paciente) 
VALUES('1', 'María', 'García', 'Calle 123', 'P001'),('2', 'José', 'Rodríguez', 'Carrera 45', 'P002'),('3', 'Ana', 'Martínez', 'Avenida 67', 'P003'),
      ('4', 'Pedro', 'Fernández', 'Calle 23', 'P004'),('5', 'Mónica', 'Hernández', 'Carrera 78', 'P005');
      
SELECT *
FROM tb_paciente;

-- Se hacen 5 registros para la tablas telefono_paciente
INSERT INTO telefono_paciente (id_paciente_telefono, numero_paciente)
VALUES('1','3124587698'),('2','3168457958'),('3','3188456587'),('4','3205845657'),('5','322584857');

SELECT *
FROM telefono_paciente;

-- Se hacen 5 registros de la tabla tb_factura
INSERT INTO tb_factura (id_factura, fecha, valor_total, id_paciente_factura) 
VALUES ('FAC-0001', '2022-02-01', '350000', '1'),('FAC-0002', '2022-02-10', '450000', '2'),('FAC-0003', '2022-02-15', '800000', '3'),
       ('FAC-0004', '2022-02-20', '250000', '4'),('FAC-0005', '2022-03-01', '900000', '5');
       
SELECT *
FROM tb_factura;

-- Se hacen 5 registros de la tabla tb_medicamento
INSERT INTO tb_medicamento (id_medicamento, nombre_emdicamento, dosis) 
VALUES('ME001', 'Ibuprofeno', '200mg'),('ME002', 'Paracetamol', '500mg'),('ME003', 'Omeprazol', '20mg'),('ME004', 'Aspirina', '100mg'),('ME005', 'Amoxicilina', '500mg');

SELECT *
FROM tb_medicamento;

-- Se hacen 5 registros de la tabla paciente_medicamento
INSERT INTO paciente_medicamento (id_paciente_medicamento, id_medicamento_paciente) 
VALUES ('1','ME001'),('2','ME002'),('3','ME003'),('4','ME004'),('5','ME005');

SELECT *
FROM paciente_medicamento;

-- Se hacen 5 registros de la tabla tb_enfermero
INSERT INTO tb_enfermero (id_enfermero, nombre_enfermero, apellido_enfermero, id_medico_enfermero) 
VALUES ('E001', 'Luisa', 'García', 'M001'),('E002', 'Gabriel', 'Rodríguez', 'M002'),('E003', 'Ana', 'Fernández', 'M003'),
	   ('E004', 'Carlos', 'González', 'M004'),('E005', 'María', 'Martínez', 'M005');
       
SELECT *
FROM tb_enfermero;


-- Se hacen 5 registros para la tabla telefono_enfermero
INSERT INTO telefono_enfermero (id_enfermero_telefono, numero_enfermero) 
VALUES('E001', '3111278543'),('E002', '3205875972'),('E003', '3011258768'),('E004', '3008756842'),('E005', '3125875457');

SELECT *
FROM telefono_enfermero;

-- consulta que me permita conocer que medicamentos a tomado cada paciente y la dosis suministrada
SELECT tb_paciente.nombre_paciente AS Nombre, tb_paciente.apellido_paciente AS Apellido, tb_medicamento.nombre_emdicamento AS Medicamento, tb_medicamento.dosis AS Dosis
FROM paciente_medicamento
INNER JOIN tb_paciente ON tb_paciente.id_paciente = paciente_medicamento.id_paciente_medicamento
INNER JOIN tb_medicamento ON tb_medicamento.id_medicamento = paciente_medicamento.id_medicamento_paciente;

-- consulta que me permita conocer que enfermeros estuvieron en los procedimientos de los pacientes.
SELECT tb_enfermero.nombre_enfermero, tb_enfermero.apellido_enfermero, tb_procedimiento.tipo_procedimiento, tb_paciente.nombre_paciente, tb_paciente.apellido_paciente
FROM tb_enfermero
INNER JOIN tb_medico ON tb_medico.id_medico = tb_enfermero.id_medico_enfermero
INNER JOIN medico_procedimiento ON medico_procedimiento.id_medico_procedimietno = tb_medico.id_medico
INNER JOIN tb_procedimiento ON tb_procedimiento.id_procedimiento = medico_procedimiento.id_procedimiento_medico
INNER JOIN tb_paciente ON tb_paciente.id_procedimiento_paciente = tb_procedimiento.id_procedimiento;


-- Vista para ver el medicamento de cada paciente
CREATE VIEW medicamento_pacientes AS
SELECT tb_paciente.nombre_paciente AS Nombre, tb_paciente.apellido_paciente AS Apellido, tb_medicamento.nombre_emdicamento AS Medicamento, tb_medicamento.dosis AS Dosis
FROM paciente_medicamento
INNER JOIN tb_paciente ON tb_paciente.id_paciente = paciente_medicamento.id_paciente_medicamento
INNER JOIN tb_medicamento ON tb_medicamento.id_medicamento = paciente_medicamento.id_medicamento_paciente;

SELECT *
FROM medicamento_pacientes;

-- Vista para ver los procediemientos de cada paciente
CREATE VIEW procedimientos_pacientes AS
SELECT tb_paciente.nombre_paciente AS Nombre, tb_paciente.apellido_paciente AS Apellido, tb_procedimiento.tipo_procedimiento
FROM tb_paciente
INNER JOIN tb_procedimiento ON tb_procedimiento.id_procedimiento = tb_paciente.id_procedimiento_paciente;

SELECT *
FROM procedimientos_pacientes;

-- Vista para ver las facturas de cada cliente
CREATE VIEW paciente_factura AS
SELECT  tb_paciente.nombre_paciente AS Nombre, tb_paciente.apellido_paciente AS Apellido, tb_factura.valor_total
FROM tb_paciente
INNER JOIN tb_factura ON tb_factura.id_paciente_factura = tb_paciente.id_paciente;

SELECT *
FROM paciente_factura;

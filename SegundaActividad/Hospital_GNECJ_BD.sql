-- -----------------------------------------------------
-- Creando y usando la BD
-- -----------------------------------------------------
CREATE DATABASE hospital_GNECJ;
USE hospital_GNECJ;

-- -----------------------------------------------------
-- Se crean las tablas correspondientes
-- -----------------------------------------------------
-- Tabla Médico
CREATE TABLE médico (
	id_médico INT AUTO_INCREMENT,
    nombre_médico VARCHAR(40),
    especialidad varchar(100),
    PRIMARY KEY (id_médico)
);
-- Tabla Teléfono del Médico
CREATE TABLE teléfono_médico (
	id_médicoT INT,
    teléfono VARCHAR(15),
    PRIMARY KEY (id_médicoT, teléfono),
    FOREIGN KEY (id_médicoT) REFERENCES médico (id_médico)
);
-- Tabla Enfermero
CREATE TABLE enfermero (
	id_enfermero INT AUTO_INCREMENT,
    nombre_enfermero VARCHAR(40),
    id_médicoE INT,
    PRIMARY KEY (id_enfermero),
    FOREIGN KEY (id_médicoE) REFERENCES médico (id_médico)
);
-- Tabla Teléfono del Enfermero
CREATE TABLE teléfono_enfermero (
	id_enfermeroT INT,
    teléfono VARCHAR(15),
    PRIMARY KEY (id_enfermeroT, teléfono),
    FOREIGN KEY (id_enfermeroT) REFERENCES enfermero (id_enfermero)
);
-- Tabla Procedimiento
CREATE TABLE procedimiento (
	id_procedimiento INT AUTO_INCREMENT,
    tipo VARCHAR(40),
    PRIMARY KEY (id_procedimiento)
);
-- Tabla Realizar
CREATE TABLE realizar (
	id_médicoR INT,
    id_procedimientoR INT,
    PRIMARY KEY (id_médicoR, id_procedimientoR),
    FOREIGN KEY (id_médicoR) REFERENCES médico (id_médico),
    FOREIGN KEY (id_procedimientoR) REFERENCES procedimiento (id_procedimiento)
);
-- Tabla Paciente
CREATE TABLE paciente (
	id_paciente INT AUTO_INCREMENT,
    nombre_paciente VARCHAR(40),
    dirección varchar(100),
    id_procedimientoP INT,
    PRIMARY KEY (id_paciente),
    FOREIGN KEY (id_procedimientoP) REFERENCES procedimiento (id_procedimiento)
);
-- Tabla Teléfono del Paciente
CREATE TABLE teléfono_paciente (
	id_pacienteT INT,
    teléfono VARCHAR(15),
    PRIMARY KEY (id_pacienteT, teléfono),
    FOREIGN KEY (id_pacienteT) REFERENCES paciente (id_paciente)
);
-- Tabla Medicamento
CREATE TABLE medicamento (
	id_medicamento INT AUTO_INCREMENT,
    nombre_medicamento VARCHAR(40),
    dosis VARCHAR(50),
    PRIMARY KEY (id_medicamento)
);
-- Tabla Tomar
CREATE TABLE tomar (
	id_pacienteTo INT,
    id_medicamentoTo INT,
    PRIMARY KEY (id_pacienteTo, id_medicamentoTo),
    FOREIGN KEY (id_pacienteTo) REFERENCES paciente (id_paciente),
    FOREIGN KEY (id_medicamentoTo) REFERENCES medicamento (id_medicamento)
);
-- Tabla Factura
CREATE TABLE factura (
	id_factura INT AUTO_INCREMENT,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total FLOAT,
    id_pacienteF INT,
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_pacienteF) REFERENCES paciente (id_paciente)
);
-- -----------------------------------------------------
-- Ingresando datos a las tablas del Hospital
-- -----------------------------------------------------
USE hospital_GNECJ;

-- Tabla Médico
INSERT INTO médico
VALUES 
	(1, 'Juan', 'Cardiovascular'),
	(2, 'Luis', 'Ortopédico'),
	(3, 'Ana', 'Neuróloga'),
	(4, 'Carlos', 'Estético'),
	(5, 'Sara', 'General');
    
-- Tabla Teléfono Médico
INSERT INTO teléfono_médico
VALUES 
	(1, '1111111111'),
	(2, '2222222222'),
	(3, '3333333333'),
	(4, '4444444444'),
	(5, '5555555555');
    
-- Tabla Enfermero
INSERT INTO enfermero
VALUES 
	(1, 'Maria', 5),
	(2, 'Julian', 4),
	(3, 'David', 3),
	(4, 'Camila', 2),
	(5, 'Danna', 1);
    
-- Tabla Teléfono Enfermero
INSERT INTO teléfono_enfermero
VALUES 
	(1, '1111111110'),
	(2, '2222222220'),
	(3, '3333333330'),
	(4, '4444444440'),
	(5, '5555555550');

-- Tabla Procedimiento
INSERT INTO procedimiento
VALUES 
	(1, 'General'),
	(2, 'Estético'),
	(3, 'Neurológico'),
	(4, 'Ortopédico'),
	(5, 'Cardiovascular');

-- Tabla Realizar
INSERT INTO realizar
VALUES 
	(1, 5),
	(2, 4),
	(3, 3),
	(4, 2),
	(5, 1);

-- Tabla Paciente
INSERT INTO paciente
VALUES 
	(1, 'Ernesto', 'Calle 1 # 1 - 1', 5),
	(2, 'James', 'Calle 1 # 1 - 2', 4),
	(3, 'Mery', 'Calle 1 # 1 - 3', 3),
	(4, 'Barbie', 'Calle 1 # 1 - 4', 2),
	(5, 'Jhon', 'Calle 1 # 1 - 5', 1);
    
-- Tabla Teléfono Paciente
INSERT INTO teléfono_paciente
VALUES 
	(1, '1111111100'),
	(2, '2222222200'),
	(3, '3333333300'),
	(4, '4444444400'),
	(5, '5555555500');

-- Tabla Medicamento
INSERT INTO medicamento
VALUES 
	(1, 'Aspirina', '100 mg'),
	(2, 'Paracetamol', '20 mg'),
	(3, 'Fluoxetina', '30 mg'),
	(4, 'Lumigan', '1 gota'),
	(5, 'Omeprazol', '20 mg');
    
-- Tabla Tomar
INSERT INTO tomar
VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

-- Tabla Factura
INSERT INTO factura
VALUES 
	(1, '2023-01-01 01:00:00', 100, 1),
	(2, '2023-01-02 02:00:00', 500, 2),
	(3, '2023-01-03 03:00:00', 600, 3),
	(4, '2023-01-04 04:00:00', 200, 4),
	(5, '2023-01-05 05:00:00', 300, 5);
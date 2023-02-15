INSERT INTO `consultorio_doctor`.`Enfermero` (`idEnfermero`, `nombre`, `teléfono`, `idMédico_enfermero`)
VALUES 
(1, 'Enf. Juan Pérez', '555-555-5555', 1),
(2, 'Enf. Maria Sánchez', '555-555-5556', 2),
(3, 'Enf. José García', '555-555-5557', 3),
(4, 'Enf. Ana Rodriguez', '555-555-5558', 4),
(5, 'Enf. Pedro Martínez', '555-555-5559', 5);

INSERT INTO `consultorio_doctor`.`Médico` (`idMédico`, `nombre`, `especialidad`, `teléfono`)
VALUES 
(1, 'Dr. Juan Pérez', 'Pediatría', '555-555-5555'),
(2, 'Dra. Maria Sánchez', 'Cardiología', '555-555-5556'),
(3, 'Dr. José García', 'Dermatología', '555-555-5557'),
(4, 'Dra. Ana Rodriguez', 'Oftalmología', '555-555-5558'),
(5, 'Dr. Pedro Martínez', 'Ortopedia', '555-555-5559');

INSERT INTO `consultorio_doctor`.`Procedimiento` (`id_procedimiento`, `tipo`)
VALUES (1, 'Tipo 1'), (2, 'Tipo 2'), (3, 'Tipo 3'), (4, 'Tipo 4'), (5, 'Tipo 5');


INSERT INTO consultorio_doctor.Paciente (id_paciente, nombre, direccion, teléfono, id_procedimiento)
VALUES
(1, 'Juan', 'Calle 1', '555-555-5555', 1),
(2, 'Maria', 'Calle 2', '555-555-5556', 1),
(3, 'Pedro', 'Calle 3', '555-555-5557', 2),
(4, 'Ana', 'Calle 4', '555-555-5558', 2),
(5, 'Jorge', 'Calle 5', '555-555-5559', 3);

INSERT INTO Factura (id_factura, valorTotal, fecha, id_procedimiento_factura)
VALUES (1, '100', '2023-02-14', 1),
       (2, '50', '2023-02-14', 2),
       (3, '75', '2023-02-14', 1),
       (4, '200', '2023-02-14', 3),
       (5, '80', '2023-02-14', 2);

INSERT INTO Medicamento (id_medicamento, nombre, dosis)
VALUES (1, 'Paracetamol', '500mg'),
       (2, 'Ibuprofeno', '400mg'),
       (3, 'Omeprazol', '20mg'),
       (4, 'Amoxicilina', '500mg'),
       (5, 'Loratadina', '10mg');

INSERT INTO Realizar (idMedico_PK, id_procedimiento_PK)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (1, 2),
       (2, 3);

INSERT INTO Tomar (id_pacienteFK, id_medicamentoFK)
VALUES (1, 1),
       (2, 2),
       (3, 1),
       (1, 2),
       (2, 3);

INSERT INTO Atender (id_paciente, id_enfermero, fecha_atencion, hora_atencion)
VALUES
(1, 1, '2022-02-14', '09:00:00'),
(2, 3, '2022-02-15', '10:30:00'),
(3, 2, '2022-02-16', '13:45:00'),
(4, 4, '2022-02-17', '15:00:00'),
(5, 2, '2022-02-18', '16:30:00');
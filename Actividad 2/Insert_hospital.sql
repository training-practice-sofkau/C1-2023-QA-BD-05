use hospital;


INSERT INTO enfermero (id_enfermero, nombre_enfermero, apellido_enfermero, id_medico)
VALUES 
("E001", "Juan", "Pérez", "M001"),
("E002", "María", "García", "M002"),
("E003", "Luis", "Rodríguez", "M003"),
("E004", "Ana", "Martínez", "M004"),
("E005", "Carlos", "Sánchez", "M005");

INSERT INTO medico (id_medico, nombre_medico, apellido_medico, especialidad)
VALUES 
("M001", "Juan", "Pérez", "Cardiología"),
("M002", "María", "García", "Pediatría"),
("M003", "Luis", "Rodríguez", "Neurología"),
("M004", "Ana", "Martínez", "Ginecología"),
("M005", "Carlos", "Sánchez", "Ortopedia");

INSERT INTO telefono_medico (id_medico, telefono)
VALUES 
("M001", "5551"),
("M002", "5552"),
("M003", "5553"),
("M004", "5554"),
("M005", "5555");


INSERT INTO telefono_enfermero (id_enfermero, telefono)
VALUES 
("E001", "1551"),
("E002", "2552"),
("E003", "3553"),
("E004", "4554"),
("E005", "5555");


INSERT INTO telefono_paciente (id_paciente, telefono)
VALUES 
("P001", "15510"),
("P002", "25520"),
("P003", "35530"),
("P004", "45540"),
("P005", "55550");

INSERT INTO medicamento (id_medicamento, nombre_medicamento, dosis)
VALUES 
("M001", "Ibuprofeno", "200mg"),
("M002", "Paracetamol", "500mg"),
("M003", "Aspirina", "300mg"),
("M004", "Amoxicilina", "500mg"),
("M005", "Metamizol", "500mg");

INSERT INTO paciente (id_paciente, nombre_paciente, direccion, id_procedimiento)
VALUES 
("P001", "Juan", "Calle 123", "PR001"),
("P002", "María", "Calle 456", "PR002"),
("P003", "Luis", "Calle 789", "PR003"),
("P004", "Ana", "Calle 111", "PR004"),
("P005", "Carlos", "Calle 222", "PR005");


INSERT INTO paciente_medicamento (id_paciente, id_medicamento)
VALUES 
("P001", "M001"),
("P002", "M002"),
("P003", "M003"),
("P004", "M004"),
("P005", "M005");

INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento)
VALUES 
("PR001", "Cirugía cardíaca"),
("PR002", "Extracción de muela"),
("PR003", "Cirugía de columna"),
("PR004", "Amigdalectomía"),
("PR005", "Cirugía de cataratas");

INSERT INTO medico (id_medico, nombre_medico, apellido_medico, especialidad)
VALUES 
("M001", "Juan", "Pérez", "Cardiología"),
("M002", "María", "García", "Pediatría"),
("M003", "Luis", "Rodríguez", "Neurología"),
("M004", "Ana", "Martínez", "Ginecología"),
("M005", "Carlos", "Sánchez", "Ortopedia");


INSERT INTO medico_procedimiento (id_medico, id_procedimiento)
VALUES 
("M001", "PR001"),
("M002", "PR002"),
("M003", "PR003"),
("M004", "PR004"),
("M005", "PR005");

INSERT INTO factura (id_factura, fecha, valor_total, id_paciente)
VALUES 
("F001", "13/01/2023", "500000", "P001"),
("F002", "11/02/2023", "1000000", "P002"),
("F003", "18/05/2023", "80000", "P003"),
("F004", "21/04/2023", "30000", "P004"),
("F005", "30/09/2023", "3005000", "P005")


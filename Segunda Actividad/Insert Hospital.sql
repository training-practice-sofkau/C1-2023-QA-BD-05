USE hospital;

SELECT * FROM tb_medico;

INSERT INTO tb_medico (id_medico, nombre_medico, apellido_medico, especialidad)
VALUES
("M1", "Santiago", "García", "Cardiología"),
("M2", "Valentina", "Rodríguez", "Pediatría"),
("M3", "Mariela", "Molina", "Dermatología"),
("M4", "Andrea", "López", "Ginecología"),
("M5", "Carlos", "Martínez", "Neurología");

SELECT * FROM telefono_medico;

INSERT INTO telefono_medico (id_medico, telefono)
VALUES 
("M1", "3231214500"),
("M2", "3149876543"),
("M3", "3121098765"),
("M4", "3214120456"),
("M5", "6067236548");


SELECT * FROM tb_enfermero;

INSERT INTO tb_enfermero (id_enfermero, nombre_enfermero, apellido_enfermero, id_medico)
VALUES 
("E1", "Liliana", "Ruiz Lopez", "M1"),
("E2", "María", "Gonzalez Perez", "M2"),
("E3", "Carlos", "Perez Herrera", "M3"),
("E4", "Ana", "Hernandez Santos", "M4"),
("E5", "Juan", "Rodriguez Garcia", "M5");

SELECT * FROM telefono_enfermero;

INSERT INTO telefono_enfermero (id_enfermero, telefono)
VALUES
("E1", "3171234567"),
("E2", "3181234567"),
("E3", "3191234567"),
("E4", "3161234567"),
("E5", "3151234567");


SELECT * FROM tb_medicamento;

INSERT INTO tb_medicamento (id_medicamento, nombre_medicamento, dosis)
VALUES
("med1", "Nitroglicerina", "1 comprimido sublingual cada 30 minutos"),
("med2", "Acetaminofén", "2 comprimidos cada 6 horas"),
("med3", "Betametasona", "1 crema aplicada en la piel cada 12 horas"),
("med4", "Metformina", "1 comprimido cada 8 horas"),
("med5", "Clonazepam", "1 comprimido cada 8 horas");


SELECT * FROM tb_procedimiento;

INSERT INTO tb_procedimiento (id_procedimiento, tipo_procedimiento)
VALUES
("pro1", "Cateterismo Cardíaco"),
("pro2", "Vacunación infantil"),
("pro3", "Biopsia de piel"),
("pro4", "Citología cervical"),
("pro5", "Estudio de EEG");

SELECT * FROM tb_paciente;

INSERT INTO tb_paciente (id_paciente, nombre_paciente, direccion, id_procedimiento)
VALUES
("pac001", "Luz Adriana Rodriguez", "Calle 123", "pro1"),
("pac002", "Juan Manuel Sánchez", "Calle 456", "pro2"),
("pac003", "María Cristina García", "Calle 789", "pro3"),
("pac004", "Sofía Elena Díaz", "Calle 246", "pro4"),
("pac005", "Andrés Felipe Ortiz", "Calle 369", "pro5");

SELECT * FROM telefono_paciente;

INSERT INTO telefono_paciente (id_paciente, telefono)
VALUES
("pac001", "3241234567"),
("pac002", "3145670001"),
("pac003", "3110114253"),
("pac004", "3201234567"),
("pac005", "3122434055");


SELECT * FROM dll_medico_procedimiento;

INSERT INTO dll_medico_procedimiento (id_medico_procedimiento, id_medico, id_procedimiento)
VALUES
("medpro001", "M1", "pro1"),
("medpro002", "M2", "pro2"),
("medpro003", "M3", "pro3"),
("medpro004", "M4", "pro4"),
("medpro005", "M5", "pro5");

SELECT * FROM dll_paciente_medicamento;

INSERT INTO dll_paciente_medicamento (id_paciente_medicamento, id_paciente, id_medicamento)
VALUES
("pamed001", "pac001", "med1"),
("pamed002", "pac002", "med2"),
("pamed003", "pac003", "med3"),
("pamed004", "pac004", "med4"),
("pamed005", "pac005", "med5");

SELECT * FROM tb_factura;

INSERT INTO tb_factura (id_factura, fecha, valor_total, id_paciente)
VALUES 
("1", "2023-02-13", "250.000", "pac001"),
("2", "2023-02-14", "117.000", "pac002"),
("3", "2023-02-15", "300.000", "pac003"),
("4", "2023-02-16", "1.500.000", "pac004"),
("5", "2023-02-17", "480.000", "pac005");

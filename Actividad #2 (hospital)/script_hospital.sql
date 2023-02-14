-- Creación de la base de datos hospital 
CREATE DATABASE if not exists db_hospital; 

-- Indica cuál será la BD a la cual se le aplicarán las siguientes consultas: 
USE db_hospital; 

-- Creación de la tabla procedimiento
CREATE TABLE tb_procedimiento(
id_procedimiento VARCHAR(10) NOT NULL, 
tipo_procedimiento VARCHAR(30) NOT NULL, 
PRIMARY KEY(id_procedimiento)
);

-- Creación de la tabla médico
CREATE TABLE tb_medico (
id_medico VARCHAR(10) NOT NULL, 
nombre_medico VARCHAR(40) NOT NULL, 
apellido_medico VARCHAR(40) NOT NULL, 
especialidad VARCHAR(20) NOT NULL,
PRIMARY KEY(id_medico)
);

-- Creación de la tabla medicamento
CREATE TABLE tb_medicamento(
id_medicamento VARCHAR(10) NOT NULL, 
nombre_medicamento VARCHAR(25) NOT NULL, 
dosis VARCHAR(15) NOT NULL, 
PRIMARY KEY(id_medicamento)
);

-- Creación de la tabla paciente
CREATE TABLE tb_paciente(
id_paciente VARCHAR(10) NOT NULL,
nombre_paciente VARCHAR(40) NOT NULL, 
apellido_paciente VARCHAR(40) NOT NULL,
direccion VARCHAR(30) NOT NULL,
id_procedimiento VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_paciente),
FOREIGN KEY(id_procedimiento) REFERENCES tb_procedimiento(id_procedimiento)
);

-- Creación de la tabla teléfono paciente
CREATE TABLE tb_telefono_paciente (
id_paciente VARCHAR(10) NOT NULL, 
telefono VARCHAR(15) NOT NULL,
PRIMARY KEY(id_paciente, telefono), 
FOREIGN KEY(id_paciente) REFERENCES tb_paciente(id_paciente)
);

-- Creación de la tabla enfermero
CREATE TABLE tb_enfermero(
id_enfermero VARCHAR(10) NOT NULL,
nombre_enfermero VARCHAR(40) NOT NULL, 
apellido_enfermero VARCHAR(40) NOT NULL, 
id_medico VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_enfermero), 
FOREIGN KEY(id_medico) REFERENCES tb_medico(id_medico)
);

-- Creación de la tabla teléfono enfermero
CREATE TABLE tb_telefono_enfermero(
id_enfermero VARCHAR(10) NOT NULL,
telefono VARCHAR(15) NOT NULL, 
PRIMARY KEY(id_enfermero, telefono), 
FOREIGN KEY(id_enfermero) REFERENCES tb_enfermero(id_enfermero)
);

-- Creación de la tabla teléfono médico
CREATE TABLE tb_telefono_medico (
id_medico VARCHAR(10) NOT NULL, 
telefono VARCHAR(15) NOT NULL,
PRIMARY KEY(id_medico, telefono), 
FOREIGN KEY(id_medico) REFERENCES tb_medico(id_medico)
);

-- -- Creación de la tabla de detalle paciente medicamento
CREATE TABLE dll_paciente_medicamento (
id_paciente_medicamento VARCHAR(10) NOT NULL, 
id_paciente VARCHAR(10) NOT NULL, 
id_medicamento VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_paciente_medicamento),
FOREIGN KEY(id_paciente) REFERENCES tb_paciente(id_paciente),
FOREIGN KEY(id_medicamento) REFERENCES tb_medicamento(id_medicamento)
);

-- Creación de la tabla de detalle médico procedimiento
CREATE TABLE dll_medico_procedimiento(
id_medico_procedimiento VARCHAR(10) NOT NULL, 
id_medico VARCHAR(10) NOT NULL,
id_procedimiento VARCHAR(10) NOT NULL,
PRIMARY KEY(id_medico_procedimiento), 
FOREIGN KEY(id_medico) REFERENCES tb_medico(id_medico),
FOREIGN KEY(id_procedimiento) REFERENCES tb_procedimiento(id_procedimiento)
);

-- Creación de la tabla factura 
CREATE TABLE tb_factura (
id_factura VARCHAR(10) NOT NULL, 
fecha VARCHAR(20) NOT NULL,
valor_total VARCHAR(10) NOT NULL,
id_paciente VARCHAR(10) NOT NULL, 
PRIMARY KEY(id_factura), 
FOREIGN KEY(id_paciente) REFERENCES tb_paciente(id_paciente)
);

-- Se insertan datos en la tabla procedimiento 
INSERT INTO tb_procedimiento(id_procedimiento, tipo_procedimiento)
VALUES ('1', 'Cirugía cardíaca'),
('2', 'Cirugía curativa'),
('3', 'Cirugía paliativa'),
('4', 'Cirugía exploratoria'),
('5', 'Cirugía diagnóstica'); 

-- Se insertan datos en la tabla médico 
INSERT INTO tb_medico(id_medico, nombre_medico, apellido_medico, especialidad)
VALUES('13547899', 'Antonio', 'Pérez López', 'Anestesiología'),
('458796584', 'Ana', 'Monsalve', 'Cardiología'),
('657489658', 'Maria', 'Taborda Rendón', 'Endocrinología'),
('245786354', 'Jairo', 'Mosquera Lopera', 'Oftalmología'),
('425875148', 'Alejandro', 'Serna Agudelo', 'Otorrinolaringología'); 

-- Se insertan datos en la tabla medicamento
INSERT INTO tb_medicamento(id_medicamento, nombre_medicamento, dosis)
VALUES ('145', 'naproxeno', '200mg'),
('465', 'celecoxib', '150mg'),
('324', 'ibuprofeno', '300mg'),
('874', 'ketorolaco', '50mg'),
('957', 'acetaminofén ', '150mg'); 

-- Se insertan datos a la tabla paciente 
INSERT INTO tb_paciente (id_paciente, nombre_paciente, apellido_paciente, direccion, id_procedimiento)
VALUES ('49875124', 'Tatiana', 'Monsalve Herrera', 'cll 24 #89-12', '1'),
('49251875', 'Catalina', 'Cardona Bustamante', 'cll 87 #87-58', '2'),
('57412698', 'Valeria', 'Aguirre Montoya', 'cra 56 #58-78', '2'),
('32148556', 'Daniela', 'Castro Torres', 'cll 76 #74-52', '3'),
('28446468', 'Maritza', 'Taborda Giraldo', 'cra 23 #45-76', '5');

-- Se insertan datos a la tabla teléfono paciente 
INSERT INTO tb_telefono_paciente (id_paciente, telefono)
VALUES ('49875124', '3121028745'),
('49251875', '3452147021'),
('57412698', '3100546544'),
('32148556', '3004464648'),
('28446468', '3044545451');

-- Insertar datos en la tabla enfermero 
INSERT INTO tb_enfermero(id_enfermero, nombre_enfermero, apellido_enfermero, id_medico)
VALUES ('13541258', 'Ángel', 'Aguirre Bustamante', '13547899'),
('25489647', 'Antonio', 'Herrera Patiño', '458796584'),
('25698741', 'Angélica', 'Gómez Pérez', '657489658'),
('42156465', 'Maria', 'Mosquera Giraldo', '245786354'),
('64454454', 'Andrea', 'Taborda Pérez', '425875148');

-- Insertar datos en la tabla detalle paciente medicamento
INSERT INTO dll_paciente_medicamento(id_paciente_medicamento, id_paciente, id_medicamento)
VALUES('1', '49875124', '145'),
('2', '49251875', '465'),
('3', '57412698', '324'),
('4', '32148556', '324'),
('5', '28446468', '957');

-- Insertar datos en la tabla detalle médico procedimiento
INSERT INTO dll_medico_procedimiento(id_medico_procedimiento, id_medico, id_procedimiento) 
VALUES ('1', '13547899', '1'),
('2', '458796584', '2'),
('3', '657489658', '3'),
('4', '245786354', '4'),
('5', '425875148', '5');

-- Insertar datos en la tabla factura 
INSERT INTO tb_factura(id_factura, fecha, valor_total, id_paciente)
VALUES ('F647', '12/01/2023', '15000', '49875124'),
('F135', '08/01/2022', '8000', '49251875'),
('F021', '15/02/2022', '20000', '57412698'),
('F754', '02/10/2021', '13000', '32148556'),
('F325', '25/11/2022', '14000', '28446468');  

-- Se insertan datos a la tabla teléfono enfermero 
INSERT INTO tb_telefono_enfermero (id_enfermero, telefono)
VALUES ('13541258', '3121547525'),
('25489647', '3201456987'),
('25698741', '3215465431'),
('42156465', '3001456465'),
('64454454', '3115454466');

-- Se insertan datos a la tabla teléfono médico 
INSERT INTO tb_telefono_medico (id_medico, telefono)
VALUES('13547899', '3201557854'),
('458796584', '3202541200'),
('657489658', '3054546484'),
('245786354', '3154165468'),
('425875148', '3154564854'); 

-- Se consultan todos los registros de cada una de las tablas 
SELECT * 
FROM tb_telefono_medico;

SELECT * 
FROM tb_medico; 

SELECT * 
FROM tb_procedimiento;

SELECT *
FROM tb_medicamento;

SELECT * 
FROM tb_paciente; 

SELECT * 
FROM tb_telefono_paciente; 

SELECT *
FROM tb_enfermero; 

SELECT *
FROM tb_telefono_enfermero;

SELECT * 
FROM dll_paciente_medicamento;

SELECT * 
FROM dll_medico_procedimiento;

SELECT * 
FROM tb_factura; 


-- Consulta #1. Conocer que medicamentos a tomado cada paciente y la dosis suministrada.
SELECT tb_paciente.id_paciente AS "Documento paciente", tb_paciente.nombre_paciente AS "Nombre", tb_paciente.apellido_paciente AS "Apellido", tb_medicamento.nombre_medicamento AS "Medicamento", tb_medicamento.dosis 
FROM tb_paciente  
INNER JOIN dll_paciente_medicamento ON tb_paciente.id_paciente = dll_paciente_medicamento.id_paciente
INNER JOIN tb_medicamento ON dll_paciente_medicamento.id_medicamento = tb_medicamento.id_medicamento; 

-- Consulta #2. Conocer que enfermeros estuvieron en los procedimientos de los pacientes.
SELECT CONCAT(tb_enfermero.nombre_enfermero, " " , tb_enfermero.apellido_enfermero) AS "Nombre enfermero", 
CONCAT(tb_paciente.nombre_paciente, " " , tb_paciente.apellido_paciente) AS "Nombre del paciente", 
tb_procedimiento.tipo_procedimiento AS "Tipo de procedimiento"
FROM tb_paciente 
INNER JOIN tb_procedimiento ON tb_procedimiento.id_procedimiento = tb_paciente.id_procedimiento 
INNER JOIN dll_medico_procedimiento ON dll_medico_procedimiento.id_procedimiento = tb_procedimiento.id_procedimiento
INNER JOIN tb_medico ON tb_medico.id_medico = dll_medico_procedimiento.id_medico
INNER JOIN tb_enfermero ON tb_enfermero.id_medico = tb_medico.id_medico;

-- Creación de vistas 
-- Vista #1: Contiene la consulta que muestra toda la información de los enfermeros que acompañan los médicos 
CREATE VIEW presencia_enfermero AS
SELECT tb_enfermero.nombre_enfermero, tb_medico.nombre_medico
FROM tb_medico 
INNER JOIN tb_enfermero ON tb_enfermero.id_medico = tb_medico.id_medico 
INNER JOIN tb_telefono_enfermero ON tb_telefono_enfermero.id_enfermero = tb_enfermero.id_enfermero;

SELECT *
FROM presencia_enfermero;

-- Vista #2: Contiene la consulta de los enfermeros que estuvieron en los procedimientos de los pacientes.
CREATE VIEW enfermero_procedimiento AS
SELECT tb_enfermero.nombre_enfermero, tb_paciente.nombre_paciente, tb_procedimiento.tipo_procedimiento
FROM tb_paciente 
INNER JOIN tb_procedimiento ON tb_procedimiento.id_procedimiento = tb_paciente.id_procedimiento 
INNER JOIN dll_medico_procedimiento ON dll_medico_procedimiento.id_procedimiento = tb_procedimiento.id_procedimiento
INNER JOIN tb_medico ON tb_medico.id_medico = dll_medico_procedimiento.id_medico
INNER JOIN tb_enfermero ON tb_enfermero.id_medico = tb_medico.id_medico;

SELECT * 
FROM enfermero_procedimiento;

-- Vista #3: Contiene la consulta de los medicamentos que ha tomado cada paciente y la dosis suministrada.
CREATE VIEW medicamentos_paciente AS
SELECT tb_paciente.id_paciente, tb_medicamento.nombre_medicamento, tb_medicamento.dosis 
FROM tb_paciente  
INNER JOIN dll_paciente_medicamento ON tb_paciente.id_paciente = dll_paciente_medicamento.id_paciente
INNER JOIN tb_medicamento ON dll_paciente_medicamento.id_medicamento = tb_medicamento.id_medicamento; 

SELECT * 
FROM medicamentos_paciente;


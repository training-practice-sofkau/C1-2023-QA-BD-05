CREATE DATABASE Hospital;
USE Hospital;
#Medico---------------------------
CREATE TABLE IF NOT EXISTS medico(
	id_medico VARCHAR(10) PRIMARY KEY,
    nombre_medico VARCHAR(45),
    apellido_medico VARCHAR(45),
    especialidad VARCHAR(45)
);

#Telefono_medico---------------------------
CREATE TABLE IF NOT EXISTS telefono_medico(
	medico_id VARCHAR(10),
    telefono_medico VARCHAR(15),
    PRIMARY KEY (medico_id,telefono_medico),
    FOREIGN KEY (medico_id) REFERENCES medico(id_medico)
);

#Enfermero---------------------------
CREATE TABLE IF NOT EXISTS enfermero(
	id_enfermero VARCHAR(10) PRIMARY KEY,
    nombre_enfermero VARCHAR(50),
    apellido_enfermero VARCHAR(50),
    medicoID VARCHAR(10),
    FOREIGN KEY (medicoID) REFERENCES medico(id_medico)
);

#Telefono_enfermero---------------------------
CREATE TABLE IF NOT EXISTS telefono_enfermero(
	enfermero_id VARCHAR(10),
    telefono_enfermero VARCHAR(15),
    PRIMARY KEY(enfermero_id,telefono_enfermero),
    FOREIGN KEY(enfermero_id) REFERENCES enfermero(id_enfermero)
);

#Procedimiento---------------------------
CREATE TABLE IF NOT EXISTS procedimiento(
	id_procedimiento VARCHAR(10) PRIMARY KEY,
    tipo_procedimiento VARCHAR(20)
);

#Dll_enfermero_procedimiento---------------------------
CREATE TABLE IF NOT EXISTS dll_enfermero_procedimiento(  
    id_enfermero_procedimiento VARCHAR(10),
    id_procedimiento_enfermero VARCHAR(10),
    PRIMARY KEY( id_enfermero_procedimiento,id_procedimiento_enfermero),
    FOREIGN KEY( id_enfermero_procedimiento)REFERENCES enfermero(id_enfermero),
    FOREIGN KEY(id_procedimiento_enfermero)REFERENCES procedimiento(id_procedimiento)
);

#Paciente---------------------------
CREATE TABLE IF NOT EXISTS paciente(
	id_paciente VARCHAR(10) PRIMARY KEY, 
    nombre_paciente VARCHAR(50),
    apellido_paciente VARCHAR(50),
    direccion VARCHAR(50),
    id_procedimiento_paciente VARCHAR(20),
    FOREIGN KEY(id_procedimiento_paciente) REFERENCES procedimiento(id_procedimiento)
);

#Telefono paciente---------------------------
CREATE TABLE IF NOT EXISTS telefono_paciente(
	id_paciente_telefono VARCHAR(10), 
    telefono_paciente VARCHAR(15),
    PRIMARY KEY(id_paciente_telefono,telefono_paciente),
    FOREIGN KEY(id_paciente_telefono) REFERENCES paciente(id_paciente)
);

#Factura---------------------------
CREATE TABLE IF NOT EXISTS factura(
	id_factura VARCHAR(10) PRIMARY KEY, 
    fecha VARCHAR(20),
    valor_total double,
    id_paciente_factura varchar(10),
    FOREIGN KEY(id_paciente_factura) REFERENCES paciente(id_paciente)
);

#Medicamento---------------------------
CREATE TABLE IF NOT EXISTS medicamento(
	id_medicamento VARCHAR(10) PRIMARY KEY,
    nombre_medicamento VARCHAR(50),
    dosis VARCHAR(50)
);

#Dll_paciente_medicamento---------------------------
CREATE TABLE  IF NOT EXISTS dll_paciente_medicamento(   
	id_paciente_medicamento VARCHAR(10),
    id_medicamento_paciente VARCHAR(10),
    PRIMARY KEY(id_paciente_medicamento,id_medicamento_paciente),
    FOREIGN KEY(id_paciente_medicamento) REFERENCES paciente(id_paciente),
    FOREIGN KEY(id_medicamento_paciente) REFERENCES medicamento(id_medicamento)
);


#Registros 
INSERT INTO medico (id_medico,nombre_medico,apellido_medico,especialidad) VALUES 
("1122","Grace","Anatomy","Oftamología"),
("1123","Shaun","Porter","Otorrinolaringología"),
("1124","Pepo","Perez","Dermatologo"),
("1125","Maria","Lin","General"),
("1126","Doctor","Sueño","Psiquiatra");


INSERT INTO telefono_medico(medico_id,telefono_medico) VALUES
("1122","312345"),
("1124","313254"),
("1123","314654"),
("1125","315789"),
("1126","316908");

INSERT INTO enfermero (id_enfermero,nombre_enfermero,apellido_enfermero,medicoID) VALUES
("3344", "Poncho", "Tevez", "1122"),
("3345", "Lolo", "Torres", "1123"),
("3346", "Juan", "Reyes", "1122"),
("3347", "Morty", "Smith", "1125"),
("3348", "Rick", "Sanchez", "1126");


INSERT INTO telefono_enfermero(enfermero_id,telefono_enfermero) VALUES
("3344","212345"),
("3346","123456"),
("3344","543212"),
("3345","612345"),
("3347","712324");


INSERT INTO procedimiento(id_procedimiento,tipo_procedimiento) VALUES
("PRO1","Revision ojos"),
("PRO2","Revisión nariz"),
("PRO3","Biopsia"),
("PRO4","Revision"),
("PRO5","Lobotomía");


INSERT INTO dll_enfermero_procedimiento(id_enfermero_procedimiento,id_procedimiento_enfermero) VALUES
("3344","PRO1"),
("3345","PRO2"),
("3344","PRO3"),
("3348","PRO4"),
("3347","PRO5");


INSERT INTO paciente(id_paciente,nombre_paciente,apellido_paciente,direccion, id_procedimiento_paciente) VALUES
("5566","Lionel","Messi","carrera 2","PRO1"),
("5567","Elio","Hoyos","calle 34","PRO2"),
("5568","Pepa","Pig","Calle Inglaterra","PRO3"),
("5569","Mario","Casas","calle madrid","PRO4"),
("5570","Tito","Martinez","carrera 34","PRO5");


INSERT INTO telefono_paciente(id_paciente_telefono,telefono_paciente) VALUES
("5566","312"),
("5566","313"),
("5568","314"),
("5570","315"),
("5568","316");


INSERT INTO factura(id_factura,fecha,valor_total, id_paciente_factura) VALUES
("FOR1","1963-22-11",120000,"5566"),
("FOR2","2021-12-10",360000,"5567"),
("FOR3","2021-11-11",252000,"5566"),
("FOR4","2024-14-11",140000,"5570"),
("FOR5","2023-02-11",520000,"5569");




INSERT INTO medicamento(id_medicamento,nombre_medicamento,dosis) VALUES
("ME1","Paracetamol","1 cada 8 horas"),
("ME2","Acetaminofen","1 cada 8 horas"),
("M3","Aspirina","1 cada 16 horas"),
("ME4","Chiquitolina","1 cada 8 horas"),
("ME5","Quetiapina","1 cada 16 horas");



INSERT INTO dll_paciente_medicamento(id_paciente_medicamento,  id_medicamento_paciente) VALUES
("5567","ME1"),
("5566","ME4"),
("5568","ME1"),
("5570","ME2"),
("5569","ME1");
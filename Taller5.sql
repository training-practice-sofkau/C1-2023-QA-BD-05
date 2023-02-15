create database clinica_sofka;

create table enfermero(
ID_enfermero varchar(15) primary key,
Nombre_enfermero varchar(100),
ID_medico_enfermero varchar(15),
foreign key(ID_medico_enfermero) REFERENCES  medico(ID_medico)
);


create table telefono_enfermero(
Telefono varchar(15) primary key,
ID_enfermero_telefono varchar(100),
foreign key(ID_enfermero_telefono) REFERENCES  enfermero(ID_enfermero)
);

create table medico(
ID_medico varchar(15) primary key,
Nombre_medico varchar(100),
Especialidad_medico varchar(100)
);

create table telefono_medico(
Telefono_medico varchar(15) primary key,
ID_medico_telefono varchar(100),
foreign key(ID_medico_telefono) REFERENCES  medico(ID_medico)
);

create table medico_procedimiento(
ID_procedimiento_medico varchar(15) primary key,
ID_medico_procedimiento varchar(100),
foreign key(ID_procedimiento_medico) REFERENCES  procedimiento(ID_procedimiento),
foreign key(ID_medico_procedimiento) REFERENCES  medico(ID_medico)
);

create table procedimiento(
ID_procedimiento varchar(15) primary key,
tipo_procedimiento varchar(100)
);

create table paciente(
ID_paciente varchar(15) primary key,
Nombre_paciente varchar(100),
Direccion_paciente varchar(100),
ID_procedimiento_paciente varchar(15),
foreign key(ID_procedimiento_paciente) REFERENCES  procedimiento(ID_procedimiento)
);

create table telefono_paciente(
Telefono_paciente varchar(15) primary key,
ID_paciente_telefono varchar(100),
foreign key(ID_paciente_telefono) REFERENCES  paciente(ID_paciente)
);

create table medicamento(
ID_medicamento varchar(15) primary key,
Nombre_medicamento varchar(100),
Dosis_medicamento varchar(100)
);

create table paciente_medicamento(
ID_paciente_medicamento varchar(15) primary key,
ID_medicamento_paciente varchar(100),
foreign key(ID_paciente_medicamento) REFERENCES  paciente(ID_paciente),
foreign key(ID_medicamento_paciente) REFERENCES  medicamento(ID_medicamento)
);

create table factura(
ID_factura varchar(15) primary key,
Fecha_factura varchar(100),
Valor_factura varchar(100),
ID_paciente_factura varchar(15),
foreign key(ID_paciente_factura) REFERENCES paciente(ID_paciente)
);


insert into enfermero(ID_enfermero,Nombre_enfermero,ID_medico_enfermero) 
values (123,'Gina',432443),
(543543,'Cristina',434238),
(868768,'Hugo',654676),
(865341,'Daniela',654654),
(123789,'Ingrid',654635);

insert into telefono_enfermero(Telefono,ID_enfermero_telefono) 
values (5675,123),
(324567,543543),
(2545676,868768),
(678647,865341),
(56547,123789);

insert into medico(ID_medico,Nombre_medico,Especialidad_medico) 
values (432443, 'Laura', 'Cardiologo'),
(434238, 'Efrain','oral y maxilofacial'),
(654676,'Juan','ortopédica y traumatología'),
(654654, 'Andres','pediátrica'),
(654635,'Juana','Neurocirugía');

insert into telefono_medico(Telefono_medico,ID_medico_telefono) 
values (567567567,1),
(32456769,432443),
(254567687,434238),
(67864736,654654),
(5654763,654635);

insert into procedimiento(ID_procedimiento,tipo_procedimiento) 
values (7878973127, 'Cardiologia'),
(654685901,'maxilofacial'),
(123895430,'ortopédica'),
(10954756,'pediátrica'),
(75090978901,'Neurocirugía');

insert into medico_procedimiento(ID_procedimiento_medico,ID_medico_procedimiento) 
values (7878973127,432443),
(654685901,434238),
(123895430,654676),
(10954756,654654),
(75090978901,654635);

insert into paciente(ID_paciente,Nombre_paciente,Direccion_paciente,ID_procedimiento_paciente) 
values (1, 'Andrea','cr 55',7878973127),
(2,'Lucas','cr 60',654685901),
(3,'Jhon','cr40',123895430),
(4,'Lisa','cl102',10954756),
(5,'Ruben','cr30',75090978901);

insert into telefono_paciente(Telefono_paciente,ID_paciente_telefono) 
values (567567567,1),
(32456769,2),
(254567687,3),
(67864736,4),
(5654763,5);

insert into paciente_medicamento(ID_paciente_medicamento,ID_medicamento_paciente) 
values (1,60),
(2,70),
(3,80),
(4,90),
(5,100);

insert into medicamento(ID_medicamento,Nombre_medicamento,Dosis_medicamento) 
values (60, 'Acetaminofén','40 tabletas'),
(70,'Dolex','150 tabletas'),
(80,'Pregabalina','100 tabletas'),
(90,'Celecoxid','50 tabletas'),
(100,'Adorén','10 tabletas');

insert into factura(ID_factura,Fecha_factura,Valor_factura,ID_paciente_factura) 
values (606, '01/06/2022',3000000,1),
(707,'02/07/2022',1200000,2),
(808,'20/10/2022',90000,3),
(909,'05/12/2022',5000000,4),
(1001,'30/01/2022',1000000,5);

SELECT Nombre_medicamento,Dosis_medicamento FROM clinica_sofka.medicamento 
join paciente_medicamento on ID_medicamento_paciente = ID_medicamento 
join paciente on ID_paciente = ID_paciente_medicamento ;

SELECT Nombre_paciente,Nombre_enfermero FROM clinica_sofka.paciente 
join procedimiento on ID_procedimiento=ID_procedimiento_paciente
join medico_procedimiento on ID_procedimiento_medico = ID_procedimiento
join enfermero on ID_medico_enfermero = ID_medico_procedimiento;

#Primera vista actividad 2

select * from info_procedimiento;


#Segunda vista actividad 2

select * from Costo_factura;

#Tercera vista actividad 2

select * from Total_facturas;
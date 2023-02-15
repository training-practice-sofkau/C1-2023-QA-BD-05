CREATE DATABASE IF NOT EXISTS HospitalEnfermitas;
USE  HospitalEnfermitas;

Create Table Medico(
idMedico varchar(20) primary key,
nombreMedico varchar(50),
apellidoMedico varchar(50),
especialidad varchar(60)
);

Create Table TelefonoMedico(
idMedico varchar(20),
telefono varchar(50),
primary key(idMedico,telefono),
foreign key(idMedico) references Medico(idMedico)
);

Create Table Enfermero(
idEnfermero varchar(20) primary key,
nombreEnfermero varchar(50),
apellidoEnfermero varchar(50),
idMedicofkM varchar(20),
foreign key(idMedicofkM) references Medico(idMedico)
);

Create Table TelefonoEnfermero(
idEnfermero varchar(20),
telefono varchar(50),
primary key(idEnfermero,telefono),
foreign key(idEnfermero) references Enfermero(idEnfermero)
);

Create Table Procedimiento(
idProcedimiento varchar(20) primary key,
tipoProcedimiento varchar(50)
);

Create Table RelacionMedicoProcedimiento(
idMedicofkRMP varchar(20),
idProcedimientofkRMP varchar(20),
primary key(idMedicofkRMP,idProcedimientofkRMP),
foreign key(idMedicofkRMP) references Medico(idMedico),
foreign key(idProcedimientofkRMP) references Procedimiento(idProcedimiento)
);

Create Table Paciente(
idPaciente varchar(20) primary key,
nombrePaciente varchar(50),
apellidoPaciente varchar(50),
direccion varchar(50),
idProcedimientofkPaciente varchar(20),
foreign key(idProcedimientofkPaciente) references Procedimiento(idProcedimiento)
);

Create Table TelefonoPaciente(
idPaciente varchar(20),
telefono varchar(50),
primary key(idPaciente,telefono),
foreign key(idPaciente) references Paciente(idPaciente)
);

Create Table Facture(
idFactura varchar(20) primary key,
fecha varchar(20),
valorTotal double,
idPacientefkFacture varchar(20),
foreign key(idPacientefkFacture) references Paciente(idPaciente)
);

Create Table Medicamento(
idMedicamento varchar(20) primary key ,
nombreMedicamento varchar(50),
dosis varchar(50)
);

Create Table RelacionPacienteMedicamento(
idPacienteFK varchar(20),
idMedicamentoFK varchar(20),
primary key(idPacienteFK,idMedicamentoFK),
foreign key(idPacienteFK) references Paciente(idPaciente),
foreign key(idMedicamentoFK) references Medicamento(idMedicamento)
);

-- Registros Medicos procedimiento
INSERT INTO Medico (`idmedico`,`nombreMedico`,`apellidoMedico`,`especialidad`) values
("1","Santy","Ramirez","Optamologia"),
("2","Pablo","Castro","Dentista"),
("3","Bart","Simpson","Pediatria"),
("4","Goku","Son","Pedriatria"),
("5","Pedro","Perez","Traumas ");

-- Registros telefono Medico

insert into telefonoMedico(`idMedico`,`telefono`) 
values
("1","12345"),
("1","123456"),
("2","23456"),
("3","3456"),
("4","456"),
("5","56");

-- Registros enfermero
insert into Enfermero (`idEnfermero`,`nombreEnfermero`,`apellidoEnfermero`,`idMedicofkM`)
values
("1", "Pepita", "Perez", "1"),
("2", "Elma", "Tillo", "2"),
("3", "Tortu", "Guita", "3"),
("4", "Donald", "Trump", "4"),
("5", "Josefa", "Arenas", "5");


-- Registros telefono Enfermero
insert into telefonoEnfermero(`idEnfermero`,`telefono`) 
values
("1","123456789"),
("2","23456789"),
("3","3456789"),
("3","345678910"),
("4","456789"),
("4","45678910"),
("5","56789");

-- Registros Procedimiento
insert into Procedimiento(`idProcedimiento`,`tipoProcedimiento`) 
values
("1","Prevencion"),
("2","Cita medica de seguimiento"),
("3","Control diabetes"),
("4","Control reumatologia"),
("5","Intervencion quirurgica");

-- Resgistros relacion Medico Procedimiento
insert into relacionMedicoProcedimiento(`idMedicofkRMP`,`idProcedimientofkRMP`)
values
("1","1"),
("2","2"),
("3","3"),
("4","4"),
("5","5");

insert into Paciente(`idPaciente`,`nombrePaciente`,`apellidoPaciente`,`direccion`,`idProcedimientofkPaciente`) 
values
("1","Chuchito","Nazaret","El cielo","1"),
("2","Matilda","Gonzales"," La granjita","2"),
("3","Karl","Marx","El paraiso","3"),
("4","Homero","Simpson","SpringField","4"),
("5","Naruto","Uzumaki","La aldea de la hoja","5");



-- Registros telefono pacientes
insert into telefonoPaciente(`idPaciente`,`telefono`) 
values
("1","123456789"),
("2","23456789"),
("3","3456789"),
("4","456789"),
("5","56789");

-- Regustros Factura
insert into Facture(`idFactura`,`fecha`,`valorTotal`,`idPacientefkFacture`)
 values
("1","01/04/1954",0,"1"),
("2","02/02/2222",0,"2"),
("3","03/03/3333",30000,"3"),
("4","06/12/3333",40000,"4"),
("5","10/10/1998",50000,"5");


-- Registros medicamento
insert into Medicamento(`idMedicamento`,`nombreMedicamento`,`dosis`)
 values
("1","Acetaminofen"," 4 al dia"),
("2","La bendicion de la abuela","Todos los dias"),
("3","Noraber","1 vez al dia"),
("4","Medicamento para la presion arterial"," 3 veces al dia"),
("5","Gotas para los ojos","1 vez al dia ");

-- Registros relacion paciente medicamento
insert into relacionPacienteMedicamento(`idPacienteFK`,`idMedicamentoFK`)
values
("1","1"),
("2","2"),
("3","3"),
("4","4"),
("5","5");


-- Consulta los medicamentos de cada paciente
select Paciente.nombrePaciente  as "Paciente", Medicamento.nombreMedicamento as "Medicamento ",Medicamento.dosis as "Dosis"
   from Paciente 
   inner join relacionPacienteMedicamento on idPaciente=relacionPacienteMedicamento.idPacienteFK
   inner join Medicamento on idMedicamento = relacionPacienteMedicamento.idMedicamentoFK;



-- Consulta medicamentos de cada paciente version 2
SELECT 
  p.nombrePaciente AS "Paciente", 
  m.nombreMedicamento AS "Medicamento", 
  m.dosis AS "Dosis"
FROM 
  Paciente p, 
  Medicamento m, 
  relacionPacienteMedicamento r
WHERE 
  p.idPaciente = r.idPacienteFK 
  AND m.idMedicamento = r.idMedicamentoFK;



-- Consulta enfermeros en procedimientos de los pacientes

SELECT Enfermero.nombreEnfermero as "Enfermero", Paciente.nombrePaciente as "Paciente", Procedimiento.tipoProcedimiento as "Procedimiento"
FROM Paciente 
INNER JOIN Procedimiento ON idProcedimiento = Procedimiento.idProcedimiento
INNER JOIN relacionMedicoProcedimiento ON idProcedimiento= relacionMedicoProcedimiento.idProcedimientofkRMP
INNER JOIN Medico ON idMedico = relacionMedicoProcedimiento.idMedicofkRMP
INNER JOIN Enfermero ON idMedicofkM = Medico.idMedico
WHERE Enfermero.nombreEnfermero IS NOT NULL;


-- Vista historia clinica 
SELECT * FROM HistoriaClinica;
CREATE VIEW HistoriaClinica as 
SELECT Paciente.nombrePaciente as "Paciente", Paciente.direccion as "Direccion", Medicamento.nombreMedicamento as "Medicamento", Medicamento.dosis as "Dosis"
FROM Paciente INNER JOIN relacionPacienteMedicamento on idPaciente = relacionPacienteMedicamento.idPacienteFK
INNER JOIN Medicamento on idMedicamento = relacionPacienteMedico.idMedicamentoFK;
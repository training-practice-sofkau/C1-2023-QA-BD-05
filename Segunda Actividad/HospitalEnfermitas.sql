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
idMedico varchar(20),
foreign key(idMedico) references Medico(idMedico)
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
idMedico varchar(20),
idProcedimiento varchar(20),
primary key(idMedico,idProcedimiento),
foreign key(idMedico) references Medico(idMedico),
foreign key(idProcedimiento) references Procedimiento(idProcedimiento)
);

Create Table Paciente(
idPaciente varchar(20) primary key,
nombrePaciente varchar(50),
apellidoPaciente varchar(50),
direccion varchar(50),
idProcedimiento varchar(20),
foreign key(idProcedimiento) references Procedimiento(idProcedimiento)
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
idPaciente varchar(20),
foreign key(idPaciente) references Paciente(idPaciente)
);

Create Table Medicamento(
idMedicamento varchar(20) primary key,
nombreMedicamento varchar(50),
dosis varchar(50)
);

Create Table RelacionPacienteMedicamento(
idPaciente varchar(20),
idMedicamento varchar(20),
primary key(idPaciente,idMedicamento),
foreign key(idPaciente) references Paciente(idPaciente),
foreign key(idMedicamento) references Medicamento(idMedicamento)
);



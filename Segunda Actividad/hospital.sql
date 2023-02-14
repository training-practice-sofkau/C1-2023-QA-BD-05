
#Creacion de la base de datos y sus tablas
create database hospital;
use hospital;
#Tabla Medico---------------------------
create table medico(
	id_medico varchar(10) primary key,
    nombre_medico varchar(45),
    apellido_medico varchar(45),
    especialidad varchar(45)
);

create table telefono_medico(
	id_medico varchar(10),
    telefono_medico varchar(20),
    primary key(id_medico,telefono_medico),
    foreign key(id_medico) references medico(id_medico)
);

create table enfermero(
	id_enfermero varchar(10) primary key,
    nombre_enfermero varchar(50),
    apellido_enfermero varchar(50),
    id_medico_e varchar(10),
    foreign key(id_medico_e) references medico(id_medico)
);

create table telefono_enfermero(
	id_enfermero_t varchar(10),
    telefono_enfermero varchar(15),
    primary key(id_enfermero_t,telefono_enfermero),
    foreign key(id_enfermero_t) references enfermero(id_enfermero)
);

create table procedimiento(
	id_procedimiento varchar(10) primary key,
    tipo_procedimiento varchar(50)
);

create table dll_medico_procedimiento(
    id_medico_p varchar(10),
    id_procedimiento_m varchar(10),
    primary key(id_medico_p,id_procedimiento_m),
    foreign key(id_medico_p)references medico(id_medico),
    foreign key(id_procedimiento_m)references procedimiento(id_procedimiento)
);

create table paciente(
	id_paciente varchar(10) primary key,
    nombre_paciente varchar(50),
    apellido_paciente varchar(50),
    direccion varchar(50),
    id_procedimiento_p varchar(20),
    foreign key(id_procedimiento_p) references procedimiento(id_procedimiento)
);

create table telefono_paciente(
	id_paciente_t varchar(10),
    telefono_paciente varchar(15),
    primary key(id_paciente_t,telefono_paciente),
    foreign key(id_paciente_t) references paciente(id_paciente)
);

create table factura(
	id_factura varchar(10) primary key,
    fecha varchar(20),
    valor_total double,
    id_paciente_f varchar(10),
    foreign key(id_paciente_f) references paciente(id_paciente)
);

create table medicamento(
	id_medicamento varchar(10) primary key,
    nombre_medicamento varchar(50),
    dosis varchar(50)
);

create table dll_paciente_medicamento(
	id_paciente_m varchar(10),
    id_medicamento_p varchar(10),
    primary key(id_paciente_m,id_medicamento_p),
    foreign key(id_paciente_m) references paciente(id_paciente),
    foreign key(id_medicamento_p) references medicamento(id_medicamento)
);


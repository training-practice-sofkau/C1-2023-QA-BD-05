

#Registro de datos para Medicos
INSERT INTO medico (`id_medico`,`nombre_medico`,`apellido_medico`,`especialidad`) values
("M1","Andrew","Meneses","Traumatismo"),
("M2","Felipe","Correa","Cirujia"),
("M3","Marilyn","Velez","Odontologia"),
("M4","Carlos","Solarte","Oftalmologia"),
("M5","Grace","Hurts","Pediatria");

#Registro de Telefonos Medico
insert into telefono_medico(`id_medico_t`,`telefono_medico`) values
("M1","3215487"),
("M3","3698547"),
("M1","3152520"),
("M4","3622021"),
("M5","3978410");

#Registro de enfermeros
insert into enfermero (`id_enfermero`,`nombre_enfermero`,`apellido_enfermero`,`id_medico_e`) values
("E1", "Daniela", "Velandia", "M1"),
("E2", "Andres", "Ochoa", "M2"),
("E3", "Sofia", "Smith", "M1"),
("E4", "Julio", "Iglesias", "M4"),
("E5", "Mariana", "Flores", "M5");

#Registro telefonos enfermeros
insert into telefono_enfermero(`id_enfermero_t`,`telefono_enfermero`) values
("E1","3102563"),
("E3","3012410"),
("E1","3266987"),
("E5","3269854"),
("E4","3254714");

#Registro Procedimientos
insert into procedimiento(`id_procedimiento`,`tipo_procedimiento`) values
("P1","Examen rutinario"),
("P2","Cirujia"),
("P3","Examen Laboratorio"),
("P4","Radioterapia"),
("P5","Terapia");

#Registro de medico asociado a procedimiento
insert into dll_medico_procedimiento(`id_medico_p`,`id_procedimiento_m`) values
("M1","P1"),
("M3","P2"),
("M2","P3"),
("M4","P4"),
("M5","P5");

#Registros de pacientes
insert into paciente(`id_paciente`,`nombre_paciente`,`apellido_paciente`,`direccion`,`id_procedimiento_p`) values
("C1","Valentin","Rossi","calle 32","P1"),
("C2","Matias","Mier","calle 45","P2"),
("C3","Natalia","Ortega","carrera 32","P3"),
("C4","Paco","Ramirez","calle 89","P4"),
("C5","Guillermo","Perez","avenida 54","P5");

#Registro de telefonos pacientes
insert into telefono_paciente(`id_paciente_t`,`telefono_paciente`) values
("C1","3451258"),
("C1","3636362"),
("C3","3215445"),
("C5","3022012"),
("C5","3698558");

#Registro de facturass
insert into factura(`id_factura`,`fecha`,`valor_total`,`id_paciente_f`) values
("F1","12/01/2018",120000,"C1"),
("F2","23/02/2022",360000,"C2"),
("F3","30/03/2021",252000,"C1"),
("F4","18/12/2016",140000,"C5"),
("F5","13/11/2019",520000,"C4");



#Registro de medicamentos
insert into medicamento(`id_medicamento`,`nombre_medicamento`,`dosis`) values
("1","Dolex","1 cada 8 horas"),
("2","Acetaminofen","2 cada 9 horas"),
("3","Aspirina","1 cada 16 horas"),
("4","Dopamina","10 mg diarios"),
("5","Suero","1 frasco cada 8 horas");


#Registro de pacientes y medicamentos
insert into dll_paciente_medicamento(`id_paciente_m`,`id_medicamento_p`) values
("C2","5"),
("C1","4"),
("C3","3"),
("C5","2"),
("C4","1");



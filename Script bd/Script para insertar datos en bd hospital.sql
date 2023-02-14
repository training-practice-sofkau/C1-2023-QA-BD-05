# Datos de tabla procedimiento.
INSERT INTO hospital.procedimiento (id, tipoProcedimiento)
VALUES ( 1, "Cirugia"), 
	(2,"Odontologia"),
    (3, "Optometria"),
    (4, "Consulta medica"),
    (5, "Control prenatal");
# Datos de tabla paciente
INSERT INTO hospital.paciente( id, nombre, apellido, direccion, idProcedimiento)
VALUES (1, "Omaira", "Chinguad", " cr 2a -4, cali", 5),
	(2, "Lucia", "Moreno", " cr 2a -5, cali", 4),
    (3, "Rosa", "Alpala", " cr 5a -6, cali", 2),
    (4, "Martin", "Parra", " cr 2a -4, cali", 5),
    (5, "Yoli", "Guadir", " cr 5a -4, cali", 3);
# Datos de tabla telefonoPaciente
INSERT INTO hospital.telefonopaciente(idPaciente, telefono)
VALUES ( 1, "202020"),
	( 2, "303030"),
    ( 4, "404040"),
    ( 3, "505050"),
    (5, "606060");
# Datos de la tabla factura
INSERT INTO hospital.factura(id,fecha,valorTotal, idPaciente)
VALUES( 1, "2022-02-12", 30000, 1),
	( 2, "2022-01-12", 40000, 2),
    ( 3, "2022-02-02", 90000, 3),
    ( 4, "2022-02-05", 30000, 4),
    ( 5, "2022-02-11", 90000, 5);
#Datos de la tabla medicamento
INSERT INTO hospital.medicamento(id, nombreMedicamento, dosis)
VALUES(1, "medicamento1", "50 gramos por día"),
	(2, "medicamento2", "90 gramos por día"),
    (3, "medicamento3", "40 gramos por día"),
    (4, "medicamento4", "70 gramos por día"),
    (5, "medicamento5", "60 gramos por día");
#Datos de la tabla pacienteMedicamento
INSERT INTO hospital.pacientemedicamento(id, idPaciente,idMedicamento)
VALUES(1,2,3),
	(3,5,1),
    (2,4,5),
    (4,1,2),
    (5,3,4);
# Datos de la tabla medico
INSERT INTO hospital.medico(id, nombreMedico, apellidoMedico, especialidad)
VALUES (1, "Ana", "Mimalchi", "Cirujano"),
	(2, "Laura", "Galindo", "Odontoogo"),
    (3, "Matias", "Moreno", "Optómetra"),
    (4, "Santiago", "Tapie", "Medico general"),
    (5, "Samuel", "Diaz", "Pediatra");
#Datos de la tabla procedimientoMedico
INSERT INTO hospital.procedimientomedico(idProcedimientoMedico, idMedico,idProcedimiento)
VALUES(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);
#Datos telefono medico
INSERT INTO hospital.telefonomedico(idtelefonoMedico, telefono)
VALUES(1,"912345"),
	(2,"922345"),
	(3,"922245"),
	(4,"922225"),
	(5,"922335");
#Datos tabla enfermeros
INSERT INTO hospital.enfermero(idenfermero,nombreEnfermero,apellidoEnfermero,idMedico)
VALUES(1, "Liliana", "Colimba", 1),
	(2, "Viviana", "Iquinas", 2),
    (3, "Jhoana", "Taimal", 3),
    (4, "Josue", "Colimba", 4),
    (5, "Edison", "Perez", 5);
#Datos tabla telefono Enfermero
INSERT INTO hospital.telefonoenfermero(idtelefonoEnfermero, telefono)
VALUES(1, "112345"),
	(2, "122345"),
    (3, "132345"),
    (4, "142345"),
    (5, "152345");
    
#Consultas
# medicamentos a tomado cada paciente y la dosis suministrada.
SELECT p.nombre, m.nombreMedicamento, m.dosis
FROM paciente p
INNER JOIN pacienteMedicamento pm ON p.id = pm.idPaciente
INNER JOIN medicamento m ON m.id = pm.idMedicamento;

#Enfermeros estuvieron en los procedimientos de los pacientes.
SELECT pr.tipoProcedimiento, e.nombreEnfermero, p.nombre as nombre_paciente, p.apellido as apellido_paciente
FROM procedimiento pr
INNER JOIN paciente p ON p.idProcedimiento = pr.id
INNER JOIN procedimientoMedico pm ON pm.idProcedimiento = pr.id
INNER JOIN enfermero e ON e.idMedico = pm.idMedico;

#Vista necesarias

# Medicos  y enfermeros que asistieron a pacientes
CREATE VIEW enfermero_medico_paciente AS
SELECT e.nombreEnfermero, e.apellidoEnfermero, p.nombre as paciente, pm.idProcedimiento, m.nombreMedico, m.apellidoMedico
FROM enfermero e
JOIN procedimientoMedico pm ON e.idMedico = pm.idMedico
JOIN paciente p ON p.idProcedimiento = pm.idProcedimiento
JOIN medico m ON m.id = pm.idMedico;

SELECT*FROM enfermero_medico_paciente;

# vista telefono medico
CREATE VIEW telefono_medico AS
SELECT m.nombreMedico, tm.telefono
FROM medico m
JOIN telefonoMedico tm ON m.id = tm.idtelefonoMedico;

#Vista telefono enfermero
CREATE VIEW vista_telefono_enfermero AS
SELECT e.nombreEnfermero, e.apellidoEnfermero, t.telefono
FROM enfermero e
JOIN telefonoEnfermero t ON e.idenfermero = t.idtelefonoEnfermero;






	
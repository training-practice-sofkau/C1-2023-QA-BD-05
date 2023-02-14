/* VISTA QUE ME PERMITIRÁ CONSULTAR DE UNA FORMA MAS FACIL
LOS PROCEDIMIENTOS QUE HA REALIZADO CADA MEDICO*/

CREATE VIEW vista_procedimiento_medico AS
SELECT procedimiento.id, procedimiento.tipo_procedimiento, medico.nombre
FROM medico_procedimiento JOIN medico ON medico_procedimiento.id_medico = medico.id;

/* VISTA QUE ME FACILITARÁ CONSULTAR LOS MEDICAMENTOS QUE ESTÁ TOMANDO CADA PACIENTE*/

CREATE VIEW vista_paciente_medicamento AS
SELECT paciente.nombre AS nombre_paciente, medicamento.nombre AS nombre_medicamento
FROM paciente JOIN paciente_medicamento ON paciente.id = paciente_medicamento.id_paciente
JOIN medicamento ON paciente_medicamento.id_medicamento = medicamento.id;

/* VISTA QUE ME PERMITIRA SABER QUE PACIENTES HAN PAGADO LAS FACTURAS*/

CREATE VIEW vista_paciente_factura AS
SELECT paciente.nombre, factura.id
FROM paciente JOIN factura ON paciente.id = factura.id_paciente;
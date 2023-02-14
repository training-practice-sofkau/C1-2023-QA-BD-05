/*CONSULTA DE LOS MEDICAMENTOS QUE HA TOMADO EL PACIENTE Y SU DOSIS ASIGNADA*/

SELECT paciente.nombre, medicamento.nombre, medicamento.dosis
FROM paciente JOIN paciente_medicamento ON paciente.id = paciente_medicamento.id_paciente
JOIN medicamento ON paciente_medicamento.id_medicamento = medicamento.id;

/*CONSULTA DE LOS ENFERMEROs QUE PARTICIPARON EN LOS PROCEDIMIENTOS*/

SELECT enfermero.nombre AS nombre_enfermero, procedimiento.id AS id_procedimiento
FROM enfermero JOIN medico ON enfermero.id_medico = medico.id
JOIN medico_procedimiento ON medico.id = medico_procedimiento.id_medico
JOIN procedimiento ON medico_procedimiento.id_procedimiento = procedimiento.id;
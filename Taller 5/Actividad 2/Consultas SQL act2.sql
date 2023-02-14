-- Obtener que medicamentos a tomado cada paciente y la dosis suministrada.
SELECT paciente.Nombre_Paciente, medicamento.nombre_Medicamento, medicamento.dosis
FROM paciente
JOIN paciente_medicamento
ON paciente.idPaciente = paciente_medicamento.ID_Paciente_Medicamento
JOIN medicamento
ON paciente_medicamento.ID_Medicamento_Paciente = medicamento.idMedicamento;

-- Conocer que enfermeros estuvieron en los procedimientos de los pacientes.
SELECT enfermero.Nombre_Enfermero, enfermero.Apellido_Enfermero, procedimiento.idProcedimiento
FROM enfermero
JOIN medico ON enfermero.ID_Medico_Asignado = medico.idMedico
JOIN medico_procedimiento ON medico.idMedico = medico_procedimiento.ID_Medico_Procedimiento
JOIN procedimiento ON medico_procedimiento.ID_Procedimiento_medico = procedimiento.idProcedimiento;

USE hospital;
-- consulta que me permita conocer que enfermeros estuvieron en los procedimientos de los pacientes.
SELECT enfermero.nombre_enfermero, paciente.nombre_paciente, medico.nombre_medico
FROM enfermero 
INNER JOIN medico  ON enfermero.id_medico = medico.id_medico
INNER JOIN medico_procedimiento ON medico.id_medico=medico_procedimiento.id_medico
INNER JOIN procedimiento ON medico_procedimiento.id_procedimiento=procedimiento.id_procedimiento
INNER JOIN paciente ON procedimiento.id_procedimiento=paciente.id_procedimiento;



-- nombre del enfermero que atendio un paciente
CREATE VIEW nombre_enfermo_que_atendio_a_un_pacinte AS
SELECT enfermero.nombre_enfermero, paciente.nombre_paciente
FROM enfermero 
INNER JOIN medico  ON enfermero.id_medico = medico.id_medico
INNER JOIN medico_procedimiento ON medico.id_medico=medico_procedimiento.id_medico
INNER JOIN procedimiento ON medico_procedimiento.id_procedimiento=procedimiento.id_procedimiento
INNER JOIN paciente ON procedimiento.id_procedimiento=paciente.id_procedimiento;

-- creo una vista del paciente y que procedimiento le estan realizando
CREATE VIEW vista_procedimientos AS
SELECT  p.tipo_procedimiento, pa.nombre_paciente
FROM procedimiento p
INNER JOIN paciente pa ON p.id_procedimiento = pa.id_procedimiento
WHERE pa.id_paciente = "P002";

-- 	Consulta me trae en enfermero que acompaño a un médico en el tratamiento a un paciente 
CREATE VIEW vista__medico_tratamiento AS
SELECT enfermero.nombre_enfermero, paciente.nombre_paciente, medico.nombre_medico
FROM enfermero 
INNER JOIN medico  ON enfermero.id_medico = medico.id_medico
INNER JOIN medico_procedimiento ON medico.id_medico=medico_procedimiento.id_medico
INNER JOIN procedimiento ON medico_procedimiento.id_procedimiento = procedimiento.id_procedimiento
INNER JOIN paciente ON procedimiento.id_procedimiento = paciente.id_procedimiento;


-- Consulta que me permite ver el paciente y su enfermero y que le receto su medico y la dosis del medicamento 
CREATE VIEW vistanombre_medico_receta_medica_dosis_paciente AS
SELECT  medico.nombre_medico, enfermero.nombre_enfermero, paciente.nombre_paciente, medicamento.nombre_medicamento, medicamento.dosis
FROM enfermero 
INNER JOIN medico  ON enfermero.id_medico = medico.id_medico
INNER JOIN medico_procedimiento ON medico.id_medico=medico_procedimiento.id_medico
INNER JOIN procedimiento ON medico_procedimiento.id_procedimiento=procedimiento.id_procedimiento
INNER JOIN paciente ON procedimiento.id_procedimiento=paciente.id_procedimiento
INNER JOIN paciente_medicamento ON paciente.id_paciente = paciente_medicamento.id_paciente
INNER JOIN medicamento ON paciente_medicamento.id_medicamento = medicamento.id_medicamento;

-- realice una consulta que me permita conocer que medicamentos a tomado cada paciente y la dosis suministrada.
SELECT  paciente.nombre_paciente, medicamento.nombre_medicamento, medicamento.dosis
FROM paciente 
INNER JOIN paciente_medicamento  ON paciente.id_paciente = paciente_medicamento.id_paciente
INNER JOIN medicamento ON paciente_medicamento.id_medicamento= medicamento.id_medicamento;
USE procedimiento_medico;
CREATE VIEW procedimiento_medicamentos_paciente AS
SELECT procedimiento.tipo AS tipo_procedimiento,
medicamento.nombre AS nombre_medicamento,
medicamento.dosis AS dosis,
paciente.nombre AS nombre_paciente
FROM procedimiento INNER JOIN paciente ON procedimiento.id = paciente.id_procedimiento
INNER JOIN medicamento_paciente ON Paciente_id = medicamento_paciente.paciente_id
INNER JOIN medicamento ON medicamento_id = medicamento.id;


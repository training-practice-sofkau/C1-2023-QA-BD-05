USE procedimiento_medico;
CREATE VIEW dosis_paciente AS
SELECT medicamento.nombre AS medicamento, medicamento.dosis, paciente.nombre AS paciente
FROM ((procedimiento_medico.medicamento
INNER JOIN procedimiento_medico.medicamento_paciente ON medicamento.id = medicamento_paciente.medicamento_id)
INNER JOIN procedimiento_medico.paciente ON paciente.id = paciente_id);

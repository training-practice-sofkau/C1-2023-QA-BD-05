Use procedimiento_medico;
CREATE VIEW medico_procedimiento_paciente AS
SELECT medico.nombre AS nombre_medico, procedimiento.tipo AS tipo_procedimiento, paciente.nombre AS nombre_paciente
FROM 	procedimiento_medico.medico
		INNER JOIN procedimiento_medico.medico_procedimiento ON medico.id = medico_procedimiento.medico_id
        INNER JOIN procedimiento_medico.procedimiento ON procedimiento_id = procedimiento.id
        INNER JOIN procedimiento_medico.paciente ON procedimiento_id = paciente.id_procedimiento;
        
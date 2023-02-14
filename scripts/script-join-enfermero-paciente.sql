SELECT enfermero.nombre AS nombre_enfermero, procedimiento.tipo AS tipo_procedimiento, paciente.nombre AS nombre_paciente
FROM 	procedimiento_medico.enfermero
		INNER JOIN procedimiento_medico.medico_procedimiento ON enfermero.medico_id = medico_procedimiento.medico_id
        INNER JOIN procedimiento_medico.procedimiento ON procedimiento_id = procedimiento.id
        INNER JOIN procedimiento_medico.paciente ON procedimiento_id = paciente.id_procedimiento;
/*-------------
Consulta 1
--------------*/
SELECT p.nombre_paciente, p.apellido_paciente, m.nombre_medicamento, m.dosis
FROM tb_paciente p
INNER JOIN dll_paciente_medicamento dpm ON p.id_paciente=dpm.id_paciente
INNER JOIN tb_medicamento m ON dpm.id_medicamento=m.id_medicamento;
/*-------------
Consulta 2
--------------*/
SELECT e.nombre_enfermero, e.apellido_enfermero, p.nombre AS nombre_procedimiento
FROM tb_enfermero e
JOIN dll_medico_procedimiento mp ON e.id_medico = mp.id_medico
JOIN tb_procedimiento p ON mp.id_procedimiento = p.id_procedimiento
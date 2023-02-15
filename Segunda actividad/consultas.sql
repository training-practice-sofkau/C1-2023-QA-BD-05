SELECT p.nombre, m.nombre AS medicamento, dosis
FROM Paciente p
JOIN Tomar t ON p.id_paciente = t.id_pacienteFK
JOIN Medicamento m ON t.id_medicamentoFK = m.id_medicamento

SELECT Enfermero.nombre, Procedimiento.tipo
FROM Enfermero
JOIN Médico ON Enfermero.idMédico_enfermero = Médico.idMédico
JOIN Realizar ON Médico.idMédico = Realizar.idMedico_PK
JOIN Procedimiento ON Realizar.id_procedimiento_PK = Procedimiento.id_procedimiento;
create view consultarmedicamentos as
SELECT paciente.Nombre_Paciente, medicamento.nombre_Medicamento, medicamento.dosis
FROM paciente
JOIN paciente_medicamento
ON paciente.idPaciente = paciente_medicamento.ID_Paciente_Medicamento
JOIN medicamento
ON paciente_medicamento.ID_Medicamento_Paciente = medicamento.idMedicamento;
select * from consultarmedicamentos;

create view consultaFactura as
SELECT Paciente.Nombre_Paciente, Paciente.Apellido_Paciente, factura.valor_total, factura.fecha
FROM Paciente
INNER JOIN factura
ON Paciente.idPaciente = factura.ID_Paciente_factura;
select * from consultaFactura;

create view consultaDetallesProcedimiento as
SELECT Paciente.Nombre_Paciente, Paciente.Apellido_Paciente, Procedimiento.idProcedimiento, Medico.Nombre_Medico, Medico.apellido_medico
FROM Paciente
INNER JOIN Procedimiento ON Paciente.ID_Procedimiento_paciente = Procedimiento.idProcedimiento
INNER JOIN medico_procedimiento ON Procedimiento.idProcedimiento = medico_procedimiento.ID_Procedimiento_medico
INNER JOIN Medico ON medico_procedimiento.ID_Medico_Procedimiento = Medico.idMedico;
select * from consultaDetallesProcedimiento;

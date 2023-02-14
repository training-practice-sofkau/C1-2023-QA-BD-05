USE procedimiento_medico;
CREATE VIEW factura_paciente AS
SELECT factura.valor_total, factura.fecha, paciente.nombre
FROM factura INNER JOIN paciente
ON factura.Paciente_id = paciente.id;
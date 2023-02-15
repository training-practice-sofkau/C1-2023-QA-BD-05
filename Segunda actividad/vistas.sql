CREATE VIEW `vista_pacientes_procedimientos` AS
SELECT p.id_paciente, p.nombre AS paciente_nombre, p.direccion, p.teléfono, pr.tipo AS tipo_procedimiento
FROM `Paciente` p
JOIN `Procedimiento` pr ON p.id_procedimiento = pr.id_procedimiento;

CREATE VIEW `vista_medicamentos_recetados` AS
SELECT p.nombre AS paciente_nombre, m.nombre AS medicamento, m.dosis
FROM `Paciente` p
JOIN `Tomar` t ON p.id_paciente = t.id_pacienteFK
JOIN `Medicamento` m ON t.id_medicamentoFK = m.id_medicamento;

CREATE VIEW `vista_facturas_procedimientos` AS
SELECT f.id_factura, f.fecha, f.valorTotal, pr.tipo AS tipo_procedimiento
FROM `Factura` f
JOIN `Procedimiento` pr ON f.id_procedimiento_factura = pr.id_procedimiento;
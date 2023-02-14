USE hospital;

-- -----------------------------------------------------
-- Consulta que me permite conocer que medicamentos ha tomado cada paciente y la dosis suministrada.
-- -----------------------------------------------------
SELECT 
tb_paciente.nombre_paciente, 
tb_medicamento.nombre_medicamento, 
tb_medicamento.dosis
FROM tb_paciente
JOIN dll_paciente_medicamento ON tb_paciente.id_paciente = dll_paciente_medicamento.id_paciente
JOIN tb_medicamento ON dll_paciente_medicamento.id_medicamento = tb_medicamento.id_medicamento;

-- -----------------------------------------------------
-- Consulta que me permita conocer que enfermeros estuvieron en los procedimientos de los pacientes.
-- -----------------------------------------------------
CREATE VIEW asignacion_enfermeros_a_procedimientos AS
SELECT 
  tb_paciente.nombre_paciente AS 'Paciente', 
  tb_procedimiento.tipo_procedimiento AS 'Procedimiento', 
  tb_enfermero.nombre_enfermero AS 'Enfermero asignado'
FROM 
  tb_paciente 
  JOIN tb_procedimiento ON tb_paciente.id_procedimiento = tb_procedimiento.id_procedimiento
  JOIN dll_medico_procedimiento ON tb_procedimiento.id_procedimiento = dll_medico_procedimiento.id_procedimiento
  JOIN tb_medico ON dll_medico_procedimiento.id_medico = tb_medico.id_medico
  JOIN tb_enfermero ON tb_enfermero.id_medico = tb_medico.id_medico;
  
 -- -----------------------------------------------------
-- Historial medico de los pacientes
-- -----------------------------------------------------
CREATE VIEW Historial_Medico AS
  SELECT 
  tb_paciente.nombre_paciente AS 'Paciente', 
  tb_procedimiento.tipo_procedimiento AS 'Procedimiento',
  tb_medicamento.nombre_medicamento AS 'Medicamento',
  tb_medicamento.dosis AS 'Dosis'
FROM 
  tb_paciente 
  JOIN tb_procedimiento ON tb_paciente.id_procedimiento = tb_procedimiento.id_procedimiento
  JOIN dll_paciente_medicamento ON tb_paciente.id_paciente = dll_paciente_medicamento.id_paciente
  JOIN tb_medicamento ON dll_paciente_medicamento.id_medicamento = tb_medicamento.id_medicamento;

 -- -----------------------------------------------------
-- valor Facturacion segun procedimiento
-- -----------------------------------------------------
CREATE VIEW Facturacion_segun_procedimiento AS
SELECT
  tb_paciente.nombre_paciente AS 'Paciente',
   telefono_paciente.telefono AS 'Teléfono',
  tb_procedimiento.tipo_procedimiento AS 'Procedimiento',
  tb_factura.valor_total AS 'Factura'
 FROM
  tb_paciente
  JOIN tb_procedimiento ON tb_paciente.id_procedimiento = tb_procedimiento.id_procedimiento
  JOIN tb_factura ON tb_paciente.id_paciente = tb_factura.id_paciente
  JOIN telefono_paciente ON tb_paciente.id_paciente = telefono_paciente.id_paciente;







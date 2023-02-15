USE `Hospital` ;


SELECT paciente.id_paciente, paciente.nombre, medicamento.id_medicamento, medicamento.nombre, medicamento.dosis
FROM paciente
INNER JOIN paciente_medicamento
ON paciente.id_paciente = paciente_medicamento.id_paciente_
INNER JOIN medicamento
ON paciente_medicamento.id_medicamento = medicamento.id_medicamento;

SELECT enfermero.nombre, paciente.nombre, procedimiento.tipo
FROM paciente
INNER JOIN procedimiento 
ON procedimiento.id_procedimiento = paciente.id_procedimient
INNER JOIN medico_procedimiento
ON medico_procedimiento.id_procedimiento_ = procedimiento.id_procedimiento
INNER JOIN medico 
ON medico.id_medico = medico_procedimiento.id_medico_
INNER JOIN enfermero 
ON enfermero.id_medicos = medico.id_medico;







CREATE VIEW datos_paciente_factura AS
SELECT paciente.nombre, factura.id_pacientes, factura.valortotal, factura.fecha
FROM factura
INNER JOIN  paciente
ON factura.id_pacientes = paciente.id_paciente;


SELECT * FROM datos_paciente_factura;

CREATE VIEW datos_paciente_procedimiento AS
SELECT paciente.nombre, procedimiento.tipo
 FROm paciente
INNER JOIN procedimiento
ON paciente.id_procedimient = procedimiento.id_procedimiento;


SELECT * FROM datos_paciente_procedimiento;


CREATE VIEW datos_medico_paciente as 
SELECT medico_procedimiento.id_procedimiento_ , procedimiento.tipo , medico.nombre as "medico nombre" , paciente.nombre as "Paciente" 
FROM paciente
JOIN procedimiento ON  paciente.id_procedimient = procedimiento.id_procedimiento
JOIN medico_procedimiento ON procedimiento.id_procedimiento = medico_procedimiento.id_procedimiento_ 
JOIN medico ON medico_procedimiento.id_medico_ = medico.id_medico ;

SELECT * FROM datos_medico_paciente;














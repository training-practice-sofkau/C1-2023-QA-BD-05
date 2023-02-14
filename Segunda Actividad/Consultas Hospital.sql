-- -----------------------------------------------------
-- •	Conocer que medicamentos a tomado cada paciente y la dosis suministrada.
-- -----------------------------------------------------
select paciente.nombre_paciente,medicamento.nombre_medicamento, medicamento.dosis
from medicamento inner join paciente_medicamento
on medicamento.id_medicamento= paciente_medicamento.identifi_medicamento
inner join paciente
on paciente.cedula_paciente=paciente_medicamento.cedula_Paciente

-- -----------------------------------------------------
-- conocer que enfermeros estuvieron en los procedimientos de los pacientes.
-- -----------------------------------------------------

select enfermero.nombres_enfermero,paciente.nombre_paciente,procedimiento_medico.ident_procedimiento
from enfermero inner join procedimiento_medico
on enfermero.id_medico= procedimiento_medico.cedula_medico
inner join paciente
on paciente.iden_procedimiento= procedimiento_medico.ident_procedimiento




-- -----------------------------------------------------
-- •	Conocer los procedimientos que tiene cada paciente 
-- -----------------------------------------------------
select * from Procedimiento_Paciente;
create view Procedimiento_Paciente as
select procedimiento.tipo_procedimiento, paciente.nombre_paciente
from procedimiento inner join paciente 
on procedimiento.id_procedimiento=paciente_medicamento

-- -----------------------------------------------------
-- •	Conocer los procedimientos que realiazo cada medico 
-- -----------------------------------------------------
select * from Medico_Procedimiento;

create view Medico_Procedimiento as 
select procedimiento.tipo_procedimiento, medico.nombres_medico
from procedimiento inner join procedimiento_medico
on procedimiento.id_procedimiento= procedimiento_medico.ident_procedimiento
inner join medico
on medico.cedula_medico= procedimiento_medico.cedula_medico

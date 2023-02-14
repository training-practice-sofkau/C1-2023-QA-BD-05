
#consulta que me permita conocer que medicamentos ha tomado cada paciente y la dosis suministrada.
select paciente.nombre_paciente,medicamento.nombre_medicamento,medicamento.dosis
from paciente inner join dll_paciente_medicamento on id_paciente = dll_paciente_medicamento.id_paciente_m
			  inner join medicamento on id_medicamento = dll_paciente_medicamento.id_medicamento_p;
              
              
#consulta que me permita conocer que enfermeros estuvieron en los procedimientos de los pacientes.
use hospital;
select enfermero.nombre_enfermero,paciente.nombre_paciente,procedimiento.tipo_procedimiento
from paciente inner join procedimiento on id_procedimiento_p = procedimiento.id_procedimiento
inner join dll_medico_procedimiento on id_procedimiento = dll_medico_procedimiento.id_procedimiento_m
inner join medico on id_medico = dll_medico_procedimiento.id_medico_p
inner join enfermero on id_medico_e = medico.id_medico;

#Primera Vista
use hospital;
create view `Procedimientos Pacientes` as
select medico.nombre_medico,procedimiento.id_procedimiento,procedimiento.tipo_procedimiento,paciente.nombre_paciente
from paciente inner join procedimiento on id_procedimiento_p = procedimiento.id_procedimiento
inner join dll_medico_procedimiento on id_procedimiento = dll_medico_procedimiento.id_procedimiento_m
inner join medico on id_medico = dll_medico_procedimiento.id_medico_p;
select * from `Procedimientos Pacientes`;

#Segunda Vista
use hospital;
create view `Factura Procedimiento` as
select factura.id_factura,factura.fecha,paciente.nombre_paciente,procedimiento.tipo_procedimiento,factura.valor_total
from factura inner join paciente on factura.id_paciente_f = paciente.id_paciente
inner join procedimiento on id_procedimiento_p = procedimiento.id_procedimiento;

select * from `Factura Procedimiento`;

#Vista que agrupa los numeros de los pacientes
use hospital;
create view `Telefonos Pacientes Agrupados` as
select paciente.nombre_paciente,GROUP_CONCAT(telefono_paciente.telefono_paciente separator ', ')as telefonos
from paciente inner join telefono_paciente on id_paciente = telefono_paciente.id_paciente_t
group by paciente.nombre_paciente;

select * from `Telefonos Pacientes Agrupados`;
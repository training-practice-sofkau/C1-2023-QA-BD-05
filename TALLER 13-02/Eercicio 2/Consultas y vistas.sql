#Consultas Hospital QA
## Conocer que medicamentos ha tomado y dosis suminustrada
select hospitalqa.paciente.nombre, medicamento.nombre, medicamento.dosis
from hospitalqa.paciente 
join hospitalqa.paciente_medicamento on paciente_medicamento.id_paciente_=paciente.id_paciente
join hospitalqa.medicamento on medicamento.id_medicamento = paciente_medicamento.id_medicamento;

# Conocer que enfermeros tuvieron en los procedimientos de los pacientes
select hospitalqa.enfermero.nombre, procedimiento.tipo
from hospitalqa.enfermero
join hospitalqa.medico_procedimiento on medico_procedimiento.id_medico_ = enfermero.id_enfermero
join hospitalqa.procedimiento on procedimiento.id_procedimiento = medico_procedimiento.id_procedimiento_;

#CREACION DE VISTAS
#Vista 1: Conocer cada paciente atendido por cada medico

create view PacVSmed as
select hospitalqa.paciente.nombre, medico.nombre
from hospitalqa.paciente
inner join hospitalqa.medico_procedimiento on medico_procedimiento.id_medico_ = paciente.id_paciente
inner join hospitalqa.medico on medico.id_medico = medico_procedimiento.id_medico_;
select * from PacVsMed;

# Vista 2: conocer que enfermero atendio a que paciente 
create view EnfermerosVSPacientes as
select hospitalqa.enfermero.nombre, paciente.nombre
from hospitalqa.enfermero
inner join hospitalqa.medico_procedimiento on medico_procedimiento.id_medico_ = enfermero.id_enfermero
inner join hospitalqa.paciente on paciente.id_paciente = medico_procedimiento.id_procedimiento_;
select * from EnfermerosVSPacientes;

#Vista 3: medicamento a cobrar en la factura
create view facturarMedicamento as
select hospitalqa.factura.id_factura, medicamento.nombre
from hospitalqa.factura
inner join hospitalqa.paciente_medicamento on paciente_medicamento.id_paciente_ = factura.id_factura
inner join hospitalqa.medicamento on medicamento.id_medicamento = paciente_medicamento.id_medicamento;
select * from facturarMedicamento;


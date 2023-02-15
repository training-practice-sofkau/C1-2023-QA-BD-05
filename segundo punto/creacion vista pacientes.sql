create view pacientes as
select p.idPaciente,p.nombre, pr.tipo, group_concat(m.nombre) as nombre_medico,group_concat(e.nombre) as nombre_enfermero
from paciente p
join procedimiento pr on pr.idProcedimiento=p.idProcedimiento_paciente
join medico_procedimiento mp on mp.idprocedimiento_medico=p.idProcedimiento_paciente
join medico m on m.idmedico=mp.idprocedimiento_medico
join enfermero e on e.idMedico_enfermero=m.idmedico
group by p.idPaciente;
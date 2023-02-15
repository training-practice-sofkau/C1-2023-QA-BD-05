create view medicos as
select m.idmedico,m.nombre, m.especialidad as especialidad, group_concat(mt.medico_telefono) as telefono_Medico
from medico m
join medico_telefono mt on mt.idmedico_telefono=m.idmedico
group by m.idmedico,m.nombre,m.especialidad,mt.medico_telefono
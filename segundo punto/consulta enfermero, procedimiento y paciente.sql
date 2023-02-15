select e.nombre as nombre_enfermero, e.idenfermero as id_enfermero,mp.idprocedimiento_medico as id_procedimiento,p.nombre as nombre_paciente
from enfermero e
join medico_procedimiento mp on mp.idmedico_procedimiento=e.idMedico_enfermero
join paciente p on p.idProcedimiento_paciente=mp.idprocedimiento_medico
group by e.nombre, e.idenfermero,mp.idmedico_procedimiento,mp.idprocedimiento_medico, p.nombre;
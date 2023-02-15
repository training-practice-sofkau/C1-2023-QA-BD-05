select p.nombre, group_concat(m.nombre) as medicamentos, group_concat(m.dosis) as dosis
from paciente p
join medicamento_paciente mp on p.idPaciente= mp.idPaciente_medicamento
join medicamento m on m.idMedicamento=mp.idMedicamento_paciente
group by p.nombre;
create view facturas as
select p.idPaciente, p.nombre as nombre_paciente, f.idfactura, f.valorTotal,m.nombre as nombre_medicamento,m.dosis
from paciente p
join factura f on f.idPaciente_factura=p.idPaciente
join medicamento_paciente mp on mp.idPaciente_medicamento=p.idPaciente
join medicamento m on mp.idPaciente_medicamento=m.idMedicamento
group by p.idPaciente,f.idfactura;
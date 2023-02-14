select c.nombre, t.numero
from cliente c
join telefono_cliente t on c.cedula=t.cedula_cliente
group by c.nombre,t.numero;
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente INNER JOIN telefono_cliente
ON cliente.cedula = telefono_cliente.cedula_cliente;
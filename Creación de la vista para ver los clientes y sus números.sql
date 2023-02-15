CREATE VIEW clientes AS
SELECT c.nombre AS nombre_cliente, 
       GROUP_CONCAT(DISTINCT tc.numero ORDER BY tc.numero ASC SEPARATOR ', ') AS telefonos,
       GROUP_CONCAT(DISTINCT l.titulo ORDER BY l.titulo ASC SEPARATOR ', ') AS libros_comprados
FROM cliente c
JOIN telefono_cliente tc ON c.cedula = tc.cedula_cliente
JOIN libro_cliente lc ON c.cedula = lc.id_cliente
JOIN libro l ON lc.ISBN_libro_cliente = l.ISBN
GROUP BY c.cedula;

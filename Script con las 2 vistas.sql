 /*--------------------
 Vista 1
 ---------------------*/
CREATE VIEW vista_ventas_libros2 AS
SELECT lc.ISBN_libro_cliente, l.titulo, COUNT(*) as cantidad_ventas
FROM libro_cliente lc
JOIN libro l ON lc.ISBN_libro_cliente = l.ISBN
GROUP BY lc.ISBN_libro_cliente, l.titulo;
 /*--------------------
 Vista2
 ---------------------*/
CREATE VIEW vista_compras_cliente AS
SELECT c.nombre AS nombre_cliente, COUNT(lc.ISBN_libro_cliente) AS num_compras, tc.numero AS telefono
FROM cliente c
JOIN libro_cliente lc ON c.cedula = lc.id_cliente
LEFT JOIN telefono_cliente tc ON lc.id_cliente = tc.cedula_cliente
GROUP BY c.nombre, tc.numero;
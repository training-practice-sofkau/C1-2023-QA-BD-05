USE `LibreriaBuscaLibre` ;

SELECT  id_cliente, libro.titulo
FROM libro 
INNER JOIN libro_cliente
ON libro_cliente.ISBN_libro_cliente = libro.ISBN
GROUP BY libro.titulo DESC;
USE `LibreriaBuscaLibre` ;
SELECT id_cliente, libro.titulo, COUNT(libro.titulo) as libros_vendidos
FROM libro
INNER JOIN libro_cliente
ON libro_cliente.ISBN_libro_cliente = libro.ISBN
GROUP BY libro.titulo;

SELECT COUNT(DISTINCT ISBN_libro_cliente) as cantidad_total_vendidos 
FROM  libro_cliente;






SELECT  cliente.nombre , telefono_cliente.numero
FROM telefono_cliente 
JOIN cliente
ON cliente.cedula  = telefono_cliente.cedula_cliente;

SELECT autor.nombre, libro.titulo
FROM libro_autor
LEFT JOIN autor
ON libro_autor.id_autor = autor.id
LEFT JOIN libro
ON libro_autor.ISBN_libro = libro.ISBN;

SELECT DISTINCT editorial.nombre
FROM libro
JOIN editorial
ON editorial.nombre = libro.nombre_editorial
LEFT JOIN libro_cliente
ON libro.ISBN= libro_cliente.ISBN_libro_cliente;



CREATE VIEW clientes_compras as
SELECT cliente.nombre, libro.titulo
FROM libro_cliente
INNER JOIN libro 
ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN cliente 
ON cliente.cedula = libro_cliente.id_cliente;

SELECT * FROM clientes_compras;

CREATE VIEW datos_cliente as
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
INNER JOIN telefono_cliente
ON cliente.cedula = telefono_cliente.cedula_cliente
GROUP BY cliente.nombre;

SELECT * FROM datos_cliente









 







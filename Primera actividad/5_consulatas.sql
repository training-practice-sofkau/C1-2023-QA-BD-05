
SELECT nombre, `fecha de nacimiento`
FROM autor;


SELECT COUNT(DISTINCT ISBN_libro_cliente)
FROM libro_cliente;

SELECT nombre, numero
FROM cliente
JOIN telefono_cliente
ON cliente.cedula = telefono_cliente.cedula_cliente;


SELECT titulo, GROUP_CONCAT(nombre SEPARATOR ', ') as autores
FROM libro
JOIN libro_autor
ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor
ON libro_autor.id_autor = autor.id
GROUP BY titulo;

SELECT DISTINCT nombre_editorial
FROM libro
JOIN libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente;



# consultas pedidas 
select * from autor;
-- Para conocer el nombre y la fecha de nacimiento de cada escritor:

SELECT nombre, `fecha de nacimiento` FROM autor;

-- Para conocer la cantidad de libros diferentes vendidos:

SELECT ISBN_libro_cliente, count(*) as num_vendidos
FROM libro_cliente
GROUP BY ISBN_libro_cliente;

-- Para conocer el nombre de los clientes acompañado de su número de teléfono:

SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- Para conocer el nombre del libro acompañado por su autor o sus autores:

SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

-- Para conocer el nombre de las editoriales que han logrado vender libros:

SELECT nombre_editorial, count(*) as libros_vendidos
FROM libro
JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY nombre_editorial;
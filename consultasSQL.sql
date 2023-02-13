use libreriabuscalibre;

-- nombre y la fecha de nacimiento de cada escritor
select nombre, 'fecha de nacimiento' from autor;

--  la cantidad de libros diferentes vendidos, 
SELECT libro.titulo, COUNT(DISTINCT libro_cliente.ISBN_libro_cliente) as Total_libros_vendidos 
FROM libro_cliente
JOIN libro
ON libro_cliente.ISBN_libro_cliente = libro.ISBN
GROUP BY libro.titulo;


-- el nombre de su cliente acompañado de su numero teléfonico
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente
ON cliente.cedula = telefono_cliente.cedula_cliente;

-- el nombre del libro acompañado por su autor o sus autores
SELECT libro.titulo AS libro, GROUP_CONCAT(autor.nombre SEPARATOR ', ') AS autores
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id
GROUP BY libro.titulo;

-- el nombre de las editoriales que han logrado vender libros.

SELECT nombre_editorial, COUNT(*)
FROM libro
GROUP BY nombre_editorial
HAVING COUNT(*) > 0;

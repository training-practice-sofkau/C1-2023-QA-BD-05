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

SELECT autor.nombre, libro.titulo
FROM
-- el nombre de las editoriales que han logrado vender libros.
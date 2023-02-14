-- Nombre y la fecha de nacimiento de cada escritor
SELECT nombre, `fecha de nacimiento` FROM autor;

-- Cantidad de libros diferentes vendidos
SELECT COUNT(DISTINCT ISBN_libro_cliente) as "Cantidad de libros diferentes vendidos"
FROM LibreriaBuscaLibre.libro_cliente;

-- El nombre de su cliente acompañado de su número telefónico:
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- El nombre del libro acompañado por su autor o sus autores
SELECT libro.titulo, GROUP_CONCAT(autor.nombre SEPARATOR ', ') AS autores
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id
GROUP BY libro.titulo;

-- El nombre de las editoriales que han logrado vender libros
SELECT DISTINCT nombre_editorial 
FROM libro 
INNER JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente;

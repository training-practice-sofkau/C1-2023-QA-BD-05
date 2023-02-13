USE libreriabuscalibre;

-- -----------------------------------------------------
-- Conocer el nombre y la fecha de nacimiento de cada escritor
-- -----------------------------------------------------
SELECT nombre, `fecha de nacimiento`
FROM autor;

-- -----------------------------------------------------
-- La cantidad de libros diferentes vendidos
-- -----------------------------------------------------
SELECT libro.titulo, COUNT(DISTINCT libro_cliente.ISBN_libro_cliente) as Total_de_libros_vendidos 
FROM libro_cliente
JOIN libro
ON libro_cliente.ISBN_libro_cliente = libro.ISBN
GROUP BY libro.titulo;

-- -----------------------------------------------------
-- El nombre de su cliente acompañado de su numero teléfonico
-- -----------------------------------------------------
SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente
ON cliente.cedula = telefono_cliente.cedula_cliente;

-- -----------------------------------------------------
-- El nombre del libro acompañado por su autor o sus autores
-- -----------------------------------------------------
SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

-- -----------------------------------------------------
-- El nombre de las editoriales que han logrado vender libros.
-- -----------------------------------------------------
SELECT nombre_editorial, count(*) as libros_vendidos
FROM libro
JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY nombre_editorial;

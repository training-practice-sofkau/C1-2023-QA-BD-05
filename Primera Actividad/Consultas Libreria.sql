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

-- -----------------------------------------------------
-- Consulta para conocer los libros más vendidos, junto con su cantidad de ventas
-- -----------------------------------------------------
CREATE VIEW libros_mas_vendidos_y_su_cantidad_vendida AS
SELECT libro.titulo, COUNT(libro_cliente.ISBN_libro_cliente) AS cantidad_ventas
FROM libro
JOIN libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY libro.titulo
ORDER BY cantidad_ventas DESC;

-- -----------------------------------------------------
-- Consulta para conocer los autores con más libros vendidos
-- -----------------------------------------------------
CREATE VIEW autores_con_mas_libros_vendidos AS
SELECT autor.nombre AS nombre_autor, COUNT(libro.ISBN) AS cantidad_ventas
FROM autor
JOIN libro_autor ON autor.id = libro_autor.id_autor
JOIN libro ON libro_autor.ISBN_libro = libro.ISBN
JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY autor.nombre
ORDER BY cantidad_ventas DESC;

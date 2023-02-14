	/*VISTA CREADA PARA LLEVAR UN LISTADO DE LOS CLIENTES
    QUE HAN COMPRADO LIBROS DE CADA EDITORIAL REGISTRADA*/

CREATE VIEW vista_clientes_y_editoriales AS
SELECT cliente.nombre AS nombre_cliente, editorial.nombre AS nombre_editorial
FROM cliente JOIN libro_cliente ON cliente.cedula = libro_cliente.id_cliente
JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
JOIN editorial ON libro.nombre_editorial = editorial.nombre;

/*Esta vista combina la información de las tablas "autor", "editorial" y "libro"
para proporcionar un listado de los libros escritos por cada autor y publicados por cada editorial,
lo cual es necesario para llevar un inventario de todo lo registrado*/

CREATE VIEW vista_autores_editoriales_y_libros AS
SELECT autor.nombre AS nombre_autor, editorial.nombre AS nombre_editorial, libro.titulo AS nombre_libro
FROM autor JOIN libro_autor ON autor.id = libro_autor.id_autor
JOIN libro ON libro_autor.ISBN_libro = libro.ISBN JOIN editorial ON libro.nombre_editorial = editorial.nombre;
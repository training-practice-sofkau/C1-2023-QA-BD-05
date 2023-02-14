SELECT nombre, `fecha de nacimiento`
FROM LibreriaBuscaLibre.autor ;

SELECT COUNT(*) FROM libro_cliente;

#El nombre de su cliente acompañado de su numero teléfonico
SELECT cliente.nombre, telefono_cliente.numero
FROM telefono_cliente
INNER JOIN cliente ON telefono_cliente.cedula_cliente = cliente.cedula;
SELECT cliente.nombre, GROUP_CONCAT(telefono_cliente.numero SEPARATOR ', ') as numeros_telefono
FROM telefono_cliente
INNER JOIN cliente ON telefono_cliente.cedula_cliente = cliente.cedula
GROUP BY cliente.nombre;

# El nombre del libro acompañado por su autor o sus autores
SELECT libro.ISBN, libro.titulo as Titulo_Libro, autor.nombre as Autor
FROM libro
INNER JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
INNER JOIN autor ON autor.id = libro_autor.id_autor;

#Editorial con libros vendidos
SELECT Editorial.nombre AS NombreEditorial, libro.titulo AS TituloLibro, cliente.nombre AS NombreCliente
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN Editorial ON libro.nombre_editorial = Editorial.nombre
INNER JOIN cliente ON libro_cliente.id_cliente = cliente.cedula;

SELECT Editorial.nombre AS NombreEditorial
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN Editorial ON libro.nombre_editorial = Editorial.nombre;

#Creando vistas
CREATE VIEW vista_editoriales AS
SELECT Editorial.nombre AS NombreEditorial
FROM libro_cliente
INNER JOIN libro ON libro_cliente.ISBN_libro_cliente = libro.ISBN
INNER JOIN Editorial ON libro.nombre_editorial = Editorial.nombre;

SELECT * FROM vista_editoriales;

#2 vista
CREATE VIEW vista_LibrosAutores AS
SELECT libro.ISBN, libro.titulo as Titulo_Libro, autor.nombre as Autor
FROM libro
INNER JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
INNER JOIN autor ON autor.id = libro_autor.id_autor;

SELECT * FROM vista_LibrosAutores;

SELECT libro.ISBN, libro.titulo as Titulo_Libro, GROUP_CONCAT(autor.nombre SEPARATOR ', ') as Autores
FROM libro
INNER JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
INNER JOIN autor ON autor.id = libro_autor.id_autor
GROUP BY libro.ISBN;









#la cantidad de libros diferentes vendidos, el nombre de su cliente acompañado de su numero teléfonico
SELECT libro_cliente.id_cliente, cliente.nombre, libro_cliente.ISBN_libro_cliente, telefono_cliente.numero, libro_autor.id_autor
FROM libro_cliente
INNER JOIN cliente ON libro_cliente.id_cliente = cliente.cedula
INNER JOIN telefono_cliente ON libro_cliente.id_cliente = telefono_cliente.cedula_cliente
INNER JOIN libro_autor ON libro_cliente.ISBN_libro_cliente = libro_autor.ISBN_libro



 










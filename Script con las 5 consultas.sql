/*------------------------------
Consulta 1
-------------------------------*/
SELECT nombre, `fecha de nacimiento` FROM autor;
/*------------------------------
Consulta 2
-------------------------------*/
SELECT COUNT(*) AS cantidad_libros_vendidos
FROM libro_cliente;
SELECT nombre, `fecha de nacimiento` FROM autor;
SELECT l.titulo
FROM libro l
JOIN libro_cliente lc ON l.ISBN=lc.ISBN_libro_cliente;
/*------------------------------
Consulta 3
-------------------------------*/
SELECT c.nombre, tc.numero
FROM cliente c
JOIN telefono_cliente tc
ON c.cedula=tc.cedula_cliente;
/*------------------------------
Consulta 4
-------------------------------*/
SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN=libro_autor.ISBN_libro
JOIN autor ON autor.id=libro_autor.id_autor;
/*------------------------------
Consulta 5
-------------------------------*/
SELECT DISTINCT Editorial.nombre
FROM libro
JOIN libro_cliente ON libro.ISBN=libro_cliente.ISBN_libro_cliente
JOIN Editorial ON libro.nombre_editorial=Editorial.nombre;

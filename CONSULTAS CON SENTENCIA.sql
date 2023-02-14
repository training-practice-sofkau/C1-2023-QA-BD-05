/*CONSULTA NOMBRE Y FECHA DE CADA AUTOR*/

SELECT*FROM autor;

SELECT nombre,`fecha de nacimiento` FROM autor;

/*CONSULTA LIBROS VENDIDOS*/

SELECT COUNT(DISTINCT ISBN_libro_cliente) FROM libro_cliente;

/*NOMBRE DEL CLIENTE CON SU TELEFONO*/

SELECT cliente.nombre, telefono_cliente.numero FROM cliente JOIN telefono_cliente;

/*CONSULTA DEL NOMBRE DEL LIBRO ACOMPAÑADO DE SU AUTOR*/

SELECT libro.titulo, autor.nombre FROM libro JOIN autor;

/*CONSULTA DE EL NOMBRE DE LAS EDITORIALES QUE HAN LOGRADO VENDER LIBROS*/

SELECT DISTINCT editorial.nombre
FROM editorial
JOIN libro
ON editorial.nombre = libro.nombre_editorial
JOIN libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente;
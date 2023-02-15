SELECT l.ISBN, l.titulo, COUNT(DISTINCT lc.ISBN_libro_cliente) as cantidad_libros_distintos
FROM libro l
JOIN libro_cliente lc ON l.ISBN = lc.ISBN_libro_cliente
GROUP BY l.ISBN, l.titulo;
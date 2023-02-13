create view titulosvendidos as
SELECT libro.titulo, COUNT(libro_cliente.ISBN_libro_cliente) as veces_vendido
FROM libro
JOIN libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY libro.titulo;

select * from titulosvendidos;

create view editorialesventas as 
SELECT DISTINCT nombre_editorial 
FROM libro 
INNER JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente;

select * from editorialesventas;
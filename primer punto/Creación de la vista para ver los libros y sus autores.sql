CREATE VIEW libros AS
SELECT l.ISBN, l.titulo, group_concat(a.nombre) as nombre_autores
FROM libro l
join libro_autor la on l.ISBN=la.ISBN_libro
JOIN autor a ON a.id=la.id_autor
GROUP BY l.titulo, l.ISBN,a.nombre;
select l.nombre_editorial as nombre_editorial, group_concat(distinct(l.titulo)) as nombre_libros
from libro l
join libro_cliente lc on l.ISBN=lc.ISBN_libro_cliente
group by l.nombre_editorial;
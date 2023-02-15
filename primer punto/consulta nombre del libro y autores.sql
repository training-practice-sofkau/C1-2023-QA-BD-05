select l.titulo as nombre_libro, group_concat(a.nombre) as nombre_autores
from libro l
join libro_autor la on l.ISBN=la.ISBN_libro
join autor a on la.id_autor=a.id
group by l.titulo;
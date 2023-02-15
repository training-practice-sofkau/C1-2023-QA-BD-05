use libreriabuscalibre;

#Nombre y la fecha de nacimiento de cada autor
select `nombre`,`fecha de nacimiento` from autor;

#Cantidad de libros diferentes vendidos
select count(distinct ISBN_libro_cliente) from libro_cliente;

#Nombre de cliente acompañado de su numero teléfonico
select cliente.nombre,telefono_cliente.numero
from cliente inner join telefono_cliente
on cliente.cedula=telefono_cliente.cedula_cliente;

#Nombre del libro acompañado por su autor o sus autores
select titulo, GROUP_CONCAT(nombre SEPARATOR '- ') as autores
from libro
inner join libro_autor
on libro.ISBN = libro_autor.ISBN_libro
inner join autor
on libro_autor.id_autor = autor.id
group by titulo;

#Nombre de las editoriales que han logrado vender libros
select distinct nombre_editorial
from libro
join libro_cliente
on libro.ISBN = libro_cliente.ISBN_libro_cliente;

#Creacion de Vistas
#Primera vista para ver el libro que compro cada cliente
create view  `Libros Comprados` as
select titulo, nombre from libro
inner join libro_cliente on libro.ISBN = libro_cliente.ISBN_libro_cliente 
inner join cliente on libro_cliente.id_cliente = cliente.cedula;

select * from `Libros Comprados`;

#Vista para ver el titulo del libro, editorial y su autor
create view `Info Libros` as
select libro.titulo,libro.nombre_editorial,autor.nombre as autor from libro
inner join libro_autor on libro_autor.ISBN_libro = libro.ISBN
inner join autor on autor.id = libro_autor.id_autor;

select * from `info libros`;
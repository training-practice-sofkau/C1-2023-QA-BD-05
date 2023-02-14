-- -----------------------------------------------------
-- Conocer la cantidad de libros que ha comprado cada cliente
-- -----------------------------------------------------
create view LibrosCompradorPorCliente as
select cliente.nombre, count(libro_cliente.ISBN_libro_cliente) as Libros_vendidos
from libro_cliente inner join cliente
on libro_cliente.id_cliente = cliente.cedula
group by cliente.nombre;

select * from libroscompradorporcliente;
-- -----------------------------------------------------
-- Conocer la cantidad de libros que estan registrados en cada editorial
-- -----------------------------------------------------
select * from Can_Libros_Cada_Editorial;

create view Can_Libros_Cada_Editorial as
select editorial.nombre , count(libro.titulo) as Libros_Registrados
from editorial inner join libro
on editorial.nombre=libro.nombre_editorial
group by editorial.nombre








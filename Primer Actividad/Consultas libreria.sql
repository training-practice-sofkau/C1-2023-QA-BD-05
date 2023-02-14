-- -----------------------------------------------------
-- Conocer el nombre y la fecha de nacimiento de cada escritor 
-- -----------------------------------------------------
select nombre,fechadenacimiento
from autor;
-- -----------------------------------------------------
-- La cantidad de libros diferentes vendidos
-- -----------------------------------------------------
select count(ISBN_libro_cliente) as Libros_Vendidos
from libro_cliente;
-- -----------------------------------------------------
-- El nombre de su cliente acompañado de su número telefónico
-- -----------------------------------------------------
select cliente.nombre, telefono_cliente.numero
from cliente inner join telefono_cliente
on cliente.cedula = telefono_cliente.cedula_cliente
-- -----------------------------------------------------
-- El nombre del libro acompañado de su autor 
-- -----------------------------------------------------
select libro.titulo, autor.nombre
from libro_autor inner join  libro  
on libro.ISBN = libro_autor.ISBN_libro
inner join autor
on autor.id = libro_autor.id_autor
-- -----------------------------------------------------
-- El nombre de las editoriales que han logrado vender libros
-- -----------------------------------------------------
select editorial.nombre , Count(libro_cliente.ISBN_libro_cliente) as Lista_libros_Vendidos_Por_Editorial
from  libro inner join editorial
on libro.nombre_editorial = editorial.nombre
inner join libro_cliente
on libro_cliente.ISBN_libro_cliente= libro.ISBN
group by libro.nombre_editorial;
 

 
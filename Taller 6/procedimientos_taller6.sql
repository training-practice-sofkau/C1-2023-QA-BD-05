
use libreriabuscalibre;
DELIMITER //
create procedure buscar_por_id(in codigo_autor varchar(10))
BEGIN 
select * from autor where id=codigo_autor;
END 
//

DELIMITER // 
create procedure agregar_libro(in isbn_libro varchar(10),in titulo_libro varchar(45),n_paginas varchar(45),name_editorial varchar(50))
BEGIN 
insert into libro values (isbn_libro,titulo_libro,n_paginas,name_editorial);
END ;
//
call agregar_libro('L21', 'Probando ando', '500','Alba');

#Procedimiento para actualizar un libro
DELIMITER // 
create procedure actualizar_libro(in isbn_libro varchar(10),in titulo_libro varchar(45),n_paginas varchar(45),name_editorial varchar(50))
BEGIN 
UPDATE libro
SET titulo = titulo_libro, numero_paginas = n_paginas, nombre_editorial = name_editorial
WHERE ISBN = isbn_libro;
END ;
//
call actualizar_libro('L21', 'Introduccion a Procedimientos', '280','Alfaguara');

#Procedimiento para listar los libros de determinada editorial
DELIMITER // 
create procedure listar_libros(in name_editorial varchar(50))
BEGIN 
select * from libro where nombre_editorial = name_editorial;
END ;
//
call listar_libros('Alba');

#Porcedimiento para eliminar un libro
DELIMITER // 
create procedure eliminar_libro(in isbn_libro varchar(10))
BEGIN 
delete from libro where ISBN = isbn_libro;
END ;
//
call eliminar_libro('L21');
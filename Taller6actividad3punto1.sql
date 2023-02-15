use libreriabuscalibre;

DELIMITER //
create procedure agregar_registro_autor(in ID_autor varchar(15), in fecha_nacimiento varchar(50),in nacionalidad_autor varchar(50),in nombre_autor varchar(50))
begin
select * from autor;
insert into autor (id,`fecha de nacimiento`,nacionalidad,nombre) values (ID_autor,fecha_nacimiento,nacionalidad_autor,nombre_autor);
end//
delimiter ;

call agregar_registro_autor(12345,'12/03/2000','colombia','Efrain');

DELIMITER //
create procedure eliminar_registro_autor(in ID_autor varchar(15))
begin
select * from autor;
delete from autor where id = ID_autor;
end//
delimiter ;

call eliminar_registro_autor(12345);

DELIMITER //
create procedure actualizar_registro_autor(in ID_autor varchar(15), in fecha_nacimiento varchar(50),in nacionalidad_autor varchar(50),in nombre_autor varchar(50))
begin
select * from autor;
update autor set `fecha de nacimiento` = fecha_nacimiento, nacionalidad = nacionalidad_autor, nombre= nombre_autor where id = ID_autor;
end//
delimiter ;

call actualizar_registro_autor(1,'20/12/1990', 'perù', 'Raul');

DELIMITER //
create procedure consultar_registro_autor(in ID_autor varchar(15))
begin
select * from autor where id = ID_autor;
end//
delimiter ;

call consultar_registro_autor(1);
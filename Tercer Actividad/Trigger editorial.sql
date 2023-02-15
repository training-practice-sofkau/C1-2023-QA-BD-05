use libreriabuscalibre;

create table control_de_cambios_libreria(
	usuario varchar(45),
    accion varchar(45),
    fecha datetime default current_timestamp
);

-- -----------------------------------------------------
-- Trigger- generar un registro cuando se inserte una editorial
-- -----------------------------------------------------
delimiter //
create trigger nom_editorial after insert on editorial
	for each row 
    begin
		insert into control_de_cambios_libreria (usuario,accion,fecha)
		values ('Laura alba','Agregar', now());
    end; 
    //
insert into editorial (nombre,ciudad,complemento,Telefono)
values ('Norma','Bogota','cr 7 12-25','3205642857');

-- -----------------------------------------------------
-- Trigger- generar un registro cuando se elimine una editorial
-- -----------------------------------------------------
delimiter //
create trigger eliminar_editorial after delete on editorial
	for each row
    begin
		insert into control_de_cambios_libreria (usuario,accion,fecha)
		values ('Pedro perez','eliminar', now());
    end;
    //
delete from editorial where nombre='Norma';
    

    


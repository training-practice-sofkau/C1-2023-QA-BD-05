use libreriabuscalibre;

select * from editorial;
-- -----------------------------------------------------
-- Procedimiento agregar de BD libreria de la tabla editorial
-- -----------------------------------------------------
delimiter //
create procedure agregar_editorial (in Nom_editorial varchar(50), Cdad_editorial varchar(30), 
Compl_editorial varchar(100), tel_editorial varchar(20))
begin 
	insert into editorial (nombre,ciudad,complemento,Telefono) 
    values (Nom_editorial,Cdad_editorial,Compl_editorial,tel_editorial);
end;	//

call agregar_editorial ('Norma','Bogota','cr 6 12-25','320675489');

-- -----------------------------------------------------
-- Procedimiento actualizar de BD libreria de la tabla editorial
-- -----------------------------------------------------
delimiter //
create procedure actualizar_editorial(in Nom_editorial varchar(50), Cdad_editorial varchar(30), 
Compl_editorial varchar(100), tel_editorial varchar(20))
begin
	update editorial set ciudad=Cdad_editorial, complemento=Compl_editorial, Telefono= tel_editorial
    where nombre=Nom_editorial;
end //
delimiter;

call actualizar_editorial ('Altea','Cundinamarca','calle 5 13-25','3182953467')

-- -----------------------------------------------------
-- Procedimiento consultar de BD libreria de la tabla editorial
-- -----------------------------------------------------
delimiter //
create procedure consultar_por_nombre (in nombre_editorial varchar (50))
begin
select * from editorial where nombre=nombre_editorial;
end //
delimiter ;

call consultar_por_nombre('Altea')
-- -----------------------------------------------------
-- Procedimiento eliminar de BD libreria de la tabla editorial
-- -----------------------------------------------------
delimiter //
create procedure eliminar_editorial (in Nombre_editorial varchar(50))
begin 
	delete from editorial where nombre=Nombre_editorial;
end; //

call eliminar_editorial('Norma')


use hospital;

create table control_de_cambios_hospital(
	usuario varchar(45),
    accion varchar(45),
    fecha datetime default current_timestamp
);

-- -----------------------------------------------------
-- Trigger- generar un registro cuando se inserte un medico
-- -----------------------------------------------------
delimiter //
create trigger agregar_medico after insert on medico
	for each row 
    begin
		insert into control_de_cambios_hospital (usuario,accion,fecha)
		values ('Luisa mendez','Agregar', now());
    end; 
    //
insert into medico(cedula_medico,nombres_medico,apellidos_medico,especialidad)
values ('516784523','Alexander','Gonzalez Ramirez','Nutricionista');

-- -----------------------------------------------------
-- Trigger- generar un registro cuando se elimine un medico
-- -----------------------------------------------------
delimiter //
create trigger eliminar_medico after delete on medico
	for each row
    begin
		insert into control_de_cambios_hospital (usuario,accion,fecha)
		values ('Vivian Gonzalez','eliminar', now());
    end;
    //
    
delete from medico where cedula_medico='516784523';


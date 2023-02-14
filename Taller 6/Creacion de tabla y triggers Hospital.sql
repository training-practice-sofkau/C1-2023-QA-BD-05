-- Creacion tabla cambios
create table control_de_cambios_hospital(
	nombre varchar(50),
    accion varchar(30),
    fecha datetime default current_timestamp
);

-- Creacion trigger insercion de datos a medico
DELIMITER //
create trigger trigger_ins_medico after insert on medico
	for each row
    begin
		insert into control_de_cambios_hospital values (
			user(), 'Insertar', now()
            );
    end;
    //
    DELIMITER ;

-- Creacion trigger eliminacion de datos a medico
DELIMITER //
create trigger trigger_Del_medico after delete on medico
	for each row
    begin
		insert into control_de_cambios_hospital values (
			user(), 'Eliminar', now()
            );
    end;
    //
    DELIMITER ;
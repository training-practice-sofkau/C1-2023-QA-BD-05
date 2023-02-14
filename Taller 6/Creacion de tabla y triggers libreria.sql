-- Creacion tabla cambios
create table control_de_cambios_librería(
	nombre varchar(50),
    accion varchar(30),
    fecha datetime default current_timestamp
);

-- Creacion trigger insercion de datos a libro
DELIMITER //
create trigger trigger_ins_libro after insert on libro
	for each row
    begin
		insert into control_de_cambios_librería values (
			user(), 'Insertar', now()
            );
    end;
    //
    DELIMITER ;

-- Creacion trigger eliminacion de datos a libro
DELIMITER //
create trigger trigger_Del_libro after delete on libro
	for each row
    begin
		insert into control_de_cambios_librería values (
			user(), 'Eliminar', now()
            );
    end;
    //
    DELIMITER ;


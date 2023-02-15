
use libreriabuscalibre;

create table control_de_cambios_libreria(
usuario varchar(45),
accion varchar(45),
fecha datetime default current_timestamp
);

#Trigger para registrar quien agrega un dato
DELIMITER //
create trigger inserto_libro after insert on libro
for each row
begin
	insert into control_de_cambios_libreria
    values (user(),"AGREGO LIBRO",now());
end;
//
DELIMITER ;

insert into libro values ('L22', 'Triggers', '900','Alba');

#Trigger para registrar quien elimina un libro
DELIMITER //
create trigger elimino_libro after delete on libro
for each row
begin
	insert into control_de_cambios_libreria
    values (user(),"ELIMINO LIBRO",now());
end;
//
DELIMITER ;

delete from libro where ISBN = 'L22';
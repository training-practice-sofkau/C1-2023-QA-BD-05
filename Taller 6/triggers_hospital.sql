use hospital;

create table control_de_cambios_hospital(
usuario varchar(45),
accion varchar(45),
fecha datetime default current_timestamp
);

#Trigger para registrar quien agrega un medico
DELIMITER //
create trigger inserto_medico after insert on medico
for each row
begin
	insert into control_de_cambios_hospital
    values (user(),"AGREGO MEDICO",now());
end;
//
DELIMITER ;

insert into medico values('M7', 'Juan', 'Valdez','Cirujia Plastica');

#Trigger para registrar quien elimina un medico
DELIMITER //
create trigger elimino_medico after delete on medico
for each row
begin
	insert into control_de_cambios_hospital
    values (user(),"ELIMINO MEDICO",now());
end;
//
DELIMITER ;

delete from medico where id_medico = 'M7';
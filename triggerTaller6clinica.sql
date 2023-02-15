
delimiter //
create trigger registro_procedimiento after insert on procedimiento
for each row
begin
	insert into control_de_cambios_hospital values (user(),'se hizo registro',now());
end//
delimiter ;

delimiter //
create trigger registro_procedimiento_eliminado after delete on procedimiento
for each row
begin
	insert into control_de_cambios_hospital values (user(),'se hizo registro',now());
end//
delimiter ;




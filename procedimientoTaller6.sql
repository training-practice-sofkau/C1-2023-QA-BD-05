use clinica_sofka

delimiter //
create procedure agregar_registro_procedimiento(in ID_precedimiento_procedure varchar(15), in tipo_procedimiento_procedure varchar(50))
begin
select * from procedimiento;
insert into procedimiento (ID_procedimiento,tipo_procedimiento) values (ID_precedimiento_procedure,tipo_procedimiento_procedure);
end//
delimiter ;



delimiter //
create procedure eliminar_registro_procedimiento(in ID_precedimiento_procedure varchar(15))
begin
select * from procedimiento;
delete from  procedimiento where ID_procedimiento = ID_precedimiento_procedure;
end//
delimiter ;


delimiter //
create procedure actualizar_registro_procedimiento(in ID_precedimiento_procedure varchar(15), in tipo_procedimiento_procedure varchar(50))
begin
select * from procedimiento;
update procedimiento set tipo_procedimiento = tipo_procedimiento_procedure  where ID_procedimiento = ID_precedimiento_procedure;
end//
delimiter ;

delimiter //
create procedure consultar_registro_procedimiento(in ID_precedimiento_procedure varchar(15))
begin
select * from procedimiento where ID_procedimiento = ID_precedimiento_procedure;
end//
delimiter ;





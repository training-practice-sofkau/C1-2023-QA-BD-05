use hospital;

select * from medico;
-- -----------------------------------------------------
-- Procedimiento agregar de BD hospital de la tabla medico
-- -----------------------------------------------------
delimiter //
create procedure agregar_medico (in Ced_medico varchar(15), Nom_medico varchar(60),
	Apel_medico varchar(60), Espe_medico varchar(55))
begin
	insert into medico(cedula_medico,nombres_medico,apellidos_medico,especialidad)
    values (Ced_medico,Nom_medico,Apel_medico,Espe_medico);
end;  //

call agregar_medico('51734675','Juan David','Mazo Rivera','Cardiologia')

    -- -----------------------------------------------------
-- Procedimiento actualizar de BD hospital de la tabla medico
-- -----------------------------------------------------
delimiter //
create procedure actualizar_medico (in Ced_medico varchar(15), Nom_medico varchar(60),
	Apel_medico varchar(60), Espe_medico varchar(55))
begin
	update medico set nombres_medico=Nom_medico, apellidos_medico=Apel_medico,especialidad=Espe_medico
    where cedula_medico=Ced_medico;
end; //

call actualizar_medico ('10987864','Maria Fernanda','Zuñiga Zalazar','Pediatra-Cardiologia')
-- -----------------------------------------------------
-- Procedimiento consultar de BD hospital de la tabla medico
-- -----------------------------------------------------
delimiter //
create procedure consultar_cedula (in Ced_medico varchar(15))
begin
	select * from medico where cedula_medico=Ced_medico;
end; //

call consultar_cedula ('10832356')
-- -----------------------------------------------------
-- Procedimiento eliminar de BD hospital de la tabla medico
-- -----------------------------------------------------
delimiter //
create procedure eliminar_medico(in Ced_medico varchar(15))
begin
	delete from medico where cedula_medico=Ced_medico;
end; //

call eliminar_medico('51734675')


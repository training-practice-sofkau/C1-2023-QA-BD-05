use hospital;

#Procedimiento para agregar un nuevo medico
DELIMITER // 
create procedure agregar_medico(in id varchar(10),in nombre varchar(45),apellido varchar(45),espe varchar(45))
BEGIN 
insert into medico values (id,nombre,apellido,espe);
END ;
//
DELIMITER ;
call agregar_medico('M6', 'Juan', 'Valdez','Cirujia Plastica');

#Procedimiento para actualizar un medico
DELIMITER // 
create procedure actualizar_medico(in id varchar(10),in nombre varchar(45),apellido varchar(45),espe varchar(45))
BEGIN 
UPDATE medico
SET nombre_medico = nombre, apellido_medico = apellido, especialidad = espe
WHERE id_medico = id;
END ;
//
call actualizar_medico('M6', 'Maria', 'Valdez','Pediatra');

#Procedimiento para listar los medicos de determinada especialidad
DELIMITER // 
create procedure listar_medicos(in espe varchar(45))
BEGIN 
select * from medico where especialidad = espe;
END ;
//
call listar_medicos('Pediatra');

#Porcedimiento para eliminar un medico
DELIMITER // 
create procedure eliminar_medico(in id varchar(10))
BEGIN 
delete from medico where id_medico = id;
END ;
//
call eliminar_medico('M6');
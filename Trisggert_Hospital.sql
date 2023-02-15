#Agregar informacion a la tabla

DELIMITER //
CREATE PROCEDURE agregar_medicamento(IN id_medicamento VARCHAR(20), 
in nombre_medicamento VARCHAR(50), in  dosis VARCHAR(50))

BEGIN 
INSERT INTO tb_medicamento values (medicamento,nombre_medicamento,dosis);
END //
DELIMITER ;

SELECT * FROM tb_medicamento;
 call agregar_medicamento("600P","Naproxeno","de por vida");
 
 
 #Listar informacion a la tabla
 
 DELIMITER //
CREATE PROCEDURE listar_medicamento(IN id_medicamento1 VARCHAR(20))

BEGIN 
select * from consultorio_medico_ospina.tb_medicamento where id_medicamento=id_medicamento1;
END //
DELIMITER ;

 call listar_medicamento("600P");
 
 
#actualizar informacion a la tabla
DELIMITER //
CREATE PROCEDURE actualizar_medicamento(IN cedula VARCHAR(10), in nombre VARCHAR(45))

BEGIN 
UPDATE `consultorio_medico_ospina`.`tb_medicamento` SET 
`id_medicamento` = '600E6', `nombre_medicamento` = 'Impoio6', `dosis` = 
'Dos veces al dia 6' WHERE (`id_medicamento` = '600E');
END //
DELIMITER ;

call actualizar_medicamento( '600E','Elefante', 'cinco veces al dia ');

#Elinar Registro
CREATE PROCEDURE eliminar_registro(in producto varchar(20)) BEGIN 
delete from tb_medicamento where id_medicamento = producto;
END
//
DELIMITER ;


#Elabore una nueva tabla llamada "control_de_cambios_hospital" la cual debe contener 3 columnas (usuario, accion, fecha)
# y guarde utilizando 2 Triggers el nombre del usuario que agrego o elimino un registro en la tabla 
#seleccionada en el punto anterior.

create table control_de_cambios_hospital(
		Usuario varchar(100), Accion varchar(100), Fecha datetime default current_timestamp
);

DELIMITER //
CREATE trigger agregar_procedimiento after insert on  tb_procedimiento for each row begin 
insert into control_de_cambios_hospital values
(user(),"Agregar un nuevo procedimiento", now());
end;
 //
DELIMITER ;

DELIMITER //
 create trigger eliminar_procedimiento after delete on tb_procedimiento
 for each row 
 begin insert into control_de_cambios_hospital values (user(), "Eliminar un procedimiento", now());  
 end;
 
//
DELIMITER ;

insert into tb_procedimiento values ("300W","Cirugia de ceja");

delete from tb_procedimiento where id_procedimiento="300W"; 
select * from control_de_cambios_hospital
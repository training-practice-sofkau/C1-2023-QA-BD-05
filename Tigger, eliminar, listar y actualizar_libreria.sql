#Elabore 4 procedimientos almacenados que me permitan agregar, actualizar, consultar y borrar,
# en una de las tablas de la librería (primera actividad).



#Traer una lista de una tabla
DELIMITER //
CREATE PROCEDURE consultar(IN id_autor VARCHAR(10))

BEGIN 
SELECT * FROM libreriabuscalibre.libro WHERE id = id_autor;
END //
DELIMITER ;

#Agregar informacion a la tabla
DELIMITER //
CREATE PROCEDURE agregar(IN cedula VARCHAR(10), in nombre VARCHAR(45))

BEGIN 
INSERT INTO `libreriabuscalibre`.`cliente` (`cedula`, `nombre`) VALUES ('100000122', 'Lolita');
END //
DELIMITER ;

#actualizar informacion a la tabla
DELIMITER //
CREATE PROCEDURE actualizar(IN cedula VARCHAR(10), in nombre VARCHAR(45))

BEGIN 
UPDATE `libreriabuscalibre`.`cliente` SET `cedula` = '1999977760', `nombre` = 'Flor Maria' WHERE (`cedula` = '100000122');
END //
DELIMITER ;

CALL consulta("01");

#Eliminar un registro
DELIMITER //
CREATE PROCEDURE eliminar(IN cedula VARCHAR(10), in nombre VARCHAR(45))

BEGIN 
DELETE FROM `libreriabuscalibre`.`cliente` WHERE (`cedula` = '100000122');
END //
DELIMITER ;




#Elabore una nueva tabla llamada "control_de_cambios_librería" la cual debe contener 3 columnas 
#(usuario, accion, fecha) y guarde utilizando 2 Triggers el nombre del usuario que agrego o elimino un registro en 
#la tabla seleccionada en el punto anterior.

create table control_de_cambios_libreria(
		Usuario varchar(100), Accion varchar(100), Fecha datetime default current_timestamp
);

DELIMITER //
CREATE trigger agregar_libro after insert on libro for each row begin 
insert into control_de_cambios_libreria values
(user(),"Agregar un nuevo libro", now());
end;
 //
DELIMITER ;

DELIMITER //
 create trigger eliminar_libro after delete on libro
 for each row 
 begin insert into control_de_cambios_libreria values (user(), "Eliminar libro de la lista", now());  
 end;
 
//
DELIMITER ;

select * from libro;
insert into libro values ("A00018",	"Rojo y negro",	"777", "Aguilar");

delete from libro where ISBN="A00125"; select * from control_de_cambios_libreria;
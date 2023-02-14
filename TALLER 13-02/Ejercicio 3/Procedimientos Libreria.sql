# Elabore 4 procedimientos almacenados que me permitan agregar, actualizar, consultar y borrar, en una de las tablas de la librería (primera actividad)

#PARA REALIZAR EL EJERCICIO SE SELECCIONA LA TABLA PACIENTE
USE hospitalqa;

#PROCEDIMIENTO PARA AGREGAR UN REGISTRO
DELIMITER // 
CREATE PROCEDURE agregarPaciente
(
IN _id_paciente VARCHAR (10),
IN _nombre VARCHAR(45),
IN _direccion VARCHAR(45),
IN _id_procedimient VARCHAR(45)
)
BEGIN 
INSERT INTO paciente (id_paciente,nombre,direccion,id_procedimient)
 values (_id_paciente,_nombre,_direccion,_id_procedimient);
END
// 
#Llamar el procedimiento agregar paciente
CALL agregarPaciente('20','Flor Ramirez','Fusagasuga','3');

# PROCEDIMIENTO PARA CONSULTAR PACIENTE
DELIMITER //
CREATE PROCEDURE buscar_paciente(IN _id_paciente VARCHAR (10))
BEGIN
SELECT * FROM paciente WHERE id_paciente = _id_paciente;
END
//
#Llamar procedimiento buscar paciente
CALL buscar_paciente(20);

# PROCEDIMIENTO ACTUALIZAR PACIENTE
DELIMITER //
CREATE PROCEDURE modificar_paciente
(
IN _id_paciente VARCHAR (10),
IN _nombre VARCHAR(45),
IN _direccion VARCHAR(45),
IN _id_procedimient VARCHAR(45)
)
BEGIN
UPDATE paciente 
SET  nombre = _nombre,
direccion = _direccion,
id_procedimient = _id_procedimient
WHERE id_paciente = _id_paciente;
END
//
#Llamar procedimiento modificar paciente
CALL modificar_paciente ('20','Carla Mendez','Fusagasuga','2');

#PROCEDIMIENTO BORRAR PACIENTE
DELIMITER //
CREATE PROCEDURE borrar_paciente 
(
IN _id_paciente VARCHAR (10)
)
BEGIN
DELETE FROM paciente WHERE id_paciente = _id_paciente;
END
//
#Llamar procedimiento borrar paciente
CALL borrar_paciente(20);

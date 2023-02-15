# Elabore 4 procedimientos almacenados que me permitan agregar, actualizar, consultar y borrar, en una de las tablas de la librería (primera actividad).

#PARA REALIZAR EL EJERCICIO SE SELECCIONA LA TABLA CLIENTE
USE libreriabuscalibre;

#PROCEDIMIENTO PARA AGREGAR UN REGISTRO
DELIMITER // 
CREATE PROCEDURE agregarCliente
(
IN _cedula VARCHAR (10),
IN _nombre VARCHAR(45)
)
BEGIN 
INSERT INTO cliente (cedula,nombre)
 values (_cedula,_nombre);
END
// 
#Llamar el procedimiento agregar cliente
CALL agregarCliente('100','Flor Jimenez');

# PROCEDIMIENTO PARA CONSULTAR CLIENTE
DELIMITER //
CREATE PROCEDURE buscar_cliente(IN _cedula VARCHAR (10))
BEGIN
SELECT * FROM cliente WHERE cedula = _cedula;
END
//
#Llamar procedimiento buscar cliente
CALL buscar_cliente(100);

# PROCEDIMIENTO ACTUALIZAR cliente
DELIMITER //
CREATE PROCEDURE modificar_cliente
(
IN _cedula VARCHAR (10),
IN _nombre VARCHAR(45)
)
BEGIN
UPDATE cliente 
SET  nombre = _nombre
WHERE cedula = _cedula;
END
//
#Llamar procedimiento modificar cliente
CALL modificar_cliente ('100','Carlos Torres');

#PROCEDIMIENTO BORRAR CLIENTE
DELIMITER //
CREATE PROCEDURE borrar_cliente
(
IN _cedula VARCHAR (10)
)
BEGIN
DELETE FROM cliente WHERE cedula = _cedula;
END
//
#Llamar procedimiento borrar cliente
CALL borrar_cliente(100);
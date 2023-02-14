#Procedimiento almacenado para insertar cliente
DELIMITER //
CREATE PROCEDURE sp_agregar_cliente (
    IN cedula_param VARCHAR(10),
    IN nombre_param VARCHAR(45)
)
BEGIN
    INSERT INTO cliente (cedula, nombre) VALUES (cedula_param, nombre_param);
END//
DELIMITER ;

CALL sp_agregar_cliente("9898011", "Alejandra G");

SELECT * FROM cliente;

#sp para actualizar clientes
DELIMITER //
CREATE PROCEDURE sp_actualizar_cliente (
    IN cedula_param VARCHAR(10),
    IN nombre_param VARCHAR(45)
)
BEGIN
    UPDATE cliente SET nombre = nombre_param WHERE cedula = cedula_param;
END//
DELIMITER ;


CALL sp_actualizar_cliente('9898011', 'AlejandraGuadir');

#sp para consultar clientes
DELIMITER //
CREATE PROCEDURE sp_consultar_cliente (
    IN cedula_param VARCHAR(10)
)
BEGIN
    SELECT * FROM cliente WHERE cedula = cedula_param;
END//
DELIMITER ;
CALL sp_consultar_cliente('9898011');

#sp para eliminar cliente

DELIMITER //
CREATE PROCEDURE sp_borrar_cliente (
    IN cedula_param VARCHAR(10)
)
BEGIN
    DELETE FROM cliente WHERE cedula = cedula_param;
END//
DELIMITER ;
CALL sp_borrar_cliente('9898011');







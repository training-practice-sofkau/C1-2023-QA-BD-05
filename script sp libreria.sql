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

# Crear la tabla control_de_cambios_librería
CREATE TABLE IF NOT EXISTS control_de_cambios_librería (
  usuario VARCHAR(45) NOT NULL,
  accion VARCHAR(10) NOT NULL,
  fecha DATETIME NOT NULL,
  PRIMARY KEY (usuario, accion, fecha)
) ENGINE=InnoDB;

# Trigger para agregar registros en la tabla cliente
DELIMITER //
CREATE TRIGGER tr_insertar_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha)
  VALUES (USER(), "insert", NOW());
END//
DELIMITER ;

# Trigger para eliminar registros en la tabla cliente
DELIMITER //
CREATE TRIGGER tr_eliminar_cliente
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha)
  VALUES (USER(), "delete", NOW());
END//
DELIMITER ;








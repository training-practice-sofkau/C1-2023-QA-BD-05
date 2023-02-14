use hospital;
#Sp para agregar procedimiento
DELIMITER //
CREATE PROCEDURE sp_agregar_procedimiento (
    IN id_param INT,
    IN tipoProcedimiento_param VARCHAR(45)
)
BEGIN
    INSERT INTO procedimiento (id, tipoProcedimiento) VALUES (id_param, tipoProcedimiento_param);
END//
DELIMITER ;

CALL sp_agregar_procedimiento("11", "Urologia");
SELECT*FROM procedimiento;


#Sp para actualizar procedimiento
DELIMITER //
CREATE PROCEDURE sp_actualizar_procedimiento (
    IN id_param INT,
    IN tipoProcedimiento_param VARCHAR(45)
)
BEGIN
    UPDATE procedimiento SET id = id_param WHERE tipoProcedimiento = tipoProcedimiento_param;
END//
DELIMITER ;
CALL sp_actualizar_procedimiento('11', 'Cirugia general');

#Sp para consultar procedimiento
DELIMITER //
CREATE PROCEDURE sp_consultar_procedimiento (
    IN id_param  INT
)
BEGIN
    SELECT * FROM procedimiento WHERE id = id_param ;
END//
DELIMITER ;
CALL sp_consultar_procedimiento('11');

#sp para eliminar procedimiento
DELIMITER //
CREATE PROCEDURE sp_borrar_procedimiento (
    IN id_param   INT
)
BEGIN
    DELETE FROM procedimiento WHERE id = id_param  ;
END//
DELIMITER ;
CALL sp_borrar_procedimiento('11');

# Crear la tabla control_de_cambios_en procedimientos de hospital
CREATE TABLE IF NOT EXISTS control_de_cambios_procedimientosMedicos (
  usuario VARCHAR(45) NOT NULL,
  accion VARCHAR(10) NOT NULL,
  fecha DATETIME NOT NULL,
  PRIMARY KEY (usuario, accion, fecha)
);

#Trigger para registrar el usuario que registro los datos en la tabla clientes.

DELIMITER //
CREATE TRIGGER tr_insertar_procedimientoMedico
AFTER INSERT ON procedimiento
FOR EACH ROW
BEGIN
  INSERT INTO tr_insertar_procedimientoMedico (usuario, accion, fecha)
  VALUES (USER(), "insert", NOW());
END//
DELIMITER ;

#Trigger para registrar el usuario que registro los datos en la tabla clientes.
DELIMITER //
CREATE TRIGGER tr_eliminar_procedimientoMedico
AFTER DELETE ON procedimiento
FOR EACH ROW
BEGIN
  INSERT INTO tr_insertar_procedimientoMedico (usuario, accion, fecha)
  VALUES (USER(), "delete", NOW());
END//
DELIMITER ;





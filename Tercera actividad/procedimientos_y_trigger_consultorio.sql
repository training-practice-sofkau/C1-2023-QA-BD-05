
DELIMITER //
CREATE PROCEDURE agregarPaciente (IN nombre_paciente VARCHAR(45), IN direccion_paciente VARCHAR(45), 
IN telefono_paciente VARCHAR(45), IN id_procedimiento INT)
BEGIN
    DECLARE id_pac INT;
    INSERT INTO Paciente (nombre, direccion, telefono, id_procedimiento) 
    VALUES (nombre_paciente, direccion_paciente, telefono_paciente, id_procedimiento);
    SET id_pac = LAST_INSERT_ID();
    SELECT id_pac AS id_paciente;
END //
DELIMITER ;

CALL agregarPaciente('Juan Pérez', 'Calle 123', '555-1234', 1);

DELIMITER //
CREATE PROCEDURE actualizarPaciente (IN id_paciente INT, IN nombre_paciente VARCHAR(45), 
IN direccion_paciente VARCHAR(45), IN telefono_paciente VARCHAR(45), IN id_procedimiento INT)
BEGIN
    UPDATE Paciente
    SET nombre = nombre_paciente,
        direccion = direccion_paciente,
        telefono = telefono_paciente,
        id_procedimiento = id_procedimiento
    WHERE id_paciente = id_paciente;
END //
DELIMITER ;

CALL actualizarPaciente(5, 'eros jose', 'Calle 124', 'Nuevo teléfono', 2);

DELIMITER //
CREATE PROCEDURE consultarPaciente (IN id_paciente INT)
BEGIN
    SELECT * 
    FROM Paciente 
    WHERE id_paciente = id_paciente;
END //
DELIMITER ;

CALL consultarPaciente(1);

DELIMITER //
CREATE PROCEDURE borrarPaciente (IN id_paciente INT)
BEGIN
    DELETE FROM Paciente 
    WHERE id_paciente = id_paciente;
END //
DELIMITER ;

CALL borrarPaciente(1);

CREATE TABLE control_de_cambios_hospital (
  usuario VARCHAR(45),
  accion VARCHAR(45),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER tr_control_de_cambios_insert
AFTER INSERT ON `consultorio_doctor`.`Paciente`
FOR EACH ROW
BEGIN
    INSERT INTO `consultorio_doctor`.`control_de_cambios_hospital` (`usuario`, `accion`) 
    VALUES (USER(), 'Insertar en tabla Paciente');
END

CREATE TRIGGER tr_control_de_cambios_delete
AFTER DELETE ON `consultorio_doctor`.`Paciente`
FOR EACH ROW
BEGIN
    INSERT INTO `consultorio_doctor`.`control_de_cambios_hospital` (`usuario`, `accion`) 
    VALUES (USER(), 'Eliminar de tabla Paciente');
END 
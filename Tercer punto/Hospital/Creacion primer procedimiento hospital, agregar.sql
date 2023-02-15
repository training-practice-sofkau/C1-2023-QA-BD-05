DELIMITER //
CREATE PROCEDURE insertar_paciente(
    IN nombre VARCHAR(20),
    IN direccion varchar(45),
    IN idProcedimiento varchar(45)
)
BEGIN
    INSERT INTO paciente (nombre,direccion,idProcedimiento_paciente)
    VALUES (nombre,direccion,idProcedimiento);
END //
DELIMITER ;
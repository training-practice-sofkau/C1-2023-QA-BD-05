DELIMITER //
CREATE PROCEDURE consultar_paciente(
    IN nombre_paciente VARCHAR(20)
)
BEGIN
	SELECT *
    FROM paciente
    WHERE nombre = nombre_paciente;
END //
DELIMITER ;
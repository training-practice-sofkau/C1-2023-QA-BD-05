DELIMITER //
CREATE PROCEDURE eliminar_paciente(
    IN id_paciente int
)
BEGIN
	delete from paciente where idPaciente=id_paciente;
END //
DELIMITER ;
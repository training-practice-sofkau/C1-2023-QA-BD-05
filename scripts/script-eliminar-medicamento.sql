USE procedimiento_medico;

DELIMITER //
CREATE PROCEDURE eliminar_medicamento(in id_medicamento varchar(10))
BEGIN
	DELETE FROM medicamento WHERE id = id_medicamento;
END //
DELIMITER ;


USE procedimiento_medico;

DELIMITER //
CREATE PROCEDURE buscar_medicamento(in id_medicamento VARCHAR(10))
BEGIN
	SELECT * FROM medicamento WHERE medicamento.id = id_medicamento;
END //
DELIMITER ;
USE procedimiento_medico;

DELIMITER //
CREATE PROCEDURE agregar_medicamento(in id_medicamento varchar(10),
	nombre_medicamento varchar(45),
    dosis_medicamento varchar(45))
    BEGIN
		INSERT INTO medicamento VALUES (id_medicamento, nombre_medicamento, dosis_medicamento);
    END //
    DELIMITER ;
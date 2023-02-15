USE procedimiento_medico;

DELIMITER //

CREATE PROCEDURE actualizar_medicamento(in id_medicamento varchar(10),
	nombre_medicamento varchar(45),
    dosis_medicamento varchar(45))
BEGIN
	UPDATE medicamento
    SET nombre = nombre_medicamento, dosis = dosis_medicamento
    WHERE id = id_medicamento; 
END //
DELIMITER ;


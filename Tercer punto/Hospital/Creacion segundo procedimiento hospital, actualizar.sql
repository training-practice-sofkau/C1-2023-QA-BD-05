DELIMITER //
CREATE PROCEDURE actualizar_paciente(
	IN id_a int,
    IN nombre_a VARCHAR(20),
    IN direccion_a varchar(45),
    IN idProcedimiento_a varchar(45)
)
BEGIN
	update paciente set nombre=nombre_a,direccion=direccion_a,idProcedimiento_paciente=idProcedimiento_a WHERE idPaciente=id_a;
END //
DELIMITER ;
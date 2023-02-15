DELIMITER //
CREATE PROCEDURE actualizar_autor(
    IN id_a VARCHAR(10),
    IN nacionalidad_a VARCHAR(20),
    IN fecha_nacimiento_a varchar(45),
    IN nombre_a varchar(45)
)
BEGIN
	update autor set fecha_nacimiento=fecha_nacimiento_a,nacionalidad=nacionalidad_a,nombre=nombre_a WHERE id=id_a;
END //
DELIMITER ;
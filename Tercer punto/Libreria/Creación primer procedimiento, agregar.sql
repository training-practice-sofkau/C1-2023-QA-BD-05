DELIMITER //
CREATE PROCEDURE insertar_autor(
    IN id VARCHAR(10),
    IN nacionalidad VARCHAR(20),
    IN fecha_nacimiento varchar(45),
    IN nombre varchar(45)
)
BEGIN
    INSERT INTO autor (id,fecha_nacimiento,nacionalidad,nombre)
    VALUES (id,fecha_nacimiento,nacionalidad,nombre);
END //
DELIMITER ;
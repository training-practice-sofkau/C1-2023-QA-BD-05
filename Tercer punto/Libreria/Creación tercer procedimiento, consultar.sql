DELIMITER //
CREATE PROCEDURE consultar_autor(
    IN nombre_autor VARCHAR(45)
)
BEGIN
	SELECT *
    FROM autor
    WHERE nombre = nombre_autor;
END //
DELIMITER ;
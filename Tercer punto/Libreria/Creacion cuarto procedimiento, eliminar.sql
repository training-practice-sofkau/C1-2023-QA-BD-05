DELIMITER //
CREATE PROCEDURE eliminar_autor(
    IN id_autor VARCHAR(10)
)
BEGIN
	delete from autor where id=id_autor;
END //
DELIMITER ;
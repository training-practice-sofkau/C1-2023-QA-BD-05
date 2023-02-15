USE libreriabuscalibre;

DELIMITER //

CREATE PROCEDURE eliminar_libro(in ISBN_libro VARCHAR(12))
BEGIN
DELETE FROM libro WHERE ISBN = ISBN_libro;
END //
DELIMITER ;

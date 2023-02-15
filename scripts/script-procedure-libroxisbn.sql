USE libreriabuscalibre;

DELIMITER //
CREATE PROCEDURE buscar_por_ISBN(in ISBN_libro VARCHAR(12))
BEGIN
SELECT * FROM libro where libro.ISBN = ISBN_libro;
END //
DELIMITER ;

CALL buscar_por_ISBN("10606345");
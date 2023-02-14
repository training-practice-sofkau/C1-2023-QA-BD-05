USE libreriabuscalibre;

SELECT * FROM autor;

-- -----------------------------------------------------
-- Agregar Autor
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE agregar_autor(IN id_autor VARCHAR(10), fecha_nacimiento VARCHAR(45), IN nacionalidad_autor VARCHAR(20), IN nombre_autor VARCHAR(45))
BEGIN
INSERT INTO autor (id, `fecha de nacimiento`,nacionalidad, nombre) VALUES (id_autor, fecha_nacimiento, nacionalidad_autor, nombre_autor);
END
//

call libreriabuscalibre.agregar_autor('A006', '14-06-1951', 'Italia', 'Walter riso');
call libreriabuscalibre.agregar_autor('A007', '´07-10-1662', 'Alemania', 'Eckhart Tolle');

-- -----------------------------------------------------
-- Actualizar Autor
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE actualizar_autor (IN id_autor VARCHAR(10), fecha_nacimiento VARCHAR(45), IN nacionalidad_autor VARCHAR(20), IN nombre_autor VARCHAR(45))
BEGIN
UPDATE autor SET nombre = nombre_autor, `fecha de nacimiento`= fecha_nacimiento, nacionalidad = nacionalidad_autor WHERE id = id_autor;
END;
//

call libreriabuscalibre.actualizar_autor('A001', '02-02-1961', 'Español', 'Mario Alonso Puig');

-- -----------------------------------------------------
-- Consultar Autor
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE consultar_autor (IN id_autor VARCHAR(10))
BEGIN
SELECT * FROM autor WHERE id = id_autor;
END;
//

call libreriabuscalibre.consultar_autor('A002');

-- -----------------------------------------------------
-- Eliminar Autor
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE eliminar_autor(IN id_autor VARCHAR(10))
BEGIN
DELETE FROM autor WHERE id = id_autor;
END;
//

call libreriabuscalibre.eliminar_autor('A006');
call libreriabuscalibre.eliminar_autor('A007');


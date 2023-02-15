-- -----------------------------------------------------
-- Procedimientos primera actividad
-- -----------------------------------------------------
USE LibreriaBuscaLibre;

-- -----------------------------------------------------
-- Procedimiento Agregar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE agregar_autor (IN idA VARCHAR(10),
								IN fecha_nacimiento VARCHAR(45),
								IN nacionalidadA VARCHAR(20),
                                IN nombreA VARCHAR(45))
BEGIN
INSERT INTO autor
VALUES 
	(idA, fecha_nacimiento, nacionalidadA, nombreA);
END;
//
-- Llamada al procedimiento para probar
CALL agregar_autor ('6', '1/6/1980', 'BOL', 'Edward');

-- -----------------------------------------------------
-- Procedimiento Consultar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE autor_por_id (IN idA VARCHAR(10))
BEGIN
SELECT nombre AS 'Nombre Autor',
		`fecha de nacimiento` AS 'Fecha de Nacimiento',
		nacionalidad AS 'Nacionalidad'
FROM autor
WHERE id = idA;
END;
//
-- Llamada al procedimiento para probar
CALL autor_por_id ('4');

-- -----------------------------------------------------
-- Procedimiento Actualizar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE actualizar_autor (IN idA VARCHAR(10),
									IN fecha_nacimiento VARCHAR(45),
									IN nacionalidadA VARCHAR(20),
									IN nombreA VARCHAR(45))
BEGIN
UPDATE autor
SET `fecha de nacimiento` = fecha_nacimiento,
	nacionalidad = nacionalidadA,
    nombre = nombreA
WHERE id = idA;
END;
//
-- Llamada al procedimiento para probar
CALL actualizar_autor ('6', '1/6/1980', 'CAN', 'Edward');

-- -----------------------------------------------------
-- Procedimiento Borrar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE borrar_autor_por_id (IN idA VARCHAR(10))
BEGIN
DELETE FROM autor WHERE id = idA;
END;
//
-- Llamada al procedimiento para probar
CALL borrar_autor_por_id ('6');

-- -----------------------------------------------------
-- Procedimientos segunda actividad
-- -----------------------------------------------------
USE hospital_GNECJ;

-- -----------------------------------------------------
-- Procedimiento Agregar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE agregar_medicamento (IN nombreM VARCHAR(40),
									  IN dosisM VARCHAR(50))
BEGIN
INSERT INTO medicamento (nombre_medicamento, dosis)
VALUES 
	(nombreM, dosisM);
END;
//
-- Llamada al procedimiento para probar
CALL agregar_medicamento ('Ibuprofeno', '600 mg');

-- -----------------------------------------------------
-- Procedimiento Consultar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE medicamento_por_id (IN idM INT)
BEGIN
SELECT nombre_medicamento AS 'Medicamento',
		dosis AS 'Dosis recomendada'
FROM medicamento
WHERE id_medicamento = idM;
END;
//
-- Llamada al procedimiento para probar
CALL medicamento_por_id (6);

-- -----------------------------------------------------
-- Procedimiento Actualizar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE actualizar_medicamento (IN idM INT,
										 IN nombreM VARCHAR(40),
										 IN dosisM VARCHAR(50))
BEGIN
UPDATE medicamento
SET nombre_medicamento = nombreM,
	dosis = dosisM
WHERE id_medicamento = idM;
END;
//
-- Llamada al procedimiento para probar
CALL actualizar_medicamento (6, 'Ibuprofeno', '400 mg');

-- -----------------------------------------------------
-- Procedimiento Borrar
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE borrar_medicamento_por_id (IN idM INT)
BEGIN
DELETE FROM medicamento WHERE id_medicamento = idM;
END;
//
-- Llamada al procedimiento para probar
CALL borrar_medicamento_por_id (8);

-- -----------------------------------------------------
-- Triggers segunda actividad
-- -----------------------------------------------------
USE hospital_GNECJ;

-- -----------------------------------------------------
-- Creando tabla para registros
-- -----------------------------------------------------
CREATE TABLE control_de_cambios_hospital (
	usuario VARCHAR(100),
    acción VARCHAR(40),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Creando Trigger para registro Agregar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER ins_medicamento
AFTER INSERT ON medicamento
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital
VALUES (USER(), 'AGREGAR', NOW());
END;
//
-- Insertando registro de prueba para activar el Trigger
CALL agregar_medicamento ('Ibuprofeno', '600 mg');

-- -----------------------------------------------------
-- Creando Trigger para registro Eliminar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER del_medicamento
AFTER DELETE ON medicamento
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital
VALUES (USER(), 'ELIMINAR', NOW());
END;
//
-- Eliminando registro de prueba para activar el Trigger
CALL borrar_medicamento_por_id (6);

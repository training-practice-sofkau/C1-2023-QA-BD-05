-- -----------------------------------------------------
-- Triggers primera actividad
-- -----------------------------------------------------
USE LibreriaBuscaLibre;

-- -----------------------------------------------------
-- Creando tabla para registros
-- -----------------------------------------------------
CREATE TABLE control_de_cambios_librería (
	usuario VARCHAR(100),
    acción VARCHAR(40),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Creando Trigger para registro Agregar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER ins_autor
AFTER INSERT ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_librería
VALUES (USER(), 'AGREGAR', NOW());
END;
//
-- Insertando registro de prueba para activar el Trigger
CALL agregar_autor ('6', '1/6/1980', 'BOL', 'Edward');

-- -----------------------------------------------------
-- Creando Trigger para registro Eliminar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER del_autor
AFTER DELETE ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_librería
VALUES (USER(), 'ELIMINAR', NOW());
END;
//
-- Eliminando registro de prueba para activar el Trigger
CALL borrar_autor_por_id ('6');

USE libreriabuscalibre;

-- -----------------------------------------------------
-- Creo la tabla control de cambios libreria
-- -----------------------------------------------------
CREATE TABLE control_de_cambios_libreria (
  usuario VARCHAR(45),
  accion VARCHAR(20),
  fecha DATETIME
);

-- -----------------------------------------------------
-- Triggers Insertar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER control_libreria_insert
AFTER INSERT ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
VALUES (user(), 'insert', NOW());
END;
//
call libreriabuscalibre.agregar_autor('A0011', '09-07-1955', 'Africa', 'Angs');

-- -----------------------------------------------------
-- Trigger Eliminar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER control_libreria_delete
AFTER DELETE ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
VALUES (user(), 'delete', NOW());
END;
//

call libreriabuscalibre.eliminar_autor('A0011');

SELECT * FROM control_de_cambios_libreria;
SELECT * FROM autor;

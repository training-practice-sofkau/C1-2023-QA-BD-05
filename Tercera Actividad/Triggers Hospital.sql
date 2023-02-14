USE hospital;

-- -----------------------------------------------------
-- Creo la tabla control de cambios Hospital
-- -----------------------------------------------------
CREATE TABLE control_de_cambios_hospital (
  usuario VARCHAR(45),
  accion VARCHAR(20),
  fecha DATETIME
);

-- -----------------------------------------------------
-- Triggers Insertar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER control_hospital_insert
AFTER INSERT ON tb_medico
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
VALUES (user(), 'insert', NOW());
END;
//

call hospital.agregar_medico('M9', 'Sandra Milena', 'Gonzalez', 'Ginecologia');

-- -----------------------------------------------------
-- Trigger Eliminar
-- -----------------------------------------------------
DELIMITER //
CREATE TRIGGER control_hospital_delete
AFTER DELETE ON tb_medico
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
VALUES (user(), 'delete', NOW());
END;
//

call hospital.eliminar_medico('M9');

SELECT * FROM control_de_cambios_hospital;
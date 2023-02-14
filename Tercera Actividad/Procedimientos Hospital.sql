USE hospital;

SELECT * FROM tb_medico;
SELECT * FROM control_de_cambios_libreria;

-- -----------------------------------------------------
-- Agregar Médico
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE agregar_medico(IN id VARCHAR(15), IN nombre VARCHAR(45), IN apellido VARCHAR(45), IN especialidad_medico VARCHAR(45))
BEGIN
INSERT INTO tb_medico (id_medico, nombre_medico, apellido_medico, especialidad) VALUES (id, nombre, apellido, especialidad_medico);
END
//

call hospital.agregar_medico('M7', 'Carla', 'Jimenez', 'Ginecología');
call hospital.agregar_medico('M8', 'Isabela', 'Torres', 'Cardiologia');

-- -----------------------------------------------------
-- Actualizar Médico
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE actualizar_medico(IN id VARCHAR(15), IN nombre VARCHAR(45), IN apellido VARCHAR(45), IN especialidad_medico VARCHAR(45))
BEGIN
UPDATE tb_medico SET nombre_medico = nombre, apellido_medico = apellido, especialidad = especialidad_medico WHERE id_medico = id;
END;
//

call hospital.actualizar_medico('M5', 'Jimmy', 'Sanchez', 'Neurologia');

-- -----------------------------------------------------
-- Consultar Medico
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE consultar_medico(IN id VARCHAR(15))
BEGIN
SELECT * FROM tb_medico WHERE id_medico = id;
END;
//

call hospital.consultar_medico('M3');

-- -----------------------------------------------------
-- Eliminar Medico
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE eliminar_medico (IN id VARCHAR(15))
BEGIN
    DELETE FROM tb_medico
    WHERE id_medico = id;
END//

call hospital.eliminar_medico('M7');
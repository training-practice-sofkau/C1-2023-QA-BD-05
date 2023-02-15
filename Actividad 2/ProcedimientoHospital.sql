use hospital;


DELIMITER //
CREATE PROCEDURE insertar_medico (IN id VARCHAR(15),  nombre VARCHAR(45), IN apellido VARCHAR(45),  especialidad_medico VARCHAR(45))
BEGIN
    INSERT INTO medico (id_medico, nombre_medico, apellido_medico, especialidad) VALUES (id, nombre, apellido, especialidad_medico);
END//
DELIMITER

call hospital.insertar_medico('M008', 'YEISON FERNEY', 'OSORIO_BUITRAGO', 'ING DE SISTEMAS');

DROP TRIGGER control_hospital_insert


DELIMITER //
CREATE PROCEDURE seleccionar_medico (IN id VARCHAR(15))
BEGIN
    SELECT id_medico, nombre_medico, apellido_medico, especialidad
    FROM medico
    WHERE id_medico = id;
END//

call hospital.seleccionar_medico('M003');



DELIMITER //
CREATE PROCEDURE eliminar_medico (IN id VARCHAR(15))
BEGIN
    DELETE FROM medico
    WHERE id_medico = id;
END//

call hospital.eliminar_medico('M006');




DELIMITER //
CREATE PROCEDURE actualizar_medico (IN id VARCHAR(15), IN nombre_medico VARCHAR(45), 
                                     IN apellido_medico VARCHAR(45), IN especialidad VARCHAR(45))
BEGIN
    UPDATE medico
    SET nombre_medico = nombre_medico, apellido_medico = apellido_medico, especialidad = especialidad
    WHERE id_medico = id;
END//


call hospital.actualizar_medico('M008', 'JUAN CHUANDO', 'OSORIO', 'INGENIERO');
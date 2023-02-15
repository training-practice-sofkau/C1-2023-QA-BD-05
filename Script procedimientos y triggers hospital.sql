USE mydb

-- Procedimiento para agregar un numero de telefono
DELIMITER //
CREATE PROCEDURE agregar_telefono_medico (
 IN id_medico_procedimiento VARCHAR(15),
 IN numero_medico_procedimiento VARCHAR(15)
)
BEGIN
INSERT INTO telefono_medico (id_medico_telefono, numero_medico)
VALUES (id_medico_procedimiento, numero_medico_procedimiento);
END //
//DELIMITER ;

CALL agregar_telefono_medico('M001','3150254875')

-- Procedimiento para actualizar un numero de telefono
DELIMITER //
CREATE PROCEDURE actualizar_telefono_medico (
IN id_medico_procedimiento VARCHAR(15),
IN numero_medico_procedimiento VARCHAR(15),
IN nuevo_numero_medico VARCHAR(15)
)
BEGIN
UPDATE telefono_medico
SET numero_medico = nuevo_numero_medico
WHERE id_medico_telefono = id_medico_procedimiento AND numero_medico = numero_medico_procedimiento;
END //
//DELIMITER ;

CALL actualizar_telefono_medico ('M001','3150254875','3208565873')

-- Procedimiento para consultar numero de telefonos 
DELIMITER // 
CREATE PROCEDURE consultar_telefono_medico (
IN id_medico_procedimiento VARCHAR(15)
)
BEGIN 
SELECT numero_medico
FROM telefono_medico
WHERE id_medico_telefono = id_medico_procedimiento;
END //
//DELIMITER ;

CALL consultar_telefono_medico('M001')

-- Procedimiento para eliminar numero de telefonos 
DELIMITER //
CREATE PROCEDURE eliminar_telefono_medico (
IN id_medico_procedimiento VARCHAR(15),
IN numero_medico_procedimiento VARCHAR(15)
)
BEGIN
DELETE FROM telefono_medico
WHERE id_medico_telefono = id_medico_procedimiento AND numero_medico = numero_medico_procedimiento;
END //
//DELIMITER ;

CALL eliminar_telefono_medico ('M001','3208565873');

-- Tabla control_de_cambios_hospital
CREATE TABLE IF NOT EXISTS control_de_cambios_hospital (
    usuario VARCHAR(50),
    accion VARCHAR(50),
    fecha DATETIME DEFAULT current_timestamp
);

-- Trigger agregar
DELIMITER //
CREATE TRIGGER agregar_telefono AFTER INSERT ON telefono_medico
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_hospital VALUES(user(), 'agregar', now());
	END;
// DELIMITER ;

-- Trigger eliminar
DELIMITER //
CREATE TRIGGER eliminar_telefono AFTER DELETE ON telefono_medico
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_hospital VALUES(user(), 'eliminar', now());
	END;
// DELIMITER ;
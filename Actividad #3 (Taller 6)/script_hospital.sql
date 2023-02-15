USE db_hospital; 

-- Agregar teléfono paciente 
DELIMITER //
CREATE PROCEDURE agregar_telefono (
IN id_paciente_proc VARCHAR(10),
IN telefono_paciente_proc VARCHAR(15)
)
BEGIN 
INSERT INTO tb_telefono_paciente (id_paciente, telefono) 
VALUES (id_paciente_proc, telefono_paciente_proc);
END //
//DELIMITER ;

SELECT * FROM tb_telefono_paciente;
CALL agregar_telefono ('28446468', '3007897969');

-- Modificar teléfono paciente 
DELIMITER //
CREATE PROCEDURE modificar_telefono(
IN id_paciente_proc VARCHAR(10),
IN telefono_paciente_proc VARCHAR(15),
IN telefono_nuevo VARCHAR(15)
)
BEGIN 
UPDATE tb_telefono_paciente 
SET telefono = telefono_nuevo 
WHERE id_paciente = id_paciente_proc AND telefono = telefono_paciente_proc;
END //
//DELIMITER ; 

CALL modificar_telefono ('28446468', '3107897969','3001230000');

-- Consultar teléfono paciente 
DELIMITER //
CREATE PROCEDURE consultar_telefono(
IN id_paciente_proc VARCHAR(10)
)
BEGIN 
SELECT telefono
FROM tb_telefono_paciente
WHERE id_paciente = id_paciente_proc;
END //
//DELIMITER ; 

CALL consultar_telefono ('28446468');

-- Eliminar teléfono paciente
DELIMITER //
CREATE PROCEDURE eliminar_telefono(
IN id_paciente_proc VARCHAR(10),
IN telefono_paciente_proc VARCHAR(15)
)
BEGIN 
DELETE FROM tb_telefono_paciente 
WHERE id_paciente = id_paciente_proc AND telefono = telefono_paciente_proc;
END //
//DELIMITER ; 

CALL eliminar_telefono('28446468', '3007897969');


-- Creación de la tabla control de cambios hospital 
CREATE TABLE control_de_cambios_hospital(
usuario VARCHAR(45), 
accion VARCHAR(45),
fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM control_de_cambios_hospital;

-- Creación trigger que permite agregar un nuevo teléfono a un paciente 
DELIMITER //
CREATE TRIGGER agregar_telefono AFTER INSERT ON tb_telefono_paciente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_hospital VALUES(user(), 'Se agregó', now());
	END;
// DELIMITER ;

-- Creación trigger que permite eliminar un teléfono a un paciente 
DELIMITER //
CREATE TRIGGER eliminar_telefono AFTER DELETE ON tb_telefono_paciente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_hospital VALUES(user(), 'Se eliminó', now());
	END;
// DELIMITER ;

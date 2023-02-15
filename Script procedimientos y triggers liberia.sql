USE LibreriaBuscaLibre ;

-- Procedimiento para agregar un numero de telefono
DELIMITER //
CREATE PROCEDURE agregar_telefono_cliente (
 IN cedula_cliente_procedimiento VARCHAR(10),
 IN numero_cliente VARCHAR(15)
)
BEGIN
INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES (cedula_cliente_procedimiento, numero_cliente);
END //
//DELIMITER ;

CALL agregar_telefono_cliente ('7070707070','+57 3605485751')

-- Procedimiento para actualizar un numero de telefono
DELIMITER //
CREATE PROCEDURE actualizar_telefono_cliente (
IN cedula_cliente_procedimiento VARCHAR(10),
IN numero_cliente VARCHAR(15),
IN nuevo_numero_cliente VARCHAR(15)
)
BEGIN
UPDATE telefono_cliente
SET numero = nuevo_numero_cliente
WHERE cedula_cliente = cedula_cliente_procedimiento AND numero = numero_cliente;
END //
//DELIMITER ;

CALL actualizar_telefono_cliente ('7070707070','+57 3605485751','+57 3606060606')

-- Procedimiento para consultar numero de telefonos del cliente 
DELIMITER // 
CREATE PROCEDURE consultar_telefono_cliente (
IN cedula_cliente_procedimiento VARCHAR(10)
)
BEGIN 
SELECT numero
FROM telefono_cliente
WHERE cedula_cliente = cedula_cliente_procedimiento;
END //
//DELIMITER ;

CALL consultar_telefono_cliente ('7070707070')

-- Procedimiento para eliminar numero de telefonos del cliente 
DELIMITER //
CREATE PROCEDURE eliminar_telefono_cliente (
IN cedula_cliente_procedimiento VARCHAR(10),
IN numero_cliente VARCHAR(15)
)
BEGIN
DELETE FROM telefono_cliente
WHERE cedula_cliente = cedula_cliente_procedimiento AND numero = numero_cliente;
END //
//DELIMITER ;

CALL eliminar_telefono_cliente ('7070707070','+57 3606060606');

-- Tabla control_de_cambios_librería
CREATE TABLE IF NOT EXISTS control_de_cambios_librería (
    usuario VARCHAR(50),
    accion VARCHAR(50),
    fecha DATETIME DEFAULT current_timestamp
);

-- Trigger agregar
DELIMITER //
CREATE TRIGGER agregar_telefono AFTER INSERT ON telefono_cliente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_librería VALUES(user(), 'agregar', now());
	END;
// DELIMITER ;

-- Trigger eliminar
DELIMITER //
CREATE TRIGGER eliminar_telefono AFTER DELETE ON telefono_cliente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_librería VALUES(user(), 'eliminar', now());
	END;
// DELIMITER ;

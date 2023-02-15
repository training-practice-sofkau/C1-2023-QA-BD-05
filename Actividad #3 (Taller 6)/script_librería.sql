-- Indica cuál será la BD a la cual se le aplicarán las siguientes consultas: 
USE LibreriaBuscaLibre;

-- Agregar teléfono cliente
DELIMITER //
CREATE PROCEDURE agregar_telefono (
IN cedula_cliente_proc VARCHAR(10),
IN numero_cliente_proc VARCHAR(15)
)
BEGIN 
INSERT INTO telefono_cliente (cedula_cliente, numero) 
VALUES (cedula_cliente_proc, numero_cliente_proc);
END //
//DELIMITER ;

CALL agregar_telefono ('16555211', '3107897969');

-- Modificar teléfono cliente
DELIMITER //
CREATE PROCEDURE modificar_telefono(
IN cedula_cliente_proc VARCHAR(10),
IN numero_cliente_proc VARCHAR(15),
IN numero_nuevo VARCHAR(15)
)
BEGIN 
UPDATE telefono_cliente 
SET numero = numero_nuevo 
WHERE cedula_cliente = cedula_cliente_proc AND numero = numero_cliente_proc;
END //
//DELIMITER ; 

CALL modificar_telefono ('16555211', '3201258745','3001520000');

-- Consultar teléfono cliente 
DELIMITER //
CREATE PROCEDURE consultar_telefono(
IN cedula_cliente_proc VARCHAR(10)
)
BEGIN 
SELECT numero
FROM telefono_cliente
WHERE cedula_cliente = cedula_cliente_proc;
END //
//DELIMITER ; 

CALL consultar_telefono ('16555211');

-- Eliminar teléfono cliente
DELIMITER //
CREATE PROCEDURE eliminar_telefono(
IN cedula_cliente_proc VARCHAR(10),
IN numero_cliente_proc VARCHAR(15)
)
BEGIN 
DELETE FROM telefono_cliente 
WHERE cedula_cliente = cedula_cliente_proc AND numero = numero_cliente_proc;
END //
//DELIMITER ; 

CALL eliminar_telefono('16555211', '3107897969');

SELECT *
FROM telefono_cliente;

-- Creación de la tabla control de cambios librería 
CREATE TABLE control_de_cambios_libreria(
usuario VARCHAR(45), 
accion VARCHAR(45),
fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM control_de_cambios_libreria;

-- Creación trigger que permite agregar un nuevo teléfono al cliente 
DELIMITER //
CREATE TRIGGER agregar_telefono AFTER INSERT ON telefono_cliente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_libreria VALUES(user(), 'Se agregó', now());
	END;
// DELIMITER ;

-- Creación trigger que permite eliminar un teléfono al cliente 
DELIMITER //
CREATE TRIGGER eliminar_telefono AFTER DELETE ON telefono_cliente
	FOR EACH ROW
	BEGIN
		INSERT INTO control_de_cambios_libreria VALUES(user(), 'Se eliminó', now());
	END;
// DELIMITER ;



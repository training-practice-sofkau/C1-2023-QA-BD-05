USE libreriabuscalibre;

/*Se crea la tabla control de cambio libreria*/

CREATE TABLE control_cambios_libreria(
USUARIO VARCHAR(45),
ACCION VARCHAR (45),
FECHA DATE
);

/*Se crean los triggers*/

DELIMITER //
CREATE TRIGGER guardar_nombre_cliente
AFTER INSERT ON cliente FOR EACH ROW
BEGIN
  INSERT INTO control_cambios_libreria (usuario, accion, fecha)
  VALUES (NEW.nombre, 'NUEVO CLIENTE AGREGADO', NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER guardar_nombre_cliente
AFTER UPDATE ON cliente FOR EACH ROW
BEGIN
  INSERT INTO control_cambios_libreria (usuario, accion, fecha)
  VALUES (NEW.nombre, 'SE ACTUALIZA EL CLIENTE', NOW());
END //
DELIMITER ;
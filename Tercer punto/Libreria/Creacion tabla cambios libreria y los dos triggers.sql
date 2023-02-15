CREATE TABLE control_de_cambios_libreria (
  usuario VARCHAR(50),
  accion VARCHAR(50),
  fecha DATETIME
);
DELIMITER //
CREATE TRIGGER agregar_registro AFTER INSERT ON autor
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
  VALUES (USER(), "agregó un registro en la tabla autor", now());
END; //
DELIMITER ;
DELIMITER //
CREATE TRIGGER eliminar_registro AFTER DELETE ON autor
FOR EACH ROW
BEGIN
  INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
  VALUES (USER(), 'eliminó un registro en la tabla autor', NOW());
END; //
DELIMITER ;

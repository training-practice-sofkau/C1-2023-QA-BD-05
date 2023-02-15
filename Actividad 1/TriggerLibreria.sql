use libreriabuscalibre;

-- creamos la tabla para guardar los cambios
CREATE TABLE control_de_cambios_libreria (
  usuario VARCHAR(45),
  accion VARCHAR(20),
  fecha DATETIME
);

DELIMITER //
CREATE TRIGGER ins_control_libreria_insert
AFTER INSERT ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
VALUES (user(), 'insert', NOW());
END;
//

call agregar_autor('2020', '01-05-2020', 'colombia', 'choco');
SELECT * FROM control_de_cambios_libreria;


-- eliminar por trigger 
DELIMITER //
CREATE TRIGGER after_delete_autor
AFTER DELETE ON autor
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria (usuario, accion, fecha)
VALUES (user(), 'delete', NOW());
END;
//


drop trigger after_delete_autor;
SELECT * FROM control_de_cambios_libreria;
call eliminar_autor("5")

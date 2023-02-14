USE HOSPITAL;

/*Se crea la tabla control de cambio hospital*/

CREATE TABLE control_cambios_hospital (
  usuario VARCHAR(45),
  accion VARCHAR(45),
  fecha DATE
);

/* Se crea el primer trigger para guardar los cambios en la tabla paciente*/

DELIMITER //
CREATE TRIGGER insertar_paciente_control_cambios
AFTER INSERT ON paciente FOR EACH ROW
BEGIN
    INSERT INTO control_cambios_hospital (usuario, accion, fecha)
    VALUES (USER(), 'Se agregó un paciente', NOW());
END//
DELIMITER ;

/*Se crea el segundo trigger para actualizar los datos en la tabla paciente*/
DELIMITER //
CREATE TRIGGER actualizar_paciente_control_cambios
AFTER UPDATE ON paciente FOR EACH ROW
BEGIN
    INSERT INTO control_cambios_hospital (usuario, accion, fecha)
    VALUES (USER(), 'Se ha actualzado un paciente', NOW());
END //
DELIMITER ;

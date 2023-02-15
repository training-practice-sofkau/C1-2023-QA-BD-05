use hospital;

create table control_de_cambios_hospital(
	nombre varchar(50),
    accion varchar(30),
    fecha datetime default current_timestamp
);

-- triger insert
DELIMITER //
CREATE TRIGGER control_hospital_insert
AFTER INSERT ON medico
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
VALUES (user(), 'insert', NOW());
END;
//

call insertar_medico('M007', 'YEISON', 'OSORIO', 'CORAZONOLOGO');
call insertar_medico('M001', 'YEISON', 'BUITRAGO', 'TURISTAS');
-- eliminar trigger


DELIMITER //
CREATE TRIGGER control_hospital_delete
AFTER DELETE ON medico
FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario, accion, fecha)
VALUES (user(), 'delete', NOW());
END;
//

call eliminar_medico('M006');
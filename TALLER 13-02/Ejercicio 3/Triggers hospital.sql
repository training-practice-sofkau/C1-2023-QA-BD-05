#Elabore una nueva tabla llamada "control_de_cambios_hospital" la cual debe contener 
# 3 columnas (usuario, accion, fecha) y guarde usando
# 2 Triggers el nombre del usuario que agrego o elimino un registro en la tabla seleccionada en el punto anterior.
USE hospitalqa;
# CREACION DE LA TABLA control_de_cambios_hospital
CREATE TABLE control_de_cambios_hospital (
usuario VARCHAR(45),
accion VARCHAR (45),
fecha DATETIME DEFAULT current_timestamp
);


#CREACION DE TRIGGER PARA REGISTRO DE ACCION AL AGREGAR PACIENTES
DELIMITER //
CREATE TRIGGER registro_accion_agregar
AFTER INSERT 
ON paciente FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario,accion,fecha) 
VALUES ('Santiago Peñalosa','Agregar paciente',now());
END
//
#Se usa el proceimiento agregar paciente para cargar el registro
CALL agregarPaciente('40','Andrea Ramirez','Fusagasuga','4');

#se lista la tablacontrol_de_cambios_hospital
SELECT * FROM control_de_cambios_hospital;

#CREACION DE TRIGGER PARA REGISTRO DE ACCION AL ELIMINAR PACIENTES
DELIMITER //
CREATE TRIGGER registro_accion_borrar
AFTER DELETE 
ON paciente FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_hospital (usuario,accion,fecha) 
VALUES ('Santiago Peñalosa','Borrar paciente',now());
END
//
#Se llama el procedimiento creado para borrar pacientes
CALL borrar_paciente(40);

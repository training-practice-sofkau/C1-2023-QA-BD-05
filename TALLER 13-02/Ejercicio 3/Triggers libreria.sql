#Elabore una nueva tabla llamada "control_de_cambios_libreria" la cual debe contener 
# 3 columnas (usuario, accion, fecha) y guarde usando
# 2 Triggers el nombre del usuario que agrego o elimino un registro en la tabla seleccionada en el punto anterior.
USE libreriabuscalibre;
# CREACION DE LA TABLA control_de_cambios_libreria
CREATE TABLE control_de_cambios_libreria (
usuario VARCHAR(45),
accion VARCHAR (45),
fecha DATETIME DEFAULT current_timestamp
);


#CREACION DE TRIGGER PARA REGISTRO DE ACCION AL AGREGAR CLIENTES
DELIMITER //
CREATE TRIGGER registro_accion_agregar
AFTER INSERT 
ON cliente FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria (usuario,accion,fecha) 
VALUES ('Sergio Paez','Agregar cliente',now());
END
//
#Se usa el proceimiento agregar cliente para cargar el registro
CALL agregarCliente('40','Andres Ramirez');

#se lista la tablacontrol_de_cambios_libreria
SELECT * FROM control_de_cambios_libreria;

#CREACION DE TRIGGER PARA REGISTRO DE ACCION AL ELIMINAR CLIENTES
DELIMITER //
CREATE TRIGGER registro_accion_borrar
AFTER DELETE 
ON cliente FOR EACH ROW
BEGIN
INSERT INTO control_de_cambios_libreria  (usuario,accion,fecha) 
VALUES ('Antionio Pardo','Borrar paciente',now());
END
//
#Se llama el procedimiento creado para borrar cliente
CALL borrar_cliente(40);
USE hospital;

/* Se agrega tabla de procedimiento, para realizar
busquedas en la tabla de medicamento por su nombre*/
DELIMITER //
CREATE PROCEDURE BUCAR_POR_NOMBRE(IN NOMBRE_MEDICAMENTO VARCHAR(45))
BEGIN
SELECT*FROM MEDICAMENTO WHERE NOMBRE = NOMBRE_MEDICAMENTO;
END
//
DELIMITER ;

CALL BUSCAR_POR_NOMBRE("ACETAMINOFEN")

/*Se realiza la contruccion de un procedimiento, el cual
me permite eliminar algun paciente cuando lo desee*/

DELIMITER //
CREATE PROCEDURE ELIMINAR_PACIENTE (IN ID_PACIENTE VARCHAR(10))
BEGIN
  DELETE FROM PACIENTE WHERE ID = ID_PACIENTE;
END
//
DELIMITER ;

call ELIMINAR_PACIENTE ("CARLOS")

/*El siguiente procedimiento, es necesario para poder actualizar
los datos del paciente si es necesario*/

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_PACIENTE(
    IN ID VARCHAR(10),
    IN NOMBRE VARCHAR(45),
    IN APELLIDO VARCHAR(45),
    IN DIRECCION VARCHAR(45)
)
BEGIN
    UPDATE PACIENTE
    SET ID = ID,
        NOMBRE = NOMBRE,
        APELLIDO = APELLIDO,
        DIRECCION = DIRECCION
    WHERE ID = ID;
END //
DELIMITER ;

CALL ACTUALIZAR_PACIENTE("PTE1", "MAICOL", "TORRES", "CALLE 12")

/*Se crea un procedimiento para consultar los pacientes
y que procedimiento se le ha realizado*/

DELIMITER //
CREATE PROCEDURE CONSULTAR_PACIENTE()
BEGIN
    SELECT NOMBRE, ID_PROCEDIMIENTO FROM PACIENTE;
END //
DELIMITER ;

CALL CONSULTAR_PACIENTE()
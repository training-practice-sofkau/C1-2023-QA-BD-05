USE libreriabuscalibre;

/* Se agrega tabla de procedimiento, para realizar
busquedas en la tabla de cliente por la cedula*/
DELIMITER //
CREATE PROCEDURE BUCAR_POR_ID(IN CODIGO_CLIENTE VARCHAR(10))
BEGIN
SELECT*FROM CLIENTE WHERE CEDULA = CODIGO_CLIENTE;
END
//
DELIMITER ;

CALL BUSCAR_POR_ID("4356453")

/*Se realiza la contruccion de un procedimiento, el cual
me permite eliminar un libro cuando lo desee*/

DELIMITER //
CREATE PROCEDURE eliminar_libro (IN libro_id VARCHAR(10))
BEGIN
  DELETE FROM libro WHERE ISBN = libro_id;
END
//
DELIMITER ;

call eliminar_libro ("11")

/*El siguiente procedimiento, es necesario para poder actualizar
los datos del cliente si es necesario*/

DELIMITER //
CREATE PROCEDURE actualizar_cliente(
    IN cedula VARCHAR(10),
    IN nombre VARCHAR(45)
)
BEGIN
    UPDATE cliente
    SET cedula = cedula,
        nombre = nombre
    WHERE nombre = nombre;
END //
DELIMITER ;

CALL actualizar_libro("102039", "Virginia")

/*Se crea un procedimiento para consultar los libros
y a que editorial está relacionado*/

DELIMITER //
CREATE PROCEDURE consultar_libros()
BEGIN
    SELECT titulo, nombre_editorial FROM libro;
END //
DELIMITER ;

CALL consultar_libros()
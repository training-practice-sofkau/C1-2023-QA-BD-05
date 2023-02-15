DELIMITER //

CREATE PROCEDURE agregar_libro(
    IN isbn VARCHAR(10),
    IN titulo VARCHAR(45),
    IN num_paginas VARCHAR(45),
    IN nombre_editorial VARCHAR(50)
)
BEGIN
    INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
    VALUES (isbn, titulo, num_paginas, nombre_editorial);
END //

DELIMITER ;

CALL agregar_libro('978-8498', 'Cien años de soledad', '400', 'Editorial A');

DELIMITER //

CREATE PROCEDURE actualizar_libro(
    IN isbn VARCHAR(10),
    IN titulo VARCHAR(45),
    IN num_paginas VARCHAR(45),
    IN nombre_editorial VARCHAR(50)
)
BEGIN
    UPDATE libro
    SET titulo = titulo,
        numero_paginas = num_paginas,
        nombre_editorial = nombre_editorial
    WHERE ISBN = isbn;
END //

DELIMITER ;

CALL actualizar_libro('978-8498', 'Cien años de felicidad', '200', 'Editorial A');

DELIMITER //

CREATE PROCEDURE consultar_libro(IN isbn VARCHAR(10))
BEGIN
    SELECT * FROM libro WHERE ISBN = isbn;
END //

DELIMITER ;

CALL consultar_libro('978-8498');


DELIMITER //

CREATE PROCEDURE borrar_libro(IN isbn VARCHAR(10))
BEGIN
    DELETE FROM libro WHERE ISBN = isbn;
END //

DELIMITER ;

CALL borrar_libro('978-8498');

CREATE TABLE control_de_cambios_librería (
  usuario VARCHAR(50),
  accion VARCHAR(10),
  fecha TIMESTAMP
);

CREATE TRIGGER insertar_libro_trigger
  BEFORE INSERT ON libro
  FOR EACH ROW
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha)
  VALUES (USER(), 'agregar', NOW());
  
  CREATE TRIGGER eliminar_libro_trigger
  BEFORE DELETE ON libro
  FOR EACH ROW
  INSERT INTO control_de_cambios_librería (usuario, accion, fecha)
  VALUES (USER(), 'eliminar', NOW());
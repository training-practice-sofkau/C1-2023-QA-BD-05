SELECT * FROM libreriabuscalibre.libro;

-- Procedimiento Agregar
DELIMITER //
CREATE PROCEDURE insertar_libro (IN isbn VARCHAR(10), IN titulo VARCHAR(45), IN numero_paginas VARCHAR(45), IN nombre_editorial VARCHAR(50))
BEGIN
  INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
  VALUES (isbn, titulo, numero_paginas, nombre_editorial);
END //
DELIMITER ;

CALL insertar_libro("011-011", "Harry Potter I", "450", "Libro al viento");

-- Procedimiento actualizar
DELIMITER //
CREATE PROCEDURE Actualizar_Libro(IN p_ISBN VARCHAR(10), IN p_titulo VARCHAR(45),
 IN p_numero_paginas VARCHAR(45), IN p_nombre_editorial VARCHAR(50))
BEGIN
  UPDATE libro
  SET titulo = p_titulo, numero_paginas = p_numero_paginas, nombre_editorial = p_nombre_editorial
  WHERE ISBN = p_ISBN;
END //
DELIMITER ;

CALL Actualizar_Libro("011-011", "Harry Potter II", "394", "Libro al viento");

-- Procedimiento Consultar
DELIMITER //
CREATE PROCEDURE consultarLibroPorISBN (IN idLibro VARCHAR(10))
BEGIN
  SELECT * FROM libro WHERE ISBN = idLibro;
END //
DELIMITER ;

CALL consultarLibroPorISBN('000-000');

-- Procedimiento Borrar Libro

DELIMITER //
CREATE PROCEDURE borrarLibro (IN idLibro VARCHAR(10))
BEGIN
DELETE FROM libro WHERE ISBN = idLibro;
END //
DELIMITER ;

CALL borrarLibro ('011-011');


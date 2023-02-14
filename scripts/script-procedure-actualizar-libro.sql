USE libreriabuscalibre;

DELIMITER //
CREATE PROCEDURE actualizar_libro(in ISBN_libro VARCHAR(12),
	titulo_libro VARCHAR(45),
    numero_paginas_libro VARCHAR(45),
    editorial VARCHAR(45))
BEGIN
UPDATE libro
SET titulo = titulo_libro, numero_paginas = numero_paginas_libro, nombre_editorial = editorial
WHERE ISBN = ISBN_libro;
END //
DELIMITER ;

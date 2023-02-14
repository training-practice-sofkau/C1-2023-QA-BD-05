USE libreriabuscalibre;

DELIMITER //
create procedure agregar_libro(in ISBN_libro VARCHAR(12),
	titulo_libro VARCHAR(45),
    numero_paginas_libro VARCHAR(45),
    editorial VARCHAR(45))
BEGIN
INSERT INTO libro VALUES (ISBN_libro, titulo_libro, numero_paginas_libro, editorial);
END //
DELIMITER ;

CALL agregar_libro("14403325", "Los tres Mosqueteros", "300", "Planeta");

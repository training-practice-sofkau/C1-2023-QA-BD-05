use libreriabuscalibre;

-- PROCEDIMIENTO PARA AGREGAR AUTOR
DELIMITER //
CREATE PROCEDURE agregar_autor(IN id_autor VARCHAR(10), fecha_nacimiento VARCHAR(45), IN nacionalidad_autor VARCHAR(20), IN nombre_autor VARCHAR(45))
BEGIN
INSERT INTO autor (id, `fecha de nacimiento`, nombre, nacionalidad) VALUES (id_autor, fecha_nacimiento, nacionalidad_autor, nombre_autor);
END 
//
DELIMITER


call agregar_autor("10", "13/12/2023", "cucuta", "yeison osorio");


-- PROCEDIMIENTO PARA ELIMINAR AUTOR
DELIMITER //
CREATE PROCEDURE eliminar_autor (IN id_autor VARCHAR(10))
BEGIN
    DELETE FROM autor
    WHERE id = id_autor;
END//

call eliminar_autor("1010");




-- PROCEDIMIENTO PARA ACTUALIZAR UN AUTOR

DELIMITER //
CREATE PROCEDURE actualizar_autor (IN id_autor VARCHAR(10), IN fecha_nac VARCHAR(45), 
                                   IN nacionalidad VARCHAR(20), IN nombre VARCHAR(45))
BEGIN
    UPDATE autor
    SET `fecha de nacimiento` = fecha_nac, nacionalidad = nacionalidad, nombre = nombre
    WHERE id = id_autor;
END//

call actualizar_autor('5', '12/12/2021', 'BRASIL', 'YEISON OSORIO');


-- PROCEDIMIENTO PARA SELECCIONAR UN AUTOR
DELIMITER //
CREATE PROCEDURE seleccionar_autor (IN id_autor VARCHAR(10))
BEGIN
    SELECT id, `fecha de nacimiento`, nacionalidad, nombre
    FROM autor
    WHERE id = id_autor;
END//

call seleccionar_autor('5');

-- -----------------------------------------------------
-- Vistas Importantes
-- -----------------------------------------------------
USE LibreriaBuscaLibre;

-- -----------------------------------------------------
-- Stock de libros en la librería con toda su información
-- -----------------------------------------------------
CREATE VIEW stock AS
SELECT ISBN,
		titulo AS 'Título del libro',
		numero_paginas AS 'Número de páginas',
        nombre_editorial AS 'Editorial'
FROM libro;

-- -----------------------------------------------------
-- Teléfonos de las editoriales para tenerlos disponibles rápidamente
-- -----------------------------------------------------
CREATE VIEW contactoEditorial AS
SELECT nombre AS 'Editorial',
		Telefono AS 'Teléfono de la editorial'
FROM editorial;

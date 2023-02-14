-- -----------------------------------------------------
-- Realizando consultas solicitadas
-- -----------------------------------------------------
USE LibreriaBuscaLibre;

-- -----------------------------------------------------
-- Consulta Nombre y Fecha de Nacimiento de Autor
-- -----------------------------------------------------
SELECT nombre AS 'Nombre Autor', `fecha de nacimiento` AS 'Fecha de Nacimiento'
FROM autor;

-- -----------------------------------------------------
-- Consulta cantidad de Libros diferentes vendidos
-- -----------------------------------------------------
SELECT COUNT(DISTINCT ISBN_libro_cliente)
AS 'Cantidad de Libros diferentes Vendidos'
FROM libro_cliente;

-- -----------------------------------------------------
-- Consulta Nombre del cliente que compró Libro con su teléfono
-- -----------------------------------------------------
SELECT L.titulo AS 'Título del Libro', C.nombre AS 'Nombre Cliente', T.numero AS 'Teléfono Cliente'
FROM libro AS L
INNER JOIN libro_cliente AS LB
ON L.ISBN = LB.ISBN_libro_cliente
INNER JOIN cliente AS C
ON LB.id_cliente = C.cedula
INNER JOIN telefono_cliente AS T
ON C.cedula = T.cedula_cliente;

-- -----------------------------------------------------
-- Consulta Nombre de Libro con su(s) respectivo(s) Autor(es)
-- -----------------------------------------------------
SELECT L.titulo AS 'Título del Libro', A.nombre AS 'Autor'
FROM libro AS L
INNER JOIN libro_autor AS LA
ON L.ISBN = LA.ISBN_libro
INNER JOIN autor AS A
ON LA.id_autor = A.id
ORDER BY L.titulo;

-- -----------------------------------------------------
-- Consulta Editoriales que han vendido algún Libro
-- -----------------------------------------------------
SELECT DISTINCT nombre_editorial AS 'Editorial que ha vendido' 
FROM libro AS L, libro_cliente AS LC
WHERE L.ISBN = LC.ISBN_libro_cliente;

use libreriabuscalibre;

# REGISTROS AGREGADOS A LAS TABLAS DE LAS LIBRERÍAS

-- Tabla Autor

INSERT INTO autor (id, `fecha de nacimiento`, nacionalidad, nombre)
VALUES
("A001", "01/01/1980", "Argentina", "Santiago Ramos"),
("A002", "02/02/1985", "Chile", "Luz Cardona"),
("A003", "03/03/1990", "Colombia", "Carlos Gómez"),
("A004", "04/04/1995", "Perú", "Andrés Rodriguez"),
("A005", "05/05/2000", "México", "Juan Ortiz");

-- Tabla editorial

INSERT INTO editorial (nombre, ciudad, complemento, Telefono)
VALUES
("Editorial 1", "Ciudad 1", "Fundada en 1950", "3189752"),
("Editorial 2", "Ciudad 2", "Fundada en 1955", "3189753"),
("Editorial 3", "Ciudad 3", "Fundada en 1966", "3189754"),
("Editorial 4", "Ciudad 4", "Fundada en 1977", "3189755");

-- Tabla libro

INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES
("L001", "El Quijote", "500", "Editorial 1"),
("L002", "Don Juan Tenorio", "450", "Editorial 2"),
("L003", "La Celestina", "400", "Editorial 3"),
("L004", "La Isla del Tesoro", "500", "Editorial 4"),
("L005", "El Gran Gatsby", "450", "Editorial 1"),
("L006", "Matar un Ruiseñor", "400", "Editorial 2"),
("L007", "1984", "450", "Editorial 3"),
("L008", "La División del Agua", "450", "Editorial 4"),
("L009", "La Historia Interminable", "400", "Editorial 1"),
("L0010", "El Principito", "350", "Editorial 2"),
("L0011", "Cien Años de Soledad", "450", "Editorial 3"),
("L0012", "El Jardín de los Finzi-Contini", "400", "Editorial 4"),
("L0013", "La Guerra y la Paz", "450", "Editorial 1"),
("L0014", "La Montaña Mágica", "450", "Editorial 2"),
("L0015", "El Amor en los Tiempos del Cólera", "450", "Editorial 3"),
("L0016", "La Metamorfosis", "450", "Editorial 4"),
("L0017", "El Proceso", "450", "Editorial 1"),
("L0018", "La Strada", "450", "Editorial 2"),
("L0019", "La Naranja Mecánica", "450", "Editorial 3"),
("L0020", "La Noche de los Tiempos", "450", "Editorial 4");

-- Tabla cliente

INSERT INTO cliente (cedula, nombre)
VALUES
("C001", "Luis García"),
("C002", "Ana Martínez"),
("C003", "Juan Pérez"),
("C004", "James Muñoz"),
("C005", "Arley Borja"),
("C006", "Julieta Muñoz"),
("C007", "Ana Velazquez");

-- Tabla libro_autor

INSERT INTO libro_autor (id_autor, ISBN_libro)
VALUES
("A001", "L001"),
("A002", "L002"),
("A003", "L003"),
("A004", "L004"),
("A005", "L005"),
("A001", "L006"),
("A002", "L007"),
("A003", "L008"),
("A004", "L009"),
("A005", "L0010");

-- Tabla libro_cliente

INSERT INTO libro_cliente (id_cliente, ISBN_libro_cliente)
VALUES
("C001", "L001"),
("C002", "L002"),
("C003", "L003"),
("C004", "L004"),
("C005", "L005"),
("C001", "L006"),
("C002", "L007"),
("C003", "L008"),
("C004", "L009"),
("C005", "L0010");

-- tabla telefono_cliente

INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES
("C001", "555-555-551"),
("C002", "555-555-552"),
("C003", "555-555-553"),
("C001", "555-555-554"),
("C005", "555-555-555"),
("C006", "555-555-556"),
("C007", "555-555-557"),
("C002", "555-555-558"),
("C001", "555-555-559"),
("C004", "555-555-550"),
("C002", "555-555-560");

# consultas pedidas 

-- Para conocer el nombre y la fecha de nacimiento de cada escritor:

SELECT nombre, `fecha de nacimiento` FROM autor;

-- Para conocer la cantidad de libros diferentes vendidos:

SELECT ISBN_libro_cliente, count(*) as num_vendidos
FROM libro_cliente
GROUP BY ISBN_libro_cliente;

-- Para conocer el nombre de los clientes acompañado de su número de teléfono:

SELECT cliente.nombre, telefono_cliente.numero
FROM cliente
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

-- Para conocer el nombre del libro acompañado por su autor o sus autores:

SELECT libro.titulo, autor.nombre
FROM libro
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

-- Para conocer el nombre de las editoriales que han logrado vender libros:

SELECT nombre_editorial, count(*) as libros_vendidos
FROM libro
JOIN libro_cliente ON libro.ISBN = libro_cliente.ISBN_libro_cliente
GROUP BY nombre_editorial;

-- VISTA 1

CREATE VIEW Libros as 
select titulo, numero_paginas, nombre_editorial
from libro;

-- VISTA 2

CREATE VIEW informacion_autores AS
SELECT nombre, `fecha de nacimiento`, nacionalidad
FROM autor;


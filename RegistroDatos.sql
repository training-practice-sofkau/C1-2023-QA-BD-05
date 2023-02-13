use libreriabuscalibre;

INSERT INTO autor (id, `fecha de nacimiento`, nacionalidad, nombre)
VALUES
("A001", "01/01/1980", "Argentina", "Santiago Ramos"),
("A002", "02/02/1985", "Chile", "Luz Cardona"),
("A003", "03/03/1990", "Colombia", "Carlos Gómez"),
("A004", "04/04/1995", "Perú", "Andrés Rodriguez"),
("A005", "05/05/2000", "México", "Juan Ortiz");

INSERT INTO editorial (nombre, ciudad, complemento, Telefono)
VALUES
("Editorial 1", "Ciudad 1", "Fundada en 1950", "3189752"),
("Editorial 2", "Ciudad 2", "Fundada en 1955", "3189753"),
("Editorial 3", "Ciudad 3", "Fundada en 1966", "3189754"),
("Editorial 4", "Ciudad 4", "Fundada en 1977", "3189755");

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

INSERT INTO cliente (cedula, nombre)
VALUES
("C001", "Luis García"),
("C002", "Ana Martínez"),
("C003", "Juan Pérez"),
("C004", "James Muñoz"),
("C005", "Arley Borja"),
("C006", "Julieta Muñoz"),
("C007", "Ana Velazquez");

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

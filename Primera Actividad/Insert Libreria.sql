USE libreriabuscalibre;

SELECT * FROM autor;

INSERT INTO autor (id, `fecha de nacimiento` , nacionalidad, nombre)
VALUES 
("A001", "01-01-1900", "Español", "Juan García"),
("A002", "02-02-1920", "Mexicano", "Pedro Martínez"),
("A003", "03-03-1930", "Argentino", "Marta Rodríguez"),
("A004", "04-04-1940", "Colombiano", "Jorge López"),
("A005", "05-05-1950", "Peruano", "Isabel Pérez");

SELECT * FROM editorial;

INSERT INTO editorial(nombre, ciudad, complemento, telefono)
VALUES 
("Editorial 1", "Bogotá", "Edificio A, Oficina B", "555-555-5555"),
("Editorial 2", "Buenos Aires", "Calle C, Número D", "555-555-5556"),
("Editorial 3", "Lima", "Esquina E, Edificio F", "555-555-5557"),
("Editorial 4", "Ciudad de México", "Calle G, Número H", "555-555-5558");


SELECT * FROM libro;

INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial)
VALUES 
("ISBN001", "Programación para principiantes", "300", "Editorial 1"),
("ISBN002", "Autoayuda para tiempos difíciles", "250", "Editorial 2"),
("ISBN003", "Literatura clásica: Don Quijote", "500", "Editorial 3"),
("ISBN004", "JavaScript: Avanzado", "400", "Editorial 1"),
("ISBN005", "El poder de la positividad", "200", "Editorial 2"),
("ISBN006", "Cien años de soledad", "450", "Editorial 3"),
("ISBN007", "Python: Desde cero", "350", "Editorial 1"),
("ISBN008", "Superar miedos y ansiedades", "300", "Editorial 2"),
("ISBN009", "El amor en los tiempos del cólera", "400", "Editorial 3"),
("ISBN010", "CSS Avanzado", "250", "Editorial 1"),
("ISBN011", "El arte de amar", "200", "Editorial 2"),
("ISBN012", "One Hundred Years of Solitude", "450", "Editorial 3"),
("ISBN013", "SQL Básico", "300", "Editorial 1"),
("ISBN014", "La vida después del éxito", "250", "Editorial 2"),
("ISBN015", "La mala hora", "400", "Editorial 3"),
("ISBN016", "Java: Intermedio", "350", "Editorial 1"),
("ISBN017", "Los secretos de la mente millonaria", "300", "Editorial 2"),
("ISBN018", "La casa de papel", "250", "Editorial 3"),
("ISBN019", "Node.js: Básico", "200", "Editorial 1"),
("ISBN020", "El arte de la meditación", "450", "Editorial 2");

SELECT * FROM cliente;

INSERT INTO cliente (cedula, nombre)
VALUES 
("123456789", "Juan Perez"),
("987654321", "María Rodriguez"),
("121212121", "Carlos Gonzalez"),
("343434343", "Sofía Martinez"),
("565656565", "Luis Lopez"),
("787878788", "Ana Garcia"),
("909090909", "Pedro Sánchez");

SELECT * FROM telefono_cliente;

INSERT INTO telefono_cliente (cedula_cliente, numero)
VALUES 
("123456789", "555-555-1001"),
("987654321", "555-555-1002"),
("121212121", "555-555-1003"),
("343434343", "555-555-1004"),
("565656565", "555-555-1005"),
("787878788", "555-555-1006"),
("909090909", "555-555-1007"),
("123456789", "555-555-1008"),
("987654321", "555-555-1009"),
("121212121", "555-555-1010"),
("343434343", "555-555-1011"),
("565656565", "555-555-1012"),
("787878788", "555-555-1013");

SELECT * FROM libro_autor;

INSERT INTO libro_autor (ISBN_libro, id_autor)
VALUES 
("ISBN001", "A001"),
("ISBN002", "A002"),
("ISBN003", "A003"),
("ISBN004", "A004"),
("ISBN005", "A005"),
("ISBN006", "A001"),
("ISBN007", "A002"),
("ISBN008", "A003"),
("ISBN009", "A004"),
("ISBN010", "A005");

SELECT * FROM libro_cliente;

INSERT INTO libro_cliente (ISBN_libro_cliente, id_cliente)
VALUES
("ISBN001", "123456789"),
("ISBN005", "987654321"),
("ISBN006", "121212121"),
("ISBN007", "343434343"),
("ISBN009", "565656565"),
("ISBN013", "787878788"),
("ISBN015", "909090909"),
("ISBN002", "123456789"),
("ISBN003", "987654321"),
("ISBN014", "121212121");
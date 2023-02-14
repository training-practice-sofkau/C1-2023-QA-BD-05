use libreriabuscalibre;

select * from autor;


INSERT INTO autor (id, `fecha de nacimiento`, nacionalidad, nombre) VALUES
(1, '1947-09-21', 'American', 'Stephen King'),
(2, '1965-07-31', 'Colombia', 'J.K. Rowling'),
(3, '1903-06-25', 'EEUU', 'George Orwell'),
(4, '1896-09-24', 'España', 'Gabriel Garcia Marquez'),
(5, '1926-04-28', 'American', 'Harper Lee');

INSERT INTO editoriales (nombre, ciudad, complemento, telefono) VALUES
('editorial1', 'Londres', 'complemento2', '020 7631'),
('editorial2', 'Colombia', 'complemento3', '212 366'),
('editorial3', 'Nueva York', 'complemento4', '212 632'),
('editorial4', 'londres', 'complemento1', '020 7494');

INSERT INTO libro (ISBN, titulo, numero_paginas, nombre_editorial) VALUES
('ISBN001', 'Cien años de soledad', 300, 'editorial1'),
('ISBN002', 'Matar a un ruiseñor', 250, 'editorial2'),
('ISBN003', '1984', 200, 'editorial3'),
('ISBN004', 'El gran Gatsby', 350, 'editorial4'),
('ISBN005', 'Crimen y castigo', 400, 'editorial1'),
('ISBN006', 'La metamorfosis', 300, 'editorial2'),
('ISBN007', 'El extranjero', 250, 'editorial3'),
('ISBN008', 'Momo', 200, 'editorial4'),
('ISBN009', 'La isla del tesoro', 300, 'editorial1'),
('ISBN010', 'La isla de los hombres solos', 250, 'editorial2'),
('ISBN011', 'La divina comedia', 400, 'editorial3'),
('ISBN012', 'Don Quijote de la Mancha', 250, 'editorial4'),
('ISBN013', 'El diario de Ana Frank', 300, 'editorial1'),
('ISBN014', 'El retrato de Dorian Gray', 200, 'editorial2'),
('ISBN015', 'Los tres mosqueteros', 250, 'editorial3'),
('ISBN016', 'El conde de Montecristo', 300, 'editorial4'),
('ISBN017', 'La odisea', 200, 'editorial1'),
('ISBN018', 'Frankenstein', 250, 'editorial2'),
('ISBN019', 'Dracula', 300, 'editorial3'),
('ISBN020', 'La Guerra y la Paz', 400, 'editorial4');



INSERT INTO cliente (cedula, nombre) VALUES
('001', 'Juan Pérez'),
('002', 'María González'),
('003', 'Pedro Rodríguez'),
('004', 'Ana García'),
('005', 'Luis Sánchez'),
('006', 'Isabel Martínez'),
('007', 'José López');

INSERT INTO libro_cliente (ISBN_libro_cliente, id_cliente) VALUES
('ISBN001', '001'),
('ISBN002', '002'),
('ISBN003', '003'),
('ISBN004', '004'),
('ISBN005', '005'),
('ISBN006', '006'),
('ISBN007', '007'),
('ISBN008', '001'),
('ISBN009', '002'),
('ISBN010', '003');


INSERT INTO libro_autor (ISBN_libro, id_autor) VALUES
('ISBN001', 1),
('ISBN002', 2),
('ISBN003', 3),
('ISBN004', 4),
('ISBN005', 1),
('ISBN006', 4),
('ISBN007', 1),
('ISBN008', 4),
('ISBN009', 2),
('ISBN010', 4),
('ISBN011', 3),
('ISBN012', 2),
('ISBN013', 1),
('ISBN014', 4),
('ISBN015', 1),
('ISBN016', 3),
('ISBN017', 2),
('ISBN018', 2),
('ISBN019', 1),
('ISBN020', 3);

INSERT INTO telefono_cliente (cedula_cliente, numero) VALUES
('001', '587514'),
('001', '558451'),
('002', '558451'),
('003', '584155'),
('004', '515151'),
('005', '148485'),
('006', '515415'),
('007', '561588'),
('007', '554515'),
('006', '522560'),
('005', '555461'),
('004', '571162');

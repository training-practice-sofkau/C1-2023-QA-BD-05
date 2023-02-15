INSERT INTO Editorial (nombre, ciudad, complemento, Telefono)
VALUES
('Editorial A', 'Ciudad A', 'Complemento A', '6012345678'),
('Editorial B', 'Ciudad B', 'Complemento B', '6098765432'),
('Editorial C', 'Ciudad C', 'Complemento C', '6011111111'),
('Editorial D', 'Ciudad D', 'Complemento D', '6022222222');

INSERT INTO `LibreriaBuscaLibre`.`libro` (`ISBN`, `titulo`, `numero_paginas`, `nombre_editorial`) 
VALUES 
('ISBN1', 'Título 1', '100', 'Editorial A'), 
('ISBN2', 'Título 2', '200', 'Editorial B'), 
('ISBN3', 'Título 3', '300', 'Editorial C'), 
('ISBN4', 'Título 4', '400', 'Editorial D'), 
('ISBN5', 'Título 5', '500', 'Editorial A'), 
('ISBN6', 'Título 6', '600', 'Editorial B'), 
('ISBN7', 'Título 7', '700', 'Editorial C'), 
('ISBN8', 'Título 8', '800', 'Editorial D'), 
('ISBN9', 'Título 9', '900', 'Editorial A'), 
('ISBN10', 'Título 10', '1000', 'Editorial B'), 
('ISBN11', 'Título 11', '1100', 'Editorial C'), 
('ISBN12', 'Título 12', '1200', 'Editorial D'), 
('ISBN13', 'Título 13', '1300', 'Editorial A'), 
('ISBN14', 'Título 14', '1400', 'Editorial B'), 
('ISBN15', 'Título 15', '1500', 'Editorial C'), 
('ISBN16', 'Título 16', '1600', 'Editorial D'), 
('ISBN17', 'Título 17', '1700', 'Editorial A'), 
('ISBN18', 'Título 18', '1800', 'Editorial B'), 
('ISBN19', 'Título 19', '1900', 'Editorial C'),
('ISBN20', 'Título 19', '1900', 'Editorial C');

INSERT INTO `cliente` (`cedula`, `nombre`)
VALUES
    ('1234567890', 'Juan Pérez'),
    ('2345678901', 'María Rodríguez'),
    ('3456789012', 'Pedro García'),
    ('4567890123', 'Ana López'),
    ('5678901234', 'José Martínez'),
    ('6789012345', 'Laura Díaz'),

INSERT INTO `libro_cliente` (`ISBN_libro_cliente`, `id_cliente`)
VALUES
    ('ISBN19', '1234567890'),
    ('ISBN2', '2345678901'),
    ('ISBN1', '3456789012'),
    ('ISBN13', '4567890123'),
    ('ISBN12', '5678901234'),
    ('ISBN4', '6789012345'),
    ('ISBN5', '7890123456'),
    ('ISBN18', '5678901234'),
    ('ISBN6', '4567890123'),
    ('ISBN14', '4567890123');

INSERT INTO `libro_autor` (`ISBN_libro`, `id_autor`)
VALUES
    ('ISBN19', 'A001'),
    ('ISBN2', 'A002'),
    ('ISBN1', 'A003'),
    ('ISBN13', 'A004'),
    ('ISBN14', 'A005'),
    ('ISBN6', 'A001'),
    ('ISBN12', 'A002'),
    ('ISBN18', 'A003'),
    ('ISBN4', 'A004'),
    ('ISBN5', 'A005');

INSERT INTO `telefono_cliente` (`cedula_cliente`, `numero`)
VALUES
    ('1234567890', '555-555-0001'),
    ('2345678901', '555-555-0002'),
    ('3456789012', '555-555-0003'),
    ('4567890123', '555-555-0004'),
    ('5678901234', '555-555-0005'),
    ('6789012345', '555-555-0006'),
    ('7890123456', '555-555-0007'),
    ('2345678901', '555-555-0008'),
    ('5678901234', '555-555-0009'),
    ('3456789012', '555-555-0010'),
    ('3456789012', '555-555-0011'),
    ('5678901234', '555-555-0012');

INSERT INTO `LibreriaBuscaLibre`.`Autor` (`id`, `fecha de nacimiento`, `nacionalidad`, `nombre`) 
VALUES ('A001', '1980-05-10', 'Mexicana', 'Juan Pérez'),
('A002', '1985-12-01', 'Argentina', 'María Rodríguez'),
('A003', '1990-07-22', 'Colombiana', 'Ana González'),
('A004', '1976-01-05', 'Española', 'Pedro Sánchez'),
('A005', '1965-03-16', 'Chilena', 'Sofía Fernández');


INSERT INTO `LibreriaBuscaLibre`.`autor` (`id`, `fecha de nacimiento`, `nacionalidad`, `nombre`) 
VALUES 
('gabrielgm', '06/03/1927', 'colombiano', 'Gabriel García Márquez'),
('hectoraf', '07/09/1958', 'colombiano', 'Héctor Abad Faciolince'),
('joserivera', '19/02/1888', 'colombiano', 'José Eustasio Rivera'),
('laurence', '25/02/1964', 'colombiano', 'Laurence González'),
('juanvas', '24/10/1978', 'colombiano', 'Juan Vasquez');

INSERT INTO `Editorial` (`nombre`, `ciudad`, `complemento`, `Telefono`)
VALUES 
("Norma", "Medellín", "Editorial de textos para estudiantes", "6012508690"),
("El Planeta", "Medellín", "Editorial de textos universitarios", "6012558690"),
("Santillana", "Bogotá", "Editorial de textos de ficción", "6012598690"),
("Aguilar", "Villavicencio", "Editorial de textos del área de medicina", "6012508869");

INSERT INTO `LibreriaBuscaLibre`.`libro` (`ISBN`, `titulo`, `numero_paginas`, `nombre_editorial`) 
VALUES 
('978-958-42-7452-8', 'Cien años de soledad', '522', 'Norma'),
('978-958-42-7453-5', 'El amor en los tiempos del cólera', '302', 'El Planeta'),
('978-958-42-7454-2', 'Crónica de una muerte anunciada', '150', 'Norma'),
('978-958-42-7455-9', 'El olvido que seremos', '204', 'Santillana'),
('978-958-42-7456-6', 'Del amor y otros demonios', '400', 'Aguilar'),
('978-958-42-7467-2', 'La vorágine', '155', 'Norma'),
('978-958-42-7468-9', 'Ojos de perro azul', '99', 'Aguilar'),
('978-958-42-7469-6', 'La increíble y triste historia de la cándida Eréndira y de su abuela desalmada', '80', 'El Planeta'),
('978-958-42-7470-2', 'El coronel no tiene quien le escriba', '204', 'Norma'),
('978-958-42-1598-8', 'La hojarasca', '150', 'Santillana'),
('978-958-42-0682-9', 'Memoria de mis putas tristes', '112', 'El Planeta'),
('978-958-42-1564-3', 'El amor en los tiempos del cólera', '368', 'Norma'),
('978-958-42-1889-7', 'Del amor y otros demonios', '160', 'Aguilar'),
('978-958-42-0299-9', 'Crónica de una muerte anunciada', '120', 'El Planeta'),
('978-958-42-2814-9', 'El ruido de las cosas al caer', '288', 'Santillana'),
('978-958-42-2218-9', 'Noticia de un secuestro', '352', 'Aguilar'),
('978-958-42-1071-1', 'El otoño del patriarca', '416', 'Norma'),
('978-958-42-3073-3', 'El general en su laberinto', '320', 'El Planeta'),
('978-958-42-2993-5', 'Vivir para contarla', '624', 'Santillana');

INSERT INTO `LibreriaBuscaLibre`.`cliente` (`cedula`, `nombre`)
VALUES
('3456789012', 'Carlos Calero'),
('5678901234', 'Jota Mario Valencia'),
('2345678901', 'Pilar Schmitt'),
('6789012345', 'Alejandro Riaño'),
('1234567890', 'Mabel Cartagena'),
('4567890123', 'Andrea Serna'),
('7890123456', 'Tatán Mejía');

INSERT INTO `LibreriaBuscaLibre`.`libro_cliente` (`ISBN_libro_cliente`, `id_cliente`)
VALUES 
('978-958-42-2814-9', '3456789012'),
('978-958-42-1889-7', '5678901234'),
('978-958-42-1071-1', '5678901234'),
('978-958-42-7452-8', '3456789012'),
('978-958-42-7467-2', '6789012345'),
('978-958-42-7452-8', '2345678901'),
('978-958-42-2814-9', '4567890123'),
('978-958-42-7467-2', '7890123456'),
('978-958-42-3073-3', '7890123456'),
('978-958-42-3073-3', '1234567890');

INSERT INTO LibreriaBuscaLibre.libro_autor (ISBN_libro, id_autor) 
VALUES
('978-958-42-2814-9','juanvas'),
('978-958-42-1889-7','gabrielgm'),
('978-958-42-1071-1','gabrielgm'),
('978-958-42-7452-8','gabrielgm'),
('978-958-42-7467-2','gabrielgm'),
('978-958-42-3073-3','gabrielgm'),
('978-958-42-7469-6','gabrielgm'),
('978-958-42-1564-3','gabrielgm'),
('978-958-42-2993-5','gabrielgm'),
('978-958-42-2218-9','gabrielgm');

INSERT INTO LibreriaBuscaLibre.telefono_cliente (cedula_cliente, numero) 
VALUES
('3456789012', '3115884652'),
('3456789012', '3125884652'),
('5678901234', '3135884652'),
('5678901234', '3145884652'),
('2345678901', '3155884652'),
('2345678901', '3215884652'),
('6789012345', '3225884652'),
('6789012345', '3217884652'),
('1234567890', '3116884652'),
('4567890123', '3118887652'),
('7890123456', '3114884652'),
('7890123456', '3113884652');






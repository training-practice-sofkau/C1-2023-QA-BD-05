
use libreriabuscalibre;
#TABLA AUTOR ---------------------------------------------------------
insert into autor (`id`,`fecha de nacimiento`,`nacionalidad`,`nombre`)
values
("A1","12/12/1960","Colombiano","Jairo Velez"),
("A2","18/10/1990","Italiano","Luca Piroto"),
("A3","04/04/1982","Ingles","Ben Sanders"),
("A4","15/08/1926","Estadounidense","Jack Smith"),
("A5","26/03/1945","Colombiano","Andrea Carreño");
#TABLA EDITORIAL------------------------------------------------------
insert into editorial (`nombre`, `ciudad`, `complemento`, `Telefono`) 
values 
('Alba', 'Barranquilla', 'Calle 24 #3 casa','3245812'),
('Planeta', 'Roma', 'Calle 38 no 3 Edificio Mirage ','3258741'),
('Alfaguara', 'Brooklyn', 'Calle 35 no 10-15 Apartamento 206','3321015'),
('Libretextos', 'Medellin', 'Avenida ferrocarril con 15','3698547');
#TABLA LIBRO ---------------------------------------------------------
insert into libro (`ISBN`, `titulo`, `numero_paginas`, `nombre_editorial`) 
values 
('L1', 'Clean code', '800','Alba'),
('L2', 'Design Patterns', '1200','Planeta'),
('L3', 'Algoritms Introduction', '320','Alfaguara'),
('L4', 'La Juria', '250','Alfaguara'),
('L5', 'Harry Potter', '95','Planeta'),
('L6', 'El señor de los anillos', '650','Alba'),
('L7', 'Como hacerse rico', '1200','Planeta'),
('L8', 'Aprende a programar en 5 minutos', '210','Alfaguara'),
('L9', 'Maria', '1200','Planeta'),
('L10', 'Algebra de Baldor', '840','Planeta'),
('L11', 'Divina comedia', '260','Alfaguara'),
('L12', 'Codigo da vinci', '580','Alba'),
('L13', 'Angeles y demonios', '640','Planeta'),
('L14', 'Free soul', '280','Planeta'),
('L15', 'Codigo enigma', '310','Alba'),
('L16', 'Logica', '745','Planeta'),
('L17', 'Hogwarts Trillogy', '850','Planeta'),
('L18', 'Las musas', '214','Alfaguara'),
('L19', 'Renacer', '360','Libretextos'),
('L20', 'El fenix', '417','Alba');
#TABLA LIBRO_AUTOR ---------------------------------------------------------
insert into libro_autor (`ISBN_libro`, `id_autor`) 
values 
('L1', 'A5'),
('L3', 'A2'),
('L5', 'A5'),
('L7', 'A1'),
('L9', 'A4'),
('L11', 'A5'),
('L12', 'A1'),
('L20', 'A3'),
('L18', 'A2'),
('L16', 'A3');
#TABLA CLIENTE ---------------------------------------------------------
insert into cliente (`cedula`, `nombre`) 
values 
('1088029685', 'Andres Correa'),
('1055788515', 'Vanesa Caicedo'),
('1025455544', 'Antonio Alvarez'),
('1058745523', 'Mariana Cardona'),
('1088478221', 'Andres Cardenas'),
('1036925542', 'Liliana Hernandez'),
('1023654110', 'Mario Ruiz');
#TABLA LIBRO_CLIENTE ---------------------------------------------------------
insert into libro_cliente (`ISBN_libro_cliente`, `id_cliente`) 
values 
('L2','1088029685'),
('L18','1058745523'),
('L15','1088478221'),
('L3','1088029685'),
('L4','1088478221'),
('L10','1088029685'),
('L19','1058745523'),
('L6','1036925542'),
('L7','1036925542'),
('L9','1088029685');
#TABLA TELEFONO_CLIENTE ---------------------------------------------------------
insert into telefono_cliente (`cedula_cliente`, `numero`)
values 
('1088029685', '3154875'),
('1088029685', '3256985'),
('1088478221', '3147547'),
('1088029685', '3026541'),
('1036925542', '3698585'),
('1088029685', '3302520'),
('1088029685', '3652520'),
('1088478221', '3144780'),
('1036925542', '3201089'),
('1058745523', '3598659'),
('1088029685', '3754857'),
('1088029685', '3256225');

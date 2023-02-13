/*
-- Query: select cliente.nombre, count(libro_cliente.ISBN_libro_cliente) as Libros_Vendidos_Por_LibreriaBuscaLibre
from libro_cliente inner join cliente
on libro_cliente.id_cliente = cliente.cedula
group by cliente.nombre
LIMIT 0, 1000

-- Date: 2023-02-13 17:51
*/
INSERT INTO `` (`nombre`,`Libros_Vendidos_Por_LibreriaBuscaLibre`) VALUES (Faber Mora,2);
INSERT INTO `` (`nombre`,`Libros_Vendidos_Por_LibreriaBuscaLibre`) VALUES (Fabian Torres,2);
INSERT INTO `` (`nombre`,`Libros_Vendidos_Por_LibreriaBuscaLibre`) VALUES (Francy Jimenez,2);
INSERT INTO `` (`nombre`,`Libros_Vendidos_Por_LibreriaBuscaLibre`) VALUES (Gonzalo Mora,2);
INSERT INTO `` (`nombre`,`Libros_Vendidos_Por_LibreriaBuscaLibre`) VALUES (Feiber Torres,2);


CREATE VIEW libro_autores AS 
SELECT libro.titulo, autor.nombre 
FROM libro 
JOIN libro_autor ON libro.ISBN = libro_autor.ISBN_libro
JOIN autor ON libro_autor.id_autor = autor.id;

CREATE VIEW cliente_telefonos AS 
SELECT cliente.nombre, telefono_cliente.numero 
FROM cliente 
JOIN telefono_cliente ON cliente.cedula = telefono_cliente.cedula_cliente;

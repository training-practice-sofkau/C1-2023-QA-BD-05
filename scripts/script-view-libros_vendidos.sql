CREATE VIEW cantidad_libros_vendidos AS
SELECT COUNT(DISTINCT ISBN_libro_cliente) AS cantidad_libros_vendidos 
FROM libreriabuscalibre.libro_cliente;
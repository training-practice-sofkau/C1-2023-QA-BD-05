SELECT DISTINCT nombre_editorial
FROM libreriabuscalibre.libro
LEFT JOIN libreriabuscalibre.libro_cliente
ON libro.ISBN = libro_cliente.ISBN_libro_cliente
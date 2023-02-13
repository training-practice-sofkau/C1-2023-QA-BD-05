SELECT libro.titulo, autor.nombre
FROM ((libreriabuscalibre.libro 
INNER JOIN libreriabuscalibre.libro_autor ON libro.ISBN = libro_autor.ISBN_libro)
INNER JOIN libreriabuscalibre.autor ON id_autor = autor.id);
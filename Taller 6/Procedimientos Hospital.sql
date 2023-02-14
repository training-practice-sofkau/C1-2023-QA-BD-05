
-- Procedimiento insertar medico
DELIMITER //
CREATE PROCEDURE insertarMedico (IN idMedico VARCHAR(10), IN nombreMedico VARCHAR(45),
 IN apellidoMedico VARCHAR(45), IN especialidad VARCHAR(45))
BEGIN
  INSERT INTO Medico (idMedico, Nombre_Medico, apellido_medico, especialidad)
  VALUES (idMedico, nombreMedico, apellidoMedico, especialidad);
END //
DELIMITER ;

CALL insertarMedico("001", "Juan", "Pérez", "Pediatra");

-- Procedimiento actualizar medico
DELIMITER //
CREATE PROCEDURE actualizarMedico (IN p_idMedico VARCHAR(10), IN p_Nombre_Medico VARCHAR(45),
 IN p_apellido_medico VARCHAR(45), IN p_especialidad VARCHAR(45))
BEGIN
  UPDATE Medico
  SET Nombre_Medico = p_Nombre_Medico, apellido_medico = p_apellido_medico, especialidad = p_especialidad
  WHERE idMedico = p_idMedico;
END //
DELIMITER ;

CALL actualizarMedico("001", "Juan", "Chavez", "Bacteriologo");

-- Proceimiento consultar medico

DELIMITER //
CREATE PROCEDURE consultarMedicoPorID (IN buscar_idMedico VARCHAR(10))
BEGIN
SELECT * FROM Medico WHERE idMedico = buscar_idMedico;
END //
DELIMITER ;

CALL consultarMedicoPorID("001");

-- Procedimiento eliminar medico

DELIMITER //
CREATE PROCEDURE eliminarMedico (IN del_idMedico VARCHAR(10))
BEGIN
  DELETE FROM Medico WHERE idMedico = del_idMedico;
END //
DELIMITER ;

CALL eliminarMedico("001");




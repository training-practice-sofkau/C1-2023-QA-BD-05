-- -----------------------------------------------------
-- Vistas Importantes
-- -----------------------------------------------------
USE hospital_GNECJ;

-- -----------------------------------------------------
-- Stock de Medicamentos en el Hospital con su dosis recomendada
-- -----------------------------------------------------
CREATE VIEW stock AS
SELECT nombre_medicamento AS 'Medicamento',
       dosis AS 'Dosis recomendada'
FROM medicamento;

-- -----------------------------------------------------
-- Médicos que operan en el Hospital
-- -----------------------------------------------------
CREATE VIEW médicos AS
SELECT nombre_médico AS 'Médico',
		especialidad AS 'Especialidad'
FROM médico;

-- -----------------------------------------------------
-- Enfermeros que asisten en el Hospital
-- -----------------------------------------------------
CREATE VIEW enfermeros AS
SELECT E.nombre_enfermero AS 'Enfermero',
		M.nombre_médico AS 'Asiste al Médico'
FROM enfermero AS E
INNER JOIN médico AS M
ON E.id_médicoE = M.id_médico;

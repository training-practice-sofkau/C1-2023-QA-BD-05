-- -----------------------------------------------------
-- Realizando consultas solicitadas
-- -----------------------------------------------------
USE hospital_GNECJ;

-- -----------------------------------------------------
-- Consulta Medicamentos que toma cada Paciente y su dosis
-- -----------------------------------------------------
SELECT P.nombre_paciente AS 'Paciente', M.nombre_medicamento AS 'Medicamento', M.dosis AS 'Dosis'
FROM medicamento AS M
INNER JOIN tomar AS T
ON M.id_medicamento = T.id_medicamentoTo
INNER JOIN paciente AS P
ON T.id_pacienteTo = P.id_paciente;

-- -----------------------------------------------------
-- Consulta Enfermeros en los Procedimientos realizados
-- -----------------------------------------------------
SELECT E.nombre_enfermero AS 'Enfermero', P.tipo AS 'Tipo de procedimiento', PA.nombre_paciente AS 'Paciente'
FROM paciente AS PA
INNER JOIN procedimiento AS P
ON PA.id_procedimientoP = P.id_procedimiento
INNER JOIN realizar AS R
ON P.id_procedimiento = R.id_procedimientoR
INNER JOIN médico AS M
ON R.id_médicoR = M.id_médico
INNER JOIN enfermero AS E
ON M.id_médico = E.id_médicoE;

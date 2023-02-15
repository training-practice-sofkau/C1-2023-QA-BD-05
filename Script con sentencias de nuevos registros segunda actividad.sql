SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

INSERT INTO `Hospital`.`tb_procedimiento`(`id_procedimiento`, `tipo_procedimiento`) 
VALUES 
('P006', 'Cirugía cadera'),
('P007', 'Radiografía tórax'),
('P008', 'Colonoscopía'),
('P009', 'Trat de conducto'),
('P010', 'Extracción muela');

INSERT INTO `Hospital`.`dll_medico_procedimiento` (`id_medico_procedimiento`,`id_medico`, `id_procedimiento`) 
VALUES 
('MP001','M004', 'P006'),
('MP002','M005', 'P007'),
('MP003','M002', 'P008'),
('MP004','M001', 'P009'),
('MP005','M003', 'P010');

INSERT INTO `Hospital`.`tb_factura` (`id_factura`, `fecha`,`valor_total`,`id_paciente`) 
VALUES 
('F006', '2022-01-20','4000','P003'),
('F007', '2022-02-10','3500', 'P005'),
('F008', '2022-02-12','2900', 'P002'),
('F009', '2022-02-13','8100', 'P004'),
('F010', '2022-02-14','3200', 'P001');

INSERT INTO `Hospital`.`telefono_paciente` (`id_paciente`, `telefono`) 
VALUES 
('P001', '555-1234'),
('P002', '555-4321'),
('P003', '555-6789'),
('P004', '555-9876'),
('P005', '555-1111');

INSERT INTO `Hospital`.`tb_medico` (`id_medico`, `nombre_medico`,`apellido_medico`,`especialidad`) 
VALUES 
('M006', 'Laura','Gómez', 'Cardiología'),
('M007', 'Jorge','Salazar', 'Oftalmología'),
('M008', 'Lucas','Torres', 'Pediatría'),
('M009', 'María','Fernández', 'Ginecología'),
('M010', 'Sofía','Ortiz', 'Neurología');

INSERT INTO `Hospital`.`tb_enfermero` (`id_enfermero`,`nombre_enfermero`,`apellido_enfermero`,`id_medico`) 
VALUES 
('E006', 'José','Pérez', 'M006'),
('E007', 'Ana','Castro', 'M007'),
('E008', 'Elena','Ramírez', 'M008'),
('E009', 'Pedro','Gómez', 'M009'),
('E010', 'Sara','González', 'M010');

INSERT INTO `Hospital`.`telefono_paciente2` (`id_paciente2`, `telefono2`) 
VALUES 
('P006', '555-2468'),
('P007', '555-8642'),
('P008', '555-3972'),
('P009', '555-7654'),
('P010', '555-1029');

INSERT INTO `Hospital`.`dll_paciente_medicamento` (`id_paciente_medicamento`,`id_paciente`, `id_medicamento`)
VALUES 
('987','P005', 'ME002'),
('932','P008', 'ME003'),
('931','P003', 'ME001'),
('901','P009', 'ME002'),
('902','P001', 'ME004');
       
INSERT INTO `Hospital`.`tb_medicamento` (`id_medicamento`, `nombre_medicamento`, `dosis`)
VALUES 
('ME004', 'Amoxicilina', '3 al día'),
('ME003', 'Ibuprofeno', '1 al día'),
('ME002', 'Paracetamol', '2 al día'),
('ME005', 'Lorazepam', '1 al día'),
('ME001', 'Aspirina', '2 al día');
       
INSERT INTO `Hospital`.`telefono_paciente3` (`id_paciente`, `telefono`)
VALUES 
('P003', '555-111-3456'),
('P006', '555-222-7890'),
('P010', '555-333-4567'),
('P008', '555-444-1234'),
('P002', '555-555-5678');

INSERT INTO `Hospital`.`tb_paciente` (`id_paciente`, `nombre_paciente`, `apellido_paciente`, `direccion`, `id_procedimiento`)
VALUES
('P003', 'Jose', 'Mues', 'Dirección AV1', 'P006'),
('P002', 'Roberto', 'Casas', 'Dirección AV2', 'P007'),
('P008', 'Felipe', 'Vargas', 'Dirección AV3', 'P008'),
('P006', 'Natalia', 'Robledo', 'Dirección AV4', 'P009'),
('P010', 'Jose', 'Pinto', 'Dirección AV5', 'P010');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
       

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
('E006', 'José','Pérez', 'M004'),
('E007', 'Ana','Castro', 'M005'),
('E008', 'Elena','Ramírez', 'M002'),
('E009', 'Pedro','Gómez', 'M001'),
('E010', 'Sara','González', 'M003');

INSERT INTO `Hospital`.`telefono_paciente2` (`id_paciente2`, `telefono2`) 
VALUES 
('P006', '555-2468'),
('P007', '555-8642'),
('P008', '555-3972'),
('P009', '555-7654'),
('P010', '555-1029');

INSERT INTO `Hospital`.`dll_paciente_medicamento` (`id_paciente_medicamento`,`id_paciente`, `id_medicamento`)
VALUES 
('987','P005', 'M002'),
('932','P008', 'M003'),
('931','P003', 'M001'),
('901','P009', 'M002'),
('902','P001', 'M004');
       
INSERT INTO `Hospital`.`tb_medicamento` (`id_medicamento`, `nombre_medicamento`, `dosis`)
VALUES 
('M004', 'Amoxicilina', 12.50),
('M003', 'Ibuprofeno', 8.20),
('M002', 'Paracetamol', 6.50),
('M005', 'Lorazepam', 20.00),
('M001', 'Aspirina', 5.00);
       
INSERT INTO `Hospital`.`telefono_paciente3` (`id_paciente`, `telefono`)
VALUES 
('P003', '555-111-3456'),
('P006', '555-222-7890'),
('P010', '555-333-4567'),
('P008', '555-444-1234'),
('P002', '555-555-5678');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
       

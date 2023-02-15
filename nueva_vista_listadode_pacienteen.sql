CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `listado_enfermeros` AS
    SELECT 
        `tb_enfermero`.`id_enfermero` AS `id_enfermero`,
        `tb_enfermero`.`nombre_enfermero` AS `nombre_enfermero`,
        `tb_enfermero`.`apellido_enfermero` AS `apellido_enfermero`,
        `tb_enfermero`.`id_medico_Enfermero` AS `id_medico_Enfermero`
    FROM
        `tb_enfermero`
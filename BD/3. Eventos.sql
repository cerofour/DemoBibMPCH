USE bmpch;

-- Habilitar programador de eventos
SET GLOBAL event_scheduler = ON;

DELIMITER $$

-- Creación de evento que modifica el estado del carnet
CREATE EVENT actualizarEstadoCarnet
    ON SCHEDULE EVERY 1 DAY
    DO
BEGIN

    DECLARE id_tipo_estado_vencido BIGINT;
    DECLARE cantidad_carnets_por_vencer BIGINT;

    SET cantidad_carnets_por_vencer = (
        SELECT COUNT(fecha_vencimiento) FROM carnets
        WHERE fecha_vencimiento = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    );

    IF cantidad_carnets_por_vencer >= 1 THEN

        SET id_tipo_estado_vencido = (
            SELECT TP_STD.id_tipo_estado
            FROM tipos_estados AS TP_STD
            WHERE TP_STD.tipo_estado LIKE '%VENCIDO%'
        );

        IF id_tipo_estado_vencido IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró un tipo de estado llamado: VENCIDO';
        END IF;

        UPDATE carnets INNER JOIN tipos_estados ON tipo_estado_id = id_tipo_estado
        SET tipo_estado_id = id_tipo_estado_vencido
        WHERE activo = 1 AND fecha_vencimiento = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY);

    END IF;
END $$


DELIMITER ;
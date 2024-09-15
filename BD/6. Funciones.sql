USE BMPCH;

DELIMITER $$

CREATE FUNCTION prestamos_realizados_mes_yr (
	mes TINYINT,
    yr SMALLINT,
) RETURNS BIGINT
DETERMINISTIC
BEGIN
	DECLARE total_prestamos BIGINT;
	
    SELECT COUNT(id_prestamo) INTO total_prestamos
    FROM prestamos 
    WHERE MONTH(fecha_inicio) = mes AND YEAR(fecha_inicio) = yr;
    
    RETURN total_prestamos;

END

DELIMITER ;

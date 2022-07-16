CREATE FUNCTION duration_in_hours(duracion INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE duration_hours FLOAT;
	SET duration_hours = duracion / 60;
	RETURN dutarion_hours;
END

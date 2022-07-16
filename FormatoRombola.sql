/* ENTREGA DE FUNCIONES */

/* FUNCION 1: Trae las peliculas del pais que se ingresa */

CREATE FUNCTION get_films_by_country(country_name VARCHAR(200)) 
RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
	DECLARE film_name VARCHAR(1000);
    DECLARE id_del_pais INT;
	SELECT id INTO id_del_pais FROM paises
    WHERE nombre = country_name;
    SELECT nombre INTO film_name
    FROM peliculas
    WHERE id_pais = id_del_pais;
	RETURN film_name;
END

/* FUNCION 2: Convierte la duracion de minutos a horas*/

CREATE FUNCTION duration_in_hours(duracion INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE duration_hours FLOAT;
	SET duration_hours = duracion / 60;
	RETURN duration_hours;
END

/* Se pueden probar usando: */

SELECT duracion AS duracion_en_minutos, duration_in_hours(duracion) AS duracion_en_horas FROM peliculas;

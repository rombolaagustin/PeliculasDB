/* VISTAS EN LA BASE DE DATOS */

USE peliculasDB;

/* VISTA NRO 1 */
CREATE OR REPLACE VIEW paises_de_habla_hispana AS
	SELECT nombre,continente,habitantes,moneda
    FROM paises
    WHERE idioma = 'spanish';

/* VISTA NRO 2*/
CREATE OR REPLACE VIEW peliculas_argentinas AS
	SELECT * 
    FROM peliculas
    WHERE id_pais = 1; /* 1 ES ARGENTINA */
    
/* VISTA NRO 3 */
CREATE OR REPLACE VIEW top_ten_peliculas AS
	SELECT *
    FROM peliculas
    WHERE imdb_rating > 8
    ORDER BY imdb_rating ASC
    LIMIT 10;
    
/* VISTA NRO 4 */
CREATE OR REPLACE VIEW peliculas_con_actores_argentinos AS
	SELECT peliculas.id AS id_pelicula, 
    peliculas.nombre as nombre_pelicula, 
    imdb_rating, 
    duracion
    FROM peliculas
    INNER JOIN actores actor
    ON peliculas.id_actor_1 = actor.id
    AND actor.id_pais = 1
    ORDER BY imdb_rating ASC;

/* VISTA NRO 5 */
CREATE OR REPLACE VIEW peliculas_drama AS
	SELECT peliculas.id as id_pelicula,
    peliculas.nombre as nombre_pelicula,
    duracion,
    genero.nombre as genero,
    year
    FROM peliculas
    INNER JOIN generos genero
    ON peliculas.id_genero = genero.id
    AND genero.id = 1
    ORDER BY imdb_rating ASC;
    

/* CREO LA DB */
CREATE DATABASE IF NOT EXISTS peliculasDB;

USE peliculasDB;

/* 1) Creo la tabla de paises */
CREATE TABLE IF NOT EXISTS paises (
	id INT AUTO_INCREMENT,			    	/* id del pais */
	nombre VARCHAR(200) NOT NULL,			/* nombre del pais */
	habitantes BIGINT,						/* habitantes del pais*/
	pbi_per_capita INT, 					/* pbi per capita del pais en USD */
	continente VARCHAR(200) NOT NULL,		/* continente del pais */
	idioma VARCHAR(200) NOT NULL,			/* idioma del pais */
	moneda VARCHAR(200),					/* moneda de curso legal en el pais */
    PRIMARY KEY (id)
);

/* 2) Creo la tabla de directores*/
CREATE TABLE IF NOT EXISTS directores(
	id INT AUTO_INCREMENT,              	/* id del director */
	nombre VARCHAR(200) NOT NULL,			/* nombre del director */
	apellido VARCHAR(200) NOT NULL,			/* apellido del director */
	fecha_nacimiento DATE NOT NULL,			/* fecha de nacimiento del director */
	id_pais INT NOT NULL ,					/* pais del director */
	ciudad_origen VARCHAR(200) NOT NULL, 	/* ciudad donde nacio el director */
	PRIMARY KEY (id),
	FOREIGN KEY (id_pais) REFERENCES paises(id)
); 

/* 3 ) Creo la tabla de actores */
CREATE TABLE IF NOT EXISTS actores(
	id INT AUTO_INCREMENT,              	/* id del actor */
	nombre VARCHAR(200) NOT NULL,			/* nombre del actor */
	apellido VARCHAR(200) NOT NULL,			/* apellido del actor */
	fecha_nacimiento DATE NOT NULL,			/* fecha de nacimiento del actor */
	id_pais INT NOT NULL ,					/* pais del director */
	ciudad_origen VARCHAR(200) NOT NULL, 	/* ciudad donde nacio el actor */
	PRIMARY KEY (id),
	FOREIGN KEY (id_pais) REFERENCES paises(id)
);

/* 4) Creo la tabla de generos */
CREATE TABLE IF NOT EXISTS generos(
	id INT AUTO_INCREMENT,					/* id del genero */
	nombre VARCHAR(200) NOT NULL,			/* nombre del genero*/
	detalle VARCHAR(5000),					/* detalles del genero*/
	PRIMARY KEY (id)
);

/* 5) Creo la tabla de productoras */
CREATE TABLE IF NOT EXISTS productoras(
	id INT AUTO_INCREMENT,					/* id de la productora */
	id_pais INT NOT NULL ,					/* pais del director */
	nombre VARCHAR(200) NOT NULL,			/* nombre de la productora */
	year_fundacion INT,						/* year de fundacion */
	ciudad_headquarters VARCHAR(200),		/* ciudad donde se encuentra*/
	PRIMARY KEY (id),
	FOREIGN KEY (id_pais) REFERENCES paises(id)
);

/* 6) Creo la tabla de peliculas (La principal) */
CREATE TABLE IF NOT EXISTS peliculas(
	id INT AUTO_INCREMENT,					/* id de la pelicula */
	id_pais INT NOT NULL ,					/* pais de la pelicula */
	nombre VARCHAR(1000) NOT NULL,			/* nombre de la pelicula */
	idioma_principal VARCHAR(200) NOT NULL, /* idioma de la pelicula */
	year INT,								/* year de la pelicula */
	duracion INT NOT NULL,	    			/* duracion de la pelicula medida en minutos*/
	id_director INT NOT NULL,				/* id del director */
	id_actor_1 INT NOT NULL, 				/* Se puede agregar 10 actores */
	id_actor_2 INT,
	id_actor_3 INT,
	id_actor_4 INT,
	id_actor_5 INT,
	id_actor_6 INT,
	id_actor_7 INT,
	id_actor_8 INT,
	id_actor_9 INT,
	id_actor_10 INT,
	id_genero INT NOT NULL,					/* genero de la pelicula, se relaciona con la tabla generos */
	descripcion	LONGTEXT,					/* descripcion de la peli */
	imdb_rating	FLOAT,						/* rating de la pelicula en imdb */
	cant_espectadores BIGINT,				/* cantidad de espectadores */
	presupuesto_usd BIGINT,					/* presupuesto medido en USD*/
	fecha_estreno DATE,						/* fecha del estreno */
	id_productora INT,						/* id de la productora de la pelicula*/
	PRIMARY KEY (id),
	FOREIGN KEY (id_pais) REFERENCES paises(id),
	FOREIGN KEY (id_director) REFERENCES directores(id),
	FOREIGN KEY (id_actor_1) REFERENCES actores(id),
	FOREIGN KEY (id_actor_2) REFERENCES actores(id),
	FOREIGN KEY (id_actor_3) REFERENCES actores(id),
	FOREIGN KEY (id_actor_4) REFERENCES actores(id),
	FOREIGN KEY (id_actor_5) REFERENCES actores(id),
	FOREIGN KEY (id_actor_6) REFERENCES actores(id),
	FOREIGN KEY (id_actor_7) REFERENCES actores(id),
	FOREIGN KEY (id_actor_8) REFERENCES actores(id),
	FOREIGN KEY (id_actor_9) REFERENCES actores(id),
	FOREIGN KEY (id_actor_10) REFERENCES actores(id),
	FOREIGN KEY (id_genero) REFERENCES generos(id),
	FOREIGN KEY (id_productora) REFERENCES productoras(id)
);

/* INSERT IN PAISES */

INSERT INTO paises (`id`,`nombre`,`habitantes`,`pbi_per_capita`,`continente`,`idioma`,`moneda`) VALUES (1,'argentina',47000000,9000,'america','spanish','peso');
INSERT INTO paises (`id`,`nombre`,`habitantes`,`pbi_per_capita`,`continente`,`idioma`,`moneda`) VALUES (2,'brazil',214000000,7000,'america','portuguese','real');
INSERT INTO paises (`id`,`nombre`,`habitantes`,`pbi_per_capita`,`continente`,`idioma`,`moneda`) VALUES (3,'united states',330000000,63500,'america','english','us dollar');

/* INSERT IN DIRECTORES */

INSERT INTO directores (`id`,`nombre`,`apellido`,`fecha_nacimiento`,`id_pais`,`ciudad_origen`) VALUES (1,'jose luis','campanella','1959-07-19',1,'buenos aires');

/* INSERT IN ACTORES */

INSERT INTO actores (`id`,`nombre`,`apellido`,`fecha_nacimiento`,`id_pais`,`ciudad_origen`) VALUES (1,'ricardo','darin','1957-01-16',1,'buenos aires');

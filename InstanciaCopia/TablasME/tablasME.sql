-- Table: public.duraciones_ME

-- DROP TABLE public."duraciones_ME";

CREATE TABLE public."duraciones_ME"
(
    rental_id integer NOT NULL,
    "diasDuracion" double precision,
    CONSTRAINT "duraciones_ME_pkey" PRIMARY KEY (rental_id)
)

TABLESPACE pg_default;

ALTER TABLE public."duraciones_ME"
    OWNER to postgres;
	
-- Table: public.tiempo_ME

-- DROP TABLE public."tiempo_ME";

CREATE TABLE public."tiempo_ME"
(
    rental_id integer NOT NULL,
    anno smallint NOT NULL,
    mes smallint NOT NULL,
    dia smallint NOT NULL,
    CONSTRAINT "tiempo_ME_pkey" PRIMARY KEY (rental_id)
)

TABLESPACE pg_default;

ALTER TABLE public."tiempo_ME"
    OWNER to postgres;
	
-- Table: public.lugar_ME

-- DROP TABLE public."lugar_ME";

CREATE TABLE public."lugar_ME"
(
    store_id integer NOT NULL,
    city character varying COLLATE pg_catalog."default" NOT NULL,
    country character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "lugar_ME_pkey" PRIMARY KEY (store_id)
)

TABLESPACE pg_default;

ALTER TABLE public."lugar_ME"
    OWNER to postgres;
	
-- Table: public.lenguaje_ME

-- DROP TABLE public."lenguaje_ME";

CREATE TABLE public."lenguaje_ME"
(
    language_id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "lenguaje_ME_pkey" PRIMARY KEY (language_id)
)

TABLESPACE pg_default;

ALTER TABLE public."lenguaje_ME"
    OWNER to postgres;
	
-- Table: public.film_ME

-- DROP TABLE public."film_ME";

CREATE TABLE public."film_ME"
(
    "IDFilm" integer NOT NULL,
    "Categoria" character varying COLLATE pg_catalog."default" NOT NULL,
    "Pelicula" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "film_ME_pkey" PRIMARY KEY ("IDFilm")
)

TABLESPACE pg_default;

ALTER TABLE public."film_ME"
    OWNER to postgres;
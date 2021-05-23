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
	
CREATE INDEX indiceDuraciones ON "duraciones_ME"(rental_id);
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
	
CREATE INDEX indicetime ON "tiempo_ME"(rental_id,mes);
	
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
	
CREATE INDEX indiceLugar ON "lugar_ME"(store_id);
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
	
	
CREATE INDEX indiceLenguaje ON "lenguaje_ME"(language_id);
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
	
	-- Table: public.Central

-- DROP TABLE public."Central

CREATE INDEX indicePelicula ON "film_ME"("IDFilm");

CREATE TABLE public."Central"
(
    central_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    film_id integer NOT NULL,
    store_id integer NOT NULL,
    language_id integer NOT NULL,
    time_id integer NOT NULL,
    duration_id integer NOT NULL,
    CONSTRAINT "Central_pkey" PRIMARY KEY (central_id),
    CONSTRAINT durationid FOREIGN KEY (duration_id)
        REFERENCES public."duraciones_ME" (rental_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT filmfk FOREIGN KEY (film_id)
        REFERENCES public."film_ME" ("IDFilm") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT lenguajefk FOREIGN KEY (language_id)
        REFERENCES public."lenguaje_ME" (language_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT storefk FOREIGN KEY (store_id)
        REFERENCES public."lugar_ME" (store_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT timefk FOREIGN KEY (time_id)
        REFERENCES public."tiempo_ME" (rental_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."Central"
    OWNER to postgres;
	
-- Table: public.Central2

-- DROP TABLE public."Central2";

CREATE TABLE public."Central2"
(
    central2_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    film_id integer,
    store_id integer,
    language_id integer,
    time_id integer,
    duration_id integer,
    CONSTRAINT "Central2_pkey" PRIMARY KEY (central2_id),
    CONSTRAINT "addressid-address-fk" FOREIGN KEY (store_id)
        REFERENCES public.address (address_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "durationid-duration-fk" FOREIGN KEY (duration_id)
        REFERENCES public.duration (duration_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "filmid-film-fk" FOREIGN KEY (film_id)
        REFERENCES public.film (film_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "languageid-language-fk" FOREIGN KEY (language_id)
        REFERENCES public.language (language_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "timeid-time-fk" FOREIGN KEY (time_id)
        REFERENCES public."time" (time_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public."Central2"
    OWNER to postgres;
-- Table: public.Duraciones

-- DROP TABLE public."Duraciones";

CREATE TABLE public."Duraciones"
(
    "IDDuracion" smallint NOT NULL,
    "Dias" smallint NOT NULL,
    CONSTRAINT "Duracion_pkey" PRIMARY KEY ("IDDuracion"),
    CONSTRAINT idduracion_unique UNIQUE ("IDDuracion")
)

TABLESPACE pg_default;

ALTER TABLE public."Duraciones"
    OWNER to postgres;
	
	-- Table: public.Fechas

-- DROP TABLE public."Fechas";

CREATE TABLE public."Fechas"
(
    "IDFecha" integer NOT NULL,
    "Anno" smallint NOT NULL,
    "tinyint" smallint NOT NULL,
    "Dia" smallint NOT NULL,
    CONSTRAINT "Fecha_pkey" PRIMARY KEY ("IDFecha"),
    CONSTRAINT idfecha_unique UNIQUE ("IDFecha")
)

TABLESPACE pg_default;

ALTER TABLE public."Fechas"
    OWNER to postgres;
	
-- Table: public.Lenguajes

-- DROP TABLE public."Lenguajes";

CREATE TABLE public."Lenguajes"
(
    "IDLenguaje" smallint NOT NULL,
    "Lenguaje" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Lenguaje_pkey" PRIMARY KEY ("IDLenguaje"),
    CONSTRAINT idlenguaje_unique UNIQUE ("IDLenguaje")
)

TABLESPACE pg_default;

ALTER TABLE public."Lenguajes"
    OWNER to postgres;
	
-- Table: public.Lugares

-- DROP TABLE public."Lugares";

CREATE TABLE public."Lugares"
(
    "IDLugar" smallint NOT NULL,
    "Pais" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Ciudad" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "Tienda" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Lugar_pkey" PRIMARY KEY ("IDLugar"),
    CONSTRAINT idlugar_unique UNIQUE ("IDLugar")
)

TABLESPACE pg_default;

ALTER TABLE public."Lugares"
    OWNER to postgres;
	
-- Table: public.Peliculas

-- DROP TABLE public."Peliculas";

CREATE TABLE public."Peliculas"
(
    "IDPelicula" smallint NOT NULL,
    "Categoria" character varying(15) COLLATE pg_catalog."default",
    "Filme" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT idpelicula_unique UNIQUE ("IDPelicula"),
    CONSTRAINT peliculas_idpelicula_unique UNIQUE ("IDPelicula")
)

TABLESPACE pg_default;

ALTER TABLE public."Peliculas"
    OWNER to postgres;
	
-- Table: public.Prestamos

-- DROP TABLE public."Prestamos";

CREATE TABLE public."Prestamos"
(
    "IDPrestamo" integer NOT NULL,
    "IDPelicula" smallint NOT NULL,
    "IDLugar" smallint NOT NULL,
    "IDFecha" integer NOT NULL,
    "IDLenguaje" smallint NOT NULL,
    "IDDuracion" smallint NOT NULL,
    CONSTRAINT "Prestamos_pkey" PRIMARY KEY ("IDPrestamo"),
    CONSTRAINT duraciones_idduracion_fk FOREIGN KEY ("IDDuracion")
        REFERENCES public."Duraciones" ("IDDuracion") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fechas_idfecha_fk FOREIGN KEY ("IDFecha")
        REFERENCES public."Fechas" ("IDFecha") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT lenguajes_idlenguaje_fk FOREIGN KEY ("IDLenguaje")
        REFERENCES public."Lenguajes" ("IDLenguaje") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT lugares_idlugares_fk FOREIGN KEY ("IDLugar")
        REFERENCES public."Lugares" ("IDLugar") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT peliculas_idpelicula_fk FOREIGN KEY ("IDPelicula")
        REFERENCES public."Peliculas" ("IDPelicula") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public."Prestamos"
    OWNER to postgres;
-- Index: fki_duraciones_idduracion_fk

-- DROP INDEX public.fki_duraciones_idduracion_fk;

CREATE INDEX fki_duraciones_idduracion_fk
    ON public."Prestamos" USING btree
    ("IDDuracion" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_fechas_idfecha_fk

-- DROP INDEX public.fki_fechas_idfecha_fk;

CREATE INDEX fki_fechas_idfecha_fk
    ON public."Prestamos" USING btree
    ("IDFecha" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_lenguajes_idlenguaje_fk

-- DROP INDEX public.fki_lenguajes_idlenguaje_fk;

CREATE INDEX fki_lenguajes_idlenguaje_fk
    ON public."Prestamos" USING btree
    ("IDLenguaje" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_lugares_idlugares_fk

-- DROP INDEX public.fki_lugares_idlugares_fk;

CREATE INDEX fki_lugares_idlugares_fk
    ON public."Prestamos" USING btree
    ("IDLugar" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_peliculas_idpelicula_fk

-- DROP INDEX public.fki_peliculas_idpelicula_fk;

CREATE INDEX fki_peliculas_idpelicula_fk
    ON public."Prestamos" USING btree
    ("IDPelicula" ASC NULLS LAST)
    TABLESPACE pg_default;
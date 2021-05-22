-- Table: public.time

-- DROP TABLE public."time";

CREATE TABLE public."time"
(
    time_id integer NOT NULL,
    anno smallint NOT NULL,
    mes smallint NOT NULL,
    dia smallint NOT NULL,
    CONSTRAINT time_pkey PRIMARY KEY (time_id)
)

TABLESPACE pg_default;

ALTER TABLE public."time"
    OWNER to postgres;
	
-- Table: public.duration

-- DROP TABLE public.duration;

CREATE TABLE public.duration
(
    duration_id integer NOT NULL,
    "diasDuracion" integer NOT NULL,
    CONSTRAINT duration_pkey PRIMARY KEY (duration_id)
)

TABLESPACE pg_default;

ALTER TABLE public.duration
    OWNER to postgres;
	
-- Table: public.Central

-- DROP TABLE public."Central";

CREATE TABLE public."Central"
(
    central_id integer NOT NULL,
    film_id integer NOT NULL,
    address_id integer NOT NULL,
    language_id integer NOT NULL,
    time_id integer NOT NULL,
    duration_id integer NOT NULL,
    CONSTRAINT "Central_pkey" PRIMARY KEY (central_id),
    CONSTRAINT "addressid-address-fk" FOREIGN KEY (address_id)
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

ALTER TABLE public."Central"
    OWNER to postgres;
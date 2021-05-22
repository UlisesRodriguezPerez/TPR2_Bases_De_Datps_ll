CREATE OR PROCEDURE cargarDatos() AS
DECLARE
	rowRental rental%rowtype;

	film_id integer;
	language_id integer;
	store_id integer;
	amount numeric;
BEGIN
	DELETE FROM "Central"
	DELETE FROM "film_ME"
	DELETE FROM "lenguaje_ME"
	DELETE FROM "lugar_ME"
	DELETE FROM "tiempo_ME"
	DELETE FROM "duraciones_ME"
	
	CALL cargarDuracionesME();
	CALL cargarLenguajeME();
	CALL cargarLugarME();
	CALL cargarPeliculasME();
	CALL cargarTiempoME();

	FOR rowRental in SELECT * FROM rental LOOP
		SELECT 
			f.film_id,
			l.language_id,
			s.store_id,
			pay.amount
		INTO
			film_id,
			language_id,
			store_id,
			amount
		FROM 
		INNER JOIN inventory i ON i.inventory_id = rowRental.inventory_id
		INNER JOIN film f ON f.film_id = i.film_id
		INNER JOIN "language" l ON l.language_id = f.language_id
		INNER JOIN store s ON s.store_id = i.store_id
		INNER JOIN payment pay ON pay.rental_id = rowRental.rental_id;

		INSERT INTO "Central" VALUES(film_id, store_id, language_id, rowRental.rental_id, rowRental.rental_id);
	END LOOP;
END;

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
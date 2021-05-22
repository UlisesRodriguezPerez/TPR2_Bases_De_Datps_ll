CREATE OR REPLACE PROCEDURE cargarDatos() AS
$$
DECLARE
	rowRental rental%rowtype;

	film_id integer;
	language_id integer;
	store_id integer;
	amount numeric;
BEGIN

	TRUNCATE TABLE "Central" RESTART IDENTITY CASCADE;
	TRUNCATE TABLE "film_ME" RESTART IDENTITY CASCADE;
	TRUNCATE TABLE "lenguaje_ME" RESTART IDENTITY CASCADE;
	TRUNCATE TABLE "lugar_ME" RESTART IDENTITY CASCADE;
	TRUNCATE TABLE "tiempo_ME" RESTART IDENTITY CASCADE;
	TRUNCATE TABLE "duraciones_ME" RESTART IDENTITY CASCADE;
	
	
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
			rental r
		INNER JOIN inventory i ON i.inventory_id = rowRental.inventory_id
		INNER JOIN film f ON f.film_id = i.film_id
		INNER JOIN "language" l ON l.language_id = f.language_id
		INNER JOIN store s ON s.store_id = i.store_id
		INNER JOIN payment pay ON pay.rental_id = rowRental.rental_id;

		INSERT INTO "Central"(film_id, store_id, language_id, time_id, duration_id, monto) 
							  VALUES(film_id,
									 store_id, 
									 language_id, 
									 rowRental.rental_id, 
									 rowRental.rental_id, 
									 amount);
	END LOOP;
END;
$$
LANGUAGE plpgsql;
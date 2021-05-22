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
			r.rental_id,
			pay.amount
		INTO
			film_id,
			language_id,
			store_id,
			rental_id,
			amount
		FROM rental r
		INNER JOIN inventory i ON i.inventory_id = r.inventory_id
		INNER JOIN film f ON f.film_id = i.film_id
		INNER JOIN "language" l ON l.language_id = f.language_id
		INNER JOIN store s ON s.store_id = i.store_id
		INNER JOIN payment pay ON pay.rental_id = r.rental_id;

		INSERT INTO "Central" VALUES();
	END LOOP;
END;
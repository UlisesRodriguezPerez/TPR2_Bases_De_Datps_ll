--SELECT cargarDatos()
--SELECT * FROM time WHERE rental_id > 300
--DELETE FROM TIME
--DELETE  FROM duration
--DELETE FROM pruebas
--DELETE FROM "Central"
CREATE OR REPLACE PROCEDURE cargarDatos(
)
LANGUAGE 'plpgsql'
AS $BODY$


	DECLARE
		contador  integer := 1;
		cantidadRental integer;
		anio INTEGER;
		mes integer;
		dia integer;
		fecha timestamp;
		fechaEntrega timestamp;
		diasDuracion varchar;
		idfilm integer;
		idstore integer;
		idlenguage integer;
		idtime integer;
		idduracion integer;
		
	BEGIN
	
	cantidadRental = COUNT(*)FROM rental;
		
	WHILE contador <= cantidadRental loop
		
		SELECT
			f."IDFilm",
			lu.store_id,
 			l.language_id,
 			t.rental_id,
 			d.rental_id
		
		FROM
			rental r
		INNER JOIN "duraciones_ME" d ON d.rental_id = r.rental_id
		INNER JOIN inventory i ON i.inventory_id = r.inventory_id
		INNER JOIN "film_ME" f ON f."IDFilm" = i.film_id
		INNER JOIN film fi ON fi.film_id = f."IDFilm"
		INNER JOIN "lenguaje_ME" l ON l.language_id = fi.language_id
		INNER JOIN "lugar_ME" lu ON lu.store_id = i.store_id
		INNER JOIN "tiempo_ME" t ON t.rental_id = r.rental_id
		
		WHERE contador = r.rental_id into idfilm,idstore,idlenguage,idtime,idduracion;
		

		--insert into pruebas(prueba,prueba2)VALUES(idfilm,idstore);
		insert into "Central"(film_id,store_id,language_id,time_id,duration_id)
		values(idfilm,idstore,idlenguage,idtime,idduracion);
		contador := contador + 1;
	END loop;
		
END;
$BODY$

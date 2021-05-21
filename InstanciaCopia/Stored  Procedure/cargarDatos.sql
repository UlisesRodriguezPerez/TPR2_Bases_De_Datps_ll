--SELECT cargarDatos()
--SELECT * FROM time WHERE rental_id > 300
--DELETE FROM TIME
--DELETE  FROM duration
--DELETE FROM pruebas
--DELETE FROM "Central"
CREATE OR REPLACE FUNCTION cargarDatos(
)
RETURNS VOID
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
		fecha = (SELECT rental_date FROM rental where rental_id = contador);
		fechaEntrega = (SELECT return_date FROM rental where rental_id = contador);
		
		anio = (SELECT EXTRACT(YEAR FROM fecha));
		mes = (SELECT EXTRACT(MONTH FROM fecha));
		dia = (SELECT EXTRACT(DAY FROM fecha));
		
		Select(fechaEntrega -  fecha) into diasDuracion;
            
		insert into time(anno,mes,dia,rental_id)VALUES(anio,mes,dia,contador);
		insert into duration(diasduracion,rental_id)VALUES(diasDuracion,contador);
		
		SELECT
			f.film_id,
			s.store_id,
 			l.language_id,
 			t.time_id,
 			d.duration_id
		
		FROM
			rental r
		INNER JOIN inventory i ON i.inventory_id = r.inventory_id
		INNER JOIN film f ON f.film_id = i.film_id
		INNER JOIN store s ON s.store_id = i.store_id
		INNER JOIN language l ON l.language_id = f.language_id
		INNER JOIN staff st ON st.staff_id = s.manager_staff_id
		INNER JOIN time t ON t.rental_id = r.rental_id
		INNER JOIN duration d ON d.rental_id = r.rental_id
		
		WHERE contador = r.rental_id into idfilm,idstore,idlenguage,idtime,idduracion;
		

		--insert into pruebas(prueba,prueba2)VALUES(idfilm,idstore);
		insert into "Central"(film_id,store_id,language_id,time_id,duration_id)
		values(idfilm,idstore,idlenguage,idtime,idduracion);
		contador := contador + 1;
	END loop;
		
END;
$BODY$

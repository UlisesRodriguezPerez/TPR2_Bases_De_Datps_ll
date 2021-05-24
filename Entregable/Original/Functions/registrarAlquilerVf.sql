-- FUNCTION: public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying, numeric)

-- DROP FUNCTION public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying, numeric);
--SELECT registraralquiler('Ulises','Rodríguez','Mike','Hillyer','2021-05-21 20:00:00','Academy Dinosaur','English',99.9)
--DELETE FROM pruebas
--SELECT * from rental order by rental_id DESC
CREATE OR REPLACE FUNCTION public.registraralquiler(
	firstname character varying,
	lastname character varying,
	firstnamesatff character varying,
	lastnamestaff character varying,
	fechadevolucion timestamp without time zone,
	nombrepelicula character varying,
	idiomapelicula character varying,
	pago numeric)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
		idstore integer; --buscar	
		idinventory integer; --buscar
		idstaff integer; --buscar
		idcustomer integer;	   --buscar
		idfilm integer;		--buscar
		idlanguage integer;	--buscar
		idrental integer;
		noexiste timestamp;
		
		
BEGIN
idstore = (SELECT store_id FROM staff WHERE first_name = firstnamesatff AND last_name = lastnamestaff);
idlanguage = (SELECT language_id FROM language WHERE name = idiomapelicula);
idfilm = (SELECT film_id FROM film WHERE language_id = idlanguage AND title = nombrepelicula);
idcustomer = (SELECT customer_id FROM customer WHERE first_name = firstname AND last_name = lastname AND active = 1);
idstaff = (SELECT manager_staff_id FROM store WHERE store_id = idstore);
-- SELECT *  FROM rental r WHERE  r.staff_id = 1 AND r.return_date < current_timestamp AND  r.inventory_id = 1 or r.inventory_id = 2 or r.inventory_id = 3 or r.inventory_id = 4;
idinventory = (SELECT i.inventory_id FROM inventory i
			   --INNER JOIN rental r ON r.inventory_id = i.inventory_id	
			   
			   WHERE (i.film_id = idfilm AND i.store_id = idstore         
			   AND (SELECT r.rental_id FROM rental r WHERE r.inventory_id = i.inventory_id AND r.staff_id = idstaff AND r.return_date < current_timestamp limit 1) > 0)
			   OR ((SELECT r.rental_id FROM rental r 
					---INNER JOIN inventory in ON in.inventory_id = r.invetory_id
					WHERE r.inventory_id = i.inventory_id AND r.staff_id = idstaff AND r.return_date > current_timestamp limit 1) is NULL AND i.film_id = idfilm AND i.store_id = idstore)
			   --inventory_id = i.inventory_id AND
			   limit 1);--AND r.return_date is null limit 1);


--noexiste = (SELECT return_date FROM rental WHERE inventory_id = idinventory AND customer_id AND staff_id = idstaff AND return_date = null);
--insert into pruebas (prueba) values(idinventory);
IF idstore > 0 AND idlanguage > 0 AND idfilm > 0  AND idcustomer > 0 AND idinventory > 0 THEN
	--insert into prueba values(1);
	--Se ingresa el registro de la renta.
	INSERT INTO 
		rental(
			rental_date,
			inventory_id,
			customer_id,
			return_date,
			staff_id
	)
	VALUES(
			current_timestamp,
			idinventory,
			idcustomer,
			fechadevolucion,
			idstaff
	);
	idrental = (SELECT rental_id FROM rental ORDER BY rental_id DESC limit 1);
	INSERT INTO
		payment(
			customer_id,
			staff_id,
			rental_id,
			amount,
			payment_date
		)
	VALUES(
		idcustomer,
		idstaff,
		idrental,
		pago,
		current_timestamp
		);

	--DESPUES de alquilar la película, se elimina del inventario.
	--DELETE FROM 
	--	inventory
	--WHERE
	--	inventory_id = idinventory;

END IF;
	

END;
$BODY$;

ALTER FUNCTION public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying, numeric)
    OWNER TO postgres;

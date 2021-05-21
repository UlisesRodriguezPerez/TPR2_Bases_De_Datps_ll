-- FUNCTION: public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying)

-- DROP FUNCTION public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying);
--SELECT registraralquiler('Ulises','Rodríguez','Mike','Hillyer','2021-05-20 20:00:00','Academy Dinosaur','English',8.9)
--SELECT * FROM rental ORDER BY rental_id DESC
--SELECT * FROM payment ORDER BY payment_id DESC
CREATE OR REPLACE FUNCTION public.registraralquiler(
	firstname character varying,
	lastname character varying,
	firstnamesatff character varying,
	lastnamestaff character varying,
	fechadevolucion timestamp without time zone,
	nombrepelicula character varying,
	idiomapelicula character varying,
	pago numeric
	)
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
		
		
BEGIN
idstore = (SELECT store_id FROM staff WHERE first_name = firstnamesatff AND last_name = lastnamestaff);
idlanguage = (SELECT language_id FROM language WHERE name = idiomapelicula);
idfilm = (SELECT film_id FROM film WHERE language_id = idlanguage AND title = nombrepelicula);
idinventory = (SELECT inventory_id FROM inventory WHERE film_id = idfilm AND store_id = idstore limit 1);
idstaff = (SELECT manager_staff_id FROM store WHERE store_id = idstore);
idcustomer = (SELECT customer_id FROM customer WHERE first_name = firstname AND last_name = lastname AND active = 1);

IF idstore > 0 AND idlanguage > 0 AND idfilm > 0 AND idinventory > 0 AND idcustomer > 0 THEN

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

ALTER FUNCTION public.registraralquiler(character varying, character varying, character varying, character varying, timestamp without time zone, character varying, character varying)
    OWNER TO postgres;

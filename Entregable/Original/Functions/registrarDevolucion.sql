--SELECT registrardevolucion('Ulises','Rodríguez','Mike','Hillyer','Academy Dinosaur','English')

CREATE OR REPLACE FUNCTION registrardevolucion(
	firstname character varying,
	lastname character varying,
	firstnamesatff character varying,
	lastnamestaff character varying,
	nombrepelicula character varying,
	idiomapelicula character varying
)
	returns void
	language 'plpgsql'
AS $BODY$

DECLARE 
	idstore integer; --buscar	
	idinventory integer; --buscar
	idstaff integer; --buscar
	idcustomer integer;	   --buscar
	idfilm integer;		--buscar
	idlanguage integer;	--buscar
	
BEGIN
	idstore = (SELECT store_id FROM staff WHERE first_name = firstnamesatff AND last_name = lastnamestaff);
	idlanguage = (SELECT language_id FROM language WHERE name = idiomapelicula);
	idfilm = (SELECT film_id FROM film WHERE language_id = idlanguage AND title = nombrepelicula);
	
	idstaff = (SELECT manager_staff_id FROM store WHERE store_id = idstore);
	idcustomer = (SELECT customer_id FROM customer WHERE first_name = firstname AND last_name = lastname AND active = 1);
	idinventory = (SELECT i.inventory_id FROM inventory i
				   INNER JOIN rental r on r.inventory_id = i.inventory_id
				   WHERE i.film_id = idfilm AND i.store_id = idstore and r.customer_id = idcustomer and r.staff_id = idstaff limit 1);

	IF idstore > 0 AND idlanguage > 0 AND idfilm > 0 AND idinventory > 0 AND idcustomer > 0 AND idstaff > 0 THEN
		--insert into pruebas (prueba) values(idinventory);
		UPDATE
			rental
		SET
			return_date = current_timestamp
		WHERE
			inventory_id = idinventory AND customer_id = idcustomer and staff_id = idstaff;
	

	END IF;
END;

$BODY$

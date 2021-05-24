--SELECT insertarnuevocliente('Mike','Hillyer','Ulises','Rodríguez','email.com','Colombia','Buenaventura','Zarcero','Zarcero','Tapezco','123','12345678')
--SELECT * FROM customer WHERE first_name = 'Ulises'
CREATE OR REPLACE FUNCTION insertarnuevocliente(
	--   STAFF ----
	firstnamestaff varchar,--idstore integer,	--buscar con nombre de encargado(manager_staff)
	lastnamestaff varchar,
	
	--  CLIENTE -----
	firstname varchar,	--parámetro
	lastname varchar,	--parámetro
	email varchar,		--parámetro
	
	--adressid integer,	--buscar city id, -----------------------
	pcountry varchar,
	pcity varchar,
	paddress varchar,
	paddress2 varchar,
	pdistrict varchar,
	ppostalcode varchar,
	pphone varchar--,
	
	--  
	--activebool boolean,	--parámetro o automático
	--createdate date,	--parámetro o automático
	--active integer		--parámetro o automático

	
)		
	returns void		
	language 'plpgsql'
AS $BODY$

DECLARE 
		idstore integer; --buscar
		idaddress integer; --buscar
		idcountry integer; --buscar
		idcity integer;	   --buscar
		salida varchar;		--Validación
		
		
BEGIN
idcountry = (SELECT country_id FROM country WHERE country = pcountry);
idcity = (SELECT city_id FROM city c WHERE c.city = pcity);
idstore = (SELECT store_id FROM staff WHERE first_name = firstnamestaff AND last_name = lastnamestaff);

salida = 'Ingresado con éxito.';
IF idcountry > 0 AND idcity > 0 AND idstore > 0 THEN
	PERFORM insertaraddress(paddress, paddress2, pdistrict, idcity, ppostalcode, pphone);
	idaddress = (SELECT address_id FROM address ORDER BY address_id DESC limit 1);
	INSERT INTO 
		customer(
			store_id,
			first_name,
			last_name,
			email,
			address_id,
			activebool,
			create_date,
			active
	)
	VALUES(
			idstore,
			firstname,
			lastname,
			email,
			idaddress,
			true,
			current_date,
			1
			--activebool,
			--createdate,
			--active
	);
ELSE
	salida = 'Error al ingresar la dirección.';
END IF;
	



END;
$BODY$;



--SELECT insertarnuevocliente();		
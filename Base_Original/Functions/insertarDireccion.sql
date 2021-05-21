CREATE OR REPLACE FUNCTION insertaraddress(
	paddress varchar,
	paddress2 varchar,
	pdistrict varchar,
	pidcity integer,
	ppostalcode varchar,
	pphone varchar
) 
returns void
language 'sql'
AS $BODY$

INSERT INTO address(
	address,
	address2,
	district,
	city_id,
	postal_code,
	phone
)
VALUES(
	paddress,
	paddress2,
	pdistrict,
	pidcity,
	ppostalcode,
	pphone
)

$BODY$;

--SELECT * FROM address WHERE address = 'Zarcero'
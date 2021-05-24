--SELECT insertarpelicula('Mike','Hillyer','ULISES','DESCRIPCIÓN',2021,'English',55,5,50,
--5.6, 'full text','Action',3)
--SELECT * FROM film ORDER BY film_id DESC
--SELECT * FROM INVENTORY ORDER BY INVENTORY_ID DESC
CREATE OR REPLACE FUNCTION insertarpelicula(
	firstnamesatff character varying,
	lastnamestaff character varying,
	ptitle varchar,
	pdescripcion varchar,
	prelease_year year,
	plenguage varchar,
	prental_duration integer,
	prental_rate numeric,
	plength integer,
	preplacement_cost numeric,
	--prating mpaa_rating,
	--pspecial_features text[],
	pfulltext tsvector,
	pcategoria varchar,
	pcopias integer
) returns void
LANGUAGE 'plpgsql'
AS $BODY$

DECLARE
	idcategoria integer;
	idlenguage integer;
	contador integer := 0;
	idstore integer;
	idfilm integer;
	
BEGIN
	idcategoria = (SELECT category_id from category WHERE name = pcategoria);
	idlenguage = (SELECT language_id FROM language WHERE name = plenguage);
	idstore = (SELECT store_id FROM staff  WHERE first_name= firstnamesatff AND last_name = lastnamestaff);
	
	--PERFORM insertar_en_film(ptitle,pdescripcion,prelease_year,idlenguage,prental_duration,prental_rate ,plength,preplacement_cost, prating, pspecial_features, pfulltext);
	PERFORM inserta_en_film(ptitle,pdescripcion,prelease_year,idlenguage,prental_duration,prental_rate ,plength,preplacement_cost, pfulltext);
	
	idfilm = (SELECT film_id FROM film order by film_id DESC limit 1);
	INSERT INTO film_category(film_id, category_id)VALUES(idfilm,idcategoria);
-- 	INSERT INTO 
-- 		film(
-- 			title,
-- 			description,
-- 			release_year,
-- 			language_id,
-- 			rental_duration,
-- 			rental_rate,
-- 			length,
-- 			replacement_cost--,
-- 			--rating,
-- 			--special_features,
-- 			--fulltext
-- 		)

-- 	--		preplacement_cost--,
-- 			--prating,
-- 			--pspecial_features,
-- 			--pfulltext,
-- 	--)
	
	WHILE contador < pcopias loop
		
		insert into inventory(film_id, store_id) VALUES(idfilm,idstore);
		
		contador := contador + 1;
	END loop;
END;	
$BODY$;

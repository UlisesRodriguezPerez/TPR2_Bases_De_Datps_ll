CREATE OR REPLACE FUNCTION inserta_en_film(
	ptitle varchar,
	pdescripcion varchar,
	prelease_year year,
	idlenguage integer,
	prental_duration integer,
	prental_rate numeric,
	plength integer,
	preplacement_cost numeric,
	--prating mpaa_rating,
	--pspecial_features text[],
	pfulltext tsvector
	) returns void
	
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
	INSERT INTO 
		film(
			title,
			description,
			release_year,
			language_id,
			rental_duration,
			rental_rate,
			length,
			replacement_cost--,
			--rating,
			--special_features,
			--fulltext
		)
	VALUES(
			ptitle,
			pdescripcion,
			prelease_year,
			idlenguage,
			prental_duration,
			prental_rate ,
			plength,
			preplacement_cost--,
			--prating,
			--pspecial_features,
			--pfulltext,
	);
END;
$BODY$;
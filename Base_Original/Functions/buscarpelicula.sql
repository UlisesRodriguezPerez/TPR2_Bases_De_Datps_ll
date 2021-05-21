-- FUNCTION: public.buscarpelicula(character varying, character varying)

-- DROP FUNCTION public.buscarpelicula(character varying, character varying);

CREATE OR REPLACE FUNCTION public.buscarpelicula(
	ptitle character varying,
	plenguaje character varying)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
		idlenguaje integer;	--buscar
		 NOMBRE text;

--SELECT clientes.rsocial_cliente INTO NOMBRE FROM clientes WHERE codigo_cliente=ccodigo;

		
BEGIN
idlenguaje = (SELECT language_id FROM language WHERE name = plenguaje);

SELECT 
	(
	f.film_id,
	f.title,
	f.description,
	f.release_year,
	f.language_id,
	f.rental_duration,
	f.rental_rate,
	f.length,
	f.replacement_cost,
	f.rating,
	f.last_update,
	f.special_features,
	f.fulltext,
	ca.name
	)INTO nombre
FROM
	film f
--INNER JOIN film_actor fa on fa.film_id = f.film_id
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category ca on ca.category_id = fc.category_id

WHERE
	f.title = ptitle AND f.language_id = idlenguaje;
	
RETURN NOMBRE;
END;
$BODY$;

ALTER FUNCTION public.buscarpelicula(character varying, character varying)
    OWNER TO postgres;

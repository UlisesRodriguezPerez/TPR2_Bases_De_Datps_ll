CREATE OR REPLACE PROCEDURE cargarPeliculasME() AS
$$
DECLARE 
	rowFilme film%rowtype;
	nombreCategoria character varying;
BEGIN
    FOR rowFilme in SELECT * FROM film LOOP
		SELECT Ca.name INTO nombreCategoria
		FROM category Ca, film_category FC
		WHERE Ca.category_id = FC.category_id AND rowFilme.film_id = FC.film_id;
        INSERT INTO "film_ME" VALUES(rowFilme.film_id, nombreCategoria, rowFilme.title);
    END LOOP;
END
$$
LANGUAGE plpgsql;
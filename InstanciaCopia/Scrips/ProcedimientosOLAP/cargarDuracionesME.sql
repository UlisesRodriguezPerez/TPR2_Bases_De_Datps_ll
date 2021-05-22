CREATE OR REPLACE PROCEDURE cargarDuracionesME() AS
$$
DECLARE 
	rowRental rental%rowtype;

BEGIN
    FOR rowRental in SELECT * FROM rental LOOP
        INSERT INTO "duraciones_ME" VALUES(rowRental.rental_id, 
										   DATE_PART('day', rowRental.return_date - rowRental.rental_date) INTO diasDuracion);
    END LOOP;
END
$$
LANGUAGE plpgsql;
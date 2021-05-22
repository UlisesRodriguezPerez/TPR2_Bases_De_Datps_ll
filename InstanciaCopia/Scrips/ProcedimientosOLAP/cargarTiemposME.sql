CREATE OR REPLACE PROCEDURE cargarTiempoME() AS
$$
DECLARE 
	rowRental rental%rowtype;
	rental_id integer;
	
BEGIN
    FOR rowRental in SELECT * FROM rental LOOP
        INSERT INTO "tiempo_ME" VALUES(rowRental.rental_id, 
									   EXTRACT(YEAR FROM rowRental.rental_date),
									   EXTRACT(MONTH FROM rowRental.rental_date),
									   EXTRACT(DAY FROM rowRental.rental_date));
    END LOOP;
END
$$
LANGUAGE plpgsql;
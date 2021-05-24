CREATE OR REPLACE PROCEDURE cargarDuracionesME() AS
$$
DECLARE 
	rowRental rental%rowtype;
BEGIN
    FOR rowRental in SELECT * FROM rental LOOP
        INSERT INTO "duraciones_ME" VALUES(rowRental.rental_id, 
										   (date_part ('day',  rowRental.return_date - rowRental.rental_date )) +
        								   ceiling(date_part ('hour', rowRental.return_date - rowRental.rental_date ) /24));
    END LOOP;
END
$$
LANGUAGE plpgsql;
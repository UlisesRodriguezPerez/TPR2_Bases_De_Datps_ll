CREATE OR REPLACE PROCEDURE cargarLugarME() AS
$$
DECLARE 
	rowTienda store%rowtype;
	city character varying;
	country character varying;
BEGIN
    FOR rowTienda in SELECT * FROM store LOOP
        SELECT 
			Ci.city, Co.country
		INTO
			city, country
		FROM City Ci, Country Co, Address Ad
		WHERE rowTienda.address_id = Ad.address_id 
		  AND Ad.city_id = Ci.city_id 
		  AND Ci.country_id = Co.Country_id;
		
		INSERT INTO "lugar_ME" VALUES(rowTienda.store_id, city, country);
    END LOOP;
END
$$
LANGUAGE plpgsql;
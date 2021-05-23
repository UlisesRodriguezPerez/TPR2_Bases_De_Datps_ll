CREATE ROLE emp;
CREATE ROLE "admin";
CREATE ROLE video;

ALTER TABLE actor OWNER TO video;
ALTER TABLE address OWNER TO video;
ALTER TABLE category OWNER TO video;
ALTER TABLE city OWNER TO video;
ALTER TABLE country OWNER TO video;
ALTER TABLE customer OWNER TO video;
ALTER TABLE film OWNER TO video;
ALTER TABLE film_actor OWNER TO video;
ALTER TABLE film_category OWNER TO video;
ALTER TABLE inventory OWNER TO video;
ALTER TABLE "language" OWNER TO video;
ALTER TABLE payment OWNER TO video;
ALTER TABLE staff OWNER TO video;
ALTER TABLE store OWNER TO video;

REVOKE ALL ON FUNCTION "insertarpelicula" FROM public;

ALTER FUNCTION "buscarpelicula" OWNER TO video;
ALTER FUNCTION "inserta_en_film" OWNER TO video;
ALTER FUNCTION "insertaraddress" OWNER TO video;
ALTER FUNCTION "insertarnuevocliente" OWNER TO video;
ALTER FUNCTION "insertarpelicula" OWNER TO video;
ALTER FUNCTION "registraralquiler" OWNER TO video;
ALTER FUNCTION "registrardevolucion" OWNER TO video;


ALTER FUNCTION "buscarpelicula" SECURITY DEFINER ;
ALTER FUNCTION "inserta_en_film" SECURITY DEFINER ;
ALTER FUNCTION "insertaraddress" SECURITY DEFINER ;
ALTER FUNCTION "insertarnuevocliente" SECURITY DEFINER ;
ALTER FUNCTION "insertarpelicula" SECURITY DEFINER ;
ALTER FUNCTION "registraralquiler" SECURITY DEFINER ;
ALTER FUNCTION "registrardevolucion" SECURITY DEFINER ;

ALTER SEQUENCE "actor_actor_id_seq" OWNER TO video;
ALTER SEQUENCE "address_address_id_seq" OWNER TO video;
ALTER SEQUENCE "category_category_id_seq" OWNER TO video;
ALTER SEQUENCE "city_city_id_seq" OWNER TO video;
ALTER SEQUENCE "country_country_id_seq" OWNER TO video;
ALTER SEQUENCE "customer_customer_id_seq" OWNER TO video;
ALTER SEQUENCE "film_film_id_seq" OWNER TO video;
ALTER SEQUENCE "inventory_inventory_id_seq" OWNER TO video;
ALTER SEQUENCE "language_language_id_seq" OWNER TO video;

ALTER SEQUENCE "payment_payment_id_seq" OWNER TO video;
ALTER SEQUENCE "rental_rental_id_seq" OWNER TO video;
ALTER SEQUENCE "staff_staff_id_seq" OWNER TO video;
ALTER SEQUENCE "store_store_id_seq" OWNER TO video;

--EMP
GRANT EXECUTE ON FUNCTION "insertarnuevocliente" TO emp;
GRANT EXECUTE ON FUNCTION "registraralquiler" TO emp;
GRANT EXECUTE ON FUNCTION "registrardevolucion" TO emp;
GRANT EXECUTE ON FUNCTION "buscarpelicula" TO emp;



--admin
GRANT EXECUTE ON FUNCTION "insertarpelicula" TO "admin";
GRANT emp TO "admin";

--REVOKE EXECUTE ON FUNCTION

CREATE USER empleado1 LOGIN PASSWORD '1234';
--CREATE USER empleado1 with password '1234';
CREATE USER administrador1 LOGIN password '1234';

GRANT emp TO empleado1;
GRANT "admin" TO administrador1;



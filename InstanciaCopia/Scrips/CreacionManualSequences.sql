-- DOMAIN: public.year

-- DROP DOMAIN public.year;


-- SEQUENCE: public.actor_actor_id_seq

-- DROP SEQUENCE public.actor_actor_id_seq;

CREATE SEQUENCE public.actor_actor_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.actor_actor_id_seq
    OWNER TO postgres;
	
	
-- SEQUENCE: public.address_address_id_seq

-- DROP SEQUENCE public.address_address_id_seq;

CREATE SEQUENCE public.address_address_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.address_address_id_seq
    OWNER TO postgres;	

-- SEQUENCE: public.category_category_id_seq

-- DROP SEQUENCE public.category_category_id_seq;

CREATE SEQUENCE public.category_category_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.category_category_id_seq
    OWNER TO postgres;
	
-- SEQUENCE: public.city_city_id_seq

-- DROP SEQUENCE public.city_city_id_seq;

CREATE SEQUENCE public.city_city_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.city_city_id_seq
    OWNER TO postgres;

-- SEQUENCE: public.country_country_id_seq

-- DROP SEQUENCE public.country_country_id_seq;

CREATE SEQUENCE public.country_country_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.country_country_id_seq
    OWNER TO postgres;


-- SEQUENCE: public.customer_customer_id_seq

-- DROP SEQUENCE public.customer_customer_id_seq;

CREATE SEQUENCE public.customer_customer_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.customer_customer_id_seq
    OWNER TO postgres;
	
	
-- SEQUENCE: public.film_film_id_seq

-- DROP SEQUENCE public.film_film_id_seq;

CREATE SEQUENCE public.film_film_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.film_film_id_seq
    OWNER TO postgres;
	
-- SEQUENCE: public.inventory_inventory_id_seq

-- DROP SEQUENCE public.inventory_inventory_id_seq;

CREATE SEQUENCE public.inventory_inventory_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.inventory_inventory_id_seq
    OWNER TO postgres;
	
-- SEQUENCE: public.language_language_id_seq

-- DROP SEQUENCE public.language_language_id_seq;

CREATE SEQUENCE public.language_language_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.language_language_id_seq
    OWNER TO postgres;

-- SEQUENCE: public.payment_payment_id_seq

-- DROP SEQUENCE public.payment_payment_id_seq;

CREATE SEQUENCE public.payment_payment_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.payment_payment_id_seq
    OWNER TO postgres;	
	
-- DROP SEQUENCE public.rental_rental_id_seq;

CREATE SEQUENCE public.rental_rental_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.rental_rental_id_seq
    OWNER TO postgres;
	
-- SEQUENCE: public.staff_staff_id_seq

-- DROP SEQUENCE public.staff_staff_id_seq;

CREATE SEQUENCE public.staff_staff_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.staff_staff_id_seq
    OWNER TO postgres;
	
-- DROP SEQUENCE public.store_store_id_seq;

CREATE SEQUENCE public.store_store_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.store_store_id_seq
    OWNER TO postgres;
	
	
-- Type: mpaa_rating

-- DROP TYPE public.mpaa_rating;

CREATE TYPE public.mpaa_rating AS ENUM
    ('G', 'PG', 'PG-13', 'R', 'NC-17');

ALTER TYPE public.mpaa_rating
    OWNER TO postgres;
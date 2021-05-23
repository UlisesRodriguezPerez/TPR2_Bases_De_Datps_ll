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

ALTER FUNCTION "" OWNER TO video;

ALTER FUNCTION "funcion" SECURITY DEFINER SET search_path = video;

GRANT EXECUTE ON FUNCTION "funcion" ON role

CREATE USER empleado1;
CREATE USER administrador1

GRANT emp TO empleado1;
GRANT "admin" TO administrador1;

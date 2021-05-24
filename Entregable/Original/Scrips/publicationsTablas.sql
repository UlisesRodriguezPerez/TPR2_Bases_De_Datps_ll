--IMPORTANTE -> HACER EN ORDEN Y DE UNO EN UNO. LOS SCRIPS NECESARIOS ESTÄN EN GIT.

----> CREACIÓN DEL ROL REPLICATOR
--create role replicator replication login password 'replic1234';


----> CREACIÓN DE PUBLICACIÓN DE CADA TABLA
--CREATE PUBLICATION bpub FOR TABLE actor;
--GRANT ALL ON actor TO replicator;

----> CONSULTA
--SELECT PRIVILEGE_TYPE, table_name FROM information_schema.role_table_grants WHERE grantee = 'replicator';


 ----> Ejecutar el DDL CMD admin para generar script de la original.
 ----> Ejemplo tabla actor.
 --comando --> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t actor -s -W > actor.sql
--La siguiente instrucción es para leer el archivo sql generado por la orinial.
----Comando para la copia (cmd igual)--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=actor.sql -W

--CREATE PUBLICATION bpub FOR TABLE actor;
--GRANT ALL ON actor TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t actor -s -W > actor.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=actor.sql -W

CREATE PUBLICATION bpub2 FOR TABLE address;
GRANT ALL ON address TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t address -s -W > address.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=address.sql -W


CREATE PUBLICATION bpub3 FOR TABLE category;
GRANT ALL ON category TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t category -s -W > category.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=category.sql -W

CREATE PUBLICATION bpub4 FOR TABLE city;
GRANT ALL ON city TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t city -s -W > city.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=city.sql -W

CREATE PUBLICATION bpub5 FOR TABLE country;
GRANT ALL ON country TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t country -s -W > country.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=country.sql -W

CREATE PUBLICATION bpub6 FOR TABLE customer;
GRANT ALL ON customer TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t customer -s -W > customer.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=customer.sql -W

CREATE PUBLICATION bpub7 FOR TABLE film;
GRANT ALL ON film TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t film -s -W > film.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=film.sql -W

CREATE PUBLICATION bpub8 FOR TABLE film_actor;
GRANT ALL ON film_actor TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t film_actor -s -W > film_actor.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=film_actor.sql -W

CREATE PUBLICATION bpub9 FOR TABLE film_category;
GRANT ALL ON film_category TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t film_category -s -W > film_category.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=film_category.sql -W

CREATE PUBLICATION bpub10 FOR TABLE inventory;
GRANT ALL ON inventory TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t inventory -s -W > inventory.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=inventory.sql -W

CREATE PUBLICATION bpub11 FOR TABLE language;
GRANT ALL ON language TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t language -s -W > language.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=language.sql -W

CREATE PUBLICATION bpub12 FOR TABLE payment;
GRANT ALL ON payment TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t payment -s -W > payment.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=payment.sql -W

CREATE PUBLICATION bpub13 FOR TABLE rental;
GRANT ALL ON rental TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t rental -s -W > rental.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=rental.sql -W

CREATE PUBLICATION bpub14 FOR TABLE staff;
GRANT ALL ON staff TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t staff -s -W > staff.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=staff.sql -W

CREATE PUBLICATION bpub15 FOR TABLE store;
GRANT ALL ON store TO replicator;
-->cmd--> pg_dump --host=localhost --dbname=dvdrental --port=5432 --username=postgres -t store -s -W > store.sql
-->cmd--> psql --host=localhost --dbname=copiadvdrental --port=5433 --username=postgres --file=store.sql -W








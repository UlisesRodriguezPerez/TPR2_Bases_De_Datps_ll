CREATE OR REPLACE PROCEDURE cargarlenguajeME() AS
$$
DECLARE 
	rowLenguaje "language"%rowtype;
BEGIN
    FOR rowLenguaje in SELECT * FROM "language" LOOP
        INSERT INTO "lenguaje_ME" VALUES(rowLenguaje.language_id, rowLenguaje.name);
    END LOOP;
END
$$
LANGUAGE plpgsql;
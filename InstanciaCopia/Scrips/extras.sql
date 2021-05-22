--DELETE FROM pg_catalog.pg_replication_slots

--S-ELECT * FROM pg_catalog.pg_replication_slots
--LIMIT 100
--DELETE FROM pg_catalog.pg_publication
--DELETE FROM pg_catalog.pg_publication_rel

--select drop_replication_slot('bsub');
select pg_drop_replication_slot('bsub11') from pg_replication_slots where slot_name = 'bsub11';
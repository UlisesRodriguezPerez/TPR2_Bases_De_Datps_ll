-- DELETE SUBSCRIPTION bsub5;
CREATE SUBSCRIPTION bsub6 CONNECTION 'dbname=postgres host=localhost port=5432 user=replicator password=replic1234' PUBLICATION bpub6;
-- DELETE FROM pg_subscription;
--select * from pg_replication_slots;
--select * from pg_stat_replication;
--DELETE FROM pg_replication_origin_status;
--DELETE FROM 
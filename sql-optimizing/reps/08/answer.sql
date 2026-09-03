BEGIN;
SELECT remaining FROM seats WHERE id = 1 \gset
SELECT pg_sleep(1);
UPDATE seats SET remaining = :remaining - 1 WHERE id = 1;
INSERT INTO seat_sales (seat_id) VALUES (1);
COMMIT;

BEGIN;
GRANT SELECT ON collections TO mfa_reader;
SET ROLE mfa_reader;
SELECT COUNT(*) AS visible_rows FROM collections;
RESET ROLE;
ROLLBACK;

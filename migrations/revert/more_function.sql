-- Revert my_bookshelf:more_function from pg

BEGIN;

-- XXX Add DDLs here

DROP FUNCTION "update_author";

DROP FUNCTION "delete_author";

COMMIT;

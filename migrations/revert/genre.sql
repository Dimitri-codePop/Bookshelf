-- Revert my_bookshelf:genre from pg

BEGIN;

-- XXX Add DDLs here.
DROP FUNCTION add_genre;

DROP FUNCTION update_genre;

DROP FUNCTION delete_genre;

COMMIT;

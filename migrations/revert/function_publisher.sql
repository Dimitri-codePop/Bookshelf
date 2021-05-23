-- Revert my_bookshelf:function_publisher from pg

BEGIN;

-- XXX Add DDLs here.
DROP FUNCTION add_publisher;

DROP FUNCTION update_publisher;

DROP FUNCTION delete_publisher;

COMMIT;

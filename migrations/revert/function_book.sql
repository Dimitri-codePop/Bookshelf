-- Revert my_bookshelf:function_book from pg

BEGIN;

-- XXX Add DDLs here.

DROP FUNCTION add_book;


DROP FUNCTION update_book;

DROP FUNCTION delete_book;

COMMIT;

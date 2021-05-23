-- Revert my_bookshelf:author_unique from pg

BEGIN;

-- XXX Add DDLs here.
ALTER TABLE "author"
    DROP CONSTRAINT "author_unique";

COMMIT;

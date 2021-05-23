-- Deploy my_bookshelf:author_unique to pg

BEGIN;

-- XXX Add DDLs here.

ALTER TABLE "author"
    ADD CONSTRAINT "author_unique" UNIQUE ("firstname", "lastname", "birthdate");

COMMIT;

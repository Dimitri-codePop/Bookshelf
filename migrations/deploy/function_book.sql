-- Deploy my_bookshelf:function_book to pg

BEGIN;

-- XXX Add DDLs here.


CREATE FUNCTION add_book(book json) RETURNS book AS $$
    INSERT INTO "book"
    ("reference", "title", "locale", "year", 
    "page_count", "chapter_count", "front_cover", "cover", "publisher_id")
    VALUES(
        (book->>'reference'),
        (book->>'title'),
        (book->>'locale'),
        (book->>'year')::int,
        (book->>'page_count')::int,
        (book->>'chapter_count')::int,
        (book->>'front_cover'),
        (book->>'cover'),
        (book->>'publisher_id')::int
    ) RETURNING *;
$$ LANGUAGE sql;


CREATE FUNCTION update_book(book_input json) RETURNS book AS $$
    UPDATE "book" SET
    "reference" = book_input->>'reference', 
    "title" = book_input->>'title', 
    "locale" = book_input->>'locale', 
    "year" = (book_input ->> 'year')::int, 
    "page_count" = (book_input->>'page_count')::int, 
    "chapter_count" =( book_input->>'chapter_count')::int, 
    "front_cover" = book_input->>'front_cover', 
    "cover" = book_input->>'cover',
    "publisher_id" = (book_input ->> 'publisher_id')::int
    WHERE "id" = (book_input->>'id')::int
    RETURNING *;
$$ LANGUAGE sql;

CREATE FUNCTION delete_book(id_input int) RETURNS void AS $$
    -- DELETE FROM "author" WHERE "id" = id_input;
    -- On préfère un soft delete
    UPDATE "book" SET
    "deleted_at" = now()
    WHERE id = id_input
$$ LANGUAGE sql;

COMMIT;

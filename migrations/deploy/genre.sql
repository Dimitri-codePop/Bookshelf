-- Deploy my_bookshelf:genre to pg

BEGIN;

-- XXX Add DDLs here.


CREATE FUNCTION add_genre(genre json) RETURNS genre AS $$
    INSERT INTO "genre"
    ("label")
    VALUES(
        (genre->>'label')
    ) RETURNING *;
$$ LANGUAGE sql;


CREATE FUNCTION update_genre(genre_input json) RETURNS genre AS $$
    UPDATE "genre" SET
    "label" = genre_input->>'label'
    WHERE "id" = (genre_input->>'id')::int
    RETURNING *;
$$ LANGUAGE sql;

CREATE FUNCTION delete_genre(id_input int) RETURNS void AS $$
    -- DELETE FROM "author" WHERE "id" = id_input;
    -- On préfère un soft delete
    UPDATE "genre" SET
    "deleted_at" = now()
    WHERE id = id_input
$$ LANGUAGE sql;

COMMIT;

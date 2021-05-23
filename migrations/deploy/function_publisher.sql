-- Deploy my_bookshelf:function_publisher to pg

BEGIN;

-- XXX Add DDLs here.

CREATE FUNCTION add_publisher(publisher json) RETURNS publisher AS $$
    INSERT INTO "publisher"
    ("name", "country_iso_2")
    VALUES(
        (publisher->>'name'),
        (publisher->>'country_iso_2')
    ) RETURNING *;
$$ LANGUAGE sql;


CREATE FUNCTION update_publisher(publisher_input json) RETURNS publisher AS $$
    UPDATE "publisher" SET
    "name" = publisher_input->>'name', 
    "country_iso_2" = publisher_input->>'country_iso_2'
    WHERE "id" = (publisher_input->>'id')::int
    RETURNING *;
$$ LANGUAGE sql;

CREATE FUNCTION delete_publisher(id_input int) RETURNS void AS $$
    -- DELETE FROM "author" WHERE "id" = id_input;
    -- On préfère un soft delete
    UPDATE "publisher" SET
    "deleted_at" = now()
    WHERE id = id_input
$$ LANGUAGE sql;


COMMIT;

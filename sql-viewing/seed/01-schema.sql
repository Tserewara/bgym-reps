CREATE TABLE artists (
    id integer PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE collections (
    id integer PRIMARY KEY,
    title text NOT NULL,
    artist_id integer NOT NULL REFERENCES artists (id),
    created_at date NOT NULL,
    deleted_at timestamptz,
    private_note text
);

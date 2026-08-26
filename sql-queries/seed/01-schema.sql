-- A small library, shaped so the obvious wrong answer is visibly wrong.
--
-- Deliberate in here: an artist with no albums, an album with no release year,
-- a track with no duration, and two albums sharing a title. Every one of those
-- is the trap in some exercise, and none of them is unusual in a real schema.

CREATE TABLE artists (
    id          integer PRIMARY KEY,
    name        text    NOT NULL,
    country     text
);

CREATE TABLE albums (
    id           integer PRIMARY KEY,
    artist_id    integer NOT NULL REFERENCES artists (id),
    title        text    NOT NULL,
    -- Nullable on purpose. A release year you do not know is not a zero.
    release_year integer
);

CREATE TABLE tracks (
    id               integer PRIMARY KEY,
    album_id         integer NOT NULL REFERENCES albums (id),
    position         integer NOT NULL,
    title            text    NOT NULL,
    -- Also nullable, and exercise 5 is about what SUM does with that.
    duration_seconds integer
);

-- No index on tracks.title. That absence is exercise 7.

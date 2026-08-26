INSERT INTO artists (id, name, country) VALUES
    (1, 'Miles Davis',      'US'),
    (2, 'John Coltrane',    'US'),
    (3, 'Bill Evans',       'US'),
    (4, 'Chet Baker',       'US'),
    (5, 'Herbie Hancock',   'US'),
    (6, 'Wayne Shorter',    'US'),
    (7, 'Charles Mingus',   'US'),
    (8, 'Thelonious Monk',  'US');

INSERT INTO albums (id, artist_id, title, release_year) VALUES
    (1,  1, 'Birth of the Cool',  1957),
    (2,  1, 'Kind of Blue',       1959),
    (3,  1, 'Sketches of Spain',  1960),
    (4,  1, 'Bitches Brew',       1970),
    (5,  1, 'Tutu',               1986),
    (6,  1, 'Doo-Bop',            1992),
    (7,  1, 'Rubberband',         NULL),
    (8,  2, 'Blue Train',         1957),
    (9,  2, 'Giant Steps',        1960),
    (10, 2, 'A Love Supreme',     1965),
    (11, 3, 'Portrait in Jazz',   1960),
    (12, 3, 'Waltz for Debby',    1961),
    (13, 5, 'Maiden Voyage',      1965),
    (14, 5, 'Head Hunters',       1973),
    (15, 6, 'Speak No Evil',      1966),
    (16, 7, 'Mingus Ah Um',       1959),
    (17, 8, 'Brilliant Corners',  1957),
    (18, 8, 'Monk''s Dream',      1963);

-- Tracks exist for four albums only. That is also a trap: an aggregate over
-- albums and one over albums-that-have-tracks are different questions.
INSERT INTO tracks (id, album_id, position, title, duration_seconds) VALUES
    (1,  2, 1, 'So What',                        545),
    (2,  2, 2, 'Freddie Freeloader',             589),
    (3,  2, 3, 'Blue in Green',                  337),
    (4,  2, 4, 'All Blues',                      693),
    (5,  2, 5, 'Flamenco Sketches',              566),

    (6,  10, 1, 'Acknowledgement',               452),
    (7,  10, 2, 'Resolution',                    431),
    (8,  10, 3, 'Pursuance',                     642),
    -- No duration recorded. Exercise 5 is about what that does to a total.
    (9,  10, 4, 'Psalm',                         NULL),

    (10, 14, 1, 'Chameleon',                     941),
    (11, 14, 2, 'Watermelon Man',                386),
    (12, 14, 3, 'Sly',                           614),
    (13, 14, 4, 'Vein Melter',                   568),

    (14, 12, 1, 'My Foolish Heart',              280),
    (15, 12, 2, 'Waltz for Debby',               412),
    (16, 12, 3, 'Detour Ahead',                  445),
    (17, 12, 4, 'My Romance',                    446),
    (18, 12, 5, 'Some Other Time',               299),
    (19, 12, 6, 'Milestones',                    386);

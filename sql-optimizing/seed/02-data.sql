INSERT INTO movies (title, release_year, genre, rating, release_date) VALUES
    ('The Quiet Harbor', 1981, 'Drama', 4.2, '1981-04-12'),
    ('The Quiet Harbor II', 1981, 'Drama', 3.9, '1981-10-02'),
    ('The Last Projectionist', 1999, 'Documentary', 4.8, '1999-06-01'),
    ('River of Light', 2005, 'Drama', NULL, '2005-02-14'),
    ('After the Rain', 2010, 'Drama', 4.1, '2010-09-03'),
    ('Small Hours', 2015, 'Comedy', 3.4, '2015-05-19'),
    ('North Station', 2018, 'Thriller', 4.7, '2018-11-21'),
    ('Red Dust', 2020, 'Drama', 4.0, '2020-01-30'),
    ('The Orchard', 2021, 'Drama', 4.6, '2021-07-08'),
    ('Night Bus', 2022, 'Thriller', 3.8, '2022-03-16'),
    ('Scratch Row A', 2023, 'Unreleased', NULL, NULL),
    ('Scratch Row B', 2023, 'Unreleased', NULL, NULL);

-- The series is deliberate: it makes the planner's choice visible without
-- storing a half-million-line data file in the repository.
INSERT INTO movies (title, release_year, genre, rating, release_date)
SELECT
    'Generated Film ' || lpad(g::text, 6, '0'),
    1950 + (g % 75),
    CASE g % 4 WHEN 0 THEN 'Drama' WHEN 1 THEN 'Comedy' WHEN 2 THEN 'Thriller' ELSE 'Documentary' END,
    CASE WHEN g % 11 = 0 THEN NULL ELSE round((2.0 + (g % 31) / 10.0)::numeric, 1) END,
    DATE '1950-01-01' + ((g % 27000)::integer)
FROM generate_series(1, 499988) AS series(g);

INSERT INTO wallets (id, owner, balance) VALUES
    (1, 'Alice', 100.00),
    (2, 'Bob', 50.00);

INSERT INTO seats (id, label, remaining) VALUES
    (1, 'Screen 1 / A1', 1);

ANALYZE movies;

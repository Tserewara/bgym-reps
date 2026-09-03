INSERT INTO artists (id, name) VALUES
    (1, 'Maya Lin'),
    (2, 'Chen Wei'),
    (3, 'Amina Diallo');

INSERT INTO collections (id, title, artist_id, created_at, deleted_at, private_note) VALUES
    (1, 'Moon Garden', 1, '2020-04-12', NULL, 'donor requested quiet display'),
    (2, 'Red Vessel', 1, '2021-09-03', NULL, NULL),
    (3, 'Blue Room', 2, '2022-02-18', NULL, 'loan ends in June'),
    (4, 'Hidden Study', 2, '2019-11-07', '2025-01-15 10:00:00+00', 'removed from public catalogue'),
    (5, 'Bronze Dog', 3, '2023-06-21', NULL, NULL);

INSERT INTO authors (id, name, country) VALUES
    (1, 'Georgi Gospodinov', 'Bulgaria'),
    (2, 'Yoko Tawada', 'Japan'),
    (3, 'Olga Tokarczuk', 'Poland'),
    (4, 'Mieko Kawakami', 'Japan'),
    (5, 'Lucy Kirkwood', 'United Kingdom'),
    (6, 'David Diop', 'Senegal'),
    (7, 'Rowan Byrne', 'Ireland');

INSERT INTO publishers (id, name) VALUES
    (1, 'Jan Michalski Foundation'),
    (2, 'Harvill Secker'),
    (3, 'Harvill Secker'),
    (4, 'Fitzcarraldo Editions '),
    (5, 'And Other Stories'),
    (6, 'Pushkin Press'),
    (7, 'Midnight Press');

INSERT INTO books (id, title, release_year, publisher_id, translator_id) VALUES
    (1, 'The Seven Moons of Maali Almeida', 2022, 1, NULL),
    (2, 'Tomb of Sand', 2022, 2, 2),
    (3, 'The Books of Jacob', 2021, 2, 3),
    (4, 'Love in the Big City', 2021, 3, 4),
    (5, 'The Employees', 2020, 4, NULL),
    (6, 'The Promise', 2021, 5, 5),
    (7, 'At Night All Blood Is Black', 2020, 6, 6),
    (8, 'The Enlightenment of the Greengage Tree', 2019, 1, NULL),
    (9, 'Untranslated Orphan', 2019, 6, NULL);

INSERT INTO book_authors (book_id, author_id, credit_order) VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 1, 1),
    (6, 2, 2),
    (7, 6, 1),
    (8, 1, 1);

INSERT INTO ratings (id, book_id, score) VALUES
    (1, 1, 4.5),
    (2, 1, 4.0),
    (3, 2, 4.2),
    (4, 3, 3.8),
    (5, 3, 4.1),
    (6, 4, 3.7),
    (7, 6, 4.8),
    (8, 7, 4.4);

CREATE TABLE authors (
    id integer PRIMARY KEY,
    name text NOT NULL,
    country text NOT NULL
);

CREATE TABLE publishers (
    id integer PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE books (
    id integer PRIMARY KEY,
    title text NOT NULL,
    release_year integer,
    publisher_id integer REFERENCES publishers (id),
    translator_id integer REFERENCES authors (id)
);

CREATE TABLE book_authors (
    book_id integer NOT NULL REFERENCES books (id),
    author_id integer NOT NULL REFERENCES authors (id),
    credit_order integer NOT NULL,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE ratings (
    id integer PRIMARY KEY,
    book_id integer NOT NULL REFERENCES books (id),
    score numeric(2,1) NOT NULL CHECK (score BETWEEN 0 AND 5)
);

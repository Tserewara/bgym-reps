CREATE TABLE movies (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title text NOT NULL,
    release_year integer NOT NULL,
    genre text NOT NULL,
    rating numeric(3,1),
    release_date date
);

CREATE TABLE wallets (
    id integer PRIMARY KEY,
    owner text NOT NULL,
    balance numeric(10,2) NOT NULL CHECK (balance >= 0)
);

CREATE TABLE seats (
    id integer PRIMARY KEY,
    label text NOT NULL,
    remaining integer NOT NULL CHECK (remaining >= 0)
);

CREATE TABLE seat_sales (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    seat_id integer NOT NULL REFERENCES seats (id),
    sold_at timestamptz NOT NULL DEFAULT now()
);

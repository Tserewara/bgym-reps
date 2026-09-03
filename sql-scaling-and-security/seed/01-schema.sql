CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replicator';

CREATE TABLE accounts (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    owner_name text NOT NULL,
    balance numeric(10,2) NOT NULL CHECK (balance >= 0)
);

CREATE TABLE app_users (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username text NOT NULL UNIQUE,
    password text NOT NULL
);

CREATE TABLE riders (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL
);

CREATE TABLE rides (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    rider_id integer NOT NULL REFERENCES riders (id),
    origin text NOT NULL,
    destination text NOT NULL,
    fare numeric(8,2) NOT NULL CHECK (fare >= 0),
    requested_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE replication_probe (
    id integer PRIMARY KEY,
    note text NOT NULL
);

CREATE VIEW ride_public AS
SELECT id, origin, destination, fare
FROM rides;

INSERT INTO accounts (owner_name, balance) VALUES
    ('Alice', 100.00),
    ('Bob', 50.00),
    ('Carla', 75.00),
    ('Diego', 10.00);

INSERT INTO app_users (username, password) VALUES
    ('alice', 'wonderland'),
    ('bob', 'builder'),
    ('carla', 'sunrise'),
    ('diego', 'tango');

INSERT INTO riders (name, email) VALUES
    ('Alice Chen', 'alice@example.com'),
    ('Bob Silva', 'bob@example.com'),
    ('Carla Mendes', 'carla@example.com');

INSERT INTO rides (rider_id, origin, destination, fare) VALUES
    (1, 'Harvard', 'Kendall', 18.50),
    (2, 'Back Bay', 'Logan Airport', 24.00),
    (3, 'Somerville', 'Fenway', 16.75);

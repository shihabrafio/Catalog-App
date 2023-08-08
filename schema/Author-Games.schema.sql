CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE games (
    id INT PRIMARY KEY,
    last_played_at TIMESTAMP,
    multiplayer BOOLEAN,
    FOREIGN KEY (id) REFERENCES items(id)
);
CREATE TABLE items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    publish_date DATE,
    FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
)
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL
    description  TEXT,
    budget  DECIMAL(10,2),
    release_date DATE,
    duration INT,
    director_id INT,
    country_id INT,
    poster_id INT,
    FOREIGN KEY (director_id) REFERENCES director(id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (poster_id) REFERENCES poster(id),
);
    
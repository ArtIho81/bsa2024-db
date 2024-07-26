CREATE TABLE character (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    role VARCHAR(20) NOT NULL CHECK (role IN ('leading', 'supporting', 'background')),
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES person(id)
);
CREATE TABLE movie_genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (genre_id, movie_id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
);
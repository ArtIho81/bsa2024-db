CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE file (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    file_key VARCHAR(255) NOT NULL UNIQUE,
    file_url VARCHAR(255) NOT NULL,
);

CREATE TABLE user_file (
    user_id INT,
    file_id INT,
    PRIMARY KEY (user_id, file_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (file_id) REFERENCES file(id)
);

CREATE TABLE director (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE country (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE poster (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    file_key VARCHAR(255) NOT NULL UNIQUE,
    file_url VARCHAR(255) NOT NULL,
);

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

CREATE TABLE favorite_movies (
    movie_id INT,
    user_id INT,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id),
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE movie_genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (genre_id, movie_id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
);

CREATE TABLE photo (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    file_key VARCHAR(255) NOT NULL UNIQUE,
    file_url VARCHAR(255) NOT NULL,
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    biography TEXT,
    birth_day DATE,
    gender VARCHAR(50),
    home_country_id INT NOT NULL,
    FOREIGN KEY (home_country_id) REFERENCES country(id),
    main_photo_id INT,
    FOREIGN KEY (main_photo_id) REFERENCES photo(id)
);

CREATE TABLE person_photo (
    person_id INT,
    photo_id INT,
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
);

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

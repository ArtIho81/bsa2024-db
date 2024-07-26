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


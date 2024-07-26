CREATE TABLE person_photo (
    person_id INT,
    photo_id INT,
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
);
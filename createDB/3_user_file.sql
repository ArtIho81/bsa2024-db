CREATE TABLE user_file (
user_id INT,
file_id INT,
PRIMARY KEY (user_id, file_id),
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (file_id) REFERENCES file(id)
);
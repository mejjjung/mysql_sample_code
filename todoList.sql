CREATE DATABASE todo;
use todo;

CREATE TABLE todo(
	userId INT NOT NULL,
    id INT NOT NULL,
    title VARCHAR(500),
    completed boolean
);

SELECT * FROM todo;
DELETE FROM todo;
INSERT INTO todo(userId, id, title, completed)
VALUES (1,1,'안녕하세요',false);

DELETE FROM todo
	WHERE id = 1;
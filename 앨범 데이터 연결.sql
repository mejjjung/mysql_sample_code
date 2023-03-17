CREATE DATABASE albums;
use albums;

DROP TABLE user;
CREATE TABLE user(
	userId INT,
    id INT NOT NULL,
    title VARCHAR(500)
);

SELECT * FROM user;
delete from user;
INSERT INTO album(userId, id, title)
VALUES 
	(1,1,'quidem molestiae enim');
    

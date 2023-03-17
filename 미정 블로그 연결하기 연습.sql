
CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDATE TIMESTAMP
);

SELECT * FROM user;

CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB,
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);

SELECT * FROM board;

CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);

INSERT INTO user(username,password,email,address,userRole,createDate)
VALUES ('김미정','2546','alwjd@naver.com','부산시 사하구','USER',now());

INSERT INTO user(username,password,email,address,userRole,createDate)
VALUES ('정다운','1111','ekdns@naver.com','부산','USER',now());

SELECT * FROM user;

SELECT * FROM board;

INSERT INTO board (title, content, userId)
VALUES ('짱구는 못말려','짱구의 일상',1);
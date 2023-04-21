CREATE DATABASE myshop;
use myshop;
SELECT * FROM user;

CREATE TABLE user;

CREATE TABLE user(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(300) NOT NULL
);

INSERT INTO user(Id,username, name, password, email,phone,address)
VALUES 
	(1,'jjungme','김미정',0525,'alwjd@naver.com','010-3307-2546','부산시 사하구'),
	(2,'jjanguu' ,'신짱구',1234,'jjangu@naver.com','010-1111-2222','서울시 떡잎마을'),
	(3,'rlacjftn' ,'김철수',5678,'kimsu@naver.com','010-2222-1111','서울시 철수마을'),
	(4,'yuriyuri' ,'유리',0101,'yuri@naver.com','010-3333-4444','서울시 토끼마을'),
    (5,'hunbalnom' ,'훈이',4444,'huni@naver.com','010-7890-3214','서울시 후니마을'),
    (6,'maengmaeng', '맹구',4321,'maengu@naver.com','010-9999-9999','서울시 맹구맹구');
SELECT * FROM user
WHERE userId = ? AND password = ? ;

INSERT INTO user(Id,username, name, password, email,phone,address)
VALUES (7,'hyoring', '김효린',0929,'hyoring@naver.com','010-2265-8611','부산시 해운댕'),
		(8,'jingjing', '손주이',0806,'jingjing@naver.com','010-6812-3812','부산시 사상구');
SELECT * FROM user
WHERE userId = 'jjanguu';
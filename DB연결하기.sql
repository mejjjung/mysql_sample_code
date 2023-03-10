
use shopdb;


CREATE TABLE user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL
);


CREATE TABLE blog(
	blog_id INT PRIMARY KEY,
    post_subject VARCHAR(50) NOT NULL,
    user_id INT,
    update_date DATE NOT NULL
);

CREATE TABLE reply(
	reply_id INT PRIMARY KEY AUTO_INCREMENT,
    blog_id INT,
    reply VARCHAR(1000),
    create_reply DATETIME NOT NULL,
    FOREIGN KEY (blog_id) REFERENCES blog(blog_id)
);

INSERT INTO user (user_id, user_name)
VALUES
	(1,'김미정'),
    (2,'신짱구'),
    (3,'봉미선'),
    (4,'신짱아');



INSERT INTO blog 
VALUES
		(1, 'food',1,'2023-03-10'),
		(2, 'java',2,'2023-01-10'),
		(3, 'travel',3,'2023-01-28');
        
INSERT INTO reply
VALUES
	(1,1,'맛있는 먹방' ,'2023-03-10 09:13:15'),
	(2,2,'재미있는 자바 공부' ,'2023-01-10 13:13:18'),
	(3,3,'여행 가기' ,'2023-01-28 20:13:18');
    

SELECT u.user_name, b.post_subject,b.update_date,r.reply,r.create_reply
FROM user AS u
INNER JOIN blog AS b
ON u.user_id = b.user_id
INNER JOIN reply AS r
ON b.blog_id = r.blog_id
WHERE u.user_name = '김미정';

SELECT * FROM user;
INSERT INTO user(user_id, user_name)
VALUES (5, '흰둥이');
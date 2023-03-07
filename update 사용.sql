
-- DROP TABLE member;
CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL
);

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

UPDATE member
SET address = '서울시 중구'
WHERE name =  '이철수';

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동2', 'hong@test.com', '010-1234-5678', '서울시 강남구');


-- id가 2인 회원의 이름과 전화번호를 각각 '임성준', '010-9876-5432'로 수정
UPDATE member
SET name = '임성준', phone = '010-9876-5432'
WHERE id = 2;

-- id가 5인 회원의 이메일과 주소를 각각 'leejaehyun@test.com', '서울시 강서구'로 수정
UPDATE member
SET email = 'leejaehyun@test.com', address = '서울시 강서구'
WHERE id = 5;

SELECT * FROM member;

-- DROP TABLE movie;

CREATE TABLE movie(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    director VARCHAR(20) NOT NULL,
    release_date VARCHAR(30) NOT NULL,
    genre VARCHAR(10) NOT NULL,
    rating DOUBLE NOT NULL
);

INSERT INTO movie(title, director, release_date, genre, rating)
VALUES
	('괴물','봉준호','2006-07-27','드라마',8.28),
    ('극한직업','이병헌','2019-01-23','코미디',9.20),
    ('명량','김한민','2014-07-30','사극',8.17),
    ('신과함께-죄와 벌','김용화','2017-12-20','판타지',7.56),
    ('밀양','임권택','2016-09-07','드라마',7.76),
    ('반도','연상호','2020-07-15','액션',6.71),
    ('베테랑','류승완','2015-08-05','액션',8.49),
    ('변호인','양우석','2013-12-18','드라마',8.41),
    ('군함도','류승완','2017-07-26','사극',8.01),
    ('암살','최동훈','2015-07-22','액션',8.37);
    
SELECT * FROM movie;

-- DROP TABLE product;

CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  description VARCHAR(200)
);

INSERT INTO product (id, name, price, description) 
VALUES
(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
(5, '아이패드', 800000, 'Apple의 태블릿'),
(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

SELECT * FROM product;

DELETE FROM product WHERE id = 5;
DELETE FROM product WHERE name = '맥북 에어';
-- 가격이 1,000,000원 이상인 제품 삭제
DELETE FROM product WHERE price >= 1000000;

-- id가 2 또는 3인 제품을 삭제
DELETE FROM product WHERE id IN(2,3);

-- Like 갤럭시
SELECT * FROM product WHERE name LIKE '갤럭시%';
DELETE FROM product WHERE name LIKE '갤럭시%';

-- 이름이 '에어팟 프로'이거나 설명이 '삼성'을 포함하는 제품 삭제
DELETE FROM product WHERE name = '에어팟 프로';
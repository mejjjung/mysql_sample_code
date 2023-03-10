
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 학생 : 수강 테이블에 관계는 1 : N
-- 과목 : 수강 테이블에 관계는 
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축해 보세요.
-- 여기서 사람, 도시에 관계를 관계차수 표현해보세요 
-- 한 사람이 여러 도시를 방문하고, 한 도시에 여러 사람이 방문을 한다. 
-- person , city , travel

CREATE TABLE person(
	person_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE city(
	city_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- 중간 테이블 만들기 
CREATE TABLE travel(
    person_id INT NOT NULL,
    city_id INT NOT NULL,
    trip_date DATE,
    PRIMARY KEY(person_id, city_id, trip_date),
    FOREIGN KEY(person_id) REFERENCES person(person_id),
    FOREIGN KEY(city_id) REFERENCES city(city_id)
);

INSERT INTO person VALUES
	(1,'김영희'),
    (2,'박철수'),
    (3,'이민호'),
    (4,'한지민'),
    (5,'송혜교');
INSERT INTO city VALUES
	(1, '서울'),
	(2, '부산'),
    (3, '제주'),
    (4, '홍콩'),
    (5, '도쿄');
INSERT INTO travel VALUES
	(1, 1, '2022-07-10'),
    (1, 2, '2022-07-10'),
    (2, 5, '2022-07-10'),
    (2, 4, '2022-07-10'),
    (3, 3, '2022-07-10'),
    (4, 5, '2022-07-10'),
    (1, 4, '2022-07-10');
SELECT * FROM travel;   

-- 문제 join 구문을 활용해서 문제 2문제씩 만들어 보세요 
-- 1. LEFT JOIN을 활용해서 여행자 이름, 도시 이름, 여행 날짜를 모두 출력해보세요
SELECT p.name, c.name, t.trip_date
FROM travel as t
LEFT JOIN person as p
ON t.person_id = p.person_id
LEFT JOIN city as c
ON t.city_id = c.city_id;

-- 2. INNER JOIN을 활용해서 김영희의 여행도시, 여행 날짜를 출력하세요
SELECT p.name, c.name, t.trip_date
FROM travel as t
INNER JOIN person as p
ON t.person_id = p.person_id
INNER JOIN city as c
ON t.city_id = c.city_id
WHERE p.name = '김영희';

-- 고객, 주문목록 --> 1 : N
-- 홍길동 --> 신발, 홍길동
--      --> 컴퓨터, 홍길동
-- 고객, 상품정보, 주문목록 --> N : M --> 중간 테이블 주문 목록
-- 주문 --      1(홍길동), 1(신발), "일자"

-- 테이블 설계 
-- 고객, 상품, 주문 목록

CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE product(
	product_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);



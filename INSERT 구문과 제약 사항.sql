
-- 데이터 저장 (한줄 주석)
/*
여러줄 주석
*/

-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);
desc student;

-- 기본 문구 모양
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES (값1, 값2);
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (3,'이영희',2,'경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (4, '티모', 1, '롤학과');


-- 테이블에 데이터를 삭제하는 명령어 사용해보기 
DELETE FROM student; -- 테이블 안에 있는 데이터만 삭제하는 명령어이다. 

-- 복수형으로 insert 쿼리문 작성하기 
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '이영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');
    
-- 복수형으로 데이터 3행을 넣어주세요 
INSERT INTO student(student_id, name, grade, major)
VALUE
	(1004, '김미정', 2, '경영학과'),
    (1005, '이영희2', 3, '수학과'),
    (1006, '박민수2', 1, '전자공학과');

-- insert 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
-- 데이터는 정상 저장되지 않는다.
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1007, '김철수3', 2, '컴퓨터공학과'),
    (1008, '이영희3', 3, '수학과'),
    (1008, '박민수3', 1, '전자공학과');
    
select * from student;

SELECT * FROM customer;
SELECT * FROM employee;

INSERT INTO customer(id, name, email, address)
VALUES
	(1,'김미정','mijeong@naver.com','부산시 사하구'),
    (2,'홍길동','gildong@gmail.com','부산시 부산진구'),
    (3,'홍길순','gilsoon@naver.com','부산시 해운대구'),
    (4,'김철수','cjftn@naver.com','부산시 해운대구'),
    (5,'이영희','dudgml@daum.com','부산시 부산진구');
    
INSERT INTO employee(id, name, age, department)
VALUES
(1,'김미정',27,'개발과'),
(2, '홍길동',30,'상담과'),
(3, '홍길순',29,'홍보과'),
(4, '김철수',48,'영상과'),
(5, '이영희',34,'비서과');

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);
SELECT * FROM product;

DROP TABLE product;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);
SELECT * FROM product;

INSERT INTO product(id, name, description)
VALUES (1, '사과','새빨간 예쁜 사과');

INSERT INTO product(id, name, description)
VALUES (2, '바나나','노란 바나나');

INSERT INTO product(id, name, description)
VALUES (3, '포도','동글동글 포도');

desc student;

-- 테이블 제약사항에 NULL 허용 의미와 NOT NULL 허용 의미

-- 이미 생성된 테이블 제약 사항 변경하기
ALTER TABLE student MODIFY grade INT NULL;

desc student;

INSERT INTO student(student_id, name, major)
VALUES(1, '홍길동','검술학과');

-- grade 제약을 NOT NULL 변경 해보기
-- 테이블 값이 하나 들어가 있는 상태
ALTER TABLE student MODIFY grade INT NOT NULL;

SELECT * FROM student;
-- 하나의 행을 삭제하는 쿼리 - WHERE절 (조건절) 
DELETE FROM student WHERE student_id = 1;

-- major 컬럼 제약을 NOT NULL 변경해 주세요
ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;

-- 컬럼 선언 부분을 생략도 가능하다. 단 전부 값을 넣을려고 하는 상황일 때 
INSERT INTO student VALUES(2, '홍길동2', 3,'검술학과');

-- insert 구문 컬럼명 선언 방식
-- 1. 전부 작성하는 방법alter
-- 2. 제약 사항이 null인 열이 있다면 넣고 싶은 열만 지정해서 구문을 작성할 수 있다. 
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언 부분을 생략 가능하다.

-- NOT NULL과 디폴트값 사용

DROP TABLE student;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL 
);

DESC student;

-- 디폴트 제약을 사용했을 때 값을 넣은 방법 1
INSERT INTO student(student_id, name, grade, major)
VALUES
	(1, 'John',3,'경영학과'),
    (2, 'Jane',2,'경영학과'),
    (3, 'Mike',1,'DEFAULT'),
    (4, 'David',2,'DEFAULT');
    
SELECT * FROM student;
-- 디폴트 제약을 사용했을 때 값을 넣은 방법 2

INSERT INTO student(student_id, name, grade)
VALUES
	(5,'홍길동1',2),
    (6,'홍길동2',3),
    (7,'홍길동3',1),
    (8,'홍길동4',3);
 
 -- professor 컬럼 제약 사항을 default로 추가 하고 값을 빈 문자열로 만들어 주세요 
 -- 빈 문자열의 의미는 ''
 CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);
SELECT * FROM subject;

-- 테이블이 생성 되어 있을 때 제약 변경 	default 구문 추가 
ALTER TABLE subject MODIFY professor VARCHAR(50) NOT NULL DEFAULT "";

SHOW CREATE TABLE `order`;

DROP TABLE `order`;

CREATE TABLE `order` (
	id INT PRIMARY KEY,
   customer_order VARCHAR(50) NOT NULL,
   product_name VARCHAR(20) NOT NULL,
   quantity INT NOT NULL,
   order_date DATE NOT NULL
);

-- 데이터를 입력하는 쿼리 구문을 작성해 주세요 
INSERT INTO `order` (id, customer_order, product_name, quantity, order_date) 
VALUES (1, '빠른 배송 바람', '신라면', 2, '2022-02-25');

SELECT * FROM `order`;

INSERT INTO `order` (id, customer_order, product_name, quantity, order_date) 
VALUES (2, '빠른 배송 바람', '신라면', 2, 20220225);

-- DATE 타입에 값을 넣을 때 작은따옴표나 큰따옴표를 사용해도 되고 
-- 정수값을 입력하여도 된다. 단 날짜 형식에 맞는 값이어야 한다. 
-- 1년은 12개월 인데 13이라는 값을 넣으면 알아서 오류를 일으켜 준다. 
INSERT INTO `order` (id, customer_order, product_name, quantity, order_date) 
VALUES (2, '빠른 배송 바람', '신라면', 2, 20222225);

INSERT INTO `order` (id, customer_order, product_name, quantity, order_date) 
VALUES (2, '빠른 배송 바람', '신라면', 2, '20222225');



DROP TABLE customer;

-- YYYY-MM-DD : mysql 기본 DATE의 데이터 타입 기본 포멧 
-- YYYY/MM/DD
-- YYYYMMDD

-- AUTO_INCREMENT 사용하기
-- 고객 테이블 생성

CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
); 

INSERT INTO customer(name, email, address)
VALUES
	('김철수','A@naver.com','서울시 강남구 역삼동'),
    ('박영희','B@naver.com','서울시 강동구 천호동'),
    ('김철수','A@naver.com','서울시 강남구 역삼동');
    
SELECT * FROM customer;
-- WHERE 사용해보기

-- 학과가 '컴퓨터공학과' 학생들의 이름과 학번을 조회하고 싶을 때 
-- 사용하는 쿼리문 작성해 보자.
SELECT * FROM student;

SELECT student_id, name 
FROM student
WHERE major = '컴퓨터공학과';

-- student 
-- 1. grade가 3인 학생들 조회 하기  (특정 데이터를 지정하지 않으면 전부 출력 - 컬럼)

SELECT *
FROM student
WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회 하기
SELECT * FROM student WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회하기 (BETWEEN)
SELECT * FROM student WHERE student_id BETWEEN 1 AND 10;

-- 4. 학과가 컴퓨터 공학과이고, 학년이 2학년인 학생들만 조회해줘
SELECT * FROM student WHERE major = '디자인학과' AND grade = 1;

-- 5. 학과가 컴퓨터공학과 이거나, 학년이 2학년인 학생들을 조회해줘alter
SELECT * FROM student WHERE major = '컴퓨터공학과' OR grade = 2;

-- 6. 학생 이름이 홍길동이 아닌 학생들을 조회하기
SELECT * FROM student WHERE name != '홍길동';

SELECT * FROM student WHERE name <> '홍길동';

-- 7. 학생들의 학년이 2학년 이상인 사람들을 조회하기
SELECT *
FROM student
WHERE grade >= 2;

-- 8. 학생들의 학년이 2학년 미만인 사람들을 조회
SELECT * FROM student WHERE grade < 2;

-- 9. 학년이 1학년 이거나 3학년, 4학년인 학생들 조회
SELECT * FROM student WHERE grade IN(1,3,4);

-- DROP TABLE subject;
-- DROP TABLE customer;

CREATE TABLE subject (
  subject_id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) NOT NULL
);


CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  address VARCHAR(100) NOT NULL
);

-- subject 테이블 샘플 데이터 

INSERT INTO subject (subject_id, subject_name, credit, department, professor)
VALUES
(1, '영어회화', 3, '외국어학과', '김영희'),
(2, '프로그래밍 기초', 3, '컴퓨터공학과', '박철수'),
(3, '데이터베이스 개론', 3, '컴퓨터공학과', '이승호'),
(4, '컴퓨터 시스템 개론', 3, '컴퓨터공학과', '홍길동'),
(5, '선형대수학', 3, '수학과', '김영수'),
(6, '미적분학', 3, '수학과', '박순영'),
(7, '국어문학사', 3, '국어국문학과', '최지혜'),
(8, '국어문법론', 3, '국어국문학과', '이상호'),
(9, '일본어회화', 3, '외국어학과', '김현진'),
(10, '중국어학', 3, '외국어학과', '최영식'),
(11, '미국사', 3, '사학과', '박영진');


-- customer 샘플 데이터 

INSERT INTO customer (id, name, email, address) VALUES
(1, '김철수', 'kim@example.com', '서울시 강남구'),
(2, '박영희', 'park@example.com', '서울시 서초구'),
(3, '이민수', NULL, '경기도 성남시 분당구'),
(4, '최영진', 'choi@example.com', '서울시 송파구'),
(5, '한미영', 'han@example.com', '경기도 수원시 장안구'),
(6, '강종현', 'kang@example.com', '서울시 강서구'),
(7, '신영수', 'shin@example.com', '경기도 의정부시'),
(8, '유승환', 'yoo@example.com', '경기도 부천시'),
(9, '서민지', 'seo@example.com', '서울시 종로구'),
(10, '임진우', 'lim@example.com', '경기도 안양시 동안구');

SELECT * FROM subject;
SELECT * FROM customer;

-- subject
-- 1. 과목 이름이 '미국사'인 데이텋를 조회하는 쿼리
SELECT * FROM subject WHERE subject_name = '미국사';
-- 2. 학점이 3점인 과목 데이터를 조회하는 쿼리
SELECT * FROM subject WHERE credit = 3;
-- 3. 국어국문학과에서 개설된 과목 데이터를 조회하는 쿼리 
SELECT * FROM subject WHERE department = '국어국문학과';
-- 4. 과목 이름이 '영어회화'이거나 교수명이 '이승호'인 과목 데이터를 조회하는 쿼리
SELECT * 
FROM subject 
WHERE subject_name = '영어회화' OR professor = '이승호';
-- 5. 과목 번호가 5보다 큰 데이터를 조회하는 쿼리
SELECT * FROM subject WHERE subject_id > 5;
-- 6. 과목 이름이 '데이터베이스 개론'이 아닌 데이터를 조회하는 쿼리
SELECT * FROM subject WHERE subject_name != '데이터베이스 개론';
-- mysql에 문자열 값을 다룰 때는 공백도 하나의 값으로 생각한다.

-- 7. 학과가 '컴퓨터공학과'이고 교수명이 '박철수'인 과목 데이터를 조회하는 쿼리 
SELECT * 
FROM subject 
WHERE department = '컴퓨터공학과' AND professor = '박철수';
-- 8. 교수명이 '김현진'이거나 '최영식'이면서(AND) 학과가 '외국어학과'인 과목 데이터를 조회하는 쿼리
SELECT *
FROM subject
WHERE professor IN ('김현진','최영식') AND department = '외국어학과';

SELECT *
FROM subject
WHERE (professor = '김현진' OR professor = '최영식')
      AND department = '외국어학과';
      
-- 습관적으로 검증 쿼리를 출력해 볼 수 있다.
SELECT * FROM subject WHERE professor = '홍길동';

DESC subject;

-- 1. 주소가 서울시 강남구인 사람을 조회하는 쿼리
SELECT * FROM customer WHERE address = '서울시 강남구';
-- 2. 이름이 '임진우'이거나 주소가 '경기도 부천시'인 사람을 조회하는 쿼리
SELECT * 
FROM customer 
WHERE name = '임진우' OR address = '경기도 부천시';
-- 3. email이 NULL인 사람을 조회하는 쿼리
SELECT * 
FROM customer
WHERE email IS NULL;
-- 4. 주소가 서울시 송파구가 아닌 사람을 조회하는 쿼리
SELECT * 
FROM customer
WHERE address <> '서울시 송파구';
-- 5. id가 4보다 큰 데이터를 조회하는 쿼리
SELECT *
FROM customer 
WHERE id > 4;

-- 1. 강남 3구 사는 사람들을  조회(서초구,송파구,강남구)
SELECT * FROM customer WHERE address LIKE '서울시%';
-- 2. email을 입력하지 않은 사람의 데이터를 출력하세요
SELECT * FROM customer WHERE email IS NULL;
-- 3. id가 5이상이며 주소가 서울시에 거주하는 사람 이름을 검색해라 
--    단, 서울시는 다음과 같은 주소가 있다  강남구, 서초구, 송파구, 강서구 종로구
SELECT name
FROM customer
WHERE id >= 5 
AND address LIKE '서울시%';
-- 4. email이 NULL인 사람을 조회하는 쿼리 (IS NULL 을 사용해보세요)
SELECT * FROM customer WHERE email IS NULL;
-- 5. 이메일이 NULL 이 아니고 주문 번호가 2번이 넘으며 종로구에 사시는분은
SELECT *
FROM customer
WHERE email IS NOT NULL 
AND id > 2 
AND address = '서울시 종로구';
-- 6. 주소가 '서울'이면서 id가 5이하인 고객 조회하는 쿼리
SELECT *
FROM customer
WHERE
 address LIKE '서울%'
AND id <= 5;
-- 7. 서울시에 사는 고객들을 조회하는 쿼리 (LIKE 사용해보기) 
SELECT *
FROM customer
WHERE address LIKE '서울%';
-- 8. 아이디가 3에서 8까지의 사람 중 '경기도 의정부'에 거주하고 있는 사람 중 이메일을 입력한 사람을 출력하시오
SELECT *
FROM customer
WHERE id between 3 AND 8
AND address = '경기도 의정부시'
AND email IS NOT NULL;

-- DROP TABLE `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  order_name VARCHAR(20) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);


INSERT INTO `order` (id, order_name, product_name, quantity, order_date) 
VALUES
(1, '홍길동', '피자', 2, '2022-02-26'),
(2, '김영희', '치킨', 3, '2022-02-26'),
(3, '이철수', '햄버거', 1, '2022-02-27'),
(4, '박지민', '스테이크', 2, '2022-02-27'),
(5, '최영희', '짬뽕', 1, '2022-02-27'),
(6, '박서준', '초밥', 3, '2022-02-28'),
(7, '김민지', '파스타', 2, '2022-02-28'),
(8, '정재은', '토스트', 1, '2022-02-28'),
(9, '신은주', '감바스', 2, '2022-03-01'),
(10, '유지훈', '돈까스', 1, '2022-03-01');

SELECT * FROM `order`;
desc `order`;
-- DELETE FROM `order`;

-- UPDATE 구문을 사용할 때는 천천히 WHERE 확인하기 
-- 1. id가 1인 주문의 상품 수량을 5개로 수정 
UPDATE `order`
SET quantity = 5
WHERE id = 1;

-- 2. id가 3인 사람의 메뉴를 '감바스'로 수정
UPDATE `order`
SET product_name = '감바스'
WHERE id = 3;

-- 3. id가 5인 주문의 주문 일자를 '2022-01-05'로 수정
-- update 구문에 DATE 타입 값 입력시에는 작은 따옴표로 감싸주기
UPDATE `order`
SET order_date = '2022-01-05'
WHERE id = 5;

-- 테이블 구조를 변경해 보기 : 컬럼 추가하는 방법
-- ALTER TABLE `order` ADD COLUMN address VARCHAR(100);
ALTER TABLE `order` ADD address VARCHAR(100);

-- 주문 수량이 2개 이상이고, 상품명이 '피자'인 주문의 수령인 이름을 '김철수'로 수정
UPDATE `order`
SET order_name = '김철수'
WHERE quantity >= 2 
	AND product_name = '피자';
-- 주문 날짜가 '2022-02-28'이고, 상품명이 '초밥'인 주문의 주문 수량을 5개로 수정
UPDATE `order`
SET quantity = 5
WHERE order_date = '2022-02-28' 
	AND product_name = '초밥';
-- 주문 수량이 1개 이하이고, 상품명이 '감바스'인 주문의 수령인 주소를 '경기도 성남시'로 수정
UPDATE `order`
SET address = '경기도 성남시'
WHERE quantity <= 1 AND product_name = '감바스';
-- ---------------------
SELECT * FROM `order`;

CREATE DATABASE shopdb;
use shopdb;

CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);

-- 스키마 구조화 변경 복습
ALTER TABLE userTBL MODIFY mobile VARCHAR(13);
DESC userTBL;

CREATE TABLE buyTBL(
	username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(username) REFERENCES userTBL(username)
);

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

-- 에러 발생
-- 부모 테이블 userTBL에 현재 야스오는 없는 사람이기 때문에 존재할 수 없다.
insert into buyTBL values('야스오', '책', 10, 3);

SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- inner join
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- left join
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- 야스오 회원 가입 함
INSERT INTO userTBL(username, birthYear, addr, mobile)
VALUES('야스오',2020,'부산','010-1234-1234');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 다시 inner join 작성
SELECT * 
FROM userTBL AS U
inner join buyTBL AS B
ON U.username = B.username;

-- AS 사용해서 LEFT JOIN , IS NOT NULL 작성
SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과 집합이 다를 수 있다. 
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다
SELECT * 
FROM buyTBL as b
LEFT JOIN userTBL as u
ON b.username = u.username;

-- right join
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL as u
RIGHT JOIN buyTBL as b
ON u.username = b.username;

-- 문제 작성 3문제 씩
-- 1. LEFT JOIN을 사용해서 username과 prodname만 나오게 하고 
--    NULL 값은 나오지 않게 하세요
SELECT u.username, b.prodname
FROM userTBL as u
LEFT JOIN buyTBL as b
ON u.username = b.username
WHERE b.username IS NOT NULL;

-- 2. 기준 테이블을 userTBL로 하고 이름, 상품이름, 가격, 구매수량, 전화번호를 출력하고 
--    NULL 값은 제외하라
SELECT u.username, b.prodname, b.price, b.amount, u.mobile, b.price
FROM userTBL as u
LEFT JOIN buyTBL as b
ON u.username = b. username
WHERE b.username IS NOT NULL;

-- 3. inner join을 사용해서 성이 이씨이면서 주소가 대구인 사람의 구매 정보를 출력해라
SELECT *
FROM userTBL as u
INNER JOIN buyTBL as b
ON u.username = b.username
WHERE b.username LIKE '이%' AND u.addr = '대구';

 
 -- 1. 성이 이씨이면서 태어난 년도가 1999년인 구매한 구입 금액을 표시해주세요
 SELECT prodName, (b.price * b.amount) AS '총 구입금액'
 FROM userTBL as u
 INNER JOIN buyTBL as b
 ON u.username = b.username
 WHERE u.username LIKE '이%' AND u.birthYear = 1999;
 
 -- 2. 기준 테이블은 userTBL로 하고 LEFT JOIN을 사용하여 
 --    주문자 이름과, 주소, 전화번호, 상품 이름, 가격, 주문 수량 을 출력해보자 
 --    (단, 주문 정보가 없는 경우 출력하지 않는다.)
 SELECT u.username, u.addr, b.prodName, b.price, b.amount
 FROM userTBL as u
 LEFT JOIN buyTBL as b
 ON u.username = b.username
 WHERE b.username IS NOT NULL;
 
 -- 3. LEFT JOIN 을 사용하여 NULL 값도 확인할 수 있게 출력 
 SELECT *
 FROM userTBL as u
 LEFT JOIN buyTBL as b
 ON u.username = b.username;
 
 -- 4. userTBL 기준으로 INNER JOIN하고 
 --    buyTBL에서 수량이 3개 이상인 데이터만 조회해라
 SELECT b.amount
 FROM userTBL as u
 INNER JOIN buyTBL as b
 ON u.username = b.username
 WHERE b.amount >= 3;
 
 -- 5. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 
 --    userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT *
FROM buyTBL as b
RIGHT JOIN userTBL as u
ON u.username = b.username
WHERE u.username = '이승기' OR u.username = '야스오';

 -- 6. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고, 
 --    1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
 SELECT b.amount
 FROM buyTBL as b
 LEFT JOIN userTBL as u
 ON u.username = b.username
 WHERE u.birthYear = 1999;
 
 -- 7. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, 
 --    '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
 SELECT u.username, u.mobile
 FROM userTBL as u
 INNER JOIN buyTBL as b
 ON u.username = b.username
 WHERE b.prodname = '책';
 
 -- 8. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고, 
 --    '대구'에 사는 사람이 구매한 물품들을 출력하시오.
 SELECT *
 FROM buyTBL as b
 RIGHT JOIN userTBL as u
 ON b.username = u.username
 WHERE u.addr = '대구';
 
 
SELECT 'aaaa';

-- 함수 사용해 보기
SELECT u.username, b.prodName
FROM userTBL as u
RIGHT JOIN buyTBL as b
ON u.username = b.username;
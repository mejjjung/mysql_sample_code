/*
NOW(), CURDATE(), CURTIME(), YEAR(), MONTH(), DAY(), HOUR()
*/

SELECT CURDATE();

-- String Function
SELECT ASCII('U');

-- 문자열 길이
SELECT char_length('my sql test');
-- 문자열 더해주는 함수
SELECT concat("green","class","   100%") AS title;
-- 문자열 사이마다 -> 입력
SELECT concat_ws("->","class","mysql","홍길동");
-- 포함된 문자 찾아주는 함수
SELECT find_in_set('q','s,q,l');
-- 소수점 몇번째까지 출력하라 
SELECT format(2500.123,0);
-- 소문자로 바꿔주는 함수
SELECT lcase('HELLO JAVA');
-- 대문자로 바꿔누는 함수
SELECT ucase('hello java');
-- 양 끝에 공백 제거해주는 함수 
SELECT trim('  MY S Q L ');
-- 값의 공백을 빈 공백으로 처리 
SELECT replace('  MY S Q L ',' ', '');

CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);

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



-- MySql Numberic function
SELECT * FROM buyTBL;

-- 더하기 
SELECT *, sum(price) as '상품가격의 총 합' FROM buyTBL;
SELECT *, (SELECT SUM(price) FROM buyTBL) AS 총합계
FROM
buyTBL;

-- avg 평균값 계산
SELECT *, avg(price) as '상품평균가격'
FROM buyTBL;

SELECT *, ( select avg(price) from buyTBL) as 평균값
FROM buyTBL;
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
-- 올림 함수
SELECT ceil(25.12);
-- 반올림 함수
SELECT round(123.56,1); 
-- 버림 함수
SELECT floor(25.75);
-- 가장 큰 값 출력
SELECT max(price)
FROM buyTBL;
-- 가장 작은 값 출력
SELECT min(price)
FROM buyTBL;

SELECT prodName, min(price)
FROM buyTBL;








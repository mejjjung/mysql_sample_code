
desc employees;

SELECT * FROM buytbl;
SELECT * FROM usertbl;

DESC usertbl;
desc buytbl;

INSERT INTO 
	usertbl(username, birthYear, addr, mobile)
VALUES ('티모','2000','대구','010-1234-1234');

INSERT INTO
	buytbl(username, prodName, price, amount)
VALUES ('신짱구','자동차',15000000,1);

SELECT * FROM usertbl;

UPDATE usertbl
	SET birthYear = '1999', addr = '천안',mobile = '010-2222-2222'
    WHERE username = '유진스';
    
    
UPDATE buytbl
	SET prodName = '후드티', price = 45000, amount = 2
    WHERE username = '유진스';

DELETE FROM usertbl
WHERE username = '티모';

-- 구매테이블에 데이터 입력할 때 유저 테이블에 이름이 없으면 입력 안됨 !!
-- 구매 테이블
SELECT * FROM buytbl;

UPDATE buytbl
SET prodName = '뼈다귀',price = 500, amount = 3
WHERE prodName = '뼈다귀';

-- 자식 테이블에 데이터를 먼저 삭제하고 부모테이블에 정보를 삭제할 수 있다.

DELETE From buytbl
WHERE username = '유진스';

INSERT INTO
	buytbl ( username, prodName, price, amount)
VALUES
	('흰둥이','뼈다귀',100,2);
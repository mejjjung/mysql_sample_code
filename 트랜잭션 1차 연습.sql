
-- 트랜잭션 처리해보기

START TRANSACTION;

insert into user_tb(username, password, fullname)
values ('john','1234','kim');

insert into user_tb(username, password, fullname)
values ('Mike','2222','Lee');

ROLLBACK;
SELECT * FROM user_tb;

COMMIT;
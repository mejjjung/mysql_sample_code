/*
	계좌 간 이체 
    계좌 A의 잔액은 3,000원 입니다.
    계좌 B의 잔액은 0원 입니다.
    계좌 A에서 B로 3,000원 이체 하기
*/
-- 테스트를 위한 설정 
UPDATE account_tb SET balance = 3000 WHERE id = 1;
UPDATE account_tb SET balance = 0 WHERE id = 2;

SELECT * FROM account_tb;
select * from history_tb;

START TRANSACTION;
UPDATE account_tb set balance = balance - 3000 where id = 1;
UPDATE account_tb set balance = balance + 3000 where id = 2;

insert into history_tb(amount, w_balance, d_balance, 
					   w_account_id, d_account_id)
values(3000, 
	(SELECT balance from account_tb where id = 1),
	(SELECT balance from account_tb where id = 2),
	1, 2);
COMMIT;
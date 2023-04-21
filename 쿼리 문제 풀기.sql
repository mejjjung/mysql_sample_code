use bank;
select * from history_tb;
select * from account_tb;
select * from user_tb;
-- history_tb 에서 입금 내역과 입금 계좌 번호를 join 을 사용해서 출력 하시오 
SELECT h.*, a.number AS '입금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE d_account_id IS NOT NULL;
-- history_tb 에서 출금 내역과 출금 계좌 번호를 join 을 사용해서 출력 하시오 
select h.*, a.number AS '출금 계좌번호'
FROM history_tb as h
left join account_tb as a
on h.w_account_id = a.id
WHERE w_account_id is not null;
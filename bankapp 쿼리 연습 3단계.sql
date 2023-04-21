
-- d_account_id 표시 하기 --> 계좌 번호로 표시 하고 싶어요
-- 1번 계좌 출금 내역 
select h.id, h.amount, h.w_balance,
	   wa.number as sender, ifnull(h.d_account_id, 'ATM') as receiver,
       da.number 
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da 
on h.d_account_id = da.id
where h.w_account_id = 1;

-- 계좌에 입금 내역 + 출금 계좌 번호(이체시)
select h.id, h.amount, h.d_balance, h.created_at,
	   da.number as receiver, ifnull(h.w_account_id, 'ATM') as sender,
       da.number 
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa 
on h.w_account_id = wa.id
where h.d_account_id = 2;

-- 출금 내역 + 입금 내역
select h.id, h.amount, h.d_balance, h.created_at,
	     da.number as recevier,
       ifnull(h.w_account_id, 'ATM') as sener, 
       wa.number 
from history_tb as h 
left join account_tb as da
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id
where h.d_account_id = 1 or h.w_account_id = 1;
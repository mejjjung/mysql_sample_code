CREATE DATABASE bank;
use bank;

-- 유저 테이블 설계해 보기
CREATE TABLE user_tb(
	id int AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) not null UNIQUE,
    password VARCHAR(30) not null, 
    fullname VARCHAR(50) not null,
    created_at TIMESTAMP not null DEFAULT now()
);

-- 사용자의 계좌 정보 테이블 설계 
CREATE TABLE account_tb(
	id int AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) not null UNIQUE,
    password VARCHAR(20) not null,
    balance BIGINT not null COMMENT '계좌 잔액',
    user_id int,
    created_at TIMESTAMP not null DEFAULT now()
);

-- 입금 내역 저장
-- 출금 내역 저장
-- 사용자 간 이체 내역 저장


-- 사용자들의 history 테이블 설계 
-- BIGINT 8인트 크기에 정수형
-- 조(10에 12) --경(10에 16승) --해(10에 20승)
-- 자(10에 24) --양(10에 28)

CREATE TABLE history_tb(
	id int AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역',
    amount BIGINT not null COMMENT '거래 금액',
    w_account_id int COMMENT '출금 계좌 id',
    d_account_id int COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌에 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌에 잔액',
    created_at TIMESTAMP not null DEFAULT now()
);

-- 유저 샘플 데이터 
INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234',
'고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234',
'애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234',
'마이', now());
select * from user_tb;

-- 계좌 테이블 샘플 데이터 
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());
select * from account_tb;

-- 히스토리 추적 내용 (이체, 입금, 출금)
-- 히스토리 테이블에 insert 구문을 작성
-- 이체 내역을 기록 (1번 계좌, 2번 계좌에 100원을 이체 한다.)
INSERT INTO history_tb(amount, w_balance, d_balance,
			w_account_id, d_account_id, created_at)
VALUES (100, 900, 1100, 1, 2, now());
select * from history_tb; 

-- 출금 내역 (1번 계좌에서 100원을 출금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance,
			w_account_id, d_account_id, created_at)
VALUES (100, 800, null, 1, null, now());

-- 입금 내역(1번 계좌에 500원 입금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance,
			w_account_id, d_account_id, created_at)
VALUES (500, null, 700, null, 1, now());

alter table history_tb AUTO_INCREMENT = 1;
select * from history_tb;

-- 출금 내역 (3번이 1000원을 출금, 잔액은 0원인 상태를 거래 내역 기록)
INSERT INTO history_tb(amount, w_balance, d_balance,
			w_account_id, d_account_id, created_at)
VALUES (1000, 1000, null, 3, null, now());

select * from history_tb;
-- 문제 1. history_tb 에서 계좌 id 1번인 입금 내역 쿼리 만드시오 select 
SELECT id, amount ,d_account_id FROM history_tb
WHERE d_account_id=1;
-- 문제 2. history_tb 에서 계좌 id 1번인 출금 내역 만드시오 select 
SELECT * from history_tb where w_account_id=1 AND d_account_id is null;
-- 문제 3. history_tb 에서 계좌 id 1번인 입출금 쿼리를 만드시오 select 
SELECT * FROM history_tb WHERE w_account_id=1 or d_account_id=1;
/*
    날짜 : 2025/08/12
    이름 : 한탁원
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1
SELECT * FROM ACCOUNT;

UPDATE ACCOUNT SET acc_balance = acc_balance - 10000 
WHERE acc_no = '101-13-1002';

UPDATE ACCOUNT SET acc_balance = acc_balance + 10000 
WHERE acc_no = '101-13-1003';

-- 작업확정
commit;

SELECT * FROM ACCOUNT;

-- 실습 8-2/*
    날짜 : 2025/08/12
    이름 : 한탁원
    내용 : 9장 트랜잭션 실습
*/

-- 실습 8-1
SELECT * FROM ACCOUNT;

UPDATE ACCOUNT SET acc_balance = acc_balance - 10000 
WHERE acc_no = '101-13-1002';

UPDATE ACCOUNT SET acc_balance = acc_balance + 10000 
WHERE acc_no = '101-13-1003';

-- 작업확정
commit;

SELECT * FROM ACCOUNT;

-- 실습 8-2
UPDATE ACCOUNT SET acc_balance = acc_balance - 10000 
WHERE acc_no = '101-13-1002';

UPDATE ACCOUNT SET acc_balance = acc_balance + 10000 
WHERE acc_no = '101-13-1003';

-- 작업 취소
rollback;

SELECT * FROM ACCOUNT;

-- 실습 8-3
show autocommit;

set autocommit on;


-- 작업 취소
rollback;

SELECT * FROM ACCOUNT;

-- 실습 8-3
show autocommit;

set autocommit on;

UPDATE ACCOUNT SET acc_balance = acc_balance - 10000 
WHERE acc_no = '101-13-1002';

UPDATE ACCOUNT SET acc_balance = acc_balance + 10000 
WHERE acc_no = '101-13-1003';

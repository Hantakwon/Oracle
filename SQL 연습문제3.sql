/*
    날짜 : 2025/07/22
    이름 : 한탁원
    내용 : SQL_연습문제3
*/

-- 실습 3-1.
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER bank IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO bank;

-- 실습 3-2.
DROP TABLE CUSTOMER;
create table CUSTOMER (
    C_ID    VARCHAR2(14) PRIMARY KEY,
    C_NAME  VARCHAR2(20) NOT NULL,
    C_TYPE  NUMBER(1)   NOT NULL,
    C_HP    VARCHAR2(14) UNIQUE NOT NULL,
    C_ADDR  VARCHAR2(100)
);

DROP TABLE ACCOUNT;
create table ACCOUNT (
    ACC_NO CHAR(11) PRIMARY KEY,
    ACC_TYPE CHAR(2) NOT NULL,
    ACC_NAME VARCHAR2(20) NOT NULL,
    ACC_CID VARCHAR2(14) NOT NULL,
    ACC_BALANCE NUMBER DEFAULT 0,
    ACC_DATE DATE NOT NULL,
    FOREIGN KEY (ACC_CID) REFERENCES CUSTOMER (C_ID)
);

DROP TABLE TRANSACTION;
create table TRANSACTION (
    TR_NO NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    TR_ACC CHAR(11) NOT NULL,
    TR_TYPE NUMBER(1) NOT NULL,
    TR_AMOUNT NUMBER DEFAULT 0,
    TR_DATE DATE NOT NULL,
    FOREIGN KEY (TR_ACC) REFERENCES ACCOUNT (ACC_NO)
);


DROP TABLE TRANSACTION;
DROP TABLE ACCOUNT;
DROP TABLE CUSTOMER;

-- 실습 3-3.
INSERT INTO CUSTOMER VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
INSERT INTO CUSTOMER VALUES ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
INSERT INTO CUSTOMER VALUES ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
INSERT INTO CUSTOMER VALUES ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
INSERT INTO CUSTOMER VALUES ('910913-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
INSERT INTO CUSTOMER VALUES ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');
INSERT INTO CUSTOMER VALUES ('220-83-52237', '(주)한국산업', 2, '031-1234-1045', '서울시 강서구');
INSERT INTO CUSTOMER VALUES ('361-23-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
INSERT INTO CUSTOMER VALUES ('103-23-51094', '부산의원', 2, '051-518-1010', '부산시 남구');

INSERT INTO ACCOUNT VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, TO_TIMESTAMP('2005-07-21 12:10:03', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-13-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, TO_TIMESTAMP('2011-05-13 13:20:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, TO_TIMESTAMP('2007-03-17 21:54:06', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-21-1004', 'L1', '고객신용대출', '910913-2000005', 1200500, TO_TIMESTAMP('2009-08-25 14:34:57', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, TO_TIMESTAMP('2003-10-15 19:56:34', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-23-1006', 'L2', '예금담보대출', '730423-1000001', 250000, TO_TIMESTAMP('2013-12-11 18:14:22', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-23-1007', 'L2', '주택담보대출', '750210-1000002', 2700000, TO_TIMESTAMP('2009-09-23 09:19:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-11-2001', 'S1', '자유저축예금', '220-83-52237', 23000000, TO_TIMESTAMP('2003-04-14 11:02:43', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-11-2002', 'S1', '자유저축예금', '361-23-42687', 4201000, TO_TIMESTAMP('2008-12-30 12:32:59', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO ACCOUNT VALUES ('101-11-2003', 'S1', '자유저축예금', '103-23-51094', 8325010, TO_TIMESTAMP('2010-06-07 15:47:04', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-1001', 1, 50000, '2025-07-12 13:55:31');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-1003', 1, 120000, '2025-07-12 14:15:22');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-2001', 2, 300000, '2025-07-19 17:53:42');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-12-1002', 1, 1000000, '2025-07-20 07:25:08');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-1001', 0, 0, '2025-07-20 09:21:13');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-13-1005', 1, 200000, '2025-07-20 10:15:02');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-1001', 1, 450000, '2025-07-20 11:34:42');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-2002', 2, 32000, '2025-07-21 09:12:37');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-2003', 0, 0, '2025-07-21 16:02:31');
INSERT INTO transaction (tr_acc, tr_type, tr_amount, tr_date) VALUES ('101-11-1003', 1, 75000, '2025-07-21 17:41:11');

-- 실습 3-4.
SELECT * FROM ACCOUNT;

-- 실습 3-5.
SELECT * FROM CUSTOMER;

-- 실습 3-6.
SELECT * FROM TRANSACTION;

-- 실습 3-7.
SELECT c_name, c_id FROM CUSTOMER;

-- 실습 3-8.
SELECT acc_type, acc_name FROM ACCOUNT;

-- 실습 3-9.
SELECT DISTINCT acc_type, acc_name FROM ACCOUNT;

-- 실습 3-10.
SELECT * FROM ACCOUNT WHERE acc_balance >= 1000000;

-- 실습 3-11.
SELECT * FROM CUSTOMER WHERE c_addr like '경기도 %';

-- 실습 3-12.
SELECT * FROM CUSTOMER WHERE c_type = 2;

-- 실습 3-13.
SELECT * FROM TRANSACTION WHERE tr_type = 1;

-- 실습 3-14.
SELECT * fROM TRANSACTION WHERE tr_type = 2 ORDER BY tr_amount DESC;

-- 실습 3-15.
SELECT SUM(tr_amount) AS 입금총합, AVG(tr_amount) AS 입금평균 FROM TRANSACTION WHERE tr_type=1; 

-- 실습 3-16.
SELECT MAX(tr_amount) AS "큰 금액", MIN(tr_amount) AS "작은 금액" FROM TRANSACTION WHERE tr_type=2; 

-- 실습 3-17.
SELECT * FROM ACCOUNT WHERE acc_name = '자유저축예금' AND acc_balance >= 1000000 ORDER BY acc_balance DESC;

-- 실습 3-18.
SELECT * FROM ACCOUNT WHERE acc_name = '자유저축예금' ORDER BY acc_balance DESC FETCH FIRST 1 ROWS ONLY;

-- 실습 3-19.
SELECT * FROM TRANSACTION WHERE tr_amount != 0 ORDER BY tr_type, tr_amount DESC;

-- 실습 3-20.
SELECT 
    COUNT(CASE WHEN tr_type = 0 THEN 1 END) AS "조회 건수",
    COUNT(CASE WHEN tr_type = 1 THEN 1 END) AS "입금 건수",
    COUNT(CASE WHEN tr_type = 2 THEN 1 END) AS "출금 건수"
FROM TRANSACTION;

-- 실습 3-21.
SELECT
    tr_type,
    CASE
        WHEN tr_type = 0 THEN '조회'
        WHEN tr_type = 1 THEN '입금'
        WHEN tr_type = 2 THEN '출금'
    END AS "거래종류",
    tr_acc,
    tr_amount
FROM TRANSACTION;

-- 실습 3-22.
SELECT tr_type, COUNT(tr_no) FROM TRANSACTION GROUP BY tr_type;

-- 실습 3-23.
SELECT 
    tr_acc,
    tr_type,
    SUM(tr_amount) AS 합계
FROM TRANSACTION
WHERE tr_type =1
GROUP BY tr_acc, tr_type
HAVING SUM(tr_amount) >= 100000
ORDER BY SUM(tr_amount) DESC;

-- 실습 3-24.
SELECT 
    tr_acc,
    COUNT(*) AS 거래건수,
    SUM(tr_amount) AS 총거래금액
FROM TRANSACTION
WHERE tr_type = 1 OR tr_type = 2 
GROUP BY tr_acc, tr_type
HAVING SUM(tr_amount) >= 100000
ORDER BY SUM(tr_amount) DESC
OFFSET 1 ROWS FETCH NEXT 2 ROWS ONLY;

-- 실습 3-25.
SELECT 
    acc_no,
    acc_name,
    c_id,
    c_name,
    acc_balance,
    acc_date
FROM CUSTOMER c
JOIN ACCOUNT a ON c.c_id = a.acc_cid;

-- 실습 3-26.
SELECT
    acc_no AS 계좌번호,
    acc_name AS 계좌이름,
    c_id AS "주민번호(사업자번호)",
    c_name AS 고객명,
    acc_balance AS 현재잔액
FROM CUSTOMER c
JOIN ACCOUNT a ON c.c_id = a.acc_cid
WHERE acc_balance >= 1000000
ORDER BY acc_balance DESC;

-- 실습 3-27.
SELECT 
    tr_no,
    tr_acc,
    acc_cid,
    tr_type,
    tr_amount,
    tr_date
FROM ACCOUNT a
JOIN TRANSACTION t ON a.acc_no = t.tr_acc;

-- 실습 3-28.
SELECT
    a.acc_no,
    c.c_name,
    SUM(CASE WHEN t.tr_type =1 THEN t.tr_amount ELSE 0 END) AS 총입급액,
    SUM(CASE WHEN t.tr_type =2 THEN t.tr_amount ELSE 0 END) AS 총출금액
FROM TRANSACTION t
RIGHT JOIN ACCOUNT a ON t.tr_acc = a.acc_no
JOIN CUSTOMER c ON a.acc_cid = c.c_id
WHERE c.c_type =1
GROUP BY a.acc_no, c.c_name;

-- 실습 3-29.
SELECT
    a.ACC_NO,
    a.ACC_CID,
    a.ACC_NAME,
    c.C_NAME,
    a.ACC_BALANCE +
        SUM(CASE WHEN t.TR_TYPE = 001 THEN t.TR_AMOUNT ELSE 0 END) -
        SUM(CASE WHEN t.TR_TYPE = 002 THEN t.TR_AMOUNT ELSE 0 END) AS 최종잔액

FROM
    ACCOUNT a
LEFT JOIN
    TRANSACTION t ON a.ACC_NO = t.TR_ACC
JOIN
    CUSTOMER c ON a.ACC_CID = c.C_ID
WHERE
    C_TYPE = 1
GROUP BY
    a.ACC_NO,
    a.ACC_CID,
    a.ACC_NAME,
    a.ACC_BALANCE,
    c.C_NAME
ORDER BY
    a.ACC_NO;
    
-- 실습 3-30.
SELECT
    c.C_NAME,
    a.ACC_NO,
    t.TOTAL_DEPOSIT,
    c.C_ADDR
FROM
    ACCOUNT a
    JOIN CUSTOMER c ON a.ACC_CID = c.C_ID
    JOIN (
        SELECT
            TR_ACC,
            SUM(TR_AMOUNT) AS TOTAL_DEPOSIT
        FROM TRANSACTION
        WHERE TR_TYPE = 1
        GROUP BY TR_ACC
    ) t ON a.ACC_NO = t.TR_ACC
WHERE
    t.TOTAL_DEPOSIT = (
        SELECT
            MAX(SUM_AMOUNT)
        FROM (
            SELECT
                TR_ACC,
                SUM(TR_AMOUNT) AS SUM_AMOUNT
            FROM TRANSACTION
            WHERE TR_TYPE = 1
            GROUP BY TR_ACC
    )
);
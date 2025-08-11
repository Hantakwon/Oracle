INSERT INTO bank_customer VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
INSERT INTO bank_customer VALUES ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
INSERT INTO bank_customer VALUES ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
INSERT INTO bank_customer VALUES ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
INSERT INTO bank_customer VALUES ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

INSERT INTO bank_account VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
INSERT INTO bank_account VALUES ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
INSERT INTO bank_account VALUES ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
INSERT INTO bank_account VALUES ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14');
INSERT INTO bank_account VALUES ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');

INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1001', 1, 50000, '2023-01-01 13:15:10');
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-12-1001', 2, 1000000, '2023-01-02 13:15:12');
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1002', 3, 260000, '2023-01-03 13:15:14');
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1002', 2, 100000, '2023-01-04 13:15:16');
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1003', 3, 75000, '2023-01-05 13:15:18');
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1001', 1, 150000, '2023-01-05 13:15:28');

SELECT * FROM bank_transaction;

SELECT c.c_no, c.c_name, c.c_phone, a.a_no, a.a_item_name, a.a_balance 
FROM bank_customer c JOIN bank_account a ON c.c_no = a.a_c_no;

SELECT t_dist, t_amount, t_datetime 
FROM bank_transaction 
WHERE t_a_no = (SELECT a_no FROM bank_account
                WHERE a_c_no = (SELECT c_no FROM bank_customer
                                WHERE c_name = '이순신'));
                                
SELECT c.c_no, c.c_name, a.a_no, a.a_balance, a.a_open_date
FROM bank_customer c JOIN bank_account a ON c.c_no = a.a_c_no
WHERE a.a_no = (SELECT a_no FROM bank_account
                WHERE a_balance = (SELECT MAX(a_balance) FROM bank_account 
                                    WHERE a_c_no IN (SELECT c_no FROM bank_customer
                                                     WHERE c_dist = 1)));

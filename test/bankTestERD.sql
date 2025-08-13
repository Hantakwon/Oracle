-- 작업 2
-- Cusomter
INSERT INTO Customer VALUES ('760121-1234567', '정우성', '서울', '1976-01-21', NULL, '010-1101-7601', '배우');
INSERT INTO Customer VALUES ('750611-1234567', '이정재', '서울', '1975-06-11', NULL, '010-1102-7506', '배우');
INSERT INTO Customer VALUES ('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업');
INSERT INTO Customer VALUES ('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '회사원');
INSERT INTO Customer VALUES ('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');

-- Account
INSERT INTO Account VALUES ('1011-1001-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2020-01-21 13:00:02');
INSERT INTO Account VALUES ('1011-1001-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2020-06-11 13:00:02');
INSERT INTO Account VALUES ('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30 13:00:02');
INSERT INTO Account VALUES ('1011-2001-1004', '660912-1234567', '정기적금', 1000000, 'N', '2020-04-13 13:00:02');
INSERT INTO Account VALUES ('1011-1002-1005', '750611-1234567', '자유입출금', 820000, 'Y', '2020-09-12 13:00:02');

-- Card
INSERT INTO Card VALUES ('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check');
INSERT INTO Card VALUES ('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check');
INSERT INTO Card VALUES ('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check');
INSERT INTO Card VALUES ('2611-1001-1005', '750611-1234567', '1011-1002-1005', '2020-09-12', 1500000, '2020-10-10', 'check');

-- Transaction
INSERT INTO Transaction (trans_acc_id, trans_type, trans_message, trans_money, trans_date) VALUES ('1011-1001-1001', '입금', '2월 정기급여', 3500000, '2020-02-10 12:36:12');
INSERT INTO Transaction (trans_acc_id, trans_type, trans_message, trans_money, trans_date) VALUES ('1011-1001-1003', '출금', 'ATM 출금', 300000, '2020-02-10 12:37:21');
INSERT INTO Transaction (trans_acc_id, trans_type, trans_message, trans_money, trans_date) VALUES ('1011-1001-1002', '입금', '2월 급여', 2800000, '2020-02-10 12:38:21');
INSERT INTO Transaction (trans_acc_id, trans_type, trans_message, trans_money, trans_date) VALUES ('1011-1001-1001', '출금', '2월 공과금', 116200, '2020-02-10 12:39:21');
INSERT INTO Transaction (trans_acc_id, trans_type, trans_message, trans_money, trans_date) VALUES ('1011-1002-1005', '출금', 'ATM 출금', 50000, '2020-02-10 12:40:21');

-- 작업 3
-- 문제 1) 모든 고객 정보를 조회하시오.
SELECT * FROM Customer;

-- 문제 2) 모든 카드 정보를 조회하시오.
SELECT * FROM Card;

-- 문제 3) 모든 예금계좌 정보를 조회하시오.
SELECT * FROM Account;

-- 문제 4) 가장 최근 거래 내역 3건 조회하시오.
SELECT * FROM Transaction 
ORDER BY trans_date DESC
FETCH FIRST 3 ROWS ONLY;

-- 문제 5) 카드한도금액이 200만원 이상인 고객의 이름과 카드종류 조회하시오.
SELECT c.Name, d.CARD_TYPE
FROM Customer c JOIN Card d ON c.cust_jumin = d.cust_jumin
WHERE card_limit >= 2000000;

-- 문제 6) 예금계좌별 거래 건수 조회하시오.
SELECT trans_acc_id, COUNT(*) FROM Transaction
GROUP BY trans_acc_id;

-- 문제 7) 거래금액이 100만원 이상인 거래 내역 조회하시오. (최근 거래순)
SELECT * FROM Transaction
WHERE trans_money >= 1000000
ORDER BY trans_date DESC;

-- 문제 8) 계좌와 연결된 카드 정보 조회(계좌ID, 카드ID, 카드종류) 하시오.
SELECT a.acc_id, c.card_no, c.card_type
FROM Account a JOIN Card c ON a.acc_id = c.acc_id;

-- 문제 9) 예금구분이 '입금'인 거래의 총합 조회하시오.
SELECT trans_type, SUM(trans_money) FROM Transaction
WHERE trans_type = '입금'
GROUP BY trans_type;

-- 문제 10) 예금잔고가 4,000,000원 이상 고객에 대한 고객명, 주민번호, 전화번호, 주소를 조회하시오.
SELECT name, cust_jumin, hp, address 
FROM Customer
WHERE cust_jumin IN ( SELECT cust_jumin 
                      FROM Account
                      WHERE acc_balance >= 4000000);
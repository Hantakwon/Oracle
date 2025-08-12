/*
    날짜 : 2025/08/12
    이름 : 김철학
    내용 : 8장 정규화 실습
*/

-- 정규화 되지 않은 테이블 생성
CREATE TABLE bookorder (
    orderno   NUMBER NOT NULL,
    orderdate DATE,
    custid    VARCHAR2(30),
    cname     VARCHAR2(30),
    address   VARCHAR2(100),
    bookid    NUMBER,
    bookname  VARCHAR2(100),
    count     NUMBER,
    price     NUMBER
);

ALTER TABLE bookorder ADD CONSTRAINT bookorder_pk PRIMARY KEY ( orderno );

-- 실습 7-1
INSERT INTO BOOKORDER VALUES (10001, '2024-01-12', 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
INSERT INTO BOOKORDER VALUES (10002, '2024-01-12', 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 28000);
INSERT INTO BOOKORDER VALUES (10003, '2024-01-12', 'a102', '김춘추', '경주', 102, '자료구조', 2, 32000);
INSERT INTO BOOKORDER VALUES (10004, '2024-01-12', 'a103', '장보고', '완도', 102, '자료구조', 2, 32000);
INSERT INTO BOOKORDER VALUES (10005, '2024-01-12', 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO BOOKORDER VALUES (10006, '2024-01-12', 'a105', '이순신', '서울', 110, '데이터베이스', 1, 28000);
INSERT INTO BOOKORDER VALUES (10007, '2024-01-12', 'a105', '이순신', '서울', 110, '자료구조', 1, 32000);
SELECT * FROM BOOKORDER;

-- 실습 7-2

CREATE TABLE book (
    bookid   NUMBER NOT NULL,
    bookname VARCHAR2(100),
    price    NUMBER
);

ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_customer (
    custid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(30),
    address VARCHAR2(100)
);

ALTER TABLE bo_customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

CREATE TABLE "Order" (
    orderno   NUMBER NOT NULL,
    orderid   VARCHAR2(20),
    bookid    NUMBER,
    count     NUMBER,
    orderdate DATE
);

ALTER TABLE "Order" ADD CONSTRAINT table_5_pk PRIMARY KEY ( orderno );

ALTER TABLE "Order"
    ADD CONSTRAINT order_book_fk FOREIGN KEY ( bookid )
        REFERENCES book ( bookid );

ALTER TABLE "Order"
    ADD CONSTRAINT order_customer_fk FOREIGN KEY ( orderid )
        REFERENCES bo_customer ( custid );

-- 실습 7-3
CREATE TABLE bo_book3 (
    bookid   NUMBER NOT NULL,
    bookname VARCHAR2(100)
);

ALTER TABLE bo_book3 ADD CONSTRAINT bookv1_pk PRIMARY KEY ( bookid );

CREATE TABLE bo_customer3 (
    custid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(30),
    address VARCHAR2(100)
);

ALTER TABLE bo_customer3 ADD CONSTRAINT customerv1_pk PRIMARY KEY ( custid );

CREATE TABLE bo_order3 (
    orderno   NUMBER NOT NULL,
    ordertid  VARCHAR2(20),
    orderdate DATE
);

ALTER TABLE bo_order3 ADD CONSTRAINT orderv1_pk PRIMARY KEY ( orderno );

CREATE TABLE bo_orderitem3 (
    orderno1 NUMBER NOT NULL,
    price    NUMBER,
    bookid1  NUMBER NOT NULL,
    count    NUMBER
);

ALTER TABLE bo_orderitem3 ADD CONSTRAINT bo_order3v1_pk PRIMARY KEY ( bookid1, orderno1 );                                                                    
                                                                      
ALTER TABLE bo_order3
    ADD CONSTRAINT bo_order3_bo_customer3_fk FOREIGN KEY ( ordertid )
        REFERENCES bo_customer3 ( custid );

ALTER TABLE bo_orderitem3
    ADD CONSTRAINT bo_orderitem3_bo_book3_fk FOREIGN KEY ( bookid1 )
        REFERENCES bo_book3 ( bookid );

ALTER TABLE bo_orderitem3
    ADD CONSTRAINT bo_orderitem3_bo_order3_fk FOREIGN KEY ( orderno1 )
        REFERENCES bo_order3 ( orderno );
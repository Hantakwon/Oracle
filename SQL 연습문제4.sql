/*
    날짜 : 2025/07/22
    이름 : 한탁원
    내용 : SQL_연습문제3
*/

-- 실습 4-1.
ALTER SESSION Set "_ORACLE_SCRIPT"=true;
CREATE USER library IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO library;

-- 실습 4-2.
CREATE TABLE Member (
    member_Id NUMBER(4) PRIMARY KEY,
    name VARCHAR2(40) NOT NULL,
    address VARCHAR2(100) DEFAULT NULL,
    hp CHAR(13)DEFAULT NULL UNIQUE ,
    join_date DATE NOT NULL
);

CREATE TABLE Book (
    book_Id NUMBER(5) PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    author VARCHAR2(40) NOT NULL,
    publisher VARCHAR2(40) NOT NULL,
    available CHAR(1) DEFAULT NULL,
    reg_date DATE NOT NULL
);

CREATE TABLE Loan (
    loan_Id NUMBER PRIMARY KEY,
    member_Id  NUMBER(4) NOT NULL,
    book_Id NUMBER(5) NOT NULL,
    loan_date DATE DEFAULT NULL,
    return_date DATE DEFAULT NULL,
    actual_date DATE DEFAULT NULL,
    CONSTRAINT fk_member FOREIGN KEY (member_Id) REFERENCES Member(member_Id),
    CONSTRAINT fk_book FOREIGN KEY (book_Id) REFERENCES Book(book_Id)
);

-- 실습 4-3.
INSERT INTO Member VALUES (1001, '김유신', '서울특별시 강남구 역삼동', '010-1234-1001', '2024-01-10 09:15:00');
INSERT INTO Member VALUES (1002, '김춘추', '대전광역시 유성구 장대동', '010-1234-1002', '2024-02-14 14:30:45');
INSERT INTO Member VALUES (1003, '장보고', '대구광역시 수성구 반월동', '010-1234-1003', '2024-03-01 11:05:20');
INSERT INTO Member VALUES (1004, '강감찬', '부산광역시 금정구 부곡동', '010-1234-1004', '2024-03-22 16:40:00');
INSERT INTO Member VALUES (1005, '이순신', '광주광역시 광산구 우산동', '010-1234-1005', '2024-04-10 08:50:10');

INSERT INTO Book VALUES (10001, '태백산맥', '조정래', '문학수첩', 'Y', '2014-01-10 09:15:00');
INSERT INTO Book VALUES (10002, '데미안', '헤르만 헤세', '민음사', 'N','2014-02-14 14:30:45');
INSERT INTO Book VALUES (10003, '토지', '박경리', '문학사상사', 'Y', '2014-03-01 11:05:20');
INSERT INTO Book VALUES (10004, '명품 자바 프로그래밍', '제임스 고슬링', '한빛출판사', 'Y', '2014-03-22 16:40:00');
INSERT INTO Book VALUES (10005, '로미오와 줄리엣', '셰익스피어', '열린책들', 'N', '2014-04-10 08:50:10');
INSERT INTO Book VALUES (10006, '삼국지', '나관중', '민음사', 'Y', '2014-04-05 09:12:02');
INSERT INTO Book VALUES (10007, '칼의 노래', '김훈', '문학동네', 'Y', '2014-05-23 12:53:17');
INSERT INTO Book VALUES (10008, '데이터베이스', '래리 엘리슨', '한빛출판사', 'N', '2014-02-03 10:13:09');
INSERT INTO Book VALUES (10009, 'Linux 운영체제', '리누스 토발즈', '한빛출판사', 'Y', '2014-03-11 11:23:43'));
INSERT INTO Book VALUES (10010, '어린 왕자', '생텍쥐페리', '열린책들', 'Y', '2014-05-13 15:27:21');

INSERT INTO Loan VALUES (1, 1001, 10002, '2024-03-01 10:02:31', '2024-03-15 10:02:31', '2024-03-13 09:44:19');
INSERT INTO Loan VALUES (2, 1002, 10004, '2024-03-05 15:10:02', '2024-03-19 15:10:02', '2024-03-12 17:12:30');
INSERT INTO Loan VALUES (3, 1003, 10008, '2024-04-01 11:01:12', '2024-04-15 11:01:12', NULL);
INSERT INTO Loan VALUES (4, 1002, 10001, '2024-04-10 14:32:01', '2024-04-24 14:32:01', '2024-04-22 13:56:32');
INSERT INTO Loan VALUES (5, 1005, 10004, '2024-04-15 16:24:21', '2024-04-29 16:24:21', NULL);
INSERT INTO Loan VALUES (6, 1004, 10006, '2024-05-01 09:12:09', '2024-05-15 09:12:09', '2024-05-14 09:21:27');
INSERT INTO Loan VALUES (7, 1001, 10007, '2024-05-03 15:17:00', '2024-05-19 13:51:07', '2024-05-16 14:05:10');
INSERT INTO Loan VALUES (8, 1003, 10009, '2024-06-01 11:15:43', '2024-06-15 11:15:43', NULL);
INSERT INTO Loan VALUES (9, 1004, 10004, '2024-06-02 12:30:52', '2024-06-16 12:30:52', NULL);
INSERT INTO Loan VALUES (10, 1002, 10008, '2024-06-05 10:06:17', '2024-06-19 10:06:17', NULL);

-- 2. Member 데이터 삽입
INSERT INTO Member VALUES (1001, '김유신', '서울특별시 강남구 역삼동', '010-1234-1001', TO_DATE('2024-01-10 09:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Member VALUES (1002, '김춘추', '대전광역시 유성구 장대동', '010-1234-1002', TO_DATE('2024-02-14 14:30:45', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Member VALUES (1003, '장보고', '대구광역시 수성구 반월동', '010-1234-1003', TO_DATE('2024-03-01 11:05:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Member VALUES (1004, '강감찬', '부산광역시 금정구 부곡동', '010-1234-1004', TO_DATE('2024-03-22 16:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Member VALUES (1005, '이순신', '광주광역시 광산구 우산동', '010-1234-1005', TO_DATE('2024-04-10 08:50:10', 'YYYY-MM-DD HH24:MI:SS'));

-- 3. Book 데이터 삽입 (※ 9번째 줄 괄호 오류 수정)
INSERT INTO Book VALUES (10001, '태백산맥', '조정래', '문학수첩', 'Y', TO_DATE('2014-01-10 09:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10002, '데미안', '헤르만 헤세', '민음사', 'N', TO_DATE('2014-02-14 14:30:45', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10003, '토지', '박경리', '문학사상사', 'Y', TO_DATE('2014-03-01 11:05:20', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10004, '명품 자바 프로그래밍', '제임스 고슬링', '한빛출판사', 'Y', TO_DATE('2014-03-22 16:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10005, '로미오와 줄리엣', '셰익스피어', '열린책들', 'N', TO_DATE('2014-04-10 08:50:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10006, '삼국지', '나관중', '민음사', 'Y', TO_DATE('2014-04-05 09:12:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10007, '칼의 노래', '김훈', '문학동네', 'Y', TO_DATE('2014-05-23 12:53:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10008, '데이터베이스', '래리 엘리슨', '한빛출판사', 'N', TO_DATE('2014-02-03 10:13:09', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Book VALUES (10009, 'Linux 운영체제', '리누스 토발즈', '한빛출판사', 'Y', TO_DATE('2014-03-11 11:23:43', 'YYYY-MM-DD HH24:MI:SS')); -- ← 마지막 괄호 오류 수정
INSERT INTO Book VALUES (10010, '어린 왕자', '생텍쥐페리', '열린책들', 'Y', TO_DATE('2014-05-13 15:27:21', 'YYYY-MM-DD HH24:MI:SS'));

-- 4. Loan 데이터 삽입
INSERT INTO Loan VALUES (1, 1001, 10002, TO_DATE('2024-03-01 10:02:31', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-15 10:02:31', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-13 09:44:19', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Loan VALUES (2, 1002, 10004, TO_DATE('2024-03-05 15:10:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-19 15:10:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-12 17:12:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Loan VALUES (3, 1003, 10008, TO_DATE('2024-04-01 11:01:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-15 11:01:12', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Loan VALUES (4, 1002, 10001, TO_DATE('2024-04-10 14:32:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-24 14:32:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-22 13:56:32', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Loan VALUES (5, 1005, 10004, TO_DATE('2024-04-15 16:24:21', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-29 16:24:21', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Loan VALUES (6, 1004, 10006, TO_DATE('2024-05-01 09:12:09', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-15 09:12:09', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-14 09:21:27', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Loan VALUES (7, 1001, 10007, TO_DATE('2024-05-03 15:17:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-19 13:51:07', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-16 14:05:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Loan VALUES (8, 1003, 10009, TO_DATE('2024-06-01 11:15:43', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-15 11:15:43', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Loan VALUES (9, 1004, 10004, TO_DATE('2024-06-02 12:30:52', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-16 12:30:52', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO Loan VALUES (10, 1002, 10008, TO_DATE('2024-06-05 10:06:17', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-19 10:06:17', 'YYYY-MM-DD HH24:MI:SS'), NULL);

DROP TABLE Loan;
DROP TABLE Book;
DROP TABLE Member;

-- 실습 4-4.
SELECT * FROM Member;

-- 실습 4-5.
SELECT title, author FROM Book;

-- 실습 4-6.
SELECT name, address FROM Member WHERE address LIKE '부산%';

-- 실습 4-7.
SELECT title FROM Book WHERE available = 'Y';

-- 실습 4-8.
SELECT * FROM Book WHERE book_id = 10005;

-- 실습 4-9.
SELECT member_id, name, hp FROM Member WHERE member_id = 1002;

-- 실습 4-10.
SELECT title FROM Book WHERE reg_date BETWEEN TO_DATE('2014-03-01', 'YYYY-MM-DD') AND TO_DATE('2014-03-31', 'YYYY-MM-DD');

-- 실습 4-11.
SELECT title, author, publisher FROM Book WHERE publisher = '민음사';

-- 실습 4-12.
SELECT loan_id, member_id, book_id FROM Loan WHERE actual_date IS NULL;

-- 실습 4-13.
SELECT * FROM Member WHERE name LIKE '김%';

-- 실습 4-14.
SELECT name, address FROM Member WHERE address LIKE '부산%' OR address LIKE '대구%';

-- 실습 4-15.
SELECT book_id, title FROM Book WHERE book_id = 10003 OR book_id = 10006;

-- 실습 4-16.
SELECT title, author FROM book WHERE author = '조정래' OR author = '박경리';

-- 실습 4-17.
SELECT name, join_date FROM Member WHERE join_date < TO_DATE('2024-04-01', 'YYYY-MM-DD');

-- 실습 4-18.
SELECT loan_id, member_id, book_id, loan_date FROM Loan WHERE loan_date > TO_DATE('2024-05-01', 'YYYY-MM-DD');

-- 실습 4-19.
SELECT title, author, publisher FROM Book WHERE available = 'N';

-- 실습 4-20.
SELECT * FROM Book WHERE title LIKE '%자바%';

-- 실습 4-21.
SELECT name, hp FROM Member WHERE hp != '010-1234-1003';

-- 실습 4-22.
SELECT loan_id, member_id, book_id FROM Loan WHERE return_date < TO_DATE('2024-03-20', 'YYYY-MM-DD');

-- 실습 4-23.
SELECT * FROM Member ORDER BY name ASC;

-- 실습 4-24.
SELECT title, reg_date FROM Book ORDER BY reg_date DESC;

-- 실습 4-25.
SELECT title FROM Book ORDER BY title ASC FETCH FIRST 3 ROWS ONLY;

-- 실습 4-26.
SELECT * FROM Member ORDER BY join_date DESC FETCH FIRST 1 ROWS ONLY;

-- 실습 4-27.
SELECT loan_id, loan_date FROM Loan ORDER BY loan_date ASC FETCH FIRST 2 ROWS ONLY;

-- 실습 4-28.
SELECT COUNT(*) FROM Member;

-- 실습 4-29.
SELECT COUNT(*) FROM Book;

-- 실습 4-30.
SELECT COUNT(*) FROM Book WHERE available = 'Y';

-- 실습 4-31.
SELECT publisher, count(*) AS "출판_도서수" FROM Book GROUP BY publisher;

-- 실습 4-32.
SELECT count(*) FROM Loan WHERE loan_date BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD');

-- 실습 4-33.
SELECT l.member_id, count(l.book_id) AS "대출_도서수" FROM Member m JOIN Loan l ON m.member_id = l.member_id GROUP BY l.member_id;

-- 실습 4-34.
SELECT l.book_id, count(l.book_id) AS "대출_도서수" FROM Book b JOIN Loan l ON b.book_id = l.book_id GROUP BY l.book_id;

-- 실습 4-35.
SELECT l.member_id, count(l.book_id) AS "회원_도서수" FROM Member m JOIN Loan l ON m.member_id = l.member_id GROUP BY l.member_id HAVING count(l.book_id) >= 2;

-- 실습 4-36.
SELECT l.book_id, count(l.book_id) AS "도서_대출건수" FROM Book b JOIN Loan l ON b.book_id = l.book_id GROUP BY l.book_id HAVING count(l.book_id) >= 2; 

-- 실습 4-37.
SELECT m.member_id, m.name, b.book_id, b.title, l.loan_date FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id;

-- 실습 4-38.
SELECT m.name, COUNT(*) AS 대출도서수 FROM Member m JOIN Loan l ON m.member_id = l.member_id GROUP BY m.name HAVING COUNT(*) >= 3;

-- 실습 4-39.
SELECT l.loan_id, m.name, b.title, l.loan_date FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE loan_date > TO_DATE('2024-05-01', 'YYYY-MM-DD');

-- 실습 4-40.
SELECT b.title FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE name = '김유신'; 

-- 실습 4-41.
SELECT name FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE title = '태백산맥'; 

-- 실습 4-42.
SELECT m.name, b.title FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE name = '김춘추' ORDER BY title ASC; 

-- 실습 4-43.
SELECT b.title, m.name FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE loan_date BETWEEN TO_DATE('2024-04-01', 'YYYY-MM-DD') AND TO_DATE('2024-04-30', 'YYYY-MM-DD');

-- 실습 4-44.
SELECT m.name, b.title  FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE actual_date IS NULL ORDER BY title DESC, name ASC; 

-- 실습 4-45.
SELECT m.name, b.title  FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id WHERE actual_date IS NULL ORDER BY name ASC, title DESC;

-- 실습 4-46.
SELECT b.book_id, b.title FROM Book b LEFT JOIN Loan l ON b.book_id = l.book_id WHERE l.book_id IS NULL;

-- 실습 4-47.
SELECT m.name 
FROM Member m JOIN Loan l ON m.member_id = l.member_id 
GROUP BY m.name 
HAVING COUNT(*) = (
    SELECT MAX(loan_count)
    FROM (
        SELECT COUNT(*) AS loan_count
        FROM Loan
        GROUP BY member_id
    )
);

-- 실습 4-48.
SELECT name FROM Member WHERE name = (SELECT m.name, count(*) AS "총_건수" FROM Member m JOIN Loan l ON m.member_id = l.member_id JOIN Book b ON b.book_id = l.book_id GROUP BY m.name ORDER BY count(*) DESC FETCH FIRST 1 ROWS ONLY);

-- 실습 4-49.
SELECT title FROM Book WHERE publisher = (SELECT publisher FROM Book WHERE title ='데이터베이스') AND title != '데이터베이스';

-- 실습 4-50.
SELECT name FROM Member b JOIN Loan l ON b.member_id = l.member_id WHERE book_id IN (SELECT book_id FROM Loan WHERE book_id = 10004);  
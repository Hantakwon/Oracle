/*
    날짜 : 2025/07/21
    이름 : 한탁원
    내용 : SQL 연습문제2
*/

-- 실습 2-1
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER college IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO college;

-- 실습 2-2
CREATE TABLE Student (
    stdNo VARCHAR2(8) PRIMARY KEY,
    Name VARCHAR2(20) NOT NULL,
    Birth DATE NOT NULL,
    Major VARCHAR2(20) DEFAULT NULL,
    ENR_DATE DATE NOT NULL
);

DROP TABLE Course;
CREATE TABLE Course (
    CS_ID NUMBER(4) PRIMARY KEY,
    CS_NAME VARCHAR2(40) NOT NULL,
    CS_Credit NUMBER(1) NOT NULL,
    CS_DEPT VARCHAR2(40) NOT NULL
);

CREATE TABLE Enrollment (
    ENR_NO NUMBER PRIMARY KEY,
    ENR_STDNO VARCHAR2(8) NOT NULL,
    ENR_CSID NUMBER(4),
    MID_SCORE NUMBER,
    FINAL_SCORE NUMBER,
    TOTAL_SCORE NUMBER,
    GRADE CHAR(1) DEFAULT NULL
);

-- 실습 2-3
INSERT INTO Student VALUES('20121016', '김유신', '1991-01-13', '국문학과', '2012-02-01');
INSERT INTO Student VALUES('20111126', '김춘추', '1992-04-11', '경제학과', '2011-02-01');
INSERT INTO Student VALUES('20100216', '장보고', '1991-05-23', '컴퓨터학과', '2010-02-01');
INSERT INTO Student VALUES('20120326', '강감찬', '1991-02-09', '영문학과', '2012-02-01');
INSERT INTO Student VALUES('20130416', '이순신', '1992-11-30', '경영학과', '2012-02-01');
INSERT INTO Student VALUES('20110521', '송상현', '1992-07-17', '컴퓨터학과', '2011-02-01');


SELECT * fROM Student;

INSERT INTO Course VALUES (1059, '고전문학', 3, '국문학과');
INSERT INTO Course VALUES (2312, '데이터베이스', 3, '컴퓨터학과');
INSERT INTO Course VALUES (1203, 'Easy Writing', 3, '영문학과');
INSERT INTO Course VALUES (2039, '글로벌경제학', 3, '경제학과');
INSERT INTO Course VALUES (2301, '프로그래밍언어', 3, '컴퓨터학과');
INSERT INTO Course VALUES (2303, '컴퓨터과학 개론', 2, '컴퓨터학과');
INSERT INTO Course VALUES (3012, '마케팅 전략', 2, '경영학과');

DELETE Course;
SELECT * fROM Course;

INSERT INTO Enrollment VALUES (1, 20111126, 1203, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (2, 20121016, 2301, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (3, 20121016, 2303, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (4, 20111126, 2039, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (5, 20100216, 3012, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (6, 20120326, 3012, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (7, 20121016, 2312, NULL, NULL, NULL, NULL);
INSERT INTO Enrollment VALUES (8, 20130416, 3012, NULL, NULL, NULL, NULL);

SELECT * fROM Enrollment;

-- 실습 2-4
SELECT * FROM Student WHERE major = '컴퓨터학과';

-- 실습 2-5
SELECT * FROM Course WHERE cs_dept = '컴퓨터학과';

-- 실습 2-6
SELECT * FROM Enrollment WHERE enr_stdno = 20121016;

-- 실습 2-7
SELECT name, major, enr_date FROM Student WHERE major = '국문학과';

-- 실습 2-8
SELECT * FROM Course WHERE cs_credit = 2;

-- 실습 2-9
SELECT stdno, name, birth FROM Student WHERE birth >= '1992-01-01';

-- 실습 2-10
UPDATE Enrollment SET MID_SCORE = 36, FINAL_SCORE= 42 
WHERE ENR_STDNO='20111126' AND ENR_CSID=1203; 

UPDATE Enrollment SET MID_SCORE = 24, FINAL_SCORE= 62
WHERE ENR_STDNO='20121016' AND ENR_CSID=2301;

UPDATE Enrollment SET MID_SCORE = 28, FINAL_SCORE= 40
WHERE ENR_STDNO='20121016' AND ENR_CSID=2303;

UPDATE Enrollment SET MID_SCORE = 37, FINAL_SCORE= 57
WHERE ENR_STDNO='20111126' AND ENR_CSID=2039;

UPDATE Enrollment SET MID_SCORE = 28, FINAL_SCORE= 68
WHERE ENR_STDNO='20100216' AND ENR_CSID=3012;

UPDATE Enrollment SET MID_SCORE = 16, FINAL_SCORE= 65
WHERE ENR_STDNO='20120326' AND ENR_CSID=3012;

UPDATE Enrollment SET MID_SCORE = 18, FINAL_SCORE= 38
WHERE ENR_STDNO='20121016' AND ENR_CSID=2312; 

UPDATE Enrollment SET MID_SCORE = 25, FINAL_SCORE= 58
WHERE ENR_STDNO='20130416' AND ENR_CSID=3012;

SELECT * FROM Enrollment;

-- 실습 2-11
UPDATE Enrollment SET
    TOTAL_SCORE = MID_SCORE + FINAL_SCORE, 
    GRADE = CASE
        WHEN (MID_SCORE + FINAL_SCORE) >= 90 THEN 'A'
        WHEN (MID_SCORE + FINAL_SCORE) >= 80 THEN 'B'
        WHEN (MID_SCORE + FINAL_SCORE) >= 70 THEN 'C'
        WHEN (MID_SCORE + FINAL_SCORE) >= 60 THEN 'D'
        ELSE 'F'
    END;

SELECT * FROM Enrollment;

-- 실습 2-12
SELECT * FROM Enrollment ORDER BY total_score DESC;

-- 실습 2-13
SELECT * FROM Enrollment WHERE enr_csid = 3012 ORDER BY total_score DESC;

-- 실습 2-14
SELECT cs_id, cs_name FROM Course WHERE cs_name = '데이터베이스' OR cs_name = '프로그래밍언어';

-- 실습 2-15
SELECT cs_name, cs_dept FROM Course;

-- 실습 2-16
SELECT stdno, name FROM Student ORDER BY name ASC;

-- 실습 2-17
SELECT DISTINCT(enr_stdno) FROM Enrollment;

-- 실습 2-18
SELECT MAX(total_score) AS "가장_큰_총점" FROM Enrollment;

-- 실습 2-19
SELECT major, COUNT(*) 학생수 FROM Student GROUP BY major;

-- 실습 2-20
SELECT enr_csid, COUNT(*) 수강_학생수 FROM Enrollment GROUP BY enr_csid HAVING COUNT(*) >= 2;

-- 실습 2-21
SELECT stdno, name, major, enr_csid, mid_score, final_score, total_score, grade 
FROM Student s, Enrollment e WHERE s.stdno = e.enr_stdno;

-- 실습 2-22
SELECT name, stdno, enr_csid
FROM Student s
JOIN Enrollment e
ON s.stdno = e.enr_stdno;

-- 실습 2-23
SELECT 
    stdno,
    name,
    count(stdno) AS "수강신청 건수",
    SUM(total_score) AS 종합점수,
    SUM(total_score) / COUNT(stdno) AS 평균
FROM Student s
JOIN Enrollment e on s.stdno = e.enr_stdno
GROUP BY s.stdNo, s.Name;

-- 실습 2-24
SELECT enr_no, enr_stdno, cs_id, cs_name, cs_credit FROM Enrollment e JOIN Course c on e.enr_csid = c.cs_id;

-- 실습 2-25
SELECT 
    COUNT(*) AS 마케팅_전략_수강_신청건수,
    AVG(TOTAL_SCORE) AS 마케팅_전략_평균
FROM Enrollment E
JOIN Course c on e.enr_csid = c.cs_id
WHERE cs_name = '마케팅 전략';

-- 실습 2-26
SELECT
    enr_stdno, cs_name
FROM Enrollment e
JOIN Course c on e.enr_csid = c.cs_id
WHERE grade = 'A';

-- 실습 2-27
SELECT
    stdno,
    name,
    major,
    enr_csid,
    cs_name,
    cs_credit,
    total_score,
    grade
FROM Student s
JOIN Enrollment e ON s.stdno = e.enr_stdno
JOIN Course c ON e.enr_csid = c.cs_id;

-- 실습 2-28
SELECT
    stdno,
    name,
    cs_name,
    total_score,
    grade
FROM Student s
JOIN Enrollment e ON s.stdno = e.enr_stdno
JOIN Course c ON e.enr_csid = c.cs_id
WHERE grade = 'F';

-- 실습 2-29
SELECT
    stdno,
    name,
    SUM(cs_credit) AS 이수학점
FROM Student s
JOIN Enrollment e ON s.stdno = e.enr_stdno
JOIN Course c ON e.enr_csid = c.cs_id
WHERE grade != 'F'
GROUP BY s.stdno, s.name;

-- 실습 2-30
SELECT
    s.stdno,
    s.name,
    s.major
FROM Student s
WHERE s.stdno NOT IN ( 
    SELECT enr_stdno FROM Enrollment
);
INSERT INTO Student VALUES ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
INSERT INTO Student VALUES ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
INSERT INTO Student VALUES ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
INSERT INTO Student VALUES ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
INSERT INTO Student VALUES ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

ALTER TABLE Lecture MODIFY lecName VARCHAR2(30);
INSERT INTO Lecture VALUES (101, '컴퓨터과학 개론', 2, 40, '본301');
INSERT INTO Lecture VALUES (102, '프로그래밍 언어', 3, 52, '본302');
INSERT INTO Lecture VALUES (103, '데이터베이스', 3, 56, '본303');
INSERT INTO Lecture VALUES (104, '자료구조', 3, 60, '본304');
INSERT INTO Lecture VALUES (105, '운영체제', 3, 52, '본305');

INSERT INTO Register VALUES ('20220415', 101, 60, 30, null, null);
INSERT INTO Register VALUES ('20210324', 103, 54, 36, null, null);
INSERT INTO Register VALUES ('20201011', 105, 52, 28, null, null);
INSERT INTO Register VALUES ('20220415', 102, 38, 40, null, null);
INSERT INTO Register VALUES ('20210324', 104, 56, 32, null, null);
INSERT INTO Register VALUES ('20210213', 103, 48, 40, null, null);

SELECT stdNo, stdName, stdHp, stdYear FROM Student 
WHERE stdNO NOT IN (SELECT regStdNo FROM Register);

UPDATE register SET
    regtotalscore = regmidscore + regfinalscore,
    reggrade = CASE
        WHEN (regmidscore + regfinalscore) >= 90 THEN 'A'
        WHEN (regmidscore + regfinalscore) >= 80 THEN 'B'
        WHEN (regmidscore + regfinalscore) >= 70 THEN 'C'
        WHEN (regmidscore + regfinalscore) >= 60 THEN 'D'
        ELSE 'F'
    END;
    
SELECT * fROM Register;

SELECT s.stdNo, s.stdName, s.stdHp, s.stdYear, l.lecName, r.regmidscore, r.regfinalscore, r.regtotalscore, r.reggrade
FROM Register r JOIN Student s ON r.regStdNo = s.stdNo
                JOIN Lecture l ON r.regLecNo = l.lecNo
WHERE s.stdYear = 2;
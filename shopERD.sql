INSERT INTO Customer VALUES ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
INSERT INTO Customer VALUES ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
INSERT INTO Customer VALUES ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
INSERT INTO Customer VALUES ('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
INSERT INTO Customer VALUES ('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

ALTER TABLE Product MODIFY prodname VARCHAR2(20);

INSERT INTO Product VALUES(1, '새우깡', 5000, 1500, '농심');
INSERT INTO Product VALUES(2, '초코파이', 2500, 2500, '오리온');
INSERT INTO Product VALUES(3, '포카칩', 3600, 1700, '오리온');
INSERT INTO Product VALUES(4, '양파링', 1250, 1800, '농심');
INSERT INTO Product VALUES(5, '죠리퐁', 2200, null, '크라운');

INSERT INTO "Order" VALUES (1, 'c102', 3, 2, '2023-01-01 13:15:10');
INSERT INTO "Order" VALUES (2, 'c101', 4, 1, '2023-01-01 13:15:12');
INSERT INTO "Order" VALUES (3, 'c102', 1, 1, '2023-01-01 13:15:14');
INSERT INTO "Order" VALUES (4, 'c103', 5, 5, '2023-01-01 13:15:16');
INSERT INTO "Order" VALUES (5, 'c105', 2, 1, '2023-01-01 13:15:18');

SELECT o.orderNo, c.name, p.prodName, o.orderCount, o.orderDate 
FROM "Order" o JOIN Customer c ON c.custid = o.orderId
				JOIN Product p ON p.prodNo = o.orderProduct;
                
SELECT o.orderNo, o.orderProduct, p.prodName, p.price, o.orderCount, o.orderDate
FROM "Order" o JOIN Product p ON p.prodNo = o.orderProduct
WHERE o.orderId = (SELECT custId FROM Customer WHERE name = '김유신');
                
SELECT SUM(p.price * o.orderCount)
from "Order" o JOIN Product p ON p.prodNo = o.orderProduct;

SELECT p.prodName, NVL(SUM(p.price * o.orderCount), 0)
FROM "Order" o JOIN Product p ON p.prodNo = o.orderProduct
GROUP BY p.prodName, o.orderProduct;
CREATE DATABASE practicedb;
USE practicedb;
CREATE TABLE sales_rep (
	employee_number INT,
    surname VARCHAR(40),
    first_name VARCHAR(30),
    commission TINYINT
);
SHOW TABLES;
DESCRIBE sales_rep;
INSERT INTO sales_rep (employee_number, surname, first_name, commission)
	VALUES (1, 'Rive', 'Sol', 10),
	(2, 'Gordimer', 'Charlene', 15),
    (3, 'Serote', 'Mike', 10);
SELECT * FROM sales_rep;
SELECT commission FROM sales_rep WHERE surname = 'Gordimer';
SELECT commission, employee_number FROM sales_rep WHERE surname = 'Gordimer';
SELECT * FROM sales_rep WHERE surname = 'Rive' AND first_name = 'Sol' OR commission > 10;
SELECT * FROM sales_rep WHERE surname = 'Rive' AND (first_name = 'Sol' OR commission > 10);
SELECT * FROM sales_rep WHERE surname LIKE 'G%';
INSERT INTO sales_rep VALUES (4, 'Rive', 'Mongane', 10), (5, 'Smith', 'Mike', 12);
SELECT * FROM sales_rep ORDER BY surname;
SELECT * FROM sales_rep ORDER BY surname, first_name;
SELECT * FROM sales_rep ORDER BY commission DESC;
SELECT * FROM sales_rep ORDER BY commission DESC, surname ASC, first_name ASC;
SELECT first_name, surname, commission FROM sales_rep ORDER BY commission DESC LIMIT 1;
SELECT first_name, surname, commission FROM sales_rep ORDER BY commission DESC LIMIT 2, 1;
SELECT MAX(commission) FROM sales_rep;
SELECT DISTINCT surname FROM sales_rep ORDER BY surname;
SELECT COUNT(surname) FROM sales_rep;
SELECT COUNT(DISTINCT surname) FROM sales_rep ORDER BY surname;
SELECT AVG(commission) FROM sales_rep;
SELECT SUM(commission) FROM sales_rep;
DELETE FROM sales_rep WHERE employee_number = 3;
UPDATE sales_rep SET commission = 12 WHERE employee_number = 1;
CREATE TABLE commission (id INT);
DROP TABLE commission;
CREATE DATABASE shortlived;
DROP DATABASE shortlived;
ALTER TABLE sales_rep ADD date_joined DATE;
ALTER TABLE sales_rep ADD year_born YEAR;
ALTER TABLE sales_rep CHANGE year_born birthday DATE;
ALTER TABLE sales_rep ADD enhancement_value INT;
ALTER TABLE sales_rep RENAME cash_flow_especialist;
ALTER TABLE cash_flow_especialist RENAME sales_rep;
ALTER TABLE sales_rep DROP enhancement_value;
UPDATE sales_rep SET date_joined = '2000-02-15', birthday = '1976-03-18' WHERE employee_number = 1;
UPDATE sales_rep SET date_joined = '1998-07-0', birthday = '1958-11-30' WHERE employee_number = 2;
UPDATE sales_rep SET date_joined = '2001-05-14', birthday = '1971-06-18' WHERE employee_number = 4;
UPDATE sales_rep SET date_joined = '2002-11-23', birthday = '1982-01-04' WHERE employee_number = 5;
SELECT DATE_FORMAT(date_joined, '%m/%d/%Y') FROM sales_rep WHERE employee_number = 1;
SELECT DATE_FORMAT(date_joined, '%W %M %e %Y') FROM sales_rep WHERE employee_number = 1;
SELECT DATE_FORMAT(date_joined, '%W %M %e %Y') FROM sales_rep WHERE employee_number = 1;
SELECT NOW();
SELECT CURRENT_DATE();
SELECT YEAR(birthday) FROM sales_rep;
SELECT DAYOFMONTH(birthday), MONTH(birthday), YEAR(birthday) FROM sales_rep;
SELECT surname, first_name, MONTH(birthday) as month, DAYOFMONTH(birthday) AS day FROM sales_rep ORDER BY month;
SELECT CONCAT(first_name, ' ', surname) AS name, MONTH(birthday) as month, DAYOFMONTH(birthday) AS day FROM sales_rep ORDER BY month;
SELECT DAYOFYEAR(date_joined) FROM sales_rep WHERE employee_number = 1;
CREATE TABLE costumer (
	id INT,
    first_name VARCHAR(30),
    surname VARCHAR(40)
);
CREATE TABLE sales (
	code INT,
    sales_rep INT,
    customer INT,
    value INT
);
INSERT INTO costumer (id, first_name, surname) VALUES
	(1, 'Yvonne', 'Clegg'),
    (2, 'Johnny', 'Chaka-Chaka'),
    (3, 'Winston', 'Powers'),
    (4, 'Patricia', 'Mankunku');
INSERT INTO sales (code, sales_rep, customer, value) VALUES
	(1, 1, 1, 2000),
    (2, 4, 3, 250),
    (3, 2, 3, 500),
    (4, 1, 4, 450),
    (5, 3, 1, 3800),
    (6, 1, 2, 500);
SELECT sales_rep, customer, value, first_name, surname FROM sales, sales_rep
WHERE code = 1 AND sales_rep.employee_number = sales.sales_rep;
SELECT code, customer, value FROM sales, sales_rep
WHERE first_name = 'Sol' AND surname = 'Rive' AND sales.sales_rep = sales_rep.employee_number;
SELECT employee_number, surname, first_name, YEAR(CURRENT_DATE) - YEAR(birthday) - (RIGHT(CURRENT_DATE, 5) < RIGHT(birthday, 5)) AS edad 
FROM sales_rep;
SELECT sales_rep, SUM(value) AS total_ventas FROM sales GROUP BY sales_rep ORDER BY total_ventas DESC;
SELECT first_name, surname, sales_rep, COUNT(*) AS count FROM sales, sales_rep
WHERE sales_rep.employee_number = sales.sales_rep
GROUP BY sales_rep ORDER BY count LIMIT 1;
CREATE TABLE test1 (id TINYINT ZEROFILL);
INSERT INTO test1 VALUES (3);
SELECT * FROM test1;
CREATE TABLE test2 (bool ENUM('true', 'false'));
INSERT INTO test2 VALUES ('true');
INSERT INTO test2 VALUES ('troo');
CREATE TABLE test3 (fruit SET('apple', 'mango', 'litchi', 'banana'));
INSERT INTO test3 VALUES ('banana');
INSERT INTO test3 VALUES ('litchi');
INSERT INTO test3 VALUES ('apple,mango');
SELECT * FROM test3;
CREATE TABLE tt (ts DATETIME);
INSERT INTO tt VALUES ('2023-10-27 10:34');
SELECT * FROM tt;

SELECT sales_rep, customer, value, first_name, surname  FROM sales, sales_rep WHERE code = 1 AND sales.sales_rep = sales_rep.employee_number;
SELECT first_name, surname, value FROM costumer, sales WHERE id = customer;
SELECT first_name, surname, value FROM costumer INNER JOIN sales ON id = customer;
INSERT INTO sales (code, sales_rep, customer, value) VALUES (7, 2, NULL, 670);
SELECT sales_rep.first_name, sales_rep.surname, value, costumer.first_name, costumer.surname
FROM sales, costumer, sales_rep
WHERE sales_rep.employee_number = sales.sales_rep
AND costumer.id = sales.customer;
SELECT sales_rep.first_name, sales_rep.surname, value, costumer.first_name, costumer.surname
FROM sales
LEFT JOIN sales_rep ON sales_rep.employee_number = sales.sales_rep
LEFT JOIN costumer ON costumer.id = sales.customer;
ALTER TABLE sales CHANGE customer id INT;
ALTER TABLE cutomer RENAME customer;
SELECT first_name, surname, value FROM customer NATURAL JOIN sales;
SELECT first_name, surname, value FROM customer INNER JOIN sales ON customer.id = sales.id;
SELECT first_name, surname, value FROM customer INNER JOIN sales USING (id);
CREATE TABLE old_customer (
	id INT,
    first_name VARCHAR(30),
    surname VARCHAR(40)
);
INSERT INTO old_customer VALUES
	(5432, 'Thulani', 'Salie'),
    (2342, 'Shahiem', 'Papo');
SELECT id, first_name, surname FROM customer
UNION
SELECT id, first_name, surname FROM old_customer
ORDER BY surname, first_name;
SELECT id, first_name, surname FROM customer
UNION
(SELECT id, first_name, surname FROM old_customer ORDER BY surname, first_name);
SELECT first_name, surname FROM sales_rep WHERE employee_number IN (SELECT sales_rep FROM sales WHERE value > 1000);
SELECT first_name, surname FROM sales_rep INNER JOIN sales ON sales_rep.employee_number = sales.sales_rep WHERE value > 1000;
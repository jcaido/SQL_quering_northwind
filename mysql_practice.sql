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
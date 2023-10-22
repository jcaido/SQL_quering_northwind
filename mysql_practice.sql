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

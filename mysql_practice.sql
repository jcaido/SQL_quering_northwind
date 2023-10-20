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
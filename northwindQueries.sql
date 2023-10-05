-- Change field name in query using 'AS'
SELECT FirstName AS Nombre, LastName AS Apellidos, Notes AS Notas FROM employees;

-- Obtain a ordered list using 'ORDER BY'
SELECT * FROM products ORDER BY Price ASC;

-- Obtain a single row by id using 'WHERE'
SELECT * FROM products WHERE ProductID = 38;

-- Other queries with 'WHERE'
SELECT * FROM products WHERE ProductName = 'Tofu';
SELECT * FROM products WHERE Price < 40 ORDER BY Price ASC; 
SELECT * FROM customers WHERE CustomerID >= 50 AND CustomerID < 55;
SELECT * FROM customers WHERE CustomerID >= 50 AND CustomerID < 55 AND NOT Country= 'Germany';
SELECT * FROM customers WHERE CustomerID >= 50 AND NOT Country = 'Germany' LIMIT 5;
SELECT * FROM customers WHERE City = 'Bruxelles' OR City = 'London';
SELECT * FROM customers WHERE NOT City = 'London';
SELECT * FROM products WHERE (Price < 20 OR CategoryID = 6) AND SupplierID = 7;
SELECT * FROM customers WHERE NOT Country = 'USA' AND NOT Country = 'France';
SELECT * FROM customers WHERE Country != 'USA';
SELECT * FROM products WHERE NOT CategoryID = 6 AND NOT SupplierID = 1 AND Price <= 30 ORDER BY RAND() LIMIT 3;

-- queries with 'BETWEEN'
SELECT * FROM products WHERE Price BETWEEN 20 AND 40;
SELECT * FROM products WHERE Price BETWEEN 20 AND 40 AND CategoryID = 6;
SELECT * FROM products WHERE Price BETWEEN 20 AND 40 AND CategoryID = 6 ORDER BY Price ASC;
SELECT * FROM employees WHERE BirthDate BETWEEN '1960-01-01' AND '1970-01-01';
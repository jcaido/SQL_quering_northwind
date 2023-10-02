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
SELECT * FROM customers WHERE City = 'Bruxelles' OR City = 'London';
SELECT * FROM customers WHERE NOT City = 'London';
SELECT * FROM products WHERE (Price < 20 OR CategoryID = 6) AND SupplierID = 7;
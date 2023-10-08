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

-- queries with 'LIKE'
SELECT * FROM employees WHERE LastName LIKE 'Buchanan';
SELECT * FROM employees WHERE LastName LIKE '%hanan'; 
SELECT * FROM employees WHERE LastName LIKE 'Buc%';
SELECT * FROM employees WHERE LastName LIKE '%uc%';
SELECT * FROM employees WHERE LastName LIKE 'B______n';
SELECT * FROM employees WHERE LastName LIKE 'Bucha___';
SELECT * FROM employees WHERE LastName LIKE '%n__';

-- queries with 'IS NULL' or 'IS NOT NULL'
SELECT * FROM products WHERE ProductName IS NULL ORDER BY ProductName ASC;
SELECT * FROM products WHERE ProductName IS NOT NULL ORDER BY ProductName ASC; 

-- queries with 'IN'
SELECT * FROM products WHERE SupplierID IN (3, 4, 5, 6);
SELECT * FROM employees WHERE LastName IN ('Suyama', 'Callahan');
SELECT * FROM employees WHERE LastName NOT IN ('Suyama', 'Callahan');

-- queries with aggregate functions
SELECT COUNT(FirstName) AS quantity_of_names FROM employees;
SELECT SUM(Price) AS sum_of_precios FROM products;
SELECT AVG(Price) AS average_of_precios FROM products;
SELECT ROUND(AVG(Price)) AS average_of_precios FROM products;
SELECT ROUND(AVG(Price), 2) AS average_of_precios FROM products;
SELECT MIN(Price) AS minimum_of_precios FROM products;
SELECT ProductName AS Product_with_minimun_price, MIN(Price) as Price FROM products;
SELECT ProductName, MAX(Price) as Price FROM products;

-- queries with 'GROUP BY'
SELECT SupplierID, ROUND(AVG(Price), 2) AS Promedio FROM products GROUP BY SupplierID ORDER BY Promedio DESC;
SELECT CategoryID, ROUND(AVG(Price),2) AS Promedio FROM products WHERE NOT CategoryID = 6 GROUP BY CategoryID ORDER BY Promedio DESC;

-- queries with 'GROUP BY' and 'HAVING'
SELECT SupplierID, ROUND(AVG(Price), 2) AS Promedio FROM products GROUP BY SupplierID HAVING Promedio > 20 ORDER BY Promedio;

SELECT ProductID, SUM(Quantity) AS Total_vendido FROM orderdetails 
GROUP BY ProductID 
HAVING Total_vendido < 50 
ORDER BY Total_vendido DESC;

SELECT ProductID, SUM(Quantity) AS Total_vendido FROM orderdetails GROUP BY ProductID ORDER BY Total_vendido DESC LIMIT 1;

-- Subqueries
SELECT ProductID, Quantity, (SELECT ProductName FROM products WHERE ProductID = orderdetails.ProductID) AS Nombre FROM orderdetails;
SELECT ProductID, Quantity, (SELECT ProductName FROM products WHERE ProductID = od.ProductID) AS Nombre FROM orderdetails AS od;

SELECT ProductID,
	SUM(Quantity) AS Total_vendido,
    (SELECT ProductName FROM products WHERE ProductID = od.ProductID) AS Nombre,
    (SELECT Price FROM products WHERE ProductID = od.ProductID) AS Price,
    (SUM(Quantity) * (SELECT Price FROM products WHERE ProductID = od.ProductID)) AS Total_recaudado
FROM orderdetails AS od
GROUP BY ProductID
ORDER BY Total_recaudado DESC;

SELECT ProductID,
	SUM(Quantity) AS Total_vendido,
    (SELECT ProductName FROM products WHERE ProductID = od.ProductID) AS Nombre,
    (SUM(Quantity) * (SELECT Price FROM products WHERE ProductID = od.ProductID)) AS Total_recaudado
FROM orderdetails AS od
WHERE (SELECT Price FROM products WHERE ProductID = od.ProductID) > 40
GROUP BY ProductID
ORDER BY Total_recaudado DESC;
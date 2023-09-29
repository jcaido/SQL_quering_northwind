-- Change field name in query using 'AS'
SELECT FirstName AS Nombre, LastName AS Apellidos, Notes AS Notas FROM employees;

-- Obtain a ordered list using 'ORDER BY'
SELECT * FROM products ORDER BY Price ASC;
SELECT * FROM products ORDER BY Price DESC;

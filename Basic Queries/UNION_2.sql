/*
Query should return unique (NOT DUBLICATED) Customername, Productname and Categoryname in one Result Column:
*/

SELECT 
	CustomerName AS Full_Name
FROM Customers
WHERE CustomerID BETWEEN 41 AND 50
UNION  ---------------------------
SELECT 
	ProductName AS Full_Name
FROM Products
WHERE ProductName LIKE '[ABEFIJ]%'
UNION  ---------------------------
SELECT
	CategoryName AS Full_Name
FROM Categories
ORDER BY Full_Name ASC;
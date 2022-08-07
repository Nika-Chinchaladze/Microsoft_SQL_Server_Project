/*
Query should return only 5 rows, after first 5 rows from customers table;
*/

SELECT 
	CustomerID,
	CustomerName,
	City,
	Country
FROM Customers
ORDER BY CustomerID ASC, City ASC
OFFSET 5 ROWS
FETCH FIRST 5 ROWS ONLY; -- FETCH NEXT 5 ROWS ONLY;
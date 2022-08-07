/*
Query should return the Common Cities and Countries of customers table, through 30 Row Ranges.
*/

SELECT
	City,
	Country
FROM Customers
WHERE CustomerID <= 30
INTERSECT
SELECT
	City,
	Country
FROM Customers
WHERE CustomerID > 30 AND CustomerID <= 60
INTERSECT
SELECT
	City,
	Country
FROM Customers
WHERE CustomerID > 60
ORDER BY Country ASC;
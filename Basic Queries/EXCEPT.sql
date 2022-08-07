/*
Query should return CustomerID-s, Which are DISTINCT and DOESN'T APPEAR in Below Queries.
Results should be ordered in DESCENDING order.
*/

SELECT
	CustomerID
FROM Customers
WHERE CustomerID <= 40
EXCEPT
SELECT
	CustomerID
FROM Customers
WHERE CustomerID BETWEEN 11 AND 20
EXCEPT
SELECT
	CustomerID
FROM Customers
WHERE CustomerID BETWEEN 21 AND 30
EXCEPT
SELECT
	CustomerID
FROM Customers
WHERE CustomerID BETWEEN 31 AND 40
ORDER BY CustomerID DESC;
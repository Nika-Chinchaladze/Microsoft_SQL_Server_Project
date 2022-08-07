/*
Query should return Orderdates and Orders of Customers, Who are from Germany, Mexico and Canada:
*/

SELECT
	OrderID,
	OrderDate,
	CustomerID
FROM Orders
WHERE CustomerID IN (
					SELECT CustomerID FROM Customers
					WHERE Country IN ('Germany', 'Mexico', 'Canada')
					)
ORDER BY CustomerID ASC, OrderDate ASC;
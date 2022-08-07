/*
Query should return sum and average quantities of ordered products made by
customers during first half of 1997 year.
*/

SELECT	
	c.CustomerName,
	SUM(d.Quantity) AS TotalQuantity,
	ROUND(AVG(d.Quantity), 2) AS AverageQuantity
FROM Orders AS o
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
	INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
WHERE o.OrderDate BETWEEN '1997-01-01' AND '1997-06-30'
GROUP BY c.CustomerName;
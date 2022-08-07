/*
The Query should calculate the aggregation of Sales Amount based on the hierarchy CustomerID > OrderID
*/

SELECT 
	c.CustomerID,
	o.OrderID,
	CONCAT(SUM(d.Quantity * p.Price), ' $') AS Amounts
FROM Customers AS c
	INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
	INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
	INNER JOIN Products AS p ON p.ProductID = d.ProductID
GROUP BY 
		ROLLUP(c.CustomerID, o.OrderID)
ORDER BY c.CustomerID ASC, o.OrderID ASC;
/*
Query should return all combination of GROUPING SETS:
*/

SELECT 
	c.CustomerID,
	o.OrderID,
	p.ProductName,
	SUM(d.Quantity) AS Sum_Quantity
FROM Customers AS c
	INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
	INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
	INNER JOIN Products AS p ON p.ProductID = d.ProductID
GROUP BY 
		 CUBE (c.CustomerID, o.OrderID, p.ProductName)
ORDER BY c.CustomerID ASC, o.OrderID ASC;
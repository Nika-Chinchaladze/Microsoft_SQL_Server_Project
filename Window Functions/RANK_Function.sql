-- Extract information about product, which were by the Same Customers:

SELECT
	p.ProductName,
	c.CustomerName,
	RANK() OVER(PARTITION BY c.CustomerID ORDER BY p.ProductName) AS RANK_Function
FROM Products AS p
	INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID;
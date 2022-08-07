-- MIN Function: Find Customers, who bought cheapest Products

SELECT 
	c.CustomerName,
	P.ProductName,
	P.Price
FROM Products AS p
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	LEFT JOIN Orders AS o ON o.OrderID = d.OrderID
	LEFT JOIN Customers AS c ON c.CustomerID = o.CustomerID
WHERE p.Price IN (SELECT MIN(Price) FROM Products);


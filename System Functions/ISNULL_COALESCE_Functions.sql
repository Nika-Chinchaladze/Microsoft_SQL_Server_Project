SELECT TOP 6
	p.ProductName,
	o.OrderID,
	ISNULL(o.OrderID, 0) AS Is_Null_OrderID,
	COALESCE(o.OrderID, 0) AS Coalesce_OrderID
FROM Products AS p
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	LEFT JOIN Orders AS o ON o.OrderID = d.OrderID
ORDER BY o.OrderID ASC;
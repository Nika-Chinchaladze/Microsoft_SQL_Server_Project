/*
Query should return products which have never been ordered.
*/

SELECT 
	p.ProductID,
	p.ProductName,
	d.OrderID,
	d.Quantity
FROM OrderDetails AS d
	RIGHT JOIN Products AS p ON p.ProductID = d.ProductID
WHERE d.OrderID IS NULL;
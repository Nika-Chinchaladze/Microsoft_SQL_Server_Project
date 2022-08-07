/*
Query should return productid-s, which have never been ordered. 
*/

SELECT	
	p.ProductID,
	p.ProductName
FROM Products AS p
	LEFT OUTER JOIN OrderDetails AS o ON o.ProductID = p.ProductID
WHERE o.OrderID IS NULL;
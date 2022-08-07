/*
Query should return sum of quantities from orderdetails table 
and the price of whole quantity for each productname.
*/

WITH CTE AS
 (
	SELECT	
		ProductID,
		SUM(Quantity) AS Quantity
	FROM OrderDetails
	GROUP BY ProductID
 )

SELECT	
	p.ProductName,
	p.Unit,
	c.Quantity,
	p.Price,
	SUM(c.Quantity*p.Price) AS Amount
FROM CTE AS c
	INNER JOIN Products AS p ON p.ProductID = c.ProductID
GROUP BY p.ProductName,
		 p.Unit,
		 c.Quantity,
		 p.Price
ORDER BY p.ProductName asc;
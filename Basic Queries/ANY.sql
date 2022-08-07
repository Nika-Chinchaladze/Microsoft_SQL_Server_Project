/*
Query should return products that were sold and Quantity were between 20 and 25.
*/

SELECT
	p.ProductID,
	p.ProductName,
	p.Price
FROM Products AS p
WHERE p.ProductID = ANY (
						SELECT 
							o.ProductID 
						FROM OrderDetails AS o
						WHERE o.Quantity BETWEEN 20 AND 25
						)
ORDER BY p.ProductID ASC;

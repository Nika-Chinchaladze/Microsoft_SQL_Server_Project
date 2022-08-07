/*
Query should return products whose prices are bigger than the AVERAGE price of products though Categories:
*/

SELECT
	p.ProductID,
	p.ProductName,
	p.Price
FROM Products AS p
WHERE p.Price > ALL (
					SELECT 
						AVG(Price) AS AVG_though_Categories
					FROM Products
					GROUP BY CategoryID
					)
ORDER BY p.ProductID ASC;
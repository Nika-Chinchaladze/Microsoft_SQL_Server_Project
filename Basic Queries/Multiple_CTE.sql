/*
Query should return the number of the products and total sales amounts for each product category.
*/

WITH First_CTE AS
(
	SELECT 
		p.CategoryID,
		c.CategoryName,
		COUNT(p.ProductID) AS Product_Number
	FROM Products AS p
		INNER JOIN Categories AS c ON c.CategoryID = p.CategoryID
	GROUP BY p.CategoryID, c.CategoryName
),
Second_CTE AS
(
	SELECT 
		r.CategoryID,
		SUM(d.Quantity * r.Price) AS Amounts
	FROM Products AS r
		INNER JOIN OrderDetails AS d ON d.ProductID = r.ProductID
	GROUP BY r.CategoryID
)
SELECT
	f.CategoryID,
	f.CategoryName,
	f.Product_Number,
	s.Amounts
FROM First_CTE AS f
	INNER JOIN Second_CTE AS s ON s.CategoryID = f.CategoryID
ORDER BY f.CategoryID ASC;
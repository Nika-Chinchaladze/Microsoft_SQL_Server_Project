-- Extract information about Saled Product's Quantities, use dense_rank and rank function and see the difference:

WITH First_CTE AS
(
	SELECT
		p.ProductName AS Name,
		COUNT(O.OrderID) AS Saled_Quantity
	FROM Products AS p
		LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		LEFT JOIN Orders AS o ON o.OrderID = d.OrderID
	GROUP BY p.ProductName
)
SELECT 
	 Name,
	 Saled_Quantity,
	 DENSE_RANK() OVER(ORDER BY Saled_Quantity ASC) AS Dense_Rank_Num,
	 RANK() OVER(ORDER BY Saled_Quantity ASC) AS Rank_Num
FROM First_CTE;
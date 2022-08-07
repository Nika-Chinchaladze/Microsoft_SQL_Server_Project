/*
Query should return products and their sales amounts, also in results should be profit_type determined by sales amounts.
*/

WITH CTE AS
(
	SELECT 
		p.ProductID,
		p.ProductName,
		SUM(d.Quantity * p.Price) AS Amounts
	FROM Products AS p
		LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	GROUP BY p.ProductID, p.ProductName
)
SELECT *,
	CASE
		WHEN Amounts IS NULL THEN 'NO PROFIT'
		WHEN Amounts BETWEEN 0 AND 5000 THEN 'LOW'
		WHEN Amounts BETWEEN 5001 AND 10000 THEN 'MEDIUM'
		WHEN Amounts BETWEEN 10001 AND 13000 THEN 'HIGH'
		ELSE 'BEST RESULT EVER SEEN'
	END AS Profit_Type
FROM CTE
ORDER BY Amounts ASC;



-- SUM Function: Find Total Sales Amounts for each Product

SELECT 
	p.ProductName,
	COALESCE(SUM(p.Price * d.Quantity), 0) AS Sales_Amounts
FROM Products AS p
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Sales_Amounts ASC;
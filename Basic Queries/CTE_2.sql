/*
Query should return Total Sales Amount, results should be grouped by productname and orderyear.
*/

WITH CTE (Full_Name, Amounts, Order_Year)
AS
(
	SELECT 
		p.ProductName,
		SUM(d.Quantity * p.Price),
		YEAR(o.OrderDate)
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	GROUP BY p.ProductName, YEAR(o.OrderDate)
)
SELECT * FROM CTE
ORDER BY Order_Year ASC, Amounts ASC;
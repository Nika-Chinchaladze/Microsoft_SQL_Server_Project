WITH CHINCHO AS
(
SELECT
	c.CategoryName,
	MONTH(o.OrderDate) AS Order_Month,
	SUM(p.Price * d.Quantity) AS Sales_Amounts
FROM Products AS p
	INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	INNER JOIN Categories AS c ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName,
		 MONTH(o.OrderDate)
)
SELECT 
	NTILE(3) OVER(PARTITION BY CategoryName ORDER BY Sales_Amounts ASC) AS Category_Backets,
	CategoryName,
	Order_Month,
	CASE
		WHEN Order_Month = 1 THEN 'January'
		WHEN Order_Month = 2 THEN 'February'
		WHEN Order_Month = 3 THEN 'March'
		WHEN Order_Month = 4 THEN 'April'
		WHEN Order_Month = 5 THEN 'May'
		WHEN Order_Month = 6 THEN 'June'
		WHEN Order_Month = 7 THEN 'Jule'
		WHEN Order_Month = 8 THEN 'August'
		WHEN Order_Month = 9 THEN 'September'
		WHEN Order_Month = 10 THEN 'Octomber'
		WHEN Order_Month = 11 THEN 'November'
		ELSE 'December'
	END AS Month_Name,
	CAST(Sales_Amounts AS VARCHAR(MAX)) +' '+'$' AS Amounts
FROM CHINCHO;
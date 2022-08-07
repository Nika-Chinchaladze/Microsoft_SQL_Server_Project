WITH CHINCHO AS
(
SELECT
	p.ProductName,
	YEAR(o.OrderDate) AS Order_Year,
	SUM(p.Price * d.Quantity) AS Sales_Amounts
FROM Products AS p
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	LEFT JOIN Orders AS o ON o.OrderID = d.OrderID
GROUP BY p.ProductName, YEAR(o.OrderDate)
)
SELECT
	ProductName,
	Order_Year,
	Sales_Amounts,
	ROUND(PERCENT_RANK() OVER(PARTITION BY Order_Year ORDER BY Sales_Amounts ASC), 2) AS Percantage
FROM CHINCHO;
WITH CHINCHO AS
(
SELECT
	p.ProductName,
	YEAR(o.OrderDate) AS Order_Year,
	MONTH(o.OrderDate) AS Order_Month,
	SUM(p.Price * d.Quantity) AS Sales_Amounts
FROM Products AS p
	INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	INNER JOIN Orders AS o ON o.OrderID = d.OrderID
GROUP BY p.ProductName,
		 YEAR(o.OrderDate),
		 MONTH(o.OrderDate)
)
SELECT 
	ProductName,
	Order_Year,
	Order_Month,
	Sales_Amounts,
	LAG(Sales_Amounts, 1) OVER(PARTITION BY Order_Year ORDER BY Sales_Amounts ASC) AS Previous_Values
FROM CHINCHO;
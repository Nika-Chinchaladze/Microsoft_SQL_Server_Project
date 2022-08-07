WITH CHINCHO AS
(
SELECT DISTINCT
	p.ProductName,
	c.CategoryName,
	YEAR(o.OrderDate) AS Order_Year
FROM Categories AS c
	LEFT JOIN Products AS p ON p.CategoryID = c.CategoryID
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	LEFT JOIN Orders AS o ON o.OrderID = d.OrderID
)
SELECT
	ProductName,
	Order_Year,
	LAST_VALUE(CategoryName) OVER(PARTITION BY Order_Year ORDER BY CategoryName) AS Last_Values
FROM CHINCHO;

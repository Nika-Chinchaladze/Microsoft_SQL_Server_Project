-- EXTRACT information about Products Prices through Categories, Use dense_rank to visualize if there are any equal Prices:

WITH CHINCHO AS
(
SELECT DISTINCT
	p.ProductName,
	c.CategoryID,
	p.Price
FROM Products AS p
	LEFT JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	LEFT JOIN Categories AS c ON c.CategoryID = p.CategoryID
)
SELECT 
	ProductName,
	Price,
	DENSE_RANK() OVER(PARTITION BY CategoryID ORDER BY Price) AS Dense_Rank_Line
FROM CHINCHO;
-- AVG FUNCTION:
SELECT
	ProductName,
	Price,
	(SELECT ROUND(AVG(Price), 2) FROM Products) AS Average_Price,
	Price - (SELECT ROUND(AVG(Price), 2) AS Average_Price FROM Products) AS Differense
FROM Products;
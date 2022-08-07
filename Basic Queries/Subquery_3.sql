/*
Subquery should return productname and price along with max, min and avg prices:
*/

SELECT 
	ProductName,
	Price,
	(SELECT MAX(Price) FROM PRODUCTS) AS Max_Price,
	(SELECT MIN(Price) FROM Products) AS Min_Price,
	(SELECT ROUND(AVG(Price), 1) FROM Products) AS Avg_Price
FROM Products
ORDER BY Price ASC;
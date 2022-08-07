-- STDEV Function: Find Standard Deviation of Price column and than difference between each Price and Deviation Itself

DECLARE @Deviation AS FLOAT;
SET @Deviation = (SELECT ROUND(STDEV(Price), 2) FROM Products);

SELECT
	ProductName,
	Price,
	Price - @Deviation AS Differense,
	@Deviation AS Deviation
FROM Products;

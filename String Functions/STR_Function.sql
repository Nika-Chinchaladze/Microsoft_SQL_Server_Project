SELECT
	ProductName,
	Price,
	CONCAT(STR(Price, 6, 3), SPACE(1), '$') AS New_Format
FROM Products;
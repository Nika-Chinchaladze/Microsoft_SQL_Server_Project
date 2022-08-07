SELECT
	ProductName,
	TRY_CAST(ProductName AS INT) AS Cast_Into_Int,
	TRY_CONVERT(INT, ProductName) AS Convert_Into_Int,
	Price,
	TRY_CAST(Price AS INT) AS CAST_INT,
	TRY_CONVERT(INT, Price) AS CONVERT_INT
FROM Products
WHERE Price - TRY_CAST(Price AS INT) > 0;
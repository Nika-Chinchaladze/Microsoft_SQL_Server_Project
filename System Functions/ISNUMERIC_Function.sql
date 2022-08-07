SELECT
	ProductName,
	ISNUMERIC(ProductName) AS Is_Numeric_Name,
	Price,
	ISNUMERIC(Price) AS Is_Numeric_Price
FROM Products;
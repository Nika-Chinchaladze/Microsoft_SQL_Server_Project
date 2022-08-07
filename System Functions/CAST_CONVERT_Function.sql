SELECT
	ProductName,
	Price,
	CAST(Price AS INT) AS Int_Price_Cast,
	CONVERT(INT, Price) AS Int_Price_Convert
FROM Products;
/*
Stored Procedure Should return CategoryName, ProductName and Price Columns,
Procedure Should have 4 parameters: low_price and high_price, One Parameter for CategoryID and
ONE Parameter for ProductName's first letter;
*/

CREATE PROCEDURE sp_get_products_with_category(
	@Low_price AS DECIMAL = 10,
	@High_price AS DECIMAL = 50,
	@ID AS INT = 1,
	@First_Latter AS VARCHAR(1) = 'C'
)
AS
BEGIN
	DECLARE @Category_ID AS INT, @Product_First_Letter AS VARCHAR(MAX);

	SET @Category_ID = @ID;
	SET @Product_First_Letter = @First_Latter;

	SELECT
		c.CategoryName,
		p.ProductName,
		p.Price
	FROM Categories AS c
		INNER JOIN Products AS p ON p.CategoryID = c.CategoryID
	WHERE c.CategoryID = @Category_ID 
		  AND p.ProductName LIKE @Product_First_Letter + '%'
		  AND p.Price BETWEEN @Low_price AND @High_price
	ORDER BY c.CategoryName ASC, p.ProductName ASC;
END;

-- EXECUTE sp_get_products_with_category;

/*
EXECUTE sp_get_products_with_category
	@Low_price = 1,
	@High_price = 50,
	@ID = 2,
	@First_Latter = 'C';
*/

-- DROP PROCEDURE sp_get_products_with_category;
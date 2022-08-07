/*
Stored Procedure Should return ProductID and Price as a New Table,
There should be two parameters to determine start and end point of ProductID,
If Start Point will be more than End Point, that there should be WARNING message in Messages Box!
*/

CREATE PROCEDURE sp_get_product_with_price(
	@Start_Point AS INT = 1,
	@End_Point AS INT = 10
)
AS
BEGIN
	DECLARE @Chincho TABLE(
			Product_ID INT,
			Product_Price FLOAT
	)

	DECLARE @Number AS INT = @Start_Point;

	IF @Start_Point < @End_Point
		BEGIN
			WHILE @Number <= @End_Point
			BEGIN
				INSERT INTO @Chincho
				SELECT
					ProductID,
					Price
				FROM Products
				WHERE ProductID = @Number;

				SET @Number = @Number + 1;
			END;
		END
	ELSE
		BEGIN
			PRINT 'Start Point is More Than End Point Change It!';
		END

	SELECT * FROM @Chincho;
END;


-- EXECUTE sp_get_product_with_price;

/*
EXECUTE sp_get_product_with_price
	@Start_Point = 1,
	@End_Point = 5;
*/

/*
EXECUTE sp_get_product_with_price
	@Start_Point = 3,
	@End_Point = 5;
*/

-- DROP PROCEDURE sp_get_product_with_price;



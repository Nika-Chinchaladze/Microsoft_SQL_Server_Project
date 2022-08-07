/*
Stored Procedure should return SalesAmounts Of each product, Procedure Should have two parameters:
One for filtering Order_Year and Second for filtering ProductID,
Also Inside the procedure there should be declared one more variable which hold the Number of 'SalesAmounts'
And that variable should be used in 'IF...ELSE' statement:
*/

CREATE PROCEDURE sp_get_products_saleamounts(
	@Order_year AS INT = 1996,
	@Product_ID AS INT = 1
)
AS
BEGIN
	DECLARE @Amounts AS DECIMAL;

	SELECT
		@Amounts = SUM(p.Price * d.Quantity)
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	WHERE YEAR(o.OrderDate) = @Order_year
		  AND p.ProductID = @Product_ID
	GROUP BY p.ProductID
	ORDER BY p.ProductID ASC;

	IF @@ROWCOUNT = 0
		BEGIN 
			PRINT 'Products with ' + CONVERT(VARCHAR(MAX), @Product_ID) + ' ProductID, were not Saled during ' + CONVERT(VARCHAR(MAX), @Order_year) 
		END
	ELSE
		BEGIN 
			PRINT 'The Number Of SalesAmounts For ' + CONVERT(VARCHAR(MAX), @Product_Id) + ' ProductID Is ' + CONVERT(VARCHAR(MAX), @Amounts) + ' $'; 
		END;

END;

-- EXECUTE sp_get_products_saleamounts;

/*

EXECUTE sp_get_products_saleamounts
	@Order_year = 1996,
	@Product_ID = 2;

*/

-- DROP PROCEDURE sp_get_products_saleamounts;
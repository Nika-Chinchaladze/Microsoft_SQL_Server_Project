/*
Stored Procedure Should return information about SalesAmounts Quantity - If it was More or Less than Control Value through Year, 
So User should have possibiliy to determine OrderYear and Control Value;
*/

CREATE PROCEDURE sp_get_nested_salesamount_message(
	@Order_Year AS INT = 1997,
	@Control_Amounts AS DECIMAL = 200000
)
AS
BEGIN
	DECLARE @Sales_Amounts AS DECIMAL;

	SELECT
		@Sales_Amounts = SUM(p.Price * d.Quantity)
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	WHERE YEAR(o.OrderDate) = @Order_Year;

	SELECT @Sales_Amounts;

	IF @Sales_Amounts > @Control_Amounts
		BEGIN 
			IF @Order_Year BETWEEN 1996 AND 1997
				PRINT 'During ' + CONVERT(VARCHAR(MAX), @Order_Year) + ' Sales Amounts Were More than ' + CONVERT(VARCHAR(MAX), @Control_Amounts) + '!';
			ELSE
				PRINT 'Order_Year Is Not CORRECT!, Change it with 1996 or 1997 ONLY!';
		END
	ELSE
		BEGIN 
			IF @Order_Year BETWEEN 1996 AND 1997
				PRINT 'During ' + CONVERT(VARCHAR(MAX), @Order_Year) + ' Sales Amounts Were Less than ' + CONVERT(VARCHAR(MAX), @Control_Amounts) + '!';
			ELSE
				PRINT 'Order_Year Is Not CORRECT!, Change it with 1996 or 1997 ONLY!'; 
		END
END;


-- EXECUTE sp_get_nested_salesamount_message;

/*
EXECUTE sp_get_nested_salesamount_message
	@Order_Year = 1996,
	@Control_Amounts = 200000;
*/

/*
EXECUTE sp_get_nested_salesamount_message
	@Order_Year = 1997,
	@Control_Amounts = 200000;
*/

/*
EXECUTE sp_get_nested_salesamount_message
	@Order_Year = 1999,
	@Control_Amounts = 200000;
*/
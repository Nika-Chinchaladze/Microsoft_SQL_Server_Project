/*
Stored Procedure Should return Customer's OrderDates during 1997 => year,
It should have one input and one output parameter,
OUTPUT - parameter should be used to determine number of returned rows,
INPUT - parameter should be used to filter Order_Year;
*/

CREATE PROCEDURE sp_get_customer_orderdate(
	@order_year AS INT,
	@Count_Returned_Rows AS INT OUTPUT
)
AS
BEGIN
	SELECT
		c.CustomerName,
		o.OrderDate
	FROM Orders AS o
		INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
	WHERE YEAR(o.OrderDate) = @order_year
	ORDER BY c.CustomerName ASC;

	SELECT @Count_Returned_Rows = @@ROWCOUNT;
END;

-------------------------------------------------------------------
/*

DECLARE @Returned_Rows AS INT;

EXECUTE sp_get_customer_orderdate
	@Order_year = 1997,
	@Count_Returned_Rows = @Returned_Rows OUTPUT;

SELECT @Returned_Rows AS 'Number of returned Rows!';

*/
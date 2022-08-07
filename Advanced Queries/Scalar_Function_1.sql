/*
Create Scalar Function, Which should have one parameter -> CustomerName 
and Function should extract information about customer's total spents on sales;
*/

CREATE OR ALTER FUNCTION dbo.Get_Spent_Money(
	@CustomerName nvarchar(max)
	)
RETURNS FLOAT
AS
BEGIN
	DECLARE @Spented FLOAT
		SELECT
			@Spented = SUM(d.Quantity * p.Price)
		FROM Customers AS c
			INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
			INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
			INNER JOIN Products AS p ON p.ProductID = d.ProductID
		WHERE c.CustomerName = @CustomerName
		GROUP BY c.CustomerName
	RETURN @Spented
END;


-- SELECT dbo.Get_Spent_Money('Bon app') as Spent_By_Customer;

/*
select 
	CustomerName,
	dbo.Get_Spent_Money(CustomerName) as Spent_On_Sales
from customers
ORDER BY Spent_On_Sales DESC;
*/

-- DROP FUNCTION dbo.Get_Spent_Money
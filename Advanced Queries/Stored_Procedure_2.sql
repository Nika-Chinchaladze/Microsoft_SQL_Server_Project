/*
Stored Procedure should return Products SalesAmounts, which will be between parameters defined by User, 
Also User should be able to define first letter of ProductName;
*/

CREATE PROCEDURE sp_Product_Sales_Amounts(
	@Down_price AS DECIMAL = 500,
	@Up_price AS DECIMAL = 2000,
	@Product_Name AS VARCHAR(1)
)
AS
BEGIN
	SELECT
		p.ProductName,
		SUM(p.Price*d.Quantity) AS Amounts
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
	WHERE p.ProductName LIKE @Product_Name + '%'
	GROUP BY p.ProductName
	HAVING SUM(p.Price*d.Quantity) BETWEEN @Down_price AND @Up_price
	ORDER BY Amounts ASC;
END;

/*
EXECUTE sp_Product_Sales_Amounts
	@Product_Name = 'T';
*/

/*
EXECUTE sp_Product_Sales_Amounts
	@Down_price = 1000,
	@Up_price = 5000,
	@Product_Name = 'S';
*/

-- DROP PROCEDURE sp_Product_Sales_Amounts;

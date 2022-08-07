/*
Create Table_Value Function, which should have two parameters, starting and ending point,
Function should return ProductNames and Sales Amounts, where ProductNames should be filtered by Parameters.
*/

CREATE FUNCTION dbo.F_Get_Through_Alphabet(
	@Start_point NVARCHAR(1),
	@End_point NVARCHAR(1)
)
RETURNS TABLE
AS
RETURN
	SELECT
		p.ProductName,
		SUM(p.Price * d.Quantity) AS Sales_Amounts
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	WHERE SUBSTRING(p.ProductName, 1, 1) BETWEEN @Start_point AND @End_point 
	GROUP BY p.ProductName;

-- SELECT * FROM dbo.F_Get_Through_Alphabet('A', 'D');
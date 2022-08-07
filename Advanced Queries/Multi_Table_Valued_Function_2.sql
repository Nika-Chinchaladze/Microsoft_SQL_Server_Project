/*
Create Multi-Statement Table-Value Function with two parameters,
Function should return information about Product's Sales Amounts,
Parameters should be related to ProductID.
*/

CREATE FUNCTION M_Get_Sales_Amounts(@Start_ID INT, @End_ID INT)
	RETURNS @Sales TABLE(
		ProductID INT,
		ProductName NVARCHAR(150),
		Sales_Amounts FLOAT
	)
AS
BEGIN
	INSERT INTO @Sales
	SELECT 
		d.ProductID,
		p.ProductName,
		SUM(p.Price * d.Quantity) AS Sales_Amounts
	FROM OrderDetails AS d
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
		INNER JOIN Products AS p ON p.ProductID = d.ProductID
	WHERE d.ProductID BETWEEN @Start_ID AND @End_ID
	GROUP BY d.ProductID, p.ProductName;
	RETURN;
END;


-- SELECT * FROM M_Get_Sales_Amounts(1, 10);

-- DROP FUNCTION IF EXISTS M_Get_Sales_Amounts;
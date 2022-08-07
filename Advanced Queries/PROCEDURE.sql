/*
Create Procedure - spProfitByProducts,
Procedure should return productname, unit, sum of realization cash
-> as Amounts, sum of real cost -> as TotalCost and Profit(Amount - TotalCost)
Procedure should have one parameter - categoryid and it should be
used in WHERE CLAUSE.
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Nika Chinchaladze
-- Create date: '2022-06-15'
-- Description:	Procedure About Profit
-- =============================================
CREATE PROCEDURE spProfitByProducts 

	@CategoryID int

AS
BEGIN
	
	SELECT	
		p.ProductName,
		p.Unit,
		SUM(d.Quantity*p.Price) AS Amount,
		SUM(c.cost*d.Quantity) AS TotalCost,
		SUM(d.Quantity*p.Price) - SUM(c.cost*d.Quantity) AS Profit
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN ProductCost AS c ON c.ProductID = p.ProductID
	WHERE p.CategoryID = @CategoryID OR @CategoryID IS NULL
	GROUP BY p.ProductName, p.Unit

END
GO

-- execute spProfitByProducts 1;
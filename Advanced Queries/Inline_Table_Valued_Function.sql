/*
Create table-valued function - tfProfitByProducts,
function should return productname, unit, sum of realization cash
-> as Amounts, sum of real cost -> as TotalCost and 
Profit(Amount - TotalCost)
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Nika Chinchaladze
-- Create date: '2022-06-15'
-- Description:	Profit By Products
-- =============================================
CREATE FUNCTION tfProfitByProducts 
( )
RETURNS TABLE 
AS
RETURN 
(
SELECT	
	p.ProductName,
	p.Unit,
	SUM(d.Quantity*p.Price) AS Amount,
	SUM(c.cost*d.Quantity) AS TotalCost,
	SUM(d.Quantity*p.Price) - SUM(c.cost*d.Quantity) AS Profit
FROM Products AS p
	INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	INNER JOIN ProductCost AS c ON c.ProductID = p.ProductID
GROUP BY p.ProductName, p.Unit
)
GO

-- select * from tfProfitByProducts();

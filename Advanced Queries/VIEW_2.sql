 
-- VIEW should return Price, SUM of products Quantity and total Amounts.

CREATE VIEW SalesAmounts
AS
SELECT
	p.ProductName,
	p.Unit,
		(
		SELECT SUM(d.Quantity) FROM OrderDetails AS d
		WHERE d.ProductID = p.ProductID
		) AS Qiantity,
	p.Price,
		(
		SELECT SUM(d.Quantity) FROM OrderDetails AS d
		WHERE d.ProductID = p.ProductID
		) * p.Price AS Amounts
FROM Products AS p;
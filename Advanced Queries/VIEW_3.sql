/*
VIEW should return total quantity of each product with it's price and total sales amounts.
1) should be extracted only those products, that where sold from '1996-05-01' to '1996-11-30'
2) productnames must contains 'Ch' characters
3) sales amounts must be from 3000 to 7000
For Filtering results should be used advanced subqueries
*/

CREATE VIEW SalesAmounts_by_Subquery
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
FROM Products AS p
WHERE p.ProductID IN (
					 SELECT 
						q.ProductID 
					 FROM OrderDetails AS q
						INNER JOIN Orders AS o ON o.OrderID = q.OrderID
					 WHERE o.OrderDate BETWEEN '1996-05-01' AND '1996-11-30'
					 )
					 AND p.ProductName LIKE '%Ch%'
					 AND EXISTS (
								SELECT
									r.ProductID,
									SUM(r.Quantity * t.Price) AS Amounts
								FROM OrderDetails AS r
									INNER JOIN Products AS t ON t.ProductID = r.ProductID
								WHERE p.ProductID = t.ProductID
								GROUP BY r.ProductID
								HAVING SUM(r.Quantity * t.Price) BETWEEN 3000 AND 7000
								);
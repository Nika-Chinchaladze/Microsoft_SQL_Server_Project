/*
Query should return sum of quantities from orderdetails table 
and the price of whole quantity for each productname.
You must use Subqueries.
*/

SELECT	
	p.ProductName,
	p.Unit,
		(SELECT SUM(d.Quantity) 
		 FROM OrderDetails AS d
		 WHERE d.ProductID = p.ProductID) AS Quantity,
	p.Price,
		(SELECT SUM(d.Quantity) 
		 FROM OrderDetails AS d
		 WHERE d.ProductID = p.ProductID) * p.Price AS Amount
FROM Products AS p
ORDER BY p.ProductName asc;
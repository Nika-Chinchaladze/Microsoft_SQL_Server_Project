/*
Query should return quantity of sold products bought by customers,
results should be ordered by customername and orderdate in ascending
order, Results should be inserted into CustomerSales table.
*/

INSERT INTO CustomerSales

SELECT	
	o.OrderDate,
	c.CustomerName,
	p.ProductName,
	p.Unit,
	SUM(d.Quantity) AS Quantity
FROM Orders AS o
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
	INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
	INNER JOIN Products AS p ON p.ProductID = d.ProductID
GROUP BY o.OrderDate,
		 c.CustomerName,
		 p.ProductName,
		 p.Unit
ORDER BY c.CustomerName asc,
		 o.OrderDate asc;
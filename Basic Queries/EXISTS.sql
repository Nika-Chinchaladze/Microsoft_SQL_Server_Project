/*
Query should return all customers who have placed more than 3 orders during 1996 year.
*/

SELECT 
	c.CustomerName,
	o.OrderDate,
	o.OrderID
FROM Customers AS c
	INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
WHERE 
	EXISTS (
			SELECT COUNT(*) FROM Orders AS d
			WHERE d.CustomerID = c.CustomerID AND YEAR(d.OrderDate) = 1996
			GROUP BY d.CustomerID
			HAVING COUNT(*) > 3
			)
ORDER BY c.CustomerName ASC, o.OrderDate ASC;
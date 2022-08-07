/*
Query should return CustomerNames, who haven't ordered yet and insted of null values, there should be written 'Not Ordered Yet'.
*/

SELECT 
	c.CustomerName,
	COALESCE(CAST(o.OrderDate AS VARCHAR(MAX)), 'Not Ordered Yet') AS Order_Time
FROM Customers AS c
	LEFT JOIN Orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderDate IS NULL
ORDER BY o.OrderDate ASC;
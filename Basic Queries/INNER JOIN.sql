/*
Query should return fullname of employees and their customers,
who made an order before 1997-01-01. Results should be ordered by
employees fullname in ascending order.
*/

SELECT	DISTINCT
		e.FirstName + ' ' + e.LastName AS Fullname,
		c.CustomerName
FROM Orders AS o
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
	INNER JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
WHERE o.OrderDate < '1997-01-01'
ORDER BY Fullname asc;
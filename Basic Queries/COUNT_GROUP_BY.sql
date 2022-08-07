/*
Query should return number of orders completed by employees,
firstname and lastname should be concatinated as fullname,
retults should be ordered by number of completed orders in
descending order.
*/

SELECT	
	e.FirstName + ' ' + e.LastName AS FullName,
	COUNT(o.OrderID) AS OrdersQuantity
FROM Orders AS o
	INNER JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName + ' ' + e.LastName
ORDER BY OrdersQuantity desc;
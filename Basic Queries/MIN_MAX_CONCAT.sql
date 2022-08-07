/*
Query should return sum and average quantities of sold products for each employee,
also query should return first and last orderdates.
Condition: sum should be more than 100.
*/

SELECT	
	o.EmployeeID,
	CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
	SUM(d.Quantity) AS TotalQuantity,
	ROUND(AVG(d.Quantity), 2) AS AverageQuantity,
	MIN(o.OrderDate) AS FirstOrderDate,
	MAX(o.OrderDate) AS LastOrderDate
FROM Employees AS e
	INNER JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	INNER JOIN OrderDetails AS d ON d.OrderID = o.OrderID
GROUP BY o.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName)
HAVING SUM(d.Quantity) > 100
ORDER BY o.EmployeeID ASC;
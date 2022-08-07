-- COUNT FUNCTION: Find Quantity of Employee's Completed Orders

SELECT
	e.FirstName +' '+ e.LastName AS Full_Name,
	COUNT(o.OrderID) AS Completed_Orders
FROM Employees AS e
	LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
GROUP BY e.FirstName +' '+ e.LastName
ORDER BY Completed_Orders ASC;
/*
Query should return employees and Number of their Customers.
Use Recursive Common Table Expressions.
*/

WITH First_CTE (EmployeeID, Full_Name, Number_Of_Customers)
AS
(
	SELECT 
		e.EmployeeID,
		e.FirstName +' '+ e.LastName,
		o.CustomerID
	FROM Employees AS e
		LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	WHERE o.CustomerID IS NULL
	UNION ALL
	SELECT 
		e.EmployeeID,
		e.FirstName +' '+ e.LastName,
		COUNT(o.CustomerID)
	FROM Employees AS e
		LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	WHERE e.FirstName <> 'Adam' AND e.LastName != 'West'
	GROUP BY e.EmployeeID, e.FirstName +' '+ e.LastName
)
SELECT * FROM First_CTE
ORDER BY Number_Of_Customers ASC;
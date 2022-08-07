/* 
Query Should return EVERY POSSIBLE COMBINATION of Customer and Employer Relationship:
*/

SELECT 
	e.EmployeeID,
	CONCAT(e.FirstName, ' ', e.LastName) AS Full_Name,
	c.CustomerID,
	c.CustomerName
FROM Customers AS c
	CROSS JOIN Employees AS e
ORDER BY e.EmployeeID ASC, c.CustomerID ASC;



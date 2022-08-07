/*
Using: LIKE operator in Action:
*/

SELECT 
	EmployeeID,
	FirstName + ' ' + LastName AS FullName,
	BirthDate
FROM Employees
WHERE FirstName LIKE 'S%' OR         -- 5. Steven 
	  FirstName LIKE '_argaret%' OR  -- 4. Margaret
	  FirstName LIKE '%[xyz]' OR     -- 1. Nancy
	  FirstName LIKE '[R-T]%' OR     -- 7. Robert
	  LastName LIKE '[^A-V]%' OR     -- 10. West
	  (FirstName NOT LIKE '[A-K]%' AND FirstName NOT LIKE '[M-Z]%')  -- 8. Laura
ORDER BY EmployeeID ASC;
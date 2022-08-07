/*
Create Table Variable, Which should hold information about Employees Marital Status;
*/

DECLARE @Employee_marital_status TABLE (
	EmployeeID INT,
	Full_Name NVARCHAR(100),
	Marital_Status NVARCHAR(100)
);
---------------------------------------------------------
INSERT INTO @Employee_marital_status
SELECT	
	EmployeeID,
	FirstName +' '+ LastName,
	CASE
		WHEN EmployeeID IN (1, 3, 5, 7, 9) THEN 'Married'
		ELSE 'Single'
	END
FROM Employees;
---------------------------------------------------------
SELECT 
	ms.Full_Name,
	e.BirthDate,
	ms.Marital_Status
FROM @Employee_marital_status AS ms
	INNER JOIN Employees AS e ON e.EmployeeID = ms.EmployeeID;

GO
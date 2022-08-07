/*
Multi-Statement Table-Valued Function should return Number Of
Completed Orders Through each employer, Also We Should have ability to 
Choose one employer, who's information won't be included in result set.
Function should have one parameter, EmployerID who won't be INCLUDED.
*/

CREATE FUNCTION T_Get_Completed_Orders(
@Emp_ID INT
)
	RETURNS @EmpOrders TABLE(
		EmployerID INT,
		FullName NVARCHAR(150),
		Completed_Orders FLOAT
	)
AS
BEGIN
		DECLARE @Start INT = 0, @Length INT = (SELECT COUNT(DISTINCT EmployeeID) FROM Employees);
		
		WHILE @Start < @Length
		BEGIN
			INSERT INTO @EmpOrders
			SELECT 
				e.EmployeeID,
				e.FirstName +' '+ e.LastName,
				COUNT(o.OrderID)
			FROM Orders AS o
				INNER JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
			WHERE e.EmployeeID = @Start AND e.EmployeeID != @Emp_ID
			GROUP BY e.EmployeeID, e.FirstName +' '+ e.LastName;

			SET @Start = @Start + 1;
		END;
	RETURN;
END;


-- SELECT * FROM T_Get_Completed_Orders(1);

-- DROP FUNCTION T_Get_Completed_Orders;


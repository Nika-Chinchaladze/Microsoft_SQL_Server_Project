/*
Stored Procedure should return information about Employers Completed Orders,
User Should have possibility to determine Start point to filter employers through EmployeeID,
Also User should have possibility to determine Stop Point, where while loop stops working;

If User determine Parameters WRONGLY, there should be WARNING message, where will be explained User's MISTAKE!
*/

CREATE PROCEDURE sp_get_employee_completed(
	@Start_Employee_ID AS INT = 1,
	@Stop_Point AS INT = 5
)
AS
BEGIN
	DECLARE @Variable TABLE(
		Employee_ID INT,
		Full_Name VARCHAR(MAX),
		Completed_Orders FLOAT
	)

	DECLARE @Number AS INT = @Start_Employee_ID - 1;

	IF @Start_Employee_ID < @Stop_Point
	BEGIN
		WHILE @Number < @Stop_Point
		BEGIN
			SET @Number = @Number + 1;

			IF @Number = @Stop_Point
				BREAK;
			ELSE
				BEGIN
					INSERT INTO @Variable
					SELECT
						e.EmployeeID,
						e.FirstName + ' ' + e.LastName,
						COUNT(o.OrderID)
					FROM Employees AS e
						LEFT JOIN Orders AS o ON o.EmployeeID = E.EmployeeID
					WHERE e.EmployeeID  = @Number
					GROUP BY e.FirstName + ' ' + e.LastName, e.EmployeeID
					ORDER BY e.EmployeeID ASC;
				END;
		END;
	END
	ELSE
		BEGIN 
			PRINT 'Start_Employee_ID is more than @Stop_Point, Fix It!' 
		END;

	SELECT * FROM @Variable;
END;

-- EXECUTE sp_get_employee_completed;

/*
EXECUTE sp_get_employee_completed
	@Start_Employee_ID = 4,
	@Stop_Point = 10;
*/

/*
EXECUTE sp_get_employee_completed
	@Start_Employee_ID = 4,
	@Stop_Point = 2;
*/

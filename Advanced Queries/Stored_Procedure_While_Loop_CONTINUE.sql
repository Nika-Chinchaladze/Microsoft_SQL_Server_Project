/*
Stored Procedure should return information about Employers Completed Orders,
User Should have possibility to determine start and end point to filter employers through EmployeeID,
Also User should have possibility to determine Un_Wanted_Employers, whose Completed Orders won't be displayed;

If User determine Parameters WRONGLY, there should be WARNING message, where will be explained User's MISTAKE!
*/

CREATE PROCEDURE sp_get_employee_orders(
	@Start_Employee_ID AS INT = 1,
	@End_Employee_ID AS INT = 10,
	@Un_Wanted_ID AS INT = 5
)
AS
BEGIN
	DECLARE @Variable TABLE(
		Employee_ID INT,
		Full_Name VARCHAR(MAX),
		Completed_Orders FLOAT
	)

	DECLARE @Number AS INT = @Start_Employee_ID - 1;

	IF @Start_Employee_ID < @End_Employee_ID AND (@Un_Wanted_ID > @Start_Employee_ID AND @Un_Wanted_ID < @End_Employee_ID)
	BEGIN
		WHILE @Number <= @End_Employee_ID  -- while starts
		BEGIN
			SET @Number = @Number + 1;

			IF @Number = @Un_Wanted_ID
				CONTINUE;
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
			PRINT 'Start_Employee_ID is more than End_Employee_ID Or Un_Wanted_ID is not determined CORRECTLY, Fix It!' 
		END;

	SELECT * FROM @Variable;
END;

-- EXECUTE sp_get_employee_orders;

/*
EXECUTE sp_get_employee_orders
	@Start_Employee_ID = 2,
	@End_Employee_ID = 8,
	@Un_Wanted_ID = 5; 
*/

/*
EXECUTE sp_get_employee_orders
	@Start_Employee_ID = 8,
	@End_Employee_ID = 2,
	@Un_Wanted_ID = 5;
*/

/*
EXECUTE sp_get_employee_orders
	@Start_Employee_ID = 2,
	@End_Employee_ID = 8,
	@Un_Wanted_ID = 10;
*/


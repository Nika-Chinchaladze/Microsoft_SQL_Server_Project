/*
# Aim of this procedure is to catch ZeroDivisionError:
With this procedure I create table variable @new_table, where is inserted information about employee's
completed orders, also I add extra column Salary, which is multiplication of Completed orders and 15,
After that I try to find quantity of money that is given for one order and this number is Salary / Completed_Orders;
There is one employee Adam, who has never completed any order so during Division - here will occur ZeroDivisioError and
this procedure will CATCH it!
*/

CREATE PROCEDURE sp_catch_zero_division(
	@Employee_ID AS INT = 5
)
AS
BEGIN
	DECLARE @new_table TABLE(
		Employee_ID INT,
		FullName VARCHAR(150),
		Salary FLOAT,
		CompletedOrders INT
	);

		INSERT INTO @new_table
		SELECT
			e.EmployeeID,
			e.FirstName + ' ' + e.LastName AS Full_Name,
			COUNT(o.OrderID) * 15 AS Salary,
			COUNT(o.OrderID) AS Completed_Orders
		FROM Employees AS e
			LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
		GROUP BY e.EmployeeID, e.FirstName + ' ' + e.LastName;

	DECLARE @Division AS FLOAT;
	BEGIN TRY
			SELECT
				@Division = Salary / CompletedOrders
			FROM @new_table
			WHERE Employee_ID = @Employee_ID;
			PRINT @Division;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS Number_Error,
			ERROR_SEVERITY() AS Severity_Error,
			ERROR_STATE() AS State_Error,
			ERROR_PROCEDURE() AS Procedure_Error,
			ERROR_LINE() AS Line_Error,
			ERROR_MESSAGE() AS Message_Error;
	END CATCH
END;


-- EXECUTE sp_catch_zero_division 1;

-- Here ZeroDivisionError is Caugth:
-- EXECUTE sp_catch_zero_division 10;
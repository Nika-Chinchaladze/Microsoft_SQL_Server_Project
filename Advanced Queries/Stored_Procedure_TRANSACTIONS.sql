/*
With this procedure I tried catch Delete Restriction Error, when there are relationships and dependences between tables:
In this example it is clear that becouse of that Products table is depended on Suppliers table, we can't delete any row
from Products table, without deleting relationship itself in the first place;
*/

CREATE PROCEDURE sp_restricted_delete(
	@Product_ID AS INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
			DELETE FROM Products
			WHERE ProductID = @Product_ID;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS Number_Error, 
			ERROR_SEVERITY() AS Severity_Error,  
			ERROR_STATE() AS State_Error,
			ERROR_LINE () AS Line_Error,
			ERROR_PROCEDURE() AS Procedure_Error,  
			ERROR_MESSAGE() AS Message_Error;

			IF (XACT_STATE()) = -1
				BEGIN
					PRINT  N'The transaction CAN NOT be commited,' +  'Rolling back transaction';
					ROLLBACK TRANSACTION;
				END;
			IF (XACT_STATE()) = 1
				BEGIN
					PRINT N'The transaction CAN be commited,' +  'Commiting transaction';
					COMMIT TRANSACTION;
				END;
	END CATCH
END;

-- EXECUTE sp_restricted_delete 80;
/*
Stored Procedure should return information about Suppliers living places,
Results should be returned as 'MESSAGE' so, you should use special Function for that,
Procedure should have one parameter to determine number of returned rows,
If determined number of rows will be out of range, then there should appear 
WARNING Message with appropriate Instructive Information!
*/

CREATE PROCEDURE sp_suppliers_location(
	@Row_Number AS INT = 10
)
AS
BEGIN
	DECLARE 
		@Name AS VARCHAR(MAX), 
		@Location AS VARCHAR(MAX), 
		@Number AS INT = 0,
		@Length AS INT = (SELECT count(*) FROM Suppliers);

	DECLARE First_Cursor CURSOR
	FOR SELECT 
			SupplierName,
			City
		FROM Suppliers
		WHERE SupplierID <= @Row_Number;

	OPEN First_Cursor;
	FETCH NEXT FROM First_Cursor INTO @Name, @Location;

	IF @Row_Number <= @Length
		BEGIN
		WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @Number = @Number + 1
				PRINT CONVERT(VARCHAR(MAX), @Number) + ') ' + @Name +' Lives In '+ @Location;
				FETCH NEXT FROM First_Cursor INTO @Name, @Location;
			END;
		END
	ELSE
		BEGIN
			PRINT 'Determined Number Of Rows is OUT OF RANGE, change it!';
		END;
	CLOSE First_Cursor;
	DEALLOCATE First_Cursor;
END;

-- EXECUTE sp_suppliers_location

/*
EXECUTE sp_suppliers_location
	@Row_Number = 29;
*/

/*
EXECUTE sp_suppliers_location
	@Row_Number = 35;
*/

-- DROP PROCEDURE sp_suppliers_location;
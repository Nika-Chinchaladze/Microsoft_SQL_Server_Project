/*
-- First create table, which will hold information about changes in the DATABASE:

CREATE TABLE Capture_Modifications(
	Change_id INT IDENTITY PRIMARY KEY,
	Event_Name XML NOT NULL,
	Changed_By SYSNAME NOT NULL
);
*/


-- Second Step: CREATE TRIGGER

CREATE TRIGGER tg_capture_changes
ON DATABASE
FOR CREATE_INDEX, ALTER_INDEX, DROP_INDEX
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Capture_Modifications(
		Event_Name,
		Changed_By
	)
	VALUES(
		EVENTDATA(),
		USER
	);
END;


-- CREATE NONCLUSTERED INDEX index_first_name ON dbo.Employees(FirstName);
-- CREATE NONCLUSTERED INDEX index_last_name ON dbo.Employees(LastName);

-- SELECT * FROM Capture_Modifications;
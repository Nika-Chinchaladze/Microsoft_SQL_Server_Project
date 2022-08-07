-- First lounch table creation script and after that we gan create trigger, which will hold information
-- about changes in Shippers table, related to INSERT and DELETE; 

/*
CREATE TABLE Table_For_Shippers_trigger(
	ShipperID INT,
	ShipperName VARCHAR(150),
	UpdateDate DATE,
	Opearion_Type VARCHAR(100)
);
*/

CREATE TRIGGER tg_Shippers
ON dbo.Shippers
AFTER INSERT, DELETE
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO Table_For_Shippers_trigger(
		ShipperID,
		ShipperName,
		UpdateDate,
		Opearion_Type
	)
	SELECT
		i.ShipperID,
		ShipperName,
		GETDATE(),
		'INSERT'
	FROM Inserted i
	UNION ALL
	SELECT
		d.ShipperID,
		ShipperName,
		GETDATE(),
		'DELETE'
	FROM Deleted d;

END;


-- INSERT INTO Shippers VALUES(4, 'Chincharito', '599998877');
-- SELECT * FROM Table_For_Shippers_trigger;

-- DELETE FROM Shippers WHERE ShipperID = 4;
-- SELECT * FROM Table_For_Shippers_trigger;
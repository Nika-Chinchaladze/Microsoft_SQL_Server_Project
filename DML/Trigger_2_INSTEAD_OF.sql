/*
-- First Step: Create New Table

CREATE TABLE Aprove_Suppliers(
	SupplierID INT IDENTITY PRIMARY KEY,
	SupplierName VARCHAR(150)
);
*/

/*
-- Second Step: Create VIEW

CREATE VIEW vw_Get_Supplier
AS
	SELECT
		SupplierName,
		'Approved' AS Aproval_Status
	FROM Suppliers
	UNION ALL
	SELECT
		SupplierName,
		'Waiting to be Approved' AS Aproval_Status
	FROM Aprove_Suppliers;
*/


-- Third Step: CREATE TRIGGER

CREATE TRIGGER tg_VW_Suppliers
ON dbo.Suppliers
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Aprove_Suppliers(
		SupplierName
	)
	SELECT
		i.SupplierName
	FROM Inserted AS i
	WHERE i.SupplierName NOT IN (
								SELECT
									SupplierName
								FROM Suppliers
								);
END;


-- INSERT INTO Suppliers(SupplierName) VALUES('Nika Chinchaladze');

-- SELECT * FROM vw_Get_Supplier ORDER BY Aproval_Status DESC;

-- SELECT * FROM Aprove_Suppliers;
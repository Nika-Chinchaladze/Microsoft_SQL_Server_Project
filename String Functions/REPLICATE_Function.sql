-- AFTER EXECUTION SupplierNames should have the same length, empty spaces should be filled with $ - symbol;

DECLARE @MAX_LEN AS INT;
SET @MAX_LEN = (SELECT MAX(LEN(SupplierName)) FROM Suppliers);

WITH CHINCHO AS
(
SELECT 
	SupplierName,
	LEN(SupplierName) AS Name_Len,
	@MAX_LEN AS Maximum_Length
FROM Suppliers
),
LAZVI AS
(
SELECT 
	*,
	CONCAT(SupplierName, REPLICATE('$', @MAX_LEN - Name_Len)) AS Formated_Name
FROM CHINCHO
)
SELECT
	*,
	LEN(Formated_Name) AS New_Length
FROM LAZVI
ORDER BY Name_Len ASC;
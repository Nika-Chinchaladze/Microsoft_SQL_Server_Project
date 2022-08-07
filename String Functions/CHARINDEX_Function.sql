-- Substring name from SupplierName before first SPACE:

WITH CHINCHO AS
(
	SELECT
		SupplierName,
		CHARINDEX(' ', SupplierName) AS Space_Position
	FROM Suppliers
),
LAZVI AS
(
	SELECT 
		*,
		SUBSTRING(SupplierName, 1, Space_Position) AS Before_Space
	FROM CHINCHO
)
SELECT
	*
FROM LAZVI
WHERE LEN(Before_Space) > 0;
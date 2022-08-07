-- Replace () with '' in Phone Column:

WITH CHINCHO AS
(
SELECT 
	SupplierName AS Names,
	Phone,
	REPLACE(Phone, '(', '') AS First_Format
FROM Suppliers
)
SELECT
	Names,
	Phone,
	REPLACE(First_Format, ')', '') AS Last_Format
FROM CHINCHO;
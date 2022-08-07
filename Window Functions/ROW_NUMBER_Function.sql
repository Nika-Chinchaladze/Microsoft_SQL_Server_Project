-- EXTRAXT information about Cities, In each Country:

SELECT
	Country,
	City,
	ROW_NUMBER() OVER(PARTITION BY Country ORDER BY Country ASC) AS Row_Numbering
FROM Customers;
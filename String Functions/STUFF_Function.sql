-- Replace Every FirstName with Nikolas in CustomerNames Column;

WITH CHINCHO AS
(
SELECT 
	CustomerName,
	CHARINDEX(' ', CustomerName) AS Space_Position
FROM Customers
WHERE CHARINDEX(' ', CustomerName) <> 0
)
SELECT 
	*,
	STUFF(CustomerName, 1, Space_Position-1, 'Nikolas') AS New_Name
FROM CHINCHO;
-- Find Only Dinstinct First Names of Customers:
WITH CHINCHO AS
(
SELECT
	CustomerName,
	CHARINDEX(' ', CustomerName) AS Space_Position
FROM Customers
),
LAZVI AS
(
SELECT
	CustomerName,
	UPPER(LEFT(CustomerName, Space_Position)) AS First_Name
FROM CHINCHO
WHERE LEN(LEFT(CustomerName, Space_Position)) > 0
)
SELECT DISTINCT
	First_Name 
FROM LAZVI;
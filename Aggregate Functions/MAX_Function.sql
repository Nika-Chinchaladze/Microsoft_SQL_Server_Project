-- MAX FUNCTION: Find County with MAXIMUM Quantity of Citizens, Along Customers

WITH First_CTE AS
(
SELECT 
	Country,
	COUNT(CustomerID) AS Quantity
FROM Customers
GROUP BY Country
)

SELECT 
	Country,
	Quantity
FROM First_CTE
WHERE Quantity IN (SELECT MAX(Quantity) FROM First_CTE);
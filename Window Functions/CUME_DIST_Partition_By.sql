-- Find Cumulative distribution of Completed orders through employers and OrderYears:

WITH First_CTE AS
(
	SELECT
		e.FirstName +' '+ e.LastName AS FullName,
		YEAR(o.OrderDate) AS OrderYear,
		COUNT(o.OrderID) AS Quantity
	FROM Employees AS e
		LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	GROUP BY e.FirstName +' '+ e.LastName, YEAR(o.OrderDate)
)
SELECT 
	FullName,
	CAST(ROUND(CUME_DIST() OVER(PARTITION BY OrderYear ORDER BY FullName ASC), 2) AS VARCHAR(MAX))+' '+'%' AS Cumulative_Distribution,
	OrderYear
FROM First_CTE;
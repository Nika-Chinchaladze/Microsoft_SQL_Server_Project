-- Find cumulative distribution of orders through Customers During 1997 year:

SELECT
	c.CustomerName,
	CAST(ROUND(CUME_DIST() OVER (ORDER BY c.CustomerName ASC), 2) AS VARCHAR(MAX)) +' '+ '%' AS Cumulative_Distribution
FROM Customers as c 
	LEFT JOIN Orders AS o ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 1997;
/*
Query should generate a single result with the aggregates for all grouping combination:
*/

SELECT 
	ProductID,
	OrderID,
	SUM(Quantity) AS Sum_Quantity
FROM OrderDetails
GROUP BY
	GROUPING SETS(
		(ProductID, OrderID),
		(ProductID),
		(OrderID),
		()
	)
ORDER BY ProductID ASC, OrderID ASC;
/*
Query should generate a single result with the aggregates for all grouping combination:
Also Query should show if specified column is aggregated or not.
*/

SELECT
	GROUPING(ProductID) AS ProductID_Grouping,
	GROUPING(OrderID) AS OrderID_Grouping,
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
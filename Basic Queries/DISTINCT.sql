/*
Query should return unique orderid-s, where quantity is 12 or 15,
results should be ordered by orderid in ascending order
*/

SELECT	DISTINCT
		o.OrderID,
		o.Quantity
FROM OrderDetails as o
WHERE o.Quantity IN (12, 15)
ORDER BY o.OrderID asc;
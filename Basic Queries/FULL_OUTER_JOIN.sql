/*
Query return data from both tables, like SUM of RIGHT and LEFT JOIN.
*/

SELECT 
	p.ProductID,
	p.ProductName,
	d.OrderID,
	d.Quantity
FROM Products AS p
	FULL JOIN OrderDetails AS d ON d.ProductID = p.ProductID
WHERE p.ProductID IN (75, 76, 77, 78, 79, 80)
ORDER BY p.ProductID ASC;
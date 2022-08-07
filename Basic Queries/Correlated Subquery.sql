/*
Query should return productname, price and categoryid from products table:
Prices should be as maximum prices through each categoryID.
*/

SELECT
	ProductName,
	Price,
	CategoryID
FROM Products AS p1
WHERE Price IN (
				SELECT MAX(Price) FROM Products AS p2
				WHERE p2.CategoryID = p1.CategoryID
				GROUP BY p2.CategoryID
			   )
ORDER BY Price ASC, CategoryID ASC;



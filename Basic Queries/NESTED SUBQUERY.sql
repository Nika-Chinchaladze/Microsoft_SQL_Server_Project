/*
Query should return productname and price from products table:
Productnames should begin with characters from M to Z,
prices should be more than average price of products 
which are placed in categories, which categoryname's first letter is
between A and E characters.
*/

SELECT 
	ProductName,
	Price
FROM Products
WHERE Price > (
				SELECT
					AVG(price)
			    FROM Products
				WHERE CategoryID IN (
									SELECT CategoryID FROM Categories
									WHERE CategoryName LIKE '[A-E]%'
									)
			  )
		AND ProductName LIKE '[M-Z]%'
ORDER BY Price ASC;

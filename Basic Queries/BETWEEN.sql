/*
Query should return columns from Products: productname, supplierid, categoryid,
unit, price. supplierid should be in (1, 5, 15 or 28) or categoryid 
should be equal to 7. price should be between 10 and 30,
results should be ordered by price in ascending order and by supplierid 
in descending order.
*/

SELECT	
	ProductName,
	SupplierID,
	CategoryID,
	Unit,
	Price
FROM Products
WHERE Price BETWEEN 10 AND 30 
	    AND (SupplierID IN(1, 5, 15, 28) OR CategoryID = 7)
ORDER BY Price asc,
		 SupplierID desc;
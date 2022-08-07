/*
Query should return countries and cities, use customers and suppliers
tables.
*/

SELECT	
	Country,
	City
FROM Customers
	UNION
SELECT	
	Country,
	City
FROM Suppliers
ORDER BY Country asc,
		 City desc;
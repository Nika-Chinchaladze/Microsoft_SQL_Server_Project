/*
Query should return SupplierNames, Who live in the same country.
*/

SELECT	
	s.SupplierName,
	c.SupplierName,
	s.Country
FROM Suppliers AS s, Suppliers AS c
WHERE s.SupplierID <> c.SupplierID AND s.Country = c.Country
ORDER BY s.SupplierName asc;
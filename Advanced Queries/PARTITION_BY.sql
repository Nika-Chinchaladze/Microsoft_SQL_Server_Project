/*
Query Should return productname, suppliername, sum, average, max and min of whole realization 
Cash through suppliernames.
Use Common Table Expression and show only Unique Results. 
*/

WITH CTE AS
  (
SELECT  
	p.ProductName,
	s.SupplierName,
	SUM(d.Quantity*p.Price) OVER (PARTITION BY s.SupplierName ORDER BY s.SupplierName) AS Amounts,
	AVG(d.Quantity*p.Price) OVER (PARTITION BY s.SupplierName ORDER BY s.SupplierName) AS Average,
	MAX(p.Price) OVER (PARTITION BY s.SupplierName ORDER BY s.SupplierName) AS Max_Price,
	MIN(p.Price) OVER (PARTITION BY s.SupplierName ORDER BY s.SupplierName) AS Min_Price
FROM OrderDetails AS d
	INNER JOIN Products AS p ON p.ProductID = d.ProductID
	INNER JOIN Suppliers AS s ON s.SupplierID = p.SupplierID
  )

SELECT DISTINCT * 
FROM CTE AS c;
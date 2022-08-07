SELECT
	e.FirstName +' '+ e.LastName AS Full_Name,
	o.OrderID,
	s.ShipperID,
	IIF(
		s.ShipperID = 1, 
		'Speedy Express', 
		IIF(s.ShipperID = 2, 'United Package', 'Federal Shipping')
	   ) AS Shipper_Name
FROM Employees AS e
	INNER JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	INNER JOIN Shippers AS s ON s.ShipperID = o.ShipperID
ORDER BY Full_Name ASC, s.ShipperID ASC;


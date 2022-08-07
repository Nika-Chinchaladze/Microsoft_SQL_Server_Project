SELECT 
	ShipperName,
	RIGHT(ShipperName, LEN(ShipperName) - CHARINDEX(' ', ShipperName)) AS String_After_Space
FROM Shippers;
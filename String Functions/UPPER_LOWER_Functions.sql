DECLARE @UP_CHINCHO TABLE(
	Names VARCHAR(200),
	Countries VARCHAR(200)
);

DECLARE @DOWN_CHINCHO TABLE(
	Names VARCHAR(200),
	Countries VARCHAR(200)
);
----------------------------------------------
INSERT INTO @UP_CHINCHO
SELECT 
	UPPER(SupplierName) AS UP_SupplierNames,
	UPPER(Country) AS Up_Countries
FROM Suppliers
WHERE SupplierID <= 5;
----------------------------------------------
INSERT INTO @DOWN_CHINCHO
SELECT 
	LOWER(SupplierName) AS down_SupplierNames,
	LOWER(Country) AS down_Countries
FROM Suppliers
WHERE SupplierID <= 5;
----------------------------------------------
SELECT * FROM @UP_CHINCHO;
SELECT * FROM @DOWN_CHINCHO;
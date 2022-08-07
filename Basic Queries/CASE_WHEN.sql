/*
Query should return productname and unit from Products table,
also extra column named as UnitType.
conditions:
if unit contains bags then UnitType = bags,
if unit contains bottles then UnitType = bottles,
if unit contains jars then UnitType = jars,
if unit contains pkgs then UnitType = pkgs,
if unit contains boxes then UnitType = boxes,
if unit contains parcels then UnitType = parcels,
if unit contains none of them then UnitType = other,
*/

SELECT	
	ProductName,
	Unit,
	CASE
		WHEN Unit LIKE '%bags%' THEN 'bags'
		WHEN Unit LIKE '%bottles%' THEN 'bottles'
		WHEN Unit LIKE '%jars%' THEN 'jars'
		WHEN Unit LIKE '%pkgs%' THEN 'pkgs'
		WHEN Unit LIKE '%boxes%' THEN 'boxes'
		WHEN Unit LIKE '%parcels%' THEN 'parcels'
		ELSE 'other'
	END AS UnitType
FROM Products;
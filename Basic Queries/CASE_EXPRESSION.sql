/*
Query should return products quantity in each category, in results must be CategoryNames but don't use categories table.
*/

SELECT
	CASE
		WHEN CategoryID = 1 THEN 'Beverages'
		WHEN CategoryID = 2 THEN 'Condiments'
		WHEN CategoryID = 3 THEN 'Confections'
		WHEN CategoryID = 4 THEN 'Dairy'
		WHEN CategoryID = 5 THEN 'Grains/Cereals'
		WHEN CategoryID = 6 THEN 'Meat/Poultry'
		WHEN CategoryID = 7 THEN 'Produce'
		WHEN CategoryID = 8 THEN 'Seafood'
		ELSE 'Other'
	END AS Category_Name,
	COUNT(*) AS Quantity
FROM Products
GROUP BY CategoryID;
/*
Query should return Products quantity in each Category, in results must be CategoryNames but don't use categories table.
There should be only one row and column quantity should be depended on CategoryNames.
*/

SELECT 
	SUM(CASE WHEN CategoryID = 1 THEN 1 ELSE 0 END) AS 'Beverages',
	SUM(CASE WHEN CategoryID = 2 THEN 1 ELSE 0 END) AS 'Condiments',
	SUM(CASE WHEN CategoryID = 3 THEN 1 ELSE 0 END) AS 'Confections',
	SUM(CASE WHEN CategoryID = 4 THEN 1 ELSE 0 END) AS 'Dairy',
	SUM(CASE WHEN CategoryID = 5 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
	SUM(CASE WHEN CategoryID = 6 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
	SUM(CASE WHEN CategoryID = 7 THEN 1 ELSE 0 END) AS 'Produce',
	SUM(CASE WHEN CategoryID = 8 THEN 1 ELSE 0 END) AS 'Seafood'
FROM Products;
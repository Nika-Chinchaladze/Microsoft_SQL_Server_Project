DECLARE @Columns NVARCHAR(MAX) = '', @Sql NVARCHAR(MAX) = '';

SELECT 
	@Columns += QUOTENAME(CategoryName) + ','
FROM Categories
ORDER BY CategoryName ASC;

SET @Columns = LEFT(@Columns, LEN(@Columns)-1);
SET @Sql =' 
SELECT * FROM
(
	SELECT
		c.CategoryName,
		p.ProductID
	FROM Products AS p
		INNER JOIN Categories AS c ON c.CategoryID = p.CategoryID
) a
PIVOT
(
	COUNT(a.productID) 
	FOR a.CategoryName IN ('+ @Columns +')
) AS Pivot_Table;';

EXECUTE sp_executesql @Sql;
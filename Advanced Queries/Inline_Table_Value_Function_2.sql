/*
Create Table Valued Function, which should have one parameter -> CategoryName
and Function should return Countries, which are Main Suppliers of these Categories.
*/

CREATE FUNCTION dbo.F_Get_Country_through_Categories(
	@CategoryName NVARCHAR(150)
)
RETURNS TABLE
AS
RETURN
(
SELECT
	c.CategoryName,
	s.Country
FROM Suppliers AS s
	INNER JOIN Products AS p ON p.SupplierID = s.SupplierID
	INNER JOIN Categories AS c ON c.CategoryID = p.CategoryID
WHERE c.CategoryName = @CategoryName
);

-- SELECT * FROM dbo.F_Get_Country_through_Categories('Beverages');



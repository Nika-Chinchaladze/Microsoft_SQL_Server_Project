DECLARE @StringAGG TABLE(
	Row_Name VARCHAR(MAX)
);

DECLARE @StringSPLIT TABLE(
	Column_Name VARCHAR(MAX)
);
------------------------------------------------------------------------------------
INSERT INTO @StringAGG
SELECT 
	STRING_AGG(CategoryName, ', ') WITHIN GROUP (ORDER BY CategoryName ASC) AS Names
FROM Categories;
------------------------------------------------------------------------------------
WITH CHINCHO AS
(
SELECT 
	STRING_AGG(CategoryName, ', ') WITHIN GROUP (ORDER BY CategoryName ASC) AS Names
FROM Categories
)
INSERT INTO @StringSPLIT
SELECT
	value
FROM CHINCHO
	CROSS APPLY STRING_SPLIT(Names, ',');
------------------------------------------------------------------------------------
SELECT * FROM @StringAGG;
SELECT * FROM @StringSPLIT;



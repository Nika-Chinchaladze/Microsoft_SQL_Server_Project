-- PRINT CategoryNames as One Row, they should be in brackets and should be separated with commas;

DECLARE @CHINCHO TABLE(
	Names VARCHAR(MAX)
);
-----------------------------------------------------------------------
DECLARE @String AS VARCHAR(MAX) = '';
DECLARE @Row_Number AS INT;
SET @Row_Number = (SELECT COUNT(*) FROM Categories)
-----------------------------------------------------------------------
DECLARE @Counter AS INT = 1;
WHILE @Counter <= @Row_Number
BEGIN
	SET @String = @String +', '+
	(
	SELECT 
		QUOTENAME(CategoryName)
	FROM Categories
	WHERE CategoryID = @Counter
	);

	SET @Counter = @Counter + 1;
END;
-----------------------------------------------------------------------
SET @String = SUBSTRING(@String, 3, LEN(@String)-1);
-----------------------------------------------------------------------
INSERT INTO @CHINCHO VALUES(@String);
SELECT * FROM @CHINCHO;

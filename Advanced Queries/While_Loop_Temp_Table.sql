/*
Use While Loop to extract ProductID AND ProductNames from Products Table;
*/

-- The Same Temporary Table Creation Query should be EXECUTED only ones During the Session;
CREATE TABLE #Product_Names(
	ProductID INT,
	ProductName NVARCHAR(150)
)

/*
Query returns ProductID and ProductName, 
Number of Rows is depended on WHILE Loop.
*/

DECLARE @Counter INT = 1;

WHILE @Counter <= 10
BEGIN
	
	INSERT INTO #Product_Names
	SELECT
		ProductID,
		ProductName
	FROM Products
	WHERE ProductID = @Counter;

	SET @Counter = @Counter + 1;
END;

-- Extract results and Clean the Table content:
SELECT * FROM #Product_Names;
DELETE FROM #Product_Names;
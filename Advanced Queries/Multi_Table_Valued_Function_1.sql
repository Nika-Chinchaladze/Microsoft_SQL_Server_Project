/*
Create Multi-Statement table-valued function, which should extract information about
Employer's Current Age and Expert_Status defined by Current Age.
*/

CREATE FUNCTION F_Get_Employee_Age()
	RETURNS @Emp TABLE(
		Full_Name NVARCHAR(150),
		Age INT,
		Expert_Status NVARCHAR(150)
	)
AS
BEGIN
	DECLARE @YEAR INT = YEAR(GETDATE())
	INSERT INTO @Emp
	SELECT 
		FirstName +' '+ LastName AS Full_Name,
		@YEAR - YEAR(BirthDate) AS Age,
		CASE
			WHEN @YEAR - YEAR(BirthDate) <= 59 THEN 'Junior'
			WHEN @YEAR - YEAR(BirthDate) BETWEEN 60 AND 69 THEN 'Middle'
			WHEN @YEAR - YEAR(BirthDate) BETWEEN 70 AND 80 THEN 'Serior'
			ELSE 'Under Retired'
		END
	FROM EMPLOYEES;
	RETURN;
END;

/*
SELECT * FROM F_Get_Employee_Age()
ORDER BY Expert_Status ASC;
*/

-- DROP FUNCTION IF EXISTS F_Get_Employee_Age;
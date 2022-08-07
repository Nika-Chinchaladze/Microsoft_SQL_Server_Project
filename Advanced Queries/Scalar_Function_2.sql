/*
Scalar Function should return Birthdate of Employer,
Function should have two parameters: FirstName and LastName
*/

CREATE OR ALTER FUNCTION dbo.Get_Birthdate_Through_Employer(
		@FirstName nvarchar(max),
		@LastName nvarchar(max)
		)
RETURNS DATE
AS
BEGIN
	DECLARE @BirthDate DATE
		SELECT
			@BirthDate = BirthDate
		FROM Employees
		WHERE @FirstName = FirstName AND @LastName = LastName
	RETURN @Birthdate
END;


-- SELECT dbo.Get_Birthdate_Through_Employer('Laura', 'Callahan') AS BIRTH;

/*
SELECT
	FirstName +' '+ LastName AS Full_Name,
	dbo.Get_Birthdate_Through_Employer(FirstName, LastName) AS Birth_Date
FROM Employees;
*/

-- DROP FUNCTION dbo.Get_Birthdate_Through_Employer;

DECLARE @CHINCHO TABLE(
	Full_Name VARCHAR(200),
	BirthDate VARCHAR(200)
);

INSERT INTO @CHINCHO
SELECT
	FirstName +' '+ LastName,
	TRY_CONVERT(VARCHAR(200), BirthDate)
FROM Employees;

SELECT 
	Full_Name,
	TRY_PARSE(BirthDate AS DATE) AS Birth_Into_Date
FROM @CHINCHO;

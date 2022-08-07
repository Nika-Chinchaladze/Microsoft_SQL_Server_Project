WITH CHINCHO AS
(
	SELECT
		FirstName +' '+ LastName AS FullName,
		BirthDate
	FROM Employees
)
SELECT
	FullName,
	BirthDate,
	DATEADD(YEAR, 10, BirthDate) AS Ten_Years_Later,
	DATEADD(MONTH, 10, BirthDate) AS Ten_Months_Later,
	DATEADD(DAY, 10, BirthDate) AS Ten_Days_Later
FROM CHINCHO;
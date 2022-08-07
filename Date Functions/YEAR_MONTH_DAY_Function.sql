SELECT
	FirstName +' '+ LastName AS Full_Name,
	BirthDate,
	YEAR(BirthDate) AS Birth_Year,
	MONTH(BirthDate) AS Birth_Month,
	DAY(BirthDate) AS Birth_Day
FROM Employees;
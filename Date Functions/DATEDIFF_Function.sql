WITH CHINCHO AS
(
	SELECT
		FirstName +' '+ LastName AS Full_Name,
		BirthDate,
		GETDATE() AS CurrentDate
	FROM Employees
)
SELECT
	Full_Name,
	BirthDate,
	DATEDIFF(YEAR, BirthDate, CurrentDate) AS Age_In_Years,
	DATEDIFF(MONTH, BirthDate, CurrentDate) AS Age_In_Months,
	DATEDIFF(DAY, BirthDate, CurrentDate) AS Age_In_Days
FROM CHINCHO;
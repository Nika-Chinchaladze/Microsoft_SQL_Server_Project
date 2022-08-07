SELECT
	FirstName +' '+ LastName AS FullName,
	BirthDate,
	EOMONTH(BirthDate) as Last_Day_Of_Month,
	DAY(EOMONTH(BirthDate)) AS Days_Quantity,
	EOMONTH(BirthDate, 1) AS Following_Month
FROM Employees
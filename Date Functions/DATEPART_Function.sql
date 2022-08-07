SELECT
	FirstName +' '+ LastName AS FullName,
	BirthDate,
	DATEPART(YEAR, BirthDate) AS Extract_Year,
	DATEPART(QUARTER, BirthDate) AS Extract_Quarter,
	DATEPART(MONTH, BirthDate) AS Extract_Month,
	DATEPART(DAYOFYEAR, BirthDate) AS Extract_DayOfYear,
	DATEPART(DAY, BirthDate) AS Extract_Day,
	DATEPART(WEEK, BirthDate) AS Extract_Week,
	DATEPART(WEEKDAY, BirthDate) AS Extract_WeekDay
FROM Employees;
SELECT
	FirstName +' '+ LastName AS FullName,
	BirthDate,
	DATENAME(YEAR, BirthDate) AS Extract_Year,
	DATENAME(QUARTER, BirthDate) AS Extract_Quarter,
	DATENAME(MONTH, BirthDate) AS Extract_Month,
	DATENAME(DAYOFYEAR, BirthDate) AS Extract_DayOfYear,
	DATENAME(DAY, BirthDate) AS Extract_Day,
	DATENAME(WEEK, BirthDate) AS Extract_Week,
	DATENAME(WEEKDAY, BirthDate) AS Extract_WeekDay
FROM Employees;
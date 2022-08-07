-- Extract information about employer's birthdate, along with Current Dates:

SELECT 
	FirstName +' '+ LastName AS FullName,
	BirthDate,
	CURRENT_TIMESTAMP AS CurrentTimeStamp,
	GETUTCDATE() AS CurrentUtcDate,
	GETDATE() AS CurrentGetDate,
	SYSDATETIME() AS CurrentSysDateTime,
	SYSUTCDATETIME() AS CurrentUtcSysDateTime,
	SYSDATETIMEOFFSET() AS CurrentDateTimeOffset
FROM Employees;
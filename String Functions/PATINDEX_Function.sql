SELECT
	FirstName,
	LastName
FROM Employees
WHERE FirstName LIKE '%an%';

SELECT
	FirstName,
	PATINDEX('%an%', FirstName) AS Finds_With_Position,
	LastName
FROM Employees
WHERE PATINDEX('%an%', FirstName) > 0;
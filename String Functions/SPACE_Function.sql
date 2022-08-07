SELECT
	FirstName +' '+ LastName AS FullName_1,
	FirstName + SPACE(1) + LastName AS FullName_2,
	CONCAT(FirstName, ' ', LastName) AS FullName_3,
	CONCAT(FirstName, SPACE(1), LastName) AS FullName_4,
	CONCAT_WS(' ', FirstName, LastName) AS FullName_5,
	CONCAT_WS(SPACE(1), FirstName, LastName) AS FullName_6
FROM Employees;
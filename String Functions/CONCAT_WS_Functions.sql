-- USE HARD AND LONG WAY: Let's give Customer's Lastnames to Employers and Employer's Lastnames to Customers

WITH CHINCHO AS
(
SELECT
	CONCAT(e.FirstName, ' ', e.LastName) AS EmployerName,
	c.CustomerName
FROM Employees AS e
	INNER JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
),
LAZVI AS
(
SELECT
	EmployerName,
	CHARINDEX(' ', EmployerName, 1) AS Space_in_Emp,
	CustomerName,
	CHARINDEX(' ', CustomerName, 1) AS Space_in_Cust
FROM CHINCHO
),
LERI AS
(
SELECT 
	 EmployerName,
	 SUBSTRING(EmployerName, 1, Space_in_Emp) AS Emp_First_Name,
	 SUBSTRING(EmployerName, Space_in_Emp, LEN(EmployerName) - Space_in_Emp) AS Emp_Last_Name,
	 CustomerName,
	 SUBSTRING(CustomerName, 1, Space_in_Cust) AS Cust_First_Name,
	 SUBSTRING(CustomerName, Space_in_Cust, LEN(CustomerName) - Space_in_Cust) AS Cust_Last_Name
FROM LAZVI
)
SELECT
	CONCAT_WS(' ', Emp_First_Name, Cust_Last_Name) AS Emp_First_Cust_Second,
	CONCAT(Cust_First_Name, ' ', Emp_Last_Name) AS Cust_First_Emp_Second
FROM LERI
WHERE LEN(Emp_First_Name) > 0
	AND LEN(Emp_Last_Name) > 0
	AND LEN(Cust_First_Name) > 0
	AND LEN(Cust_Last_Name) > 0;

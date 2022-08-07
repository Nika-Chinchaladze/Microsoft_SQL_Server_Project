/*
select top 10 rows, where order_year is 1996 and employeeid <> 5,
results should be ordered by orderdate in descending order,
there must be only two columns: employeeid and orderdate
*/

SELECT	TOP 10
		EmployeeID,
		OrderDate
FROM Orders
WHERE OrderDate BETWEEN '1996-01-01' and '1996-12-31'
				AND NOT EmployeeID = 5
ORDER BY OrderDate desc;
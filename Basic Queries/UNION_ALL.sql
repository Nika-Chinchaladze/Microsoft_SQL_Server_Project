/*
Query shoul return FirstName and LastName from employees table, CustomerName from customers table and  ProductName
from products table, also Query should return extra column with Date data type, INCLUDING DUPLICATE Values.
*/

SELECT 
	FirstName +' '+ LastName AS Full_Name,
	BirthDate AS Just_Date
FROM Employees
UNION ALL
SELECT 
	c.CustomerName AS Full_Name,
	o.OrderDate AS Just_Date
FROM Orders AS o
	INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '1996-08-12' AND '1996-08-22'
UNION ALL
SELECT 
	p.ProductName AS Full_Name,
	s.OrderDate AS Just_Date
FROM ProductCost AS p
	INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
	INNER JOIN Orders AS s ON s.OrderID = d.OrderID
WHERE s.OrderDate BETWEEN '1996-08-12' AND '1996-08-14' AND p.ProductName <> 'Alice Mutton'
ORDER BY Just_Date ASC;


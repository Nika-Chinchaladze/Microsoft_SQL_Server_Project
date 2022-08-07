/*
If Declared Variable is more than 4, then query should return CustomerNames and LastOrderdates made by Customers in 1996 year,
If Declared Variable is equal to or less than 4, then query should return CustomerNames and FirstOrderdates made by Customers 
in 1997 year,
If Declared Variable is more than 8 or less than 1, then Query should return Warning Message that -> "Variable is out of range!"
*/

DECLARE @Category INT = 4;

IF @Category >  4
	BEGIN 

		IF @Category > 8 BEGIN PRINT 'CategoryID Is TOO HIGH - "Out Of Range" - Correct IT!' END
		ELSE
			BEGIN 
				(
				SELECT 
					c.CustomerName,
					MAX(o.OrderDate) AS Last_Order
				FROM Customers AS c
					INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
				WHERE YEAR(o.OrderDate) = 1996
				GROUP BY c.CustomerName
				)
			END
	END
ELSE 
	BEGIN 
		IF @Category < 1 BEGIN PRINT 'CategoryID Is TOO SMALL - "Out Of Range" - Correct IT!' END
		ELSE
			BEGIN
				(
				SELECT 
					c.CustomerName,
					MIN(o.OrderDate) AS First_Order
				FROM Customers AS c
					INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
				WHERE YEAR(o.OrderDate) = 1997
				GROUP BY c.CustomerName
				)
			END	  
	END;

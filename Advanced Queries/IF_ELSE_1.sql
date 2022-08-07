/*
If Products Sales Amounts is more than 10000 $ then Query should extract Names of Employers, Who has never completed Any order,
If Products Sales Amounts is less than 10000 $ then Query should extract information about Customers, Who has never Ordered Anything.
*/

BEGIN
	
	DECLARE @Amounts FLOAT;

	SELECT
		@Amounts = SUM(p.Price * d.Quantity)
	FROM Products AS p
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID;

	IF @Amounts > 10000 
	BEGIN 
		(
		SELECT 
			FirstName +' '+ LastName AS Full_Name
		FROM Employees AS e
			LEFT JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
		WHERE o.OrderID IS NULL
		) 
	END
	
	ELSE 
	BEGIN 
		(
		SELECT 
			c.CustomerName
		FROM Customers AS c
			LEFT JOIN Orders AS o ON o.CustomerID = c.CustomerID
		WHERE o.OrderID IS NULL
		) 
	END

END;

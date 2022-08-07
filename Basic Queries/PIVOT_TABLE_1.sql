/*
Query should return number of Saled Products in each Category though Order_Year.
*/

SELECT * FROM
(
	SELECT
		c.CategoryName,
		p.ProductID,
		YEAR(o.OrderDate) AS Order_Year
	FROM Products AS p
		INNER JOIN Categories AS c ON c.CategoryID = p.CategoryID
		INNER JOIN OrderDetails AS d ON d.ProductID = p.ProductID
		INNER JOIN Orders AS o ON o.OrderID = d.OrderID
) a
PIVOT
(
	COUNT(a.productID) 
	FOR a.CategoryName IN (
							[Produce], 
							[Meat/Poultry], 
							[Grains/Cereals], 
							[Dairy], 
							[Condiments], 
							[Seafood], 
							[Confections], 
							[Beverages]
						  )
) AS Pivot_Table;
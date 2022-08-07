/* 
INDEXED VIEW Should return Order_Quantity and Names of Products, which were bought by Customer 'Ernst Handel';
*/

CREATE VIEW BoughtByCustomer
WITH SCHEMABINDING
AS
SELECT
	p.ProductName,
	COUNT_BIG(*) AS Order_Quantity
FROM dbo.Customers AS c
	INNER JOIN dbo.Orders AS o ON o.CustomerID = c.CustomerID
	INNER JOIN dbo.OrderDetails AS d ON d.OrderID = o.OrderID
	INNER JOIN dbo.Products AS p ON p.ProductID = d.ProductID
WHERE c.CustomerName = 'Ernst Handel'
GROUP BY p.ProductName;


CREATE UNIQUE CLUSTERED INDEX Customer_Sales
ON dbo.BoughtByCustomer(ProductName);


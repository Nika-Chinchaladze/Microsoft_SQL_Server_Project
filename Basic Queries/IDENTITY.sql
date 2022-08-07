/*
You should create new table: CustomerSales, 
columns: id, orderdate, customername, productname, unit, quantity
id should be auto-incremented.
*/

CREATE TABLE CustomerSales
  (
	ID int IDENTITY(1,1) NOT NULL,
	OrderDate date NULL,
	CustomerName nvarchar(200) NOT NULL,
	ProductName nvarchar(200) NULL,
	Unit nvarchar(200) NULL, 
	Quantity float NULL
  );